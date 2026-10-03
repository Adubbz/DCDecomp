#include <gtest/gtest.h>

#include <cstdint>
#include <cstring>

#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "editloop.hpp"
#include "menu_draw.hpp"
#include "platform/memory.hpp"

void InitWorkBuffer();

namespace {

constexpr std::uintptr_t k4GiB = std::uintptr_t{1} << 32;

bool Above4GiB(const void *pointer) { return reinterpret_cast<std::uintptr_t>(pointer) >= k4GiB; }

bool Aligned64(const void *pointer) { return (reinterpret_cast<std::uintptr_t>(pointer) & 63) == 0; }

int g_image_object;

} // namespace

// The arenas are ordinary mappings, and the executable is position-independent: nothing the game
// points at sits where a 32-bit cast would keep it.
TEST(Bits64ArenasHigh, High) {
    BufferAllClear();
    ASSERT_TRUE(Above4GiB(VisualData.base));
    ASSERT_TRUE(Above4GiB(MotionData.base));
    ASSERT_TRUE(Above4GiB(TextureData.base));
    ASSERT_TRUE(Above4GiB(read_buffer));
    ASSERT_TRUE(Above4GiB(WorkBuffer->base));
    ASSERT_TRUE(Above4GiB(&g_image_object));
    ASSERT_TRUE(Above4GiB(reinterpret_cast<const void *>(&BufferAllClear)));

    ArenaMemory memory = ArenaMemoryMap(std::size_t{1} << 20);
    ASSERT_TRUE(Above4GiB(memory.base));
    ArenaMemoryUnmap(memory);
}

TEST(Bits64ArenasHigh, AlignmentHelpers) {
    BufferAllClear();
    VisualData.used = 0;
    VisualData.Alloc(3);
    u_char *aligned = VisualData.Alloc64(10);
    ASSERT_TRUE(Aligned64(aligned));
    ASSERT_TRUE(aligned == VisualData.base + 4 * 16);
    ASSERT_TRUE(Above4GiB(aligned));

    auto *menu = reinterpret_cast<u_long128 *>(VisualData.base + 16);
    ASSERT_TRUE(MenuCalcBufAlignment(menu) == reinterpret_cast<u_long128 *>(VisualData.base + 64));

    EdNPCBuffer.base = VisualData.base;
    EdNPCBuffer.limit = 1000;
    EdNPCBuffer.used = 5;
    InitWorkBuffer();
    ASSERT_TRUE(EdVillagerBuffer.base == VisualData.base + 5 * 16);
    ASSERT_TRUE(EdVillagerBuffer.limit == 995);
    ASSERT_TRUE(EdWorkBuffer.base == VisualData.base + 128);
    ASSERT_TRUE(Aligned64(EdWorkBuffer.base));
    ASSERT_TRUE(EdWorkBuffer.limit == 991);
    ASSERT_TRUE(EdMenuBuffer.base == reinterpret_cast<u_char *>(read_buffer) - 0x180000);
    std::memset(EdMenuBuffer.base, 0, 16);
}
