#include <libmc.h>
#include <unistd.h>

#include <cstdlib>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <iterator>
#include <string>
#include <vector>

#include "memorycardaccess.hpp"
#include "savedata.hpp"
#include "test.hpp"

// Drives CMemoryCardAccess as the save menu does: SetFuncNo, then Step once
// per frame until the operation finishes, on a save root in a temporary
// directory.

namespace fs = std::filesystem;

namespace {

constexpr int         kImageSize = 0x136A7;
constexpr int         kSaveDataSize = 0x131C0;
constexpr int         kChecksumOffset = 0x131E0;
constexpr int         kSaveMapNoOffset = 0x1C8;
constexpr const char *kSaveDir = "BESCES-50295dkcloud";

// SetBuff and the game's int casts need the buffer below 2 GiB: static
// storage in the non-PIE executable is.
alignas(64) char g_menu_buffer[0x30000];
alignas(64) CSaveData g_save;
CMemoryCardAccess g_mc;
CMemoryCardAccess g_boot;
char              g_icons[3][100];

fs::path UseTempSaveRoot() {
    fs::path root = fs::temp_directory_path() / ("dc_mc_test_" + std::to_string(getpid()));
    fs::remove_all(root);
    fs::create_directories(root);
    setenv("DC_SAVE", root.c_str(), 1);
    return root;
}

int Run(CMemoryCardAccess &mc, int operation) {
    mc.SetFuncNo(operation);
    for (int frame = 0; frame < 1000; ++frame) {
        int result = mc.Step();
        if (result != 0) {
            return result;
        }
    }
    DC_CHECK(!"operation never finished");
    return 0;
}

std::vector<char> ReadFile(const fs::path &path) {
    std::ifstream file(path, std::ios::binary);
    return {std::istreambuf_iterator<char>(file), std::istreambuf_iterator<char>()};
}

s32 &MapNoOf(CSaveData &save) {
    return *reinterpret_cast<s32 *>(reinterpret_cast<char *>(&save) + kSaveMapNoOffset);
}

void PrepareSave() {
    g_save.Initialize();
    SaveData = &g_save;
    s16 *name = g_save.GetCharaName(0);
    for (int i = 0; i < 5; ++i) {
        name[i] = static_cast<s16>("Toan"[i]);
    }
    g_save.AddPlayTime(123456);
    g_save.QuestDungeon(0, 7);
    g_save.QuestDungeon(6, 3);
    MapNoOf(g_save) = 42;
}

void PrepareAccess(CMemoryCardAccess &mc) {
    DC_CHECK(mc.InitForMC() == 0);
    MC_ICON_DATA icon = {
        {"dkicon.ico",   g_icons[0], sizeof(g_icons[0])},
        {"dkicon_c.ico", g_icons[1], sizeof(g_icons[1])},
        {"dkicon_d.ico", g_icons[2], sizeof(g_icons[2])},
    };
    for (int i = 0; i < 3; ++i) {
        std::memset(g_icons[i], 'a' + i, sizeof(g_icons[i]));
    }
    mc.SetBuff(g_menu_buffer);
    mc.SetIconData(&icon);
    mc.MakeMcIconSysInfo();
}

} // namespace

DC_TEST(platform_mc_save_data_is_pod_sized) {
    DC_CHECK(sizeof(CSaveData) == kSaveDataSize);
}

DC_TEST(platform_mc_sync_reports_command_codes) {
    UseTempSaveRoot();
    int cmd = -1;
    int result = -1;
    DC_CHECK(sceMcInit() == sceMcIniSucceed);
    DC_CHECK(sceMcSync(MC_NOWAIT, &cmd, &result) == -1);

    int type = 0, free_size = 0, formatted = 0;
    DC_CHECK(sceMcGetInfo(0, 0, &type, &free_size, &formatted) == 0);
    DC_CHECK(sceMcSync(MC_NOWAIT, &cmd, &result) == 1);
    DC_CHECK(cmd == 1 && result == sceMcResSucceed);
    DC_CHECK(type == sceMcTypePS2 && formatted == 1 && free_size >= 0x190);
    DC_CHECK(sceMcSync(MC_NOWAIT, &cmd, &result) == -1);

    DC_CHECK(sceMcGetInfo(1, 0, &type, &free_size, &formatted) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1);
    DC_CHECK(cmd == 1 && result <= -10 && type == sceMcTypeNoCard);

    DC_CHECK(sceMcChdir(0, 0, (char *) "/nothing", nullptr) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1);
    DC_CHECK(cmd == 0xC && result == sceMcResNoEntry);

    DC_CHECK(sceMcMkdir(0, 0, (char *) "dir") == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0xB && result == 0);
    DC_CHECK(sceMcMkdir(0, 0, (char *) "dir") == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0xB && result < 0);

    char current[0x40] = "garbage";
    DC_CHECK(sceMcChdir(0, 0, (char *) "dir/", current) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0xC && result == 0);
    DC_CHECK(std::strcmp(current, "/") == 0);

    DC_CHECK(sceMcOpen(0, 0, (char *) "missing", 1) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 2 && result == sceMcResNoEntry);
    DC_CHECK(sceMcOpen(0, 0, (char *) "file", 0x203) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 2 && result >= 0);
    int  fd = result;
    char data[5] = "abcd";
    DC_CHECK(sceMcWrite(fd, data, 4) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 6 && result == 4);
    DC_CHECK(sceMcFlush(fd) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0xA && result == 0);
    DC_CHECK(sceMcClose(fd) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 3 && result == 0);

    DC_CHECK(sceMcOpen(0, 0, (char *) "/dir/file", 1) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && result >= 0);
    fd = result;
    char back[8] = {};
    DC_CHECK(sceMcRead(fd, back, 8) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 5 && result == 4);
    DC_CHECK(std::memcmp(back, "abcd", 4) == 0);
    DC_CHECK(sceMcWrite(fd, data, 4) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 6 && result == sceMcResDeniedPermit);
    DC_CHECK(sceMcClose(fd) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1);

    unsigned char table[4][0x40] = {};
    DC_CHECK(sceMcGetDir(0, 0, (char *) "*", 0, 4, table) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0xD && result == 3);
    DC_CHECK(std::strcmp(reinterpret_cast<char *>(table[0] + 0x20), ".") == 0);
    DC_CHECK(std::strcmp(reinterpret_cast<char *>(table[1] + 0x20), "..") == 0);
    DC_CHECK(std::strcmp(reinterpret_cast<char *>(table[2] + 0x20), "file") == 0);
    std::uint32_t size;
    std::memcpy(&size, table[2] + 0x10, 4);
    DC_CHECK(size == 4);
    std::uint16_t attributes;
    std::memcpy(&attributes, table[2] + 0x14, 2);
    DC_CHECK((attributes & 0x8010) == 0x8010);
    std::uint16_t year;
    std::memcpy(&year, table[2] + 0x0E, 2);
    DC_CHECK(year >= 2000);

    DC_CHECK(sceMcDelete(0, 0, (char *) "file") == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0xF && result == 0);
    DC_CHECK(sceMcDelete(0, 0, (char *) "file") == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0xF && result == sceMcResNoEntry);

    DC_CHECK(sceMcUnformat(0, 0) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0x11 && result == 0);
    DC_CHECK(sceMcGetInfo(0, 0, &type, &free_size, &formatted) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && result == sceMcResNoFormat && formatted == 0);
    DC_CHECK(sceMcFormat(0, 0) == 0);
    DC_CHECK(sceMcSync(MC_WAIT, &cmd, &result) == 1 && cmd == 0x10 && result == 0);
}

DC_TEST(platform_mc_save_load_cycle) {
    fs::path root = UseTempSaveRoot();
    PrepareSave();
    PrepareAccess(g_mc);

    DC_CHECK(Run(g_mc, MC_OPERATION_SEARCH_TYPE) == 1);
    DC_CHECK(g_mc.card[0].present == 1);
    DC_CHECK(g_mc.card[0].type == sceMcTypePS2);
    DC_CHECK(g_mc.card[0].formatted == 1);

    DC_CHECK(Run(g_mc, MC_OPERATION_GET_DIR) == 1);
    DC_CHECK(g_mc.card[0].dir_exists == 0);

    DC_CHECK(Run(g_mc, MC_OPERATION_MAKE_DIR) == 1);
    fs::path dir = root / "mc0" / kSaveDir;
    DC_CHECK(fs::file_size(dir / kSaveDir) == 0x40);
    DC_CHECK(ReadFile(dir / kSaveDir)[0x11] == 1);
    std::vector<char> icon_sys = ReadFile(dir / "icon.sys");
    DC_CHECK(icon_sys.size() == sizeof(sceMcIconSys));
    DC_CHECK(std::memcmp(icon_sys.data(), "PS2D", 4) == 0);
    DC_CHECK(ReadFile(dir / "dkicon_c.ico") == std::vector<char>(100, 'b'));

    g_mc.file_no = 3;
    DC_CHECK(Run(g_mc, MC_OPERATION_SAVE) == 1);
    std::vector<char> image = ReadFile(dir / "darkcloud3");
    DC_CHECK(image.size() == static_cast<std::size_t>(kImageSize));
    DC_CHECK(std::memcmp(image.data(), g_mc.save_buffer, kImageSize) == 0);
    DC_CHECK(std::strcmp(image.data() + kSaveDataSize, "darkcloudVer1.9") == 0);
    char total = 0;
    for (int i = 0; i < kSaveDataSize; ++i) {
        total = static_cast<char>(total + image[i]);
        if (i % 64 == 63) {
            DC_CHECK(image[kChecksumOffset + i / 64] == total);
            total = 0;
        }
    }
    DC_CHECK(ReadFile(dir / kSaveDir)[17] == 3);

    DC_CHECK(Run(g_mc, MC_OPERATION_GET_ALL_SAVE_FILE_INFO) == 1);
    for (int file = 0; file < MC_SAVE_FILE_MAX; ++file) {
        DC_CHECK(g_mc.file_info[file].state == (file == 3));
    }
    const SAVEDATA_INFO &info = g_mc.file_info[3];
    DC_CHECK(info.file_no == 4);
    DC_CHECK(info.map_no == 42);
    DC_CHECK(info.play_time == 123456.0f);
    DC_CHECK(info.quest_total == 10);
    DC_CHECK(std::memcmp(info.name, g_save.GetCharaName(0), 10) == 0);

    std::vector<char> expected(reinterpret_cast<char *>(g_mc.save_buffer), reinterpret_cast<char *>(g_mc.save_buffer) + kSaveDataSize);
    g_save.AddPlayTime(99);
    MapNoOf(g_save) = 7;
    g_mc.file_no = 3;
    DC_CHECK(Run(g_mc, MC_OPERATION_LOAD) == 1);
    reinterpret_cast<s32 *>(expected.data() + (static_cast<char *>(g_save.GetConfigData()) - reinterpret_cast<char *>(&g_save)))[17] = 3;
    DC_CHECK(std::memcmp(&g_save, expected.data(), kSaveDataSize) == 0);
    DC_CHECK(MapNoOf(g_save) == 42);

    // A flipped byte fails the checksum and leaves the save in memory alone.
    image[100] ^= 0x40;
    std::ofstream(dir / "darkcloud3", std::ios::binary).write(image.data(), image.size());
    MapNoOf(g_save) = 9;
    g_mc.file_no = 3;
    DC_CHECK(Run(g_mc, MC_OPERATION_LOAD) == -1);
    DC_CHECK(MapNoOf(g_save) == 9);

    // What InitExistData does at boot, on a fresh library state.
    CMemoryCardAccess &boot = g_boot;
    PrepareAccess(boot);
    DC_CHECK(Run(boot, MC_OPERATION_SEARCH_TYPE) == 1);
    DC_CHECK(Run(boot, MC_OPERATION_GET_DIR) == 1);
    DC_CHECK(boot.card[0].dir_exists == 1);
    DC_CHECK(boot.card[0].dir_entries == 1);
    DC_CHECK(std::strcmp(SaveFileInfo[0].name, "darkcloud3") == 0);
    DC_CHECK(GetOpenAttribute((char *) "darkcloud3") == 1);
    DC_CHECK(Run(boot, MC_OPERATION_LOAD_CONFIG) == 1);

    boot.file_no = 3;
    DC_CHECK(Run(boot, MC_OPERATION_DELETE) == 1);
    DC_CHECK(!fs::exists(dir / "darkcloud3"));

    boot.port = 1;
    DC_CHECK(Run(boot, MC_OPERATION_SEARCH_TYPE) == 1);
    DC_CHECK(boot.card[1].type == sceMcTypeNoCard);

    fs::remove_all(root);
}
