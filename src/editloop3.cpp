#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 338

#include "common.h"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>
#include <sifdev.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "actionseq.hpp"
#include "boxvu0.hpp"
#include "btsysscript.hpp"
#include "camera.hpp"
#include "camerafollow.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "debugfont.hpp"
#include "dngstatusdata.hpp"
#include "ebattle.hpp"
#include "editground.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "editpartsinfo.hpp"
#include "fishing.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamemode.hpp"
#include "gamepad.hpp"
#include "gameutil.hpp"
#include "mainselect.hpp"
#include "mapparts.hpp"
#include "mathutil.hpp"
#include "menu_draw.hpp"
#include "menu_misc.hpp"
#include "mglib.hpp"
#include "nowload.hpp"
#include "npcharacter.hpp"
#include "objanime.hpp"
#include "runscript.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "spritetable.hpp"
#include "sysmes.hpp"

/* Retail editloop3.cpp: editor event points, villagers, script opcodes and talk handling. */

/** Working arena used to load event villagers and the event player model. */
CDataAlloc2<1> EdVillagerBuffer;

/** Working arena beginning at the free end of the villager arena for event resources. */
CDataAlloc2<1> EdEventBuffer;

/** Working arena beginning at the free end of the event arena for additional resources. */
CDataAlloc2<1> EdEventExBuffer;

/** Homogeneous origin used to resolve the fishing rod's world position. */
static sceVu0FVECTOR fishing_line_origin = {0.0f, 0.0f, 0.0f, 1.0f};

ED_EVENT_POINT *GetNewEventPoint(CMapParts *parts, EPARTS_FUNC_DATA *function,
                                 ED_EVENT_POINT *points, int count) {
    ED_EVENT_POINT *point = GetNewEventPoint(points, count);
    if (point == NULL) {
        printf("event over!!\n");
        return NULL;
    }

    point->enabled = 1;
    if (parts->parts_no >= 0) {
        point->map_object = NULL;
        point->parts_no = parts->parts_no;
    } else {
        point->map_object = parts;
        point->parts_no = -1;
    }
    sceVu0CopyVector(point->position, function->position);
    sceVu0CopyVector(point->rotation, function->rotation);
    point->start_time = ConvertTime(function->start_time);
    point->end_time = ConvertTime(function->end_time);
    point->completion_flag = function->completion_flag;
    CFrame *frame = parts->frame[0];
    point->frame = NULL;
    if (frame != NULL) {
        point->frame = frame->SearchFrame(function->frame_name);
    }
    return point;
}

INCLUDE_RODATA("asm/nonmatchings/editloop3", @687);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @688);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @689);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @690__2);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @727__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @728__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @729__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @730__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @731__3);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1026);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1038);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1673);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1674);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1675);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1676);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @853);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @1424);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2236);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2237);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2246);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2288);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2289);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2449);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2450);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2451);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2604);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2605);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2606);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2607);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2608);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2609);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2610);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2611);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2612);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2613);
INCLUDE_RODATA("asm/nonmatchings/editloop3", @2614);

int EdInitEventPoint(CMapParts *parts, short *indices, EPARTS_FUNC_DATA *functions,
                     int function_count, ED_EVENT_POINT *points, int point_count) {
    int created;

    for (int i = 0; i < 8 && indices != NULL; i++) {
        int point_index = indices[i];
        if (point_index <= 0)
            continue;

        volatile int point_offset[4];
        point_offset[0] = point_index * sizeof(ED_EVENT_POINT);
        ED_EVENT_POINT *point = (ED_EVENT_POINT *) ((int) points + point_offset[0]);
        if (point->event_type != 1)
            continue;

        point->enabled = 1;
        if (parts->parts_no >= 0) {
            point->map_object = NULL;
            point->parts_no = parts->parts_no;
        } else {
            point->map_object = parts;
            point->parts_no = -1;
        }

        int has_extent = 0;
        EPARTS_FUNC_DATA *function = functions;
        for (int j = 0; j < function_count; j++, function++) {
            int kind = function->kind;
            if (kind != 16 && kind != 11 && kind != 10 && kind != 2) {
                kind = function->kind;
            } else if (function->link_id ==
                       ((ED_EVENT_POINT *) ((int) points + point_offset[0]))->map_no) {
                if (kind == 2) {
                    sceVu0CopyVector(point->position, function->position);
                    sceVu0CopyVector(point->rotation, function->rotation);
                    point->unk_60[2] = 10.0f;
                    point->unk_60[1] = 10.0f;
                    point->unk_60[0] = 10.0f;
                    point->minimum_progress = (int) function->values[0];
                    point->start_time = ConvertTime(function->start_time);
                    point->end_time = ConvertTime(function->end_time);
                    point->completion_flag = function->completion_flag;
                    if (has_extent == 0) {
                        sceVu0FVECTOR offset = {40.0f, 50.0f, -80.0f, 1.0f};
                        sceVu0FMATRIX matrix;
                        sceVu0UnitMatrix(matrix);
                        sceVu0RotMatrixY(matrix, matrix, point->rotation[1]);
                        sceVu0ApplyMatrix(offset, matrix, offset);
                        sceVu0AddVector(point->extent, offset, point->position);
                    }
                }
                if (function->kind == 16) {
                    sceVu0CopyVector(point->extent, function->position);
                    has_extent = 1;
                }
                if (function->kind == 10)
                    point->side = 1;
                if (function->kind == 11)
                    point->side = -1;
                if (function->kind == 10 || function->kind == 11)
                    point->linked_value = (int) function->values[0];
            }
        }
    }

    created = 0;
    EPARTS_FUNC_DATA *function = functions;
    for (int i = 0; i < function_count; i++, function++) {
        ED_EVENT_POINT *point = NULL;
        switch (function->kind) {
            case 17:
                point = GetNewEventPoint(parts, function, points, point_count);
                if (point != NULL) {
                    point->event_type = 2;
                    point->unk_60[2] = 15.0f;
                    point->unk_60[1] = 15.0f;
                    point->unk_60[0] = 15.0f;
                    point->side = (int) function->values[0];
                    point->linked_value = (int) function->values[1];
                    point->minimum_progress = (int) function->values[2];
                    point->secondary_progress = (int) function->values[3];
                }
                break;
            case 18:
                if ((int) function->values[0] > 0) {
                    point = GetNewEventPoint(parts, function, points, point_count);
                    if (point != NULL) {
                        point->event_type = 3;
                        sceVu0CopyVector(point->unk_60, function->parameters);
                        point->side = (int) function->values[0];
                        point->linked_value = (int) function->values[1];
                    }
                }
                break;
            case 19:
                point = GetNewEventPoint(parts, function, points, point_count);
                if (point != NULL) {
                    point->event_type = 4;
                    point->unk_60[2] = 6.0f;
                    point->unk_60[1] = 6.0f;
                    point->unk_60[0] = 6.0f;
                    point->unk_60[3] = function->values[0];
                    point->side = (int) function->values[1];
                    for (int j = 0; j < function_count; j++) {
                        EPARTS_FUNC_DATA *other = &functions[j];
                        if (other->kind == 20 && other->link_id == function->link_id) {
                            sceVu0CopyVector(point->extent, other->position);
                            point->linked_value = (int) other->values[1];
                            break;
                        }
                    }
                }
                break;
            case 20:
                point = GetNewEventPoint(parts, function, points, point_count);
                if (point != NULL) {
                    point->event_type = 5;
                    point->unk_60[2] = 6.0f;
                    point->unk_60[1] = 6.0f;
                    point->unk_60[0] = 6.0f;
                    point->unk_60[3] = function->values[0];
                    point->linked_value = (int) function->values[1];
                    for (int j = 0; j < function_count; j++) {
                        EPARTS_FUNC_DATA *other = &functions[j];
                        if (other->kind == 19 && other->link_id == function->link_id) {
                            sceVu0CopyVector(point->extent, other->position);
                            point->side = (int) other->values[1];
                            break;
                        }
                    }
                }
                break;
        }
        if (point != NULL)
            created++;
    }
    return created;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", EdGetEvent__FP14ED_EVENT_POINTiP14ED_EVENT_PARAMPfPff);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventPointDraw__FP14ED_EVENT_POINTif);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventPointCpPoly__FPfP14ED_EVENT_POINTiP6CCPolyf);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSearchEvent__FP14ED_EVENT_PARAMPcif);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdMapJump__FiPc);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdPartsObjectOnOff__FP9CMapPartsP14EDITPARTS_INFOi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVillagerControl__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdCreateVillagerTable__FP13EDIT_MAP_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVillagerTable__FfP13EDIT_MAP_INFO);

/** Holds a pending visibility or movement command for one villager. */
struct VILLAGER_APPEAR_STATE {
    int action;      /**< Visibility transition to apply. */
    int priority;    /**< Priority of the command which last updated the state. */
    int destination; /**< Villager slot used by a movement command. */
};

/** Pending appearance commands for the event villagers. */
static VILLAGER_APPEAR_STATE appear[16];

/** Saved state restored into the first ten villager entries. */
static VILLAGER_INFO restore_info[10];

void EdVillagerAppearOut(int index, int priority) {
    if (index < 0 || index >= 16)
        return;
    if (appear[index].priority > priority)
        return;
    appear[index].action = 2;
    appear[index].priority = priority;
}

void EdVillagerAppearIn(int index, int priority) {
    if (index < 0 || index >= 16)
        return;
    if (appear[index].priority > priority)
        return;
    appear[index].action = 1;
    appear[index].priority = priority;
}

void EdVillagerAppearOff(int index, int priority) {
    if (index < 0 || index >= 16)
        return;
    if (appear[index].priority > priority)
        return;
    appear[index].action = 3;
    appear[index].priority = priority;
}

void EdVillagerAppearOn(int index, int priority) {
    if (index < 0 || index >= 16)
        return;
    if (appear[index].priority > priority)
        return;
    appear[index].action = 4;
    appear[index].priority = priority;
}

void EdVillagerAppearMove(int index, int destination, int priority) {
    if (index < 0 || index >= 16)
        return;
    if (appear[index].priority > priority)
        return;
    appear[index].destination = destination;
}

void RestoreVillagerInfo(VILLAGER_INFO *villagers) {
    for (int i = 0; i < 10; i++)
        villagers[i] = restore_info[i];
}

INCLUDE_ASM("asm/nonmatchings/editloop3", EdSelectVillager__FP13VILLAGER_INFOfP13EDIT_MAP_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdCheckVillagerIn__FiP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdCheckVillager__FiP13VILLAGER_INFOP11CEditGround);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetRandomVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetRandomMoveVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVilager__FP13VILLAGER_INFOP11CEditGroundP1);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdLoadVillager__FPUiPcP12CNPCharacterP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVillagerOnOff__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetNearVill__FP7CCameraP10CCharacterP12CNPCharacterPiPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdMoveVillager__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdMoveVillagerSubMap__FP13VILLAGER_INFO);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSetVillagerNextPos__FP12CNPCharacterP13VILLAGER_INFOP11CEditGround);

int EdCheckTime(float time, float start, float end) {
    if (!(start <= end) && !(start <= time) && end <= time)
        return 0;
    if (start < end && (!(start <= time) || end <= time))
        return 0;
    return 1;
}

int EdGetTime(float time) {
    int period;
    float period_end;

    period = (int) (time / 3.0f);
    if (EdCheckTime(time, 11.5f, 2.5f) != 0)
        period = 0;
    period_end = 5.5f;
    if (EdCheckTime(time, 2.5f, period_end) != 0)
        period = 1;
    if (EdCheckTime(time, (0, 5.5f), 8.5f) != 0)
        period = 2;
    if (EdCheckTime(time, (0, 8.5f), 11.5f) != 0)
        period = 3;
    return period;
}

void EdLimitShadowLight(float light[][4], float scale) {
    light[1][0] = light[1][0] * scale;
    if (light[1][0] < 1.0f)
        light[1][0] = 1.0f;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", EdDrawSky__FfPP9CFrameVu1PP6CFrameP9CFrameVu1P7CCameraPi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdDrawLensFlare__FfPP6CFrame);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSetLightParam__FfiP13EDIT_MAP_INFOP9CFrameVu1);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitToEPInfo__FP14INIT_PARTSINFOP18EPARTS_INFO_HEADER);
/** Colour and GS-scale alpha used to cover the screen during an editor fade. */
static float fade_col[4];

/** Direction and active-state flag for the editor fade. */
static int fade_in_out;

/** Target GS alpha for the active editor fade. */
static int fade_end;

/** GS alpha added on each frame of the active editor fade. */
static float fade_step;

void EdFadeInit() {
    fade_col[3] = 0.0f;
    fade_col[2] = 0.0f;
    fade_col[1] = 0.0f;
    fade_col[0] = 0.0f;
    fade_in_out = 0;
    fade_step = 0.0f;
    fade_end = 0;
}

/* A negative frame count means no step at all: the alpha is forced to the end this call starts
   from and stays there, which is how a colour is held over the screen rather than faded through. */
void EdFadeIn(int frames, float r, float g, float b) {
    if (fade_in_out == 0 || frames < 0)
        fade_col[3] = 128.0f;
    fade_in_out = 1;
    fade_end = 0;
    if (frames < 0)
        fade_step = 0.0f;
    else
        fade_step = 128.0f / (float) frames;
    fade_col[0] = r;
    fade_col[1] = g;
    fade_col[2] = b;
}

void EdFadeOut(int frames, float r, float g, float b) {
    if (fade_in_out == 0 || frames < 0)
        fade_col[3] = 0.0f;
    fade_in_out = -1;
    fade_end = 0;
    if (frames < 0)
        fade_step = 0.0f;
    else
        fade_step = 128.0f / (float) frames;
    fade_col[0] = r;
    fade_col[1] = g;
    fade_col[2] = b;
}

int EdFadeOutCheck() {
    return fade_end;
}

void EdGetFadeColor(float *col) {
    col[0] = fade_col[0];
    col[1] = fade_col[1];
    col[2] = fade_col[2];
    col[3] = fade_col[3];
}

/* The rectangle is in the sixteenths of a pixel the coordinate registers count in, which is what
   the multiplications are; why the cover is 70 boxes rather than one the code does not say. */
void EdFadeInOut() {
    int r;
    int g;
    int b;
    int a;
    int x;
    int y;
    CRect_i_ rect;

    if (fade_in_out == 0)
        return;
    r = (int) fade_col[0];
    g = (int) fade_col[1];
    b = (int) fade_col[2];
    a = (int) fade_col[3];
    if (fade_in_out > 0) {
        fade_col[3] -= fade_step;
        if (fade_col[3] <= 0.0f) {
            fade_col[3] = 0.0f;
            fade_in_out = 0;
            fade_end = 1;
        }
    } else {
        fade_col[3] += fade_step;
        if (fade_col[3] >= 128.0f) {
            fade_col[3] = 128.0f;
            fade_end = 1;
        }
    }
    for (x = 0; x < 640; x += 64) {
        for (y = 0; y < 224; y += 32) {
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, r, g, b, a);
        }
    }
}

float GetMaxHeightCursor(float *position) {
    int height = 0;
    int count;
    for (count = 0; count < 8; count++) {
        EDIT_AREA_RECT_INFO *area = &edit_info->edit_area_rects[count];
        if (area->maximum[0] == area->minimum[0] || area->maximum[2] == area->minimum[0])
            break;
    }
    if (count == 0)
        return 0.0f;
    for (int i = 0; i < count; i++) {
        EDIT_AREA_RECT_INFO *area = &edit_info->edit_area_rects[i];
        if (position[0] <= area->maximum[0] && position[2] <= area->maximum[2] && position[0] >= area->minimum[0] && position[2] >= area->minimum[2] && height < area->minimum[1]) {
            height = area->minimum[1];
        }
    }
    return height;
}

void LimitEditCursorPos(float *position, float *movement) {
    sceVu0FVECTOR previous;
    sceVu0FVECTOR clamped;
    sceVu0FVECTOR displacement;

    sceVu0CopyVector(previous, position);
    sceVu0AddVector(position, position, movement);

    int count;
    for (count = 0; count < 8; count++) {
        EDIT_AREA_RECT_INFO *area = &edit_info->edit_area_rects[count];
        if (area->maximum[0] == area->minimum[0] || area->maximum[2] == area->minimum[0])
            break;
    }
    if (count == 0) {
        position[1] = 0.0f;
        return;
    }

    for (int i = 0; i < count; i++) {
        EDIT_AREA_RECT_INFO *area = &edit_info->edit_area_rects[i];
        if (position[0] <= area->maximum[0] && position[2] <= area->maximum[2] && position[0] >= area->minimum[0] && position[2] >= area->minimum[2]) {
            position[1] = GetMaxHeightCursor(position);
            return;
        }
    }

    float nearest_distance = -1.0f;
    int nearest = -1;
    for (int i = 0; i < count; i++) {
        EDIT_AREA_RECT_INFO *area = &edit_info->edit_area_rects[i];
        if (previous[0] <= area->maximum[0] && previous[2] <= area->maximum[2] && previous[0] >= area->minimum[0] && previous[2] >= area->minimum[2]) {
            VectorMin(clamped, position, area->maximum);
            VectorMax(clamped, clamped, area->minimum);
            sceVu0SubVector(displacement, clamped, position);
            displacement[1] = 0.0f;
            float distance = DistVector(displacement);
            if (nearest < 0) {
                nearest = i;
                nearest_distance = distance;
            } else if (distance < nearest_distance) {
                nearest = i;
                nearest_distance = distance;
            }
        }
    }
    if (nearest >= 0) {
        EDIT_AREA_RECT_INFO *area = &edit_info->edit_area_rects[nearest];
        VectorMin(position, position, area->maximum);
        VectorMax(position, position, area->minimum);
        position[1] = GetMaxHeightCursor(position);
        return;
    }

    nearest = 0;
    EDIT_AREA_RECT_INFO *area = &edit_info->edit_area_rects[0];
    float max_x_distance;
    float min_x_distance;
    float min_z_distance;
    float max_z_distance;
    float x = position[0];
    max_x_distance = x - area->maximum[0];
    if (max_x_distance < 0.0f)
        max_x_distance = -max_x_distance;
    else
        max_x_distance = max_x_distance;
    min_x_distance = x - area->minimum[0];
    if (min_x_distance < 0.0f)
        min_x_distance = -min_x_distance;
    else
        min_x_distance = min_x_distance;
    float z = position[2];
    max_z_distance = z - area->maximum[2];
    if (max_z_distance < 0.0f)
        max_z_distance = -max_z_distance;
    else
        max_z_distance = max_z_distance;
    min_z_distance = z - area->minimum[2];
    if (min_z_distance < 0.0f)
        min_z_distance = -min_z_distance;
    else
        min_z_distance = min_z_distance;
    if (max_z_distance < min_z_distance)
        max_z_distance = max_z_distance;
    else
        max_z_distance = min_z_distance;
    if (max_x_distance < min_x_distance)
        max_x_distance = max_x_distance;
    else
        max_x_distance = min_x_distance;
    nearest_distance = max_x_distance + max_z_distance;

    for (int i = 1; i < count; i++) {
        area = &edit_info->edit_area_rects[i];
        max_x_distance = x - area->maximum[0];
        if (max_x_distance < 0.0f)
            max_x_distance = -max_x_distance;
        else
            max_x_distance = max_x_distance;
        min_x_distance = x - area->minimum[0];
        if (min_x_distance < 0.0f)
            min_x_distance = -min_x_distance;
        else
            min_x_distance = min_x_distance;
        max_z_distance = z - area->maximum[2];
        if (max_z_distance < 0.0f)
            max_z_distance = -max_z_distance;
        else
            max_z_distance = max_z_distance;
        min_z_distance = z - area->minimum[2];
        if (min_z_distance < 0.0f)
            min_z_distance = -min_z_distance;
        else
            min_z_distance = min_z_distance;
        if (max_z_distance < min_z_distance)
            max_z_distance = max_z_distance;
        else
            max_z_distance = min_z_distance;
        if (max_x_distance < min_x_distance)
            max_x_distance = max_x_distance;
        else
            max_x_distance = min_x_distance;
        float distance = max_x_distance + max_z_distance;
        if (distance < nearest_distance) {
            nearest_distance = distance;
            nearest = i;
        }
    }
    area = &edit_info->edit_area_rects[nearest];
    VectorMin(position, position, area->maximum);
    VectorMax(position, position, area->minimum);
    position[1] = GetMaxHeightCursor(position);
}

void EdSePlay(ED_SOUND_ID sound, int pan) {
    if (sound < 0 || sound >= ED_SOUND_COUNT)
        return;
    SndSePlay(sound, pan, 0);
}

/** Script-controlled sprites used by editor events. */
static ED_SPRITE Sprite[16];

ED_SPRITE *GetSprite(int index) {
    if (index < 0 || index >= 16)
        return NULL;
    return &Sprite[index];
}

void InitSprite(ED_SPRITE *sprite) {
    if (sprite == NULL)
        return;
    memset(sprite, 0, sizeof(ED_SPRITE));
    sprite->alpha = 128;
    sprite->blue = 128;
    sprite->green = 128;
    sprite->red = 128;
    sprite->height = -1;
    sprite->width = -1;
}

/** Object-animation slots used by editor event scripts. */
static OBJ_ANIME_SEQ obj_anime[16];

static OBJ_ANIME_SEQ *GetObjAnime(int index) {
    if (index < 0 || index >= 16)
        return NULL;
    return &obj_anime[index];
}

void ClearObjAnime(int index) {
    if (index < 0) {
        for (int i = 0; i < 16; i++)
            obj_anime[i].type = -1;
        return;
    }
    OBJ_ANIME_SEQ *anime = GetObjAnime(index);
    if (anime != NULL)
        anime->type = -1;
}

/** Menu mode requested by the active event. */
static int menu_mode;

/** Map requested by the world-map event command. */
static int p_jump_map_no;

/** Whether the active script permits event skipping. */
static int skip_enable;

/** Character followed by the event camera. */
static CCharacter *follow_chara;

/** Character used as the event camera's reference target. */
static CCharacter *sync_camera_ref_chara;

/** Object used as the event camera's reference target. */
static OBJ_HANDLE *sync_camera_ref_obj;

/** Object used as the event camera's position target. */
static OBJ_HANDLE *sync_camera_pos_obj;

/** Offset added to the event camera's synchronized reference target. */
static sceVu0FVECTOR sync_camera_ref_offset;

/** Shared destination buffer used by asynchronous event resource loads. */
static u_int *BaseBuffer;

/** Saved point-light direction presets available to event scripts. */
static sceVu0FMATRIX save_l[2];

/** Saved point-light colour presets available to event scripts. */
static sceVu0FMATRIX save_c[2];

/** Saved ambient-light colour presets available to event scripts. */
static sceVu0FVECTOR save_a[2];

/** Whether advancement of the current editor event is paused. */
static int event_pause;

void EdEventPause() {
    event_pause = !event_pause;
}

/** Integer scratch flags exposed to editor event scripts. */
static int work_flag[32];

/** Foreground sprite command table for the active event. */
static CSpriteTable SpriteTable;

/** Background sprite command table for the active event. */
static CSpriteTable SpriteTableBack;

/** Bytecode interpreter used by editor events. */
static CRunScript EdEventScript;

int SetWorkFlag(int index, int value) {
    if (index < 0 || index >= 32)
        return 0;
    work_flag[index] = value;
    return 1;
}

int GetWorkFlag(int index) {
    if (index < 0 || index >= 32)
        return 0;
    return work_flag[index];
}

/**
 * Reads a script stack value as an integer, converting a tagged float when necessary.
 */
static int GetStackInt(RS_STACKDATA *stack) {
    if (stack->type == RS_FLOAT)
        return (int) stack->f;
    return stack->i;
}

/**
 * Reads a script stack value as a float, converting a tagged integer when necessary.
 */
static float GetStackFloat(RS_STACKDATA *stack) {
    if (stack->type == RS_INT)
        return (float) stack->i;
    return stack->f;
}

/**
 * Reads the string pointer stored in a script stack value.
 */
static char *GetStackString(RS_STACKDATA *stack) {
    return stack->s;
}

/**
 * Writes an integer through a script stack reference value.
 */
static void SetStack(RS_STACKDATA *stack, int value) {
    if (stack->type == RS_PTR)
        stack->p->i = value;
}

/**
 * Writes a float through a script stack reference value.
 */
static void SetStack(RS_STACKDATA *stack, float value) {
    if (stack->type == RS_PTR)
        stack->p->f = value;
}

void PrintMemory() {
}

/** Object handles exposed to editor event scripts. */
extern OBJ_HANDLE ObjHandle[32];

static OBJ_HANDLE *GetObjHandle(int index) {
    if (index < 0 || index >= 32)
        return NULL;
    return &ObjHandle[index];
}

int SetObjHandle(int index, CMapParts *map_parts, char *frame_name) {
    OBJ_HANDLE *handle = GetObjHandle(index);
    if (handle == NULL)
        return 0;
    if (map_parts == NULL)
        return 0;
    if (frame_name == NULL)
        return 0;

    memset(handle, 0, sizeof(OBJ_HANDLE));
    int i = 0;
    handle->frames[0] = map_parts->frame[0];
    handle->frames[1] = map_parts->frame[1];
    handle->frames[2] = map_parts->frame[2];
    handle->frames[3] = map_parts->frame[3];
    handle->frames[4] = map_parts->GetCollisionFrame();
    handle->frames[5] = map_parts->shadow_frame;
    handle->frames[6] = map_parts->shade_frame;
    CFrame *extra_frame;
    if (map_parts->unk_0DC == NULL) {
        extra_frame = NULL;
    } else {
        map_parts->unk_0DC->SetPosition(map_parts->pos[0], map_parts->pos[1], map_parts->pos[2]);
        map_parts->unk_0DC->SetRotation(map_parts->rotation.x, map_parts->rotation.y, map_parts->rotation.z);
        extra_frame = map_parts->unk_0DC;
    }
    handle->frames[7] = extra_frame;
    handle->frames[8] = map_parts->unk_104;
    i += 9;
    for (; i < 12; i++)
        handle->frames[i] = NULL;

    if (frame_name[0] != '\0') {
        for (i = 0; i < 12; i++) {
            if (handle->frames[i] != NULL)
                handle->frames[i] = handle->frames[i]->SearchFrame(frame_name);
        }
        handle->map_parts = NULL;
    } else {
        handle->map_parts = map_parts;
    }
    return 1;
}

int SetObjHandle(int index, CCharacter *character, char *frame_name) {
    OBJ_HANDLE *handle = GetObjHandle(index);
    if (handle == NULL)
        return 0;
    if (character == NULL)
        return 0;
    if (frame_name == NULL)
        return 0;

    memset(handle, 0, sizeof(OBJ_HANDLE));
    int i = 0;
    handle->frames[0] = character->frame;
    handle->frames[1] = character->shadow_frame;
    i += 2;
    for (; i < 12; i++)
        handle->frames[i] = NULL;

    if (frame_name[0] != '\0') {
        for (i = 0; i < 12; i++) {
            if (handle->frames[i] != NULL)
                handle->frames[i] = handle->frames[i]->SearchFrame(frame_name);
        }
        handle->map_parts = NULL;
    } else {
        handle->character = character;
    }
    return 1;
}

int SetObjHandle(int index, CFrame *frame) {
    OBJ_HANDLE *handle = GetObjHandle(index);
    if (frame == NULL)
        return 0;
    memset(handle, 0, sizeof(OBJ_HANDLE));
    handle->frames[0] = frame;
    return 1;
}

void obj_draw(OBJ_HANDLE *handle, int draw) {
    if (handle == NULL)
        return;

    int frame_draw = 2;
    int frame_flags = 4;
    if (draw != 0) {
        frame_draw = 1;
        frame_flags = 1;
    }
    if (handle->map_parts != NULL) {
        handle->map_parts->draw_on = draw;
        return;
    }
    for (int i = 0; i < 12; i++) {
        if (handle->frames[i] != NULL) {
            handle->frames[i]->attr.draw_on = frame_draw;
            handle->frames[i]->flags = frame_flags;
        }
    }
}

void set_obj_pos(OBJ_HANDLE *handle, float *position) {
    if (handle->map_parts != NULL) {
        handle->map_parts->SetPosition(position);
        return;
    }
    if (handle->character != NULL) {
        handle->character->SetPosition(position);
        return;
    }
    for (int i = 0; i < 12; i++) {
        if (handle->frames[i] != NULL)
            handle->frames[i]->SetPosition(position);
    }
}

void get_obj_pos(OBJ_HANDLE *handle, float *out_position) {
    if (handle->map_parts != NULL) {
        handle->map_parts->GetPosition(out_position);
        return;
    }
    if (handle->character != NULL) {
        handle->character->GetPosition(out_position);
        return;
    }
    for (int i = 0; i < 12; i++) {
        if (handle->frames[i] != NULL) {
            sceVu0CopyVector(out_position, handle->frames[i]->position);
            return;
        }
    }
}

void get_obj_world_pos(OBJ_HANDLE *handle, float *out_position) {
    if (handle->map_parts != NULL) {
        handle->map_parts->GetPosition(out_position);
        return;
    }
    if (handle->character != NULL) {
        handle->character->GetPosition(out_position);
        return;
    }
    sceVu0FVECTOR local = {0.0f, 0.0f, 0.0f, 1.0f};
    for (int i = 0; i < 12; i++) {
        if (handle->frames[i] != NULL) {
            handle->frames[i]->GetWorldPosition(out_position, local);
            return;
        }
    }
}

void set_obj_rot(OBJ_HANDLE *handle, float *rotation) {
    if (handle->map_parts != NULL) {
        handle->map_parts->SetRotation(rotation[0], rotation[1], rotation[2]);
        return;
    }
    if (handle->character != NULL) {
        handle->character->SetRotation(rotation[0], rotation[1], rotation[2]);
        return;
    }
    for (int i = 0; i < 12; i++) {
        if (handle->frames[i] != NULL) {
            handle->frames[i]->SetRotType(2);
            handle->frames[i]->SetRotation(rotation[0], rotation[1], rotation[2]);
        }
    }
}

void get_obj_rot(OBJ_HANDLE *handle, float *out_rotation) {
    if (handle->map_parts != NULL) {
        handle->map_parts->GetRotation(out_rotation);
        return;
    }
    if (handle->character != NULL) {
        handle->character->GetRotation(out_rotation);
        return;
    }
    for (int i = 0; i < 12; i++) {
        if (handle->frames[i] != NULL) {
            handle->frames[i]->GetRotation(out_rotation);
            return;
        }
    }
}

void set_obj_scale(OBJ_HANDLE *handle, float *scale) {
    if (handle->map_parts != NULL) {
        handle->map_parts->SetScale(scale);
        return;
    }
    if (handle->character != NULL) {
        handle->character->SetScale(scale);
        return;
    }
    for (int i = 0; i < 12; i++) {
        if (handle->frames[i] != NULL)
            handle->frames[i]->SetScale(scale);
    }
}

void get_obj_scale(OBJ_HANDLE *handle, float *out_scale) {
    if (handle->map_parts != NULL) {
        handle->map_parts->GetScale(out_scale);
        return;
    }
    if (handle->character != NULL) {
        handle->character->GetScale(out_scale);
        return;
    }
    for (int i = 0; i < 12; i++) {
        CFrame *frame = handle->frames[i];
        if (frame != NULL) {
            out_scale[0] = frame->scale[0];
            out_scale[1] = frame->scale[1];
            out_scale[2] = frame->scale[2];
            return;
        }
    }
}

int init_obj_anime(int anime_index, int handle_index, int type, int number,
                   float *offset, float *range, float *speed) {
    OBJ_ANIME_SEQ *anime = GetObjAnime(anime_index);
    OBJ_HANDLE *handle = GetObjHandle(handle_index);
    if (anime == NULL || handle == NULL)
        return 0;

    anime->type = type;
    anime->number = number;
    anime->name[0] = '\0';
    sceVu0CopyVector(anime->offset, offset);
    sceVu0CopyVector(anime->range, range);
    sceVu0CopyVector(anime->speed, speed);
    InitObjAnime(handle->frames, 12, anime);
}

void sync_obj_obj(OBJ_HANDLE *source, OBJ_HANDLE *targets) {
    CFrame *reference = NULL;
    int i;
    for (i = 0; i < 12; i++) {
        if (source->frames[i] != NULL) {
            reference = source->frames[i];
            break;
        }
    }
    if (reference != NULL) {
        for (i = 0; i < 12; i++) {
            if (targets->frames[i] != NULL)
                targets->frames[i]->SetReference(reference);
        }
    }
}

void release_obj_obj(OBJ_HANDLE *handle) {
    for (int i = 0; i < 12; i++) {
        if (handle->frames[i] != NULL)
            handle->frames[i]->DeleteReference();
    }
}

void set_attr_obj(OBJ_HANDLE *handle, CFrameAttr &attr, int children, int mask) {
    if (handle->character != NULL) {
        if (handle->character->frame != NULL)
            handle->character->frame->SetAttr(attr, children, mask);
    } else {
        for (int i = 0; i < 12; i++) {
            if (handle->frames[i] != NULL)
                handle->frames[i]->SetAttr(attr, children, mask);
        }
    }
}

/** Action sequencers available to event scripts. */
static CActionSeq ActSeq[10];

static CActionSeq *GetActSeq(int index) {
    if (index < 0 || index >= 10)
        return NULL;
    return &ActSeq[index];
}

INCLUDE_ASM("asm/nonmatchings/editloop3", turn_chara__FP10CCharacterPff);
/** Character container used for script-loaded scene animation data. */
extern CCharacter SceneData;

/** Camera used when no scene motion camera remains attached. */
extern CCamera DmmyCamera;

static CCharacter *GetScene(int) {
    return &SceneData;
}

static CNPCharacter *GetNPC(int index) {
    if (index < 0 || index >= EdEventInfo.npc_count)
        return NULL;
    return &EdEventInfo.npcs[index];
}

static CCharacter *GetChara(int index) {
    if (index == -1)
        return EdEventInfo.main_character;
    if (index < 0 || index >= EdEventInfo.npc_count)
        return NULL;
    return &EdEventInfo.npcs[index].chara;
}

static CFrame *GetItemFrame(int index) {
    if (index < 0 || index > 0)
        return NULL;
    return EdEventInfo.item_frame[index];
}

void DeleteItemFrame(int index) {
    if (index < 0 || index > 0)
        return;
    CFrameVu1 **frames = EdEventInfo.item_frame;
    CFrameVu1 **frame = &frames[index];
    if (*frame != NULL) {
        (*frame)->DeleteReference();
        *frame = NULL;
    }
}

static VILLAGER_INFO *GetVillagerInfo(int index) {
    if (index < 0 || index >= 16)
        return NULL;
    return &EdEventInfo.villagers[index];
}

/** Origin of the event script's optional world coordinate system. */
static sceVu0FVECTOR world_pos;

/** Rotation of the event script's optional world coordinate system. */
static sceVu0FVECTOR world_rot;

/** Matrix that converts event-local coordinates to world coordinates. */
static sceVu0FMATRIX world_local;

/** Matrix that converts world coordinates to event-local coordinates. */
static sceVu0FMATRIX local_world;

/** Whether event-local/world coordinate conversion is enabled. */
static int set_wl_matrix;

static void SetWorldCoord(float *position, float *rotation) {
    sceVu0CopyVector(world_pos, position);
    world_pos[3] = 1.0f;
    sceVu0CopyVector(world_rot, rotation);
    world_rot[3] = 0.0f;
    sceVu0UnitMatrix(world_local);
    sceVu0RotMatrixY(world_local, world_local, world_rot[1]);
    sceVu0CopyVector(world_local[3], world_pos);
    sceVu0InversMatrix(local_world, world_local);
    set_wl_matrix = 1;
}

void GetWorldPos(float *out, float *position) {
    if (set_wl_matrix == 0) {
        sceVu0CopyVector(out, position);
        return;
    }
    position[3] = 1.0f;
    sceVu0ApplyMatrix(out, world_local, position);
}

static float GetWorldRotY(float rotation) {
    rotation += world_rot[1];
    if (rotation > 3.1415927f)
        rotation -= 6.2831855f;
    if (rotation < -3.1415927f)
        rotation += 6.2831855f;
    return rotation;
}

static void GetWorldRot(float *out, float *rotation) {
    sceVu0CopyVector(out, rotation);
    out[1] = GetWorldRotY(out[1]);
}

void GetLocalPos(float *out, float *position) {
    if (set_wl_matrix == 0) {
        sceVu0CopyVector(out, position);
        return;
    }
    position[3] = 1.0f;
    sceVu0ApplyMatrix(out, local_world, position);
}

static float GetLocalRotY(float rotation) {
    rotation -= world_rot[1];
    if (rotation > 3.1415927f)
        rotation -= 6.2831855f;
    if (rotation < -3.1415927f)
        rotation += 6.2831855f;
    return rotation;
}

void GetLocalRot(float *out, float *rotation) {
    sceVu0CopyVector(out, rotation);
    out[1] = GetLocalRotY(out[1]);
}

static void GetPosition(RS_STACKDATA *stack, float *position) {
    position[0] = GetStackFloat(stack++);
    position[1] = GetStackFloat(stack++);
    position[2] = GetStackFloat(stack);
    position[3] = 1.0f;
    GetWorldPos(position, position);
}

void SetPosition(RS_STACKDATA *stack, float *position) {
    position[3] = 1.0f;
    GetLocalPos(position, position);
    SetStack(stack++, position[0]);
    SetStack(stack++, position[1]);
    SetStack(stack, position[2]);
}

static void GetRotation(RS_STACKDATA *stack, float *rotation) {
    rotation[0] = GetStackFloat(stack++);
    rotation[1] = GetStackFloat(stack++);
    rotation[2] = GetStackFloat(stack);
    rotation[3] = 0.0f;
    GetWorldRot(rotation, rotation);
}

void SetRotation(RS_STACKDATA *stack, float *rotation) {
    rotation[3] = 0.0f;
    GetLocalRot(rotation, rotation);
    SetStack(stack++, rotation[0]);
    SetStack(stack++, rotation[1]);
    SetStack(stack, rotation[2]);
}

/**
 * Resolves an event-script file path relative to the current directory, stripping a leading slash
 * for an absolute path.
 *
 * @mangled GetFileName__FPcPc
 * @address 0x18B7B0
 * @size 0x74
 */
static void GetFileName(char *path, char *name);

INCLUDE_ASM("asm/nonmatchings/editloop3", GetFileName__FPcPc);

int _TEST(RS_STACKDATA *, int) {
    return 1;
}

int exch_ok_cancel(int buttons) {
    int confirm = buttons & ED_PAD_CONFIRM;
    int cancel = buttons & ED_PAD_CANCEL;
    buttons &= ~(ED_PAD_CONFIRM | ED_PAD_CANCEL);
    if (confirm)
        buttons |= ED_PAD_CANCEL;
    if (cancel)
        buttons |= ED_PAD_CONFIRM;
    return buttons;
}

int _GET_PADON(RS_STACKDATA *stack, int argument_count) {
    if (argument_count <= 0)
        return 0;
    SetStack(stack, exch_ok_cancel(GamePad.GetPadOn()));
    return 1;
}

int _GET_PADDOWN(RS_STACKDATA *stack, int argument_count) {
    if (argument_count <= 0)
        return 0;
    SetStack(stack, exch_ok_cancel(GamePad.GetPadDown()));
    return 1;
}

int _GET_PADUP(RS_STACKDATA *stack, int argument_count) {
    if (argument_count <= 0)
        return 0;
    SetStack(stack, exch_ok_cancel(GamePad.GetPadUp()));
    return 1;
}

int _GET_APAD(RS_STACKDATA *const arguments, const int argument_count) {
    RS_STACKDATA *stack = arguments;
    int count = argument_count;

    if (count > 0)
        SetStack(stack++, GamePad.GetLXf());
    if (count > 1)
        SetStack(stack++, GamePad.GetLYf());
    if (count > 2)
        SetStack(stack++, GamePad.GetRXf());
    if (count > 3)
        SetStack(stack, GamePad.GetRYf());
    return 1;
}

int _GET_RANDOM(RS_STACKDATA *stack, int argument_count) {
    if (argument_count <= 0)
        return 0;
    SetStack(stack, rand());
    return 1;
}

int _SET_RETURN_CODE(RS_STACKDATA *stack, int) {
    EdEventInfo.return_code = GetStackInt(stack);
    return 1;
}

int _NEXT_EVENT(RS_STACKDATA *stack, int) {
    EdEventInfo.next_event = GetStackInt(stack);
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_INTERIOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_WORLD_COORD__FP12RS_STACKDATAi);

int _INITIALIZE(RS_STACKDATA *, int) {
    EdInitEventParam();
    return 1;
}

int _EXIT_CODE(RS_STACKDATA *stack, int) {
    EdEventInfo.exit_code = GetStackInt(stack);
    return 1;
}

int _DRAW_EXCLAMATION_MARK(RS_STACKDATA *, int) {
    EdEventInfo.draw_exclamation_mark = 1;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_USE_ITEM__FP12RS_STACKDATAi);

int _NAME_REGISTRY(RS_STACKDATA *stack, int) {
    EdSetNameRegChara(GetStackInt(stack));
    menu_mode = 6;
    return 1;
}

int _WORLD_MAP(RS_STACKDATA *stack, int) {
    if (stack->type != RS_PTR)
        return 0;
    p_jump_map_no = stack->i;
    menu_mode = 7;
    return 1;
}

int _SKIP(RS_STACKDATA *stack, int) {
    skip_enable = GetStackInt(stack);
    return 1;
}

int _GOTO_OUTSIDE(RS_STACKDATA *stack, int) {
    EdEventInfo.outside_map_no = GetStackInt(stack);
    EdEventInfo.return_code = 7;
    return 1;
}

int _FINISH(RS_STACKDATA *, int) {
    EdEventAllClear();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_JUMP__FP12RS_STACKDATAi);

int _GET_OLD_MAPNO(RS_STACKDATA *stack, int) {
    SetStack(stack, OldMapNo + 1);
    return 1;
}

int _SET_DUNGEON_FLOOR(RS_STACKDATA *stack, int) {
    BtSetMapJumpFloor(GetStackInt(stack));
    return 1;
}

int _GET_DUNGEON_FLOOR(RS_STACKDATA *stack, int) {
    SetStack(stack, BtMapJumpFloor);
    return 1;
}

int _FADEOUT_TO_EVENT(RS_STACKDATA *stack, int) {
    EdEventInfo.fadeout_event_no = GetStackInt(stack);
    return 1;
}

int _MAP_JUMP_BGM_STOP(RS_STACKDATA *stack, int) {
    EdEventInfo.map_jump_bgm_stop = GetStackInt(stack);
    return 1;
}

int _MAP_JUMP_BGM_PLAY(RS_STACKDATA *stack, int) {
    EdEventInfo.fukidashi = GetStackInt(stack);
    return 1;
}

int _GOTO_FP_CHANGE(RS_STACKDATA *, int) {
    menu_mode = 8;
    return 1;
}

int _GOTO_FISH_RANKING(RS_STACKDATA *, int) {
    menu_mode = 10;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_CHANGE_ESA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CURRENT_DIR__FP12RS_STACKDATAi);
/**
 * Gives the archive the event script is loading its files out of.
 *
 * @mangled get_pack_file__Fv
 * @address 0x18C2A0
 * @size 0x20
 */
static u_int *get_pack_file();

INCLUDE_ASM("asm/nonmatchings/editloop3", get_pack_file__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", get_buffer__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ACTIVE_FILE_BUFFER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_CHR_FILE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SYNC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_CHARA_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SPRITE_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_BG_SPRITE_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_TEXTURE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_IN_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_OUT_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_IN_VILLAGER__FP12RS_STACKDATAi);

int _APPEAR_VILLAGER_ON(RS_STACKDATA *stack, int) {
    EdVillagerAppearOn(GetStackInt(stack), 1);
    return 1;
}

int _APPEAR_VILLAGER_OFF(RS_STACKDATA *stack, int) {
    EdVillagerAppearOff(GetStackInt(stack), 1);
    return 1;
}

int _APPEAR_VILLAGER_OUT(RS_STACKDATA *stack, int) {
    EdVillagerAppearOut(GetStackInt(stack), 1);
    return 1;
}

int _APPEAR_VILLAGER_IN(RS_STACKDATA *stack, int) {
    EdVillagerAppearIn(GetStackInt(stack), 1);
    return 1;
}

int _APPEAR_VILLAGER_MOVE(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int index = GetStackInt(stack);
    EdVillagerAppearMove(index, GetStackInt(next), 1);
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_CHARA__FP12RS_STACKDATAi);

int _CLEAR_VILLAGER_BUFF(RS_STACKDATA *, int) {
    CDataAlloc2<1> *arena = (CDataAlloc2<1> *) BaseBuffer;
    int used = arena->used;
    u_char *base = arena->base + used * 16;
    int limit = arena->limit - used;
    EdVillagerBuffer.base = base;
    EdVillagerBuffer.limit = limit;
    EdVillagerBuffer.used = 0;
    return 1;
}

int _CLEAR_EVENT_BUFF(RS_STACKDATA *, int) {
    int used = EdVillagerBuffer.used;
    u_char *base = EdVillagerBuffer.base + used * 16;
    int limit = EdVillagerBuffer.limit - used;
    EdEventBuffer.base = base;
    EdEventBuffer.limit = limit;
    EdEventBuffer.used = 0;
    return 1;
}

int _CLEAR_EVENT_EXBUFF(RS_STACKDATA *, int) {
    int used = EdEventBuffer.used;
    u_char *base = EdEventBuffer.base + used * 16;
    int limit = EdEventBuffer.limit - used;
    EdEventExBuffer.base = base;
    EdEventExBuffer.limit = limit;
    EdEventExBuffer.used = 0;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SCENE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_SCENE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_SCENE_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_SCENE_CHARA__FP12RS_STACKDATAi);

int _RELEASE_SCENE_CAMERA(RS_STACKDATA *stack, int) {
    CCharacter *scene = GetScene(GetStackInt(stack));
    if (scene == NULL)
        return 0;
    scene->motion_type.camera = &DmmyCamera;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SCENE_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SCENE_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_ITEM_FILE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CHARA_ITEM__FP12RS_STACKDATAi);

int _RELEASE_CHARA_ITEM(RS_STACKDATA *stack, int) {
    CFrame *frame = GetItemFrame(GetStackInt(stack));
    if (frame != NULL)
        frame->DeleteReference();
    return 1;
}

int _DELETE_ITEM(RS_STACKDATA *stack, int) {
    DeleteItemFrame(GetStackInt(stack));
    TexManager.DeleteTextureBlock(40);
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CHARA_CHARA__FP12RS_STACKDATAi);

int _RELEASE_CHARA_CHARA(RS_STACKDATA *stack, int) {
    CCharacter *character = GetChara(GetStackInt(stack));
    if (character == NULL)
        return 0;
    if (character->frame != NULL)
        character->frame->DeleteReference();
    if (character->shadow_frame != NULL)
        character->shadow_frame->DeleteReference();
    return 1;
}

int _GET_CHARA_POS(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR position;
    if (argument_count < 3)
        return 0;
    EdEventInfo.main_character->GetPosition(position);
    SetPosition(stack, position);
    return 1;
}

int _GET_CHARA_TALK_POS(RS_STACKDATA *stack, int argument_count) {
    int position[2];
    if (argument_count < 2)
        return 0;
    GetScrPosFromChar(EdEventInfo.main_character, position);
    SetStack(stack++, position[0]);
    SetStack(stack, position[1]);
    return 1;
}

int _SET_CHARA_POS(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR position;
    GetPosition(stack, position);
    EdEventInfo.main_character->SetPosition(position);
    return 1;
}

int _SET_CHARA_ROT(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR rotation;
    if (argument_count == 3) {
        GetRotation(stack, rotation);
        stack += 3;
    }
    if (argument_count == 1) {
        rotation[2] = 0.0f;
        rotation[0] = 0.0f;
        rotation[1] = GetStackFloat(stack);
        GetWorldRot(rotation, rotation);
    }
    EdEventInfo.main_character->SetRotation(rotation);
    return 1;
}

int _GET_CHARA_ROT(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR rotation;
    if (argument_count < 3)
        return 0;
    EdEventInfo.main_character->GetRotation(rotation);
    SetRotation(stack, rotation);
    return 1;
}

int _TURN_CHARA(RS_STACKDATA *stack, int argument_count);
#ifdef NON_MATCHING
int _TURN_CHARA(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR position;
    GetPosition(stack, position);
    stack += 3;
    turn_chara(EdEventInfo.main_character, position, GetStackFloat(stack));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _TURN_CHARA__FP12RS_STACKDATAi);
#endif

int _GET_NPC_TALK_POS(RS_STACKDATA *stack, int argument_count) {
    int position[2];
    if (argument_count < 2)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    int index = GetStackInt(stack);
    if (index == -1)
        return _GET_CHARA_TALK_POS(result, argument_count - 1);
    if (index < 0 || index >= EdEventInfo.npc_count)
        return 0;
    GetScrPosFromChar(&EdEventInfo.npcs[index].chara, position);
    SetStack(result++, position[0]);
    SetStack(result, position[1]);
    return 1;
}

int _GET_NPC_POS(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR position;
    if (argument_count < 4)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    CCharacter *character = GetChara(GetStackInt(stack));
    if (character == NULL)
        return 0;
    character->GetPosition(position);
    if (character->frame != NULL && character->frame->parent != NULL) {
        SetStack(result++, position[0]);
        SetStack(result++, position[1]);
        SetStack(result, position[2]);
        return 1;
    }
    SetPosition(result, position);
    return 1;
}

int _SET_NPC_POS(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR position;
    RS_STACKDATA *argument = (0, stack + 1);
    CCharacter *character = GetChara(GetStackInt(stack));
    if (character == NULL)
        return 0;
    if (character->frame != NULL && character->frame->parent != NULL) {
        position[0] = GetStackFloat(argument++);
        position[1] = GetStackFloat(argument++);
        position[2] = GetStackFloat(argument);
        position[3] = 1.0f;
        character->SetPosition(position);
        return 1;
    }
    GetPosition(argument, position);
    character->SetPosition(position);
    return 1;
}

int _SET_NPC_ROT(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR rotation;
    CCharacter *character = GetChara(GetStackInt(stack++));
    if (character == NULL)
        return 0;
    CFrame *parent = NULL;
    if (character->frame != NULL)
        parent = character->frame->parent;
    if (argument_count == 4) {
        if (parent != NULL) {
            rotation[0] = GetStackFloat(stack++);
            rotation[1] = GetStackFloat(stack++);
            rotation[2] = GetStackFloat(stack++);
        } else {
            GetRotation(stack, rotation);
            stack += 3;
        }
    }
    if (argument_count == 2) {
        rotation[2] = 0.0f;
        rotation[0] = 0.0f;
        rotation[1] = GetStackFloat(stack);
        if (parent == NULL)
            GetWorldRot(rotation, rotation);
    }
    character->SetRotation(rotation);
    return 1;
}

int _GET_NPC_ROT(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR rotation;
    if (argument_count < 4)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    CCharacter *character = GetChara(GetStackInt(stack));
    if (character == NULL)
        return 0;
    character->GetRotation(rotation);
    if (character->frame != NULL && character->frame->parent != NULL) {
        SetStack(result++, rotation[0]);
        SetStack(result++, rotation[1]);
        SetStack(result, rotation[2]);
        return 1;
    }
    SetRotation(result, rotation);
    return 1;
}

int _SET_NPC_SCALE(RS_STACKDATA *stack, int argument_count) {
    CCharacter *character = GetChara(GetStackInt(stack++));
    if (character == NULL)
        return 0;
    float x = GetStackFloat(stack++);
    if (argument_count == 2)
        character->SetScale(x, x, x);
    else {
        float y = GetStackFloat(stack++);
        float z = GetStackFloat(stack);
        character->SetScale(x, y, z);
    }
    return 1;
}

int _GET_NPC_SCALE(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR scale;
    RS_STACKDATA *result = (0, stack + 1);
    CCharacter *character = GetChara(GetStackInt(stack));
    if (character == NULL)
        return 0;
    character->GetScale(scale);
    SetStack(result++, scale[0]);
    SetStack(result++, scale[1]);
    SetStack(result, scale[2]);
    return 1;
}

int _NPC_POS_INIT(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR transform = {0.0f, 0.0f, 0.0f, 0.0f};
    for (int i = 0; i < argument_count; i++) {
        CCharacter *character = GetChara(GetStackInt(stack++));
        if (character != NULL) {
            character->SetPosition(transform);
            character->SetRotation(transform);
        }
    }
    return 1;
}

int _GET_NPC_PARTS_NO(RS_STACKDATA *stack, int argument_count) {
    if (argument_count < 2)
        return 0;
    int index = GetStackInt(stack++);
    if (index < 0 || index >= 16)
        return 0;
    SetStack(stack++, EdEventInfo.villagers[index].character_no);
    return 1;
}

int _SET_NPC_MOTION(RS_STACKDATA *stack, int argument_count) {
    int index = GetStackInt(stack++);
    CCharacter *character;
    if (index == -1)
        character = EdEventInfo.main_character;
    else
        character = &GetNPC(index)->chara;
    if (character == NULL)
        return 0;
    int motion = GetStackInt(stack++);
    float speed = -1.0f;
    if (argument_count >= 3)
        speed = GetStackFloat(stack++);
    if (argument_count == 4)
        character->SetMotion(motion, GetStackInt(stack));
    else
        character->SetMotion(motion, 0);
    if (speed > 0.0f)
        character->SetMotionSpeed(speed);
    return 1;
}

int _SET_NPC_ANIME(RS_STACKDATA *stack, int argument_count) {
    int index = GetStackInt(stack++);
    CCharacter *character;
    if (index == -1)
        character = EdEventInfo.main_character;
    else
        character = &GetNPC(index)->chara;
    if (character == NULL)
        return 0;
    int animation = GetStackInt(stack++);
    int enable = 1;
    if (argument_count == 3)
        enable = GetStackInt(stack);
    if (animation == -1 && enable == 0)
        character->ClearTexAnime();
    if (enable != 0)
        character->TexAnimeOn(animation);
    else
        character->TexAnimeOff(animation);
    return 1;
}

int _TURN_NPC(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR position;
    int index = GetStackInt(stack++);
    if (index == -1)
        return _TURN_CHARA(stack, argument_count - 1);
    CCharacter *character = &GetNPC(index)->chara;
    if (character == NULL)
        return 0;
    GetPosition(stack, position);
    turn_chara(character, position, GetStackFloat(stack += 3));
    return 1;
}

#ifdef NON_MATCHING
int _NPC_DRAW(RS_STACKDATA *stack, int argument_count) {
    int draw = GetStackInt(stack++);
    for (int i = 0; i < argument_count - 1; i++) {
        int index;
        if (GetChara(index = GetStackInt(stack++)) != NULL) {
            if (index < 0)
                EdEventInfo.player_draw = draw;
            if (index >= 0 && index < 16)
                EdEventInfo.npc_draw[index] = draw;
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_DRAW__FP12RS_STACKDATAi);
#endif

#ifdef NON_MATCHING
int _NPC_DRAW_SHADOW(RS_STACKDATA *stack, int argument_count) {
    int draw = GetStackInt(stack++);
    for (int i = 0; i < argument_count - 1; i++) {
        int index;
        if (GetChara(index = GetStackInt(stack++)) != NULL) {
            if (index < 0)
                EdEventInfo.player_shadow_draw = draw;
            if (index >= 0 && index < 16)
                EdEventInfo.npc_shadow_draw[index] = draw;
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_DRAW_SHADOW__FP12RS_STACKDATAi);
#endif

#ifdef NON_MATCHING
int _SET_NPC_FOOT_SOUND(RS_STACKDATA *stack, int argument_count) {
    int mode = GetStackInt(stack++);
    for (int i = 0; i < argument_count - 1; i++) {
        int index;
        CCharacter *character = GetChara(index = GetStackInt(stack++));
        if (character != NULL) {
            if (index < 0)
                EdEventInfo.player_foot_sound = mode;
            if (index >= 0 && index < 16)
                EdEventInfo.npc_foot_sound[index] = mode;
            if (mode == 2)
                character->FootSoundEnable(1);
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_FOOT_SOUND__FP12RS_STACKDATAi);
#endif

int _SET_NPC_FLOOR_ID(RS_STACKDATA *stack, int) {
    RS_STACKDATA *argument = (0, stack + 1);
    CCharacter *character = GetChara(GetStackInt(stack));
    if (character == NULL)
        return 0;
    character->SetFootSoundID(GetStackInt(argument));
    return 1;
}

/**
 * Script opcode that steps a villager; the step happens elsewhere.
 *
 * @mangled _NPC_STEP__FP12RS_STACKDATAi
 * @address 0x18F0A0
 * @size 0xC
 */
s32 _NPC_STEP(RS_STACKDATA *stack, s32 argument_count) {
    return 1;
}

int _NPC_COL(RS_STACKDATA *stack, int argument_count) {
    int collision = GetStackInt(stack++);
    for (int i = 0; i < argument_count - 1; i++) {
        int index = GetStackInt(stack++);
        if (index >= 0)
            EdEventInfo.npc_collision[index] = collision;
        if (index == -1)
            EdEventInfo.player_collision = collision;
    }
    return 1;
}

int _NPC_STOP(RS_STACKDATA *stack, int argument_count) {
    int stopped = GetStackInt(stack++);
    for (int i = 0; i < argument_count - 1; i++) {
        int index = GetStackInt(stack++);
        if (index >= 0)
            EdEventInfo.npc_stop[index] = stopped;
        if (index == -1)
            EdEventInfo.player_stop = stopped;
    }
    return 1;
}

int _NPC_DRAW_BEFORE(RS_STACKDATA *stack, int argument_count) {
    int order = GetStackInt(stack++);
    int i = 0;
    while (i < argument_count - 1) {
        int index = GetStackInt(stack++);
        if (index >= 0)
            EdEventInfo.npc_draw_before[index] = order;
        i++;
    }
    return 1;
}

int _INIT_NPC_CLOTH(RS_STACKDATA *stack, int) {
    int index = GetStackInt(stack);
    CCharacter *character;
    if (index == -1)
        character = EdEventInfo.main_character;
    else
        character = &GetNPC(index)->chara;
    if (character == NULL)
        return 0;
    character->ClothStep(-1);
    return 1;
}

int _NPC_CLOTH_FLOOR(RS_STACKDATA *stack, int) {
    RS_STACKDATA *argument = (0, stack + 1);
    CCharacter *character = GetChara(GetStackInt(stack));
    if (character == NULL)
        return 0;
    character->ClothFloor(GetStackInt(argument));
    return 1;
}

int _NPC_CLOTH_STEP(RS_STACKDATA *stack, int argument_count) {
    CCharacter *character = GetChara(GetStackInt(stack++));
    if (character == NULL)
        return 0;
    int steps = 1;
    if (argument_count > 1) {
        steps = GetStackInt(stack);
    }
    for (int i = 0; i < steps; i++)
        character->ClothStep(0);
    return 1;
}

int _SET_NPC_AMBIENT(RS_STACKDATA *stack, int argument_count) {
    CCharacter *character = GetChara(GetStackInt(stack++));
    if (character == NULL)
        return 0;
    sceVu0FVECTOR ambient = {0.0f, 0.0f, 0.0f, 128.0f};
    if (argument_count == 1) {
        sceVu0CopyVector(character->ambient_offset, ambient);
        return 1;
    }
    if ((unsigned int) (argument_count - 2) < 2) {
        float value = GetStackInt(stack++);
        character->ambient_offset[0] = value;
        character->ambient_offset[1] = value;
        character->ambient_offset[2] = value;
    }
    if (argument_count >= 4) {
        character->ambient_offset[0] = GetStackInt(stack++);
        character->ambient_offset[1] = GetStackInt(stack++);
        character->ambient_offset[2] = GetStackInt(stack++);
    }
    if (argument_count >= 5)
        character->ambient_offset[3] = GetStackInt(stack);
    return 1;
}

int _SET_NPC_BODY_SIZE(RS_STACKDATA *stack, int argument_count) {
    CCharacter *character = GetChara(GetStackInt(stack++));
    if (character == NULL)
        return 0;
    if (argument_count > 1) {
        character->body_width = GetStackFloat(stack++);
    }
    if (argument_count > 2) {
        character->body_height = GetStackFloat(stack++);
    }
    if (argument_count > 3) {
        character->body_depth = GetStackFloat(stack);
    }
    return 1;
}

int _GET_NPC_BODY_SIZE(RS_STACKDATA *stack, int argument_count) {
    CCharacter *character = GetChara(GetStackInt(stack++));
    if (character == NULL)
        return 0;
    if (argument_count > 1) {
        SetStack(stack++, character->body_width);
    }
    if (argument_count > 2) {
        SetStack(stack++, character->body_height);
    }
    if (argument_count > 3) {
        SetStack(stack, character->body_depth);
    }
    return 1;
}

int _NPC_PLIGHT_INIT(RS_STACKDATA *stack, int) {
    CCharacter *character = GetChara(GetStackInt(stack));
    if (character == NULL)
        return 0;
    character->ClearPointLight();
    return 1;
}

int _SET_NPC_PLIGHT(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR position;
    float light[5];
    CCharacter *character = GetChara(GetStackInt(stack++));
    if (character == NULL)
        return 0;
    GetPosition(stack, position);
    stack += 3;
    for (int i = 0; i < 5; i++)
        light[i] = GetStackFloat(stack++);
    return character->SetPointLight(position, light[0], light[1], light[2], light[3], light[4], 128.0f);
}

int _SGET_NPC_TALK_MES(RS_STACKDATA *stack, int argument_count) {
    if (argument_count < 2)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    SV_GRD_NPC *npc = SaveData->GetGrdNPCData(NowEditMap, GetStackInt(stack));
    if (npc == NULL)
        return 0;
    SetStack(result, npc->talk_message);
    return 1;
}

int _SSET_NPC_TALK_MES(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    SV_GRD_NPC *npc = SaveData->GetGrdNPCData(NowEditMap, GetStackInt(stack));
    if (npc == NULL)
        return 0;
    npc->talk_message = GetStackInt(next);
    return 1;
}

static ClsMes *GetMes(int index) {
    if (index < 0 || index >= 8)
        return NULL;
    return EdEventInfo.messages[index];
}

int _MES_MAKE(RS_STACKDATA *stack, int argument_count) {
    ClsMes *message = GetMes(GetStackInt(stack++));
    if (message == NULL)
        return 0;
    if (EdEventInfo.camera != NULL) {
        sceVu0FMATRIX view;
        sceVu0FVECTOR eye;
        EdEventInfo.camera->GetCameraMatrix(view);
        EdEventInfo.camera->GetPos(eye);
        MGSetViewMatrix(view, eye);
    }
    int message_no = GetStackInt(stack++);
    if (argument_count >= 3)
        message->value = GetStackInt(stack++);
    if (argument_count >= 4) {
        for (int i = 0; i < 4; i++)
            message->mes_no[i] = -1;
        for (int i = 4; argument_count >= i; i++) {
            int slot_message = GetStackInt(stack++);
            message->mes_no[i - 4] = slot_message;
            printf("%d %d\n", i - 4, slot_message);
        }
    }
    message->MakeMesWin(message_no);
    return 1;
}

int _MES_CLOSE(RS_STACKDATA *stack, int) {
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    message->text_rate = message->text_rate_set;
    message->mes_made = -1;
    message->fade_in = 0;
    return 1;
}

int _MES_NEXTPAGE(RS_STACKDATA *stack, int) {
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    message->GoNextPage();
    return 1;
}

#ifdef NON_MATCHING
int _SET_MES_AUTOSET(RS_STACKDATA *stack, int argument_count) {
    ClsMes *message = GetMes(GetStackInt(stack++));
    if (message == NULL)
        return 0;
    if (EdEventInfo.camera != NULL) {
        sceVu0FMATRIX view;
        sceVu0FVECTOR eye;
        EdEventInfo.camera->GetCameraMatrix(view);
        EdEventInfo.camera->GetPos(eye);
        MGSetViewMatrix(view, eye);
    }
    int position[4];
    int talk_position[4];
    if (argument_count == 5) {
        for (int i = 0; i < 4; i++)
            position[i] = GetStackInt(stack++);
        message->AutoSet(position);
        return 1;
    }
    if (argument_count == 3) {
        int first_index = GetStackInt(stack++);
        int second_index = GetStackInt(stack);
        message->AutoSetSub(
            first_index == -1 ? EdEventInfo.main_character : &GetNPC(first_index)->chara,
            second_index == -1 ? EdEventInfo.main_character : &GetNPC(second_index)->chara,
            talk_position);
        message->AutoSet(talk_position);
        return 1;
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_AUTOSET__FP12RS_STACKDATAi);
#endif

int _SET_MES_SHIPPO(RS_STACKDATA *stack, int argument_count) {
    ClsMes *message = GetMes(GetStackInt(stack++));
    if (message == NULL)
        return 0;
    message->tail_on = GetStackInt(stack++);
    if (argument_count > 2)
        message->tail_length = GetStackInt(stack++);
    if (argument_count > 3)
        message->tail_half_width = GetStackInt(stack);
    return 1;
}

int _SET_MES_POS(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    message->auto_pos = GetStackInt(next);
    return 1;
}

int _SET_MES_DRAWSPEED(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    message->text_rate = GetStackFloat(next);
    return 1;
}

int _SET_MES_CURSOR(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    message->cursor_row = GetStackInt(next);
    return 1;
}

int _SET_MES_OKURI(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    message->page_arrow = GetStackInt(next);
    return 1;
}

int _SET_MES_WIN_FLAG(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    message->stay_frame = GetStackInt(next);
    return 1;
}

int _CHECK_MES_COMPLETE(RS_STACKDATA *stack, int argument_count) {
    if (argument_count < 2)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    SetStack(result, message->State() == 3);
    return 1;
}

int _CHECK_MES_WAIT(RS_STACKDATA *stack, int argument_count) {
    if (argument_count < 2)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    SetStack(result, message->State() == 5);
    return 1;
}

int _CHECK_MES(RS_STACKDATA *stack, int argument_count) {
    if (argument_count < 2)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    SetStack(result, message->State() == 0);
    return 1;
}

int _SET_MES_FUKIDASHI(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    ClsMes *message = GetMes(GetStackInt(stack));
    if (message == NULL)
        return 0;
    message->SetMesFukidashi(GetStackInt(next));
    return 1;
}

int _ITEM_GET_MES(RS_STACKDATA *stack, int argument_count) {
    int item = GetStackInt(stack++);
    int attachment = -1;
    if (GetAddAttachItem(item) != 0)
        attachment = 3;
    if (argument_count == 2)
        attachment = GetStackInt(stack);
    ItemGetMes(item, attachment, 40, 1);
    return 1;
}

int _INIT_SYS_MES(RS_STACKDATA *, int) {
    ClearSystemMes();
    return 1;
}

int _SKILL_GET_MES(RS_STACKDATA *stack, int) {
    TecGetMes(GetStackInt(stack), 40);
    return 1;
}

int _ADD_MAXITEM_MES(RS_STACKDATA *stack, int) {
    int amount = GetStackInt(stack);
    if (amount < 0)
        amount = EdAddMaxItem(0);
    MaxUpMes(amount, 40);
    return 1;
}

int _CHECK_COMPLETE_PARTS(RS_STACKDATA *stack, int argument_count) {
    if (argument_count < 2)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    SetStack(result, (0, EditPartsInfo.CheckComplete(GetStackInt(stack))));
    return 1;
}

int _GET_EDIT_PARTS_POS(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;
    CMapParts *parts = EdEventInfo.edit_ground->GetPartsObject(GetStackInt(stack++));
    if (parts == NULL)
        return 0;
    if (argument_count < 4)
        return 0;
    parts->GetPosition(position);
    parts->GetRotation(rotation);
    SetStack(stack++, position[0]);
    SetStack(stack++, position[1]);
    SetStack(stack++, position[2]);
    if (argument_count == 7) {
        SetStack(stack++, rotation[0]);
        SetStack(stack++, rotation[1]);
        SetStack(stack, rotation[2]);
    }
    return 1;
}

int _GET_NOW_TIME(RS_STACKDATA *stack, int) {
    SetStack(stack, (0, EdGetTime(EdEventInfo.current_time)));
    return 1;
}

int _SET_CLOCK(RS_STACKDATA *stack, int) {
    EdSetClock(GetStackFloat(stack));
    return 1;
}

int _GET_CLOCK(RS_STACKDATA *stack, int) {
    SetStack(stack, EdGetClock());
    return 1;
}

int _SGET_CMP_EVENT(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    int event = GetStackInt(stack);
    SetStack(result, (0, EditPartsInfo.GetCompEvent(event)));
    return 1;
}

int _SSET_CMP_EVENT(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int event = GetStackInt(stack);
    EditPartsInfo.SetCompEvent(event, GetStackInt(next));
    return 1;
}

int _SCHECK_REQUEST(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    int request = GetStackInt(stack);
    SetStack(result, (0, EditPartsInfo.GetRequest(request)));
    return 1;
}

int _CHECK_PLACE(RS_STACKDATA *stack, int) {
    SetStack(stack, EdInteriorFlag);
    return 1;
}

int _CHECK_VILLAGER(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    int index = GetStackInt(stack);
    SetStack(result, EdCheckVillager(index, &EdEventInfo.villagers[index], EdEventInfo.edit_ground));
    return 1;
}

int _DELETE_ROBO_PARTS(RS_STACKDATA *, int) {
    EdDeleteE05RoboParts();
    return 1;
}

int _HOBJ_FIXPARTS(RS_STACKDATA *stack, int) {
    if (EdEventInfo.fixed_parts == NULL)
        return 1;
    if (EdEventInfo.fixed_parts_count <= 0)
        return 1;
    int handle = GetStackInt(stack++);
    int index = GetStackInt(stack++);
    if (index < 0 || index >= EdEventInfo.fixed_parts_count)
        return 0;
    int result = 1;
    return SetObjHandle(handle, &EdEventInfo.fixed_parts[index], GetStackString(stack)) ? result : 0;
}

int _HOBJ_EDITPARTS(RS_STACKDATA *stack, int) {
    if (EdEventInfo.edit_parts == NULL)
        return 1;
    if (EdEventInfo.edit_parts_count <= 0)
        return 1;
    int handle = GetStackInt(stack++);
    int index = GetStackInt(stack++);
    if (index < 0 || index >= EdEventInfo.edit_parts_count)
        return 0;
    int result = 1;
    return SetObjHandle(handle, &EdEventInfo.edit_parts[index], GetStackString(stack)) ? result : 0;
}

int _HOBJ_INTERIORPARTS(RS_STACKDATA *stack, int) {
    if (EdEventInfo.interior_parts == NULL)
        return 1;
    if (EdEventInfo.interior_parts_count <= 0)
        return 1;
    int handle = GetStackInt(stack++);
    int index = GetStackInt(stack++);
    if (index < 0 || index >= EdEventInfo.interior_parts_count)
        return 0;
    int result = 1;
    return SetObjHandle(handle, &EdEventInfo.interior_parts[index], GetStackString(stack)) ? result : 0;
}

int _HOBJ_CHARA(RS_STACKDATA *stack, int) {
    int handle_index = GetStackInt(stack++);
    CCharacter *character = GetChara(GetStackInt(stack++));
    if (character == NULL)
        return 0;
    return SetObjHandle(handle_index, character, GetStackString(stack)) != 0 ? 1 : 0;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_BT_HOBJ__FP12RS_STACKDATAi);

int _HOBJ_ITEM(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int handle_index = GetStackInt(stack);
    CFrame *frame = GetItemFrame(GetStackInt(next));
    if (frame == NULL)
        return 0;
    return SetObjHandle(handle_index, frame) != 0 ? 1 : 0;
}

#ifdef NON_MATCHING
int _OBJ_DRAW(RS_STACKDATA *stack, int argument_count) {
    int draw = GetStackInt(stack++);
    for (int i = 0; i < argument_count - 1; i++) {
        OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack++));
        if (handle != NULL)
            obj_draw(handle, draw);
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _OBJ_DRAW__FP12RS_STACKDATAi);
#endif

int _SET_OBJ_POS(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR position;
    OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack++));
    if (handle == NULL)
        return 0;
    position[0] = GetStackFloat(stack++);
    position[1] = GetStackFloat(stack++);
    position[2] = GetStackFloat(stack);
    position[3] = 1.0f;
    set_obj_pos(handle, position);
    return 1;
}

int _GET_OBJ_POS(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR position;
    OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack++));
    if (handle == NULL)
        return 0;
    if (argument_count < 4)
        return 0;
    get_obj_pos(handle, position);
    SetStack(stack++, position[0]);
    SetStack(stack++, position[1]);
    SetStack(stack, position[2]);
    return 1;
}

int _SET_OBJ_ROT(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR rotation;
    OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack++));
    if (handle == NULL)
        return 0;
    rotation[0] = AngleLimit(GetStackFloat(stack++));
    rotation[1] = AngleLimit(GetStackFloat(stack++));
    rotation[2] = AngleLimit(GetStackFloat(stack));
    rotation[3] = 0.0f;
    set_obj_rot(handle, rotation);
    return 1;
}

int _GET_OBJ_ROT(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR rotation;
    OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack++));
    if (handle == NULL)
        return 0;
    if (argument_count < 4)
        return 0;
    get_obj_rot(handle, rotation);
    SetStack(stack++, rotation[0]);
    SetStack(stack++, rotation[1]);
    SetStack(stack, rotation[2]);
    return 1;
}

int _SET_OBJ_SCALE(RS_STACKDATA *stack, int) {
    RS_STACKDATA *arguments = (0, stack + 1);
    OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack));
    if (handle == NULL)
        return 0;
    sceVu0FVECTOR scale;
    scale[0] = GetStackFloat(arguments++);
    scale[1] = GetStackFloat(arguments++);
    scale[2] = GetStackFloat(arguments);
    scale[3] = 0.0f;
    set_obj_scale(handle, scale);
    return 1;
}

int _GET_OBJ_SCALE(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR scale;
    OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack++));
    if (handle == NULL)
        return 0;
    if (argument_count < 4)
        return 0;
    get_obj_scale(handle, scale);
    SetStack(stack++, scale[0]);
    SetStack(stack++, scale[1]);
    SetStack(stack, scale[2]);
    return 1;
}

int _SYNC_OBJ_OBJ(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    OBJ_HANDLE *source = GetObjHandle(GetStackInt(stack));
    if (source == NULL)
        return 0;
    OBJ_HANDLE *target = GetObjHandle(GetStackInt(next));
    if (target == NULL)
        return 0;
    sync_obj_obj(source, target);
    return 1;
}

int _RELEASE_OBJ_OBJ(RS_STACKDATA *stack, int) {
    OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack));
    if (handle == NULL)
        return 0;
    release_obj_obj(handle);
    return 1;
}

int _SET_OBJ_FOG(RS_STACKDATA *stack, int) {
    OBJ_HANDLE *handle = GetObjHandle(GetStackInt(stack++));
    if (handle == NULL)
        return 0;
    CFrameAttr attr;
    attr.fog_enable = GetStackInt(stack++);
    set_attr_obj(handle, attr, GetStackInt(stack), 0x40);
    return 1;
}

int _GET_TALKNPC_INFO_ID(RS_STACKDATA *stack, int argument_count) {
    if (argument_count <= 0)
        return 0;
    SetStack(stack, EdNowTalkCharaInfoID());
    return 1;
}

int _GET_TALKNPC_ID(RS_STACKDATA *stack, int argument_count) {
    if (argument_count <= 0)
        return 0;
    SetStack(stack, EdEventInfo.talk_npc_id);
    return 1;
}

#ifdef NON_MATCHING
int _GET_TALKNPC_STATUS(RS_STACKDATA *stack, int) {
    int index = EdEventInfo.talk_npc_id;
    int status = 0;
    if (index >= 0 && index < EdEventInfo.npc_count) {
        CNPCharacter *npcs = EdEventInfo.npcs;
        status = npcs[index].event_status;
    }
    SetStack(stack, status);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_TALKNPC_STATUS__FP12RS_STACKDATAi);
#endif

int _SET_TALK_CAMERA(RS_STACKDATA *stack, int) {
    static sceVu0FVECTOR vv[3] = {
        {-18.8f, 7.1f, -21.3f, 1.0f},
        {21.0f, 6.5f, -5.7f, 1.0f},
        {22.6f, 6.9f, 16.5f, 1.0f},
    };
    int view = GetStackInt(stack);
    sceVu0FVECTOR player_position;
    sceVu0FVECTOR npc_position;
    sceVu0FVECTOR direction;
    EdEventInfo.main_character->GetPosition(player_position);
    EdEventInfo.npcs[EdEventInfo.talk_npc_id].chara.GetPosition(npc_position);
    if (EdEventInfo.npcs[EdEventInfo.talk_npc_id].event_status == 0)
        view = 0;
    sceVu0SubVector(direction, npc_position, player_position);
    float angle = atan2f(direction[0], direction[2]);
    sceVu0FVECTOR midpoint;
    sceVu0AddVector(midpoint, player_position, npc_position);
    sceVu0ScaleVector(midpoint, midpoint, 0.5f);
    midpoint[1] += 15.0f;
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera != NULL) {
        camera->FollowOff();
        camera->SetNextRef(NULL, midpoint[0], midpoint[1], midpoint[2]);
        camera->SetRef(midpoint);
    }
    sceVu0FVECTOR camera_position;
    sceVu0FMATRIX rotation;
    sceVu0UnitMatrix(rotation);
    sceVu0RotMatrixY(rotation, rotation, angle);
    sceVu0ApplyMatrix(camera_position, rotation, vv[view]);
    sceVu0AddVector(camera_position, midpoint, camera_position);
    if (camera != NULL)
        camera->SetPos(camera_position);
    if (camera != NULL)
        camera->SetNextPos(NULL, camera_position[0], camera_position[1], camera_position[2]);
    if (camera != NULL) {
        sceVu0FMATRIX view_matrix;
        sceVu0FVECTOR eye;
        camera->GetCameraMatrix(view_matrix);
        camera->GetPos(eye);
        MGSetViewMatrix(view_matrix, eye);
    }
    return 1;
}

int _SET_TALK_MES(RS_STACKDATA *stack, int argument_count) {
    for (int i = 0; i < 16; i++)
        EdEventInfo.talk_messages[i] = -1;
    for (int i = 0; i < argument_count; i++) {
        if (i >= 16)
            return 0;
        EdEventInfo.talk_messages[i] = GetStackInt(stack++);
    }
    return 1;
}

int _SET_TALK_SELECT_MES(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    EdEventInfo.talk_select_prompt = GetStackInt(stack);
    EdEventInfo.talk_select_message = GetStackInt(next);
    return 1;
}

#ifdef NON_MATCHING
int _EVERY_TALK_EVENT(RS_STACKDATA *stack, int argument_count) {
    int villager_id = GetStackInt(stack++);
    if (villager_id < 0 || villager_id >= 16)
        return 0;
    int event_no = villager_id + 0x104;
    if (argument_count >= 2)
        event_no = GetStackInt(stack);
    for (int i = 0; i < EdEventInfo.npc_count; i++) {
        CNPCharacter *npc = GetNPC(i);
        if (npc->villager_id == villager_id)
            npc->recurring_talk_event = event_no;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _EVERY_TALK_EVENT__FP12RS_STACKDATAi);
#endif

static CCameraFollow *GetCamera() {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return NULL;
    camera->FollowOff();
    return camera;
}

int _SET_CAMERA(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR reference;
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 0;
    GetPosition(stack, position);
    GetPosition(stack + 3, reference);
    float speed = GetStackFloat(stack += 6);
    follow_chara = NULL;
    camera->FollowOff();
    camera->SetNextPos(NULL, position[0], position[1], position[2]);
    camera->SetNextRef(NULL, reference[0], reference[1], reference[2]);
    camera->SetSpeed(speed);
    if (speed <= 1.0f) {
        camera->SetPos(position);
        camera->SetRef(reference);
        camera->Step(-1);
    }
    return 1;
}

int _SET_CAMERA_POS(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 0;
    follow_chara = NULL;
    camera->FollowOff();
    sceVu0FVECTOR position;
    GetPosition(stack, position);
    camera->SetNextPos(NULL, position[0], position[1], position[2]);
    return 1;
}

int _GET_CAMERA_POS(RS_STACKDATA *stack, int argument_count) {
    if (argument_count < 3)
        return 0;
    if (EdEventInfo.camera == NULL)
        return 0;
    sceVu0FVECTOR position;
    EdEventInfo.camera->GetPos(position);
    SetPosition(stack, position);
    return 1;
}

int _SET_CAMERA_REF(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 0;
    follow_chara = NULL;
    camera->FollowOff();
    sceVu0FVECTOR position;
    GetPosition(stack, position);
    camera->SetNextRef(NULL, position[0], position[1], position[2]);
    return 1;
}

int _GET_CAMERA_REF(RS_STACKDATA *stack, int argument_count) {
    if (argument_count < 3)
        return 0;
    if (EdEventInfo.camera == NULL)
        return 0;
    sceVu0FVECTOR position;
    EdEventInfo.camera->GetRef(position);
    SetPosition(stack, position);
    return 1;
}

int _SET_CAMERA_SPEED(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 0;
    camera->SetSpeed((float) GetStackInt(stack));
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_FOLLOW_CAMERA__FP12RS_STACKDATAi);

int _ADD_CAMERA_ANGLE(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 0;
    camera->AddAngle(GetStackFloat(stack));
    camera->FollowOn();
    return 1;
}

int _ADD_CAMERA_HEIGHT(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 0;
    camera->AddHeight(GetStackFloat(stack));
    camera->FollowOn();
    return 1;
}

int _ADD_CAMERA_DIST(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 0;
    camera->AddDistance(GetStackFloat(stack));
    camera->FollowOn();
    return 1;
}

int _CAMERA_STEP(RS_STACKDATA *, int) {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 1;
    if (follow_chara != NULL) {
        sceVu0FVECTOR position;
        follow_chara->GetPosition(position);
        camera->SetFollow(position[0], position[1] + 0.7f * follow_chara->body_height, position[2]);
    }
    return 1;
}

int _SET_PROJECTION(RS_STACKDATA *stack, int) {
    EdEventInfo.projection = GetStackFloat(stack);
    return 1;
}

int _ITEM_GET_CAMERA(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = EdEventInfo.camera;
    if (camera == NULL)
        return 0;
    float distance = GetStackFloat(stack);
    if (distance < 0.0f)
        return 1;
    if (distance < 10.0f)
        distance = 10.0f;
    camera->FollowOff();
    CCharacter *character = GetChara(-1);
    sceVu0FVECTOR character_position;
    sceVu0FVECTOR character_rotation;
    character->GetPosition(character_position);
    character_position[3] = 1.0f;
    character->GetRotation(character_rotation);
    sceVu0FMATRIX rotation;
    sceVu0UnitMatrix(rotation);
    sceVu0RotMatrixY(rotation, rotation, character_rotation[1]);
    sceVu0CopyVector(rotation[3], character_position);
    sceVu0FVECTOR camera_position = {0.0f, 16.0f, distance, 1.0f};
    sceVu0FVECTOR camera_reference = {0.0f, 15.0f, 0.0f, 1.0f};
    sceVu0ApplyMatrix(camera_position, rotation, camera_position);
    sceVu0ApplyMatrix(camera_reference, rotation, camera_reference);
    camera->SetPos(camera_position);
    camera->SetNextPos(NULL, camera_position[0], camera_position[1], camera_position[2]);
    camera->SetRef(camera_reference);
    camera->SetNextRef(NULL, camera_reference[0], camera_reference[1], camera_reference[2]);
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_ROTATE__FP12RS_STACKDATAi);

int _GET_CAMERA_ROTATE(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR reference;
    sceVu0FVECTOR direction;
    CCameraFollow *camera = GetCamera();
    if (camera == NULL)
        return 0;
    camera->GetPos(position);
    camera->GetRef(reference);
    sceVu0SubVector(direction, position, reference);
    SetStack(stack, GetLocalRotY(atan2f(direction[0], direction[2])));
    return 1;
}

int _RESET_CAMERA(RS_STACKDATA *stack, int) {
    EdEventInfo.reset_camera_angle = GetStackInt(stack);
    EdEventInfo.reset_camera_yaw = 3.1415927f;
    return 1;
}

int _RESET_CAMERA_ANGLE(RS_STACKDATA *stack, int) {
    EdEventInfo.reset_camera_angle = 1;
    EdEventInfo.reset_camera_yaw = AngleLimit(GetStackFloat(stack));
    return 1;
}

int _SYNC_CAMERA_REF_CHARA(RS_STACKDATA *stack, int argument_count) {
    sync_camera_ref_chara = GetChara(GetStackInt(stack++));
    if (argument_count == 4) {
        sync_camera_ref_offset[0] = GetStackFloat(stack++);
        sync_camera_ref_offset[1] = GetStackFloat(stack++);
        sync_camera_ref_offset[2] = GetStackFloat(stack);
    } else {
        sync_camera_ref_offset[0] = 0.0f;
        sync_camera_ref_offset[1] = 0.0f;
        sync_camera_ref_offset[2] = 0.0f;
    }
    return 1;
}

int _RELEASE_CAMERA_REF_CHARA(RS_STACKDATA *, int) {
    sync_camera_ref_chara = NULL;
    return 1;
}

int _SYNC_CAMERA_REF_OBJ(RS_STACKDATA *stack, int argument_count) {
    sync_camera_ref_obj = GetObjHandle(GetStackInt(stack++));
    if (argument_count == 4) {
        sync_camera_ref_offset[0] = GetStackFloat(stack++);
        sync_camera_ref_offset[1] = GetStackFloat(stack++);
        sync_camera_ref_offset[2] = GetStackFloat(stack);
    } else {
        sync_camera_ref_offset[0] = 0.0f;
        sync_camera_ref_offset[1] = 0.0f;
        sync_camera_ref_offset[2] = 0.0f;
    }
    return 1;
}

int _RELEASE_CAMERA_REF_OBJ(RS_STACKDATA *, int) {
    sync_camera_ref_obj = NULL;
    return 1;
}

int _SYNC_CAMERA_POS_OBJ(RS_STACKDATA *stack, int) {
    sync_camera_pos_obj = GetObjHandle(GetStackInt(stack));
    return 1;
}

int _RELEASE_CAMERA_POS_OBJ(RS_STACKDATA *, int) {
    sync_camera_pos_obj = NULL;
    return 1;
}

int _SET_CAMERA_ROLL(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = GetCamera();
    if (camera == NULL)
        return 0;
    camera->SetRoll(GetStackFloat(stack));
    return 1;
}

int _GET_CAMERA_ROLL(RS_STACKDATA *stack, int) {
    CCameraFollow *camera = GetCamera();
    if (camera == NULL)
        return 0;
    SetStack(stack, camera->GetRoll());
    return 1;
}

int _FADE_IN(RS_STACKDATA *stack, int argument_count) {
    int red;
    int frames = (0, GetStackInt(stack++));
    int blue = 0;
    int green = 0;
    red = 0;
    if (argument_count == 4) {
        red = GetStackInt(stack++);
        green = GetStackInt(stack++);
        blue = GetStackInt(stack);
    }
    EdFadeIn(frames, (float) red, (float) green, (float) blue);
    return 1;
}

int _FADE_OUT(RS_STACKDATA *stack, int argument_count) {
    int red;
    int frames = (0, GetStackInt(stack++));
    int blue = 0;
    int green = 0;
    red = 0;
    if (argument_count == 4) {
        red = GetStackInt(stack++);
        green = GetStackInt(stack++);
        blue = GetStackInt(stack);
    }
    EdFadeOut(frames, (float) red, (float) green, (float) blue);
    return 1;
}

int _CHECK_FADE(RS_STACKDATA *stack, int argument_count) {
    if (argument_count <= 0)
        return 0;
    SetStack(stack, EdFadeOutCheck());
    return 1;
}

int _INIT_SPRITE(RS_STACKDATA *, int) {
    SpriteTable.ClearPointer();
    SpriteTableBack.ClearPointer();
    return 1;
}

int _DRAW_SPRITE(RS_STACKDATA *stack, int) {
    RECT source;
    int x = GetStackInt(stack++);
    int y = GetStackInt(stack++);
    char *name = GetStackString(stack++);
    source.x = GetStackInt(stack++);
    source.y = GetStackInt(stack++);
    source.width = GetStackInt(stack++);
    source.height = GetStackInt(stack);
    CTexture *texture = TexManager.GetTexture(name, -1);
    if (texture == NULL)
        return 0;
    SpriteTable.AddTable(x, y, (sceGsTex0 *) &texture->tex0, &source, 0, 0);
    return 1;
}

int _DRAW_BG_SPRITE(RS_STACKDATA *stack, int) {
    RECT source;
    int x = GetStackInt(stack++);
    int y = GetStackInt(stack++);
    char *name = GetStackString(stack++);
    source.x = GetStackInt(stack++);
    source.y = GetStackInt(stack++);
    source.width = GetStackInt(stack++);
    source.height = GetStackInt(stack);
    CTexture *texture = TexManager.GetTexture(name, -1);
    if (texture == NULL)
        return 0;
    SpriteTableBack.AddTable(x, y, (sceGsTex0 *) &texture->tex0, &source, 0, 0);
    return 1;
}

int _DRAW_BACK(RS_STACKDATA *stack, int argument_count) {
    EdEventInfo.suppress_background = ((GetStackInt(stack++) != 0) ^ 1) & 0xFF;
    float red = -1.0f;
    if (argument_count > 1)
        red = GetStackFloat(stack++);
    float blue = red;
    float green = red;
    if (argument_count == 4) {
        green = GetStackFloat(stack++);
        blue = GetStackFloat(stack);
    }
    EdEventInfo.background_color[0] = red;
    EdEventInfo.background_color[1] = green;
    EdEventInfo.background_color[2] = blue;
    return 1;
}

int _DRAW_SHADOW(RS_STACKDATA *stack, int) {
    EdEventInfo.suppress_shadows = ((GetStackInt(stack) != 0) ^ 1) & 0xFF;
    return 1;
}

#ifdef NON_MATCHING
int _SET_CLIP_POINT(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR plane;
    RS_STACKDATA *distance_argument = stack + 3;
    GetPosition(stack, plane);
    if (EdEventInfo.edit_ground != NULL) {
        float distance = GetStackFloat(distance_argument);
        sceVu0CopyVector(EdEventInfo.edit_ground->clip_plane, plane);
        EdEventInfo.edit_ground->clip_plane[3] = distance;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CLIP_POINT__FP12RS_STACKDATAi);
#endif

int _DRAW_EDIT_WATER(RS_STACKDATA *stack, int) {
    if (EdEventInfo.edit_ground != NULL)
        EdEventInfo.edit_ground->suppress_water = ((GetStackInt(stack) != 0) ^ 1) & 0xFF;
    return 1;
}

int _DRAW_WATER_SURFACE(RS_STACKDATA *stack, int argument_count) {
    int draw = GetStackInt(stack++);
    for (int i = 0; i < argument_count - 1; i++) {
        if (EdEventInfo.edit_ground != NULL) {
            int index = GetStackInt(stack++);
            if (index >= 0 && index < 4)
                EdEventInfo.edit_ground->water_surfaces[index].draw = draw;
        }
    }
    return 1;
}

int _SCREEN_FILTER(RS_STACKDATA *stack, int) {
    int red = GetStackInt(stack++);
    if (red < 0) {
        EdEventInfo.screen_filter = 0;
        return 1;
    }
    int green = GetStackInt(stack++);
    int blue = GetStackInt(stack++);
    int alpha = GetStackInt(stack);
    if (alpha < 0) {
        EdEventInfo.screen_filter = 0;
        return 1;
    }
    EdEventInfo.screen_filter = 1;
    EdEventInfo.screen_filter_color[0] = red;
    EdEventInfo.screen_filter_color[1] = green;
    EdEventInfo.screen_filter_color[2] = blue;
    EdEventInfo.screen_filter_color[3] = alpha;
    return 1;
}

int _DRAW_THUNDER(RS_STACKDATA *stack, int) {
    EdThunderEffectFlag = GetStackInt(stack);
    return 1;
}

int _SET_LIGHT(RS_STACKDATA *stack, int argument_count) {
    EdEventInfo.lighting_override = 1;
    int index = GetStackInt(stack++);
    if (index < 0 || index > 3)
        return 0;
    sceVu0FVECTOR direction;
    direction[0] = GetStackFloat(stack++);
    direction[1] = GetStackFloat(stack++);
    direction[2] = GetStackFloat(stack++);
    direction[3] = 0.0f;
    sceVu0Normalize(direction, direction);
    EdEventInfo.light_direction[0][index] = direction[0];
    EdEventInfo.light_direction[1][index] = direction[1];
    EdEventInfo.light_direction[2][index] = direction[2];
    if (argument_count > 4) {
        EdEventInfo.light_color[index][0] = GetStackFloat(stack++);
        EdEventInfo.light_color[index][1] = GetStackFloat(stack++);
        EdEventInfo.light_color[index][2] = GetStackFloat(stack);
    }
    return 1;
}

int _SET_LIGHT_COLOR(RS_STACKDATA *stack, int) {
    EdEventInfo.lighting_override = 1;
    int index = GetStackInt(stack++);
    if (index < 0 || index > 3)
        return 0;
    EdEventInfo.light_color[index][0] = GetStackFloat(stack++);
    EdEventInfo.light_color[index][1] = GetStackFloat(stack++);
    EdEventInfo.light_color[index][2] = GetStackFloat(stack);
    return 1;
}

int _SET_AMBIENT(RS_STACKDATA *stack, int argument_count) {
    EdEventInfo.lighting_override = 1;
    EdEventInfo.ambient_color[0] = GetStackFloat(stack++);
    EdEventInfo.ambient_color[1] = GetStackFloat(stack++);
    EdEventInfo.ambient_color[2] = GetStackFloat(stack++);
    EdEventInfo.ambient_color[3] = 128.0f;
    if (argument_count > 3)
        EdEventInfo.ambient_color[3] = GetStackFloat(stack);
    return 1;
}

int _SAVE_LIGHT(RS_STACKDATA *stack, int) {
    int slot = GetStackInt(stack);
    if (slot < 0 || slot > 1)
        return 0;
    sceVu0CopyMatrix(save_l[slot], EdEventInfo.light_direction);
    sceVu0CopyMatrix(save_c[slot], EdEventInfo.light_color);
    sceVu0CopyVector(save_a[slot], EdEventInfo.ambient_color);
    return 1;
}

int _LOAD_LIGHT(RS_STACKDATA *stack, int) {
    int slot = GetStackInt(stack);
    if (slot < 0) {
        MGGetPLight(EdEventInfo.light_direction, EdEventInfo.light_color);
        MGGetAmbient(EdEventInfo.ambient_color);
        return 1;
    }
    if (slot > 1)
        return 0;
    sceVu0CopyMatrix(EdEventInfo.light_direction, save_l[slot]);
    sceVu0CopyMatrix(EdEventInfo.light_color, save_c[slot]);
    sceVu0CopyVector(EdEventInfo.ambient_color, save_a[slot]);
    return 1;
}

int _SET_DOF_LEVEL(RS_STACKDATA *stack, int) {
    EdSetDOFLevel(GetStackInt(stack));
    return 1;
}

int _SP_INIT(RS_STACKDATA *stack, int) {
    int index = GetStackInt(stack);
    if (index < 0) {
        for (int i = 0;; i++) {
            ED_SPRITE *sprite = GetSprite(i);
            if (sprite == NULL)
                break;
            InitSprite(sprite);
        }
        return 1;
    }
    ED_SPRITE *sprite = GetSprite(index);
    if (sprite == NULL)
        return 0;
    InitSprite(sprite);
    return 1;
}

int _SP_SET_TEX(RS_STACKDATA *stack, int argument_count) {
    ED_SPRITE *sprite = GetSprite(GetStackInt(stack++));
    if (sprite == NULL)
        return 0;
    sprite->enabled = 1;
    char *name = GetStackString(stack++);
    sprite->source_x = GetStackInt(stack++);
    sprite->source_y = GetStackInt(stack++);
    sprite->source_width = GetStackInt(stack++);
    sprite->source_height = GetStackInt(stack++);
    if (argument_count > 6)
        sprite->bilinear = GetStackInt(stack);
    CTexture *texture = TexManager.GetTexture(name, -1);
    if (texture == NULL)
        return 0;
    sprite->texture = *texture;
    return 1;
}

int _SP_SET_POS(RS_STACKDATA *stack, int argument_count) {
    ED_SPRITE *sprite = GetSprite(GetStackInt(stack++));
    if (sprite == NULL)
        return 0;
    sprite->x = (float) GetStackInt(stack++);
    sprite->y = (float) GetStackInt(stack++);
    sprite->height = -1;
    sprite->width = -1;
    if (argument_count > 3)
        sprite->width = GetStackInt(stack++);
    if (argument_count > 4)
        sprite->height = GetStackInt(stack);
    return 1;
}

int _SP_SET_RGBA(RS_STACKDATA *stack, int argument_count) {
    ED_SPRITE *sprite = GetSprite(GetStackInt(stack++));
    if (sprite == NULL)
        return 0;
    sprite->red = GetStackInt(stack++);
    sprite->green = GetStackInt(stack++);
    sprite->blue = GetStackInt(stack++);
    sprite->alpha = 128;
    if (argument_count > 4)
        sprite->alpha = GetStackInt(stack);
    return 1;
}

int _SP_SET_ROT(RS_STACKDATA *stack, int) {
    ED_SPRITE *sprite;
    RS_STACKDATA *arguments = (0, stack + 1);
    sprite = GetSprite(GetStackInt(stack));
    if (sprite == NULL)
        return 0;
    sprite->rotated = 1;
    sprite->rotation_x = GetStackInt(arguments++);
    sprite->rotation_y = GetStackInt(arguments++);
    sprite->rotation = GetStackFloat(arguments);
    return 1;
}

int _SP_SET_MOVE(RS_STACKDATA *stack, int) {
    RS_STACKDATA *arguments = (0, stack + 1);
    ED_SPRITE *sprite = GetSprite(GetStackInt(stack));
    if (sprite == NULL)
        return 0;
    sprite->move_x = GetStackFloat(arguments++);
    sprite->move_y = GetStackFloat(arguments);
    return 1;
}

int _SP_DRAW(RS_STACKDATA *stack, int argument_count) {
    int layer = GetStackInt(stack++);
    for (int i = 0; i < argument_count - 1; i++) {
        ED_SPRITE *sprite = GetSprite(GetStackInt(stack++));
        if (sprite != NULL)
            sprite->layer = layer;
    }
    return 1;
}

int _INIT_DRAW_DAY(RS_STACKDATA *, int) {
    EdInitDrawDay();
    return 1;
}

int _DRAW_DAY(RS_STACKDATA *, int) {
    EdStartDrawDay();
    return 1;
}

int _MAP_TITLE_OFF(RS_STACKDATA *, int) {
    now_loading_off();
    return 1;
}

int _SET_WIND(RS_STACKDATA *stack, int) {
    EdEventInfo.wind[0] = GetStackFloat(stack++);
    EdEventInfo.wind[1] = GetStackFloat(stack++);
    EdEventInfo.wind[2] = GetStackFloat(stack++);
    EdEventInfo.wind[3] = GetStackFloat(stack);
    return 1;
}

int _ASQ_INIT(RS_STACKDATA *stack, int) {
    int index = GetStackInt(stack);
    if (index < 0) {
        for (int i = 0; i < 10; i++) {
            CActionSeq *sequence = GetActSeq(index);
            if (sequence != NULL)
                sequence->ClearSeq();
        }
        return 1;
    }
    CActionSeq *sequence = GetActSeq(index);
    if (sequence == NULL)
        return 0;
    sequence->ClearSeq();
    return 1;
}

#ifdef NON_MATCHING
int _ASQ_SYNC_CHARA(RS_STACKDATA *stack, int) {
    int sequence_index = GetStackInt(stack++);
    int character_index = GetStackInt(stack);
    CActionSeq *sequence = GetActSeq(sequence_index);
    if (sequence == NULL)
        return 0;
    CCharacter *character;
    if (character_index == -1)
        character = EdEventInfo.main_character;
    else
        character = &GetNPC(character_index)->chara;
    if (character == NULL)
        return 0;
    sequence->SyncChara(character);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_SYNC_CHARA__FP12RS_STACKDATAi);
#endif

int _ASQ_SET_POS(RS_STACKDATA *stack, int) {
    RS_STACKDATA *arguments = (0, stack + 1);
    CActionSeq *sequence = GetActSeq(GetStackInt(stack));
    if (sequence == NULL)
        return 0;
    sceVu0FVECTOR position;
    GetPosition(arguments, position);
    sequence->SetPos(position);
    return 1;
}

int _ASQ_MOVE(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR position;
    CActionSeq *sequence = GetActSeq(GetStackInt(stack++));
    if (sequence == NULL)
        return 0;
    if (argument_count == 5) {
        GetPosition(stack, position);
        stack += 3;
        sequence->MoveSeq(position, GetStackInt(stack++));
    }
    if (argument_count == 2)
        sequence->MoveSeq(GetStackInt(stack));
    return 1;
}

#ifdef NON_MATCHING
int _ASQ_MOVE_STEP(RS_STACKDATA *stack, int) {
    RS_STACKDATA *arguments = (0, stack + 1);
    CActionSeq *sequence = GetActSeq(GetStackInt(stack));
    if (sequence == NULL)
        return 0;
    sceVu0FVECTOR position;
    GetPosition(arguments, position);
    sequence->MoveSeq(position, GetStackFloat(arguments + 3));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOVE_STEP__FP12RS_STACKDATAi);
#endif

#ifdef NON_MATCHING
int _ASQ_ROT_REF(RS_STACKDATA *stack, int) {
    RS_STACKDATA *arguments = (0, stack + 1);
    CActionSeq *sequence = GetActSeq(GetStackInt(stack));
    if (sequence == NULL)
        return 0;
    sceVu0FVECTOR position;
    GetPosition(arguments, position);
    sequence->RotRefSeq(position, GetStackFloat(arguments + 3));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ROT_REF__FP12RS_STACKDATAi);
#endif

int _ASQ_ROT_ANGLE(RS_STACKDATA *stack, int) {
    sceVu0FVECTOR rotation;
    CActionSeq *sequence = GetActSeq(GetStackInt(stack++));
    if (sequence == NULL)
        return 0;
    rotation[3] = 0.0f;
    rotation[2] = 0.0f;
    rotation[0] = 0.0f;
    rotation[1] = GetStackFloat(stack++);
    GetWorldRot(rotation, rotation);
    sequence->RotAngleSeq(rotation[1], GetStackFloat(stack));
    return 1;
}

CActionSeq *GetActSeq(int index);

int _ASQ_CLEAR_ROT(RS_STACKDATA *stack, int) {
    CActionSeq *sequence = GetActSeq(GetStackInt(stack));
    if (sequence == NULL)
        return 0;
    sequence->ClearRotSeq();
    return 1;
}

int _ASQ_WAIT_ROT(RS_STACKDATA *stack, int) {
    CActionSeq *sequence = GetActSeq(GetStackInt(stack));
    if (sequence == NULL)
        return 0;
    sequence->WaitRotSeq();
    return 1;
}

int _ASQ_ROT_MOVE(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    CActionSeq *sequence = GetActSeq(GetStackInt(stack));
    if (sequence == NULL)
        return 0;
    sequence->RotMoveSeq(GetStackFloat(next));
    return 1;
}

int _ASQ_SET_ROT(RS_STACKDATA *stack, int argument_count) {
    sceVu0FVECTOR rotation;
    CActionSeq *sequence = GetActSeq(GetStackInt(stack++));
    if (sequence == NULL)
        return 0;
    if (argument_count == 4) {
        GetRotation(stack, rotation);
        stack += 3;
    }
    if (argument_count == 2) {
        rotation[2] = 0.0f;
        rotation[0] = 0.0f;
        rotation[1] = GetStackFloat(stack);
        GetWorldRot(rotation, rotation);
    }
    sequence->SetRot(rotation);
    return 1;
}

int _ASQ_DELAY_ROT(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    CActionSeq *sequence = GetActSeq(GetStackInt(stack));
    if (sequence == NULL)
        return 0;
    sequence->SetDelayRot(GetStackInt(next));
    return 1;
}

int _ASQ_MOTION_TRG(RS_STACKDATA *stack, int argument_count) {
    CActionSeq *sequence = GetActSeq(GetStackInt(stack++));
    if (sequence == NULL)
        return 0;
    int trigger = 0;
    if (argument_count == 2)
        trigger = GetStackInt(stack);
    sequence->MotionTrg(trigger);
    return 1;
}

int asq_motion_play(int mode, RS_STACKDATA *stack, int argument_count) {
    CActionSeq *sequence = GetActSeq(GetStackInt(stack++));
    if (sequence == NULL)
        return 0;
    int motion = GetStackInt(stack++);
    float speed = -1.0f;
    if (argument_count >= 3)
        speed = GetStackFloat(stack++);
    int flags = 0;
    if (argument_count >= 4)
        flags = (int) GetStackFloat(stack);
    flags &= 4;
    sequence->MotionSeq(motion, mode, speed, flags);
    return 1;
}

int _ASQ_MOTION_PLAY(RS_STACKDATA *stack, int argument_count) {
    asq_motion_play(5, stack, argument_count);
}

int _ASQ_MOTION_STOP(RS_STACKDATA *stack, int argument_count) {
    asq_motion_play(6, stack, argument_count);
}

int _ASQ_MOTION_NEXT(RS_STACKDATA *stack, int argument_count) {
    asq_motion_play(7, stack, argument_count);
}

int _ASQ_ANIME_TRG(RS_STACKDATA *stack, int argument_count) {
    CActionSeq *sequence = GetActSeq(GetStackInt(stack++));
    if (sequence == NULL)
        return 0;
    int trigger = 0;
    if (argument_count == 2)
        trigger = GetStackInt(stack);
    sequence->AnimeTrg(trigger);
    return 1;
}

int _ASQ_ANIME(RS_STACKDATA *stack, int argument_count) {
    CActionSeq *sequence = GetActSeq(GetStackInt(stack++));
    if (sequence == NULL)
        return 0;
    int enable = 1;
    int start = 0;
    int end = 0;
    int animation = GetStackInt(stack++);
    if (argument_count >= 3)
        enable = GetStackInt(stack++);
    if (argument_count >= 4)
        start = GetStackInt(stack++);
    if (argument_count >= 5)
        end = GetStackInt(stack);
    sequence->AnimeSeq(animation, enable, start, end);
    return 1;
}

#ifdef NON_MATCHING
int _ASQ_CHECK(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    CActionSeq *sequence = GetActSeq(GetStackInt(stack));
    if (sequence == NULL)
        return 0;
    int ended = sequence->CheckEnd();
    SetStack(result, (0, ((ended != 0) ^ 1) & 0xFF));
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_CHECK__FP12RS_STACKDATAi);
#endif

int _OBJ_ANIME_INIT(RS_STACKDATA *stack, int argument_count) {
    for (int i = 0; i < argument_count; i++)
        ClearObjAnime(GetStackInt(stack++));
    return 1;
}

int _OBJ_ANIME(RS_STACKDATA *stack, int argument_count) {
    int object = GetStackInt(stack++);
    int animation = GetStackInt(stack++);
    int angle_mode = GetStackInt(stack++);
    int playback_mode = GetStackInt(stack++);
    sceVu0FVECTOR first = {0.0f, 0.0f, 0.0f, 0.0f};
    sceVu0FVECTOR second;
    sceVu0FVECTOR third;
    sceVu0CopyVector(second, first);
    sceVu0CopyVector(third, first);

    first[0] = GetStackFloat(stack++);
    first[1] = GetStackFloat(stack++);
    first[2] = GetStackFloat(stack++);
    if (angle_mode == 0) {
        first[0] = 180.0f * first[0] / 3.1415927f;
        first[1] = 180.0f * first[1] / 3.1415927f;
        first[2] = 180.0f * first[2] / 3.1415927f;
    }
    if (argument_count >= 10) {
        second[0] = GetStackFloat(stack++);
        second[1] = GetStackFloat(stack++);
        second[2] = GetStackFloat(stack++);
        if (angle_mode == 0) {
            second[0] = 180.0f * second[0] / 3.1415927f;
            second[1] = 180.0f * second[1] / 3.1415927f;
            second[2] = 180.0f * second[2] / 3.1415927f;
        }
    }
    if (argument_count >= 13) {
        third[0] = GetStackFloat(stack++);
        third[1] = GetStackFloat(stack++);
        third[2] = GetStackFloat(stack);
        if (angle_mode == 0) {
            third[0] = 180.0f * third[0] / 3.1415927f;
            third[1] = 180.0f * third[1] / 3.1415927f;
            third[2] = 180.0f * third[2] / 3.1415927f;
        }
    }
    init_obj_anime(object, animation, angle_mode, playback_mode, first, second, third);
    return 1;
}

int _SSET_GAME_FLAG(RS_STACKDATA *stack, int argument_count) {
    if (argument_count != 2)
        return 0;
    RS_STACKDATA *next = (0, stack + 1);
    int flag = GetStackInt(stack);
    SaveData->SetGameFlag(flag, GetStackInt(next));
    return 1;
}

int _SGET_GAME_FLAG(RS_STACKDATA *stack, int argument_count) {
    if (argument_count != 2)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    int flag = GetStackInt(stack);
    SetStack(result, SaveData->GetGameFlag(flag));
    return 1;
}

int _SSET_GAME_INT_FLAG(RS_STACKDATA *stack, int argument_count) {
    if (argument_count != 2)
        return 0;
    RS_STACKDATA *next = (0, stack + 1);
    int flag = GetStackInt(stack);
    SaveData->SetGameIntFlag(flag, GetStackInt(next));
    return 1;
}

int _SGET_GAME_INT_FLAG(RS_STACKDATA *stack, int argument_count) {
    if (argument_count != 2)
        return 0;
    RS_STACKDATA *result = (0, stack + 1);
    int flag = GetStackInt(stack);
    SetStack(result, SaveData->GetGameIntFlag(flag));
    return 1;
}

int _SITEM_GET(RS_STACKDATA *stack, int) {
    int attachment = -1;
    int item = GetStackInt(stack);
    if (GetAddAttachItem(item) != 0)
        attachment = 3;
    EdGetItem(item, 1, attachment);
    return 1;
}

int _SSET_MAP_FLAG(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int flag = GetStackInt(stack);
    EdSetMapFlag(flag, ((GetStackInt(next) != 0) ^ 1) & 0xFF);
    return 1;
}

int _SGET_MAP_FLAG(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    int flag = GetStackInt(stack);
    SetStack(result, ((EdGetMapFlag(flag) != 0) ^ 1) & 0xFF);
    return 1;
}

int _SET_WORK_FLAG(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int flag = GetStackInt(stack);
    SetWorkFlag(flag, GetStackInt(next));
}

int _GET_WORK_FLAG(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    int flag = GetStackInt(stack);
    SetStack(result, (0, GetWorkFlag(flag)));
    return 1;
}

int _SITEM_CHECK(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    int item = GetStackInt(stack);
    SetStack(result, EdCheckItem(item));
    return 1;
}

int _SITEM_CHECK_ALL(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    int item = GetStackInt(stack);
    SetStack(result, PlayerAllItemCheck(item));
    return 1;
}

int _SGET_DUNGEON_STATUS(RS_STACKDATA *stack, int) {
    CDngStatusData *status = SaveData->GetDngStatus();
    int dungeon = GetStackInt(stack++);
    if (dungeon < 0 || dungeon >= 6)
        return 0;
    SetStack(stack++, SaveData->QuestDungeon(dungeon, 0));
    SetStack(stack, status->floor_reached[dungeon]);
    return 1;
}

#ifdef NON_MATCHING
int _SGET_PARTY_NUM(RS_STACKDATA *stack, int) {
    CDngStatusData *status = SaveData->GetDngStatus();
    SetStack(stack, status->party_size);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_PARTY_NUM__FP12RS_STACKDATAi);
#endif

int _SSET_PARTY_NUM(RS_STACKDATA *stack, int) {
    CDngStatusData *status = SaveData->GetDngStatus();
    int party_size = GetStackInt(stack);
    status->SetPartySize(party_size);
    return 1;
}

int _SSET_REQUEST_EVENT_FLAG(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    SV_GEORAMA_DATA *georama = SaveData->GetGrdData(GetStackInt(stack) - 1);
    if (georama == NULL)
        return 0;
    georama->request_event_flag = GetStackInt(next);
    return 1;
}

#ifdef NON_MATCHING
int _SADD_VISIT_MAP(RS_STACKDATA *stack, int argument_count) {
    int map = GetStackInt(stack++) - 1;
    int add = 1;
    if (argument_count > 1)
        add = GetStackInt(stack++);
    int visits;
    if (map < 200)
        visits = SaveData->VisitMap(map, add);
    else
        visits = SaveData->QuestDungeon(map, add);
    if (argument_count >= 3)
        SetStack(stack, visits);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _SADD_VISIT_MAP__FP12RS_STACKDATAi);
#endif

int _SSKILL_GET(RS_STACKDATA *stack, int) {
    CDngStatusData *status = SaveData->GetDngStatus();
    int character = GetStackInt(stack);
    if (character < 0 || character >= 6)
        return 0;
    status->skill_owned[character] = 1;
    return 1;
}

int _SGET_EQUIP_WEAPON(RS_STACKDATA *stack, int) {
    CDngStatusData *status = SaveData->GetDngStatus();
    int character = GetStackInt(stack++);
    if (character < 0 || character >= 6)
        return 0;
    SetStack(stack,
             TransWepNoNewToOld(
                 status->chara_weapons[character][status->equipped_weapon_slot[character]].item_no));
    return 1;
}

int _SADD_MAXITEM(RS_STACKDATA *stack, int) {
    EdAddMaxItem(GetStackInt(stack));
    return 1;
}

int _SITEM_LOST(RS_STACKDATA *stack, int) {
    CDngStatusData *status = SaveData->GetDngStatus();
    status->LostItem(GetStackInt(stack));
    return 1;
}

int _SATRA_PARTS_GET(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int georama = GetStackInt(stack) - 1;
    SaveData->AtraPartsGet(georama, GetStackInt(next));
}

int _SATRA_CHIP_GET(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int georama = GetStackInt(stack) - 1;
    SaveData->AtraChipGet(georama, GetStackInt(next));
}

#ifdef NON_MATCHING
int _SGET_REQUEST(RS_STACKDATA *stack, int) {
    RS_STACKDATA *result = (0, stack + 1);
    SV_GEORAMA_DATA *georama = SaveData->GetGrdData(GetStackInt(stack) - 1);
    if (georama == NULL) {
        SetStack(result, 0);
        return 0;
    }
    int i;
    int completed = 0;
    i = 0;
    while (i < 24) {
        if (georama->request_complete[i] != 0)
            completed++;
        i++;
    }
    int total = georama->request_count;
    if (completed == total)
        SetStack(result, 100);
    else
        SetStack(result, completed * 100 / total);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_REQUEST__FP12RS_STACKDATAi);
#endif

int _SGET_ATRA_PARTS_NUM(RS_STACKDATA *stack, int) {
    int count = 0;
    RS_STACKDATA *result = (0, stack + 1);
    int georama = GetStackInt(stack) - 1;
    for (int i = 0; i < 24; i++) {
        SV_EDIT_PARTS_INFO *part = SaveData->GetEditPartsInfo(georama, i);
        if (part != NULL && part->flag != 0)
            count++;
    }
    SetStack(result, count);
    return 1;
}

int _SGET_DAY(RS_STACKDATA *stack, int) {
    SetStack(stack, SaveData->GetDay());
    return 1;
}

int _SSET_TIME(RS_STACKDATA *stack, int) {
    SaveData->SetNowTime(GetStackFloat(stack));
    return 1;
}

int _SGET_TIME(RS_STACKDATA *stack, int) {
    SetStack(stack, SaveData->GetNowTime());
    return 1;
}

int _SADD_TIME(RS_STACKDATA *stack, int) {
    SaveData->AddNowTime(GetStackFloat(stack));
    return 1;
}

int _SEQUIP_DEFAULT_WEAPON(RS_STACKDATA *stack, int) {
    EquipDefaultWeapon(GetStackInt(stack));
    return 1;
}

int _LOAD_SND_SYNC(RS_STACKDATA *stack, int) {
    SetStack(stack, SndSyncBG());
    return 1;
}

void _LOAD_SOUND_SET(RS_STACKDATA *stack, int) {
    StartReadBG();
    SndSoundLoadBG(GetStackInt(stack), BaseBuffer, NULL);
}

void _LOAD_VOICE_SET(RS_STACKDATA *stack, int) {
    StartReadBG();
    SndVoiceLoadBG(GetStackInt(stack), BaseBuffer, NULL);
}

void _LOAD_BGM(RS_STACKDATA *stack, int) {
    StartReadBG();
    SndBgmLoadBG(GetStackInt(stack), BaseBuffer, NULL);
}

int _DELETE_BGM(RS_STACKDATA *, int) {
    SndBgmStop();
    SndBgmInit();
    return 1;
}

int _PLAY_BGM(RS_STACKDATA *stack, int) {
    SndBgmPlay(GetStackInt(stack));
    return 1;
}

int _STOP_BGM(RS_STACKDATA *, int) {
    SndBgmStop();
    return 1;
}

int _SET_BGM_VOL(RS_STACKDATA *stack, int) {
    SndSetBgmVol(GetStackInt(stack));
    return 1;
}

int _SET_BGM_VOLF(RS_STACKDATA *stack, int) {
    SndSetBgmVolf(GetStackFloat(stack));
    return 1;
}

int _GET_BGM_VOL(RS_STACKDATA *stack, int) {
    SetStack(stack, SndGetBgmVol());
    return 1;
}

int _GET_BGM_NO(RS_STACKDATA *stack, int) {
    SetStack(stack, SndGetBgmNo());
    return 1;
}

int _SET_OUT_BGM_NO(RS_STACKDATA *stack, int) {
    EdBeforeInBgmNo = GetStackInt(stack);
    return 1;
}

int _GET_OUT_BGM_NO(RS_STACKDATA *stack, int) {
    SetStack(stack, EdBeforeInBgmNo);
    return 1;
}

int _BGM_FADE_IN(RS_STACKDATA *stack, int argument_count) {
    int bgm = GetStackInt(stack++);
    int frames = -1;
    int mode = 0;
    if (argument_count > 1)
        frames = GetStackInt(stack++);
    if (argument_count > 2)
        mode = GetStackInt(stack);
    SndBgmFadeIn(bgm, frames, mode);
    return 1;
}

int _BGM_FADE_OUT(RS_STACKDATA *stack, int argument_count) {
    int bgm = GetStackInt(stack++);
    int frames = 0;
    if (argument_count > 1)
        frames = GetStackInt(stack);
    SndBgmFadeOut(bgm, frames);
    return 1;
}

int _CHECK_BGM_FADE(RS_STACKDATA *stack, int) {
    SetStack(stack, SndCheckFade());
    return 1;
}

int _PLAY_AMB_BGM(RS_STACKDATA *stack, int) {
    SndAmbientPlay(GetStackInt(stack));
    return 1;
}

int _STOP_AMB_BGM(RS_STACKDATA *, int) {
    SndAmbientStop();
    return 1;
}

int _SET_AMB_VOLF(RS_STACKDATA *stack, int) {
    SndAmbientSetVolf(GetStackFloat(stack));
    return 1;
}

int _PLAY_SE(RS_STACKDATA *stack, int argument_count) {
    int sound = GetStackInt(stack++);
    if (argument_count >= 4) {
        float position[4];
        GetPosition(stack, position);
        stack += 3;
        float near = -1.0f;
        float far = -1.0f;
        if (argument_count >= 5)
            near = GetStackFloat(stack++);
        if (argument_count >= 6)
            far = GetStackFloat(stack);
        SndSePlay(sound, position, near, far);
    } else {
        int voice = -1;
        if (argument_count == 2)
            voice = GetStackInt(stack);
        SndSePlay(sound, voice, 0);
    }
    return 1;
}

int _STOP_SE(RS_STACKDATA *stack, int) {
    SndSeStop(GetStackInt(stack), 0);
    return 1;
}

int _SET_SE_VOL(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int sound = GetStackInt(stack);
    SndSetSeVol(sound, GetStackInt(next), 0);
    return 1;
}

int _LOAD_SPECIAL_SE(RS_STACKDATA *stack, int) {
    StartReadBG();
    SndSPSeLoadBG(GetStackInt(stack), BaseBuffer, NULL);
    return 1;
}

int _PLAY_SPECIAL_SE(RS_STACKDATA *stack, int argument_count) {
    int sound = GetStackInt(stack++);
    int voice = -1;
    if (argument_count >= 2)
        voice = GetStackInt(stack);
    SndSPSePlay(sound, voice);
    return 1;
}

int _STOP_SPECIAL_SE(RS_STACKDATA *stack, int) {
    SndSPSeStop(GetStackInt(stack));
    return 1;
}

int _SET_SPECIAL_SE_VOL(RS_STACKDATA *stack, int argument_count) {
    int sound = GetStackInt(stack++);
    float position[4];
    GetPosition(stack, position);
    stack += 3;
    float near = 10.0f;
    float far = 500.0f;
    if (argument_count >= 5)
        near = GetStackFloat(stack++);
    if (argument_count >= 6)
        far = GetStackFloat(stack);
    float volume;
    float pan;
    SndGetVolPan(&volume, &pan, position, near, far);
    SndSetSPSeVolf(sound, volume);
    SndSetSPSePanf(sound, pan);
    return 1;
}

int _SOUND_OFF_COUNT(RS_STACKDATA *stack, int) {
    EdEventInfo.sound_off_count = GetStackInt(stack);
    if (EdEventInfo.sound_off_count > 10)
        EdEventInfo.sound_off_count = 10;
    EdSetSoundOffCount(EdEventInfo.sound_off_count);
    return 1;
}

int _GET_V_ARG(RS_STACKDATA *stack, int argument_count) {
    int index = GetStackInt(stack++);
    if (index < 0 || index >= 4)
        return 0;
    for (int i = 0; i < argument_count - 1; i++)
        SetStack(stack++, EdEventInfo.vector_arguments[index][i]);
    return 1;
}

int _GET_I_ARG(RS_STACKDATA *stack, int) {
    int index = GetStackInt(stack++);
    if (index < 0 || index >= 8)
        return 0;
    SetStack(stack++, EdEventInfo.integer_arguments[index]);
    return 1;
}

int _GET_F_ARG(RS_STACKDATA *stack, int) {
    int index = GetStackInt(stack++);
    if (index < 0 || index >= 8)
        return 0;
    SetStack(stack++, EdEventInfo.flag_arguments[index]);
    return 1;
}

int _EB_INIT(RS_STACKDATA *stack, int) {
    EBInit(GetStackFloat(stack));
    return 1;
}

int _EB_SET_MOTION(RS_STACKDATA *stack, int argument_count) {
    int motions[128];
    if (argument_count < 2)
        return 0;
    CCharacter *character = GetChara(GetStackInt(stack++));
    int i = 0;
    while (i < argument_count - 1)
        motions[i++] = GetStackInt(stack++);
    motions[i] = -1;
    EBSetMotion(character, motions);
    return 1;
}

int _EB_SET_KEY(RS_STACKDATA *stack, int argument_count) {
    float time = GetStackFloat(stack++);
    int key = GetStackInt(stack++);
    int mode = 0;
    if (argument_count >= 3)
        mode = GetStackInt(stack);
    EBSetKey(time, key, mode);
    return 1;
}

int _EB_LOOP(RS_STACKDATA *stack, int) {
    SetStack(stack, EBLoop());
    return 1;
}

int _EB_INTRO_START(RS_STACKDATA *, int) {
    EBInitIntro();
    return 1;
}

int _EB_INTRO_LOOP(RS_STACKDATA *stack, int) {
    SetStack(stack, EBIntroLoop());
    return 1;
}

int _EB_INTRO_END(RS_STACKDATA *, int) {
    EBExit();
    return 1;
}

int _EB_DEBUG(RS_STACKDATA *stack, int) {
    EBDebug(GetStackInt(stack));
    return 1;
}

int _EB_FINISH_SOUND(RS_STACKDATA *stack, int) {
    RS_STACKDATA *next = (0, stack + 1);
    int fade_bgm = GetStackInt(stack);
    EBFinishSound(fade_bgm, GetStackInt(next));
    return 1;
}

int _LOAD_MAIN_CHARA(RS_STACKDATA *stack, int) {
    char *model = GetStackString(stack++);
    char *motion = GetStackString(stack++);
    int use_villager_arena = GetStackInt(stack);
    CDataAlloc2<1> *arena = NULL;
    if (use_villager_arena == 1)
        arena = &EdVillagerBuffer;
    EdLoadMainChara(model, motion, arena);
    return 1;
}

int _LOAD_FISHING_DATA(RS_STACKDATA *stack, int) {
    int fish_set = GetStackInt(stack++);
    FishingInit();
    FishingLoad(&EdVillagerBuffer, 8);
    FishingLoadFish(fish_set, &EdVillagerBuffer, 54);

    CBoxVu0 bounds;
    bounds.min[0] = GetStackFloat(stack++);
    bounds.min[1] = -1000.0f;
    bounds.min[2] = GetStackFloat(stack++);
    bounds.max[0] = GetStackFloat(stack++);
    bounds.max[1] = 1000.0f;
    bounds.max[2] = GetStackFloat(stack++);
    FishingSetRect(bounds);
    float water_near = GetStackFloat(stack++);
    FishingSetWaterLevel(water_near, GetStackFloat(stack));

    CCPoly polygons[1024];
    int polygon_count = 0;
    if (EdEventInfo.edit_ground != NULL) {
        polygon_count = EdEventInfo.edit_ground->PickUpPoly(polygons, bounds, 0);
        printf("poly_num = %d\n", polygon_count);
        if (polygon_count > 1024) {
            printf("CPOLY OVER ****************\n");
            while (1) {
            }
        }
    }
    FishingSetCPoly(polygons, polygon_count);
    return 1;
}

#ifdef NON_MATCHING
int _GOTO_FISHING(RS_STACKDATA *, int) {
    CCharacter *character = GetChara(-1);
    if (character == NULL)
        return 0;
    sceVu0FVECTOR position;
    character->GetPosition(position);
    if (character->frame != NULL) {
        CFrame *rod = character->frame->SearchFrame("sao");
        if (rod != NULL)
            rod->GetWorldPosition(position, fishing_line_origin);
        FishLineInit(position);
    }
    EdEventInfo.return_code = 11;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_FISHING__FP12RS_STACKDATAi);
#endif

int _INIT_FISH(RS_STACKDATA *stack, int) {
    CBoxVu0 bounds;
    bounds.min[0] = GetStackFloat(stack++);
    bounds.min[1] = 0.0f;
    bounds.min[2] = GetStackFloat(stack++);
    bounds.max[0] = GetStackFloat(stack++);
    // Retail redundantly clears the first bound's Y coordinate here.
    bounds.min[1] = 0.0f;
    bounds.max[2] = GetStackFloat(stack);
    FishingInitFish(bounds);
    return 1;
}

int _EXIT_FISHING(RS_STACKDATA *, int) {
    FishingExit();
    return 1;
}

int _SET_FISHING_ESA(RS_STACKDATA *stack, int) {
    int item = GetStackInt(stack);
    FishingLoadEsa(item, EdEventInfo.item_frame[0], 40);
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", EdSetEventScript__FPcPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitEventParamSimple__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitEventParam__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventInit__FiP14CDataAlloc2_1_Pc);

void RunEvent(CRunScript *script, int program, CDataAlloc2<1> *arena);
#ifdef NON_MATCHING
void RunEvent(CRunScript *script, int program, CDataAlloc2<1> *arena) {
    int used = arena->used;
    EdEventBuffer.base = arena->base + used * 16;
    EdEventBuffer.limit = arena->limit - used;
    EdEventBuffer.used = 0;
    world_rot[3] = world_rot[2] = world_rot[1] = world_rot[0] = 0.0f;
    sceVu0CopyVector(world_pos, world_rot);
    sceVu0UnitMatrix(world_local);
    sceVu0UnitMatrix(local_world);
    p_jump_map_no = 0;
    script->run(program);
}
#else
INCLUDE_ASM("asm/nonmatchings/editloop3", RunEvent__FP10CRunScriptiP14CDataAlloc2_1_);
#endif

void EdRunEvent(int program, CDataAlloc2<1> *arena) {
    RunEvent(&EdEventScript, program, arena);
}

int EdResumeEvent() {
    EdEventScript.resume();
    return 1;
}

int EdEventSkip() {
    EdEventScript.skip();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventAllClear__Fv);

int EdEventFinish() {
    EdEventInfo.suppress_background = 0;
    EdEventInfo.suppress_shadows = 0;
    EdEventInfo.screen_filter = 0;
    EdEventInfo.lighting_override = 0;
    EdEventInfo.wind[3] = -1.0f;
    EdEventInfo.main_character->frame->DeleteReference();
    CFrame *shadow = EdEventInfo.main_character->shadow_frame;
    if (shadow != NULL)
        shadow->DeleteReference();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventMode__FP13CCameraFollowi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventNPCStep__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventSpriteDraw__Fv);

int EdEventBackSpriteDraw() {
    TexManager.ReloadTexture(GetVif1Packet(), 46);
    SpriteTableBack.DrawTable();
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", EdSearchNearNPC__FP10CCharacterP12CNPCharacteri);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdTalkModeInit__FP12CNPCharacteri);
/** Villager involved in the active conversation. */
static CNPCharacter *talk_villager__2;

/** Metadata identifier of the character involved in the active conversation. */
static int talk_chara_info_id;

CNPCharacter *EdNowTalkChara() {
    return talk_villager__2;
}

int EdNowTalkCharaInfoID() {
    return talk_chara_info_id;
}

INCLUDE_ASM("asm/nonmatchings/editloop3", EdTalkMode__FP10CCharacterP13CCameraFollowiPi);

ED_SPRITE::ED_SPRITE() {
}

int CheckPartsInfo(EDITPARTS_INFO *info) {
    if (info->unk_08 == 0)
        return 0;
    if (info->unk_18 <= 0)
        return 0;
    return 1;
}
