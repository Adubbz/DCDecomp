#include "editarea.hpp"

#include <cstring>

#include "collision.hpp"
#include "frame.hpp"
#include "mapparts.hpp"
#include "rect.hpp"
#include "vector3.hpp"

INCLUDE_ASM("asm/nonmatchings/editarea", SetSize__9CEditAreaFiiff);
INCLUDE_ASM("asm/nonmatchings/editarea", GetPos__9CEditAreaFP11CVector3_i_fff);
INCLUDE_ASM("asm/nonmatchings/editarea", GetPos__9CEditAreaFP11CVector3_f_iii);
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
INCLUDE_ASM("asm/nonmatchings/editarea", SetCode__9CEditAreaFiii);
INCLUDE_ASM("asm/nonmatchings/editarea", GetPartsID__9CEditAreaFii);
INCLUDE_ASM("asm/nonmatchings/editarea", GetCode__9CEditAreaFii);
INCLUDE_ASM("asm/nonmatchings/editarea", SetAlt__9CEditAreaFiii);
INCLUDE_ASM("asm/nonmatchings/editarea", GetAlt_i__9CEditAreaFii);
INCLUDE_ASM("asm/nonmatchings/editarea", GetAlt__9CEditAreaFii);
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
INCLUDE_ASM("asm/nonmatchings/editarea", GetPartsBox__9CEditAreaFP7CBoxVu0);
INCLUDE_ASM("asm/nonmatchings/editarea", MakePartsBox__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", CheckArea__9CEditAreaFfff);
INCLUDE_ASM("asm/nonmatchings/editarea", CheckAreaRect__9CEditAreaFfffii);
INCLUDE_ASM("asm/nonmatchings/editarea", CheckParts__9CEditAreaFP9CMapPartsfffi);
INCLUDE_ASM("asm/nonmatchings/editarea", PickUpPoly__9CEditAreaFP6CCPolyfff);
INCLUDE_ASM("asm/nonmatchings/editarea", PickUpPoly__9CEditAreaFP6CCPoly8CRect_i_);
INCLUDE_ASM("asm/nonmatchings/editarea", PickUpPoly__9CEditAreaFP6CCPoly7CBoxVu0);
INCLUDE_ASM("asm/nonmatchings/editarea", GetPartsRect__9CEditAreaFR8CRect_i_Pii);
INCLUDE_ASM("asm/nonmatchings/editarea", ChainWorkClear__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", CheckRiverChain__9CEditAreaFiiii);
INCLUDE_ASM("asm/nonmatchings/editarea", DrawGrid__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", Clear__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", Initialize__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", SetMapInfo__9CEditAreaFii);
INCLUDE_ASM("asm/nonmatchings/editarea", GetMapNo__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", GetAreaID__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", SetGridFrame__9CEditAreaFP9CFrameVu1);
INCLUDE_ASM("asm/nonmatchings/editarea", GetGridFrame__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", SetOffset__9CEditAreaFfff);
void CEditArea::GetOffset(float *offset) {
    offset[0] = offset_x;
    offset[1] = offset_y;
    offset[2] = offset_z;
}
INCLUDE_ASM("asm/nonmatchings/editarea", GetWidth__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", GetHeight__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", AddAlt__9CEditAreaFiii);
INCLUDE_ASM("asm/nonmatchings/editarea", GetUnitSize__9CEditAreaFv);
INCLUDE_ASM("asm/nonmatchings/editarea", GetUnitAlt__9CEditAreaFv);
CEditArea::CEditArea(void) {
    Initialize();
}
