#include "dataalloc.hpp"

#include <cstdint>

#include "arena.hpp"

// Retail's arena methods with its arithmetic and its off-by-one checks kept;
// only the endless loop on overflow becomes an abort that names the arena.

namespace {

constexpr int kGlobalQuads = 1690000;

// GlobalDataBuffer's own block stays where the PS2 build put it; what it hands
// out comes from a host block with the same headroom as every other arena.
unsigned char *GlobalBlock() {
    return ArenaBlock(&GlobalDataBuffer, static_cast<std::size_t>(kGlobalQuads) * 16 * kArenaHeadroom);
}

int AlignedUsed(const unsigned char *start, int used) {
    std::uintptr_t slack = reinterpret_cast<std::uintptr_t>(start + used * 16) & 63;
    if (slack != 0) {
        used += static_cast<int>((64 - slack) >> 4);
    }
    return used;
}

} // namespace

u_char *CDataAlloc2<1>::Alloc(int quads) {
    if (used + quads > limit) {
        ArenaOverflow(this, used + quads, limit);
    }
    u_char *block = base + used * 16;
    used += quads;
    return block;
}

u_char *CDataAlloc2<1>::Alloc64(int quads) {
    Align64();
    u_char *block = base + used * 16;
    used += quads;
    if (used >= limit) {
        ArenaOverflow(this, used, limit);
    }
    return block;
}

void CDataAlloc2<1>::Align64() {
    used = AlignedUsed(base, used);
    if (used >= limit) {
        ArenaOverflow(this, used, limit);
    }
}

u_char *CDataAlloc<1, 1690000>::Alloc(int quads) {
    if (used + quads > kGlobalQuads * kArenaHeadroom) {
        ArenaOverflow(this, used + quads, kGlobalQuads * kArenaHeadroom);
    }
    u_char *allocation = GlobalBlock() + used * 16;
    used += quads;
    return allocation;
}

u_char *CDataAlloc<1, 1690000>::Alloc64(int quads) {
    Align64();
    u_char *allocation = GlobalBlock() + used * 16;
    used += quads;
    if (used >= kGlobalQuads * kArenaHeadroom) {
        ArenaOverflow(this, used, kGlobalQuads * kArenaHeadroom);
    }
    return allocation;
}

void CDataAlloc<1, 1690000>::Align64() {
    used = AlignedUsed(GlobalBlock(), used);
    if (used >= kGlobalQuads * kArenaHeadroom) {
        ArenaOverflow(this, used, kGlobalQuads * kArenaHeadroom);
    }
}

// SystemMesBuffer keeps its embedded storage: LoadSystemMessage points
// SystemMes at block[used] directly.
u_char *CDataAlloc<1, 6000>::Alloc(int quads) {
    if (used + quads > 6000) {
        ArenaOverflow(this, used + quads, 6000);
    }
    u_char *run = reinterpret_cast<u_char *>(block) + used * 16;
    used += quads;
    return run;
}

void CDataAlloc<1, 6000>::Align64() {
    used = AlignedUsed(reinterpret_cast<const unsigned char *>(block), used);
    if (used >= 6000) {
        ArenaOverflow(this, used, 6000);
    }
}
