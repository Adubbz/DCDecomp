#include <sys/wait.h>
#include <unistd.h>

#include <csignal>
#include <cstdint>
#include <cstring>

#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "platform/memory.hpp"
#include "test.hpp"

extern CDataAlloc<1, 6000> SystemMesBuffer;

namespace {

bool Aligned64(const void *pointer) {
    return (reinterpret_cast<std::uintptr_t>(pointer) & 63) == 0;
}

// Runs body in a child process and returns the signal that ended it, or 0.
template <class F>
int SignalOf(F body) {
    std::fflush(stdout);
    pid_t child = fork();
    if (child == 0) {
        body();
        std::_Exit(0);
    }
    int status = 0;
    waitpid(child, &status, 0);
    return WIFSIGNALED(status) ? WTERMSIG(status) : 0;
}

} // namespace

DC_TEST(platform_arena_carves_with_headroom) {
    InitializeDataBuffer();
    SetDataBuffer(&VisualData, 1000);
    DC_CHECK(Aligned64(VisualData.base));
    DC_CHECK(VisualData.limit == 4000);
    DC_CHECK(VisualData.used == 0);

    // Past what retail's 1000 quadwords would hold.
    u_char *first = VisualData.Alloc(1500);
    DC_CHECK(first == VisualData.base);
    std::memset(first, 0x5A, 1500 * 16);
    VisualData.Alloc(1);
    u_char *aligned = VisualData.Alloc64(1000);
    DC_CHECK(Aligned64(aligned));
    DC_CHECK(aligned == VisualData.base + 1504 * 16);
    std::memset(VisualData.base, 0x33, static_cast<std::size_t>(VisualData.limit) * 16);

    SetDataBuffer(&MotionData, 10);
    DC_CHECK(MotionData.base != VisualData.base);
    DC_CHECK(MotionData.limit == 40);
    DC_CHECK(Aligned64(MotionData.Alloc64(3)));
    DC_CHECK(Aligned64(MotionData.Alloc64(1)));
    DC_CHECK(MotionData.used == 5);
}

DC_TEST(platform_arena_reuses_and_zeroes) {
    InitializeDataBuffer();
    SetDataBuffer(&TextureData, 2000);
    u_char *base = TextureData.base;
    std::memset(base, 0xFF, 2000 * 16);
    InitializeDataBuffer();
    SetDataBuffer(&TextureData, 1000);
    DC_CHECK(TextureData.base == base);
    DC_CHECK(TextureData.limit == 4000);
    for (int i = 0; i < 2000 * 16; ++i) {
        DC_CHECK(base[i] == 0);
    }

    SetDataBuffer(&TextureData, 100000);
    DC_CHECK(TextureData.base != base);
    DC_CHECK(base[0] == 0);
    TextureData.base[100000 * 4 * 16 - 1] = 1;
}

DC_TEST(platform_arena_overflow_aborts) {
    InitializeDataBuffer();
    SetDataBuffer(&VisualData, 100);
    DC_CHECK(SignalOf([] { VisualData.Alloc(401); }) == SIGABRT);
    DC_CHECK(SignalOf([] { VisualData.Alloc64(400); }) == SIGABRT);
    DC_CHECK(SignalOf([] { VisualData.Alloc(400); }) == 0);
    // An overrun that skips the allocator runs into the guard page behind the block.
    int guard = SignalOf([] { VisualData.base[VisualData.limit * 16] = 1; });
    DC_CHECK(guard == SIGSEGV || guard == SIGBUS);
    DC_CHECK(SignalOf([] { SystemMesBuffer.Alloc(6001); }) == SIGABRT);
}

DC_TEST(platform_arena_mode_buffers) {
    BufferAllClear();
    DC_CHECK(VisualData.limit == 600000 * 4);
    DC_CHECK(ActiveData0.limit == 25000 * 4 && ActiveData1.limit == 25000 * 4);
    DC_CHECK(ActiveData0.base != ActiveData1.base);
    DC_CHECK(WorkBuffer == &workbuffer);
    DC_CHECK(workbuffer.limit == 4096 * 4);
    DC_CHECK(Aligned64(read_buffer));
    read_buffer[100000 * 4 * 4 - 1] = 1;

    InitializeDataBuffer();
    DC_CHECK(WaterData.limit == 40 && ActiveData0.limit == 100000);
    SetPacketReadBuffer(30000, 140000);
    DC_CHECK(workbuffer.limit == 2048 * 4 && workbuffer.used == 0);
    // EdMenuBuffer starts 0x180000 bytes before read_buffer (InitWorkBuffer).
    u_char *menu = reinterpret_cast<u_char *>(read_buffer) - 0x180000;
    std::memset(menu, 1, 0x3A2E0 * 16);

    u_char *global = GlobalDataBuffer.Alloc64(10);
    DC_CHECK(Aligned64(global));
    GlobalDataBuffer.Alloc(1);
    DC_CHECK(Aligned64(GlobalDataBuffer.Alloc64(1)));

    SystemMesBuffer.used = 1;
    SystemMesBuffer.Align64();
    DC_CHECK(Aligned64(&SystemMesBuffer.block[SystemMesBuffer.used]));
}
