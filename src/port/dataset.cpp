#include "dataset.hpp"

#include <sys/mman.h>
#include <unistd.h>

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <vector>

#include "arena.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "mglib.hpp"

namespace {

// InitWorkBuffer (editloop.cpp, edit_in.cpp) starts EdMenuBuffer this far
// before read_buffer, in what retail's carving leaves of the preceding arena.
constexpr std::size_t kReadBufferLead = 0x180000;

struct Block {
    const void    *owner;
    unsigned char *map;
    std::size_t    map_size;
    unsigned char *base;
    std::size_t    capacity;
    std::size_t    lead;
};

std::vector<Block> g_blocks;
// Blocks an owner outgrew stay mapped: retail's memory never went away, and a
// pointer the game kept into an old arena reads zeroes rather than faulting.
std::vector<Block> g_retired;

std::size_t PageSize() {
    static const std::size_t size = static_cast<std::size_t>(sysconf(_SC_PAGESIZE));
    return size;
}

std::size_t RoundUp(std::size_t value, std::size_t to) {
    return (value + to - 1) / to * to;
}

void Zero(const Block &block) {
    madvise(block.map, block.map_size - PageSize(), MADV_DONTNEED);
}

Block MapBlock(const void *owner, std::size_t bytes, std::size_t lead) {
    std::size_t page     = PageSize();
    std::size_t capacity = RoundUp(bytes == 0 ? 64 : bytes, 64);
    std::size_t map_size = RoundUp(lead + capacity, page) + page;
    void       *map = mmap(nullptr, map_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE | MAP_32BIT, -1, 0);
    if (map == MAP_FAILED) {
        std::fprintf(stderr, "arena: cannot map %zu bytes below 2 GiB\n", map_size);
        std::abort();
    }
    auto *bytes_map = static_cast<unsigned char *>(map);
    mprotect(bytes_map + map_size - page, page, PROT_NONE);
    return {owner, bytes_map, map_size, bytes_map + map_size - page - capacity, capacity, lead};
}

void Carve(CDataAlloc2<1> *arena, int quads) {
    arena->base  = ArenaBlock(arena, static_cast<std::size_t>(quads) * 16 * kArenaHeadroom);
    arena->limit = quads * kArenaHeadroom;
    arena->used  = 0;
}

void CarveWorkBuffer(int quads) {
    Carve(&workbuffer, quads);
    WorkBuffer = &workbuffer;
}

u_long128 *CarvePackets(int quads, int which) {
    static const char keys[2] = {};
    return reinterpret_cast<u_long128 *>(ArenaBlock(&keys[which], static_cast<std::size_t>(quads) * 16 * kArenaHeadroom));
}

void CarveReadBuffer(int quads) {
    read_buffer = reinterpret_cast<u_int *>(ArenaBlock(&read_buffer, static_cast<std::size_t>(quads) * 16 * kArenaHeadroom, kReadBufferLead));
}

} // namespace

unsigned char *ArenaBlock(const void *owner, std::size_t bytes, std::size_t lead) {
    for (Block &block : g_blocks) {
        if (block.owner != owner) {
            continue;
        }
        if (block.capacity >= bytes && block.lead >= lead) {
            return block.base;
        }
        Zero(block);
        g_retired.push_back(block);
        block = MapBlock(owner, bytes, lead);
        return block.base;
    }
    g_blocks.push_back(MapBlock(owner, bytes, lead));
    return g_blocks.back().base;
}

void ArenaClearAll() {
    for (const Block &block : g_blocks) {
        Zero(block);
    }
}

void ArenaOverflow(const void *arena, int used, int limit) {
    std::fprintf(stderr, "arena %p: allocation overflow, %d of %d quadwords\n", arena, used, limit);
    std::abort();
}

void InitializeDataBuffer() {
    ArenaClearAll();
    GlobalDataBuffer.used = 0;
    Carve(&WaterData, 10);
    Carve(&ActiveData0, 25000);
    Carve(&ActiveData1, 25000);
}

void SetDataBuffer(CDataAlloc2<1> *arena, int quads) {
    Carve(arena, quads);
}

void SetPacketReadBuffer(int packet_quads, int read_quads) {
    CarveReadBuffer(read_quads);
    MGInitVif1Packet(CarvePackets(packet_quads, 0), CarvePackets(packet_quads, 1));
    CarveWorkBuffer(2048);
}

void BufferAllClear() {
    ArenaClearAll();
    GlobalDataBuffer.used = 0;
    Carve(&VisualData, 600000);
    Carve(&MotionData, 200000);
    Carve(&TextureData, 300000);
    Carve(&WaterData, 90000);
    Carve(&ActiveData0, 25000);
    Carve(&ActiveData1, 25000);
    CarveReadBuffer(100000);
    CarveWorkBuffer(4096);
    MGInitVif1Packet(CarvePackets(50000, 0), CarvePackets(50000, 1));
}

// The renderer builds no VIF packets; nothing reads the packet builders.
void MGInitVif1Packet(u_long128 *buffer0, u_long128 *buffer1) {}
