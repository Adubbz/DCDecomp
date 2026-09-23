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
#ifdef NON_MATCHING // draft includes
#include <cmath>
#include "camera.hpp"
#endif

static int CheckDelete(CEditArea *area, CMapParts *parts, float x, float y, float z);

#ifdef NON_MATCHING
int CEditGround::SetMapParts(int plot, float x, float y, float z, int rot_y) {
    CVector3_f_ cell;
    sceVu0FVECTOR position;
    int removed_plot;
    int removed_rot;

    if (CheckEffect() != 0) {
        return -1;
    }
    if (plot < 0 || plot >= 24) {
        return -1;
    }
    if (plot_parts == NULL) {
        return -1;
    }
    CMapParts *source = &plot_parts[plot];
    if (source->handle < 0) {
        return -1;
    }
    int area_code = GetAreaCode(x, y, z);
    if (area_code < 0) {
        return -1;
    }
    CEditArea *area = areas[area_code];
    if (source->info == NULL) {
        return -1;
    }
    int fits = area->CheckParts(source, x, y, z, rot_y);
    CMapParts *slot = &parts[0];
    int id = -1;
    if (source->subtype == 5 || source->subtype == 3) {
        // A bridge or a crossing replaces the river or road piece beneath it.
        id = area->SearchPartsID(x, y, z);
        if (id >= 0 && CheckDelete(area, source, x, y, z) == 0) {
            if (parts[id].subtype != 2 || parts[id].subtype != 1) {
                if (!(parts[id].subtype == 2 && parts[id].handle == 1)) {
                    return -1;
                }
            }
            slot = &parts[id];
            rot_y = slot->GetRotY();
            if (source->subtype != 5) {
                source = &river_parts[6];
            }
            plot = source->parts_no;
        } else if (source->subtype != 1) {
            return -1;
        }
    } else if (fits == 0) {
        return -1;
    }
    if (parts_info != NULL) {
        EDITPARTS_INFO *info = parts_info->GetPartsInfo(plot);
        if (info != NULL) {
            if (info->placed == info->stock) {
                return -1;
            }
            info->placed++;
        }
    }
    if (id < 0) {
        for (id = 0; id < 128; id++, slot++) {
            if (slot->handle < 0) {
                break;
            }
        }
        if (id == 128) {
            return -1;
        }
    }
    if (fits != 0 && source->subtype != 1) {
        int width = source->GetWidth();
        int height = source->GetHeight();
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                float cell_x = x - (float) ((width >> 1) - i) * area->GetUnitSize();
                float cell_z = z - (float) ((height >> 1) - j) * area->GetUnitSize();
                if (area->SearchPartsExtra(cell_x, y, cell_z) == 1) {
                    DeleteMapParts(&removed_plot, &removed_rot, cell_x, y, cell_z);
                }
            }
        }
    }
    memcpy(slot, source, sizeof(CMapParts));
    slot->SetRotY(rot_y);
    area->GetGrid(&cell, x, y, z);
    int width = source->GetWidth();
    int height = source->GetHeight();
    if (width % 2 == 1) {
        cell.x += 0.5f * area->GetUnitSize();
    }
    if (height % 2 == 1) {
        cell.z += 0.5f * area->GetUnitSize();
    }
    cell.y = area->GetAlt(cell.x, cell.y, cell.z);
    slot->unit_size = area->GetUnitSize();
    position[0] = cell.x;
    position[1] = cell.y;
    position[2] = cell.z;
    position[3] = 1.0f;
    slot->SetPosition(position);
    slot->SetRotY(rot_y);
    slot->area = area_code;
    area->SetMapParts(id, parts, x, y, z, rot_y);
    if (slot->subtype == 2 && slot->handle != 6) {
        SetRiverParts(x, y, z, 0, 0);
        SetRiverParts(x, y, z, 1, 0);
        SetRiverParts(x, y, z, 0, 1);
        SetRiverParts(x, y, z, -1, 0);
        SetRiverParts(x, y, z, 0, -1);
    }
    if (slot->subtype == 1) {
        SetRoadParts(x, y, z, 0, 0);
        SetRoadParts(x, y, z, 1, 0);
        SetRoadParts(x, y, z, 0, 1);
        SetRoadParts(x, y, z, -1, 0);
        SetRoadParts(x, y, z, 0, -1);
    }
    return id;
}
#else
INCLUDE_ASM("asm/nonmatchings/editground", SetMapParts__11CEditGroundFifffi);
#endif

/**
 * Gives back the frame that a map part's shadow draws from.
 */
static inline CFrame *GetShadowFrame(CMapParts *parts) {
    return parts->shadow_frame;
}

/**
 * Gives back the frame that a map part's shade draws from.
 */
static inline CFrame *GetShadeFrame(CMapParts *parts) {
    return parts->shade_frame;
}

/**
 * Gives back the frame that a map part's ripple draws from.
 */
static inline CFrame *GetRippleFrame(CMapParts *parts) {
    return parts->unk_104;
}

/**
 * Puts a map part's camera collision frame where the part is and gives it back.
 */
static inline CFrame *GetCameraFrame(CMapParts *parts) {
    if (parts->unk_0DC == NULL) {
        return NULL;
    }
    parts->unk_0DC->SetPosition(parts->pos[0], parts->pos[1], parts->pos[2]);
    parts->unk_0DC->SetRotation(parts->rotation.x, parts->rotation.y, parts->rotation.z);
    return parts->unk_0DC;
}

int CEditGround::SetRiverParts(float x, float y, float z, int column_step, int row_step) {
    CVector3_i_ cell;
    CVector3_f_ position;
    int parts_no;
    int kind;

    int area_no = GetAreaCode(x, y, z);
    if (area_no < 0) {
        return 0;
    }
    CEditArea *area = areas[area_no];
    area->GetPos(&cell, x, y, z);
    cell.x += column_step;
    cell.z += row_step;
    int parts_id = area->GetPartsID(cell.x, cell.z);
    if (parts_id < 0) {
        return 0;
    }
    CMapParts *object = &parts[parts_id];
    int water = object->subtype;
    if ((water != 2 && water != 3 && water != 5) || river_parts == NULL) {
        return 0;
    }
    if (water == 3 || water == 5) {
        area->GetPos(&position, cell.x, cell.y, cell.z);
        DeleteMapParts(&parts_no, &kind, position.x + 1.0f, position.y, position.z + 1.0f);
    }
    int code = area->SetRiverParts(cell.x, cell.z);
    if (code < 0) {
        return 0;
    }
    int piece = (code & 0xFF0) >> 4;
    int rot_y = code & 0xF;
    if (piece - 1 < 0 || piece - 1 >= 16) {
        return 0;
    }
    if (rot_y >= 3) {
        rot_y = -1;
    }
    for (int i = 0; i < 4; i++) {
        CMapParts *river = &river_parts[(u32) (piece - 1)];
        CFrameVu1 *frame = river->frame[i];
        object->SetFrame(frame, i);
    }
    object->collision_frame = river_parts[(u32) (piece - 1)].GetCollisionFrame();
    object->shadow_frame = GetShadowFrame(&river_parts[(u32) (piece - 1)]);
    object->shade_frame = GetShadeFrame(&river_parts[(u32) (piece - 1)]);
    object->unk_0DC = GetCameraFrame(&river_parts[(u32) (piece - 1)]);
    object->unk_104 = GetRippleFrame(&river_parts[(u32) (piece - 1)]);
    object->handle = river_parts[(u32) (piece - 1)].handle;
    object->subtype = river_parts[(u32) (piece - 1)].subtype;
    object->bound = river_parts[(u32) (piece - 1)].bound;
    object->SetRotY(rot_y);
    return 1;
}

int CEditGround::SetRoadParts(float x, float y, float z, int column_step, int row_step) {
    CVector3_i_ cell;

    int area_no = GetAreaCode(x, y, z);
    if (area_no < 0) {
        return 0;
    }
    CEditArea *area = areas[area_no];
    area->GetPos(&cell, x, y, z);
    cell.x += column_step;
    cell.z += row_step;
    int parts_id = area->GetPartsID(cell.x, cell.z);
    if (parts_id < 0) {
        return 0;
    }
    CMapParts *object = &parts[parts_id];
    if (object->subtype != 1 || road_parts == NULL) {
        return 0;
    }
    int code = area->SetRoadParts(cell.x, cell.z);
    if (code < 0) {
        return 0;
    }
    int piece = (code & 0xFF0) >> 4;
    int rot_y = code & 0xF;
    if (piece - 1 < 0 || piece - 1 >= 6) {
        return 0;
    }
    if (rot_y >= 3) {
        rot_y = -1;
    }
    for (int i = 0; i < 4; i++) {
        CMapParts *road = &road_parts[(u32) (piece - 1)];
        CFrameVu1 *frame = road->frame[i];
        object->SetFrame(frame, i);
    }
    object->collision_frame = road_parts[(u32) (piece - 1)].GetCollisionFrame();
    object->SetRotY(rot_y);
    object->handle = road_parts[(u32) (piece - 1)].handle;
    object->subtype = road_parts[(u32) (piece - 1)].subtype;
    object->bound = road_parts[(u32) (piece - 1)].bound;
    return 1;
}

#ifdef NON_MATCHING
int CEditGround::DeleteMapParts(int *out_plot, int *out_rot_y, float x, float y, float z) {
    sceVu0FVECTOR position;

    int area_code = GetAreaCode(x, y, z);
    if (area_code < 0) {
        return -1;
    }
    CEditArea *area = areas[area_code];
    int id = area->SearchPartsID(x, y, z);
    if (id < 0) {
        return -1;
    }
    CMapParts *part = &parts[id];
    if (CheckDelete(area, part, x, y, z) != 0) {
        return -1;
    }
    if (part->subtype == 3 || part->subtype == 5) {
        // A bridge or a crossing leaves the plain river piece behind.
        int rot_y = part->GetRotY();
        part->GetPosition(position);
        int plot = part->parts_no;
        *out_plot = plot;
        memcpy(part, &river_parts[1], sizeof(CMapParts));
        part->SetPosition(position);
        part->SetRotY(rot_y);
        area->SetMapParts(id, parts, x, y, z, rot_y);
        if (parts_info != NULL) {
            EDITPARTS_INFO *info = parts_info->GetPartsInfo(plot);
            if (info != NULL) {
                info->placed--;
                if (info->placed < 0) {
                    info->placed = 0;
                }
            }
        }
        return id;
    }
    if (parts_info != NULL) {
        EDITPARTS_INFO *info = parts_info->GetPartsInfo(parts[id].parts_no);
        if (info != NULL) {
            info->placed--;
            if (info->placed < 0) {
                info->placed = 0;
            }
        }
    }
    part->GetPosition(position);
    area->DeleteMapParts(id, parts, 1.0f + position[0], position[1], 1.0f + position[2]);
    if (parts[id].subtype == 2) {
        SetRiverParts(position[0], position[1], position[2], 1, 0);
        SetRiverParts(position[0], position[1], position[2], 0, 1);
        SetRiverParts(position[0], position[1], position[2], -1, 0);
        SetRiverParts(position[0], position[1], position[2], 0, -1);
    }
    if (parts[id].subtype == 1) {
        SetRoadParts(position[0], position[1], position[2], 1, 0);
        SetRoadParts(position[0], position[1], position[2], 0, 1);
        SetRoadParts(position[0], position[1], position[2], -1, 0);
        SetRoadParts(position[0], position[1], position[2], 0, -1);
    }
    *out_plot = parts[id].parts_no;
    *out_rot_y = parts[id].rot_y;
    part->Initialize();
    parts[id].handle = -1;
    return id;
}
#else
INCLUDE_ASM("asm/nonmatchings/editground", DeleteMapParts__11CEditGroundFPiPifff);
#endif

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
        if (object->handle >= 0 && object->parts_no == parts_no) {
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
    if (parts[parts_id].subtype != 0) {
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

void CEditGround::EffectTask() {
    sceVu0FVECTOR position;
    int stop = effect_parts_id < 0 || effect_parts_id >= 128;
    stop = (bool) stop || effect_count <= 0;
    stop = (bool) stop || parts[effect_parts_id].handle < 0;
    if (stop) {
        effect_parts_id = -1;
        effect_count = -1;
        return;
    }
    effect_count--;
    parts[effect_parts_id].GetPosition(position);
    position[1] += effect_step;
    parts[effect_parts_id].SetPosition(position);
    if (effect_count <= 0) {
        position[1] = effect_target_alt;
        parts[effect_parts_id].SetPosition(position);
    }
}

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

#ifdef NON_MATCHING
/* The size of a number, whatever its sign. */
static inline float Magnitude(float value) {
    return value < 0.0f ? -value : value;
}

void CEditGround::EditAreaClip(CCamera *camera, float range) {
    sceVu0FVECTOR eye = {0.0f, 0.0f, 0.0f, 0.0f};
    sceVu0FVECTOR target;
    sceVu0FVECTOR view;
    sceVu0FVECTOR forward;
    float distance[4];
    float depth[4];
    CBoxVu0 box;
    sceVu0FVECTOR centre;
    sceVu0FVECTOR offset;
    sceVu0FVECTOR corner[4];
    int i;

    if (camera != NULL) {
        camera->GetPos(eye);
        camera->GetRef(target);
        sceVu0SubVector(view, target, eye);
        if (GetAreaCode(eye[0], eye[1], eye[2]) < 0) {
            sceVu0SubVector(forward, target, eye);
            forward[1] = 0.0f;
            sceVu0Normalize(forward, forward);
            sceVu0ScaleVector(forward, forward, 500.0f);
            sceVu0AddVector(target, eye, forward);
        }
    } else {
        sceVu0CopyVector(eye, target);
        sceVu0CopyVector(view, target);
    }
    for (i = 0; i < 4 && areas[i] != NULL; i++) {
        CEditArea *area = areas[i];
        area->GetOffset(box.min);
        box.min[1] -= 2.0f * area->GetUnitAlt();
        box.min[3] = 1.0f;
        sceVu0CopyVector(box.max, box.min);
        box.max[0] += area->GetUnitSize() * (float) area->GetWidth();
        box.max[1] += 32.0f * area->GetUnitAlt();
        box.max[2] += area->GetUnitSize() * (float) area->GetHeight();
        distance[i] = -1.0f;
        depth[i] = -1.0f;
        if (MGClipBox(&box) != 0) {
            area_visible[i] = 0;
            continue;
        }
        area_visible[i] = 1;
        sceVu0AddVector(centre, box.max, box.min);
        sceVu0ScaleVector(centre, centre, 0.5f);
        sceVu0SubVector(offset, centre, eye);
        depth[i] = sceVu0InnerProduct(offset, view);
        // The corners of the area on the ground, for the distance from the target to its edge.
        sceVu0CopyVector(corner[0], box.max);
        corner[0][1] = 0.0f;
        sceVu0CopyVector(corner[1], box.min);
        corner[1][1] = 0.0f;
        corner[2][0] = box.max[0];
        corner[2][1] = 0.0f;
        corner[2][2] = box.min[2];
        corner[3][0] = box.min[0];
        corner[3][1] = 0.0f;
        corner[3][2] = box.max[2];
        int side_x = 0;
        int side_z = 0;
        if (target[0] < box.min[0]) {
            side_x = -1;
        }
        if (target[0] > box.max[0]) {
            side_x = 1;
        }
        if (target[2] < box.min[2]) {
            side_z = -1;
        }
        if (target[2] > box.max[2]) {
            side_z = 1;
        }
        if (side_x < 0 && side_z < 0) {
            distance[i] = DistVector(target, corner[1]);
        } else if (side_x == 0 && side_z < 0) {
            distance[i] = Magnitude(target[2] - corner[1][2]);
        } else if (side_x > 0 && side_z < 0) {
            distance[i] = DistVector(target, corner[2]);
        } else if (side_x < 0 && side_z == 0) {
            distance[i] = Magnitude(target[0] - corner[1][0]);
        } else if (side_x == 0 && side_z == 0) {
            distance[i] = 0.0f;
        } else if (side_x > 0 && side_z == 0) {
            distance[i] = Magnitude(target[0] - corner[0][0]);
        } else if (side_x < 0 && side_z > 0) {
            distance[i] = DistVector(target, corner[3]);
        } else if (side_x == 0 && side_z > 0) {
            distance[i] = Magnitude(target[2] - corner[0][2]);
        } else if (side_x > 0 && side_z > 0) {
            distance[i] = DistVector(target, corner[0]);
        }
        if (range > 0.0f && distance[i] > range) {
            area_visible[i] = 0;
        }
    }
    if (range < 0.0f) {
        clip_plane[3] = -1.0f;
        return;
    }
    int nearest = -1;
    int nearest_distance = -1;
    for (i = 0; i < 4 && areas[i] != NULL; i++) {
        if (area_visible[i] != 0 && distance[i] >= 0.0f) {
            if (nearest < 0 || (float) nearest_distance > distance[i]) {
                nearest = i;
                nearest_distance = (int) distance[i];
            }
        }
    }
    switch (map_no) {
        case 1:
            if (distance[0] > distance[2]) {
                if (area_visible[2] != 0) {
                    area_visible[0] = 0;
                    area_visible[2] = 1;
                }
            } else if (area_visible[0] != 0) {
                area_visible[0] = 1;
                area_visible[2] = 0;
            }
            if (range > 0.0f) {
                if (clip_plane[3] < 0.0f || clip_plane[3] >= 1200.0f) {
                    clip_plane[0] = eye[0];
                    clip_plane[1] = eye[1];
                    clip_plane[2] = eye[2];
                    clip_plane[3] = 1200.0f;
                }
                return;
            }
            clip_plane[3] = -1.0f;
            return;
        case 2:
            for (i = 0; i < 4 && areas[i] != NULL; i++) {
                area_visible[i] = i == nearest;
                if (distance[i] > 0.0f && distance[i] < 600.0f) {
                    area_visible[i] = 1;
                }
            }
            break;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editground", EditAreaClip__11CEditGroundFP7CCameraf);
#endif

int CEditGround::GetRandomPlanePos(sceVu0FVECTOR out_position, sceVu0FVECTOR avoid[], int avoid_count, sceVu0FVECTOR bounds) {
    int cells[2048];
    sceVu0FVECTOR position;
    CVector3_f_ grid;
    CVector3_f_ chosen;
    int found = 0;
    int area_count = 0;
    int x;
    int z;
    int area;

    for (x = 0;; x++) {
        if (areas[x] == NULL) {
            break;
        }
        area_count++;
    }
    if (area_count == 0) {
        return 0;
    }
    for (area = 0; area < area_count; area++) {
        int width = areas[area]->GetWidth();
        int height = areas[area]->GetHeight();
        // The outer two cells of each edge are never chosen.
        for (x = 2; x < width - 2; x++) {
            for (z = 2; z < height - 2; z++) {
                if (areas[area]->GetPartsID(x, z) >= 0 && areas[area]->GetPartsExtra(x, z) != 1) {
                    continue;
                }
                int blocked = 0;
                areas[area]->GetPos(&grid, x, 0, z);
                position[0] = grid.x;
                position[1] = areas[area]->GetAlt(x, z);
                position[2] = grid.z;
                if (!(bounds[3] <= 0.0f) && !(DistVector(bounds, position) <= bounds[3])) {
                    blocked = 1;
                }
                for (int i = 0; i < avoid_count; i++) {
                    float distance = DistVector(avoid[i], position);
                    if (distance < avoid[i][3]) {
                        blocked = 1;
                        break;
                    }
                }
                if (areas[area]->GetAlt_i(x, z) > 0) {
                    blocked = 1;
                }
                if (!blocked) {
                    cells[found++] = (area << 16) | (x | (z << 8));
                }
            }
        }
    }
    if (found == 0) {
        return 0;
    }
    int cell = cells[rand() % found];
    int column = cell & 0xFF;
    int row = (cell >> 8) & 0xFF;
    area = (cell >> 16) & 0xFF;
    areas[area]->GetPos(&chosen, column, 0, row);
    out_position[0] = chosen.x + 0.5f * areas[area]->GetUnitSize();
    out_position[1] = areas[0]->GetAlt(column, row);
    out_position[2] = chosen.z + 0.5f * areas[area]->GetUnitSize();
    return 1;
}

int CEditGround::GetNearParts(CMapParts **out_parts, int limit, CBoxVu0 *box, CBoxVu0 *fixed_box) {
    int i;
    int count = 0;
    CMapParts *object = parts;

    for (i = 0; i < 128; i++, object++) {
        if (object->handle < 0) {
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
        if (fixed_parts[i].handle < 0) {
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

void CEditGround::Draw(float time, int pass, int lowest, int highest, int fixed_lowest, int fixed_highest) {
    sceVu0FVECTOR distance = {50.0f, 300.0f, 500.0f, 800.0f};
    sceVu0FVECTOR position;
    sceVu0FVECTOR ambient;
    int i;

    for (i = 0; i < 64; i++) {
        if (fixed_parts[i].unk_0E4 == pass) {
            fixed_parts[i].DrawParts(time, distance, fixed_lowest, fixed_highest, NULL);
        }
    }
    CMapParts *object = parts;
    for (i = 0; i < 128; i++, object++) {
        if (object->unk_0E4 != pass) {
            continue;
        }
        if (object->handle < 0) {
            continue;
        }
        if (object->area >= 0 && area_visible[object->area] == 0) {
            continue;
        }
        if (!(clip_plane[3] <= 0.0f)) {
            object->GetPosition(position);
            if (!(DistVector(position, clip_plane) <= clip_plane[3]) && !object->ChangeDigData()) {
                continue;
            }
        }
        sceVu0FVECTOR focus = {32.0f, 32.0f, 128.0f, 128.0f};
        MGGetAmbient(ambient);
        if (focus_parts_id == i) {
            MGSetAmbient(focus);
        }
        object->DrawParts(time, distance, lowest, highest, NULL);
        MGSetAmbient(ambient);
    }
}

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

void CEditGround::DrawWaterSurface(CCamera *camera) {
    sceVu0FVECTOR eye;
    sceVu0FVECTOR position;
    sceVu0FVECTOR dir;
    sceVu0FVECTOR parts_position;
    int i;
    CGroundWater *surface = water_surfaces;

    camera->GetPos(eye);
    camera->GetDir(dir);
    dir[1] = 0.0f;
    sceVu0Normalize(dir, dir);
    for (i = 0; i < 4; i++, surface++) {
        if (surface->draw == 0) {
            continue;
        }
        CWater *water = &surface->water;
        sceVu0CopyVector(position, surface->offset);
        if (surface->parts_no >= 0) {
            CMapParts *owner = GetPartsObject(surface->parts_no);
            if (owner == NULL) {
                continue;
            }
            CFrame *frame = owner->unk_104;
            if (frame != NULL && surface->name[0] != '\0') {
                frame = frame->SearchFrame(surface->name);
                if (frame != NULL && !(frame->attr.draw_on & 1)) {
                    continue;
                }
            }
            owner->GetPosition(parts_position);
            if (!(clip_plane[3] <= 0.0f || DistVector(parts_position, clip_plane) <= clip_plane[3] ||
                  owner->ChangeDigData())) {
                continue;
            }
            sceVu0AddVector(position, position, parts_position);
            water->frame.SetPosition(position);
            owner->GetRotation(parts_position);
            water->frame.SetRotation(parts_position[0], parts_position[1], parts_position[2]);
        } else {
            if (surface->follow_x) {
                position[0] = eye[0] + 50.0f * dir[0];
            }
            if (surface->follow_y) {
                position[1] = eye[1];
            }
            if (surface->follow_z) {
                position[2] = eye[2] + 50.0f * dir[2];
            }
            CVector3_f_ rotation;
            rotation.z = rotation.y = rotation.x = 0.0f;
            water->frame.SetRotation(rotation.x, rotation.y, rotation.z);
            water->frame.SetPosition(position);
        }
        DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(water, &mgRenderInfo, GetVif1Packet(), NULL);
    }
}

void CEditGround::DrawWater(int pass) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR corner;
    CMapParts *object = parts;
    int i;

    for (i = 0; i < 128; i++, object++) {
        if (suppress_water) {
            break;
        }
        if (object->handle < 0) {
            continue;
        }
        if (object->area >= 0 && area_visible[object->area] == 0) {
            continue;
        }
        CMapParts *water = &river_parts[7];
        object->GetPosition(position);
        switch (object->subtype) {
            case 2:
            case 5:
            case 3:
                water->SetPosition(position);
                water->Draw();
                break;
            case 4:
                if (object->area < 0) {
                    break;
                }
                if (object->GetWidth() != 2) {
                    break;
                }
                if (object->GetHeight() != 2) {
                    break;
                }
                float size = areas[object->area]->GetUnitSize();
                position[0] += 0.5f * size;
                position[2] += 0.5f * size;
                water->SetPosition(position);
                water->Draw();
                sceVu0CopyVector(corner, position);
                corner[0] = position[0] - size;
                water->SetPosition(corner);
                water->Draw();
                corner[2] = position[2] - size;
                water->SetPosition(corner);
                water->Draw();
                corner[0] = position[0];
                water->SetPosition(corner);
                water->Draw();
                break;
        }
    }
    for (int j = 0; j < 64; j++) {
        if (fixed_parts[j].unk_0E4 == pass) {
            fixed_parts[j].Draw();
        }
    }
}

void CEditGround::DrawRipple(int pass) {
    sceVu0FVECTOR vector;
    sceVu0FVECTOR position;
    CMapParts *object = parts;
    int i;

    for (i = 0; i < 128; i++, object++) {
        if (suppress_water) {
            break;
        }
        if (object->handle < 0) {
            continue;
        }
        if (object->unk_104 == NULL) {
            continue;
        }
        if (object->draw_on == 0) {
            continue;
        }
        if (object->area >= 0 && area_visible[object->area] == 0) {
            continue;
        }
        if (!(clip_plane[3] <= 0.0f)) {
            object->GetPosition(position);
            if (!(DistVector(position, clip_plane) <= clip_plane[3]) && !object->ChangeDigData()) {
                continue;
            }
        }
        if (object->unk_104 == NULL) {
            continue;
        }
        object->GetPosition(vector);
        object->unk_104->SetPosition(vector);
        object->SetRotY(object->GetRotY());
        object->GetRotation(vector);
        object->unk_104->SetRotation(vector[0], vector[1], vector[2]);
        MGDraw(object->unk_104);
    }
    for (int j = 0; j < 64; j++) {
        if (fixed_parts[j].unk_0E4 != pass) {
            continue;
        }
        if (fixed_parts[j].unk_104 == NULL) {
            continue;
        }
        if (fixed_parts[j].draw_on == 0) {
            continue;
        }
        fixed_parts[j].GetPosition(vector);
        fixed_parts[j].unk_104->SetPosition(vector);
        fixed_parts[j].GetRotation(vector);
        fixed_parts[j].unk_104->SetRotation(vector[0], vector[1], vector[2]);
        MGDraw(fixed_parts[j].unk_104);
    }
}

void CEditGround::DrawShadow(int pass, float near_distance, float far_distance) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR view;
    sceVu0FVECTOR distance;
    int i;
    CMapParts *object;
    int fast;

    if (near_distance < 1.0f) {
        near_distance = -10000000;
    }
    object = parts;
    for (i = 0; i < 128; i++, object++) {
        if (object->unk_0E4 < 0) {
            continue;
        }
        if (object->handle < 0) {
            continue;
        }
        if (object->area >= 0 && area_visible[object->area] == 0) {
            continue;
        }
        if (!(clip_plane[3] <= 0.0f)) {
            object->GetPosition(distance);
            if (!(DistVector(distance, clip_plane) <= clip_plane[3]) && !object->ChangeDigData()) {
                continue;
            }
        }
        object->GetPosition(position);
        position[3] = 1.0f;
        sceVu0ApplyMatrix(view, mgRenderInfo.view_scaled, position);
        if (!(object->unk_120 <= 0.0f) && pass == 0 && object->unk_120 < DistVector(view)) {
            continue;
        }
        if (view[2] > near_distance && view[2] < far_distance) {
            object->DrawShade();
            if (object->shadow_frame != NULL) {
                fast = pass != 0;
                if (view[2] > 300.0f) {
                    fast = 1;
                }
                object->DrawShadow(fast);
            }
        }
    }
    for (int j = 0; j < 64; j++) {
        CMapParts *fixed = &fixed_parts[j];
        if (fixed->unk_0E4 < 0) {
            continue;
        }
        if (fixed->handle < 0) {
            continue;
        }
        sceVu0CopyVector(position, fixed->pos);
        position[3] = 1.0f;
        sceVu0ApplyMatrix(view, mgRenderInfo.view_scaled, position);
        if (view[2] > near_distance && view[2] < far_distance) {
            fixed->DrawShade();
            if (fixed->shadow_frame != NULL) {
                fast = pass != 0;
                if (view[2] > 300.0f) {
                    fast = 1;
                }
                fixed->DrawShadow(fast);
            }
        }
    }
}

#ifdef NON_MATCHING
extern float mgZeroMatrix[4][4];

void CEditGround::DrawPartsCursor(int plot, float *position, float *model_pos, int rot_y, float *rotation,
                                  int area_no) {
    static int old_parts = -1;
    CVector3_i_ grid;
    CVector3_f_ cell;
    sceVu0FVECTOR ambient;
    sceVu0FMATRIX light_direction;
    sceVu0FMATRIX light_colour;
    sceVu0FVECTOR dark = {0.0f, 0.0f, 0.0f, 0.0f};
    sceVu0FVECTOR goal;
    CFrame *model;
    int saved_draw;

    if (plot < 0 || plot >= 24) {
        sceVu0CopyVector(model_pos, position);
        return;
    }
    int area_code = GetAreaCode(position[0], position[1], position[2]);
    if (area_code < 0) {
        sceVu0CopyVector(model_pos, position);
        return;
    }
    CEditArea *area = areas[area_code];
    CMapParts *source = &plot_parts[plot];
    int width = source->GetWidth();
    int height = source->GetHeight();
    if (area->CheckAreaRect(position[0], position[1], position[2], width, height) == 0) {
        sceVu0CopyVector(model_pos, position);
        return;
    }
    area->GetPos(&grid, position[0], position[1], position[2]);
    int fits = area->CheckParts(source, position[0], position[1], position[2], rot_y);
    int id = area->SearchPartsID(position[0], position[1], position[2]);
    if (source->subtype == 5) {
        if (CheckDelete(area, source, position[0], position[1], position[2]) != 0) {
            fits = 0;
        }
        if (id >= 0 && parts[id].handle != 1) {
            fits = 0;
        }
    }
    if (parts_info != NULL) {
        EDITPARTS_INFO *info = parts_info->GetPartsInfo(plot);
        if (info != NULL) {
            fits &= info->placed < info->stock;
        }
    }
    area->GetPos(&cell, grid.x, grid.y, grid.z);
    position[0] = cell.x;
    position[1] = 5.0f + cell.y;
    position[2] = cell.z;
    position[3] = 0.0f;
    CFrame *preview = fits != 0 ? (CFrame *) source->unk_0FC : (CFrame *) source->unk_100;
    if (width % 2 == 1) {
        position[0] += 0.5f * area->GetUnitSize();
    }
    if (height % 2 == 1) {
        position[2] += 0.5f * area->GetUnitSize();
    }
    if (fits == 0) {
        // Draw the cursor unlit where the part cannot go.
        MGGetAmbient(ambient);
        MGGetPLight(light_direction, light_colour);
        MGSetAmbient(dark);
        MGSetPLight(mgZeroMatrix, mgZeroMatrix);
    }
    cursor.unit_size = area->GetUnitSize();
    if (cursor.area == area_no) {
        cursor.Draw(position, width, height);
    }
    if (fits == 0) {
        MGSetAmbient(ambient);
        MGSetPLight(light_direction, light_colour);
    }
    position[1] += 50.0f;
    sceVu0CopyVector(goal, position);
    for (int i = 0; i < 3; i++) {
        float step = goal[i] - model_pos[i];
        if (Magnitude(step) < 1.0f) {
            model_pos[i] = goal[i];
        } else {
            model_pos[i] += step / 8.0f;
        }
    }
    if (source->unk_0E4 != area_no) {
        return;
    }
    if (preview == NULL || source->subtype == 2 || source->subtype == 3) {
        return;
    }
    model = NULL;
    if (source->subtype == 5) {
        model = preview->SearchFrame("kawa");
        if (model != NULL) {
            saved_draw = model->attr.draw_on;
            model->attr.draw_on = 2;
        }
        if (id >= 0) {
            parts[id].GetRotation(rotation);
        }
    }
    preview->SetPosition(model_pos);
    preview->SetRotation(rotation[0], rotation[1], rotation[2]);
    MGDraw(preview);
    if (model != NULL) {
        model->attr.draw_on = saved_draw;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editground", DrawPartsCursor__11CEditGroundFiPfPfiPfi);
#endif
INCLUDE_RODATA("asm/nonmatchings/editground", @1207);

void CEditGround::DrawEffect(CCameraFollow *camera, float time, CEffectGroup *effects) {
    sceVu0FVECTOR position;
    int i;
    CMapParts *object = parts;

    for (i = 0; i < 128; i++, object++) {
        if (object->area >= 0 && area_visible[object->area] == 0) {
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
        int parts_id = parts[i].handle;
        if (parts_id < 0) {
            continue;
        }
        int j;
        int kind = object->subtype;
        if (kind > 0) {
            for (j = 0; j < 24; j++) {
                if (kind == plot_parts[j].subtype) {
                    parts_id = plot_parts[j].handle;
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

#ifdef NON_MATCHING
/**
 * One part in a saved ground layout.
 */
struct EDIT_GROUND_SAVE_PART {
    s16 plot;  /**< Plot of the part. */
    s16 rot_y; /**< Quarter turns the part faces. */
    float x;   /**< Where the part stands. */
    float y;
    float z;
};

/**
 * The head of a saved ground layout.
 */
struct EDIT_GROUND_SAVE {
    int count;  /**< Number of parts. */
    int offset; /**< Byte offset from the head to the parts. */
};

void CEditGround::Load(char *buffer) {
    char file[0x800];
    EDIT_GROUND_SAVE *save;
    EDIT_GROUND_SAVE_PART *part;
    int i;

    Clear();
    save = (EDIT_GROUND_SAVE *) file;
    if (buffer == NULL) {
        if (LoadFile2("gdata0.edt", save, NULL, 0) == 0) {
            return;
        }
    } else {
        save = (EDIT_GROUND_SAVE *) buffer;
    }
    EDIT_GROUND_SAVE_PART *first = (EDIT_GROUND_SAVE_PART *) ((char *) save + save->offset);

    // Plain parts first, then the rivers, then what crosses them.
    part = first;
    for (i = 0; i < save->count && part->plot >= 0 && part->plot < 24; i++, part++) {
        if (plot_parts[part->plot].ChangeAltData() != 0) {
            SetMapParts(part->plot, 1.0f + part->x, part->y, 1.0f + part->z, part->rot_y);
        }
    }
    part = first;
    for (i = 0; i < save->count && part->plot >= 0 && part->plot < 24; i++, part++) {
        int subtype = plot_parts[part->plot].subtype;
        if (subtype == 3 || subtype == 5) {
            for (int river = 0; river < 24; river++) {
                if (plot_parts[river].subtype == 2) {
                    SetMapParts(river, 1.0f + part->x, part->y, 1.0f + part->z, part->rot_y);
                    break;
                }
            }
        } else {
            SetMapParts(part->plot, 1.0f + part->x, part->y, 1.0f + part->z, part->rot_y);
        }
    }
    part = first;
    for (i = 0; i < save->count && part->plot >= 0 && part->plot < 24; i++, part++) {
        int subtype = plot_parts[part->plot].subtype;
        if (subtype == 5 || subtype == 3) {
            SetMapParts(part->plot, 1.0f + part->x, part->y, 1.0f + part->z, part->rot_y);
        }
    }
    for (i = 0; i < 4; i++) {
        if (areas[i] != NULL) {
            areas[i]->RemakeGrid();
            areas[i]->RemakeGrid();
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editground", Load__11CEditGroundFPc);
#endif
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
        int parts_id = parts[i].handle;
        if (parts_id < 0) {
            continue;
        }
        int j;
        int kind = object->subtype;
        switch (kind) {
            case 1:
            case 2:
            case 3:
                for (j = 0; j < 24; j++) {
                    if (kind == plot_parts[j].subtype) {
                        parts_id = plot_parts[j].handle;
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

void CEditGround::Load(int town, CSaveData *save) {
    char buffer[0x5000];
    int count;
    GROUND_SAVE_HEADER *header = (GROUND_SAVE_HEADER *) buffer;
    SV_GRD_PART *record = (SV_GRD_PART *) &buffer[sizeof(GROUND_SAVE_HEADER)];

    SV_GRD_PART *saved = save->GetParts(town, &count);
    if (saved == NULL) {
        return;
    }
    header->count = count;
    header->offset = sizeof(GROUND_SAVE_HEADER);
    for (int i = 0; i < count; saved++, record++, i++) {
        record->part_id = saved->part_id;
        record->variant = saved->variant;
        record->pos_x = saved->pos_x;
        record->pos_y = saved->pos_y;
        record->pos_z = saved->pos_z;
    }
    record->part_id = -1;
    record->variant = -1;
    Load(buffer);
}

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
        if (object->handle < 0) {
            continue;
        }
        if (flags != 0 && object->subtype == 0) {
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
        if (fixed_parts[i].handle < 0) {
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

int CEditGround::PickUpCameraPoly(CCPoly *out_polygons, CBoxVu0 &box, int flags) {
    int i;
    int count = 0;
    CCPoly *polygons = out_polygons;
    CMapParts *object = parts;
    CFrame *frame;
    int found;
    sceVu0FVECTOR center;

    for (i = 0; i < 128 && (flags & 2); i++, object++) {
        if (object->handle < 0) {
            continue;
        }
        frame = GetCameraFrame(object);
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
    for (i = 0; i < 64 && (flags & 1); i++) {
        if (fixed_parts[i].handle < 0) {
            continue;
        }
        frame = GetCameraFrame(&fixed_parts[i]);
        if (frame == NULL) {
            continue;
        }
        if (!fixed_parts[i].CheckBox(&box)) {
            continue;
        }
        found = frame->PickUpNearPoly(polygons, box);
        polygons += found;
        count += found;
    }
    for (i = 0; i < 4; i++) {
        if (areas[i] != NULL) {
            sceVu0AddVector(center, box.max, box.min);
            sceVu0ScaleVector(center, center, 0.5f);
            count += areas[i]->PickUpPoly(polygons, center[0], center[1], center[2]);
        }
    }
    return count;
}

void CEditGround::Clear() {
    int i;

    for (i = 0; i < 128; i++) {
        parts[i].Initialize();
    }
    for (i = 0; i < 4; i++) {
        if (areas[i] != NULL) {
            areas[i]->Clear();
        }
        area_visible[i] = 1;
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

        info->stock += 6;
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
        info->placed = 0;
        info->stock -= 6;
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
        area_visible[area] = 1;
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
    cursor.area = 0;
    people[0] = NULL;
    cursor.pieces[1] = NULL;
    cursor.pieces[0] = NULL;
    cursor.unit_size = 1.0f;
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
    int kind = parts->subtype;
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
        if (object->handle >= 0) {
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

/**
 * Gives the first cell that a span covers when it is centred on a cell.
 */
static inline int SpanStart(int &centre, int size) {
    int half = size >> 1;
    return centre - half;
}

void CEditGround::GetRectDirParts(CRect_i_ *rect, CMapParts *target, int direction, int depth) {
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
    direction += target->GetRotY();
    if (direction > 2) {
        direction -= 4;
    }
    if (direction < -1) {
        direction += 4;
    }
    if (direction < -1 || direction > 2) {
        return;
    }
    if (direction % 2 != 0) {
        rect->width = depth;
        rect->height = height;
        if (direction == 1) {
            rect->x = SpanStart(grid.x, width) - rect->width;
            rect->y = SpanStart(grid.z, height);
        } else {
            rect->x = width + SpanStart(grid.x, width);
            rect->y = SpanStart(grid.z, height);
        }
    } else {
        rect->width = width;
        rect->height = depth;
        if (direction == 0) {
            rect->x = SpanStart(grid.x, width);
            rect->y = SpanStart(grid.z, height) - rect->height;
        } else {
            rect->x = SpanStart(grid.x, width);
            rect->y = height + SpanStart(grid.z, height);
        }
    }
}

void CEditGround::NornRequest(CMapParts *(*plot_parts)[64]) {
    parts_info->parts_max = 8;
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
    parts_info->parts_max = 10;
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
        int count = areas[plot_parts[1][0]->area]->GetPartsRect(rect, parts_ids, 256);
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
        int area = plot_parts[2][0]->area;
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
        int area = plot_parts[3][0]->area;
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
        if (CheckPartsRect(6, plot_parts[3][0]->area, rect)) {
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
        int count = areas[plot_parts[14][0]->area]->GetPartsRect(rect, parts_ids, 256);
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
    parts_info->parts_max = 10;
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
        if (CheckPartsRect(1, plot_parts[10][0]->area, rect)) {
            parts_info->request[1] = 1;
        }
    }
    if (plot_parts[2][0] != NULL && plot_parts[8][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 2);
        if (CheckPartsRect(2, plot_parts[8][0]->area, rect)) {
            parts_info->request[2] = 1;
        }
    }
    if (plot_parts[3][0] != NULL && plot_parts[1][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[1][0], 2);
        if (CheckPartsRect(3, plot_parts[1][0]->area, rect)) {
            parts_info->request[3] = 1;
        }
    }
    if (plot_parts[4][0] != NULL) {
        if (plot_parts[9][0] == NULL) {
            parts_info->request[4] = 1;
        } else if (plot_parts[4][0]->area != plot_parts[9][0]->area) {
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
        if (CheckPartsRect(6, plot_parts[11][0]->area, rect)) {
            parts_info->request[6] = 1;
        }
    }
    if (plot_parts[7][0] != NULL && plot_parts[7][0]->area == 0) {
        parts_info->request[7] = 1;
    }
    if (plot_parts[8][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 0, 3);
        if (CheckPartsRect(13, plot_parts[8][0]->area, rect)) {
            parts_info->request[8] = 1;
        }
    }
    if (plot_parts[9][0] != NULL && plot_parts[8][0] != NULL) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 1);
        if (CheckPartsRect(9, plot_parts[8][0]->area, rect)) {
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
    parts_info->parts_max = 9;
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

void CEditGround::YellowRequest(CMapParts *(*plot_parts)[64]) {
    int unused[24];
    int i;

    parts_info->parts_max = 13;
    if (areas[0] == NULL) {
        return;
    }
    for (int j = 0; j < 24; j++) {
        unused[j] = 0;
    }
    if (CheckRot(plot_parts[0][0], plot_parts[7][0], 0)) {
        CRect_i_ rect;
        CRect_i_ other;
        rect.x = rect.y = rect.width = rect.height = 0;
        other.x = other.y = other.width = other.height = 0;
        GetRectParts(&rect, plot_parts[0][0], 0, 2);
        GetRectParts(&other, plot_parts[0][0], 1, 2);
        if (CheckPartsRect(7, 0, rect) && CheckPartsRect(7, 0, other)) {
            parts_info->request[0] = 1;
        }
    }
    if (CheckRot(plot_parts[1][0], plot_parts[5][0], 0)) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[1][0], 0, -1);
        if (CheckPartsRect(5, 0, rect)) {
            parts_info->request[1] = 1;
        }
    }
    if (CheckRot(plot_parts[2][0], plot_parts[6][0], 0)) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[2][0], 0, -1);
        if (CheckPartsRect(6, 0, rect)) {
            parts_info->request[2] = 1;
        }
    }
    if (CheckRot(plot_parts[3][0], plot_parts[7][0], 0)) {
        CRect_i_ rect;
        CRect_i_ other;
        rect.x = rect.y = rect.width = rect.height = 0;
        other.x = other.y = other.width = other.height = 0;
        GetRectParts(&rect, plot_parts[3][0], 2, 1);
        GetRectParts(&other, plot_parts[3][0], 2, 0);
        if (CheckPartsRect(7, 0, rect) && !CheckPartsRect(7, 0, other)) {
            parts_info->request[3] = 1;
        }
    }
    if (CheckRot(plot_parts[4][0], plot_parts[7][0], 0)) {
        CRect_i_ rect;
        CRect_i_ other;
        rect.x = rect.y = rect.width = rect.height = 0;
        other.x = other.y = other.width = other.height = 0;
        GetRectParts(&rect, plot_parts[4][0], -1, 1);
        GetRectParts(&other, plot_parts[4][0], -1, 0);
        if (CheckPartsRect(7, 0, rect) && !CheckPartsRect(7, 0, other)) {
            parts_info->request[4] = 1;
        }
    }
    if (CheckRot(plot_parts[5][0], plot_parts[3][0], 0)) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[3][0], 1, 2);
        if (CheckPartsRect(5, 0, rect)) {
            parts_info->request[5] = 1;
        }
    }
    if (CheckRot(plot_parts[6][0], plot_parts[4][0], 0)) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[4][0], 0, 2);
        if (CheckPartsRect(6, 0, rect)) {
            parts_info->request[6] = 1;
        }
    }
    if (plot_parts[7][0] != NULL) {
        parts_info->request[7] = 1;
    }
    if (CheckRot(plot_parts[8][0], plot_parts[7][0], 0)) {
        CRect_i_ rect;
        CRect_i_ other;
        rect.x = rect.y = rect.width = rect.height = 0;
        other.x = other.y = other.width = other.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 0, -1);
        GetRectParts(&other, plot_parts[8][0], 1, -1);
        if (CheckPartsRect(7, 0, rect) && CheckPartsRect(7, 0, other)) {
            parts_info->request[8] = 1;
        }
    }
    if (CheckRot(plot_parts[9][0], plot_parts[8][0], 0)) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 0, 1);
        if (CheckPartsRect(9, 0, rect)) {
            parts_info->request[9] = 1;
        }
    }
    if (CheckRot(plot_parts[10][0], plot_parts[8][0], 0)) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[8][0], 1, 1);
        if (CheckPartsRect(10, 0, rect)) {
            parts_info->request[10] = 1;
        }
    }
    if (CheckRot(plot_parts[11][0], plot_parts[9][0], 0)) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[11][0], 0, -1);
        if (CheckPartsRect(9, 0, rect)) {
            parts_info->request[11] = 1;
        }
    }
    if (CheckRot(plot_parts[12][0], plot_parts[10][0], 0)) {
        CRect_i_ rect;
        rect.x = rect.y = rect.width = rect.height = 0;
        GetRectParts(&rect, plot_parts[12][0], 0, -1);
        if (CheckPartsRect(10, 0, rect)) {
            parts_info->request[12] = 1;
        }
    }
    for (i = 0; i < 24; i++) {
        int on = 2;
        this->plot_parts[i].FrameObjectOnOff("setuzoku", on);
        if (plot_parts[i][0] != NULL) {
            sceVu0FVECTOR position;
            plot_parts[i][0]->GetPosition(position);
            if (parts_info->request[i] && position[1] < 1.0f) {
                on = 1;
            }
            this->plot_parts[i].FrameObjectOnOff("setuzoku", on);
        }
    }
}
