#include "editarea.hpp"

#include <cstring>

#include "collision.hpp"
#include "frame.hpp"
#include "mapparts.hpp"
#include "rect.hpp"
#include "vector3.hpp"

/**
 * Identifies map-part attributes used by connection queries.
 */
// clang-format off
enum MapConnectionAttribute {
    MAP_CONNECTION_ROAD = 1,
    MAP_CONNECTION_RIVER = 2
};
// clang-format on

/**
 * Identifies the shape encoded by connected map-part neighbors.
 */
// clang-format off
enum MapConnectionShape {
    MAP_CONNECTION_CORNER = 1,
    MAP_CONNECTION_STRAIGHT = 2,
    MAP_CONNECTION_THREE_WAY = 3,
    MAP_CONNECTION_FOUR_WAY = 4,
    MAP_CONNECTION_ISOLATED = 5,
    MAP_CONNECTION_END = 6
};
// clang-format on

void CEditArea::SetSize(s32 width, s32 height, float unit_size, float unit_alt) {
    this->width = width;
    this->height = height;
    this->unit_size = unit_size;
    this->unit_alt = unit_alt;
}
INCLUDE_ASM("asm/nonmatchings/editarea", GetPos__9CEditAreaFP11CVector3_i_fff);

void CEditArea::GetPos(CVector3_f_ *position, s32 x, s32 y, s32 z) {
    position->x = this->offset_x + ((float) x * this->unit_size);
    position->y = this->offset_y + ((float) y * this->unit_alt);
    position->z = this->offset_z + ((float) z * this->unit_size);
}

void CEditArea::SetPartsNo(int x, int y, int parts_no) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_no = parts_no;
}

void CEditArea::SetPartsID(int x, int y, int parts_id) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_id = parts_id;
}

void CEditArea::SetPartsExtra(int x, int y, int parts_extra) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_extra = parts_extra;
}

void CEditArea::SetCode(int x, int y, int code) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].code = code;
}

int CEditArea::GetPartsID(int x, int y) {
    if (x < 0 || x >= width) {
        return -1;
    }
    if (y < 0 || y >= height) {
        return -1;
    }
    return grid[x][y].parts_id;
}

int CEditArea::GetCode(int x, int y) {
    if (x < 0 || x >= width) {
        return -1;
    }
    if (y < 0 || y >= height) {
        return -1;
    }
    return grid[x][y].code;
}

void CEditArea::SetAlt(int x, int y, int altitude) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    if (altitude < 0) {
        altitude = 0;
    }
    if (altitude >= 128) {
        altitude = 127;
    }
    grid[x][y].altitude = altitude;
}

int CEditArea::GetAlt_i(int x, int y) {
    if (x < 0 || x >= width) {
        return 0;
    }
    if (y < 0 || y >= height) {
        return 0;
    }
    return grid[x][y].altitude;
}

float CEditArea::GetAlt(int x, int y) {
    if (x < 0 || x >= width) {
        return 0.0f;
    }
    if (y < 0 || y >= height) {
        return 0.0f;
    }
    return offset_y + static_cast<float>(grid[x][y].altitude) * unit_alt;
}

float CEditArea::GetAlt(float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    return GetAlt(position.x, position.z);
}

int CEditArea::GetAlt_i(float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    return GetAlt_i(position.x, position.z);
}

int CEditArea::GetPartsExtra(int x, int y) {
    switch (map_no) {
        case 1:
            switch (area_id) {
                case 0:
                    if (x == 5 && y == -1)
                        return MAP_CONNECTION_RIVER;
                    if (x == 2 && y == 8)
                        return MAP_CONNECTION_RIVER;
                    break;
                case 1:
                    if (x == 3 && y == 6)
                        return MAP_CONNECTION_RIVER;
                    if (x == 12 && y == 3)
                        return MAP_CONNECTION_RIVER;
                    break;
                case 2:
                    if (x == 4 && y == -1)
                        return MAP_CONNECTION_RIVER;
                    if (x == 3 && y == 8)
                        return MAP_CONNECTION_RIVER;
                    break;
            }
    }
    if (x < 0 || x >= width)
        return -1;
    if (y < 0 || y >= height)
        return -1;
    return grid[x][y].parts_extra;
}
INCLUDE_ASM("asm/nonmatchings/editarea", SetMapParts__9CEditAreaFiP9CMapPartsfffi);
INCLUDE_ASM("asm/nonmatchings/editarea", DeleteMapParts__9CEditAreaFiP9CMapPartsfff);

int CEditArea::SetRiverParts(int x, int y) {
    int neighbors[4];
    int negative_z, positive_x, positive_z, negative_x;
    int count, shape, direction, i;

    if ((x < 0) || (x >= this->width)) {
        return -1;
    }
    if ((y < 0) || (y >= this->height)) {
        return -1;
    }
    if (GetPartsExtra(x, y) != MAP_CONNECTION_RIVER) {
        return -1;
    }
    negative_z = GetPartsExtra(x, y - 1);
    positive_x = GetPartsExtra(x + 1, y);
    positive_z = GetPartsExtra(x, y + 1);
    negative_x = GetPartsExtra(x - 1, y);
    neighbors[0] = negative_z == MAP_CONNECTION_RIVER;
    neighbors[1] = positive_x == MAP_CONNECTION_RIVER;
    neighbors[2] = positive_z == MAP_CONNECTION_RIVER;
    neighbors[3] = negative_x == MAP_CONNECTION_RIVER;
    neighbors[0] = neighbors[0] || negative_z == 3;
    neighbors[1] = neighbors[1] || positive_x == 3;
    neighbors[2] = neighbors[2] || positive_z == 3;
    neighbors[3] = neighbors[3] || negative_x == 3;
    neighbors[0] = neighbors[0] || negative_z == 5;
    neighbors[1] = neighbors[1] || positive_x == 5;
    neighbors[2] = neighbors[2] || positive_z == 5;
    neighbors[3] = neighbors[3] || negative_x == 5;
    count = 0;
    for (i = 0; i < 4; i++) {
        count += neighbors[i];
    }
    shape = -1;
    direction = 0;
    if (count == 4) {
        shape = MAP_CONNECTION_FOUR_WAY;
    }
    if (count == 3) {
        shape = MAP_CONNECTION_THREE_WAY;
        if (neighbors[0] == 0) {
            direction = 3;
        }
        if (neighbors[1] == 0) {
            direction = 2;
        }
        if (neighbors[2] == 0) {
            direction = 1;
        }
        if (neighbors[3] == 0) {
            direction = 0;
        }
    }
    if (count == 2) {
        if (((neighbors[0] != 0) && (neighbors[2] != 0)) || ((neighbors[1] != 0) && (neighbors[3] != 0))) {
            shape = MAP_CONNECTION_STRAIGHT;
            if (neighbors[0] != 0) {
                direction = 0;
            }
            if (neighbors[1] != 0) {
                direction = 1;
            }
        } else {
            shape = MAP_CONNECTION_CORNER;
            if ((neighbors[1] != 0) && (neighbors[2] != 0)) {
                direction = 3;
            }
            if ((neighbors[2] != 0) && (neighbors[3] != 0)) {
                direction = 2;
            }
            if ((neighbors[3] != 0) && (neighbors[0] != 0)) {
                direction = 1;
            }
            if ((neighbors[0] != 0) && (neighbors[1] != 0)) {
                direction = 0;
            }
        }
    }
    if (count == 1) {
        shape = MAP_CONNECTION_END;
        if (neighbors[0] != 0) {
            direction = 2;
        }
        if (neighbors[1] != 0) {
            direction = 1;
        }
        if (neighbors[2] != 0) {
            direction = 0;
        }
        if (neighbors[3] != 0) {
            direction = 3;
        }
    }
    if (count == 0) {
        shape = MAP_CONNECTION_ISOLATED;
    }
    if (shape < 0) {
        return -1;
    }
    shape = (shape << 4) & 0xFF0;
    return shape | (direction & 0xF);
}

int CEditArea::SetRoadParts(int x, int y) {
    int neighbors[4];
    int count;
    int shape;
    int direction;
    int i;

    if ((x < 0) || (x >= this->width)) {
        return -1;
    }
    if ((y < 0) || (y >= this->height)) {
        return -1;
    }
    if (GetPartsExtra(x, y) != MAP_CONNECTION_ROAD) {
        return -1;
    }
    neighbors[0] = GetPartsExtra(x, y - 1) == MAP_CONNECTION_ROAD;
    neighbors[1] = GetPartsExtra(x + 1, y) == MAP_CONNECTION_ROAD;
    neighbors[2] = GetPartsExtra(x, y + 1) == MAP_CONNECTION_ROAD;
    neighbors[3] = GetPartsExtra(x - 1, y) == MAP_CONNECTION_ROAD;
    count = 0;
    for (i = 0; i < 4; i++) {
        count += neighbors[i];
    }
    shape = -1;
    direction = 0;
    if (count == 4) {
        shape = MAP_CONNECTION_FOUR_WAY;
    }
    if (count == 3) {
        shape = MAP_CONNECTION_THREE_WAY;
        if (neighbors[0] == 0) {
            direction = 0;
        }
        if (neighbors[1] == 0) {
            direction = 3;
        }
        if (neighbors[2] == 0) {
            direction = 2;
        }
        if (neighbors[3] == 0) {
            direction = 1;
        }
    }
    if (count == 2) {
        if (((neighbors[0] != 0) && (neighbors[2] != 0)) || ((neighbors[1] != 0) && (neighbors[3] != 0))) {
            shape = MAP_CONNECTION_STRAIGHT;
            if (neighbors[0] != 0) {
                direction = 0;
            }
            if (neighbors[1] != 0) {
                direction = 1;
            }
        } else {
            shape = MAP_CONNECTION_CORNER;
            if ((neighbors[1] != 0) && (neighbors[2] != 0)) {
                direction = 0;
            }
            if ((neighbors[2] != 0) && (neighbors[3] != 0)) {
                direction = 3;
            }
            if ((neighbors[3] != 0) && (neighbors[0] != 0)) {
                direction = 2;
            }
            if ((neighbors[0] != 0) && (neighbors[1] != 0)) {
                direction = 1;
            }
        }
    }
    if (count == 1) {
        shape = MAP_CONNECTION_END;
        if (neighbors[0] != 0) {
            direction = 2;
        }
        if (neighbors[1] != 0) {
            direction = 1;
        }
        if (neighbors[2] != 0) {
            direction = 0;
        }
        if (neighbors[3] != 0) {
            direction = 3;
        }
    }
    if (count == 0) {
        shape = MAP_CONNECTION_ISOLATED;
    }
    if (shape < 0) {
        return -1;
    }
    shape = (shape << 4) & 0xFF0;
    return shape | (direction & 0xF);
}

int CEditArea::SearchPartsID(float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    return grid[position.x][position.z].parts_id;
}

int CEditArea::SearchPartsExtra(float x, float y, float z) {
    CVector3_i_ position;
    GetPos(&position, x, y, z);
    return GetPartsExtra(position.x, position.z);
}

void CEditArea::GetGrid(CVector3_f_ *position, float x, float y, float z) {
    CVector3_i_ grid_position;
    GetPos(&grid_position, x, y, z);
    GetPos(position, grid_position.x, grid_position.y, grid_position.z);
}
INCLUDE_ASM("asm/nonmatchings/editarea", RemakeGrid__9CEditAreaFv);

void CEditArea::GetPartsBox(CBoxVu0 *box) {
    memcpy(box, &this->parts_box, sizeof(CBoxVu0));
}

void CEditArea::MakePartsBox() {
    CVector3_f_ position;
    int min_x = 0;
    int max_x = 0;
    int max_z = 0;
    int min_z = 0;
    for (int x = 0; x < width; x++) {
        for (int z = 0; z < height; z++) {
            if (grid[x][z].parts_no >= 0 && grid[x][z].parts_id >= 0) {
                if (max_x < x)
                    max_x = x;
                if (max_z < z)
                    max_z = z;
                if (min_x > x)
                    max_x = x;
                if (z < min_z)
                    min_z = z;
            }
        }
    }
    GetPos(&position, max_x, 0, max_z);
    parts_box.max[0] = position.x + unit_size;
    parts_box.max[1] = position.y;
    parts_box.max[2] = position.z + unit_size;
    parts_box.max[3] = 1.0f;
    GetPos(&position, 0, 0, min_z);
    parts_box.min[0] = position.x;
    parts_box.min[1] = position.y;
    parts_box.min[2] = position.z;
    parts_box.min[3] = 1.0f;
}

int CEditArea::CheckArea(float x, float, float z) {
    if (x < offset_x) {
        return 0;
    }
    if (z < offset_z) {
        return 0;
    }
    if (x > offset_x + unit_size * static_cast<float>(width)) {
        return 0;
    }
    if (z > offset_z + unit_size * static_cast<float>(height)) {
        return 0;
    }
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/editarea", CheckAreaRect__9CEditAreaFfffii);
INCLUDE_ASM("asm/nonmatchings/editarea", CheckParts__9CEditAreaFP9CMapPartsfffi);

int CEditArea::PickUpPoly(CCPoly *polygons, float x, float y, float z) {
    CVector3_i_ position;
    if (CheckArea(x, y, z) == 0) {
        return 0;
    }
    GetPos(&position, x, y, z);
    CRect_i_ rect(position.x - 1, position.z - 1, 2, 2);
    return PickUpPoly(polygons, rect);
}
INCLUDE_ASM("asm/nonmatchings/editarea", PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_);

int CEditArea::PickUpPoly(CCPoly *polygons, CBoxVu0 box) {
    int left, top;
    CVector3_i_ position;
    GetPos(&position, box.min[0], box.min[1], box.min[2]);
    left = position.x;
    top = position.z;
    GetPos(&position, box.max[0], box.max[1], box.max[2]);
    int right = position.x;
    int bottom = position.z;
    CRect_i_ rect;
    rect.x = left - 1;
    rect.y = top - 1;
    rect.width = right - left + 2;
    rect.height = bottom - top + 2;
    return PickUpPoly(polygons, rect);
}

int CEditArea::GetPartsRect(CRect_i_ &rect, int *parts_ids, int max_parts) {
    int x, y;
    int count = 0;
    for (x = rect.x; x < rect.x + rect.width; x++) {
        for (y = rect.y; y < rect.y + rect.height; y++) {
            if (count >= max_parts)
                break;
            int parts_id = GetPartsID(x, y);
            if (parts_id >= 0) {
                if (count == 0) {
                    parts_ids[count++] = parts_id;
                } else {
                    int found = 0;
                    for (int i = 0; i < count; i++) {
                        if (parts_id == parts_ids[i])
                            found = 1;
                    }
                    if (!found)
                        parts_ids[count++] = parts_id;
                }
            }
        }
    }
    return count;
}

void CEditArea::ChainWorkClear(void) {
    for (int x = 0; x < 16; x++) {
        for (int y = 0; y < 16; y++) {
            chain_work[x][y] = 0;
        }
    }
}
INCLUDE_ASM("asm/nonmatchings/editarea", CheckRiverChain__9CEditAreaFiiii);
INCLUDE_ASM("asm/nonmatchings/editarea", DrawGrid__9CEditAreaFv);

void CEditArea::Clear(void) {
    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
            grid[x][y].parts_no = -1;
            grid[x][y].altitude = 0;
            grid[x][y].unk_08 = 0;
            grid[x][y].parts_id = -1;
            grid[x][y].code = -1;
            grid[x][y].parts_extra = -1;
            grid[x][y].unk_18 = -1;
        }
    }
    unk_2050 = 1;
    unk_2054 = 4;
}

void CEditArea::Initialize() {
    float zero = 0.0f;
    SetOffset(zero, zero, zero);
    SetSize(16, 16, 1.0f, 1.0f);
    grid_frame = NULL;
    Clear();
    map_no = 0;
    area_id = 0;
}

void CEditArea::SetMapInfo(s32 map_no, s32 area_id) {
    this->map_no = map_no;
    this->area_id = area_id;
}

int CEditArea::GetMapNo() {
    return this->map_no;
}

int CEditArea::GetAreaID() {
    return this->area_id;
}

void CEditArea::SetGridFrame(CFrameVu1 *frame) {
    this->grid_frame = frame;
}

CFrameVu1 *CEditArea::GetGridFrame() {
    return this->grid_frame;
}

void CEditArea::SetOffset(float x, float y, float z) {
    this->offset_x = x;
    this->offset_y = y;
    this->offset_z = z;
}

void CEditArea::GetOffset(float *offset) {
    offset[0] = offset_x;
    offset[1] = offset_y;
    offset[2] = offset_z;
}

int CEditArea::GetWidth() {
    return this->width;
}

int CEditArea::GetHeight() {
    return this->height;
}

void CEditArea::AddAlt(int x, int y, int altitude_delta) {
    SetAlt(x, y, GetAlt_i(x, y) + altitude_delta);
}

float CEditArea::GetUnitSize() {
    return this->unit_size;
}

float CEditArea::GetUnitAlt() {
    return this->unit_alt;
}

CEditArea::CEditArea(void) {
    Initialize();
}
