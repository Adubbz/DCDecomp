#include <gtest/gtest.h>
#include <sys/wait.h>
#include <unistd.h>

#include <csignal>
#include <cstdint>
#include <cstring>

#include "arena.hpp"
#include "platform/memory.hpp"

namespace {

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

bool Above4GiB(const void *pointer) { return reinterpret_cast<std::uintptr_t>(pointer) >> 32 != 0; }

void CheckLayout(const ArenaMemory &memory, std::size_t bytes, std::size_t lead) {
    ASSERT_TRUE((reinterpret_cast<std::uintptr_t>(memory.base) & 63) == 0);
    ASSERT_TRUE(memory.capacity >= bytes && memory.capacity % 64 == 0);
    ASSERT_TRUE(static_cast<std::size_t>(memory.base - memory.map) >= lead);
    ASSERT_TRUE(ArenaMemoryGuard(memory) == memory.map + memory.map_size - ArenaMemoryPageSize());
    if (lead != 0) {
        memory.base[-static_cast<std::ptrdiff_t>(lead)] = 1;
    }
    memory.base[memory.capacity - 1] = 1;
}

} // namespace

TEST(MacArenaMemory, MapsAbove4gib) {
    for (std::size_t bytes : {std::size_t{0}, std::size_t{100}, std::size_t{96} << 20}) {
        ArenaMemory memory = ArenaMemoryMap(bytes, 0x180000);
        ASSERT_TRUE(Above4GiB(memory.map));
        ASSERT_TRUE(IsAbove4GiB(memory.base));
        CheckLayout(memory, bytes, 0x180000);
        ArenaMemoryUnmap(memory);
    }
}

TEST(MacArenaMemory, GuardPageFaults) {
    ArenaMemory memory = ArenaMemoryMap(4096 + 64);
    ASSERT_TRUE(SignalOf([&] { memory.base[memory.capacity - 1] = 1; }) == 0);
    ASSERT_TRUE(Faulted(SignalOf([&] { const_cast<unsigned char *>(ArenaMemoryGuard(memory))[0] = 1; })));
    ArenaMemoryZero(memory);
    ASSERT_TRUE(Faulted(SignalOf([&] { memory.base[memory.capacity] = 1; })));
    ArenaMemoryZeroByRemap(memory);
    ASSERT_TRUE(Faulted(SignalOf([&] { memory.base[memory.capacity] = 1; })));
    ArenaMemoryUnmap(memory);
}

TEST(MacArenaMemory, ZeroesInPlace) {
    for (auto zero : {&ArenaMemoryZero, &ArenaMemoryZeroByRemap}) {
        ArenaMemory    memory = ArenaMemoryMap(std::size_t{3} << 20, 0x10000);
        unsigned char *base = memory.base;
        std::size_t    usable = memory.map_size - ArenaMemoryPageSize();
        std::memset(memory.map, 0xA5, usable);
        zero(memory);
        ASSERT_TRUE(memory.base == base);
        bool zeroed = true;
        for (std::size_t i = 0; i < usable; i++) {
            zeroed = zeroed && memory.map[i] == 0;
        }
        ASSERT_TRUE(zeroed);
        memory.base[0] = 7;
        ASSERT_TRUE(memory.base[0] == 7);
        ArenaMemoryUnmap(memory);
    }
}
