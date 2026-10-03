#include "memory.hpp"

#include <sys/mman.h>
#include <unistd.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>

namespace {

constexpr std::uintptr_t kHintStep = 16u << 20;
// The hints start above the first gigabyte, clear of a low-loaded image and its brk heap, and
// only then try below it.
constexpr std::uintptr_t kHintRanges[2][2] = {
    {0x40000000u, kLowMemoryLimit},
    {kHintStep,   0x40000000u    },
};

#ifdef MAP_NORESERVE
constexpr int kReserve = MAP_NORESERVE;
#else
constexpr int kReserve = 0;
#endif

bool AnywhereAllowed() {
    static const bool allowed = [] {
        const char *setting = std::getenv("DC_LOW_MEMORY");
        return setting != nullptr && std::strcmp(setting, "any") == 0;
    }();
    return allowed;
}

std::size_t RoundUp(std::size_t value, std::size_t to) { return (value + to - 1) / to * to; }

void *MapAt(std::uintptr_t hint, std::size_t size, int extra) {
    void *map = mmap(reinterpret_cast<void *>(hint), size, PROT_READ | PROT_WRITE,
                     MAP_PRIVATE | MAP_ANONYMOUS | kReserve | extra, -1, 0);
    return map == MAP_FAILED ? nullptr : map;
}

void *MapHinted(std::size_t size) {
    for (const auto &range : kHintRanges) {
        for (std::uintptr_t hint = range[0]; hint < range[1] && size <= kLowMemoryLimit - hint; hint += kHintStep) {
            void *map = MapAt(hint, size, 0);
            if (map == nullptr) {
                continue;
            }
            if (IsLowAddress(map, size)) {
                return map;
            }
            munmap(map, size);
        }
    }
    return nullptr;
}

void *MapNative(std::size_t size) {
#if defined(__linux__) && defined(MAP_32BIT)
    void *map = MapAt(0, size, MAP_32BIT);
    if (map != nullptr && !IsLowAddress(map, size)) {
        munmap(map, size);
        map = nullptr;
    }
    return map;
#else
    return MapHinted(size);
#endif
}

[[noreturn]] void Unmappable(std::size_t size) {
    std::fprintf(stderr, "low memory: cannot map %zu bytes below 2 GiB, where the game's int casts of its "
                         "pointers round-trip\n",
                 size);
#if defined(__APPLE__) && defined(__aarch64__)
    std::fprintf(stderr, "low memory: arm64 macOS reserves the low 4 GiB of every process as its hard page "
                         "zero; see docs/port/truncations.md (DC_LOW_MEMORY=any maps anywhere, for finding "
                         "the truncations)\n");
#endif
    std::abort();
}

void *MapAnywhere(std::size_t size) {
    static bool warned = false;
    if (!warned) {
        warned = true;
        std::fprintf(stderr, "low memory: DC_LOW_MEMORY=any, arenas may sit above 2 GiB and pointers the game "
                             "truncates will not survive\n");
    }
    void *map = MapAt(0, size, 0);
    if (map == nullptr) {
        std::fprintf(stderr, "low memory: cannot map %zu bytes\n", size);
        std::abort();
    }
    return map;
}

} // namespace

std::size_t LowMemoryPageSize() {
    static const std::size_t size = static_cast<std::size_t>(sysconf(_SC_PAGESIZE));
    return size;
}

bool LowMemoryEnforced() { return !AnywhereAllowed(); }

LowBlock LowMemoryMap(std::size_t bytes, std::size_t lead) {
    return LowMemoryMap(LowMemoryStrategy::Native, bytes, lead);
}

LowBlock LowMemoryMap(LowMemoryStrategy strategy, std::size_t bytes, std::size_t lead) {
    std::size_t page = LowMemoryPageSize();
    std::size_t capacity = RoundUp(bytes == 0 ? 64 : bytes, 64);
    std::size_t map_size = RoundUp(lead + capacity, page) + page;
    void       *map = strategy == LowMemoryStrategy::Native ? MapNative(map_size) : MapHinted(map_size);
    if (map == nullptr) {
        if (!AnywhereAllowed()) {
            Unmappable(map_size);
        }
        map = MapAnywhere(map_size);
    }
    auto *bytes_map = static_cast<unsigned char *>(map);
    mprotect(bytes_map + map_size - page, page, PROT_NONE);
    return {bytes_map, map_size, bytes_map + map_size - page - capacity, capacity, lead};
}

void LowMemoryZero(const LowBlock &block) {
#if defined(__linux__)
    LowMemoryZero(LowMemoryStrategy::Native, block);
#else
    LowMemoryZero(LowMemoryStrategy::Hinted, block);
#endif
}

void LowMemoryZero([[maybe_unused]] LowMemoryStrategy strategy, const LowBlock &block) {
    std::size_t usable = block.map_size - LowMemoryPageSize();
#if defined(__linux__)
    // Private anonymous pages read back as zero after MADV_DONTNEED; elsewhere it only hints.
    if (strategy == LowMemoryStrategy::Native) {
        madvise(block.map, usable, MADV_DONTNEED);
        return;
    }
#endif
    // macOS has no zeroing madvise: MADV_FREE_REUSABLE leaves the old bytes until the pager takes
    // the page, and a memset would commit every page of arenas sized at four times retail's. A
    // fresh mapping over the same range is zero and uncommitted, and keeps the address.
    if (MapAt(reinterpret_cast<std::uintptr_t>(block.map), usable, MAP_FIXED) != block.map) {
        std::fprintf(stderr, "low memory: cannot re-map %zu bytes at %p to zero them\n", usable,
                     static_cast<void *>(block.map));
        std::abort();
    }
}

const unsigned char *LowMemoryGuard(const LowBlock &block) { return block.base + block.capacity; }

void LowMemoryUnmap(LowBlock &block) {
    if (block.map != nullptr) {
        munmap(block.map, block.map_size);
    }
    block = {};
}
