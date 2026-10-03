#include <sys/wait.h>
#include <unistd.h>

#include <csignal>
#include <cstdint>
#include <cstring>

#include "arena.hpp"
#include "platform/memory.hpp"
#include "test.hpp"

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
    DC_CHECK((reinterpret_cast<std::uintptr_t>(memory.base) & 63) == 0);
    DC_CHECK(memory.capacity >= bytes && memory.capacity % 64 == 0);
    DC_CHECK(static_cast<std::size_t>(memory.base - memory.map) >= lead);
    DC_CHECK(ArenaMemoryGuard(memory) == memory.map + memory.map_size - ArenaMemoryPageSize());
    if (lead != 0) {
        memory.base[-static_cast<std::ptrdiff_t>(lead)] = 1;
    }
    memory.base[memory.capacity - 1] = 1;
}

} // namespace

DC_TEST(mac_arena_memory_maps_above_4gib) {
    for (std::size_t bytes : {std::size_t{0}, std::size_t{100}, std::size_t{96} << 20}) {
        ArenaMemory memory = ArenaMemoryMap(bytes, 0x180000);
        DC_CHECK(Above4GiB(memory.map));
        DC_CHECK(IsAbove4GiB(memory.base));
        CheckLayout(memory, bytes, 0x180000);
        ArenaMemoryUnmap(memory);
    }
}

DC_TEST(mac_arena_memory_guard_page_faults) {
    ArenaMemory memory = ArenaMemoryMap(4096 + 64);
    DC_CHECK(SignalOf([&] { memory.base[memory.capacity - 1] = 1; }) == 0);
    DC_CHECK(Faulted(SignalOf([&] { const_cast<unsigned char *>(ArenaMemoryGuard(memory))[0] = 1; })));
    ArenaMemoryZero(memory);
    DC_CHECK(Faulted(SignalOf([&] { memory.base[memory.capacity] = 1; })));
    ArenaMemoryZeroByRemap(memory);
    DC_CHECK(Faulted(SignalOf([&] { memory.base[memory.capacity] = 1; })));
    ArenaMemoryUnmap(memory);
}

DC_TEST(mac_arena_memory_zeroes_in_place) {
    for (auto zero : {&ArenaMemoryZero, &ArenaMemoryZeroByRemap}) {
        ArenaMemory    memory = ArenaMemoryMap(std::size_t{3} << 20, 0x10000);
        unsigned char *base = memory.base;
        std::size_t    usable = memory.map_size - ArenaMemoryPageSize();
        std::memset(memory.map, 0xA5, usable);
        zero(memory);
        DC_CHECK(memory.base == base);
        bool zeroed = true;
        for (std::size_t i = 0; i < usable; i++) {
            zeroed = zeroed && memory.map[i] == 0;
        }
        DC_CHECK(zeroed);
        memory.base[0] = 7;
        DC_CHECK(memory.base[0] == 7);
        ArenaMemoryUnmap(memory);
    }
}
