#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

#include <cstdlib>
#include <filesystem>
#include <format>
#include <fstream>
#include <sstream>
#include <string>

#include "exitcodes.hpp"
#include "platform/paths.hpp"
#include "test.hpp"

namespace fs = std::filesystem;

namespace {

// A data/ or save/ beside darkcloud_tests would win over XDG_DATA_HOME, as it should for a
// developer, so these cases cannot run in such a build directory.
void RequireNothingBesideExecutable() {
    fs::path beside = PathsExecutable().parent_path();
    if (fs::exists(beside / "data") || fs::exists(beside / "save")) {
        DC_SKIP("the build directory holds data/ or save/");
    }
}

// An empty working directory and nothing in the environment but XDG_DATA_HOME and HOME.
fs::path Isolate(const char *tag) {
    RequireNothingBesideExecutable();
    fs::path dir = fs::temp_directory_path() / std::format("dc_xdg_{}_{}", tag, getpid());
    fs::remove_all(dir);
    fs::create_directories(dir / "work");
    fs::current_path(dir / "work");
    unsetenv("DC_DATA");
    unsetenv("DC_SAVE");
    setenv("XDG_DATA_HOME", (dir / "xdg").c_str(), 1);
    setenv("HOME", (dir / "home").c_str(), 1);
    return dir;
}

void Leave(const fs::path &dir) {
    fs::current_path(fs::temp_directory_path());
    fs::remove_all(dir);
}

} // namespace

DC_TEST(paths_xdg_used_when_nothing_is_local) {
    fs::path dir = Isolate("default");
    DC_CHECK(PathsDataRoot() == dir / "xdg/chronicle/data");
    DC_CHECK(!fs::exists(dir / "xdg/chronicle/data"));
    DC_CHECK(PathsSaveRoot() == dir / "xdg/chronicle/save");
    DC_CHECK(fs::is_directory(dir / "xdg/chronicle/save"));
    DC_CHECK(!fs::exists(dir / "work/save"));
    Leave(dir);
}

DC_TEST(paths_xdg_falls_back_to_home) {
    fs::path dir = Isolate("home");
    unsetenv("XDG_DATA_HOME");
    DC_CHECK(PathsDataRoot() == dir / "home/.local/share/chronicle/data");
    DC_CHECK(PathsSaveRoot() == dir / "home/.local/share/chronicle/save");
    DC_CHECK(fs::is_directory(dir / "home/.local/share/chronicle/save"));
    Leave(dir);
}

DC_TEST(paths_xdg_ignores_a_relative_value) {
    fs::path dir = Isolate("relative");
    setenv("XDG_DATA_HOME", "relative", 1);
    DC_CHECK(PathsDataRoot() == dir / "home/.local/share/chronicle/data");
    DC_CHECK(!fs::exists(dir / "work/relative"));
    Leave(dir);
}

DC_TEST(paths_xdg_local_data_keeps_its_save_beside_it) {
    fs::path dir = Isolate("local");
    fs::create_directories(dir / "work/data");
    DC_CHECK(PathsDataRoot() == dir / "work/data");
    DC_CHECK(PathsSaveRoot() == dir / "work/save");
    DC_CHECK(fs::is_directory(dir / "work/save"));
    DC_CHECK(!fs::exists(dir / "xdg"));
    Leave(dir);
}

DC_TEST(paths_xdg_local_save_alone_wins) {
    fs::path dir = Isolate("local_save");
    fs::create_directories(dir / "work/save");
    DC_CHECK(PathsDataRoot() == dir / "xdg/chronicle/data");
    DC_CHECK(PathsSaveRoot() == dir / "work/save");
    DC_CHECK(!fs::exists(dir / "xdg/chronicle/save"));
    Leave(dir);
}

DC_TEST(paths_xdg_environment_and_flags_come_first) {
    fs::path dir = Isolate("override");
    setenv("DC_DATA", (dir / "env_data").c_str(), 1);
    setenv("DC_SAVE", (dir / "env_save").c_str(), 1);
    DC_CHECK(PathsDataRoot() == dir / "env_data");
    DC_CHECK(PathsSaveRoot() == dir / "env_save");
    DC_CHECK(!fs::exists(dir / "xdg"));
    Leave(dir);
}

// What a fresh Flatpak install sees on first launch: status 3 before any window, naming the XDG
// directory in the command that fills it.
DC_TEST(paths_xdg_darkcloud_names_the_directory_to_extract_to) {
    fs::path          dir = Isolate("run");
    fs::path          executable = PathsExecutable().parent_path() / "darkcloud";
    fs::path          log = dir / "output.txt";
    std::string       command = "'" + executable.string() + "' --headless --frames 1 > '" + log.string() + "' 2>&1";
    int               raw = std::system(command.c_str());
    int               status = WIFEXITED(raw) ? WEXITSTATUS(raw) : 128 + WTERMSIG(raw);
    std::stringstream text;
    text << std::ifstream(log).rdbuf();
    std::string data = (dir / "xdg/chronicle/data").string();
    DC_CHECK(status == kExitNoData);
    DC_CHECK(text.str().find("no game data: " + data + " is not a directory") != std::string::npos);
    DC_CHECK(text.str().find("`dcdata extract <disc image> " + data + "`") != std::string::npos);
    Leave(dir);
}
