#pragma once

#include <gtest/gtest.h>

#include <cstddef>
#include <vector>

#include "dataalloc.hpp"

namespace dc::test {

// An arena over the test's own storage, as SetDataBuffer carves one out of the game's.
struct Arena {
    std::vector<u_long128> storage;
    CDataAlloc2<1>         alloc;

    explicit Arena(int quads) : storage(static_cast<std::size_t>(quads)) {
        alloc.base = reinterpret_cast<u_char *>(storage.data());
        alloc.limit = quads;
        alloc.used = 0;
    }

    // Where the arena's next run starts.
    const u_char *Next() const { return alloc.base + alloc.used * 16; }
};

// The quadwords retail asks an arena for before it places an object in them.
inline u_long128 *RetailRun(Arena &arena, int quads) {
    return reinterpret_cast<u_long128 *>(arena.alloc.Alloc(quads));
}

// The byte one past an object, or past the last of count of them.
template <class T>
const u_char *End(const T *object, int count = 1) {
    return reinterpret_cast<const u_char *>(object + count);
}

} // namespace dc::test
