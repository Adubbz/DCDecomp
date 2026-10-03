#include <sifdev.h>

#include <cerrno>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <string>

#include "platform/paths.hpp"
#include "test.hpp"

namespace fs = std::filesystem;

namespace {

fs::path TempSave(const char *name) {
    fs::path dir = fs::temp_directory_path() / (std::string("dc_sifdev_") + name);
    fs::remove_all(dir);
    PathsSetSaveRoot(dir);
    return dir;
}

} // namespace

DC_TEST(integration_sifdev_writes_and_reads_host0) {
    fs::path dir = TempSave("round_trip");
    char     text[] = "debug font text";
    int      fd = sceOpen("host0:debug.txt", SCE_WRONLY | SCE_CREAT | SCE_TRUNC);
    DC_CHECK(fd >= 0);
    DC_CHECK(sceWrite(fd, text, sizeof text - 1) == static_cast<int>(sizeof text - 1));
    DC_CHECK(sceClose(fd) == 0);
    DC_CHECK(fs::file_size(dir / "host0/debug.txt") == sizeof text - 1);

    fd = sceOpen("host0:debug.txt", SCE_RDONLY);
    DC_CHECK(fd >= 0);
    DC_CHECK(sceLseek(fd, 0, SCE_SEEK_END) == static_cast<int>(sizeof text - 1));
    DC_CHECK(sceLseek(fd, 6, SCE_SEEK_SET) == 6);
    char back[16] = {};
    DC_CHECK(sceRead(fd, back, 4) == 4);
    DC_CHECK(std::memcmp(back, "font", 4) == 0);
    DC_CHECK(sceClose(fd) == 0);
    DC_CHECK(sceClose(fd) == -EBADF);

    // Truncation, a device with a drive path, and backslashes.
    fd = sceOpen("host0:debug.txt", SCE_WRONLY | SCE_TRUNC);
    DC_CHECK(fd >= 0 && sceClose(fd) == 0);
    DC_CHECK(fs::file_size(dir / "host0/debug.txt") == 0);
    fd = sceOpen("host:c:\\dump\\shot.tga", SCE_WRONLY | SCE_CREAT | SCE_TRUNC);
    DC_CHECK(fd >= 0 && sceClose(fd) == 0);
    DC_CHECK(fs::is_regular_file(dir / "host0/dump/shot.tga"));
    fs::remove_all(dir);
}

DC_TEST(integration_sifdev_refuses_what_it_cannot_open) {
    fs::path dir = TempSave("errors");
    DC_CHECK(sceOpen("host0:missing.bin", SCE_RDONLY) == -ENOENT);
    DC_CHECK(sceOpen("host0:../escape.bin", SCE_WRONLY | SCE_CREAT) < 0);
    DC_CHECK(sceOpen("host0:", SCE_RDONLY) < 0);
    DC_CHECK(!fs::exists(dir.parent_path() / "escape.bin"));
    char byte = 0;
    DC_CHECK(sceRead(12345, &byte, 1) == -EBADF);
    DC_CHECK(sceWrite(12345, &byte, 1) == -EBADF);
    DC_CHECK(sceLseek(12345, 0, SCE_SEEK_SET) == -EBADF);
    fs::remove_all(dir);
}
