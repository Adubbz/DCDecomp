#include "dungeonmap.hpp"

#include <libvu0.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "camera.hpp"
#include "character.hpp"
#include "dataset.hpp"
#include "dungeonparts.hpp"
#include "frame.hpp"
#include "frameattr.hpp"
#include "framevu1.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "textureanime.hpp"
#include "userstatus.hpp"

/* The floor that the player selected; only the first six hold atla. */
extern "C" s32 selectMapNo;

/* One texture animation for every part of every character in the dungeon. */
extern "C" CTexAnimeData BtNPCTexAnimeData[4][32];

/* The texture manager that the dungeon draws its textures out of. */
extern "C" CTextureManager TexManager;

/* The model a trap circle draws with. */
extern "C" CCharacter Trap_Circle;

/* The character that the player controls; the dungeon overlay defines it. */
extern "C" CCharacter CharaMain;

/**
 * Defines one debug free-area rectangle.
 */
struct ITEM_FREE_RECT {
    float left;
    float height;
    float top;
    float right;
    float unk_14;
    float bottom;
};

/**
 * Defines the debug free areas for one map part.
 */
struct ITEM_FREE_AREA {
    s8 parts_no;
    s8 rect_num;
    s8 direction;
    s8 unk_03;
    ITEM_FREE_RECT rect[4];
};

STATIC_ASSERT(sizeof(ITEM_FREE_RECT) == 0x18);
STATIC_ASSERT(sizeof(ITEM_FREE_AREA) == 0x64);

extern "C" int DebugStatus[];
extern "C" int BtEquipMap;
extern "C" int BtEquipMasuisyou;
extern "C" ITEM_FREE_AREA *ItemFreeAreaAll[];

/**
 * A single grid cell while a floor is being built.
 */
struct BUILD_MAP_INFO {
    s32 kind; /**< MapPartsNo that the cell builds into. */
    s32 unk_04;
    s32 link[16];
    s32 unk_48;
};

STATIC_ASSERT(sizeof(BUILD_MAP_INFO) == 0x4C);

/**
 * The four cells that touch one cell, as offsets in grid columns and rows.
 */
struct PARTS_ADJACENT {
    int offset[4][2]; /**< Column and row offset of each cell. */
};

/* Tables that translate the cells that touch a cell into the map part it
 * draws, one row of adjacency mask, map part and direction each. */

/** Gives the door that closes a corridor onto a room. */
s32 chainTableDoor[4][3] = {
    {14, MAP_PARTS_ROOM_DOOR_NORTH, 0},
    {13, MAP_PARTS_ROOM_DOOR_EAST, 0},
    {7, MAP_PARTS_ROOM_DOOR_SOUTH, 0},
    {11, MAP_PARTS_ROOM_DOOR_WEST, 0},
};

/** Gives the corridor that joins the cells that touch a corridor cell. */
s32 chainTableRoad[16][3] = {
    {6, MAP_PARTS_ROAD_STRAIGHT, 0},
    {9, MAP_PARTS_ROAD_STRAIGHT, 1},
    {5, MAP_PARTS_ROAD_CORNER, 0},
    {3, MAP_PARTS_ROAD_CORNER, 1},
    {10, MAP_PARTS_ROAD_CORNER, 2},
    {12, MAP_PARTS_ROAD_CORNER, 3},
    {0, MAP_PARTS_ROAD_CROSS, 0},
    {1, MAP_PARTS_ROAD_TEE, 0},
    {2, MAP_PARTS_ROAD_TEE, 1},
    {8, MAP_PARTS_ROAD_TEE, 2},
    {4, MAP_PARTS_ROAD_TEE, 3},
    {7, MAP_PARTS_ROAD_DEAD_END, 0},
    {11, MAP_PARTS_ROAD_DEAD_END, 1},
    {14, MAP_PARTS_ROAD_DEAD_END, 2},
    {13, MAP_PARTS_ROAD_DEAD_END, 3},
    {0, 0, 0},
};

/** Gives the wall that closes the edges of a room cell. */
s32 chainTableRoom[8][3] = {
    {1, MAP_PARTS_ROOM_WALL_NORTH, 0},
    {2, MAP_PARTS_ROOM_WALL_EAST, 0},
    {8, MAP_PARTS_ROOM_WALL_SOUTH, 0},
    {4, MAP_PARTS_ROOM_WALL_WEST, 0},
    {5, MAP_PARTS_ROOM_CORNER_NORTH_WEST, 0},
    {3, MAP_PARTS_ROOM_CORNER_NORTH_EAST, 0},
    {10, MAP_PARTS_ROOM_CORNER_SOUTH_EAST, 0},
    {12, MAP_PARTS_ROOM_CORNER_SOUTH_WEST, 0},
};

/** Gives the wall that divides a room. */
s32 chainTableDivid[6][3] = {
    {0xE8, MAP_PARTS_DIVIDE_END_NORTH, 0},
    {0xD4, MAP_PARTS_DIVIDE_END_EAST, 0},
    {0x71, MAP_PARTS_DIVIDE_END_SOUTH, 0},
    {0xB2, MAP_PARTS_DIVIDE_END_WEST, 0},
    {0xF9, MAP_PARTS_DIVIDE_WALL_NORTH, 0},
    {0xF6, MAP_PARTS_DIVIDE_WALL_EAST, 0},
};

/** Gives the door that opens a wall that divides a room. */
s32 chainTableDividDoor[2][3] = {
    {9, MAP_PARTS_DIVIDE_DOOR_NORTH, 0},
    {6, MAP_PARTS_DIVIDE_DOOR_EAST, 0},
};

#if DNG_COMPILE_UNMATCHED
void CDungeonMap::SetNPC(int npc_no, unsigned int *pack, int parts_no, sceVu0FVECTOR pos, sceVu0FVECTOR rot,
                         int visible, int motion_no, CDataAlloc2_1_ *alloc) {
    int i;

    if (this->npc[npc_no].used != 0) {
        return;
    }
    if (npc_no >= 4 || npc_no < 0) {
        return;
    }

    CFrameAttr attr;

    attr.unk_0C = 1;
    for (i = 0; i < 32; i++) {
        BtNPCTexAnimeData[npc_no][i].Initialize();
    }
    this->npc[npc_no].chara.InitializeTexAnime(BtNPCTexAnimeData[npc_no], 32);
    this->npc[npc_no].chara.LoadPackData2(pack, "info.cfg", alloc, npc_no + 64,
                                          alloc, 0);
    if (this->npc[npc_no].chara.frame == NULL) {
        printf("******* NPCEntryErr\n");
    }
    this->npc[npc_no].chara.frame->SetAttr(attr, 1, 64);
    SetFrameAttr(this->npc[npc_no].chara.frame, 1);

    sceVu0CopyVector(this->npc[npc_no].pos, pos);
    sceVu0CopyVector(this->npc[npc_no].unk_11C0, rot);
    this->npc[npc_no].parts_no = parts_no;
    this->npc[npc_no].unk_11D8 = visible;
    this->npc[npc_no].used = 1;
    this->npc[npc_no].unk_11DC = motion_no;
    this->npc[npc_no].chara.motion_no = motion_no;
    this->npc[npc_no].chara.flags = 0;
    this->npc[npc_no].chara.motion_speed = -1.0f;
}
#endif /* DNG_COMPILE_UNMATCHED */

INCLUDE_ASM("asm/nonmatchings/dungeonmap", SetNPC__11CDungeonMapFiPUiiPfPfiiP14CDataAlloc2_1_);
INCLUDE_RODATA("asm/nonmatchings/dungeonmap", LIT_1008);

void CDungeonMap::ClearNPC_Cash() {
    for (int i = 0; i < 4; i++) {
        this->npc[i].draw_num = 0;
    }
}

void CDungeonMap::ReservNPC_Draw(int npc_no, float x, float y, float z, int param) {
    if (this->npc[npc_no].used != 0 && this->npc[npc_no].unk_11D8 != 0 && this->npc[npc_no].chara.frame != NULL) {
        this->npc[npc_no].draw_pos[this->npc[npc_no].draw_num][0] = x;
        this->npc[npc_no].draw_pos[this->npc[npc_no].draw_num][1] = y;
        this->npc[npc_no].draw_pos[this->npc[npc_no].draw_num][2] = z;
        this->npc[npc_no].draw_param[this->npc[npc_no].draw_num] = param;
        this->npc[npc_no].draw_num++;
    }
}

void CDungeonMap::DrawNPCDraw() {
    float pos[4];
    float unused[4];
    int i;
    int j;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < this->npc[i].draw_num; j++) {
            int param;
            float angle;
            float deg;
            float turn;

            if (this->npc[i].chara.frame == NULL) {
                break;
            }
            sceVu0CopyVector(pos, this->npc[i].draw_pos[j]);
            sceVu0CopyVector(unused, this->npc[i].draw_pos[j]);
            pos[0] += this->npc[i].pos[0];
            pos[1] += this->npc[i].pos[1];
            pos[2] += this->npc[i].pos[2];
            pos[3] = 1.0f;
            this->npc[i].chara.SetPosition(pos);

            param = this->npc[i].draw_param[j];
            if (param > 3) {
                param -= 3;
            }
            if (param == 3) {
                param = -1;
            }
            deg = -90.0f * param;
            angle = (3.1415927f * deg) / 180.0f;
            angle += this->npc[i].unk_11C0[1];
            if (!(angle <= 3.1415927f)) {
                angle -= 6.2831855f;
            }
            if (angle < -3.1415927f) {
                angle += 6.2831855f;
            }
            this->npc[i].chara.SetRotation(0.0f, angle, 0.0f);
            TexManager.ReloadTexture(Vif1Packet, i + 64);
            this->npc[i].chara.TextureAnime(i + 64);
            this->npc[i].chara.Draw();
        }
    }
}

void CDungeonMap::StepNPC() {
    for (int i = 0; i < 4; i++) {
        if (this->npc[i].used != 0 && this->npc[i].unk_11D8 != 0 &&
            this->npc[i].chara.frame != NULL && this->npc[i].unk_11DC != -1) {
            this->npc[i].chara.Step();
        }
    }
}

void CDungeonMap::NPCSetMotion(int npc_no, int motion_no) {
    this->npc[npc_no].chara.motion_no = motion_no;
    this->npc[npc_no].chara.flags = 0;
    this->npc[npc_no].chara.motion_speed = -1.0f;
}

void CDungeonMap::NPCSetMotion(int npc_no, int motion_no, float speed, int unk) {
    this->npc[npc_no].chara.motion_no = motion_no;
    this->npc[npc_no].chara.flags = unk;
    this->npc[npc_no].chara.motion_speed = -1.0f;
    this->npc[npc_no].chara.motion_speed = speed;
}

CFrame *CDungeonMap::GetFrameSearch(char *name) {
    for (int i = 0; i < 72; i++) {
        CFrame *frame = this->parts[i].GetSearchFrame(name);
        if (frame != NULL) {
            return frame;
        }
    }
    return NULL;
}

void CDungeonMap::DrawMapFreeStyle() {
    int i;
    int npc_no;

    this->ClearNPC_Cash();

    for (i = 0; this->parts[i].frame[0] != NULL; i++) {
        this->parts[i].pos[0] = 0.0;
        this->parts[i].pos[1] = 0.0;
        this->parts[i].pos[2] = 0.0;
        this->parts[i].pos[3] = 1.0;
        this->parts[i].direction = 0;
        this->parts[i].Draw();

        for (npc_no = 0; npc_no < 4; npc_no++) {
            if (this->npc[npc_no].parts_no == i) {
                this->ReservNPC_Draw(npc_no, 0.0, 0.0, 0.0, 0);
            }
        }
    }
}

void CDungeonMap::DrawMapCalc(int mode) {
    int row, col;
    int i;

    if (mode == 1) {

        for (row = 0; row < 20; row++) {
            for (col = 0; col < 20; col++) {
                int no = col + row * 20;

                if (this->cells[no].parts_no != MAP_PARTS_NONE) {
                    CDungeonParts *part;
                    int dir = this->cells[no].direction;

                    part = &this->parts[this->cells[no].parts_no];
                    part->direction = dir;
                    part = &this->parts[this->cells[no].parts_no];
                    part->pos[0] = 160.0f * col;
                    part->pos[1] = 0.0f;
                    part->pos[2] = 160.0f * row;
                    part->pos[3] = 1.0f;
                    this->parts[this->cells[no].parts_no].DrawCalc(col, row, this->cells[no].direction, mode);
                }
            }
        }
    } else {
        for (i = 0; this->parts[i].frame[0] != NULL; i++) {
            this->parts[i].DrawCalc(0, 0, 0, mode);
        }
    }
}

#if DNG_COMPILE_UNMATCHED
void CDungeonMap::DrawMap(CCameraFollow *camera, CFrameVu1 *player) {
    float cam_pos[4];
    float view_delta[4];
    float cam_ref[4];
    float view[4];
    float player_pos[4];
    float sound_pos[4];
    float cell_delta[4];
    float ambient[4];
    float old_ambient[4];
    ITEM_FREE_AREA *free_area;
    float volume;
    float pan;
    float dist;
    float delta_x;
    float nearest;
    float world_x;
    float world_z;
    float delta_z;
    int sound_no;
    int row;
    int col;
    int cell_no;
    int draw;
    int npc_no;
    int area_no;
    int rect_no;
    int player_cell_x;
    int player_cell_y;

    ((CCamera *) camera)->GetPos(cam_pos);
    ((CCamera *) camera)->GetRef(cam_ref);
    view_delta[0] = cam_ref[0] - cam_pos[0];
    view_delta[1] = cam_ref[1] - cam_pos[1];
    view_delta[2] = cam_ref[2] - cam_pos[2];
    view_delta[3] = 1.0f;
    sceVu0Normalize(view, view_delta);
    sceVu0CopyVector(player_pos, player->position);
    player_cell_x = (int) (player_pos[0] / 160.0f);
    player_cell_y = (int) (player_pos[2] / 160.0f);
    free_area = ItemFreeAreaAll[selectMapNo];

    this->ClearNPC_Cash();
    nearest = 10000.0f;
    for (row = 0; row < 20; row++) {
        for (col = 0; col < 20; col++) {
            world_x = 160.0f * col;
            delta_x = world_x - cam_pos[0];
            world_z = 160.0f * row;
            delta_z = world_z - cam_pos[2];

            cell_delta[0] = delta_x;
            cell_delta[1] = 0.0f;
            cell_delta[2] = delta_z;
            cell_delta[3] = 0.0f;
            dist = DistVector(cell_delta);
            cell_no = col + row * 20;
            this->cells[cell_no].unk_08 = dist;

            if (this->cells[cell_no].parts_no == MAP_PARTS_NONE) {
                this->cells[cell_no].unk_0C = 0;
                continue;
            }

            if (this->cells[cell_no].parts_no == MAP_PARTS_KEY_XIAO) {
                if (UserStatus->cur_georama == 2 && dist < nearest) {
                    nearest = dist;
                    sound_pos[0] = world_x;
                    sound_pos[1] = 0.0f;
                    sound_pos[2] = world_z;
                    sound_pos[3] = 1.0f;
                    sound_no = 65;
                }
            }
            // Part 75 is unknown
            if (this->cells[cell_no].parts_no == 75 && dist < nearest) {
                nearest = dist;
                sound_pos[0] = world_x;
                sound_pos[1] = 0.0f;
                sound_pos[2] = world_z;
                sound_pos[3] = 1.0f;
                sound_no = 75;
            }

            if (!(dist < 160.0f * this->draw_dist_scale)) {
                draw = 0;
            } else {
                int georama;

                cam_ref[0] = delta_x - view_delta[0];
                cam_ref[1] = 0.0f;
                cam_ref[2] = delta_z - view_delta[2];
                cam_ref[3] = 1.0f;
                sceVu0Normalize(cam_ref, cam_ref);
                float facing = sceVu0InnerProduct(view, cam_ref);
                draw = 1;
                georama = UserStatus->cur_georama;
                if (georama == 5 && this->cells[cell_no].parts_no == MAP_PARTS_URA_ROAD)
                    facing = 1.0f;
                if (facing <= 0.0f && !(dist < 160.0f))
                    draw = 0;
                if (this->cells[cell_no].parts_no >= MAP_PARTS_URA_ENTRANCE_NORTH &&
                    this->cells[cell_no].parts_no <= MAP_PARTS_URA_ENTRANCE_WEST && georama == 5)
                    draw = 1;
            }
            this->cells[cell_no].unk_0C = draw;
            if (this->cells[cell_no].parts_no == MAP_PARTS_NONE)
                continue;
            if (draw != 1)
                continue;

            int direction = this->cells[cell_no].direction;

            this->parts[this->cells[cell_no].parts_no].direction = direction;
            {
                CDungeonParts *position_part = &this->parts[this->cells[cell_no].parts_no];
                position_part->pos[0] = world_x;
                position_part->pos[1] = 0.0f;
                position_part->pos[2] = world_z;
                position_part->pos[3] = 1.0f;
            }
            for (npc_no = 0; npc_no < 4; npc_no++) {
                if (this->npc[npc_no].parts_no == this->cells[cell_no].parts_no) {
                    this->ReservNPC_Draw(npc_no, world_x, 0.0f, world_z,
                                         this->cells[cell_no].direction);
                }
            }

            if (UserStatus->cur_georama == 4) {
                MGGetAmbient(old_ambient);
                MGGetAmbient(ambient);
                if (dist <= 480.0f) {
                    ambient[3] = 128.0f;
                } else {
                    ambient[3] = 128.0f - (dist - 480.0f);
                    if (ambient[3] < 0.0f)
                        ambient[3] = 0.0f;
                }
                MGSetAmbient(ambient);
            }
            this->parts[this->cells[cell_no].parts_no].Draw();
            if (UserStatus->cur_georama == 4)
                MGSetAmbient(old_ambient);

            // Debug status six shows each configured free area on its map part.
            if (DebugStatus[6] != 0) {
                for (area_no = 0; free_area[area_no].parts_no != MAP_PARTS_NONE; area_no++) {
                    if (free_area[area_no].parts_no != this->cells[cell_no].parts_no)
                        continue;
                    for (rect_no = 0; rect_no < free_area[area_no].rect_num; rect_no++) {
                        float corner[4][4];
                        int screen[4][4];
                        int all_visible;
                        int corner_no;
                        int rotation;

                        rotation = (int) (float) free_area[area_no].direction;
                        rotation = rotation + this->cells[cell_no].direction;
                        if (rotation > 3)
                            rotation -= 4;
                        all_visible = 1;
                        float radians = (3.1415927f * ((4 - rotation) * 90)) / 180.0f;
                        float x[4];
                        float z[4];
                        float height;
                        float left = free_area[area_no].rect[rect_no].left;
                        x[0] = 10.0f * left;
                        height = 10.0f * free_area[area_no].rect[rect_no].height;
                        z[0] = 10.0f * free_area[area_no].rect[rect_no].top;
                        x[3] = 10.0f * free_area[area_no].rect[rect_no].right;
                        z[3] = 10.0f * free_area[area_no].rect[rect_no].bottom;
                        x[1] = x[3];
                        z[1] = z[0];
                        x[2] = x[0];
                        z[2] = z[3];

                        for (corner_no = 0; corner_no < 4; corner_no++) {
                            corner[corner_no][0] = -z[corner_no] * sinf(radians) - x[corner_no] * cosf(radians);
                            corner[corner_no][2] = -x[corner_no] * sinf(radians) + z[corner_no] * cosf(radians);
                            corner[corner_no][0] *= -1.0f;
                            corner[corner_no][0] += world_x;
                            corner[corner_no][1] = 2.0f + height;
                            corner[corner_no][2] += world_z;
                            corner[corner_no][3] = 1.0f;
                            if (MGRotTransPers(screen[corner_no], corner[corner_no], 0) == 0) {
                                all_visible = 0;
                            }
                        }
                        if (all_visible != 0) {
                            setColSprite(Vif1Packet, screen[0], screen[1], screen[2], screen[3],
                                         0x80, 0, 0, 0x40);
                        }
                    }
                }
            }
        }
    }

    if (nearest < 10000.0f) {
        SndGetVolPan(&volume, &pan, sound_pos, 10.0f, 500.0f);
        SndSetSeVolf(sound_no, volume, 0);
        SndSetSePanf(sound_no, pan, 0);
    }
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_ASM("asm/nonmatchings/dungeonmap", DrawMap__11CDungeonMapFP13CCameraFollowP9CFrameVu1);

void CDungeonMap::DrawBGModel(CCamera *camera) {
    float pos[4];

    // The background follows the camera, so that it stays at the horizon.
    camera->GetPos(pos);
    pos[1] = 0.0f;
    for (int i = 0; i < 6; i++) {
        if (this->bg_model[i] != NULL) {
            this->bg_model[i]->SetPosition(pos);
            MGDraw(this->bg_model[i]);
        }
    }
}

void CDungeonMap::DrawDummyModel(CCamera *camera) {
    float pos[4];

    if (this->dummy_num == 0) {
        return;
    }

    // A dummy model only draws while the camera is near enough to it.
    camera->GetPos(pos);
    for (int i = 0; i < this->dummy_num; i++) {
        if (this->dummy_frame[this->dummy_model[i]] != NULL) {
            if (DistVector(this->dummy_pos[i], pos) < 160.0f * (1.0f + this->draw_dist_scale)) {
                this->dummy_frame[this->dummy_model[i]]->SetPosition(this->dummy_pos[i]);
                MGDraw(this->dummy_frame[this->dummy_model[i]]);
            }
        }
    }
}

#if DNG_COMPILE_UNMATCHED
void CDungeonMap::DrawMiniMap(float *pos, float angle) {
    CRect_i_ map_dst;
    CRect_i_ map_src;
    CRect_i_ player_dst;
    CRect_i_ player_src;
    CRect_i_ trap_dst;
    CRect_i_ trap_src;
    CRect_i_ box_dst;
    CRect_i_ box_src;
    CRect_i_ atra_dst;
    CRect_i_ atra_src;
    int status;
    unsigned char red;
    int saved_map;
    int saved_crystal;
    unsigned char green;
    unsigned char blue;
    int row;
    int col;
    int cell_no;
    int direction;
    int map_x;
    int map_y;
    int visible;
    int show;
    int i;
    float player_screen_x;
    status = UserStatus->minimap_status;
    if (status == 3) {
        return;
    }

    unsigned char red_table[3] = {0x20, 0x40, 0x60};
    unsigned char green_table[3] = {0x60, 0x80, 0xA2};
    unsigned char blue_table[3] = {0x40, 0x60, 0xA2};

    red = red_table[status];
    green = green_table[status];
    blue = blue_table[status];
    saved_map = BtEquipMap;
    saved_crystal = BtEquipMasuisyou;
    if (DebugStatus[3] != 0) {
        BtEquipMap = 1;
        BtEquipMasuisyou = 1;
    }

    visible = BtEquipMap ? 0 : 1;
    CTexture *map_texture = TexManager.GetTexture("minimap1", -1);
    CTexture *symbol_texture = TexManager.GetTexture("itempack", -1);

    for (row = 0; row < 20; row++) {
        for (col = 0; col < 20; col++) {
            cell_no = col + row * 20;
            unsigned char alpha;
            int masked = this->mask[cell_no];
            show = masked;
            if (visible == 0 && masked == 0) {
                show = 1;
                alpha = red;
            } else {
                alpha = green;
            }
            if (this->cells[cell_no].parts_no != MAP_PARTS_NONE && show == 1) {
                direction = this->cells[cell_no].direction +
                            this->parts[this->cells[cell_no].parts_no].unk_000;
                direction %= 8;
                map_src.x = direction * 16;
                map_src.y = (direction / 8) * 16;
                map_src.width = 16;
                map_src.height = 16;
                map_dst.x = col * 16 + 380;
                map_dst.y = row * 16 + 64;
                map_dst.width = 16;
                map_dst.height = 16;
                set2DSprite(Vif1Packet, map_texture, map_dst, map_src, alpha, alpha, alpha, blue);
            }
        }
    }

    pos[0] *= 0.1f;
    pos[2] *= 0.1f;
    player_src.x = 88;
    player_src.y = 96;
    player_src.width = 12;
    player_src.height = 12;
    map_y = (int) (pos[2] + 64.0f + 8.0f);
    player_screen_x = pos[0] + 380.0f + 8.0f;
    map_x = (int) player_screen_x;
    player_dst.x = (int) player_screen_x;
    player_dst.y = map_y;
    player_dst.width = 12;
    player_dst.height = 12;
    set2DSprite(Vif1Packet, symbol_texture, player_dst, player_src, 7, 7, angle);

    for (i = 0; i < 3; i++) {
        if (this->trap_circle[i].state == 0)
            continue;
        map_x = (int) (this->trap_circle[i].pos[0] * 0.1f);
        map_y = (int) (this->trap_circle[i].pos[2] * 0.1f);
        cell_no = (int) ((80.0f + this->trap_circle[i].pos[0]) / 160.0f) +
                  (int) ((80.0f + this->trap_circle[i].pos[2]) / 160.0f) * 20;
        show = this->mask[cell_no];
        if (BtEquipMasuisyou == 1)
            show = 1;
        if (this->cells[cell_no].parts_no != MAP_PARTS_NONE && show == 1) {
            trap_src.x = 88;
            trap_src.y = 112;
            trap_src.width = 8;
            trap_src.height = 8;
            trap_dst.x = map_x + 384;
            trap_dst.y = map_y + 68;
            trap_dst.width = 8;
            trap_dst.height = 8;
            set2DSprite(Vif1Packet, symbol_texture, trap_dst, trap_src, blue);
        }
    }

    for (i = 0; i < 24; i++) {
        if (this->boxes[i].used == 0 || this->boxes[i].unk_24 == 0)
            continue;
        map_x = (int) (this->boxes[i].pos[0] * 0.1f);
        map_y = (int) (this->boxes[i].pos[2] * 0.1f);
        cell_no = (int) ((80.0f + this->boxes[i].pos[0]) / 160.0f) +
                  (int) ((80.0f + this->boxes[i].pos[2]) / 160.0f) * 20;
        show = this->mask[cell_no];
        if (BtEquipMasuisyou == 1)
            show = 1;
        if (this->cells[cell_no].parts_no != MAP_PARTS_NONE && show == 1) {
            box_src.x = 80;
            box_src.y = 96;
            box_src.width = 8;
            box_src.height = 8;
            box_dst.x = map_x + 384;
            box_dst.y = map_y + 68;
            box_dst.width = 8;
            box_dst.height = 8;
            set2DSprite(Vif1Packet, symbol_texture, box_dst, box_src, blue);
        }
    }

    for (i = 0; i < 8; i++) {
        if (this->atra[i].used == 0)
            continue;
        map_x = (int) (this->atra[i].pos[0] * 0.1f);
        map_y = (int) (this->atra[i].pos[2] * 0.1f);
        cell_no = (int) ((80.0f + this->atra[i].pos[0]) / 160.0f) +
                  (int) ((80.0f + this->atra[i].pos[2]) / 160.0f) * 20;
        show = this->mask[cell_no];
        if (BtEquipMasuisyou == 1)
            show = 1;
        if (this->cells[cell_no].parts_no != MAP_PARTS_NONE && show == 1) {
            atra_src.x = 72;
            atra_src.y = 104;
            atra_src.width = 8;
            atra_src.height = 8;
            atra_dst.x = map_x + 384;
            atra_dst.y = map_y + 68;
            atra_dst.width = 8;
            atra_dst.height = 8;
            set2DSprite(Vif1Packet, symbol_texture, atra_dst, atra_src, blue);
        }
    }

    BtEquipMap = saved_map;
    BtEquipMasuisyou = saved_crystal;
}
#endif
INCLUDE_ASM("asm/nonmatchings/dungeonmap", DrawMiniMap__11CDungeonMapFPff);
INCLUDE_RODATA("asm/nonmatchings/dungeonmap", LIT_1470);
INCLUDE_RODATA("asm/nonmatchings/dungeonmap", LIT_1471);

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

    // Mark the entire room as seen when the player enters it for the first time.
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

void CDungeonMap::FlushCheckMask() {
    int i;

    // Hide every cell of the mini map and forget every room that the player found.
    for (i = 0; i < 400; i++) {
        this->mask[i] = 0;
    }
    for (i = 0; i < 16; i++) {
        this->room_seen[i] = 0;
    }

    // The entrance should always show on the mini map.
    for (i = 0; i < 400; i++) {
        if (this->cells[i].parts_no == MAP_PARTS_STAIR_DOWN) {
            this->mask[i] = 1;
        }
    }
}

#if DNG_COMPILE_UNMATCHED
void CDungeonMap::DrawFireFreeStyle(CFrameVu1 *frame, CCameraFollow *camera) {
    float fire_pos[4];
    float part_pos[4];
    float cam_pos[4];
    float best_pos[4];
    float frame_pos[4];
    float vol;
    float pan;
    float near_dist;
    int j;
    int i;

    sceVu0CopyVector(frame_pos, frame->position);
    ((CCamera *) camera)->GetPos(cam_pos);
    sceVu0ScaleVectorXYZ(cam_pos, cam_pos, 0.1f);

    this->fire.SetTexture(TexManager.GetTexture("lightling", -1),
                          TexManager.GetTexture("blender", -1));
    this->fire.FireCreate();

    near_dist = 16000.0f;
    for (i = 0; this->parts[i].frame[0] != NULL; i++) {
        sceVu0CopyVector(part_pos, this->parts[i].unk_110);

        for (j = 0; j < this->parts[i].fire_num; j++) {
            float angle;
            float turn;
            float rot_x;
            float rot_z;
            float dist;
            float world_z;
            float world_y;
            int param;

            fire_pos[0] = this->parts[i].fire_pos[j][0];
            fire_pos[1] = this->parts[i].fire_pos[j][1];
            fire_pos[2] = this->parts[i].fire_pos[j][2];
            fire_pos[3] = 1.0f;
            param = this->parts[i].fire_param[j];

            // The point turns with the part that holds it.
            angle = this->parts[i].unk_170;
            if (angle != 0.0f) {
                angle = (3.1415927f * (90.0f * (4.0f - angle))) / 180.0f;
                turn = -fire_pos[2] * sinf(angle);
                rot_x = turn - fire_pos[0] * cosf(angle);
                turn = -fire_pos[0] * sinf(angle);
                rot_z = turn + fire_pos[2] * cosf(angle);
                rot_x *= -1.0f;
            } else {
                rot_x = fire_pos[0];
                rot_z = fire_pos[2];
            }

            fire_pos[0] = part_pos[0] / 10.0f + rot_x;
            fire_pos[1] += part_pos[1] / 10.0f;
            fire_pos[2] = world_z = part_pos[2] / 10.0f + rot_z;
            world_y = fire_pos[1];

            this->fire.pos[0] = 10.0f * fire_pos[0];
            this->fire.pos[1] = 10.0f * world_y;
            this->fire.pos[2] = 10.0f * world_z;
            this->fire.pos[3] = 1.0f;
            this->fire.DrawFire(1, 1, (CCamera *) camera, frame_pos, 1.0f, param, 15.0f);

            // The crackle comes from the fire that is nearest to the camera.
            dist = DistVector(cam_pos, fire_pos);
            if (!(near_dist < dist)) {
                near_dist = dist;
                sceVu0CopyVector(best_pos, fire_pos);
                sceVu0ScaleVectorXYZ(best_pos, best_pos, 10.0f);
            }
        }
    }

    if (near_dist <= 30.0f) {
        SndGetVolPan(&vol, &pan, best_pos, 10.0f, 500.0f);
        SndSetSeVolf(53, vol, 0);
        SndSetSePanf(53, pan, 0);
    } else {
        SndSetSeVol(53, 0, 0);
    }
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_ASM("asm/nonmatchings/dungeonmap", DrawFireFreeStyle__11CDungeonMapFP9CFrameVu1P13CCameraFollow);
INCLUDE_RODATA("asm/nonmatchings/dungeonmap", LIT_1559);
INCLUDE_RODATA("asm/nonmatchings/dungeonmap", LIT_1560);

#if DNG_COMPILE_UNMATCHED
void CDungeonMap::DrawFire(CFrameVu1 *frame, CCameraFollow *camera) {
    float fire_pos[4];
    float frame_pos[4];
    float cam_near[4];
    float cam_pos[4];
    float best_pos[4];
    float frame_near[4];
    float vol;
    float pan;
    float near_dist;
    int cam_col;
    int cam_row;
    int j;
    int col;
    int row;
    int param;

    sceVu0CopyVector(frame_pos, frame->position);
    ((CCamera *) camera)->GetPos(cam_pos);
    ((CCamera *) camera)->GetPos(cam_near);
    sceVu0ScaleVectorXYZ(cam_near, cam_near, 0.1f);

    this->fire.SetTexture(TexManager.GetTexture("lightling", -1),
                          TexManager.GetTexture("blender", -1));
    this->fire.FireCreate();

    sceVu0CopyVector(frame_near, frame->position);
    frame_near[0] /= 10.0f;
    frame_near[1] /= 10.0f;
    frame_near[2] /= 10.0f;

    cam_col = (int) (cam_pos[0] / 160.0f);
    cam_row = (int) (cam_pos[2] / 160.0f);
    near_dist = 16000.0f;

    // Only the cells around the camera show their fires.
    for (row = cam_row - 5; row < cam_row + 5; row++) {
        for (col = cam_col - 5; col < cam_col + 5; col++) {
            if (row >= 0 && row < 20 && col >= 0 && col < 20) {
                int no = col + row * 20;

                if (this->cells[no].parts_no != MAP_PARTS_NONE &&
                    this->cells[no].unk_08 <= 160.0f * (3.0f + this->draw_dist_scale)) {
                    for (j = 0; j < this->parts[this->cells[no].parts_no].fire_num; j++) {
                        float turn;
                        float rot_x;
                        float rot_z;
                        float angle;
                        float dist;

                        CDungeonParts *part = &this->parts[this->cells[no].parts_no];

                        fire_pos[0] = part->fire_pos[j][0];
                        fire_pos[1] = part->fire_pos[j][1];
                        fire_pos[2] = part->fire_pos[j][2];
                        fire_pos[3] = 1.0f;
                        param = part->fire_param[j];

                        // The point turns with the part that holds it.
                        angle = (3.1415927f *
                                 (float) ((4 - this->cells[no].direction) * 90)) /
                                180.0f;
                        if (this->cells[no].direction != 0) {
                            turn = -fire_pos[2] * sinf(angle);
                            rot_x = turn - fire_pos[0] * cosf(angle);
                            turn = -fire_pos[0] * sinf(angle);
                            rot_z = turn + fire_pos[2] * cosf(angle);
                            rot_x *= -1.0f;
                        } else {
                            rot_x = fire_pos[0];
                            rot_z = fire_pos[2];
                        }

                        fire_pos[0] = rot_x + 16.0f * (float) col;
                        fire_pos[2] = rot_z + 16.0f * (float) row;

                        this->fire.pos[0] = 10.0f * fire_pos[0];
                        this->fire.pos[1] = 10.0f * fire_pos[1];
                        this->fire.pos[2] = 10.0f * fire_pos[2];
                        this->fire.pos[3] = 1.0f;
                        this->fire.DrawFire(1, 1, (CCamera *) camera, frame_pos, 1.0f, param,
                                            15.0f);

                        // The crackle comes from the fire that is nearest to the camera.
                        dist = DistVector(cam_near, fire_pos);
                        if (!(near_dist < dist)) {
                            near_dist = dist;
                            sceVu0CopyVector(best_pos, fire_pos);
                            sceVu0ScaleVectorXYZ(best_pos, best_pos, 10.0f);
                        }
                    }
                }
            }
        }
    }

    if (near_dist <= 30.0f) {
        SndGetVolPan(&vol, &pan, best_pos, 10.0f, 500.0f);
        SndSetSeVolf(53, vol, 0);
        SndSetSePanf(53, pan, 0);
    } else {
        SndSetSeVol(53, 0, 0);
    }
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_ASM("asm/nonmatchings/dungeonmap", DrawFire__11CDungeonMapFP9CFrameVu1P13CCameraFollow);

#if DNG_COMPILE_UNMATCHED
/* 189 of 202 instructions. Retail's loop test forms `&parts[parts_no]` and the
 * body reads the fire positions at 0x20 from it; mwcc carries only the scaled
 * index across the test and folds the 0x490 into the load displacement. A
 * `CDungeonParts *` local recovers the 0x20 offsets but forms the base inside
 * the body, which trades three differences for four. */
void CDungeonMap::DrawRaster(CFrameVu1 *frame) {
    float pos[4];
    int i;
    int col;
    int row;
    int cell_z;
    int cell_x;

    sceVu0CopyVector(pos, frame->position);
    cell_x = (int) (pos[0] / 160.0f);
    cell_z = (int) (pos[2] / 160.0f);

    // Only the cells around the player cast a raster.
    for (row = cell_z - 4; row < cell_z + 4; row++) {
        for (col = cell_x - 4; col < cell_x + 4; col++) {
            if (row >= 0 && row < 20 && col >= 0 && col < 20) {
                int no = col + row * 20;

                if (this->cells[no].parts_no != MAP_PARTS_NONE && this->cells[no].unk_08 <= 240.0f &&
                    this->cells[no].unk_0C == 1) {
                    for (i = 0; i < this->parts[this->cells[no].parts_no].fire_num; i++) {
                        float x;
                        float y;
                        float z;
                        float rot_x;
                        float rot_z;
                        float angle;
                        int dir;

                        x = this->parts[this->cells[no].parts_no].fire_pos[i][0];
                        y = this->parts[this->cells[no].parts_no].fire_pos[i][1];
                        z = this->parts[this->cells[no].parts_no].fire_pos[i][2];
                        // The point turns with the part that holds it.
                        dir = this->cells[no].direction;
                        angle = (3.1415927f * (float) ((4 - dir) * 90)) / 180.0f;
                        if (dir != 0) {
                            rot_x = -z * sinf(angle) - x * cosf(angle);
                            rot_z = -x * sinf(angle) + z * cosf(angle);
                            rot_x *= -1.0f;
                        } else {
                            rot_x = x;
                            rot_z = z;
                        }
                        x = rot_x + 16.0f * (float) col;
                        z = rot_z + 16.0f * (float) row;

                        this->fire.pos[0] = 10.0f * x;
                        this->fire.pos[1] = 10.0f * y;
                        this->fire.pos[2] = 10.0f * z;
                        this->fire.pos[3] = 1.0f;
                        this->fire.DrawRaster();
                    }
                }
            }
        }
    }
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_ASM("asm/nonmatchings/dungeonmap", DrawRaster__11CDungeonMapFP9CFrameVu1);

void CDungeonMap::DrawWater(float *pos, int mute) {
    static int wait;
    static char init;

    float vec[4];
    float best_pos[4];
    float vol;
    float pan;
    float near_dist;
    float sound_dist;
    int shake;
    int col;
    int row;
    PARTS_WATER *best;
    PARTS_WATER *water;
    CDungeonParts *part;
    int best_col;
    int best_row;

    best = NULL;
    near_dist = 320.0f;
    sound_dist = 300.0f;
    shake = 0;

    // The surface only shakes once every thirty frames.
    if (init == 0) {
        wait = 0;
        init = 1;
    }
    if (wait >= 30) {
        wait = 0;
        shake = 1;
    } else {
        wait++;
    }

    // One surface draws for the whole floor: the one nearest to the player.
    for (row = 0; row < 16; row++) {
        for (col = 0; col < 16; col++) {
            int no = col + row * 20;
            float dist;

            if (this->cells[no].parts_no == MAP_PARTS_NONE) {
                continue;
            }
            part = &this->parts[this->cells[no].parts_no];
            water = &part->water;
            if (this->parts[this->cells[no].parts_no].water.used == 0) {
                continue;
            }
            vec[0] = 160.0f * (float) col;
            vec[1] = water->vertex[0][1];
            vec[2] = 160.0f * (float) row;
            dist = DistVector(pos, vec);
            if (dist < near_dist) {
                best = water;
                near_dist = dist;
                best_pos[0] = vec[0];
                best_pos[1] = vec[1];
                best_pos[2] = vec[2];
                best_col = col;
                best_row = row;
            }
            if (sound_dist >= dist) {
                sound_dist = dist;
            }
        }
    }

    if (best != NULL) {
        this->water.SetVertex(best->vertex[0], best->vertex[1], best->vertex[2], best->vertex[3]);
        this->water.frame.SetPosition(best_pos);
        u8 red = best->red;
        u8 green = best->green;
        u8 blue = best->blue;

        this->water.SetColor(red, green, blue, 0x80);
        if (shake != 0) {
            if (selectMapNo == 0 && selectMapNo == 6) {
                float height = 1.0f;

                this->water.SetParam(0.12f, 0.018f, height, 11.0f);
            } else {
                float speed = 11.0f;

                this->water.SetParam(0.12f, 0.018f, 0.0f, speed);
            }
            this->water.Shake(16, 4, 2.15f);
        }
        this->water.Hamon();
        DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(&this->water, &mgRenderInfo, Vif1Packet, NULL);
    }

    if (best != NULL) {

        // A waterfall stands at the cell that the surface came from.
        if (best->has_fall != 0 && this->model[6] != NULL) {
            float x = 160.0f * (float) best_col;
            float z = 160.0f * (float) best_row;

            this->model[6]->SetPosition(x, 0.0f, z);
            MGDraw(this->model[6]);
        }
        if (sound_dist < 300.0f) {
            SndGetVolPan(&vol, &pan, best_pos, 50.0f, 300.0f);
            if (mute != 0) {
                vol = 0.0f;
            }
            SndSetSeVolf(61, vol, 0);
            SndSetSePanf(61, pan, 0);
        } else {
            SndSetSeVol(61, 0, 0);
        }
    } else {
        float vol;
        float pan;

        if (sound_dist < 300.0f) {
            SndGetVolPan(&vol, &pan, best_pos, 50.0f, 300.0f);
            if (mute != 0) {
                vol = 0.0f;
            }
            SndSetSeVolf(52, vol, 0);
            SndSetSePanf(52, pan, 0);
        } else {
            SndSetSeVol(52, 0, 0);
        }
    }
}

#if DNG_COMPILE_UNMATCHED
/* 193 of 201 instructions. The small box's case is retail's. The large box's
 * differs only in where the two zero arguments to SetRotation are set up:
 * retail puts them in the load delay slot after the lid angle, ahead of the
 * multiply, and mwcc puts them after the division. Retail schedules its two
 * cases differently from one another though their source is the same shape,
 * and no spelling of the call reproduces that here. */
void CDungeonMap::DrawItemBox(float *pos) {
    float lid[4];
    int i;

    if (this->model[0] == NULL || this->model[1] == NULL) {
        return;
    }
    if (this->model[4] == NULL || this->model[3] == NULL) {
        return;
    }

    for (i = 0; i < 24; i++) {
        if (this->boxes[i].used == 0) {
            continue;
        }
        if (!(DistVector(this->boxes[i].pos, pos) <= 160.0f * this->draw_dist_scale)) {
            continue;
        }

        // The lid sits on the box, tilted by however far it has opened.
        switch (this->boxes[i].kind) {
            case 0:
                this->model[1]->SetPosition(this->boxes[i].pos);
                sceVu0CopyVector(lid, this->model[1]->position);
                lid[1] += 8.0f;
                lid[2] -= 5.0f;
                this->model[0]->SetPosition(lid);
                this->model[0]->SetRotation(
                    (3.1415927f * (float) this->boxes[i].lid_angle) / 180.0f, 0.0f, 0.0f);
                MGDraw(this->model[1]);
                MGDraw(this->model[0]);
                break;
            case 1:
                this->model[4]->SetPosition(this->boxes[i].pos);
                sceVu0CopyVector(lid, this->model[4]->position);
                lid[1] += 3.0f;
                lid[2] -= 3.0f;
                this->model[3]->SetPosition(lid);
                this->model[3]->SetRotation(
                    (3.1415927f * (float) this->boxes[i].lid_angle) / 180.0f, 0.0f, 0.0f);
                MGDraw(this->model[4]);
                MGDraw(this->model[3]);
                break;
        }
    }
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_ASM("asm/nonmatchings/dungeonmap", DrawItemBox__11CDungeonMapFPf);

void CDungeonMap::DrawAtraBoll(float *pos) {
    float draw_pos[4];

    if (this->atra_model == NULL) {
        return;
    }

    for (int i = 0; i < this->atra_num; i++) {
        if (this->atra[i].used != 0) {
            if (DistVector(this->atra[i].pos, pos) <= 160.0f * this->draw_dist_scale) {
                sceVu0CopyVector(draw_pos, this->atra[i].pos);

                // The ball bobs up and down on the spot.
                draw_pos[1] += sinf(this->atra[i].phase);
                this->atra_model->SetPosition(draw_pos);
                MGDraw(this->atra_model);
                if (this->atra[i].phase <= 360.0f) {
                    this->atra[i].phase += 0.1f;
                } else {
                    this->atra[i].phase = 0.0f;
                }
            }
        }
    }
}

int CDungeonMap::CreateCollision(CCPoly *poly, CBoxVu0 box, int num) {
    float pos[4];
    CFrame *frame;

    sceVu0CopyVector(pos, CharaMain.frame->position);
    frame = this->collision_model;
    // Retail returns no value here, which leaves whatever v0 happens to hold.
    if (frame == NULL) {
        return;
    }
    for (int i = 0; i < this->atra_num; i++) {
        if (this->atra[i].used != 0) {
            if (DistVector(this->atra[i].pos, pos) <= 400.0f) {
                frame->SetPosition(this->atra[i].pos);
                num += frame->PickUpNearPoly(&poly[num], box);
            }
        }
    }
    return num;
}

/** Labels each room while a special linked room is selected. */
s32 scanRoomInfoWork[16][16];

/** Gives the 20 x 20 grid that the map builder works on. */
BUILD_MAP_INFO buildMapDat[400];

/** Takes a corridor that joinRoom lays out before it is committed. */
BUILD_MAP_INFO buildMapWork[400];

/** Gives the position and the extent of each room that the builder placed. */
ROOM_INFO roomStack[16];

/** Gives the number of rooms that the builder placed. */
s32 roomStackCnt;

static int buildRoom(int x, int y, int w, int h, int room_no) {
    int ok = 1;
    int i, j;

    // The room needs its own cells and a border of one cell around them, so
    // that two rooms never come out sharing a wall.
    for (j = -1; j < h + 2; j++) {
        for (i = -1; i < w + 2; i++) {
            if (i + x >= 0 && i + x < 20 && j + y >= 0 && j + y < 20) {
                if (buildMapDat[x + (j + y) * 20 + i].kind != MAP_PARTS_NONE) {
                    ok = 0;
                }
            }
        }
    }
    if (!ok) {
        return ok;
    }

    for (j = 0; j < h; j++) {
        for (i = 0; i < w; i++) {
            buildMapDat[x + (y + j) * 20 + i].kind = MAP_PARTS_ROOM_FLOOR;
            buildMapDat[x + (y + j) * 20 + i].link[room_no] = 1;
            buildMapDat[x + (y + j) * 20 + i].unk_48 |= 1;
        }
    }
    return 1;
}

#if DNG_COMPILE_UNMATCHED
/**
 * Converts the builder flags and adjacency data into drawable map parts.
 */
void mapPartsFilter(void) {
    int row;
    int col;
    int room_no;
    int table_no;

    for (row = 0; row < 20; row++) {
        for (col = 0; col < 20; col++) {
            BUILD_MAP_INFO *cell = &buildMapDat[col + row * 20];

            if ((cell->unk_48 & 2) == 2) {
                int mask = 15;
                BUILD_MAP_INFO *north = &buildMapDat[col + (row - 1) * 20];
                BUILD_MAP_INFO *south = &buildMapDat[col + (row + 1) * 20];
                BUILD_MAP_INFO *east = &buildMapDat[col + 1 + row * 20];
                BUILD_MAP_INFO *west = &buildMapDat[col - 1 + row * 20];
                int allow_north = 1;
                int allow_south = (south->unk_48 & 5) != 1;
                int allow_east = (east->unk_48 & 5) != 1;
                int allow_west = 1;

                if ((north->unk_48 & 5) == 1)
                    allow_north = 0;
                if ((west->unk_48 & 5) == 1)
                    allow_west = 0;

                if ((north->unk_48 & 0x180) != 0 && north->unk_04 != 0) {
                    allow_north = 0;
                }
                if ((south->unk_48 & 0x180) != 0 && south->unk_04 != 2) {
                    allow_south = 0;
                }
                if ((east->unk_48 & 0x180) != 0 && east->unk_04 != 1) {
                    allow_east = 0;
                }
                if ((west->unk_48 & 0x180) != 0 && west->unk_04 != 3) {
                    allow_west = 0;
                }
                for (room_no = 0; room_no < 16; room_no++) {
                    if (cell->link[room_no] == 1) {
                        if (north->link[room_no] == 1 && allow_north != 0)
                            mask &= ~1;
                        if (south->link[room_no] == 1 && allow_south != 0)
                            mask &= ~8;
                        if (east->link[room_no] == 1 && allow_east != 0)
                            mask &= ~2;
                        if (west->link[room_no] == 1 && allow_west != 0)
                            mask &= ~4;
                    }
                }
                for (table_no = 0; table_no < 15; table_no++) {
                    if (mask == chainTableRoad[table_no][0]) {
                        cell->kind = chainTableRoad[table_no][1];
                        cell->unk_04 = chainTableRoad[table_no][2];
                    }
                }
            }

            if ((cell->unk_48 & 1) == 1) {
                int mask = 15;
                int north = row != 0 ? buildMapDat[col + (row - 1) * 20].unk_48 & 1 : 0;
                int south = row != 19 ? buildMapDat[col + (row + 1) * 20].unk_48 & 1 : 0;
                int east = col != 19 ? buildMapDat[col + 1 + row * 20].unk_48 & 1 : 0;
                int west = col != 0 ? buildMapDat[col - 1 + row * 20].unk_48 & 1 : 0;
                if (north == 1)
                    mask &= ~1;
                if (south == 1)
                    mask &= ~8;
                if (east == 1)
                    mask &= ~2;
                if (west == 1)
                    mask &= ~4;
                for (table_no = 0; table_no < 8; table_no++) {
                    if (mask == chainTableRoom[table_no][0]) {
                        cell->kind = chainTableRoom[table_no][1];
                        cell->unk_04 = chainTableRoom[table_no][2];
                    }
                }
            }

            if ((cell->unk_48 & 0x404) == 4) {
                int mask = (buildMapDat[col + (row - 1) * 20].unk_48 & 1) == 1;
                if ((buildMapDat[col + (row + 1) * 20].unk_48 & 1) == 1)
                    mask |= 8;
                if ((buildMapDat[col + 1 + row * 20].unk_48 & 1) == 1)
                    mask |= 2;
                if ((buildMapDat[col - 1 + row * 20].unk_48 & 1) == 1)
                    mask |= 4;
                for (table_no = 0; table_no < 4; table_no++) {
                    if (mask == chainTableDoor[table_no][0])
                        cell->kind = chainTableDoor[table_no][1];
                }
            }
            if ((cell->unk_48 & 8) == 8) {
                cell->kind = MAP_PARTS_HEAL_SPRING_NORTH;
                cell->unk_04 = 0;
            }
            if ((cell->unk_48 & 0x40) == 0x40) {
                if ((100.0f * (float) rand()) / 2147483648.0f > 50.0f) {
                    cell->kind = MAP_PARTS_PILLAR_2;
                } else {
                    cell->kind = MAP_PARTS_PILLAR_1;
                }
                cell->unk_04 = 0;
            }

            if ((cell->unk_48 & 0x10) == 0x10) {
                int mask = 0;
                int north = row != 0 ? buildMapDat[col + (row - 1) * 20].unk_48 : 0;
                int south = row != 19 ? buildMapDat[col + (row + 1) * 20].unk_48 : 0;
                int east = col != 19 ? buildMapDat[col + 1 + row * 20].unk_48 : 0;
                int west = col != 0 ? buildMapDat[col - 1 + row * 20].unk_48 : 0;
                if ((north & 0x10) == 0x10)
                    mask = 1;
                if ((south & 0x10) == 0x10)
                    mask |= 8;
                if ((east & 0x10) == 0x10)
                    mask |= 2;
                if ((west & 0x10) == 0x10)
                    mask |= 4;
                if ((north & 1) == 1)
                    mask |= 0x10;
                if ((south & 1) == 1)
                    mask |= 0x80;
                if ((east & 1) == 1)
                    mask |= 0x20;
                if ((west & 1) == 1)
                    mask |= 0x40;
                for (table_no = 0; table_no < 6; table_no++) {
                    if (mask == chainTableDivid[table_no][0])
                        cell->kind = chainTableDivid[table_no][1];
                }
            }
            if ((cell->unk_48 & 0x20) == 0x20) {
                int mask = 0;
                int north = row != 0 ? buildMapDat[col + (row - 1) * 20].unk_48 : 0;
                int south = row != 19 ? buildMapDat[col + (row + 1) * 20].unk_48 : 0;
                int east = col != 19 ? buildMapDat[col + 1 + row * 20].unk_48 : 0;
                int west = col != 0 ? buildMapDat[col - 1 + row * 20].unk_48 : 0;
                if ((north & 0x10) == 0x10)
                    mask = 1;
                if ((south & 0x10) == 0x10)
                    mask |= 8;
                if ((east & 0x10) == 0x10)
                    mask |= 2;
                if ((west & 0x10) == 0x10)
                    mask |= 4;
                for (table_no = 0; table_no < 2; table_no++) {
                    if (mask == chainTableDividDoor[table_no][0])
                        cell->kind = chainTableDividDoor[table_no][1];
                }
            }
            if ((cell->unk_48 & 0x80) == 0x80)
                cell->kind = MAP_PARTS_STAIR_DOWN;
            if ((cell->unk_48 & 0x100) == 0x100)
                cell->kind = MAP_PARTS_STAIR_UP;
            if ((cell->unk_48 & 0x200) == 0x200)
                cell->kind = MAP_PARTS_URA_ENTRANCE_NORTH;
        }
    }
}
#endif
INCLUDE_ASM("asm/nonmatchings/dungeonmap", mapPartsFilter__Fv);

static void copyMapInfo(BUILD_MAP_INFO *dst, BUILD_MAP_INFO *src) {
    for (int i = 0; i < 400; i++) {
        dst[i].kind = src[i].kind;
        for (int j = 0; j < 16; j++) {
            dst[i].link[j] = src[i].link[j];
        }
        dst[i].unk_48 = src[i].unk_48;
    }
}

// Declared here because the assembly below supplies it and the two callers are
// further down the file. Not static: the symbol has to be one the transplanted
// definition can satisfy.
int joinRoom(int a, int b);

#if DNG_COMPILE_UNMATCHED
int joinRoom(int a, int b) {
    int cy;
    int done;
    int tx;
    int ty;
    int dir;
    int n;
    int step;
    int i;
    int cx;
    int steps;
    register int dx;
    register int dy;

    copyMapInfo(buildMapWork, buildMapDat);

    // The corridor leaves the room by whichever side faces the other room.
    dx = roomStack[a].x - roomStack[b].x;
    dy = roomStack[a].y - roomStack[b].y;
    if (dx * dx > dy * dy) {
        if (dx < 0) {
            dir = 2;
        } else {
            dir = 4;
        }
    } else {
        if (dy < 0) {
            dir = 8;
        } else {
            dir = 1;
        }
    }

    switch (dir) {
        case 1:
            cx = roomStack[a].x + (roomStack[a].width >> 1);
            cy = roomStack[a].y - 1;
            buildMapWork[cx + (cy + 1) * 20].unk_48 |= 4;
            buildMapWork[cx + (cy + 1) * 20].link[a] = 1;
            steps = roomStack[a].y - (roomStack[b].y + roomStack[b].height);
            break;
        case 8:
            cx = roomStack[a].x + (roomStack[a].width >> 1);
            cy = roomStack[a].y + roomStack[a].height;
            buildMapWork[cx + (cy - 1) * 20].unk_48 |= 4;
            buildMapWork[cx + (cy - 1) * 20].link[a] = 1;
            steps = roomStack[b].y - cy;
            break;
        case 2:
            cx = roomStack[a].x + roomStack[a].width;
            cy = roomStack[a].y + (roomStack[a].height >> 1);
            buildMapWork[cx + cy * 20 - 1].unk_48 |= 4;
            buildMapWork[cx + cy * 20 - 1].link[a] = 1;
            steps = roomStack[b].x - cx;
            break;
        case 4:
            cx = roomStack[a].x - 1;
            cy = roomStack[a].y + (roomStack[a].height >> 1);
            buildMapWork[cx + cy * 20 + 1].unk_48 |= 4;
            buildMapWork[cx + cy * 20 + 1].link[a] = 1;
            steps = roomStack[a].x - (roomStack[b].x + roomStack[b].width);
            break;
    }

    tx = roomStack[b].x + (roomStack[b].width >> 1);
    ty = roomStack[b].y + (roomStack[b].height >> 1);
    steps = (steps >> 1) + 1;

    // Two rooms that share a wall still need a cell between them.
    if (roomStack[a].y == roomStack[b].y + roomStack[b].height) {
        if (dir == 1 || dir == 8) {
            if (steps < 2) {
                steps = 2;
            }
        }
    }
    if (roomStack[b].y == roomStack[a].y + roomStack[a].height) {
        if (dir == 1 || dir == 8) {
            if (steps < 2) {
                steps = 2;
            }
        }
    }

    done = 0;
    while (done == 0) {
        if (steps != 0) {
            if (buildMapWork[cx + cy * 20].kind == MAP_PARTS_NONE) {
                buildMapWork[cx + cy * 20].kind = a;
                buildMapWork[cx + cy * 20].link[a] = 1;
                buildMapWork[cx + cy * 20].unk_48 |= 2;
                steps--;
                if (steps != 0) {
                    switch (dir) {
                        case 1:
                            cy--;
                            break;
                        case 8:
                            cy++;
                            break;
                        case 2:
                            cx++;
                            break;
                        case 4:
                            cx--;
                            break;
                    }
                }
            } else {
                if ((buildMapWork[cx + cy * 20].unk_48 & 1) == 1) {
                    buildMapWork[cx + cy * 20].unk_48 |= 4;
                    buildMapWork[cx + cy * 20].link[a] = 1;
                } else {
                    buildMapWork[cx + cy * 20].link[a] = 1;
                }
                done = 1;
            }
        } else {

            // The corridor has come far enough out; turn and run at the room.
            switch (dir) {
                case 1:
                case 8:
                    n = tx - cx;
                    if (n < 0) {
                        n = -n;
                        step = -1;
                    } else {
                        step = 1;
                    }
                    for (i = 0; i < n; i++) {
                        cx += step;
                        if (buildMapWork[cx + cy * 20].kind == MAP_PARTS_NONE) {
                            buildMapWork[cx + cy * 20].kind = a;
                            buildMapWork[cx + cy * 20].link[a] = 1;
                            buildMapWork[cx + cy * 20].unk_48 |= 2;
                        } else {
                            if ((buildMapWork[cx + cy * 20].unk_48 & 1) == 1) {
                                buildMapWork[cx + cy * 20].unk_48 |= 4;
                                buildMapWork[cx + cy * 20].link[a] = 1;
                            } else {
                                buildMapWork[cx + cy * 20].link[a] = 1;
                            }
                            done = 1;
                        }
                    }
                    break;
                case 2:
                case 4:
                    n = ty - cy;
                    if (n < 0) {
                        n = -n;
                        step = -1;
                    } else {
                        step = 1;
                    }
                    for (i = 0; i < n; i++) {
                        cy += step;
                        if (buildMapWork[cx + cy * 20].kind == MAP_PARTS_NONE) {
                            buildMapWork[cx + cy * 20].kind = a;
                            buildMapWork[cx + cy * 20].link[a] = 1;
                            buildMapWork[cx + cy * 20].unk_48 |= 2;
                        } else {
                            if ((buildMapWork[cx + cy * 20].unk_48 & 1) == 1) {
                                buildMapWork[cx + cy * 20].unk_48 |= 4;
                                buildMapWork[cx + cy * 20].link[a] = 1;
                            } else {
                                buildMapWork[cx + cy * 20].link[a] = 1;
                            }
                            done = 1;
                        }
                    }
                    break;
            }

            switch (dir) {
                case 1:
                    cy--;
                    break;
                case 8:
                    cy++;
                    break;
                case 2:
                    cx++;
                    break;
                case 4:
                    cx--;
                    break;
            }
            steps = 999;
        }
    }

    copyMapInfo(buildMapDat, buildMapWork);
    return 1;
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_ASM("asm/nonmatchings/dungeonmap", joinRoom__Fii);

static void setRoomObject() {
    int i;
    int x;
    int y;
    int found;
    int found_x;
    int found_y;
    int num;

    num = 0;
    for (i = 0; i < roomStackCnt; i++) {

        // Only two rooms on the floor take an object against their top wall.
        if (num < 2) {
            found = 0;
            for (x = 1; x < roomStack[i].width - 1; x++) {
                if ((buildMapDat[roomStack[i].x + (x + roomStack[i].y * 20)].unk_48 & 0x5) == 1) {
                    found_x = x + roomStack[i].x;
                    found_y = roomStack[i].y;
                    found = 1;
                }
            }
            if ((100.0f * (float) rand()) / 2147483648.0f <= 30.0f) {
                if (found == 1) {
                    buildMapDat[found_x + found_y * 20].unk_48 |= 0x8;
                    num++;
                }
            }
        }

        // Every room can take an object anywhere inside it.
        found = 0;
        for (y = 1; y < roomStack[i].height - 1; y++) {
            for (x = 1; x < roomStack[i].width - 1; x++) {
                if ((buildMapDat[roomStack[i].x + (x + (y + roomStack[i].y) * 20)].unk_48 & 0x4D) == 1) {
                    found_x = x + roomStack[i].x;
                    found_y = y + roomStack[i].y;
                    found = 1;
                }
            }
        }
        if ((100.0f * (float) rand()) / 2147483648.0f <= 30.0f) {
            if (found == 1) {
                buildMapDat[found_x + found_y * 20].unk_48 |= 0x40;
            }
        }
    }
}

static void setRoomDivid() {
    int line_x[64];
    int line_y[64];
    int line_len[64];
    int line_dir[64];
    int i;
    int num;
    int ok;
    int x;
    int y;
    int no;

    for (i = 0; i < roomStackCnt; i++) {
        num = 0;

        // A room can be divided along any row that is free from end to end.
        for (y = 1; y < roomStack[i].height - 1; y++) {
            ok = 1;
            for (x = 0; x < roomStack[i].width; x++) {
                if ((buildMapDat[roomStack[i].x + (x + (y + roomStack[i].y) * 20)].unk_48 & 0x4D) != 1) {
                    ok = 0;
                }
            }
            if (ok == 1) {
                line_x[num] = roomStack[i].x;
                line_y[num] = y + roomStack[i].y;
                line_len[num] = roomStack[i].width;
                line_dir[num] = 0;
                num++;
            }
        }

        // ...or along any such column.
        for (x = 1; x < roomStack[i].width - 1; x++) {
            ok = 1;
            for (y = 0; y < roomStack[i].height; y++) {
                if ((buildMapDat[roomStack[i].x + (x + (y + roomStack[i].y) * 20)].unk_48 & 0x4D) != 1) {
                    ok = 0;
                }
            }
            if (ok == 1) {
                line_x[num] = x + roomStack[i].x;
                line_y[num] = roomStack[i].y;
                line_len[num] = roomStack[i].height;
                line_dir[num] = 1;
                num++;
            }
        }

        if (num == 0) {
            continue;
        }
        if (!((100.0f * (float) rand()) / 2147483648.0f <= 40.0f)) {
            continue;
        }

        // The wall runs the whole length of the line, with one gap in it.
        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
        if (line_dir[no] == 0) {
            for (x = line_x[no]; x < line_x[no] + line_len[no]; x++) {
                buildMapDat[x + line_y[no] * 20].unk_48 |= 0x10;
            }
            buildMapDat[line_x[no] + line_y[no] * 20 +
                        (int) (((float) (line_len[no] - 2) * (float) rand()) / 2147483648.0f) + 1]
                .unk_48 |= 0x20;
        } else {
            for (y = line_y[no]; y < line_y[no] + line_len[no]; y++) {
                buildMapDat[y * 20 + line_x[no]].unk_48 |= 0x10;
            }
            buildMapDat[line_x[no] +
                        (line_y[no] + (int) (((float) (line_len[no] - 2) * (float) rand()) / 2147483648.0f) + 1) * 20]
                .unk_48 |= 0x20;
        }
    }
}

static void setUnderDungeonStart() {
    int safe[120];
    int safe_num;
    int i;
    int x;
    int y;
    int flg;
    int cnt;
    int no;

    safe_num = 0;
    for (i = 0; i < 120; i++) {
        safe[i] = -1;
    }

    // A cell that a corridor passes through, and nothing else, can hold the way down.
    for (y = 0; y < 20; y++) {
        for (x = 0; x < 20; x++) {
            if ((buildMapDat[x + y * 20].unk_48 & 0x15) == 1 && safe_num < 60) {
                safe[safe_num * 2] = x;
                safe[safe_num * 2 + 1] = y;
                safe_num++;
            }
        }
    }

    // Keep picking cells until one comes out with a free cell above it and a
    // corridor on both sides.
    flg = 1;
    cnt = 0;
    while (flg) {
        no = (int) (((float) safe_num * (float) rand()) / 2147483648.0f);
        printf("[s]%d\n", no);
        x = safe[no * 2];
        y = safe[no * 2 + 1];
        if (buildMapDat[x + (y - 1) * 20].unk_48 == 0) {
            if ((buildMapDat[x + y * 20 + 1].unk_48 & 0x5) == 1) {
                if ((buildMapDat[x + y * 20 - 1].unk_48 & 0x5) == 1) {
                    buildMapDat[x + y * 20].unk_48 = 0x201;
                    buildMapDat[x + y * 20].kind = MAP_PARTS_ROOM_GATE_NORTH;
                    buildMapDat[x + y * 20].unk_04 = 0;
                    flg = 0;
                }
            }
        }
        cnt++;
        if (cnt >= 5000) {
            flg = 0;
        }
    }
    if (flg == 0) {
        printf("safeNum = %d, escapeCnt = %d\n", safe_num, cnt);
    }
}

static void setStair() {
    int safe[120];
    int safe_num;
    int i;
    int x;
    int y;
    int no;

    // The stair down stands above a corridor that has a free cell over it.
    safe_num = 0;
    for (i = 0; i < 120; i++) {
        safe[i] = -1;
    }
    for (y = 0; y < 20; y++) {
        for (x = 0; x < 20; x++) {
            if ((buildMapDat[x + y * 20].unk_48 & 0x2) == 2) {
                if (buildMapDat[x + (y - 1) * 20].unk_48 == 0) {
                    safe[safe_num * 2] = x;
                    safe[safe_num * 2 + 1] = y;
                    safe_num++;
                }
            }
        }
    }
    no = (int) (((float) safe_num * (float) rand()) / 2147483648.0f);
    if (safe_num <= 0) {
        printf("ERR: DownStair!!\n");
        y = 1;
        x = 1;
    } else {
        x = safe[no * 2];
        y = safe[no * 2 + 1];
    }
    buildMapDat[x + (y - 1) * 20].unk_48 = 0x80;
    buildMapDat[x + (y - 1) * 20].kind = buildMapDat[x + y * 20].kind;
    buildMapDat[x + (y - 1) * 20].link[buildMapDat[x + y * 20].kind] = 1;
    buildMapDat[x + (y - 1) * 20].unk_04 = 0;

    // The stair up stands below one that has a free cell under it.
    safe_num = 0;
    for (i = 0; i < 120; i++) {
        safe[i] = -1;
    }
    for (y = 0; y < 20; y++) {
        for (x = 0; x < 20; x++) {
            if ((buildMapDat[x + y * 20].unk_48 & 0x2) == 2) {
                if (buildMapDat[x + (y + 1) * 20].unk_48 == 0) {
                    safe[safe_num * 2] = x;
                    safe[safe_num * 2 + 1] = y;
                    safe_num++;
                }
            }
        }
    }
    no = (int) (((float) safe_num * (float) rand()) / 2147483648.0f);
    if (safe_num <= 0) {
        printf("ERR: UpStair!!\n");
        y = 1;
        x = 1;
    } else {
        x = safe[no * 2];
        y = safe[no * 2 + 1];
    }
    buildMapDat[x + (y + 1) * 20].unk_48 = 0x100;
    buildMapDat[x + (y + 1) * 20].kind = buildMapDat[x + y * 20].kind;
    buildMapDat[x + (y + 1) * 20].link[buildMapDat[x + y * 20].kind] = 1;
    buildMapDat[x + (y + 1) * 20].unk_04 = 2;
}

void CDungeonMap::initTrapCircle() {
    for (int i = 0; i < 3; i++) {
        this->trap_circle[i].state = 0;
    }
}

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

void CDungeonMap::SetupTrapCircle(float *pos) {
    for (int i = 0; i < 3; i++) {
        bool is_free = !this->trap_circle[i].state;

        // Populate the first free slot with a trap circle of a random kind.
        if (is_free) {
            sceVu0CopyVector(this->trap_circle[i].pos, pos);
            this->trap_circle[i].state = 1;
            this->trap_circle[i].kind = (int) ((10.0f * (float) rand()) / 2147483648.0f);
            if (this->trap_circle[i].kind >= 10) {
                this->trap_circle[i].kind = 9;
            }
            this->trap_circle[i].timer = 0.0f;
            break;
        }
    }
}

void CDungeonMap::DrawTrapCircle() {
    float pos[4];
    int loaded;
    int i;

    loaded = 0;
    sceVu0CopyVector(pos, CharaMain.pos);
    for (i = 0; i < 3; i++) {
        if (this->trap_circle[i].state != 0) {
            if (DistVector(this->trap_circle[i].pos, pos) <= 160.0f * this->draw_dist_scale) {
                float wide;
                float tall;

                // The texture is only wanted once, however many circles draw.
                if (!loaded) {
                    loaded = 1;
                    TexManager.ReloadTexture(Vif1Packet, 71);
                    Trap_Circle.TextureAnime(71);
                }
                tall = 1.0f + sinf(this->trap_circle[i].timer);
                wide = 1.0f + sinf(this->trap_circle[i].timer) / 2.0f;
                Trap_Circle.SetScale(wide, tall, wide);
                Trap_Circle.SetPosition(this->trap_circle[i].pos);
                Trap_Circle.Draw();
            }
        }
    }
}

MAP_TRAP_CIRCLE *CDungeonMap::DistTrapCircle() {
    float pos[4];

    sceVu0CopyVector(pos, CharaMain.pos);
    for (int i = 0; i < 3; i++) {
        if (this->trap_circle[i].state == 1) {
            if (DistVector(this->trap_circle[i].pos, pos) <= 5.0f) {
                this->trap_circle[i].state = 2;
                return &this->trap_circle[i];
            }
        }
    }
    return NULL;
}

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

int CDungeonMap::CheckTreasureBox(float *pos, float dist) {
    for (int i = 0; i < this->box_num; i++) {
        if (this->boxes[i].used != 0 && DistVector(this->boxes[i].pos, pos) < dist) {
            return 0;
        }
    }
    return 1;
}

int CDungeonMap::CheckAtra(float *pos, float dist) {
    // Demon Shaft does not have atla, only the first five maps do.
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

void CDungeonMap::SetAtraBoll(float *pos, int atra_no) {
    int i;
    int event_no;

    sceVu0CopyVector(this->atra[this->atra_num].pos, pos);
    this->atra[this->atra_num].phase = 0.0f;
    this->atra[this->atra_num].atra_no = atra_no;
    this->atra[this->atra_num].used = 1;

    for (i = 0; i < 48; i++) {
        if (this->events[i].kind == -1) {
            event_no = i;
            goto found;
        }
    }
    printf("ivent buffer over !!\n");
    exit__2(-1);

found:
    this->events[event_no].kind = 3;
    this->events[event_no].unk_0C = 0;
    this->events[event_no].index = this->atra_num;
    sceVu0CopyVector(this->events[event_no].pos, pos);
    this->events[event_no].radius = 13.0f;
    this->atra_num++;
}

/* 192 of 192 instructions, in order; retail puts the second loop's counter in
 * a2 where mwcc reuses a0 after the sceVu0CopyVector call between the loops. */
#if DNG_COMPILE_UNMATCHED
int CDungeonMap::SetTreasureBox(float *pos, int item_no, int kind, int unk) {
    int box_no;
    int event_no;
    int i;
    int j;

    box_no = -1;
    for (i = 0; i < 24; i++) {
        if (this->boxes[i].used == 0) {
            box_no = i;
            break;
        }
    }
    if (box_no == -1) {
        return -1;
    }

    sceVu0CopyVector(this->boxes[box_no].pos, pos);
    this->boxes[box_no].used = 1;
    this->boxes[box_no].lid_angle = 0;
    this->boxes[box_no].kind = kind;
    this->boxes[box_no].item_no = item_no;
    this->boxes[box_no].unk_24 = 1;
    this->boxes[box_no].unk_30 = unk;

    for (j = 0; j < 48; j++) {
        if (this->events[j].kind == -1) {
            event_no = j;
            goto found;
        }
    }
    printf("ivent buffer over !!\n");
    exit__2(-1);

found:
    this->events[event_no].kind = 2;
    this->events[event_no].unk_0C = 0;
    this->events[event_no].unk_00 = (int) pos[0];
    this->events[event_no].unk_04 = (int) pos[2];
    this->events[event_no].index = this->box_num;

    // The event sits in front of the box, and a small box stands nearer to it.
    switch (kind) {
        case 0:
            this->events[event_no].pos[0] = pos[0];
            this->events[event_no].pos[1] = pos[1];
            this->events[event_no].pos[2] = pos[2] + 10.0f;
            this->events[event_no].radius = 8.0f;
            break;
        case 1:
            this->events[event_no].pos[0] = pos[0];
            this->events[event_no].pos[1] = pos[1];
            this->events[event_no].pos[2] = pos[2] + 8.0f;
            this->events[event_no].radius = 8.0f;
            break;
    }
    this->box_num++;
    return event_no;
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_ASM("asm/nonmatchings/dungeonmap", SetTreasureBox__11CDungeonMapFPfiii);

#if DNG_COMPILE_UNMATCHED
/**
 * Places treasure boxes, trap circles, and atla events on one floor.
 */
void CDungeonMap::buildEventData(int floor_no, int enabled, int place_atla) {
    float box_pos[4];
    float object_pos[4];
    int atra_no[6];
    int object_count;
    int target_count;
    int i;
    int valid;
    int event_no;
    int event_coord;
    int j;

    if (enabled != 1) {
        return;
    }

    int special = 0;
    if (place_atla == 0)
        special = 1;
    object_count = 0;
    target_count = (int) ((4.0f * (float) rand()) / 2147483648.0f) + 1;
    while (object_count < target_count + 3) {
        SearchiDoPutArea(this->cells, 0, 0, 20, 20, box_pos);
        valid = 1;
        if (this->CheckTreasureBox(box_pos, 20.0f) == 0)
            valid = 0;
        if (this->CheckAtra(box_pos, 20.0f) == 0)
            valid = 0;
        if (this->CheckTrapCircle(box_pos, 20.0f) != NULL)
            valid = 0;
        if (valid != 0) {
            if ((100.0f * (float) rand()) / 2147483648.0f >= 88.0f && object_count >= 2) {
                int item_no = PresetSmallItemNo_Get(selectMapNo, floor_no, special, 0);
                if (item_no != -1) {
                    int box_value = (int) ((6.0f * (float) rand()) / 2147483648.0f);
                    if (box_value < 0 || box_value >= 6)
                        box_value = 1;
                    this->SetTreasureBox(box_pos, item_no, 0, box_value);
                    object_count++;
                }
            } else {
                int item_no = PresetSmallItemNo_Get(selectMapNo, floor_no, special, 1);
                if (place_atla != 0) {
                    if (object_count == 0)
                        item_no = 0xE9;
                    if (object_count == 1)
                        item_no = 0xEA;
                }
                if (item_no != -1) {
                    this->SetTreasureBox(box_pos, item_no, 1, 0);
                    object_count++;
                }
            }
        }
    }

    this->initTrapCircle();
    for (i = 0; i < 3; i++) {
        if ((int) ((100.0f * (float) rand()) / 2147483648.0f) < 21) {
            SearchiDoPutArea(this->cells, 0, 0, 20, 20, object_pos);
            valid = 1;
            if (this->CheckTreasureBox(object_pos, 20.0f) == 0)
                valid = 0;
            if (this->CheckAtra(object_pos, 20.0f) == 0)
                valid = 0;
            if (this->CheckTrapCircle(object_pos, 20.0f) != NULL)
                valid = 0;
            if (valid != 0)
                this->SetupTrapCircle(object_pos);
        }
    }

    if (place_atla != 0) {
        object_count = 0;
        target_count = BtAtraFloorCyoice(selectMapNo, floor_no, atra_no);
        while (object_count < target_count) {
            SearchiDoPutArea(this->cells, 0, 0, 20, 20, object_pos);
            valid = 1;
            if (this->CheckTreasureBox(object_pos, 20.0f) == 0)
                valid = 0;
            if (this->CheckAtra(object_pos, 20.0f) == 0)
                valid = 0;
            if (this->CheckTrapCircle(object_pos, 20.0f) != NULL)
                valid = 0;
            if (valid != 0) {
                sceVu0CopyVector(this->atra[this->atra_num].pos, object_pos);
                this->atra[this->atra_num].phase = 0.0f;
                this->atra[this->atra_num].atra_no = atra_no[object_count];
                this->atra[this->atra_num].used = 1;
                for (i = 0; i < 48; i++) {
                    if (this->events[i].kind == -1) {
                        event_no = i;
                        goto found_atla_event;
                    }
                }
                printf("ivent buffer over !!\n");
                exit__2(-1);

            found_atla_event:
                this->events[event_no].kind = 3;
                this->events[event_no].unk_0C = 0;
                this->events[event_no].unk_00 = event_coord;
                this->events[event_no].unk_04 = event_coord;
                this->events[event_no].index = this->atra_num;
                sceVu0CopyVector(this->events[event_no].pos, object_pos);
                this->events[event_no].radius = 13.0f;
                this->atra_num++;
                object_count++;
            }
        }
    }
}
#endif
INCLUDE_ASM("asm/nonmatchings/dungeonmap", buildEventData__11CDungeonMapFiii);

void CDungeonMap::SetMimicEvent(float x, float y, float z, int item_no, int kind) {
    float pos[4];
    int box_no;
    int event_no;
    int i;
    int j;

    pos[0] = x;
    pos[1] = y;
    pos[2] = z;

    box_no = -1;
    for (i = 0; i < 24; i++) {
        if (this->boxes[i].used == 0) {
            box_no = i;
            break;
        }
    }
    if (box_no == -1) {
        return;
    }

    for (j = 0; j < 48; j++) {
        if (this->events[j].kind == -1) {
            event_no = j;
            goto found;
        }
    }
    printf("ivent buffer over !!\n");
    exit__2(-1);

found:
    if (event_no == -1) {
        return;
    }

    // The mimic looks like a treasure box, so it takes a box slot as well.
    this->events[event_no].kind = 8;
    this->events[event_no].unk_0C = 0;
    this->events[event_no].index = box_no;

    sceVu0CopyVector(this->boxes[box_no].pos, pos);
    this->boxes[box_no].used = 1;
    this->boxes[box_no].lid_angle = 0;
    this->boxes[box_no].kind = kind;
    this->boxes[box_no].item_no = item_no;
    this->boxes[box_no].unk_24 = 1;

    switch (kind) {
        case 0:
            this->events[event_no].pos[0] = x;
            this->events[event_no].pos[1] = y;
            this->events[event_no].pos[2] = z + 10.0f;
            this->events[event_no].radius = 8.0f;
            break;
        case 1:
            this->events[event_no].pos[0] = x;
            this->events[event_no].pos[1] = y;
            this->events[event_no].pos[2] = z + 8.0f;
            this->events[event_no].radius = 8.0f;
            break;
    }
}

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

int CDungeonMap::GetActiveIvent(CFrameVu1 *frame) {
    float pos[4];

    sceVu0CopyVector(pos, frame->position);

    // The grid cell that the player stands on. Calculated but not used.
    (void) (int) ((float) (int) (80.0f + pos[0]) / 160.0f);
    (void) (int) ((float) (int) (80.0f + pos[2]) / 160.0f);

    for (int i = 0; i < 48; i++) {
        if (this->events[i].kind != -1 && DistVector(this->events[i].pos, pos) <= this->events[i].radius) {
            return i;
        }
    }
    return -1;
}

void CDungeonMap::buildDummyModel() {
    float pos[4];
    float stair_pos[4];
    int i;
    int j;
    int kind;
    int num;
    int cnt;
    int x;
    int z;
    int r;

    num = 0;
    cnt = 0;
    this->dummy_num = 0;
    while (num < 8) {
        x = (int) ((21.0f * (float) rand()) / 2147483648.0f) - 1;
        z = (int) ((21.0f * (float) rand()) / 2147483648.0f) - 1;
        r = (int) ((3.0f * (float) rand()) / 2147483648.0f);
        kind = -1;

        // Each kind covers a different footprint, and only goes down where
        // every cell it would cover is empty.
        switch (r) {
            case 0:
                kind = 0;
                for (j = 0; j < 2; j++) {
                    for (i = 0; i < 2; i++) {
                        if (this->cells[x + (i + (j + z) * 20)].parts_no != MAP_PARTS_NONE) {
                            kind = -1;
                        }
                    }
                }
                if (kind != -1) {
                    pos[0] = 80.0f + 160.0f * x;
                    pos[1] = 0.0f;
                    pos[2] = 80.0f + 160.0f * z;
                    pos[3] = 1.0f;
                }
                break;
            case 1:
                kind = 1;
                for (j = 0; j < 2; j++) {
                    for (i = 0; i < 2; i++) {
                        if (this->cells[x + (i + (j + z) * 20)].parts_no != MAP_PARTS_NONE) {
                            kind = -1;
                        }
                    }
                }
                if (kind != -1) {
                    pos[0] = 160.0f + 160.0f * x;
                    pos[1] = 0.0f;
                    pos[2] = 160.0f + 160.0f * z;
                    pos[3] = 1.0f;
                }
                break;
            case 2:
                kind = 2;
                for (j = 0; j < 3; j++) {
                    for (i = 0; i < 3; i++) {
                        if (this->cells[x + (i + (j + z) * 20)].parts_no != MAP_PARTS_NONE) {
                            kind = -1;
                        }
                    }
                }
                if (kind != -1) {
                    pos[0] = 240.0f + 160.0f * x;
                    pos[1] = 0.0f;
                    pos[2] = 240.0f + 160.0f * z;
                    pos[3] = 1.0f;
                }
                break;
        }

        if (kind != -1) {

            // A bigger model needs more room around it.
            for (x = 0; x < num; x++) {
                if (DistVector(pos, this->dummy_pos[x]) < 40.0f * kind) {
                    kind = -1;
                    break;
                }
            }

            for (x = 0; x < 20; x++) {
                for (z = 0; z < 20; z++) {
                    if (this->cells[z + x * 20].parts_no == MAP_PARTS_URA_ENTRANCE_NORTH) {
                        stair_pos[0] = 80.0f + 160.0f * z;
                        stair_pos[1] = 0.0f;
                        stair_pos[2] = 80.0f + 160.0f * x;
                        stair_pos[3] = 1.0f;
                        if (DistVector(stair_pos, pos) < 160.0f * (kind + 2)) {
                            x = 21;
                            z = x;
                            kind = -1;
                        }
                    }
                }
            }

            if (kind != -1) {
                if (this->dummy_num < 8) {
                    sceVu0CopyVector(this->dummy_pos[this->dummy_num], pos);
                    this->dummy_model[this->dummy_num] = kind;
                    this->dummy_num++;
                }
                num++;
            }
        }

        if (cnt > 10000) {
            break;
        }
        cnt++;
    }
}

#if DNG_COMPILE_UNMATCHED
/**
 * Selects a special door, labels its connected area, and places its key item.
 */
void CDungeonMap::GetRoomLinkInfo(void) {
    int door_pos[32][2];
    int room_list[32];
    float pos[4];
    int result_no = 0;
    int door_count = 0;
    int stair_x = 0;
    int stair_y = 0;
    int x;
    int y;
    int i;
    int room_count;
    int active;
    int direction_mask;
    int door_part;
    int propagation_mask;

    for (i = 0; i < 4; i++)
        this->room_link[i].used = 0;
    for (i = 0; i < 256; i++)
        scanRoomInfoWork[0][i] = -1;

    // Record the stair cell and every candidate room-to-corridor door.
    for (y = 0; y < 16; y++) {
        for (x = 0; x < 16; x++) {
            if (this->cells[x + y * 20].parts_no == MAP_PARTS_STAIR_DOWN) {
                stair_x = x;
                stair_y = y;
                break;
            }
        }
    }
    for (y = 0; y < 16; y++) {
        for (x = 0; x < 16; x++) {
            if ((buildMapDat[x + y * 20].unk_48 & 4) != 0) {
                door_pos[door_count][0] = x;
                door_pos[door_count][1] = y;
                door_count++;
                if (door_count >= 32) {
                    y = 16;
                    break;
                }
            }
        }
    }

    i = (int) (((float) door_count * (float) rand()) / 2147483648.0f);
    x = door_pos[i][0];
    y = door_pos[i][1];
    scanRoomInfoWork[y][x] = 9;
    buildMapDat[x + y * 20].unk_48 |= 0x400;
    this->link_door_x = x;
    this->link_door_y = y;
    this->room_link[0].unk_04 = 0;

    direction_mask = (buildMapDat[x + (y - 1) * 20].unk_48 & 2) == 2;
    if ((buildMapDat[x + (y + 1) * 20].unk_48 & 2) == 2)
        direction_mask = 8;
    if ((buildMapDat[x + 1 + y * 20].unk_48 & 2) == 2)
        direction_mask = 2;
    if ((buildMapDat[x - 1 + y * 20].unk_48 & 2) == 2)
        direction_mask = 4;
    switch (direction_mask) {
        case 4:
            door_part = MAP_PARTS_ROOM_GATE_WEST;
            scanRoomInfoWork[y][x + 1] = 0;
            scanRoomInfoWork[y][x - 1] = 1;
            break;
        case 8:
            door_part = MAP_PARTS_ROOM_GATE_SOUTH;
            scanRoomInfoWork[y - 1][x] = 0;
            scanRoomInfoWork[y + 1][x] = 1;
            break;
        case 2:
            door_part = MAP_PARTS_ROOM_GATE_EAST;
            scanRoomInfoWork[y][x + 1] = 0;
            scanRoomInfoWork[y][x - 1] = 1;
            break;
        case 1:
            door_part = MAP_PARTS_ROOM_GATE_NORTH;
            scanRoomInfoWork[y - 1][x] = 0;
            scanRoomInfoWork[y + 1][x] = 1;
            break;
        default:
            printf("ERROR !!\n");
            return;
    }

    // Spread each side label only through cells that share a room membership.
    active = 1;
    while (active != 0) {
        active = 0;
        for (y = 1; y < 15; y++) {
            for (x = 1; x < 15; x++) {
                int label = scanRoomInfoWork[y][x];
                if (label != -1 && label != 9) {
                    int flags = buildMapDat[x + y * 20].unk_48 & 7;
                    switch (flags) {
                        case 5:
                            propagation_mask = 3;
                            break;
                        case 1:
                            propagation_mask = 5;
                            break;
                        case 2:
                            propagation_mask = 0x86;
                            break;
                    }

                    if (buildMapDat[x + (y - 1) * 20].kind != MAP_PARTS_NONE &&
                        scanRoomInfoWork[y - 1][x] == -1 &&
                        (propagation_mask & buildMapDat[x + (y - 1) * 20].unk_48) != 0) {
                        int shared = 0;
                        for (i = 0; i < 16; i++) {
                            if (buildMapDat[x + y * 20].link[i] == 1 &&
                                buildMapDat[x + (y - 1) * 20].link[i] == 1)
                                shared = 1;
                        }
                        if (shared != 0) {
                            scanRoomInfoWork[y - 1][x] = label;
                            active = 1;
                        }
                    }
                    if (buildMapDat[x + (y + 1) * 20].kind != MAP_PARTS_NONE &&
                        scanRoomInfoWork[y + 1][x] == -1 &&
                        (propagation_mask & buildMapDat[x + (y + 1) * 20].unk_48) != 0) {
                        int shared = 0;
                        for (i = 0; i < 16; i++) {
                            if (buildMapDat[x + y * 20].link[i] == 1 &&
                                buildMapDat[x + (y + 1) * 20].link[i] == 1)
                                shared = 1;
                        }
                        if (shared != 0) {
                            scanRoomInfoWork[y + 1][x] = label;
                            active = 1;
                        }
                    }
                    if (buildMapDat[x - 1 + y * 20].kind != MAP_PARTS_NONE &&
                        scanRoomInfoWork[y][x - 1] == -1 &&
                        (propagation_mask & buildMapDat[x - 1 + y * 20].unk_48) != 0) {
                        int shared = 0;
                        for (i = 0; i < 16; i++) {
                            if (buildMapDat[x + y * 20].link[i] == 1 &&
                                buildMapDat[x - 1 + y * 20].link[i] == 1)
                                shared = 1;
                        }
                        if (shared != 0) {
                            scanRoomInfoWork[y][x - 1] = label;
                            active = 1;
                        }
                    }
                    if (buildMapDat[x + 1 + y * 20].kind != MAP_PARTS_NONE &&
                        scanRoomInfoWork[y][x + 1] == -1 &&
                        (propagation_mask & buildMapDat[x + 1 + y * 20].unk_48) != 0) {
                        int shared = 0;
                        for (i = 0; i < 16; i++) {
                            if (buildMapDat[x + y * 20].link[i] == 1 &&
                                buildMapDat[x + 1 + y * 20].link[i] == 1)
                                shared = 1;
                        }
                        if (shared != 0) {
                            scanRoomInfoWork[y][x + 1] = label;
                            active = 1;
                        }
                    }
                }
            }
        }
    }

    int target_label = scanRoomInfoWork[stair_y + 1][stair_x];
    room_count = 0;
    active = 1;
    for (i = 0; i < this->room_num; i++) {
        if (target_label == scanRoomInfoWork[this->rooms[i].y + 1][this->rooms[i].x + 1]) {
            room_list[room_count++] = i;
        }
    }
    if (room_count == 0) {
        printf("//////--------> SET NOOMAL DOOR PUTERR!![%d] ///////// \n", target_label);
        active = 0;
    }
    while (active != 0) {
        i = (int) (((float) room_count * (float) rand()) / 2147483648.0f);
        if (i < 0 || i > room_count)
            i = 0;
        ROOM_INFO *room = &this->rooms[room_list[i]];
        SearchiDoPutArea(this->cells, room->x, room->y, room->width, room->height, pos);
        int valid = 1;
        if (this->CheckTreasureBox(pos, 20.0f) == 0)
            valid = 0;
        if (this->CheckAtra(pos, 20.0f) == 0)
            valid = 0;
        if (this->CheckTrapCircle(pos, 20.0f) != NULL)
            valid = 0;
        if (valid != 0) {
            if (this->SetTreasureBox(pos, selectMapNo + 216, 1, 0) == -1)
                return;
            this->link_item_x = (pos[0] + 80.0f) / 160.0f;
            this->link_item_y = (pos[2] + 80.0f) / 160.0f;
            this->cells[this->link_door_x + this->link_door_y * 20].parts_no = door_part;
            this->cells[this->link_door_x + this->link_door_y * 20].direction = 0;
            this->room_link[0].used = 1;
            result_no++;
            active = 0;
        }
    }
}
#endif
INCLUDE_ASM("asm/nonmatchings/dungeonmap", GetRoomLinkInfo__11CDungeonMapFv);
INCLUDE_RODATA("asm/nonmatchings/dungeonmap", LIT_2859);
INCLUDE_RODATA("asm/nonmatchings/dungeonmap", LIT_2860);

void CDungeonMap::SetUnderLoad() {
    for (int i = 0; i < 20; i++) {
        this->cells[i * 20 + 19].parts_no = MAP_PARTS_URA_ROAD;
        this->cells[i * 20 + 19].direction = 0;
    }
}

int CDungeonMap::CreatPartsList(int *list, int max, int lo, int hi) {
    int num = 0;
    PARTS_ADJACENT adjacent = {{{0, -1}, {0, 1}, {-1, 0}, {1, 0}}};
    int row;
    int col;
    int ok;
    int i;

    for (row = 1; row < 15; row++) {
        for (col = 1; col < 15; col++) {
            if (hi != -1) {

                // Any cell that holds a part of a kind in the range will do.
                if (this->cells[col + row * 20].parts_no >= lo &&
                    this->cells[col + row * 20].parts_no <= hi) {
                    list[num * 2] = col;
                    list[num * 2 + 1] = row;
                    num++;
                    if (num >= max - 1) {
                        row = 16;
                        break;
                    }
                }
            } else {
                ok = 1;

                // A cell that touches one that is already spoken for will not.
                for (i = 0; i < 4; i++) {
                    int dx = adjacent.offset[i][0];
                    int dy = adjacent.offset[i][1];
                    int no = dx + (col + (row + dy) * 20);

                    if (this->cells[no].parts_no != MAP_PARTS_NONE && (buildMapDat[no].unk_48 & 0x400) == 0x400) {
                        ok = 0;
                    }
                }
                if (this->cells[col + row * 20].parts_no == lo && ok != 0) {
                    list[num * 2] = col;
                    list[num * 2 + 1] = row;
                    num++;
                    if (num >= max - 1) {
                        row = 16;
                        break;
                    }
                }
            }
        }
    }
    return num;
}

/* The integer address accumulation is a rare pointer-arithmetic exception.
 * Retail adds the cell offset to `this` with the offset on the left, and MWCC
 * emits that order only while the address accumulates in an integer: written as
 * `&this->cells[no]` the operands of that one `addu` come out the other way
 * round at every site. `->cells[0]` keeps the member offset symbolic. */
void CDungeonMap::BuildCharaSpecialParts() {
    int list[128];
    int roll;
    int num;
    int floor;
    int no;
    MAP_CELL *cell;
    unsigned int address;

    if (selectMapNo < 6) {
        int zone = UserStatus->res_limit_zone_current;

        // A resurrection zone puts that character's door on the floor and
        // nothing else.
        if (zone >= 0 && zone < 6) {
            if (zone == 1) {
                if ((int) ((100.0f * (float) rand()) / 2147483648.0f) >= 50) {
                    this->SetCharaDoor(0);
                } else {
                    this->SetCharaDoor(0);
                }
                return;
            }
            this->SetCharaDoor(zone);
            return;
        }

        // The first floors of the first dungeon never take a special part.
        roll = (int) ((100.0f * (float) rand()) / 2147483648.0f);
        if (selectMapNo == 0 && UserStatus->cur_floor < 8) {
            roll = 0;
        }
        if (UserStatus->party_size >= 2 && roll > 0x32) {
            num = this->CreatPartsList(list, 0x40, 0, -1);
            if (num > 0) {
                no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_XIAO;
            }
        }

        // Which special part a floor takes depends on the dungeon, how far the
        // party has come and a roll of the dice.
        roll = (int) ((100.0f * (float) rand()) / 2147483648.0f);
        floor = UserStatus->cur_floor;
        switch (selectMapNo) {
            case 1:
                if (UserStatus->party_size >= 3 && roll > 0xA && floor >= 9) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_GORO_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                break;
            case 2:
                if (UserStatus->party_size >= 3 && roll < 0x28) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_GORO_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                if (UserStatus->party_size >= 4 && roll >= 0x28 && floor >= 9) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_RUBY_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                break;
            case 3:
                if (UserStatus->party_size >= 3 && roll < 0x14) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_GORO_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                if (UserStatus->party_size >= 4 && roll < 0x28) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_RUBY_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                if (UserStatus->party_size >= 5 && roll >= 0x28 && floor >= 9) {
                    num = this->CreatPartsList(list, 0x40, 0, -1);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_UNGAGA;
                        return;
                    }
                }
                break;
            case 4:
                if (UserStatus->party_size >= 3 && roll < 0xA) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_GORO_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                if (UserStatus->party_size >= 4 && roll < 0x14) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_RUBY_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                if (UserStatus->party_size >= 5 && roll < 0x1E) {
                    num = this->CreatPartsList(list, 0x40, 0, -1);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_UNGAGA;
                        return;
                    }
                }
                if (UserStatus->party_size >= 6 && roll > 0x28 && floor >= 8) {
                    num = this->CreatPartsList(list, 0x40, 0, -1);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_OSMOND;
                        return;
                    }
                }
                break;
            case 5:
                if (UserStatus->party_size >= 3 && roll < 0xA) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_GORO_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                if (UserStatus->party_size >= 4 && roll < 0x14) {
                    num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                        address += (unsigned int) this;
                        cell = &((CDungeonMap *) address)->cells[0];
                        cell->parts_no += MAP_PARTS_KEY_DOOR_RUBY_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
                        return;
                    }
                }
                if (UserStatus->party_size >= 5 && roll < 0x1E) {
                    num = this->CreatPartsList(list, 0x40, 0, -1);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_UNGAGA;
                        return;
                    }
                }
                if (UserStatus->party_size >= 6 && roll > 0x28) {
                    num = this->CreatPartsList(list, 0x40, 0, -1);
                    if (num > 0) {
                        no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                        this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_OSMOND;
                    }
                }
                break;
        }
    }
}

/* The constants that the functions above name. These stand here rather than
 * at the foot of the file because MWCC's own .rodata for SetCharaDoor's jump
 * table is spliced in at this point, and retail puts the table after all of
 * the constants below and before the two that follow the function. */

/* The integer address accumulation is the same exception as above, and for the
 * same reason. */
int CDungeonMap::SetCharaDoor(int chara_no) {
    int list[128];
    int num;
    int no;
    MAP_CELL *cell;
    unsigned int address;

    num = 0;

    // Each character's door stands on a map part that suits it.
    switch (chara_no) {
        case 0:
            if (UserStatus->party_size >= 2) {
                num = this->CreatPartsList(list, 0x40, 0, -1);
                if (num > 0) {
                    no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                    this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_XIAO;
                }
            }
            break;
        case 1:
            num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
            if (num > 0) {
                no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                address += (unsigned int) this;
                cell = &((CDungeonMap *) address)->cells[0];
                cell->parts_no += MAP_PARTS_KEY_DOOR_XIAO_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
            }
            break;
        case 2:
            num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
            if (num > 0) {
                no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                address += (unsigned int) this;
                cell = &((CDungeonMap *) address)->cells[0];
                cell->parts_no += MAP_PARTS_KEY_DOOR_GORO_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
            }
            break;
        case 3:
            num = this->CreatPartsList(list, 0x40, MAP_PARTS_ROOM_DOOR_NORTH, MAP_PARTS_ROOM_DOOR_WEST);
            if (num > 0) {
                no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                address = (list[no * 2] + list[no * 2 + 1] * 20) * sizeof(MAP_CELL);
                address += (unsigned int) this;
                cell = &((CDungeonMap *) address)->cells[0];
                cell->parts_no += MAP_PARTS_KEY_DOOR_RUBY_NORTH - MAP_PARTS_ROOM_DOOR_NORTH;
            }
            break;
        case 4:
            num = this->CreatPartsList(list, 0x40, 0, -1);
            if (num > 0) {
                no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_UNGAGA;
            }
            break;
        case 5:
            num = this->CreatPartsList(list, 0x40, 0, -1);
            if (num > 0) {
                no = (int) (((float) num * (float) rand()) / 2147483648.0f);
                this->cells[list[no * 2] + list[no * 2 + 1] * 20].parts_no = MAP_PARTS_KEY_OSMOND;
            }
            break;
    }

    return num;
}
#if DNG_COMPILE_UNMATCHED
/* Every instruction is retail's but for one saved register: retail builds a
 * 0xB0 frame over s0-s8 and mwcc builds 0xA0 over s0-s7, so `room_max` lands
 * in s7 rather than s8 and `j`, `near_no` and `near_dist` shift with it.
 * Retail keeps one more local alive across the calls than mwcc does; no
 * ordering of the declarations reproduces which one.
 *
 * Compiling this also moves data. MWCC emits its own jump table for the
 * switch, which has to land where retail keeps LIT_3191 -- so that marker
 * comes out and the LIT_3190 one moves above the function -- and it emits a
 * .data template for `map_no`, which expands this unit's source-owned data
 * range through LIT_3162. Both are undone here. */
void CDungeonMap::buildRandomMap(int room_max, int full) {
    int w;
    int h;
    int j;
    int i;
    int col;
    int row;
    int x;
    int y;
    int done;
    int retry;
    int dx;
    int dy;
    int dist;
    int near_dist;
    int near_no;

    // A floor that is built for the first time picks the seed it is built from.
    if (full != 0) {
        this->map_seed = (int) ((float) rand() / (float) 100000);
        srand(this->map_seed);
    }

    for (i = 0; i < 48; i++) {
        this->events[i].kind = -1;
        this->events[i].unk_2C = 0;
    }
    for (i = 0; i < 24; i++) {
        this->boxes[i].used = 0;
        this->boxes[i].lid_angle = 0;
        this->boxes[i].unk_30 = 0;
    }
    this->box_num = 0;
    for (i = 0; i < 8; i++) {
        this->atra[i].used = 0;
    }
    this->atra_num = 0;
    for (i = 0; i < 4; i++) {
        this->room_link[i].used = 0;
    }

    for (row = 0; row < 20; row++) {
        for (col = 0; col < 20; col++) {
            buildMapDat[col + row * 20].kind = MAP_PARTS_NONE;
            buildMapDat[col + row * 20].unk_04 = 0;
            for (j = 0; j < 16; j++) {
                buildMapDat[col + row * 20].link[j] = 0;
            }
            buildMapDat[col + row * 20].unk_48 = 0;
            this->cells[col + row * 20].direction = 0;
        }
    }

    // Two rooms have to stand before any other can join to one.
    roomStackCnt = 0;
    retry = 0;
    while (roomStackCnt < 2 && retry < 0x40) {
        done = 0;
        retry = 0;
        while (done == 0) {
            w = (int) ((2.0f * (float) rand()) / 2147483648.0f) + 3;
            h = (int) ((2.0f * (float) rand()) / 2147483648.0f) + 3;
            x = (int) (((float) (16 - w) * (float) rand()) / 2147483648.0f);
            y = (int) (((float) (16 - h) * (float) rand()) / 2147483648.0f);
            if (buildRoom(x, y, w, h, roomStackCnt) == 1) {
                roomStack[roomStackCnt].x = x;
                roomStack[roomStackCnt].y = y;
                roomStack[roomStackCnt].width = w;
                roomStack[roomStackCnt].height = h;
                roomStackCnt++;
                done = 1;
            } else {
                retry++;
                if (retry >= 0x40) {
                    done = 1;
                }
            }
        }
    }
    joinRoom(0, 1);

    // Every further room joins to whichever room its middle is nearest to.
    while (roomStackCnt <= room_max - 1 && retry < 0x200) {
        done = 0;
        retry = 0;
        while (done == 0) {
            w = (int) ((2.0f * (float) rand()) / 2147483648.0f) + 3;
            h = (int) ((2.0f * (float) rand()) / 2147483648.0f) + 3;
            x = (int) (((float) (16 - w) * (float) rand()) / 2147483648.0f);
            y = (int) (((float) (16 - h) * (float) rand()) / 2147483648.0f);
            if (buildRoom(x, y, w, h, roomStackCnt) == 1) {
                roomStack[roomStackCnt].x = x;
                roomStack[roomStackCnt].y = y;
                roomStack[roomStackCnt].width = w;
                roomStack[roomStackCnt].height = h;
                roomStackCnt++;
                near_no = -1;
                near_dist = 10000;
                for (j = 0; j < roomStackCnt - 1; j++) {
                    dx = (roomStack[roomStackCnt - 1].x + (roomStack[roomStackCnt - 1].width >> 1)) -
                         (roomStack[j].x + (roomStack[j].width >> 1));
                    dy = (roomStack[roomStackCnt - 1].y + (roomStack[roomStackCnt - 1].height >> 1)) -
                         (roomStack[j].y + (roomStack[j].height >> 1));
                    dist = (int) sqrt((double) (dx * dx + dy * dy));
                    if (dist < near_dist) {
                        near_no = j;
                        near_dist = dist;
                    }
                }
                joinRoom(roomStackCnt - 1, near_no);
                done = 1;
            } else {
                retry++;
                if (retry >= 0x200) {
                    done = 1;
                }
            }
        }
    }

    setRoomObject();
    if (full != 0) {
        setRoomDivid();
    }
    if (full != 0) {
        setUnderDungeonStart();
    } else {
        setUnderDungeonStart();
    }
    if (full != 0) {
        setStair();
    }
    mapPartsFilter();

    this->room_num = roomStackCnt;
    memcpy(this->rooms, roomStack, 0x100);

    for (row = 0; row < 20; row++) {
        for (col = 0; col < 20; col++) {
            this->cells[col + row * 20].parts_no = buildMapDat[col + row * 20].kind;
            this->cells[col + row * 20].direction = buildMapDat[col + row * 20].unk_04;
        }
    }

    if (selectMapNo == 4) {
        this->buildDummyModel();
    }
    if ((int) ((100.0f * (float) rand()) / 2147483648.0f) < 0x33 && full != 0) {
        this->GetRoomLinkInfo();
    }
    if (full != 0) {
        this->BuildCharaSpecialParts();
    }

    // Which set of map parts the floor draws with.
    switch (selectMapNo) {
        case 0:
            this->unk_0464 = 0xC3;
            break;
        case 2:
            this->unk_0464 = 0xC9;
            break;
        case 3:
            this->unk_0464 = 0xCA;
            break;
        case 4:
            this->unk_0464 = 0xCB;
            break;
        case 5:
            this->unk_0464 = 0xCC;
            break;
        case 6:
            this->unk_0464 = 0xCE;
            break;
    }
    if (selectMapNo == 1) {
        int no = (int) ((3.0f * (float) rand()) / 2147483648.0f);
        int map_no[3] = {0xC4, 0xC6, 0xCD};

        if (no < 0 || no >= 3) {
            no = 0;
        }
        this->unk_0464 = map_no[no];
    }

    this->SetUnderLoad();
    printf("map build success!!\n");
}
#endif /* DNG_COMPILE_UNMATCHED */
INCLUDE_RODATA("asm/nonmatchings/dungeonmap", LIT_3190);
INCLUDE_ASM("asm/nonmatchings/dungeonmap", buildRandomMap__11CDungeonMapFii);

void CDungeonMap::initSubmap(CDataAlloc2_1_ *alloc) {
    int i;
    int j;

    for (i = 0; i < 6; i++) {
        this->bg_model[i] = NULL;
    }
    for (i = 0; i < 3; i++) {
        this->dummy_frame[i] = NULL;
    }
    this->model[0] = NULL;
    this->model[1] = NULL;
    this->model[2] = NULL;
    this->model[3] = NULL;
    this->model[4] = NULL;
    this->model[5] = NULL;
    this->model[6] = NULL;
    for (i = 0; i < 24; i++) {
        this->boxes[i].used = 0;
    }
    for (i = 0; i < this->atra_num; i++) {
        this->atra[i].used = 0;
    }
    this->unk_03B4 = 0;
    this->unk_03B8 = 0;
    this->dummy_num = 0;
    this->water.SetSize(32, 32, alloc);
    for (i = 0; i < 72; i++) {
        this->parts[i].initalize();
    }
    for (i = 0; i < 400; i++) {
        this->cells[i].parts_no = MAP_PARTS_NONE;
        this->cells[i].unk_08 = -1.0f;
        this->mask[i] = 0;
        this->cells[i].unk_0C = 0;
    }
    for (i = 0; i < 16; i++) {
        this->room_seen[i] = 0;
    }
    for (i = 0; i < 4; i++) {
        this->npc[i].chara.Initialize();
        this->npc[i].used = 0;
        this->npc[i].draw_num = 0;
    }
    for (j = 0; j < 48; j++) {
        this->events[j].kind = -1;
        this->events[j].unk_2C = 0;
    }
    for (j = 0; j < 24; j++) {
        this->boxes[j].used = 0;
        this->boxes[j].lid_angle = 0;
        this->boxes[j].unk_30 = 0;
    }
    this->box_num = 0;
    for (j = 0; j < 8; j++) {
        this->atra[j].used = 0;
    }
    this->atra_num = 0;
    for (j = 0; j < 4; j++) {
        this->room_link[j].used = 0;
    }
}

void CDungeonMap::initalize() {
    int i;
    int j;

    for (i = 0; i < 6; i++) {
        this->bg_model[i] = NULL;
    }
    for (i = 0; i < 3; i++) {
        this->dummy_frame[i] = NULL;
    }
    this->model[0] = NULL;
    this->model[1] = NULL;
    this->model[2] = NULL;
    this->model[3] = NULL;
    this->model[4] = NULL;
    this->model[5] = NULL;
    this->model[6] = NULL;
    for (i = 0; i < 24; i++) {
        this->boxes[i].used = 0;
    }
    for (i = 0; i < this->atra_num; i++) {
        this->atra[i].used = 0;
    }
    this->unk_03B4 = 0;
    this->unk_03B8 = 0;
    this->dummy_num = 0;
    for (i = 0; i < 72; i++) {
        this->parts[i].initalize();
    }
    for (i = 0; i < 400; i++) {
        this->cells[i].parts_no = MAP_PARTS_NONE;
        this->cells[i].unk_08 = -1.0f;
        this->mask[i] = 0;
        this->cells[i].unk_0C = 0;
    }
    for (i = 0; i < 16; i++) {
        this->room_seen[i] = 0;
    }
    for (i = 0; i < 4; i++) {
        this->npc[i].chara.Initialize();
        this->npc[i].used = 0;
        this->npc[i].draw_num = 0;
    }
    for (j = 0; j < 48; j++) {
        this->events[j].kind = -1;
        this->events[j].unk_2C = 0;
    }
    for (j = 0; j < 24; j++) {
        this->boxes[j].used = 0;
        this->boxes[j].lid_angle = 0;
        this->boxes[j].unk_30 = 0;
    }
    this->box_num = 0;
    for (j = 0; j < 8; j++) {
        this->atra[j].used = 0;
    }
    this->atra_num = 0;
    for (j = 0; j < 4; j++) {
        this->room_link[j].used = 0;
    }
    this->draw_dist_scale = 4.0f;
}
