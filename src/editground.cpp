#include "editground.hpp"

#include "editarea.hpp"
#include "mapparts.hpp"
#include "vector3.hpp"

static int CheckDelete(CEditArea *area, CMapParts *parts, float x, float y, float z);

INCLUDE_ASM("asm/nonmatchings/editground", SetMapParts__11CEditGroundFifffi);
INCLUDE_ASM("asm/nonmatchings/editground", SetRiverParts__11CEditGroundFfffii);
INCLUDE_ASM("asm/nonmatchings/editground", SetRoadParts__11CEditGroundFfffii);
INCLUDE_ASM("asm/nonmatchings/editground", DeleteMapParts__11CEditGroundFPiPifff);

int CEditGround::GetAreaCode(float x, float y, float z) {
    for (int i = 0; i < 4; i++) {
        if (areas[i] == NULL) {
            break;
        }
        if (areas[i]->CheckArea(x, y, z)) {
            return i;
        }
    }
    return -1;
}

float CEditGround::GetAlt(float x, float y, float z) {
    int area = GetAreaCode(x, y, z);
    if (area < 0) {
        return 0.0f;
    }
    return areas[area]->GetAlt(x, y, z);
}

int CEditGround::GetAlt_i(float x, float y, float z) {
    int area = GetAreaCode(x, y, z);
    if (area < 0) {
        return 0;
    }
    return areas[area]->GetAlt_i(x, y, z);
}

CMapParts *CEditGround::GetPartsObject(int parts_no) {
    CMapParts *object = parts;

    for (int i = 0; i < 128; i++, object++) {
        if (object->unk_0E8 >= 0 && object->parts_no == parts_no) {
            return object;
        }
    }
    return NULL;
}

int CEditGround::GetPartsID(float x, float y, float z) {
    int area = GetAreaCode(x, y, z);
    if (area < 0) {
        return -1;
    }
    return areas[area]->SearchPartsID(x, y, z);
}

CMapParts *CEditGround::GetParts(float x, float y, float z) {
    int parts_id = GetPartsID(x, y, z);
    if (parts_id < 0) {
        return NULL;
    }
    return &parts[parts_id];
}

int CEditGround::CheckEffect() {
    return effect_count > 0;
}

void CEditGround::SetBuildEffect(int parts_id) {
    sceVu0FVECTOR position;

    if (parts_id < 0 || parts_id >= 128) {
        return;
    }
    if (parts[parts_id].unk_118 != 0) {
        return;
    }
    effect_parts_id = parts_id;
    effect_count = 15;
    parts[parts_id].GetPosition(position);
    effect_target_alt = position[1];
    position[1] += 50.0f;
    parts[parts_id].SetPosition(position);
    effect_alt = position[1];
    effect_step = (effect_target_alt - effect_alt) / effect_count;
}

INCLUDE_ASM("asm/nonmatchings/editground", EffectTask__11CEditGroundFv);

int CEditGround::SetFocusParts(float x, float y, float z) {
    focus_parts_id = -1;
    int area = GetAreaCode(x, y, z);
    if (area < 0) {
        return -1;
    }
    CEditArea *edit_area = areas[area];
    int parts_id = edit_area->SearchPartsID(x, y, z);
    if (parts_id < 0) {
        return -1;
    }
    CMapParts *focus = &parts[parts_id];
    if (CheckDelete(edit_area, focus, x, y, z)) {
        return -1;
    }
    focus_parts_id = GetPartsID(x, y, z);
    return focus_parts_id;
}

INCLUDE_ASM("asm/nonmatchings/editground", EditAreaClip__11CEditGroundFP7CCameraf);
INCLUDE_ASM("asm/nonmatchings/editground", GetRandomPlanePos__11CEditGroundFPfPA4_fiPf);
INCLUDE_ASM("asm/nonmatchings/editground", GetNearParts__11CEditGroundFPP9CMapPartsiP7CBoxVu0P7CBoxVu0);

void CEditGround::MakePartsBox() {
    for (int i = 0; i < 4; i++) {
        if (areas[i] != NULL) {
            areas[i]->MakePartsBox();
        }
    }
}

void CEditGround::GetPartsBox(CBoxVu0 *out_box, float x, float y, float z) {
    int area = GetAreaCode(x, y, z);
    if (area < 0) {
        out_box->max[0] = out_box->max[1] = out_box->max[2] = 0.0f;
        out_box->max[3] = 1.0f;
        out_box->min[0] = out_box->min[1] = out_box->min[2] = 0.0f;
        out_box->min[3] = 1.0f;
        return;
    }
    if (areas[area] != NULL) {
        areas[area]->GetPartsBox(out_box);
    }
}

INCLUDE_ASM("asm/nonmatchings/editground", GetPeoplePos__11CEditGroundFiPf);

void CEditGround::DrawBaseGround() {
    for (int i = 0; i < 4; i++) {
        if (areas[i] == NULL) {
            break;
        }
        areas[i]->DrawGrid();
    }
}

INCLUDE_ASM("asm/nonmatchings/editground", Draw__11CEditGroundFfiiiii);
INCLUDE_ASM("asm/nonmatchings/editground", StepWater__11CEditGroundFv);
INCLUDE_ASM("asm/nonmatchings/editground", DrawWaterSurface__11CEditGroundFP7CCamera);
INCLUDE_ASM("asm/nonmatchings/editground", DrawWater__11CEditGroundFi);
INCLUDE_ASM("asm/nonmatchings/editground", DrawRipple__11CEditGroundFi);
INCLUDE_ASM("asm/nonmatchings/editground", DrawShadow__11CEditGroundFiff);
INCLUDE_ASM("asm/nonmatchings/editground", DrawPartsCursor__11CEditGroundFiPfPfiPfi);
INCLUDE_RODATA("asm/nonmatchings/editground", @1207);
INCLUDE_ASM("asm/nonmatchings/editground", DrawEffect__11CEditGroundFP13CCameraFollowfP12CEffectGroup);
INCLUDE_ASM("asm/nonmatchings/editground", Save__11CEditGroundFPc);
INCLUDE_RODATA("asm/nonmatchings/editground", @1263);
INCLUDE_ASM("asm/nonmatchings/editground", Load__11CEditGroundFPc);
INCLUDE_RODATA("asm/nonmatchings/editground", @1325);
INCLUDE_ASM("asm/nonmatchings/editground", Save__11CEditGroundFiP9CSaveData);
INCLUDE_ASM("asm/nonmatchings/editground", Load__11CEditGroundFiP9CSaveData);

int CEditGround::PickUpPoly(CCPoly *polygons, float x, float y, float z) {
    CBoxVu0 box;

    box.max[0] = x + 30.0f;
    box.min[0] = x - 30.0f;
    box.max[2] = z + 30.0f;
    box.min[2] = z - 30.0f;
    box.max[1] = y + 100.0f;
    box.min[1] = y - 100.0f;
    return PickUpPoly(polygons, box, 0);
}

INCLUDE_ASM("asm/nonmatchings/editground", PickUpPoly__11CEditGroundFP6CCPoly7CBoxVu0i);
INCLUDE_ASM("asm/nonmatchings/editground", PickUpEditAreaPoly__11CEditGroundFP6CCPolyfff);
INCLUDE_ASM("asm/nonmatchings/editground", PickUpCameraPoly__11CEditGroundFP6CCPolyR7CBoxVu0i);
INCLUDE_ASM("asm/nonmatchings/editground", Clear__11CEditGroundFv);
INCLUDE_ASM("asm/nonmatchings/editground", Initialize__11CEditGroundFv);
INCLUDE_ASM("asm/nonmatchings/editground", RemakeGrid__11CEditGroundFv);
INCLUDE_ASM("asm/nonmatchings/editground", __ct__11CEditGroundFv);
/**
 * Constructs the water surface of one ground tile.
 *
 * @mangled __ct__12CGroundWaterFv
 * @address 0x1A5AE0
 * @size 0x34
 */
INCLUDE_ASM("asm/nonmatchings/editground", __ct__12CGroundWaterFv);
/**
 * Reports whether a part may be replaced by the one being placed over it.
 *
 * @mangled CheckDelete__FP9CEditAreaP9CMapPartsfff
 * @address 0x1A5B20
 * @size 0x18C
 */
static int CheckDelete(CEditArea *area, CMapParts *parts, float x, float y, float z) {
    CVector3_i_ position;

    area->GetPos(&position, x, y, z);
    int column = position.x;
    int row = position.z;
    int kind = parts->unk_118;
    switch (area->GetMapNo()) {
        case 1:
            if (kind == 3) {
                break;
            }
            switch (area->GetAreaID()) {
                case 0:
                    if (column == 5 && row == 0) {
                        return 1;
                    }
                    if (column == 2 && row == 7) {
                        return 1;
                    }
                    break;
                case 1:
                    if (column == 3 && row == 5) {
                        return 1;
                    }
                    if (column == 11 && row == 3) {
                        return 1;
                    }
                    break;
                case 2:
                    if (column == 4 && row == 0) {
                        return 1;
                    }
                    if (column == 3 && row == 7) {
                        return 1;
                    }
                    break;
            }
            break;
    }
    return 0;
}

INCLUDE_ASM("asm/nonmatchings/editground", Draw__12CPartsCursorFPfii);
INCLUDE_ASM("asm/nonmatchings/editground", RequestCheck__11CEditGroundFv);
INCLUDE_ASM("asm/nonmatchings/editground", CheckPartsRect__11CEditGroundFiiR8CRect_i_);
INCLUDE_ASM("asm/nonmatchings/editground", GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi);
INCLUDE_ASM("asm/nonmatchings/editground", GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsii);
INCLUDE_ASM("asm/nonmatchings/editground", GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii);
INCLUDE_ASM("asm/nonmatchings/editground", NornRequest__11CEditGroundFPA64_P9CMapParts);
INCLUDE_ASM("asm/nonmatchings/editground", MatatagiRequest__11CEditGroundFPA64_P9CMapParts);
INCLUDE_ASM("asm/nonmatchings/editground", QueensRequest__11CEditGroundFPA64_P9CMapParts);

/**
 * Reports whether one part, turned by a quarter-turn offset, faces the same direction as another.
 *
 * @mangled CheckRot__FP9CMapPartsP9CMapPartsi
 * @address 0x1A7890
 * @size 0x8C
 */
static int CheckRot(CMapParts *parts, CMapParts *other, int rotation_offset) {
    int other_rotation;
    int rotation;

    if (parts == NULL || other == NULL) {
        return 0;
    }

    rotation = rotation_offset + parts->GetRotY();
    other_rotation = other->GetRotY();
    if (rotation > 2) {
        rotation -= 4;
    }
    if (rotation < -1) {
        rotation += 4;
    }
    return rotation == other_rotation;
}

INCLUDE_ASM("asm/nonmatchings/editground", MuskaRequest__11CEditGroundFPA64_P9CMapParts);
INCLUDE_ASM("asm/nonmatchings/editground", YellowRequest__11CEditGroundFPA64_P9CMapParts);
INCLUDE_RODATA("asm/nonmatchings/editground", @2120);
