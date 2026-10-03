#include "paths.hpp"

#if defined(__APPLE__)
#include <mach-o/dyld.h>
#endif

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <optional>
#include <string>
#include <string_view>
#include <system_error>
#include <vector>

namespace fs = std::filesystem;

namespace {

std::optional<fs::path> data_override;
std::optional<fs::path> save_override;
std::optional<fs::path> data_root;
std::optional<fs::path> save_root;
fs::path                program;

fs::path ExecutableDirectory() { return PathsExecutable().parent_path(); }

std::optional<fs::path> FromEnvironment(const char *name) {
    const char *value = std::getenv(name);
    if (value && *value) {
        return fs::path(value);
    }
    return std::nullopt;
}

// The working directory first, so a checkout run from its root finds its own data/, then beside
// the executable, so an installed copy works from anywhere.
fs::path Default(const char *name) {
    std::error_code error;
    fs::path        here = fs::current_path(error) / name;
    if (fs::is_directory(here, error)) {
        return here;
    }
    fs::path executable = ExecutableDirectory();
    if (!executable.empty() && fs::is_directory(executable / name, error)) {
        return executable / name;
    }
    return here;
}

fs::path Absolute(const fs::path &path) {
    std::error_code error;
    fs::path        absolute = fs::absolute(path, error);
    return error ? path : absolute.lexically_normal();
}

} // namespace

fs::path PathsExecutable() {
    std::error_code error;
#if defined(__APPLE__)
    std::uint32_t size = 0;
    _NSGetExecutablePath(nullptr, &size);
    std::string path(size, '\0');
    if (_NSGetExecutablePath(path.data(), &size) == 0) {
        // The dyld path may run through symlinks and "..", as the process was started.
        if (char *real = realpath(path.c_str(), nullptr)) {
            fs::path resolved = real;
            std::free(real);
            return resolved;
        }
    }
#elif defined(__linux__)
    fs::path self = fs::read_symlink("/proc/self/exe", error);
    if (!error) {
        return self;
    }
#endif
    if (program.empty()) {
        return {};
    }
    fs::path absolute = fs::absolute(program, error);
    return error ? fs::path() : absolute;
}

int PathsConsumeArgs(int argc, const char **argv) {
    if (argc > 0 && argv[0]) {
        program = argv[0];
    }
    int kept = argc > 0 ? 1 : 0;
    for (int i = kept; i < argc; i++) {
        std::string_view         arg = argv[i];
        std::optional<fs::path> *target;
        std::string_view         flag;
        if (arg.starts_with("--data")) {
            target = &data_override;
            flag = "--data";
        } else if (arg.starts_with("--save")) {
            target = &save_override;
            flag = "--save";
        } else {
            argv[kept++] = argv[i];
            continue;
        }
        std::string_view rest = arg.substr(flag.size());
        if (rest.starts_with('=')) {
            *target = fs::path(rest.substr(1));
        } else if (rest.empty() && i + 1 < argc) {
            *target = fs::path(argv[++i]);
        } else if (rest.empty()) {
            std::fprintf(stderr, "%s needs a directory\n", argv[i]);
            std::exit(2);
        } else {
            argv[kept++] = argv[i];
            continue;
        }
        (target == &data_override ? data_root : save_root).reset();
    }
    if (kept < argc) {
        argv[kept] = nullptr;
    }
    return kept;
}

int PathsConsumeArgs(int argc, char **argv) {
    return PathsConsumeArgs(argc, const_cast<const char **>(argv));
}

void PathsSetDataRoot(const fs::path &root) {
    data_override = root;
    data_root.reset();
}

void PathsSetSaveRoot(const fs::path &root) {
    save_override = root;
    save_root.reset();
}

const fs::path &PathsDataRoot() {
    if (!data_root) {
        data_root = Absolute(data_override.value_or(FromEnvironment("DC_DATA").value_or(Default("data"))));
    }
    return *data_root;
}

const fs::path &PathsSaveRoot() {
    if (save_root) {
        return *save_root;
    }
    std::optional<fs::path> chosen = save_override ? save_override : FromEnvironment("DC_SAVE");
    std::vector<fs::path>   candidates{Absolute(chosen.value_or(Default("save")))};
    if (fs::path executable = ExecutableDirectory(); !chosen && !executable.empty()) {
        candidates.push_back(Absolute(executable / "save"));
    }
    std::error_code error;
    for (const fs::path &candidate : candidates) {
        if (fs::create_directories(candidate, error), !error) {
            return *(save_root = candidate);
        }
    }
    std::fprintf(stderr, "cannot create the save directory %s: %s\n", candidates[0].c_str(),
                 error.message().c_str());
    return *(save_root = candidates[0]);
}
