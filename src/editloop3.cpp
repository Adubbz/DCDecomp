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
#include "camera.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "debugfont.hpp"
#include "dngstatusdata.hpp"
#include "editground.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "editpartsinfo.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mapparts.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "objanime.hpp"
#include "runscript.hpp"
#include "snd.hpp"

/* Retail editloop3.cpp: editor event points, villagers, script opcodes and talk handling. */

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
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearOut__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearIn__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearOff__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearOn__Fii);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdVillagerAppearMove__Fiii);
INCLUDE_ASM("asm/nonmatchings/editloop3", RestoreVillagerInfo__FP13VILLAGER_INFO);
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
        if (position[0] <= area->maximum[0] && position[2] <= area->maximum[2]
            && position[0] >= area->minimum[0] && position[2] >= area->minimum[2]
            && height < area->minimum[1]) {
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
        if (position[0] <= area->maximum[0] && position[2] <= area->maximum[2]
            && position[0] >= area->minimum[0] && position[2] >= area->minimum[2]) {
            position[1] = GetMaxHeightCursor(position);
            return;
        }
    }

    float nearest_distance = -1.0f;
    int nearest = -1;
    for (int i = 0; i < count; i++) {
        EDIT_AREA_RECT_INFO *area = &edit_info->edit_area_rects[i];
        if (previous[0] <= area->maximum[0] && previous[2] <= area->maximum[2]
            && previous[0] >= area->minimum[0] && previous[2] >= area->minimum[2]) {
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

/** Whether advancement of the current editor event is paused. */
static int event_pause;

void EdEventPause() {
    event_pause = !event_pause;
}

/** Integer scratch flags exposed to editor event scripts. */
static int work_flag[32];

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
INCLUDE_ASM("asm/nonmatchings/editloop3", GetActSeq__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", turn_chara__FP10CCharacterPff);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetScene__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetNPC__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetChara__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetItemFrame__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", DeleteItemFrame__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetVillagerInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetWorldCoord__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetWorldPos__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetWorldRotY__Ff);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetWorldRot__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetLocalPos__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetLocalRotY__Ff);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetLocalRot__FPfPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetPosition__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetPosition__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetRotation__FP12RS_STACKDATAPf);
INCLUDE_ASM("asm/nonmatchings/editloop3", SetRotation__FP12RS_STACKDATAPf);
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
INCLUDE_ASM("asm/nonmatchings/editloop3", _NAME_REGISTRY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _WORLD_MAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SKIP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_OUTSIDE__FP12RS_STACKDATAi);
int _FINISH(RS_STACKDATA *, int) {
    EdEventAllClear();
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_JUMP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OLD_MAPNO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_DUNGEON_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_DUNGEON_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _FADEOUT_TO_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_JUMP_BGM_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_JUMP_BGM_PLAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_FP_CHANGE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_FISH_RANKING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_CHANGE_ESA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CURRENT_DIR__FP12RS_STACKDATAi);
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
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_ON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_OFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _APPEAR_VILLAGER_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CLEAR_VILLAGER_BUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CLEAR_EVENT_BUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CLEAR_EVENT_EXBUFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SCENE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_SCENE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_SCENE_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_SCENE_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_SCENE_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SCENE_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SCENE_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_ITEM_FILE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CHARA_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CHARA_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CHARA_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CHARA_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CHARA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CHARA_TALK_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CHARA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CHARA_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CHARA_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _TURN_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_TALK_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_POS_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_PARTS_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_MOTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _TURN_NPC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_DRAW_SHADOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_FOOT_SOUND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_FLOOR_ID__FP12RS_STACKDATAi);

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
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_COL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_DRAW_BEFORE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_NPC_CLOTH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_CLOTH_FLOOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_CLOTH_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_AMBIENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_BODY_SIZE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NPC_BODY_SIZE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _NPC_PLIGHT_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_NPC_PLIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_NPC_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_NPC_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetMes__Fi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MES_MAKE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MES_CLOSE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MES_NEXTPAGE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_AUTOSET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_SHIPPO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_DRAWSPEED__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_CURSOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_OKURI__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_WIN_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_MES_COMPLETE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_MES_WAIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_MES_FUKIDASHI__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ITEM_GET_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_SYS_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SKILL_GET_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ADD_MAXITEM_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_COMPLETE_PARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_EDIT_PARTS_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_NOW_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CLOCK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CLOCK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_CMP_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_CMP_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SCHECK_REQUEST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_PLACE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_VILLAGER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_ROBO_PARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_FIXPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_EDITPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_INTERIORPARTS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_BT_HOBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _HOBJ_ITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _OBJ_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OBJ_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OBJ_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OBJ_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OBJ_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OBJ_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OBJ_SCALE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_OBJ_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_OBJ_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OBJ_FOG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_TALKNPC_INFO_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_TALKNPC_ID__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_TALKNPC_STATUS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_TALK_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_TALK_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_TALK_SELECT_MES__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EVERY_TALK_EVENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", GetCamera__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_SPEED__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_FOLLOW_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ADD_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ADD_CAMERA_HEIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ADD_CAMERA_DIST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CAMERA_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_PROJECTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ITEM_GET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_ROTATE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_ROTATE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RESET_CAMERA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RESET_CAMERA_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CAMERA_REF_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CAMERA_REF_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CAMERA_REF_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CAMERA_REF_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SYNC_CAMERA_POS_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _RELEASE_CAMERA_POS_OBJ__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CAMERA_ROLL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_CAMERA_ROLL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _FADE_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _FADE_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_FADE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_BG_SPRITE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_BACK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_SHADOW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_CLIP_POINT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_EDIT_WATER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_WATER_SURFACE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SCREEN_FILTER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_THUNDER__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_LIGHT_COLOR__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_AMBIENT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SAVE_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_LIGHT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_DOF_LEVEL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_TEX__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_RGBA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_SET_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SP_DRAW__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_DRAW_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DRAW_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _MAP_TITLE_OFF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_WIND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_SYNC_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_SET_POS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOVE_STEP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ROT_REF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ROT_ANGLE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_CLEAR_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_WAIT_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ROT_MOVE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_SET_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_DELAY_ROT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOTION_TRG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", asq_motion_play__FiP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOTION_PLAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOTION_STOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_MOTION_NEXT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ANIME_TRG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _ASQ_CHECK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _OBJ_ANIME_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _OBJ_ANIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_GAME_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_GAME_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_GAME_INT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_GAME_INT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SITEM_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_MAP_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_MAP_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_WORK_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_WORK_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SITEM_CHECK__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SITEM_CHECK_ALL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_DUNGEON_STATUS__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_PARTY_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_PARTY_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_REQUEST_EVENT_FLAG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SADD_VISIT_MAP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSKILL_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_EQUIP_WEAPON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SADD_MAXITEM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SITEM_LOST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SATRA_PARTS_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SATRA_CHIP_GET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_REQUEST__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_ATRA_PARTS_NUM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_DAY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SSET_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SGET_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SADD_TIME__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SEQUIP_DEFAULT_WEAPON__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SND_SYNC__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SOUND_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_VOICE_SET__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _DELETE_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _PLAY_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _STOP_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_BGM_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_BGM_VOLF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_BGM_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_OUT_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_OUT_BGM_NO__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _BGM_FADE_IN__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _BGM_FADE_OUT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _CHECK_BGM_FADE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _PLAY_AMB_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _STOP_AMB_BGM__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_AMB_VOLF__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _PLAY_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _STOP_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SE_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _PLAY_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _STOP_SPECIAL_SE__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_SPECIAL_SE_VOL__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SOUND_OFF_COUNT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_V_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_I_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GET_F_ARG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_INIT__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_SET_MOTION__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_SET_KEY__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_LOOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_INTRO_START__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_INTRO_LOOP__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_INTRO_END__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_DEBUG__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EB_FINISH_SOUND__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_MAIN_CHARA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _LOAD_FISHING_DATA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _GOTO_FISHING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _INIT_FISH__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _EXIT_FISHING__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", _SET_FISHING_ESA__FP12RS_STACKDATAi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSetEventScript__FPcPcP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitEventParamSimple__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdInitEventParam__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventInit__FiP14CDataAlloc2_1_Pc);
INCLUDE_ASM("asm/nonmatchings/editloop3", RunEvent__FP10CRunScriptiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdRunEvent__FiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdResumeEvent__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventSkip__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventAllClear__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventFinish__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventMode__FP13CCameraFollowi);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventNPCStep__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventSpriteDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdEventBackSpriteDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdSearchNearNPC__FP10CCharacterP12CNPCharacteri);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdTalkModeInit__FP12CNPCharacteri);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdNowTalkChara__Fv);
INCLUDE_ASM("asm/nonmatchings/editloop3", EdNowTalkCharaInfoID__Fv);
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
