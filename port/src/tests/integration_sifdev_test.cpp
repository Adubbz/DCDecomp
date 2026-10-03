#include <gtest/gtest.h>
#include <sifdev.h>

#include <cerrno>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <string>

#include "platform/paths.hpp"

namespace fs = std::filesystem;

namespace {

fs::path TempSave(const char *name) {
    fs::path dir = fs::temp_directory_path() / (std::string("dc_sifdev_") + name);
    fs::remove_all(dir);
    PathsSetSaveRoot(dir);
    return dir;
}

} // namespace

TEST(IntegrationSifdev, WritesAndReadsHost0) {
    fs::path dir = TempSave("round_trip");
    char     text[] = "debug font text";
    int      fd = sceOpen("host0:debug.txt", SCE_WRONLY | SCE_CREAT | SCE_TRUNC);
    ASSERT_TRUE(fd >= 0);
    ASSERT_TRUE(sceWrite(fd, text, sizeof text - 1) == static_cast<int>(sizeof text - 1));
    ASSERT_TRUE(sceClose(fd) == 0);
    ASSERT_TRUE(fs::file_size(dir / "host0/debug.txt") == sizeof text - 1);

    fd = sceOpen("host0:debug.txt", SCE_RDONLY);
    ASSERT_TRUE(fd >= 0);
    ASSERT_TRUE(sceLseek(fd, 0, SCE_SEEK_END) == static_cast<int>(sizeof text - 1));
    ASSERT_TRUE(sceLseek(fd, 6, SCE_SEEK_SET) == 6);
    char back[16] = {};
    ASSERT_TRUE(sceRead(fd, back, 4) == 4);
    ASSERT_TRUE(std::memcmp(back, "font", 4) == 0);
    ASSERT_TRUE(sceClose(fd) == 0);
    ASSERT_TRUE(sceClose(fd) == -EBADF);

    // Truncation, a device with a drive path, and backslashes.
    fd = sceOpen("host0:debug.txt", SCE_WRONLY | SCE_TRUNC);
    ASSERT_TRUE(fd >= 0 && sceClose(fd) == 0);
    ASSERT_TRUE(fs::file_size(dir / "host0/debug.txt") == 0);
    fd = sceOpen("host:c:\\dump\\shot.tga", SCE_WRONLY | SCE_CREAT | SCE_TRUNC);
    ASSERT_TRUE(fd >= 0 && sceClose(fd) == 0);
    ASSERT_TRUE(fs::is_regular_file(dir / "host0/dump/shot.tga"));
    fs::remove_all(dir);
}

TEST(IntegrationSifdev, RefusesWhatItCannotOpen) {
    fs::path dir = TempSave("errors");
    ASSERT_TRUE(sceOpen("host0:missing.bin", SCE_RDONLY) == -ENOENT);
    ASSERT_TRUE(sceOpen("host0:../escape.bin", SCE_WRONLY | SCE_CREAT) < 0);
    ASSERT_TRUE(sceOpen("host0:", SCE_RDONLY) < 0);
    ASSERT_TRUE(!fs::exists(dir.parent_path() / "escape.bin"));
    char byte = 0;
    ASSERT_TRUE(sceRead(12345, &byte, 1) == -EBADF);
    ASSERT_TRUE(sceWrite(12345, &byte, 1) == -EBADF);
    ASSERT_TRUE(sceLseek(12345, 0, SCE_SEEK_SET) == -EBADF);
    fs::remove_all(dir);
}
