#include <sys/wait.h>

#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <sstream>
#include <string>

#include "exitcodes.hpp"
#include "test.hpp"

// darkcloud itself, run headless the way CI runs it, with its output captured. The executable sits
// beside darkcloud_tests in the build directory.

namespace fs = std::filesystem;

namespace {

struct Run {
    int         status = -1;
    std::string output;
};

fs::path Scratch(const char *name) {
    fs::path dir = fs::temp_directory_path() / (std::string("dc_smoke_") + name);
    fs::remove_all(dir);
    fs::create_directories(dir / "save");
    return dir;
}

Run RunDarkCloud(const fs::path &dir, const fs::path &data) {
    fs::path    executable = fs::read_symlink("/proc/self/exe").parent_path() / "darkcloud";
    fs::path    log = dir / "output.txt";
    std::string command = "'" + executable.string() + "' --headless --frames 3 --screenshot '" +
                          (dir / "smoke.png").string() + "' --data '" + data.string() + "' --save '" +
                          (dir / "save").string() + "' > '" + log.string() + "' 2>&1";
    Run run;
    int raw = std::system(command.c_str());
    run.status = WIFEXITED(raw) ? WEXITSTATUS(raw) : 128 + WTERMSIG(raw);
    std::ifstream     file(log);
    std::stringstream text;
    text << file.rdbuf();
    run.output = text.str();
    if (std::getenv("DC_SMOKE_VERBOSE") != nullptr) {
        std::fprintf(stderr, "status %d\n%s", run.status, run.output.c_str());
    }
    return run;
}

int Count(const std::string &text, const std::string &needle) {
    int count = 0;
    for (std::size_t at = text.find(needle); at != std::string::npos; at = text.find(needle, at + 1)) {
        ++count;
    }
    return count;
}

} // namespace

DC_TEST(integration_smoke_without_data) {
    fs::path dir = Scratch("no_data");
    fs::create_directories(dir / "data");
    Run run = RunDarkCloud(dir, dir / "data");
    DC_CHECK(run.status == kExitNoData);
    DC_CHECK(Count(run.output, "no game data: ") == 1);
    DC_CHECK(run.output.find((dir / "data").string() + " is empty") != std::string::npos);
    DC_CHECK(run.output.find("dcdata extract") != std::string::npos);
    DC_CHECK(!fs::exists(dir / "smoke.png"));

    run = RunDarkCloud(dir, dir / "missing");
    DC_CHECK(run.status == kExitNoData);
    DC_CHECK(run.output.find("is not a directory") != std::string::npos);
    fs::remove_all(dir);
}

// Any file satisfies InitCDFile's index; the game then boots, runs its warm-up and stops at the
// first asset it loads with LoadFile, the system messages, naming the file.
DC_TEST(integration_smoke_reaches_the_first_load) {
    fs::path dir = Scratch("first_load");
    fs::create_directories(dir / "data/unrelated");
    std::ofstream(dir / "data/unrelated/file.bin") << "x";
    Run run = RunDarkCloud(dir, dir / "data");
    DC_CHECK(run.status == kExitGameAssert);
    DC_CHECK(run.output.find("File open error \"meswin/systeme.bin\"") != std::string::npos);
    DC_CHECK(run.output.find("etc.cpp:753: assertion failed: FALSE") != std::string::npos);
    DC_CHECK(run.output.find("not implemented on PC") == std::string::npos);
    DC_CHECK(run.output.find("compiling shaders ") != std::string::npos);
    fs::remove_all(dir);
}
