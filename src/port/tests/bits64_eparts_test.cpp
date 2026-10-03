#include <cstdint>
#include <cstring>
#include <vector>

#include "editpartsinfo.hpp"
#include "eparts_port.hpp"
#include "objanime.hpp"
#include "test.hpp"

int GetFuncPoint(int parts_no, u_int *archive, EPARTS_FUNC_DATA *points);
int EdInitToEPInfo(INIT_PARTSINFO *init, EPARTS_INFO_HEADER *header);

namespace {

constexpr std::uint32_t kCells = 0x78;
constexpr std::uint32_t kNames = 0x80;
constexpr std::uint32_t kFuncs = 0x90;
constexpr int           kFuncCount = 2;

void Put32(std::vector<unsigned char> &bytes, std::size_t at, std::uint32_t value) {
    std::memcpy(&bytes[at], &value, 4);
}

void PutFloat(std::vector<unsigned char> &bytes, std::size_t at, float value) {
    std::memcpy(&bytes[at], &value, 4);
}

// A 2x3 part with two element names and two function records, at the PS2's offsets.
std::vector<unsigned char> DiscDefinition() {
    std::vector<unsigned char> bytes(kFuncs + kFuncCount * 0xC0, 0);
    std::uint32_t              size = static_cast<std::uint32_t>(bytes.size());
    Put32(bytes, 0x00, 0x78);
    Put32(bytes, 0x04, size);
    Put32(bytes, 0x08, 2);
    Put32(bytes, 0x0C, 3);
    Put32(bytes, 0x10, 7);
    PutFloat(bytes, 0x24, 1.5f);
    PutFloat(bytes, 0x28, -2.0f);
    PutFloat(bytes, 0x2C, 3.25f);
    PutFloat(bytes, 0x34, 0.5f);
    Put32(bytes, 0x3C, kCells);
    for (int i = 0; i < 6; i++) {
        Put32(bytes, 0x40 + i * 4, 100 + i);
    }
    Put32(bytes, 0x58, kNames);
    Put32(bytes, 0x5C, kNames + 4);
    Put32(bytes, 0x70, kFuncs);
    Put32(bytes, 0x74, kFuncCount);
    for (int i = 0; i < 6; i++) {
        bytes[kCells + i] = static_cast<unsigned char>(0x10 + i);
    }
    std::memcpy(&bytes[kNames], "ab\0\0cd\0", 8);
    for (int i = 0; i < kFuncCount; i++) {
        std::size_t at = kFuncs + i * 0xC0;
        bytes[at] = static_cast<unsigned char>(0xA0 + i);
        Put32(bytes, at + 0x10, 20 + i);
        Put32(bytes, at + 0x14, 0);
        PutFloat(bytes, at + 0x18, 6.0f + i);
        PutFloat(bytes, at + 0x1C, 18.0f + i);
        Put32(bytes, at + 0x20, 40 + i);
        Put32(bytes, at + 0x24, 50 + i);
        bytes[at + 0x28] = static_cast<unsigned char>(1 - i);
        std::memcpy(&bytes[at + 0x30], i == 0 ? "door" : "lamp", 5);
        PutFloat(bytes, at + 0x40, 10.0f * (i + 1));
        PutFloat(bytes, at + 0x5C, 0.25f);
        PutFloat(bytes, at + 0x70, 7.0f);
        PutFloat(bytes, at + 0xBC, 1.0f + i);
    }
    return bytes;
}

struct Arena {
    std::vector<u_long128> storage;
    CDataAlloc2<1>         alloc;

    explicit Arena(int quads) : storage(static_cast<std::size_t>(quads)) {
        alloc.base = reinterpret_cast<u_char *>(storage.data());
        alloc.limit = quads;
        alloc.used = 0;
    }
};

void CheckFunc(const EPARTS_FUNC_DATA &func, int i) {
    DC_CHECK(func.unk_00[0] == 0xA0 + i);
    DC_CHECK(func.kind == 20 + i);
    DC_CHECK(func.start_time == 6.0f + i);
    DC_CHECK(func.end_time == 18.0f + i);
    DC_CHECK(func.link_id == 40 + i);
    DC_CHECK(func.completion_flag == 50 + i);
    DC_CHECK(func.unk_28[0] == 1 - i);
    DC_CHECK(std::strcmp(func.frame_name, i == 0 ? "door" : "lamp") == 0);
    DC_CHECK(func.position[0] == 10.0f * (i + 1));
    DC_CHECK(func.rotation[3] == 0.25f);
    DC_CHECK(func.values[0] == 7.0f);
    DC_CHECK(func.matrix[3][3] == 1.0f + i);
}

} // namespace

DC_TEST(bits64_eparts_reads_the_disc_header) {
    std::vector<unsigned char> disc = DiscDefinition();
    EPartsDiscHeader           header = EPartsReadHeader(disc.data());
    DC_CHECK(header.width == 2 && header.height == 3 && header.kind == 7);
    DC_CHECK(header.cell == kCells && header.func == kFuncs && header.func_count == kFuncCount);
    DC_CHECK(header.position[2] == 3.25f);
}

DC_TEST(bits64_eparts_load_builds_host_records) {
    std::vector<unsigned char> disc = DiscDefinition();
    Arena                      arena(4096);
    EPARTS_INFO_HEADER        *header = EPartsLoad(disc.data(), &arena.alloc);

    DC_CHECK(header->data_size == static_cast<int>(disc.size()));
    DC_CHECK(header->width == 2 && header->height == 3 && header->kind == 7);
    DC_CHECK(header->position[0] == 1.5f && header->position[1] == -2.0f && header->rotation[1] == 0.5f);
    for (int i = 0; i < 6; i++) {
        DC_CHECK(header->cell[i] == 0x10 + i);
        DC_CHECK(header->element_id[i] == 100 + i);
    }
    DC_CHECK(std::strcmp(header->element_name[0], "ab") == 0);
    DC_CHECK(std::strcmp(header->element_name[1], "cd") == 0);
    DC_CHECK(header->element_name[2] == nullptr);
    DC_CHECK(header->func_count == kFuncCount);
    for (int i = 0; i < kFuncCount; i++) {
        CheckFunc(header->func[i], i);
        DC_CHECK(header->func[i].parts == nullptr);
    }
    auto *begin = reinterpret_cast<u_char *>(arena.storage.data());
    auto *end = begin + arena.alloc.used * 16;
    DC_CHECK(reinterpret_cast<u_char *>(header) >= begin && reinterpret_cast<u_char *>(&header->func[1] + 1) <= end);
    DC_CHECK(reinterpret_cast<unsigned char *>(header->cell) != disc.data() + kCells);
}

DC_TEST(bits64_eparts_get_func_point_reads_the_disc_stride) {
    std::vector<unsigned char> disc = DiscDefinition();
    std::vector<u_int>         archive((0x20 + disc.size()) / 4, 0);
    archive[1] = 0x20;
    std::memcpy(reinterpret_cast<char *>(archive.data()) + 0x20, disc.data(), disc.size());
    EPARTS_FUNC_DATA points[3] = {};

    DC_CHECK(GetFuncPoint(5, archive.data(), points) == kFuncCount);
    for (int i = 0; i < kFuncCount; i++) {
        CheckFunc(points[i], i);
        DC_CHECK(reinterpret_cast<std::intptr_t>(points[i].parts) == 5);
    }
    DC_CHECK(points[2].kind == 0);
}

DC_TEST(bits64_eparts_init_header_keeps_the_host_fields) {
    INIT_PARTSINFO init = {};
    init.width = 2;
    init.height = 2;
    init.kind = 3;
    for (int i = 0; i < 4; i++) {
        init.cell[i][0] = static_cast<u8>(0x40 + i);
    }
    for (int i = 0; i < 6; i++) {
        init.element_id[i] = i;
        std::strcpy(init.element_name[i], i == 0 ? "roof" : "");
    }
    std::vector<u_long128> storage(64);
    auto                  *header = reinterpret_cast<EPARTS_INFO_HEADER *>(storage.data());
    int                    size = EdInitToEPInfo(&init, header);

    DC_CHECK(header->header_size == static_cast<int>(sizeof(EPARTS_INFO_HEADER)));
    DC_CHECK(reinterpret_cast<u8 *>(header->cell) == reinterpret_cast<u8 *>(header) + sizeof(EPARTS_INFO_HEADER));
    for (int i = 0; i < 4; i++) {
        DC_CHECK(header->cell[i] == 0x40 + i);
        DC_CHECK(header->element_id[i] == i);
    }
    DC_CHECK(std::strcmp(header->element_name[0], "roof") == 0);
    DC_CHECK(header->element_name[5][0] == '\0');
    DC_CHECK(size == header->data_size && size == static_cast<int>(sizeof(EPARTS_INFO_HEADER)) + 4 + (4 + 2) + 5 * 2);
}
