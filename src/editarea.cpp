#include "editarea.hpp"

#include <cstring>

#include "collision.hpp"
#include "frame.hpp"
#include "mapparts.hpp"
#include "rect.hpp"
#include "vector3.hpp"

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
INCLUDE_ASM("asm/nonmatchings/editarea", GetAlt__9CEditAreaFfff);
INCLUDE_ASM("asm/nonmatchings/editarea", GetAlt_i__9CEditAreaFfff);

int CEditArea::GetPartsExtra(int x, int y) {
    switch (map_no) {
        case 1:
            switch (area_id) {
                case 0:
                    if (x == 5 && y == -1)
                        return 2;
                    if (x == 2 && y == 8)
                        return 2;
                    break;
                case 1:
                    if (x == 3 && y == 6)
                        return 2;
                    if (x == 12 && y == 3)
                        return 2;
                    break;
                case 2:
                    if (x == 4 && y == -1)
                        return 2;
                    if (x == 3 && y == 8)
                        return 2;
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
INCLUDE_ASM("asm/nonmatchings/editarea", SetRiverParts__9CEditAreaFii);

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
    if (GetPartsExtra(x, y) != 1) {
        return -1;
    }
    neighbors[0] = GetPartsExtra(x, y - 1) == 1;
    neighbors[1] = GetPartsExtra(x + 1, y) == 1;
    neighbors[2] = GetPartsExtra(x, y + 1) == 1;
    neighbors[3] = GetPartsExtra(x - 1, y) == 1;
    count = 0;
    for (i = 0; i < 4; i++) {
        count += neighbors[i];
    }
    shape = -1;
    direction = 0;
    if (count == 4) {
        shape = 4;
    }
    if (count == 3) {
        shape = 3;
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
            shape = 2;
            if (neighbors[0] != 0) {
                direction = 0;
            }
            if (neighbors[1] != 0) {
                direction = 1;
            }
        } else {
            shape = 1;
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
        shape = 6;
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
        shape = 5;
    }
    if (shape < 0) {
        return -1;
    }
    shape = (shape << 4) & 0xFF0;
    return shape | (direction & 0xF);
}

INCLUDE_ASM("asm/nonmatchings/editarea", SearchPartsID__9CEditAreaFfff);
INCLUDE_ASM("asm/nonmatchings/editarea", SearchPartsExtra__9CEditAreaFfff);
INCLUDE_ASM("asm/nonmatchings/editarea", GetGrid__9CEditAreaFP11CVector3_f_fff);
INCLUDE_ASM("asm/nonmatchings/editarea", RemakeGrid__9CEditAreaFv);

void CEditArea::GetPartsBox(CBoxVu0 *box) {
    memcpy(box, &this->parts_box, sizeof(CBoxVu0));
}
INCLUDE_ASM("asm/nonmatchings/editarea", MakePartsBox__9CEditAreaFv);

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
INCLUDE_ASM("asm/nonmatchings/editarea", PickUpPoly__9CEditAreaFP6CCPolyfff);
INCLUDE_ASM("asm/nonmatchings/editarea", PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_);
INCLUDE_ASM("asm/nonmatchings/editarea", PickUpPoly__9CEditAreaFP6CCPoly7CBoxVu0);
INCLUDE_ASM("asm/nonmatchings/editarea", GetPartsRect__9CEditAreaFR8CRect_i_Pii);

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
INCLUDE_ASM("asm/nonmatchings/editarea", Initialize__9CEditAreaFv);

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
