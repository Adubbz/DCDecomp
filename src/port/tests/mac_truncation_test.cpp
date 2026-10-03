#include <cstdint>

#include "arena.hpp"
#include "menu_draw.hpp"
#include "platform/memory.hpp"
#include "test.hpp"
#include "texture.hpp"

namespace {

int g_image_object;

} // namespace

DC_TEST(mac_truncation_widen_near_recovers_the_window) {
    constexpr std::uintptr_t kGiB = std::uintptr_t{1} << 30;
    // Below 4 GiB, as Linux links it.
    DC_CHECK(WidenNear(0x400000, 0x00612340u) == 0x612340);
    DC_CHECK(WidenNear(0x400000, 0xF0000000u) == 0xF0000000u);
    // A PIE or Mach-O image high up, the object on either side of the anchor.
    std::uintptr_t anchor = 0x555555554000;
    DC_CHECK(WidenNear(anchor, static_cast<std::uint32_t>(anchor + 0x123456)) == anchor + 0x123456);
    DC_CHECK(WidenNear(anchor, static_cast<std::uint32_t>(anchor - 0x5000)) == anchor - 0x5000);
    // An image straddling a 4 GiB boundary.
    std::uintptr_t straddle = 0x7fff00000000 - 0x1000;
    DC_CHECK(WidenNear(straddle, static_cast<std::uint32_t>(straddle + 0x3000)) == straddle + 0x3000);
    DC_CHECK(WidenNear(straddle + 0x3000, static_cast<std::uint32_t>(straddle)) == straddle);
    DC_CHECK(WidenNear(0x100000000 + kGiB, 0x10u) == 0x100000010);
}

DC_TEST(mac_truncation_image_pointer_round_trips) {
    auto truncated = static_cast<std::int32_t>(reinterpret_cast<std::intptr_t>(&g_image_object));
    DC_CHECK(PortImagePointer(truncated) == &g_image_object);
    DC_CHECK(PortImagePointer(0) == nullptr);
    static const char literal[] = "image";
    DC_CHECK(PortImagePointer(static_cast<std::int32_t>(reinterpret_cast<std::intptr_t>(literal))) == literal);
}

DC_TEST(mac_truncation_menu_alignment_keeps_high_addresses) {
    auto *high = reinterpret_cast<u_long128 *>(std::uintptr_t{0x7f1234567810});
    DC_CHECK(reinterpret_cast<std::uintptr_t>(MenuCalcBufAlignment(high)) == 0x7f1234567840);
    auto *aligned = reinterpret_cast<u_long128 *>(std::uintptr_t{0x7f1234567840});
    DC_CHECK(MenuCalcBufAlignment(aligned) == aligned);
}

DC_TEST(mac_truncation_texture_buffer_in_high_memory) {
    ArenaMemorySetHigh(true);
    ArenaMemory memory = ArenaMemoryMap(1 << 20);
    auto       *buffer = reinterpret_cast<u_long128 *>(memory.base + 16);
    TexManager.SetBuffer(buffer, 1000);
    DC_CHECK(reinterpret_cast<std::uintptr_t>(TexManager.buffer) % 128 == 0);
    DC_CHECK(TexManager.buffer == buffer + 7);
    DC_CHECK(TexManager.buffer_size == 993);
    ArenaMemoryUnmap(memory);
}
