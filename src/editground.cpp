#include "editground.hpp"

#include <cstdlib>
#include <cstring>

#include "camerafollow.hpp"
#include "dataread.hpp"
#include "editarea.hpp"
#include "editpartsinfo.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "mapparts.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "objanime.hpp"
#include "rect.hpp"
#include "savedata.hpp"
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

int CEditGround::GetNearParts(CMapParts **out_parts, int limit, CBoxVu0 *box, CBoxVu0 *fixed_box) {
    int i;
    int count = 0;
    CMapParts *object = parts;

    for (i = 0; i < 128; i++, object++) {
        if (object->unk_0E8 < 0) {
            continue;
        }
        if (!object->CheckBox(box)) {
            continue;
        }
        if (count >= limit) {
            return count;
        }
        *out_parts++ = object;
        count++;
    }
    if (fixed_box == NULL) {
        fixed_box = box;
    }
    for (i = 0; i < 64; i++) {
        if (fixed_parts[i].unk_0E8 < 0) {
            continue;
        }
        CMapParts *fixed = &fixed_parts[i];
        if (!fixed->CheckBox2(fixed_box)) {
            continue;
        }
        if (count >= limit) {
            return count;
        }
        *out_parts++ = fixed;
        count++;
    }
    return count;
}

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

EPARTS_FUNC_DATA *CEditGround::GetPeoplePos(int villager, float *out_position) {
    sceVu0FVECTOR rotation;
    sceVu0FVECTOR frame_rotation;

    for (int i = 0; i < people_count; i++) {
        EPARTS_FUNC_DATA *marker = people[i];
        if (marker->kind != 1 || marker->link_id != villager) {
            continue;
        }
        CMapParts *owner = marker->parts;
        if (owner->parts_no >= 0) {
            owner = GetPartsObject(owner->parts_no);
        }
        if (owner == NULL) {
            return NULL;
        }
        sceVu0CopyVector(out_position, marker->position);
        CFrameVu1 *frame = owner->frame[0];
        if (frame == NULL) {
            return NULL;
        }
        owner->GetPosition(rotation);
        frame->SetPosition(rotation);
        owner->GetRotation(rotation);
        frame->SetRotation(rotation[0], rotation[1], rotation[2]);
        out_position[3] = 1.0f;
        frame->GetWorldPosition(out_position, out_position);
        frame->GetRotation(frame_rotation);
        out_position[3] = AngleLimit(frame_rotation[1] + marker->rotation[1]);
        return marker;
    }
    return NULL;
}

void CEditGround::DrawBaseGround() {
    for (int i = 0; i < 4; i++) {
        if (areas[i] == NULL) {
            break;
        }
        areas[i]->DrawGrid();
    }
}

INCLUDE_ASM("asm/nonmatchings/editground", Draw__11CEditGroundFfiiiii);

void CEditGround::StepWater() {
    int i;
    int j;
    CGroundWater *surface = water_surfaces;

    for (i = 0; i < 4; i++, surface++) {
        if (surface->draw == 0) {
            continue;
        }
        if (surface->water.CheckClip()) {
            continue;
        }
        for (j = 0; j < 4; j++) {
            if (surface->ripples[j].power == 0.0f && surface->ripples[j].range == 0.0f) {
                break;
            }
            int row = surface->ripples[j].row;
            int column = surface->ripples[j].column;
            if (row < 0) {
                int rows = surface->water.rows;
                row = rows * (float) rand() / 2.1474836e9f;
            }
            if (column < 0) {
                int rows = surface->water.rows;
                column = rows * (float) rand() / 2.1474836e9f;
            }
            surface->water.Shake(row, column,
                                 surface->ripples[j].power +
                                     surface->ripples[j].range * (float) rand() / 2.1474836e9f);
        }
        surface->water.Hamon();
    }
}

INCLUDE_ASM("asm/nonmatchings/editground", DrawWaterSurface__11CEditGroundFP7CCamera);
INCLUDE_ASM("asm/nonmatchings/editground", DrawWater__11CEditGroundFi);
INCLUDE_ASM("asm/nonmatchings/editground", DrawRipple__11CEditGroundFi);
INCLUDE_ASM("asm/nonmatchings/editground", DrawShadow__11CEditGroundFiff);
INCLUDE_ASM("asm/nonmatchings/editground", DrawPartsCursor__11CEditGroundFiPfPfiPfi);
INCLUDE_RODATA("asm/nonmatchings/editground", @1207);

void CEditGround::DrawEffect(CCameraFollow *camera, float time, CEffectGroup *effects) {
    sceVu0FVECTOR position;
    int i;
    CMapParts *object = parts;

    for (i = 0; i < 128; i++, object++) {
        if (object->unk_0F4 >= 0 && unk_00014[object->unk_0F4] == 0) {
            continue;
        }
        if (!(clip_plane[3] <= 0.0f)) {
            object->GetPosition(position);
            if (!(DistVector(position, clip_plane) <= clip_plane[3])) {
                continue;
            }
        }
        object->DrawEffect(camera, time, effects);
    }
    for (i = 0; i < 64; i++) {
        fixed_parts[i].DrawEffect(camera, time, effects);
    }
}

void CEditGround::Save(char *) {
    char buffer[4000];
    sceVu0FVECTOR position;
    GROUND_SAVE_HEADER *header = (GROUND_SAVE_HEADER *) buffer;
    SV_GRD_PART *record = (SV_GRD_PART *) (header + 1);

    header->offset = sizeof(GROUND_SAVE_HEADER);
    header->count = 0;
    for (int i = 0; i < 128; i++) {
        CMapParts *object = &parts[i];
        int parts_id = parts[i].unk_0E8;
        if (parts_id < 0) {
            continue;
        }
        int j;
        int kind = object->unk_118;
        if (kind > 0) {
            for (j = 0; j < 24; j++) {
                if (kind == plot_parts[j].unk_118) {
                    parts_id = plot_parts[j].unk_0E8;
                    break;
                }
            }
        }
        object->GetPosition(position);
        record->part_id = parts_id;
        record->variant = object->rot_y;
        record->pos_x = position[0];
        record->pos_y = position[1];
        record->pos_z = position[2];
        record++;
        header->count++;
    }
    record->part_id = -1;
    record->variant = -1;
    record->pos_x = 0.0f;
    record->pos_y = 0.0f;
    record->pos_z = 0.0f;
    header->size = (char *) (record + 1) - buffer;
    WriteFile("host0:y:/ps2/dc_data/gdata0.edt", buffer, header->size);
}

INCLUDE_ASM("asm/nonmatchings/editground", Load__11CEditGroundFPc);
INCLUDE_RODATA("asm/nonmatchings/editground", @1325);

void CEditGround::Save(int town, CSaveData *save) {
    sceVu0FVECTOR position;
    int count;
    int i;

    SV_GRD_PART *record = save->GetParts(town, &count);
    if (record == NULL) {
        return;
    }
    for (i = 0; i < 128; i++) {
        CMapParts *object = &parts[i];
        int parts_id = parts[i].unk_0E8;
        if (parts_id < 0) {
            continue;
        }
        int j;
        int kind = object->unk_118;
        switch (kind) {
            case 1:
            case 2:
            case 3:
                for (j = 0; j < 24; j++) {
                    if (kind == plot_parts[j].unk_118) {
                        parts_id = plot_parts[j].unk_0E8;
                        break;
                    }
                }
                break;
        }
        object->GetPosition(position);
        record->part_id = parts_id;
        record->variant = object->rot_y;
        record->pos_x = position[0];
        record->pos_y = position[1];
        record->pos_z = position[2];
        record++;
    }
    record->part_id = -1;
    record->variant = -1;
    record->pos_x = 0.0f;
    record->pos_y = 0.0f;
    record->pos_z = 0.0f;
}

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

int CEditGround::PickUpPoly(CCPoly *out_polygons, CBoxVu0 box, int flags) {
    int i;
    int count = 0;
    CCPoly *polygons = out_polygons;
    CMapParts *object = parts;
    int found;
    CFrame *frame;

    for (i = 0; i < 128; i++, object++) {
        if (object->unk_0E8 < 0) {
            continue;
        }
        if (flags != 0 && object->unk_118 == 0) {
            continue;
        }
        frame = object->GetCollisionFrame();
        if (frame == NULL) {
            continue;
        }
        if (!object->CheckBox(&box)) {
            continue;
        }
        found = frame->PickUpNearPoly(polygons, box);
        polygons += found;
        count += found;
    }
    for (i = 0; i < 64; i++) {
        if (fixed_parts[i].unk_0E8 < 0) {
            continue;
        }
        CMapParts *fixed = &fixed_parts[i];
        frame = fixed->GetCollisionFrame();
        if (frame == NULL) {
            continue;
        }
        if (!fixed->CheckBox2(&box)) {
            continue;
        }
        found = frame->PickUpNearPoly(polygons, box);
        polygons += found;
        count += found;
    }
    for (i = 0; i < 4; i++) {
        if (areas[i] != NULL) {
            found = areas[i]->PickUpPoly(polygons, box);
            polygons += found;
            count += found;
        }
    }
    return count;
}

int CEditGround::PickUpEditAreaPoly(CCPoly *polygons, float x, float y, float z) {
    int area = GetAreaCode(x, y, z);
    if (area < 0) {
        return 0;
    }
    return areas[area]->PickUpPoly(polygons, x, y, z);
}

INCLUDE_ASM("asm/nonmatchings/editground", PickUpCameraPoly__11CEditGroundFP6CCPolyR7CBoxVu0i);

void CEditGround::Clear() {
    int i;

    for (i = 0; i < 128; i++) {
        parts[i].Initialize();
    }
    for (i = 0; i < 4; i++) {
        if (areas[i] != NULL) {
            areas[i]->Clear();
        }
        unk_00014[i] = 1;
    }
    effect_count = -1;
    effect_parts_id = -1;
    effect_alt = 0.0f;
    effect_target_alt = 0.0f;
    effect_step = 0.0f;
    if (parts_info != NULL) {
        parts_info->Clear();
    }
    if (map_no == 1) {
        CVector3_f_ position;
        EDITPARTS_INFO *info = parts_info->GetPartsInfo(16);
        int saved = info->unk_08;

        info->unk_18 += 6;
        info->unk_08 = 0;
        areas[0]->GetPos(&position, 5, 0, 0);
        SetMapParts(16, position.x, position.y, position.z, 0);
        areas[0]->GetPos(&position, 2, 0, 7);
        SetMapParts(16, position.x, position.y, position.z, 0);
        areas[1]->GetPos(&position, 3, 0, 5);
        SetMapParts(16, position.x, position.y, position.z, 0);
        areas[1]->GetPos(&position, 11, 0, 3);
        SetMapParts(16, position.x, position.y, position.z, 0);
        areas[2]->GetPos(&position, 4, 0, 0);
        SetMapParts(16, position.x, position.y, position.z, 0);
        areas[2]->GetPos(&position, 3, 0, 7);
        SetMapParts(16, position.x, position.y, position.z, 0);
        info->unk_0C = 0;
        info->unk_18 -= 6;
        info->unk_08 = saved;
    }
}

void CEditGround::Initialize() {
    map_no = 0;
    plot_parts = NULL;
    river_parts = NULL;
    road_parts = NULL;
    parts_info = NULL;
    for (int area = 0; area < 4; area++) {
        areas[area] = NULL;
        unk_00014[area] = 1;
    }
    int i;
    for (i = 0; i < 64; i++) {
        fixed_parts[i].Initialize();
    }
    for (i = 0; i < 1; i++) {
        unk_20740[i] = 0;
    }
    for (i = 0; i < 4; i++) {
        water_surfaces[i].draw = 0;
    }
    for (i = 0; i < 128; i++) {
        people[i] = NULL;
    }
    people_count = 0;
    suppress_water = 0;
    Clear();
    clip_plane[3] = -1.0f;
}

void CEditGround::RemakeGrid() {
    for (int i = 0; i < 4; i++) {
        if (areas[i] != NULL) {
            areas[i]->grid_redraw = 1;
        }
    }
}

CEditGround::CEditGround() {
    unk_20744 = 0;
    people[0] = NULL;
    unk_20750 = 0;
    unk_2074c = 0;
    unk_20748 = 1.0f;
    Initialize();
}

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

void CPartsCursor::Draw(float *position, int width, int height) {
    sceVu0FVECTOR cell;
    sceVu0FVECTOR corner;
    int i;
    int j;
    int columns = width * 2;
    int rows = height * 2;

    sceVu0CopyVector(corner, position);
    corner[0] -= 0.5f * (unit_size * width);
    corner[2] -= 0.5f * (unit_size * height);
    corner[0] += 0.25f * unit_size;
    corner[2] += 0.25f * unit_size;
    sceVu0CopyVector(cell, corner);
    for (i = 0; i < columns; i++) {
        cell[2] = corner[2];
        for (j = 0; j < rows; j++) {
            int piece = 2;
            int turn = 0;
            if (i == 0 && j == 0) {
                piece = 0;
            }
            if (i > 0 && i < columns - 1 && j == 0) {
                piece = 1;
                turn = 2;
            }
            if (i == columns - 1 && j == 0) {
                piece = 0;
                turn = -1;
            }
            if (i == columns - 1 && j > 0 && j < rows - 1) {
                piece = 1;
                turn = 1;
            }
            if (i == columns - 1 && j == rows - 1) {
                piece = 0;
                turn = 2;
            }
            if (i > 0 && i < columns - 1 && j == rows - 1) {
                piece = 1;
                turn = 0;
            }
            if (i == 0 && j == rows - 1) {
                piece = 0;
                turn = 1;
            }
            if (i == 0 && j > 0 && j < rows - 1) {
                piece = 1;
                turn = -1;
            }
            pieces[piece]->SetPosition(cell);
            pieces[piece]->SetRotation(0.0f, 1.5707964f * turn, 0.0f);
            float scale = unit_size / 100.0f;
            pieces[piece]->SetScale(scale, scale, scale);
            MGDraw(pieces[piece]);
            cell[2] += 0.5f * unit_size;
        }
        cell[0] += 0.5f * unit_size;
    }
}

void CEditGround::RequestCheck() {
    CMapParts *plot_parts[24][64];
    int plot_count[24];
    int i;

    memset(plot_parts, 0, sizeof(plot_parts));
    CMapParts *object = parts;
    for (i = 0; i < 24; i++) {
        plot_count[i] = 0;
        parts_info->request[i] = 0;
    }
    for (i = 0; i < 128; i++, object++) {
        if (object->unk_0E8 >= 0) {
            int plot = object->parts_no;
            if (plot >= 0 && plot < 24) {
                plot_parts[plot][plot_count[plot]++] = object;
            }
        }
    }
    switch (map_no) {
        case 0:
            NornRequest(plot_parts);
            break;
        case 1:
            MatatagiRequest(plot_parts);
            break;
        case 2:
            QueensRequest(plot_parts);
            break;
        case 3:
            MuskaRequest(plot_parts);
            break;
        case 4:
            YellowRequest(plot_parts);
            break;
    }
    for (i = 0; i < 24; i++) {
        if (!parts_info->CheckComplete(i)) {
            parts_info->request[i] = 0;
        }
    }
}

int CEditGround::CheckPartsRect(int parts_no, int area, CRect_i_ &rect) {
    int parts_ids[256];

    if (area < 0 || area >= 4) {
        return 0;
    }
    if (areas[area] == NULL) {
        return 0;
    }
    int count = areas[area]->GetPartsRect(rect, parts_ids, 256);
    for (int i = 0; i < count; i++) {
        if (parts[parts_ids[i]].parts_no == parts_no) {
            return 1;
        }
    }
    return 0;
}

void CEditGround::GetRectParts(CRect_i_ *rect, CMapParts *target, int margin) {
    sceVu0FVECTOR position;
    CVector3_i_ grid;

    *rect = CRect_i_(0, 0, 0, 0);
    if (target == NULL) {
        return;
    }
    target->GetPosition(position);
    int area = GetAreaCode(position[0], position[1], position[2]);
    if (area < 0 || area >= 4) {
        return;
    }
    if (areas[area] == NULL) {
        return;
    }
    areas[area]->GetPos(&grid, position[0], position[1], position[2]);
    int width = target->GetWidth();
    int height = target->GetHeight();
    int half_width = width >> 1;
    rect->x = grid.x - half_width - margin;
    int half_height = height >> 1;
    rect->y = grid.z - half_height - margin;
    rect->width = width + margin * 2;
    rect->height = height + margin * 2;
}

void CEditGround::GetRectParts(CRect_i_ *rect, CMapParts *target, int column, int row) {
    sceVu0FVECTOR position;
    CVector3_i_ grid;
    int width;
    int height;
    int rot_y;
    int offset_x;
    int offset_z;

    *rect = CRect_i_(0, 0, 0, 0);
    if (target == NULL) {
        return;
    }
    target->GetPosition(position);
    int area = GetAreaCode(position[0], position[1], position[2]);
    if (area < 0 || area >= 4) {
        return;
    }
    if (areas[area] == NULL) {
        return;
    }
    areas[area]->GetPos(&grid, position[0], position[1], position[2]);
    rot_y = target->GetRotY();
    target->SetRotY(0);
    width = target->GetWidth();
    height = target->GetHeight();
    target->SetRotY(rot_y);
    column -= width >> 1;
    row -= height >> 1;
    int adjust_x = 0;
    int adjust_z = 0;
    // A part with an even side has no centre cell, so turning it shifts the cells by one.
    if (width % 2 == 1 && height % 2 == 0) {
        if (rot_y == -1) {
            adjust_x = -1;
        }
        if (rot_y == 2) {
            adjust_z = -1;
        }
    }
    if (width % 2 == 0 && height % 2 == 1) {
        if (rot_y == 1) {
            adjust_z = -1;
        }
        if (rot_y == 2) {
            adjust_x = -1;
        }
    }
    if (width % 2 == 0 && height % 2 == 0) {
        if (rot_y == -1) {
            adjust_x = -1;
        }
        if (rot_y == 1) {
            adjust_z = -1;
        }
        if (rot_y == 2) {
            adjust_x = -1;
            adjust_z = -1;
        }
    }
    switch (target->GetRotY()) {
        case 0:
            offset_x = column;
            offset_z = row;
            break;
        case 1:
            offset_x = row;
            offset_z = -column;
            break;
        case 2:
            offset_x = -column;
            offset_z = -row;
            break;
        case -1:
            offset_x = -row;
            offset_z = column;
            break;
    }
    rect->x = grid.x + offset_x + adjust_x;
    rect->y = grid.z + offset_z + adjust_z;
    rect->width = 1;
    rect->height = 1;
}

INCLUDE_ASM("asm/nonmatchings/editground", GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii);

void CEditGround::NornRequest(CMapParts *(*plot_parts)[64]) {
    parts_info->unk_00 = 8;
    if (areas[0] == NULL) {
        return;
    }
    if (plot_parts[0][0] != NULL && plot_parts[0][0]->GetRotY() == 1) {
        parts_info->request[0] = 1;
    }
    if (plot_parts[1][0] != NULL) {
        if (CheckPartsRect(1, 0, CRect_i_(10, 0, 4, 5))) {
            parts_info->request[1] = 1;
        }
    }
    if (plot_parts[2][0] != NULL) {
        if (!CheckPartsRect(2, 0, CRect_i_(2, 8, 9, 4))) {
            parts_info->request[2] = 1;
        }
    }
    if (plot_parts[3][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[12][0], 2);
        if (CheckPartsRect(3, 0, rect)) {
            parts_info->request[3] = 1;
        }
    }
    if (plot_parts[4][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[6][0], 4);
        if (CheckPartsRect(4, 0, rect)) {
            parts_info->request[4] = 1;
        }
    }
    if (plot_parts[5][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectDirParts(&rect, plot_parts[8][0], 2, 4);
        if (CheckPartsRect(5, 0, rect) && SaveData->GetGameIntFlag(0) >= 100) {
            parts_info->request[5] = 1;
        }
    }
    if (plot_parts[6][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[1][0], 4);
        if (!CheckPartsRect(6, 0, rect)) {
            parts_info->request[6] = 1;
        }
    }
    if (plot_parts[7][0] != NULL) {
        int parts_ids[256];
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[7][0], 4);
        int count = areas[0]->GetPartsRect(rect, parts_ids, 256);
        int houses = 0;
        for (int i = 0; i < count; i++) {
            if (parts[parts_ids[i]].parts_no < 7) {
                houses++;
            }
            if (houses >= 2) {
                parts_info->request[7] = 1;
                break;
            }
        }
    }
}

void CEditGround::MatatagiRequest(CMapParts *(*plot_parts)[64]) {
    parts_info->unk_00 = 10;
    if (areas[0] == NULL || areas[1] == NULL || areas[2] == NULL) {
        return;
    }
    areas[0]->ChainWorkClear();
    int chained = areas[0]->CheckRiverChain(5, 0, 2, 7);
    areas[1]->ChainWorkClear();
    chained &= areas[1]->CheckRiverChain(3, 5, 11, 3);
    areas[2]->ChainWorkClear();
    chained &= areas[2]->CheckRiverChain(4, 0, 3, 7);
    if (chained) {
        parts_info->request[16] = 1;
    }
    if (plot_parts[0][0] != NULL) {
        if (CheckPartsRect(0, 0, CRect_i_(0, 0, 4, 1))) {
            parts_info->request[0] = 1;
        }
        if (CheckPartsRect(0, 1, CRect_i_(0, 5, 1, 1))) {
            parts_info->request[0] = 1;
        }
    }
    if (plot_parts[1][0] != NULL) {
        int parts_ids[256];
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[1][0], 1);
        int count = areas[plot_parts[1][0]->unk_0F4]->GetPartsRect(rect, parts_ids, 256);
        int found = 0;
        for (int i = 0; i < count; i++) {
            if (parts[parts_ids[i]].parts_no == 15) {
                found++;
            }
            if (found >= 4) {
                parts_info->request[1] = 1;
                break;
            }
        }
    }
    if (plot_parts[2][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[2][0], 3);
        int area = plot_parts[2][0]->unk_0F4;
        if (CheckPartsRect(11, area, rect)) {
            parts_info->request[2] = 1;
        }
        if (CheckPartsRect(12, area, rect)) {
            parts_info->request[2] = 1;
        }
        if (CheckPartsRect(13, area, rect)) {
            parts_info->request[2] = 1;
        }
    }
    if (plot_parts[3][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[3][0], 4);
        int area = plot_parts[3][0]->unk_0F4;
        if (CheckPartsRect(14, area, rect)) {
            parts_info->request[3] = 1;
        }
    }
    if (plot_parts[4][0] != NULL) {
        if (CheckPartsRect(4, 2, CRect_i_(0, 5, 7, 3))) {
            parts_info->request[4] = 1;
        }
    }
    if (plot_parts[5][0] != NULL) {
        sceVu0FVECTOR position;
        plot_parts[5][0]->GetPosition(position);
        if (GetAlt_i(position[0], position[1], position[2]) > 0) {
            parts_info->request[5] = 1;
        }
    }
    if (plot_parts[6][0] != NULL && plot_parts[3][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[3][0], 3);
        if (CheckPartsRect(6, plot_parts[3][0]->unk_0F4, rect)) {
            parts_info->request[6] = 1;
        }
    }
    if (plot_parts[7][0] != NULL) {
        sceVu0FVECTOR position;
        plot_parts[7][0]->GetPosition(position);
        if (GetAlt_i(position[0], position[1], position[2]) > 0) {
            parts_info->request[7] = 1;
        }
    }
    if (plot_parts[14][0] != NULL) {
        int parts_ids[256];
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[14][0], 1);
        int count = areas[plot_parts[14][0]->unk_0F4]->GetPartsRect(rect, parts_ids, 256);
        int found = 0;
        for (int i = 0; i < count; i++) {
            int parts_no = parts[parts_ids[i]].parts_no;
            if (parts_no == 16) {
                found++;
            }
            if (parts_no == 17) {
                found++;
            }
            if (parts_no == 11) {
                found++;
            }
            if (parts_no == 12) {
                found++;
            }
            if (parts_no == 13) {
                found++;
            }
            if (found >= 14) {
                parts_info->request[14] = 1;
                break;
            }
        }
    }
}

void CEditGround::QueensRequest(CMapParts *(*plot_parts)[64]) {
    parts_info->unk_00 = 10;
    if (areas[0] == NULL || areas[1] == NULL || areas[2] == NULL) {
        return;
    }
    if (plot_parts[0][0] != NULL) {
        if (CheckPartsRect(0, 1, CRect_i_(0, 0, 1, 7))) {
            parts_info->request[0] = 1;
        }
        if (CheckPartsRect(0, 2, CRect_i_(0, 0, 1, 8))) {
            parts_info->request[0] = 1;
        }
    }
    if (plot_parts[1][0] != NULL && plot_parts[10][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[10][0], 3);
        if (CheckPartsRect(1, plot_parts[10][0]->unk_0F4, rect)) {
            parts_info->request[1] = 1;
        }
    }
    if (plot_parts[2][0] != NULL && plot_parts[8][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 2);
        if (CheckPartsRect(2, plot_parts[8][0]->unk_0F4, rect)) {
            parts_info->request[2] = 1;
        }
    }
    if (plot_parts[3][0] != NULL && plot_parts[1][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[1][0], 2);
        if (CheckPartsRect(3, plot_parts[1][0]->unk_0F4, rect)) {
            parts_info->request[3] = 1;
        }
    }
    if (plot_parts[4][0] != NULL) {
        if (plot_parts[9][0] == NULL) {
            parts_info->request[4] = 1;
        } else if (plot_parts[4][0]->unk_0F4 != plot_parts[9][0]->unk_0F4) {
            parts_info->request[4] = 1;
        }
    }
    if (plot_parts[5][0] != NULL && plot_parts[5][0]->GetRotY() == 0) {
        parts_info->request[5] = 1;
    }
    if (plot_parts[6][0] != NULL && plot_parts[11][0] != NULL && plot_parts[6][0]->GetRotY() == -1) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[11][0], 3);
        if (CheckPartsRect(6, plot_parts[11][0]->unk_0F4, rect)) {
            parts_info->request[6] = 1;
        }
    }
    if (plot_parts[7][0] != NULL && plot_parts[7][0]->unk_0F4 == 0) {
        parts_info->request[7] = 1;
    }
    if (plot_parts[8][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 0, 3);
        if (CheckPartsRect(13, plot_parts[8][0]->unk_0F4, rect)) {
            parts_info->request[8] = 1;
        }
    }
    if (plot_parts[9][0] != NULL && plot_parts[8][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 1);
        if (CheckPartsRect(9, plot_parts[8][0]->unk_0F4, rect)) {
            parts_info->request[9] = 1;
        }
    }
}

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

void CEditGround::MuskaRequest(CMapParts *(*plot_parts)[64]) {
    parts_info->unk_00 = 9;
    if (areas[0] == NULL) {
        return;
    }
    if (plot_parts[0][0] != NULL && plot_parts[8][0] != NULL) {
        if (CheckPartsRect(0, 0, CRect_i_(1, 0, 6, 3))) {
            CRect_i_ rect;
            rect.x = rect.y = rect.width = rect.height = 0;
            GetRectDirParts(&rect, plot_parts[0][0], 2, 14);
            if (CheckPartsRect(8, 0, rect) && CheckRot(plot_parts[0][0], plot_parts[8][0], 1) &&
                parts_info->GetCompEvent(0)) {
                parts_info->request[0] = 1;
            }
        }
    }
    if (plot_parts[1][0] != NULL && plot_parts[10][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectDirParts(&rect, plot_parts[1][0], 2, 14);
        if (CheckPartsRect(10, 0, rect) && CheckRot(plot_parts[1][0], plot_parts[10][0], 1)) {
            parts_info->request[1] = 1;
        }
    }
    if (plot_parts[2][0] != NULL && plot_parts[9][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectDirParts(&rect, plot_parts[2][0], 2, 14);
        if (CheckPartsRect(9, 0, rect) && CheckRot(plot_parts[2][0], plot_parts[9][0], 0)) {
            parts_info->request[2] = 1;
        }
    }
    if (plot_parts[3][0] != NULL && plot_parts[9][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[11][0], 2);
        if (CheckPartsRect(3, 0, rect)) {
            CRect_i_ dir_rect;
            dir_rect.x = dir_rect.y = dir_rect.width = dir_rect.height = 0;
            GetRectDirParts(&dir_rect, plot_parts[3][0], 2, 14);
            if (CheckPartsRect(9, 0, dir_rect) && CheckRot(plot_parts[3][0], plot_parts[9][0], 2)) {
                parts_info->request[3] = 1;
            }
        }
    }
    if (plot_parts[4][0] != NULL && plot_parts[9][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectDirParts(&rect, plot_parts[4][0], 2, 14);
        if (CheckPartsRect(9, 0, rect) && CheckRot(plot_parts[4][0], plot_parts[9][0], 1)) {
            parts_info->request[4] = 1;
        }
    }
    if (plot_parts[5][0] != NULL && plot_parts[10][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectDirParts(&rect, plot_parts[5][0], 2, 14);
        if (CheckPartsRect(10, 0, rect) && CheckRot(plot_parts[5][0], plot_parts[10][0], 0)) {
            parts_info->request[5] = 1;
        }
    }
    if (plot_parts[6][0] != NULL && plot_parts[8][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectDirParts(&rect, plot_parts[6][0], 2, 14);
        if (CheckPartsRect(8, 0, rect) && CheckRot(plot_parts[6][0], plot_parts[8][0], 0) &&
            plot_parts[6][0]->GetRotY() == 1) {
            parts_info->request[6] = 1;
        }
    }
    if (plot_parts[7][0] != NULL && plot_parts[8][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectDirParts(&rect, plot_parts[7][0], 2, 14);
        if (CheckPartsRect(8, 0, rect) && CheckRot(plot_parts[7][0], plot_parts[8][0], 2)) {
            parts_info->request[7] = 1;
        }
    }
    if (plot_parts[10][0] != NULL) {
        if (CheckPartsRect(10, 0, CRect_i_(2, 0, 3, 14)) && plot_parts[10][0]->GetRotY() == 0) {
            parts_info->request[10] = 1;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/editground", YellowRequest__11CEditGroundFPA64_P9CMapParts);
INCLUDE_RODATA("asm/nonmatchings/editground", @2120);
