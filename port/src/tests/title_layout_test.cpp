#include <elf.h>
#include <gtest/gtest.h>

#include <cstdint>
#include <cstring>
#include <fstream>
#include <string>
#include <string_view>
#include <vector>

#include "dataread.hpp"
#include "fireomni.hpp"
#include "main.hpp"
#include "map.hpp"
#include "mapobject.hpp"
#include "objanime.hpp"
#include "water.hpp"

// The title units declare these objects with PS2-sized classes of their own and the port defines
// them with the real ones. The linked symbol's size says which definition won.

extern CMap          OP_GroundMap;
extern CMap          OP_BuildingMap;
extern CMap          OP_BuildingMap2;
extern OBJ_ANIME_SEQ OP_AnimeSeq[32];
extern CMapObject    OP_NornMapObj[76];
extern CMapObject    OP_NornMapObj2[87];
extern CFireOmni     CFire;
extern CFireOmni     CFire__4;
extern CWater        Water;
extern CWater        Water__2;

namespace {

template <class T>
std::vector<T> ReadArray(std::ifstream &file, std::uint64_t offset, std::uint64_t bytes) {
    std::vector<T> items(bytes / sizeof(T));
    file.seekg(static_cast<std::streamoff>(offset));
    file.read(reinterpret_cast<char *>(items.data()), static_cast<std::streamsize>(items.size() * sizeof(T)));
    return items;
}

// st_size of a global object symbol in this executable's own symbol table; 0 when it is missing.
std::uint64_t LinkedSize(std::string_view name) {
    std::ifstream file("/proc/self/exe", std::ios::binary);
    Elf64_Ehdr    header = ReadArray<Elf64_Ehdr>(file, 0, sizeof(Elf64_Ehdr))[0];
    auto          sections = ReadArray<Elf64_Shdr>(file, header.e_shoff, header.e_shnum * sizeof(Elf64_Shdr));
    for (const Elf64_Shdr &section : sections) {
        if (section.sh_type != SHT_SYMTAB) {
            continue;
        }
        const Elf64_Shdr &string_section = sections[section.sh_link];
        auto              strings = ReadArray<char>(file, string_section.sh_offset, string_section.sh_size);
        for (const Elf64_Sym &symbol : ReadArray<Elf64_Sym>(file, section.sh_offset, section.sh_size)) {
            if (ELF64_ST_TYPE(symbol.st_info) == STT_OBJECT && ELF64_ST_BIND(symbol.st_info) != STB_LOCAL &&
                name == strings.data() + symbol.st_name) {
                return symbol.st_size;
            }
        }
    }
    return 0;
}

const void *VirtualTable(const void *object) {
    const void *table;
    std::memcpy(&table, object, sizeof(table));
    return table;
}

} // namespace

TEST(TitleLayout, SharedObjectsHaveHostSizes) {
    ASSERT_TRUE(LinkedSize("OP_GroundMap") == sizeof(CMap));
    ASSERT_TRUE(LinkedSize("OP_BuildingMap") == sizeof(CMap));
    ASSERT_TRUE(LinkedSize("OP_BuildingMap2") == sizeof(CMap));
    ASSERT_TRUE(LinkedSize("OP_AnimeSeq") == 32 * sizeof(OBJ_ANIME_SEQ));
    ASSERT_TRUE(LinkedSize("OP_NornMapObj") == 76 * sizeof(CMapObject));
    ASSERT_TRUE(LinkedSize("OP_NornMapObj2") == 87 * sizeof(CMapObject));
    ASSERT_TRUE(LinkedSize("CFire") == sizeof(CFireOmni));
    ASSERT_TRUE(LinkedSize("CFire__4") == sizeof(CFireOmni));
    ASSERT_TRUE(LinkedSize("Water") == sizeof(CWater));
    ASSERT_TRUE(LinkedSize("Water__2") == sizeof(CWater));

    // The PS2 extents the title units' own declarations have, which the host ones must exceed for
    // the strong definitions to matter.
    ASSERT_TRUE(sizeof(OBJ_ANIME_SEQ) == 192 && sizeof(CMap) == 3120 && sizeof(CMapObject) == 272);
    ASSERT_TRUE(sizeof(CFireOmni) == 80 && sizeof(CWater) == 848);
}

// op_a.cpp's static constructor builds OP_NornMapObj-style arrays at its own 240-byte stride over
// the port's objects; the overlay load builds them again.
TEST(TitleLayout, OverlayLoadConstructsTheObjects) {
    CMapObject fresh;
    std::memset(static_cast<void *>(OP_NornMapObj), 0xA5, sizeof(OP_NornMapObj));
    std::memset(static_cast<void *>(&OP_GroundMap), 0xA5, sizeof(OP_GroundMap));
    std::memset(static_cast<void *>(OP_AnimeSeq), 0xA5, sizeof(OP_AnimeSeq));

    LoadOverlay(GAME_MODE_RUSH_MOVIE);

    ASSERT_TRUE(VirtualTable(&OP_NornMapObj[75]) == VirtualTable(&fresh));
    ASSERT_TRUE(VirtualTable(&OP_GroundMap.object[9]) == VirtualTable(&fresh));
    ASSERT_TRUE(OP_GroundMap.object[9].handle == fresh.handle);
    for (const OBJ_ANIME_SEQ &sequence : OP_AnimeSeq) {
        ASSERT_TRUE(sequence.property == OBJ_ANIME_PROPERTY_NONE && sequence.frames[9] == nullptr);
    }
}

// Retail reran TITLE.BIN's constructors only when a mode needed it after DUN.BIN.
TEST(TitleLayout, OverlayConstructsOncePerLoad) {
    LoadOverlay(GAME_MODE_TITLE);
    OP_NornMapObj[3].handle = 1234;
    LoadOverlay(GAME_MODE_OPENING);
    LoadOverlay(GAME_MODE_EDIT);
    LoadOverlay(GAME_MODE_RUSH_MOVIE);
    ASSERT_TRUE(OP_NornMapObj[3].handle == 1234);
    LoadOverlay(GAME_MODE_LOADER);
    LoadOverlay(GAME_MODE_TITLE);
    ASSERT_TRUE(OP_NornMapObj[3].handle != 1234);
}
