#include <unistd.h>

#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <string>

#include "../platform/config.hpp"
#include "../platform/paths.hpp"
#include "test.hpp"

DC_TEST(platform_config_defaults) {
    Config config = ConfigParse("");
    DC_CHECK(config.tick_rate == 50.0);
    DC_CHECK(config.present_mode == ConfigPresentMode::Fifo);
    DC_CHECK(!config.fullscreen);
    DC_CHECK(config.master_volume == 1.0f);
    DC_CHECK(config.key_bindings.empty());
}

DC_TEST(platform_config_parses_ini) {
    Config config = ConfigParse("; comment\n"
                                "[game]\n"
                                "tick_rate = 59.94\n"
                                "[Video]\r\n"
                                "vsync = off\n"
                                "width = 1920\n"
                                "height=1080\n"
                                "fullscreen = yes\n"
                                "[audio]\n"
                                "master_volume = 1.5\n"
                                "[input]\n"
                                "cross = Space, Z\n"
                                "start=Return\n"
                                "[game]\n"
                                "tick_rate = -3\n"
                                "unknown = 1\n");
    DC_CHECK(config.tick_rate == 59.94);
    DC_CHECK(config.present_mode == ConfigPresentMode::Immediate);
    DC_CHECK(config.window_width == 1920 && config.window_height == 1080);
    DC_CHECK(config.fullscreen);
    DC_CHECK(config.master_volume == 1.0f);
    DC_CHECK(config.key_bindings.size() == 2);
    DC_CHECK(config.key_bindings[0].action == "cross");
    DC_CHECK(config.key_bindings[0].keys.size() == 2);
    DC_CHECK(config.key_bindings[0].keys[0] == "Space" && config.key_bindings[0].keys[1] == "Z");
    DC_CHECK(config.key_bindings[1].keys[0] == "Return");

    DC_CHECK(ConfigParse("[video]\npresent_mode = mailbox\n").present_mode == ConfigPresentMode::Mailbox);
}

DC_TEST(platform_config_loads_from_save_root) {
    std::filesystem::path root = std::filesystem::temp_directory_path() / ("dc_config_test_" + std::to_string(getpid()));
    std::filesystem::create_directories(root);
    PathsSetSaveRoot(root);
    DC_CHECK(PathsSaveRoot() == root);
    DC_CHECK(!ConfigLoad());
    std::ofstream(root / "config.ini") << "[game]\ntick_rate = 60\n";
    DC_CHECK(ConfigLoad());
    DC_CHECK(ConfigGet().tick_rate == 60.0);
    std::filesystem::remove_all(root);
}
