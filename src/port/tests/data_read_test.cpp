#include <signal.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

#include <cstring>
#include <string>

#include "../platform/paths.hpp"
#include "data_fixture.hpp"
#include "dataread.hpp"
#include "test.hpp"

using namespace datafix;

namespace {

constexpr unsigned char kUntouched = 0xEE;

alignas(64) unsigned char buffer[16384];

struct Mutable {
    std::string text;

    explicit Mutable(const char *s)
        : text(s) {}

    operator char *() {
        return text.data();
    }
};

// The standard disc mastered into an ISO, extracted with dcdata, and installed as the data root.
fs::path InstallStandardData(const char *tag) {
    fs::path dir = TempDir(tag);
    Disc     disc = StandardDisc();
    WriteBytes(dir / "disc.iso", MakeIso("DATA.DAT;1", disc.dat, "DATA.HD2;1", disc.hd2));
    dcdata::Extract(dcdata::OpenArchive(dir / "disc.iso"), dir / "data", nullptr);
    PathsSetDataRoot(dir / "data");
    PathsSetSaveRoot(dir / "save");
    InitCDFile();
    return dir;
}

u_long128 *Quads(void *data) {
    return static_cast<u_long128 *>(data);
}

void Clear() {
    std::memset(buffer, kUntouched, sizeof buffer);
}

bool Equals(const void *data, const Bytes &expected) {
    return std::memcmp(data, expected.data(), expected.size()) == 0;
}

bool AllAre(const unsigned char *from, const unsigned char *to, unsigned char value) {
    for (; from != to; from++) {
        if (*from != value) {
            return false;
        }
    }
    return true;
}

template <class F>
int AbortSignal(F f) {
    pid_t child = fork();
    if (child == 0) {
        f();
        _exit(0);
    }
    int status = 0;
    waitpid(child, &status, 0);
    return WIFSIGNALED(status) ? WTERMSIG(status) : 0;
}

} // namespace

DC_TEST(data_loadfile2_reads_exact_size_and_zero_fills) {
    fs::path dir = InstallStandardData("read_exact");
    Disc     disc = StandardDisc();
    int      size = -1;

    Clear();
    DC_CHECK(LoadFile2(Mutable("dun/pack/maindat.pac"), buffer, &size, 0) == 1);
    DC_CHECK(size == 5000);
    DC_CHECK(Equals(buffer, disc.files[0].data));
    DC_CHECK(AllAre(buffer + 5000, buffer + 3 * 2048, 0));
    DC_CHECK(buffer[3 * 2048] == kUntouched);

    Clear();
    DC_CHECK(LoadFile2(Mutable("img/title.img"), buffer, &size, 0) == 1);
    DC_CHECK(size == 2048 && Equals(buffer, disc.files[1].data) && buffer[2048] == kUntouched);

    Clear();
    DC_CHECK(LoadFile2(Mutable("sound/bgm/b01.snd"), buffer, &size, 0) == 1);
    DC_CHECK(size == 1 && buffer[0] == disc.files[2].data[0] && AllAre(buffer + 1, buffer + 2048, 0));

    Clear();
    DC_CHECK(LoadFile2(Mutable("empty.bin"), buffer, &size, 0) == 1);
    DC_CHECK(size == 0 && buffer[0] == kUntouched);

    Clear();
    DC_CHECK(LoadFile(Mutable("meswin/systeme.bin"), buffer, &size) == 1);
    DC_CHECK(size == 2047 && Equals(buffer, disc.files[4].data) && buffer[2047] == 0);
    fs::remove_all(dir);
}

DC_TEST(data_loadfile2_folds_case_and_devices) {
    fs::path dir = InstallStandardData("read_names");
    Disc     disc = StandardDisc();
    int      size = -1;

    const char *names[] = {"DUN/PACK/MainDat.PAC", "cdrom0:\\DUN\\PACK\\MAINDAT.PAC",
                           "host:dun/pack/maindat.pac",
                           "sim:/dun/pack/maindat.pac", "\\dun\\pack\\maindat.pac"};
    for (const char *name : names) {
        Clear();
        size = -1;
        DC_CHECK(LoadFile2(Mutable(name), buffer, &size, 0) == 1);
        DC_CHECK(size == 5000 && Equals(buffer, disc.files[0].data));
    }

    Clear();
    size = 123;
    DC_CHECK(LoadFile2(Mutable("dun/pack/missing.pac"), buffer, &size, 0) == 0);
    DC_CHECK(size == 0 && buffer[0] == kUntouched);
    DC_CHECK(LoadFile2(Mutable("dun/pack/missing.pac"), buffer, nullptr, 0) == 0);
    DC_CHECK(LoadFile2(Mutable("img/title.img"), buffer, nullptr, 0) == 1);
    fs::remove_all(dir);
}

DC_TEST(data_loadfile_missing_asserts) {
    fs::path dir = InstallStandardData("read_assert");
    int      size;
    DC_CHECK(AbortSignal([&] { LoadFile(Mutable("nothing/here.bin"), buffer, &size); }) == SIGABRT);
    fs::remove_all(dir);
}

DC_TEST(data_initcdfile_requires_data) {
    fs::path dir = TempDir("read_nodata");
    PathsSetDataRoot(dir / "data");
    DC_CHECK(AbortSignal([] { InitCDFile(); }) == SIGABRT);
    fs::create_directories(dir / "data/empty_dir");
    DC_CHECK(AbortSignal([] { InitCDFile(); }) == SIGABRT);
    WriteBytes(dir / "data/a.bin", Pattern(3, 0));
    DC_CHECK(AbortSignal([] { InitCDFile(); }) == 0);
    fs::remove_all(dir);
}

DC_TEST(data_loadfilebg_completes_synchronously) {
    fs::path dir = InstallStandardData("read_bg");
    Disc     disc = StandardDisc();
    int      size = -1;

    InitReadBG();
    DC_CHECK(ReadBGSync() == 0);
    DC_CHECK(GetReadBGFile(0) == nullptr);

    Clear();
    alignas(64) static unsigned char second[4096];
    DC_CHECK(LoadFileBG(Mutable("DUN/PACK/MAINDAT.PAC"), Quads(buffer), &size) == 1);
    DC_CHECK(size == 5000);
    DC_CHECK(LoadFileBG(Mutable("nope.bin"), Quads(second), &size) == 0);
    DC_CHECK(size == 0);
    DC_CHECK(LoadFileBG(Mutable("meswin/systeme.bin"), Quads(second), &size) == 1);
    DC_CHECK(size == 2047);
    ReadBG();
    DC_CHECK(ReadBGSync() == 0);

    BG_READ_INFO *first = GetReadBGFile(0);
    DC_CHECK(first && first->busy && first->id != 0 && first->done);
    DC_CHECK(first->buffer == Quads(buffer) && first->size == 5000 && first->sectors == 3);
    DC_CHECK(std::strcmp(first->name, "DUN/PACK/MAINDAT.PAC") == 0);
    DC_CHECK(Equals(buffer, disc.files[0].data) && AllAre(buffer + 5000, buffer + 6144, 0));
    BG_READ_INFO *next = GetReadBGFile(1);
    DC_CHECK(next && next->buffer == Quads(second) && next->size == 2047);
    DC_CHECK(Equals(second, disc.files[4].data) && second[2047] == 0);
    DC_CHECK(GetReadBGFile(2) == nullptr && GetReadBGFile(-1) == nullptr && GetReadBGFile(32) == nullptr);

    for (int i = 2; i < 32; i++) {
        DC_CHECK(LoadFileBG(Mutable("sound/bgm/b01.snd"), Quads(second), nullptr) == 1);
    }
    DC_CHECK(GetReadBGFile(31) != nullptr);
    DC_CHECK(LoadFileBG(Mutable("sound/bgm/b01.snd"), Quads(second), &size) == 0);
    DC_CHECK(size == 0);

    // A slot handed out but not yet complete is what keeps retail's spin loops waiting.
    GetReadBGFile(5)->done = 0;
    DC_CHECK(ReadBGSync() == 1);
    BreakReadBG();
    DC_CHECK(GetReadBGFile(0) == nullptr && GetReadBGFile(5) == nullptr);
    DC_CHECK(ReadBGSync() == 0);
    StartReadBG();
    DC_CHECK(LoadFileBG(Mutable("img/title.img"), Quads(buffer), &size) == 1);
    DC_CHECK(GetReadBGFile(0) && GetReadBGFile(0)->size == 2048);
    fs::remove_all(dir);
}

DC_TEST(data_pack_lookup_on_host) {
    fs::path dir = InstallStandardData("read_pack");
    File     pack = PackFile();
    int      size = -1;

    Clear();
    u_int *pack_data = reinterpret_cast<u_int *>(buffer);
    DC_CHECK(LoadPackFile(Mutable("RMDAT/RMDAT1.PAK"), pack_data, &size) == 1);
    DC_CHECK(size == static_cast<int>(pack.data.size()));

    u_int *model = GetPackFile(pack_data, Mutable("chara/MODEL.mds"), &size);
    DC_CHECK(model && size == 300 && Equals(model, Pattern(300, 2)));
    DC_CHECK(GetPackFile(Mutable("info.CFG"), &size) && size == 37);
    DC_CHECK(GetPackFile(pack_data, Mutable("absent.bin"), &size) == nullptr);

    char  *name = nullptr;
    u_int *tex = GetPackFile(pack_data, 2, &name, &size);
    DC_CHECK(tex && std::strcmp(name, "tex.img") == 0 && size == 64 && Equals(tex, Pattern(64, 3)));
    DC_CHECK(GetPackFile(pack_data, 4, &name, &size) == nullptr);

    u_int *files[8];
    int    sizes[8];
    char  *names[8];
    DC_CHECK(GetPackFileExt(pack_data, Mutable("img"), files, 8, sizes, names) == 2);
    DC_CHECK(files[0] == tex && sizes[1] == 5 && std::strcmp(names[1], "face.IMG") == 0);
    DC_CHECK(GetPackFileExt(pack_data, Mutable("IMG"), files, 1, nullptr, nullptr) == 1);

    DC_CHECK(LoadPackFile(Mutable("rmdat/none.pak"), pack_data, &size) == 0);
    DC_CHECK(GetPackFile(Mutable("info.cfg"), &size) == nullptr);
    fs::remove_all(dir);
}

DC_TEST(data_writefile_goes_to_save_host0) {
    fs::path dir = InstallStandardData("write");
    Bytes    data = Pattern(100, 7);

    DC_CHECK(WriteFile(Mutable("host0:y:/ps2/dc_data/gdata0.edt"), data.data(), 100) == 1);
    DC_CHECK(ReadBytes(dir / "save/host0/ps2/dc_data/gdata0.edt") == data);
    DC_CHECK(WriteFile(Mutable("host0:debug.txt"), data.data(), 10) == 1);
    DC_CHECK(fs::file_size(dir / "save/host0/debug.txt") == 10);
    DC_CHECK(WriteFile(Mutable("host0:../escape.txt"), data.data(), 10) == 0);
    DC_CHECK(!fs::exists(dir / "save/escape.txt"));
    fs::remove_all(dir);
}

DC_TEST(data_paths_from_arguments) {
    fs::path    dir = TempDir("paths_args");
    std::string data = (dir / "d").string();
    std::string save = "--save=" + (dir / "s").string();
    const char *argv[] = {"darkcloud", "--data", data.c_str(), "--frames",
                          "3", save.c_str(), "--database", nullptr};
    int         argc = PathsConsumeArgs(7, argv);
    DC_CHECK(argc == 4);
    DC_CHECK(std::strcmp(argv[0], "darkcloud") == 0 && std::strcmp(argv[1], "--frames") == 0);
    DC_CHECK(std::strcmp(argv[2], "3") == 0 && std::strcmp(argv[3], "--database") == 0 && argv[4] == nullptr);
    DC_CHECK(PathsDataRoot() == dir / "d");
    DC_CHECK(PathsSaveRoot() == dir / "s" && fs::is_directory(dir / "s"));
    fs::remove_all(dir);
}

DC_TEST(data_paths_from_environment) {
    fs::path dir = TempDir("paths_env");
    setenv("DC_DATA", (dir / "env_data").c_str(), 1);
    setenv("DC_SAVE", (dir / "env_save").c_str(), 1);
    DC_CHECK(PathsDataRoot() == dir / "env_data");
    DC_CHECK(PathsSaveRoot() == dir / "env_save" && fs::is_directory(dir / "env_save"));
    PathsSetDataRoot(dir / "flag");
    DC_CHECK(PathsDataRoot() == dir / "flag");
    fs::remove_all(dir);
}

DC_TEST(data_paths_default_to_working_directory) {
    fs::path dir = TempDir("paths_cwd");
    unsetenv("DC_DATA");
    unsetenv("DC_SAVE");
    fs::create_directories(dir / "data");
    fs::current_path(dir);
    DC_CHECK(PathsDataRoot() == dir / "data");
    DC_CHECK(PathsSaveRoot() == dir / "save" && fs::is_directory(dir / "save"));
    fs::current_path(fs::temp_directory_path());
    fs::remove_all(dir);
}
