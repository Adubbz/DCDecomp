#include "dungeonmap.hpp"

#include "framevu1.hpp"

#include "camera.hpp"
#include "character.hpp"
#include "frame.hpp"
#include "mathutil.hpp"

#include <cstdlib>

INCLUDE_ASM("main", SetNPC__11CDungeonMapFiPUiiPfPfiiP14CDataAlloc2_1_);

/* Vector helper that the PS2 library provides; it carries no C++ linkage. */
extern "C" void sceVu0CopyVector(float *dst, float *src);

extern "C" void MGDraw__FP6CFrame(CFrame *frame);

/* The floor that the player selected; only the first six hold atla. */
extern "C" s32 selectMapNo;

/* The character that the player controls; the dungeon overlay defines it. */
extern "C" CCharacter CharaMain;

/* @ 0x1C1E70 (0x40 bytes) -- ClearNPC_Cash__11CDungeonMapFv */
void CDungeonMap::ClearNPC_Cash() {
    for (int i = 0; i < 4; i++) {
        this->npc[i].draw_num = 0;
    }
}

/* @ 0x1C1EB0 (0xD0 bytes) -- ReservNPC_Draw__11CDungeonMapFifffi */
void CDungeonMap::ReservNPC_Draw(int npc_no, float x, float y, float z, int param) {

    // A character that has no model, or that is hidden, draws no copy.
    if (this->npc[npc_no].used != 0 && this->npc[npc_no].unk_11D8 != 0 && this->npc[npc_no].chara_frame != NULL) {
        this->npc[npc_no].draw_pos[this->npc[npc_no].draw_num][0] = x;
        this->npc[npc_no].draw_pos[this->npc[npc_no].draw_num][1] = y;
        this->npc[npc_no].draw_pos[this->npc[npc_no].draw_num][2] = z;
        this->npc[npc_no].draw_param[this->npc[npc_no].draw_num] = param;
        this->npc[npc_no].draw_num++;
    }
}

INCLUDE_ASM("main", DrawNPCDraw__11CDungeonMapFv);

INCLUDE_ASM("main", StepNPC__11CDungeonMapFv);

/* @ 0x1C22B0 (0x40 bytes) -- NPCSetMotion__11CDungeonMapFii */
void CDungeonMap::NPCSetMotion(int npc_no, int motion_no) {
    this->npc[npc_no].motion_no = motion_no;
    this->npc[npc_no].unk_C64 = 0;
    this->npc[npc_no].motion_speed = -1.0f;
}

/* @ 0x1C22F0 (0x40 bytes) -- NPCSetMotion__11CDungeonMapFiifi */
void CDungeonMap::NPCSetMotion(int npc_no, int motion_no, float speed, int unk) {
    this->npc[npc_no].motion_no = motion_no;
    this->npc[npc_no].unk_C64 = unk;
    this->npc[npc_no].motion_speed = -1.0f;
    this->npc[npc_no].motion_speed = speed;
}

/* @ 0x1C2330 (0x90 bytes) -- GetFrameSearch__11CDungeonMapFPc */
CFrame *CDungeonMap::GetFrameSearch(char *name) {
    for (int i = 0; i < 72; i++) {
        CFrame *frame = this->parts[i].GetSearchFrame(name);
        if (frame != NULL) {
            return frame;
        }
    }
    return NULL;
}

INCLUDE_ASM("main", DrawMapFreeStyle__11CDungeonMapFv);

INCLUDE_ASM("main", DrawMapCalc__11CDungeonMapFi);

INCLUDE_ASM("main", DrawMap__11CDungeonMapFP13CCameraFollowP9CFrameVu1);

/* @ 0x1C2FC0 (0xA0 bytes) -- DrawBGModel__11CDungeonMapFP7CCamera */
void CDungeonMap::DrawBGModel(CCamera *camera) {
    float pos[4];

    // The background follows the camera, so that it stays at the horizon.
    camera->GetPos(pos);
    pos[1] = 0.0f;
    for (int i = 0; i < 6; i++) {
        if (this->bg_model[i] != NULL) {
            this->bg_model[i]->SetPosition(pos);
            MGDraw__FP6CFrame(this->bg_model[i]);
        }
    }
}

INCLUDE_ASM("main", DrawDummyModel__11CDungeonMapFP7CCamera);

INCLUDE_ASM("main", DrawMiniMap__11CDungeonMapFPff);

/* @ 0x1C39C0 (0x240 bytes) -- checkMask__11CDungeonMapFff */
void CDungeonMap::checkMask(float x, float z) {
    int cell_x;
    int cell_z;
    int room;

    room = -1;
    cell_x = (int) ((80.0f + x) / 160.0f);
    cell_z = (int) ((80.0f + z) / 160.0f);

    // Find the room that holds the cell that the player stands in.
    for (int i = 0; i < this->room_num; i++) {
        if (cell_x >= this->rooms[i].x && cell_x < this->rooms[i].x + this->rooms[i].width) {
            if (cell_z >= this->rooms[i].y && cell_z < this->rooms[i].y + this->rooms[i].height) {
                room = i;
            }
        }
    }

    // The first time that the player comes into a room, the mini map shows all of it.
    if (room != -1) {
        if (this->room_seen[room] == 0) {
            if (this->rooms[room].width != 0) {
                int col;
                int row;

                this->room_seen[room] = 1;
                for (row = this->rooms[room].y; row < this->rooms[room].y + this->rooms[room].height; row++) {
                    for (col = this->rooms[room].x; col < this->rooms[room].x + this->rooms[room].width; col++) {
                        this->mask[col + row * 20] = 1;
                    }
                }
            }
        }
    }
    this->mask[cell_x + cell_z * 20] = 1;
}

/* @ 0x1C3C00 (0xC0 bytes) -- FlushCheckMask__11CDungeonMapFv */
void CDungeonMap::FlushCheckMask() {
    int i;

    // Hide every cell of the mini map and forget every room that the player found.
    for (i = 0; i < 400; i++) {
        this->mask[i] = 0;
    }
    for (i = 0; i < 16; i++) {
        this->room_seen[i] = 0;
    }

    // A stair always shows, so that the player can find the way down again.
    for (i = 0; i < 400; i++) {
        if (this->cells[i].parts_no == 30) {
            this->mask[i] = 1;
        }
    }
}

INCLUDE_ASM("main", DrawFireFreeStyle__11CDungeonMapFP9CFrameVu1P13CCameraFollow);

INCLUDE_ASM("main", DrawFire__11CDungeonMapFP9CFrameVu1P13CCameraFollow);

INCLUDE_ASM("main", DrawRaster__11CDungeonMapFP9CFrameVu1);

INCLUDE_ASM("main", DrawWater__11CDungeonMapFPfi);

INCLUDE_ASM("main", DrawItemBox__11CDungeonMapFPf);

INCLUDE_ASM("main", DrawAtraBoll__11CDungeonMapFPf);

INCLUDE_ASM("main", CreateCollision__11CDungeonMapFP6CCPoly7CBoxVu0i);

INCLUDE_ASM("main", buildRoom__Fiiiii);

INCLUDE_ASM("main", mapPartsFilter__Fv);

INCLUDE_ASM("main", copyMapInfo__FP14BUILD_MAP_INFOP14BUILD_MAP_INFO);

INCLUDE_ASM("main", joinRoom__Fii);

INCLUDE_ASM("main", setRoomObject__Fv);

INCLUDE_ASM("main", setRoomDivid__Fv);

INCLUDE_ASM("main", setUnderDungeonStart__Fv);

INCLUDE_ASM("main", setStair__Fv);

/* @ 0x1C79B0 (0x40 bytes) -- initTrapCircle__11CDungeonMapFv */
void CDungeonMap::initTrapCircle() {
    for (int i = 0; i < 3; i++) {
        this->trap_circle[i].state = 0;
    }
}

/* @ 0x1C79F0 (0xC0 bytes) -- CheckTrapCircle__11CDungeonMapFPff */
float *CDungeonMap::CheckTrapCircle(float *pos, float dist) {
    for (int i = 0; i < 3; i++) {
        if (this->trap_circle[i].state != 0) {
            if (DistVector(this->trap_circle[i].pos, pos) < dist) {
                return this->trap_circle[i].pos;
            }
        }
    }
    return NULL;
}

INCLUDE_ASM("main", SetupTrapCircle__11CDungeonMapFPf);

INCLUDE_ASM("main", DrawTrapCircle__11CDungeonMapFv);

/* @ 0x1C7D80 (0xE0 bytes) -- DistTrapCircle__11CDungeonMapFv */
float *CDungeonMap::DistTrapCircle() {
    float pos[4];

    sceVu0CopyVector(pos, CharaMain.pos);
    for (int i = 0; i < 3; i++) {
        if (this->trap_circle[i].state == 1) {
            if (DistVector(this->trap_circle[i].pos, pos) <= 5.0f) {
                this->trap_circle[i].state = 2;
                return this->trap_circle[i].pos;
            }
        }
    }
    return NULL;
}

/* CDungeonMap::StepTrapCircle matches retail instruction for instruction, but
 * it is the only function here that needs a literal pool, and mwcc puts the two
 * floats in .lit4 sections of their own. Retail keeps them in main.rodata at
 * 0x2A1D98, which the build links from the whole-section dump -- so the object's
 * copies are eight extra bytes in the small-data area, and every gp-relative
 * offset in the image moves. Placing them needs asm/decompiled_symbols.txt to
 * learn about .lit4, which the migration does not read today. Until then the
 * marker supplies the function and the C++ waits here. */
#if DNG_COMPILE_UNMATCHED
/* @ 0x1C7E60 (0x80 bytes) -- StepTrapCircle__11CDungeonMapFv */
void CDungeonMap::StepTrapCircle() {
    for (int i = 0; i < 3; i++) {
        if (this->trap_circle[i].state == 2) {
            this->trap_circle[i].timer += 0.10471976f;
            if (this->trap_circle[i].timer >= 4.712389f) {
                this->trap_circle[i].state = 0;
            }
        }
    }
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_ASM("main", StepTrapCircle__11CDungeonMapFv);

/* @ 0x1C7EE0 (0xC0 bytes) -- CheckTreasureBox__11CDungeonMapFPff */
int CDungeonMap::CheckTreasureBox(float *pos, float dist) {
    for (int i = 0; i < this->box_num; i++) {
        if (this->boxes[i].used != 0 && DistVector(this->boxes[i].pos, pos) < dist) {
            return 0;
        }
    }
    return 1;
}

/* @ 0x1C7FA0 (0xE0 bytes) -- CheckAtra__11CDungeonMapFPff */
int CDungeonMap::CheckAtra(float *pos, float dist) {

    // Only the first six floors hold atla.
    if (selectMapNo >= 6) {
        return 1;
    }
    for (int i = 0; i < this->atra_num; i++) {
        if (this->atra[i].used != 0 && DistVector(this->atra[i].pos, pos) < dist) {
            return 0;
        }
    }
    return 1;
}

INCLUDE_ASM("main", SetAtraBoll__11CDungeonMapFPfi);

INCLUDE_ASM("main", SetTreasureBox__11CDungeonMapFPfiii);

INCLUDE_ASM("main", buildEventData__11CDungeonMapFiii);

INCLUDE_ASM("main", SetMimicEvent__11CDungeonMapFfffii);

/* @ 0x1C8E50 (0x80 bytes) -- RsetMimicEvent__11CDungeonMapFv */
void CDungeonMap::RsetMimicEvent() {
    for (int i = 0; i < 48; i++) {
        if (this->events[i].kind != -1) {
            if (this->events[i].kind == 8) {
                this->events[i].kind = -1;
                this->boxes[this->events[i].index].used = 0;
            }
        }
    }
}

/* @ 0x1C8ED0 (0x150 bytes) -- GetActiveIvent__11CDungeonMapFP9CFrameVu1 */
int CDungeonMap::GetActiveIvent(CFrameVu1 *frame) {
    float pos[4];

    sceVu0CopyVector(pos, frame->pos);

    // The grid cell that the player stands in; retail works it out and then
    // drops it.
    (void) (int) ((float) (int) (80.0f + pos[0]) / 160.0f);
    (void) (int) ((float) (int) (80.0f + pos[2]) / 160.0f);

    for (int i = 0; i < 48; i++) {
        if (this->events[i].kind != -1 && DistVector(this->events[i].pos, pos) <= this->events[i].radius) {
            return i;
        }
    }
    return -1;
}

INCLUDE_ASM("main", buildDummyModel__11CDungeonMapFv);

INCLUDE_ASM("main", GetRoomLinkInfo__11CDungeonMapFv);

/* @ 0x1CA240 (0x50 bytes) -- SetUnderLoad__11CDungeonMapFv */
void CDungeonMap::SetUnderLoad() {
    for (int i = 0; i < 20; i++) {
        this->cells[i * 20 + 19].parts_no = 44;
        this->cells[i * 20 + 19].direction = 0;
    }
}

INCLUDE_ASM("main", CreatPartsList__11CDungeonMapFPiiii);
INCLUDE_ASM("main", BuildCharaSpecialParts__11CDungeonMapFv);
INCLUDE_ASM("main", SetCharaDoor__11CDungeonMapFi);
INCLUDE_ASM("main", buildRandomMap__11CDungeonMapFii);
INCLUDE_ASM("main", initSubmap__11CDungeonMapFP14CDataAlloc2_1_);
INCLUDE_ASM("main", initalize__11CDungeonMapFv);

INCLUDE_RODATA("main", LIT_1007__2);
INCLUDE_RODATA("main", LIT_1008);
INCLUDE_RODATA("main", LIT_1470);
INCLUDE_RODATA("main", LIT_1471);
INCLUDE_RODATA("main", LIT_1559);
INCLUDE_RODATA("main", LIT_1560);
INCLUDE_RODATA("main", LIT_2283);
INCLUDE_RODATA("main", LIT_2284);
INCLUDE_RODATA("main", LIT_2338);
INCLUDE_RODATA("main", LIT_2339);
INCLUDE_RODATA("main", LIT_2448);
INCLUDE_RODATA("main", LIT_2859);
INCLUDE_RODATA("main", LIT_2860);
INCLUDE_RODATA("main", LIT_3075);
INCLUDE_RODATA("main", LIT_3190);
INCLUDE_RODATA("main", LIT_3191);
