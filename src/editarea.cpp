#include "editarea.hpp"

#include <cstring>

#include "collision.hpp"
#include "frame.hpp"
#include "mapparts.hpp"
#include "rect.hpp"
#include "vector3.hpp"

void CEditArea::SetSize(s32 width_, s32 height_, float unit_size_, float unit_alt_) {
    this->width = width_;
    this->height = height_;
    this->unit_size = unit_size_;
    this->unit_alt = unit_alt_;
}
INCLUDE_ASM("asm/nonmatchings/editarea", GetPos__9CEditAreaFP11CVector3_i_fff);

void CEditArea::GetPos(CVector3_f_ *position, s32 x, s32 y, s32 z) {
    position->x = this->offset_x + ((float) x * this->unit_size);
    position->y = this->offset_y + ((float) y * this->unit_alt);
    position->z = this->offset_z + ((float) z * this->unit_size);
}

void CEditArea::SetPartsNo(int x, int y, int parts_no_) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_no = parts_no_;
}

void CEditArea::SetPartsID(int x, int y, int parts_id_) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_id = parts_id_;
}

void CEditArea::SetPartsExtra(int x, int y, int parts_extra_) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].parts_extra = parts_extra_;
}

void CEditArea::SetCode(int x, int y, int code_) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    grid[x][y].code = code_;
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

void CEditArea::SetAlt(int x, int y, int altitude_) {
    if (x < 0 || x >= width) {
        return;
    }
    if (y < 0 || y >= height) {
        return;
    }
    if (altitude_ < 0) {
        altitude_ = 0;
    }
    if (altitude_ >= 128) {
        altitude_ = 127;
    }
    grid[x][y].altitude = altitude_;
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
INCLUDE_ASM("asm/nonmatchings/editarea", GetPartsExtra__9CEditAreaFii);
INCLUDE_ASM("asm/nonmatchings/editarea", SetMapParts__9CEditAreaFiP9CMapPartsfffi);
INCLUDE_ASM("asm/nonmatchings/editarea", DeleteMapParts__9CEditAreaFiP9CMapPartsfff);
INCLUDE_ASM("asm/nonmatchings/editarea", SetRiverParts__9CEditAreaFii);
INCLUDE_ASM("asm/nonmatchings/editarea", SetRoadParts__9CEditAreaFii);
INCLUDE_ASM("asm/nonmatchings/editarea", SearchPartsID__9CEditAreaFfff);
INCLUDE_ASM("asm/nonmatchings/editarea", SearchPartsExtra__9CEditAreaFfff);
INCLUDE_ASM("asm/nonmatchings/editarea", GetGrid__9CEditAreaFP11CVector3_f_fff);
INCLUDE_ASM("asm/nonmatchings/editarea", RemakeGrid__9CEditAreaFv);

void CEditArea::GetPartsBox(CBoxVu0 *box) {
    memcpy(box, &this->parts_box, 0x20U);
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

void CEditArea::SetMapInfo(s32 map_no_, s32 area_id_) {
    this->map_no = map_no_;
    this->area_id = area_id_;
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

void CEditArea::AddAlt(int x, int y, int altitude_) {
    SetAlt(x, y, GetAlt_i(x, y) + altitude_);
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
