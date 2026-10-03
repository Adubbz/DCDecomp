#pragma once

#include <cstddef>
#include <cstdint>

#include "dataalloc.hpp"
#include "editpartsinfo.hpp"
#include "objanime.hpp"

// A .pts part definition as the disc lays it out: an EPARTS_INFO_HEADER with 4-byte pointers that
// hold offsets from the header, followed by the cell map, the element names and a table of 0xC0-byte
// EPARTS_FUNC_DATA. The host structs have 8-byte pointers, so their fields sit elsewhere and the
// function table's stride is 0xD0; every reader of a .pts goes through these.

struct EPartsDiscHeader {
    std::int32_t  header_size;
    std::int32_t  data_size;
    std::int32_t  width;
    std::int32_t  height;
    std::int32_t  kind;
    std::uint8_t  unk_14[0x10];
    float         position[3];
    float         rotation[3];
    std::uint32_t cell;
    std::int32_t  element_id[6];
    std::uint32_t element_name[6];
    std::uint32_t func;
    std::int32_t  func_count;
};

static_assert(sizeof(EPartsDiscHeader) == 0x78);
static_assert(offsetof(EPartsDiscHeader, cell) == 0x3C);
static_assert(offsetof(EPartsDiscHeader, func) == 0x70);

struct EPartsDiscFunc {
    std::uint8_t  unk_00[0x10];
    std::int32_t  kind;
    std::uint32_t parts;
    float         start_time;
    float         end_time;
    std::int32_t  link_id;
    std::int32_t  completion_flag;
    std::uint8_t  unk_28[0x8];
    char          frame_name[0x10];
    float         position[4];
    float         rotation[4];
    float         parameters[4];
    float         values[4];
    float         matrix[4][4];
};

static_assert(sizeof(EPartsDiscFunc) == 0xC0);
static_assert(offsetof(EPartsDiscFunc, position) == 0x40);

// The header of the definition at `record`, copied out.
EPartsDiscHeader EPartsReadHeader(const void *record);

// Function record `index` of the definition at `record`, into a host record. `parts` keeps the disc
// word, zero-extended, as retail's copy kept it.
void EPartsReadFunc(const void *record, int index, EPARTS_FUNC_DATA *out);

// Retail's relocated copy of the definition, at host layout, carved from `arena`: the host header,
// the record's bytes (which the cell map and element names point into) and the host function table.
EPARTS_INFO_HEADER *EPartsLoad(const void *record, CDataAlloc2<1> *arena);
