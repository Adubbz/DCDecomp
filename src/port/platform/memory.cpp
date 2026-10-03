#include "memory.hpp"

#include <sys/mman.h>
#include <unistd.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>

namespace {

#ifdef MAP_NORESERVE
constexpr int kReserve = MAP_NORESERVE;
#else
constexpr int kReserve = 0;
#endif

#if defined(__linux__) && defined(MAP_32BIT)
constexpr bool kCanMapLow = true;
#else
constexpr bool kCanMapLow = false;
#endif

int g_high = -1;

bool High() {
    if (g_high < 0) {
        const char *setting = std::getenv("DC_HIGH_ARENAS");
        g_high = !kCanMapLow || (setting != nullptr && *setting != '\0' && std::strcmp(setting, "0") != 0);
    }
    return g_high != 0;
}

std::size_t RoundUp(std::size_t value, std::size_t to) { return (value + to - 1) / to * to; }

void *Map(void *at, std::size_t size, int extra) {
    void *map = mmap(at, size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | kReserve | extra, -1, 0);
    return map == MAP_FAILED ? nullptr : map;
}

} // namespace

void ArenaMemorySetHigh(bool high) { g_high = high || !kCanMapLow; }

bool ArenaMemoryIsLow() { return !High(); }

std::size_t ArenaMemoryPageSize() {
    static const std::size_t size = static_cast<std::size_t>(sysconf(_SC_PAGESIZE));
    return size;
}

ArenaMemory ArenaMemoryMap(std::size_t bytes, std::size_t lead) {
    std::size_t page = ArenaMemoryPageSize();
    std::size_t capacity = RoundUp(bytes == 0 ? 64 : bytes, 64);
    std::size_t map_size = RoundUp(lead + capacity, page) + page;
    void       *map = nullptr;
#if defined(__linux__) && defined(MAP_32BIT)
    if (!High()) {
        map = Map(nullptr, map_size, MAP_32BIT);
        if (map == nullptr || !IsLowAddress(map, map_size)) {
            std::fprintf(stderr, "arena: cannot map %zu bytes below 2 GiB\n", map_size);
            std::abort();
        }
    }
#endif
    if (map == nullptr) {
        map = Map(nullptr, map_size, 0);
        if (map == nullptr) {
            std::fprintf(stderr, "arena: cannot map %zu bytes\n", map_size);
            std::abort();
        }
    }
    auto *bytes_map = static_cast<unsigned char *>(map);
    mprotect(bytes_map + map_size - page, page, PROT_NONE);
    return {bytes_map, map_size, bytes_map + map_size - page - capacity, capacity, lead};
}

void ArenaMemoryZero(const ArenaMemory &memory) {
#if defined(__linux__)
    // Private anonymous pages read back as zero after MADV_DONTNEED; elsewhere it only hints.
    madvise(memory.map, memory.map_size - ArenaMemoryPageSize(), MADV_DONTNEED);
#else
    ArenaMemoryZeroByRemap(memory);
#endif
}

// macOS has no zeroing madvise: MADV_FREE_REUSABLE leaves the old bytes until the pager takes the
// page, and a memset would commit every page of arenas sized at four times retail's. A fresh
// mapping over the same range is zero and uncommitted, and keeps the address.
void ArenaMemoryZeroByRemap(const ArenaMemory &memory) {
    std::size_t usable = memory.map_size - ArenaMemoryPageSize();
    if (Map(memory.map, usable, MAP_FIXED) != memory.map) {
        std::fprintf(stderr, "arena: cannot re-map %zu bytes at %p to zero them\n", usable,
                     static_cast<void *>(memory.map));
        std::abort();
    }
}

const unsigned char *ArenaMemoryGuard(const ArenaMemory &memory) { return memory.base + memory.capacity; }

void ArenaMemoryUnmap(ArenaMemory &memory) {
    if (memory.map != nullptr) {
        munmap(memory.map, memory.map_size);
    }
    memory = {};
}
