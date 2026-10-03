#include <cstdint>
#include <cstring>

#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "editloop.hpp"
#include "menu_draw.hpp"
#include "platform/memory.hpp"
#include "test.hpp"

void InitWorkBuffer();

namespace {

constexpr std::uintptr_t k4GiB = std::uintptr_t{1} << 32;

bool Above4GiB(const void *pointer) { return reinterpret_cast<std::uintptr_t>(pointer) >= k4GiB; }

bool Aligned64(const void *pointer) { return (reinterpret_cast<std::uintptr_t>(pointer) & 63) == 0; }

int g_image_object;

} // namespace

// The arenas are ordinary mappings, and the executable is position-independent: nothing the game
// points at sits where a 32-bit cast would keep it.
DC_TEST(bits64_arenas_high) {
    BufferAllClear();
    DC_CHECK(Above4GiB(VisualData.base));
    DC_CHECK(Above4GiB(MotionData.base));
    DC_CHECK(Above4GiB(TextureData.base));
    DC_CHECK(Above4GiB(read_buffer));
    DC_CHECK(Above4GiB(WorkBuffer->base));
    DC_CHECK(Above4GiB(&g_image_object));
    DC_CHECK(Above4GiB(reinterpret_cast<const void *>(&BufferAllClear)));

    ArenaMemory memory = ArenaMemoryMap(std::size_t{1} << 20);
    DC_CHECK(Above4GiB(memory.base));
    ArenaMemoryUnmap(memory);
}

DC_TEST(bits64_arenas_high_alignment_helpers) {
    BufferAllClear();
    VisualData.used = 0;
    VisualData.Alloc(3);
    u_char *aligned = VisualData.Alloc64(10);
    DC_CHECK(Aligned64(aligned));
    DC_CHECK(aligned == VisualData.base + 4 * 16);
    DC_CHECK(Above4GiB(aligned));

    auto *menu = reinterpret_cast<u_long128 *>(VisualData.base + 16);
    DC_CHECK(MenuCalcBufAlignment(menu) == reinterpret_cast<u_long128 *>(VisualData.base + 64));

    EdNPCBuffer.base = VisualData.base;
    EdNPCBuffer.limit = 1000;
    EdNPCBuffer.used = 5;
    InitWorkBuffer();
    DC_CHECK(EdVillagerBuffer.base == VisualData.base + 5 * 16);
    DC_CHECK(EdVillagerBuffer.limit == 995);
    DC_CHECK(EdWorkBuffer.base == VisualData.base + 128);
    DC_CHECK(Aligned64(EdWorkBuffer.base));
    DC_CHECK(EdWorkBuffer.limit == 991);
    DC_CHECK(EdMenuBuffer.base == reinterpret_cast<u_char *>(read_buffer) - 0x180000);
    std::memset(EdMenuBuffer.base, 0, 16);
}
