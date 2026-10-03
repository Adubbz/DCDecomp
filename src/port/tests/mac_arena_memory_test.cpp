#include <sys/wait.h>
#include <unistd.h>

#include <csignal>
#include <cstdint>
#include <cstring>
#include <vector>

#include "arena.hpp"
#include "platform/memory.hpp"
#include "test.hpp"

// LowMemoryStrategy::Hinted is the macOS mapper; forcing it here runs that path on Linux.

namespace {

constexpr LowMemoryStrategy kStrategies[] = {LowMemoryStrategy::Native, LowMemoryStrategy::Hinted};

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

// Linux raises SIGSEGV for a PROT_NONE page, macOS SIGBUS.
bool Faulted(int signal) { return signal == SIGSEGV || signal == SIGBUS; }

bool Below(const void *pointer, std::size_t bytes, std::uintptr_t limit) {
    auto address = reinterpret_cast<std::uintptr_t>(pointer);
    return address < limit && bytes <= limit - address;
}

} // namespace

DC_TEST(mac_lowmemory_maps_below_2gib) {
    for (LowMemoryStrategy strategy : kStrategies) {
        for (std::size_t bytes : {std::size_t{0}, std::size_t{100}, std::size_t{1} << 20, std::size_t{96} << 20}) {
            LowBlock block = LowMemoryMap(strategy, bytes, 0x180000);
            DC_CHECK(Below(block.map, block.map_size, std::uintptr_t{1} << 32));
            DC_CHECK(Below(block.map, block.map_size, kLowMemoryLimit));
            DC_CHECK(IsLowAddress(block.map, block.map_size));
            DC_CHECK((reinterpret_cast<std::uintptr_t>(block.base) & 63) == 0);
            DC_CHECK(block.capacity >= bytes && block.capacity % 64 == 0);
            DC_CHECK(block.base - block.map >= 0x180000);
            DC_CHECK(LowMemoryGuard(block) == block.map + block.map_size - LowMemoryPageSize());
            block.base[-0x180000] = 1;
            block.base[block.capacity - 1] = 1;
            LowMemoryUnmap(block);
        }
    }
}

// The hints collide with blocks already there; the mapper must step past them.
DC_TEST(mac_lowmemory_hinted_retries_past_taken_ranges) {
    std::vector<LowBlock> blocks;
    for (int i = 0; i < 12; i++) {
        blocks.push_back(LowMemoryMap(LowMemoryStrategy::Hinted, std::size_t{40} << 20));
        DC_CHECK(IsLowAddress(blocks.back().map, blocks.back().map_size));
        for (std::size_t j = 0; j + 1 < blocks.size(); j++) {
            DC_CHECK(blocks.back().map + blocks.back().map_size <= blocks[j].map ||
                     blocks[j].map + blocks[j].map_size <= blocks.back().map);
        }
    }
    for (LowBlock &block : blocks) {
        LowMemoryUnmap(block);
    }
}

DC_TEST(mac_lowmemory_guard_page_faults) {
    for (LowMemoryStrategy strategy : kStrategies) {
        LowBlock block = LowMemoryMap(strategy, 4096 + 64);
        DC_CHECK(SignalOf([&] { block.base[block.capacity - 1] = 1; }) == 0);
        DC_CHECK(Faulted(SignalOf([&] { const_cast<unsigned char *>(LowMemoryGuard(block))[0] = 1; })));
        DC_CHECK(Faulted(SignalOf([&] { block.base[block.capacity] = 1; })));
        LowMemoryZero(strategy, block);
        DC_CHECK(Faulted(SignalOf([&] { block.base[block.capacity] = 1; })));
        LowMemoryUnmap(block);
    }
}

DC_TEST(mac_lowmemory_zeroes_in_place) {
    for (LowMemoryStrategy strategy : kStrategies) {
        LowBlock       block = LowMemoryMap(strategy, std::size_t{3} << 20, 0x10000);
        unsigned char *base = block.base;
        std::memset(block.map, 0xA5, block.map_size - LowMemoryPageSize());
        LowMemoryZero(strategy, block);
        DC_CHECK(block.base == base);
        bool zero = true;
        for (std::size_t i = 0; i < block.map_size - LowMemoryPageSize(); i++) {
            zero = zero && block.map[i] == 0;
        }
        DC_CHECK(zero);
        // Still writable after zeroing.
        block.base[0] = 7;
        DC_CHECK(block.base[0] == 7);
        LowMemoryUnmap(block);
    }
    LowBlock native = LowMemoryMap(std::size_t{1} << 20);
    native.base[10] = 9;
    LowMemoryZero(native);
    DC_CHECK(native.base[10] == 0);
    LowMemoryUnmap(native);
}

DC_TEST(mac_lowmemory_assert_low_catches_high_pointers) {
    DC_CHECK(LowMemoryEnforced());
    unsigned char *low = LowMemoryMap(64).base;
    DC_CHECK(SignalOf([&] { PortAssertLow(low, 64); }) == 0);
#ifndef NDEBUG
    auto *high = reinterpret_cast<const void *>(std::uintptr_t{0x7f0000000000});
    DC_CHECK(SignalOf([&] { PortAssertLow(high); }) == SIGABRT);
    DC_CHECK(SignalOf([&] { PortAssertLow(reinterpret_cast<const void *>(kLowMemoryLimit - 16), 32); }) ==
             SIGABRT);
#endif
}
