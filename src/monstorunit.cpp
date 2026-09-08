#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 798

#include "monstorunit.hpp"
#include "dungeonmap.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "snd.hpp"
#include "dataalloc.hpp"
#include "dun/gameloop.hpp"
#include "userstatus.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "texture.hpp"
#include "rect.hpp"
#include <cstdlib>
#include <cstdio>
#include "dngstatusdata.hpp"
#include "randomitem.hpp"
#include "dataread.hpp"
#include "nowload.hpp"
#include "runscript_opcodes.hpp"
#include "shot_effect_pack.hpp"
#include <cstring>
#include <cmath>
#include "gameutil.hpp"
#include "dungeonparts.hpp"
#include "collisiondata.hpp"
#include "btactstatus.hpp"
#include "dngmessageman.hpp"
#include "savedata.hpp"
#include "menu_inventory.hpp"
#include "itemdata.hpp"
#include "hitmark.hpp"
#include "hitvalue.hpp"
#include "stealitem.hpp"
#include "weaponelement.hpp"

BEE_STATE BeeTbl[800];
CTexAnimeData MonsterTexAnim[320];

#include "monstorunit_floor_data.inc"
#include "monstorunit_model_data.inc"
#include "monstorunit_effect_data.inc"

int CMonstorUnit::GetMonstorNum() {
    int count = 0;
    for (int i = 0; i < 16; i++) {
        if (monster[i].state != -1) {
            count++;
        }
    }
    return count;
}
void CMonstorUnit::DrawMapSymbol(float *offset) {
    sceVu0FVECTOR position;
    CRect_i_ screen;
    CRect_i_ clip;
    int i;
    CTexture *texture = TexManager.GetTexture("itempack", -1);
    for (i = 0; i < 16; i++) {
        if (monster[i].state != -1 && monster[i].unk_0D4 != 0) {
            int draw;
            if (BtEquipMasuisyou != 0 || DebugStatus[3] != 0) {
                draw = 1;
            } else if (monster[i].state == 2) {
                draw = 1;
            } else {
                draw = 0;
            }
            if (draw == 1) {
                CCharacter *character = &chara[i][0];
                character->GetPosition(position);
                int x = (int)(0.1f * position[0]);
                int y = (int)(0.1f * position[2]);
                clip.x = 72;
                clip.y = 96;
                clip.width = 8;
                clip.height = 8;
                screen.x = (int)(0.1f * position[0]) + 384;
                screen.y = (int)(0.1f * position[2]) + 68;
                screen.width = 8;
                screen.height = 8;
                set2DSprite(Vif1Packet, texture, screen, clip);
            }
        }
    }
}


void CMonstorUnit::SetKey() {
    int key;
    int key_index = 0;
    int keys[3] = {0xC4, 0xC6, 0xCD};
    if (unk_044 != 0) return;
    if (selectMapNo == 2 && UserStatus->cur_floor == 16) return;
    int remaining = 1;
    if (selectMapNo == 1) remaining = 3;
    if (unk_04C <= 1) return;
    int attempts = 0;
    for (;;) {
        int index = (int)((float)unk_04C * (float)rand() / 2147483648.0f);
        if (index < 0 || index >= unk_04C) index = 0;
        if (monster[index].state == -1) continue;
        switch (selectMapNo) {
        case 0: key = 0xC3; break;
        case 1: key = keys[key_index]; break;
        case 2: key = 0xC9; break;
        case 3: key = 0xCA; break;
        case 4: key = 0xCB; break;
        case 5: key = 0xCC; break;
        case 6: key = 0xCE; break;
        default: key = -1; break;
        }
        if (monster[index].unk_0A0 == -1 && monster[index].unk_0DA != 0) {
            printf("check ---> %d\n", ((CDngStatusData *)UserStatus)->SearchItemIndexNo(key));
            if (((CDngStatusData *)UserStatus)->SearchItemIndexNo(key) < 0 && RandomItem->CheckItemNo(key) == 0) {
                monster[index].unk_0A0 = key;
            }
            key_index++;
            if (--remaining <= 0) return;
        }
        attempts++;
        if (attempts >= 9999) monster[index].unk_0DA = 1;
    }
}

int CMonstorUnit::CheckEventFlag2() {
    for (int i = 0; i < 16; i++) {
        if (monster[i].state == 2 && monster[i].event_flag2_pending != 0) {
            monster[i].event_flag2_pending = 0;
            return monster[i].event_flag2;
        }
    }
    return -1;
}
void CMonstorUnit::ArrangementPos(CDungeonMap *map, int count, int model_no, int unused) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR existing;
    int used[10];
    for (int i = 0; i < 10; i++) {
        used[i] = 0;
    }
    int placed;
    int attempts;
    int n;
    for (n = 0; n < count; n++) {
        placed = 0;
        attempts = 0;
        while (placed == 0) {
            attempts++;
            if (attempts >= 65000) {
                placed = 1;
            }
            SearchiDoPutArea(map->cells, 0, 0, 20, 20, position);
            if (map->CheckTreasureBox(position, 20.0f) != 0 && map->CheckAtra(position, 20.0f) != 0 && map->CheckTrapCircle(position, 20.0f) == 0) {
                int close = 0;
                for (int i = 0; i < 16; i++) {
                    if (monster[i].state != -1) {
                        CCharacter *character = &chara[i][0];
                        character->GetPosition(existing);
                        if (DistVector(existing, position) <= 25.0f) {
                            close = 1;
                        }
                    }
                }
                if (close == 0) {
                    int nearby = 0;
                    for (int i = 0; i < 16; i++) {
                        if (monster[i].state != -1) {
                            CCharacter *character = &chara[i][0];
                            character->GetPosition(existing);
                            if (DistVector(existing, position) <= 480.0f) {
                                nearby++;
                            }
                        }
                    }
                    if (nearby < 3) {
                        int selected = model_no;
                        if (model_no == -1) {
                            selected = (int)((float)unk_048 * (float)rand() / 2147483648.0f);
                            if (model[selected].kind != 0 && model[selected].kind != 3) {
                                if (used[selected] != 0) {
                                    continue;
                                }
                                used[selected] = 1;
                            }
                        }
                        SetupViewMonstor(selected, position, -1);
                        placed = 1;
                    }
                }
            }
        }
    }
    SetKey();
}
void CMonstorUnit::AllBin2() {
    for (int i = 0; i < 16; i++) {
        monster[i].unk_010 = 300;
    }
}
void CMonstorUnit::PalletSet() {
    sceVu0FVECTOR ambient;
    MGGetAmbient(ambient);
    if (monster[unk_090].palette_cycles > 0) {
        ambient[0] = monster[unk_090].palette_color[0];
        ambient[1] = monster[unk_090].palette_color[1];
        ambient[2] = monster[unk_090].palette_color[2];
    }
    ambient[3] = monster[unk_090].palette_alpha;
    if (monster[unk_090].palette_override_pending != 0) {
        ambient[0] = monster[unk_090].palette_override[0];
        ambient[1] = monster[unk_090].palette_override[1];
        ambient[2] = monster[unk_090].palette_override[2];
        monster[unk_090].palette_override_pending = 0;
    }
    MGSetAmbient(ambient);
}
void CMonstorUnit::PalletStep() {
    sceVu0FVECTOR ambient;
    if (monster[unk_090].palette_delay == 0) {
        monster[unk_090].palette_alpha -= monster[unk_090].palette_alpha_step;
        if (monster[unk_090].palette_alpha <= 0.0f) {
            monster[unk_090].palette_alpha = 0.0f;
        }
        if (!(monster[unk_090].palette_alpha < 128.0f)) {
            monster[unk_090].palette_alpha = 128.0f;
        }
    } else {
        monster[unk_090].palette_delay--;
    }
    monster[unk_090].unk_0D0 = monster[unk_090].unk_0D2;
    if (monster[unk_090].palette_alpha <= 32.0f) {
        monster[unk_090].unk_0D0 = 0;
    }
    MGGetAmbient(ambient);
    sceVu0CopyVector(monster[unk_090].palette_color, ambient);
    if (monster[unk_090].palette_cycles > 0) {
        monster[unk_090].palette_blend += monster[unk_090].palette_step;
        if (!(monster[unk_090].palette_step <= 0.0f)) {
            if (!(monster[unk_090].palette_blend < 1.0f)) {
                monster[unk_090].palette_blend = 1.0f;
                monster[unk_090].palette_step *= -1.0f;
            }
        } else if (monster[unk_090].palette_blend <= 0.0f) {
            monster[unk_090].palette_blend = 0.0f;
            monster[unk_090].palette_step *= -1.0f;
            monster[unk_090].palette_cycles--;
        }
        for (int i = 0; i < 3; i++) {
            monster[unk_090].palette_color[i] += monster[unk_090].palette_blend * (monster[unk_090].palette_target[i] - ambient[i]);
        }
    }
}
void CMonstorUnit::SoundCheck() {
    sceVu0FVECTOR position;
    CCharacter *character = &chara[unk_090][0];
    character->GetPosition(position);
    float frame = chara[unk_090][0].motion_type.state.time;
    float near_distance = 50.0f;
    float far_distance = 500.0f;
    if (monster[unk_090].kind == 2) {
        near_distance = 350.0f;
        far_distance = 1000.0f;
    }
    if (sound[unk_090].sequence_start <= frame && !(sound[unk_090].sequence_end <= frame)) {
        float volume, pan;
        SndSeSeqPlayStop(sound[unk_090].sequence_id, sound[unk_090].sequence_step, unk_090 * 2);
        SndGetVolPan(&volume, &pan, position, near_distance, far_distance);
        SndSetSeVolf(sound[unk_090].sequence_id, volume, unk_090 * 2);
        SndSetSePanf(sound[unk_090].sequence_id, pan, unk_090 * 2);
    }
    for (int i = 0; i < 16; i++) {
        if (sound[unk_090].cooldown[i] > 0) {
            sound[unk_090].cooldown[i]--;
        } else if (sound[unk_090].id[i] != -1 && sound[unk_090].start[i] <= frame && !(sound[unk_090].end[i] <= frame)) {
            float volume, pan;
            SndSePlay(sound[unk_090].id[i], -1, 0);
            SndGetVolPan(&volume, &pan, position, near_distance, far_distance);
            SndSetSeVolf(sound[unk_090].id[i], volume, 0);
            SndSetSePanf(sound[unk_090].id[i], pan, 0);
            sound[unk_090].cooldown[i] = 10;
        }
    }
}
INCLUDE_ASM("asm/nonmatchings/monstorunit", DrawMonstor__12CMonstorUnitFv);

void CMonstorUnit::DrawMonstorCursor() {
    sceVu0FVECTOR position;
    for (int i = 0; i < 16; i++) {
        if (monster[i].unk_0E8 != 0) {
            CCharacter *character = &chara[i][0];
            character->GetPosition(position);
            position[1] += chara[i][0].unk_0B4;
            cursorFrame->SetPosition(position);
            MGDraw(cursorFrame);
        }
    }
}
void set3DCellModel(float *world, char *name, float size, int x, int y, int width, int height) {
    int top_left[4];
    int top_right[4];
    int bottom_left[4];
    int bottom_right[4];
    CRect_i_ clip;
    CTexture *texture = TexManager.GetTexture(name, -1);
    world[3] = 1;
    if (MGRotTransPers3DSprite(top_left, bottom_right, world, size, size / 2.0f, 0) == 1) {
        top_right[0] = bottom_right[0];
        top_right[1] = top_left[1];
        top_right[2] = top_left[2];
        bottom_left[0] = top_left[0];
        bottom_left[1] = bottom_right[1];
        bottom_left[2] = bottom_right[2];
        clip.x = x;
        clip.y = y;
        clip.width = width;
        clip.height = height;
        set3DSprite(Vif1Packet, texture, clip, top_left, top_right, bottom_left, bottom_right, 128);
    }
}
void InitBee(CFrame *frame, int count) {
    int frame_num = frame->GetFrameNum();
    printf("bee num = %d\n", frame_num);
    int i;
    for (i = 0; i < frame_num * count; i++) {
        BeeTbl[i].phase = 6.0f * (float)rand() / 2147483648.0f;
        BeeTbl[i].row = (int)(2.0f * (float)rand() / 2147483648.0f);
    }
    for (i = 0; i < frame_num; i++) {
        ((CFrameVu1 *)frame)[i].attr.draw_on = 0;
    }
    printf("INIT BEE END!!\n");
}
void DrawBee(CFrame *frame, int count) {
    sceVu0FMATRIX world;
    sceVu0FMATRIX parent_world;
    sceVu0FVECTOR position;
    sceGsZbuf zbuf;
    sceGsAlpha alpha;
    int frame_num = frame->GetFrameNum();
    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);
    alpha = mgAlpha;
    alpha.bits.a = 2;
    alpha.bits.b = 0;
    alpha.bits.c = 0;
    alpha.bits.d = 1;
    setAlphaFlag(Vif1Packet, &alpha);
    int bee = 0;
    for (int i = 2; i < frame_num; i++) {
        ((CFrameVu1 *)frame)[i].GetLWMatrix(world);
        ((CFrameVu1 *)frame)[i].parent->GetLWMatrix(parent_world);
        for (int j = 0; j < count; j++) {
            sceVu0InterVectorXYZ(position, parent_world[3], world[3], (1.0f / (float)count) * (float)j);
            position[3] = 1;
            int x = (int)BeeTbl[bee].phase;
            int y = BeeTbl[bee].row;
            set3DCellModel(position, "c15a03", 7.0f, x << 6, y << 6, (x << 6) + 64, (y << 6) + 64);
            BeeTbl[bee].phase += 0.2f;
            if (BeeTbl[bee].phase > 5.0f) {
                BeeTbl[bee].phase = 0;
            }
            bee++;
        }
    }
    MGSetGsALPHA(NULL);
    MGSetGsZBUF(NULL);
}

void CMonstorUnit::DrawShadowMonstor() {
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;
    sceVu0FVECTOR light = {0.0f, 1.0f, 0.0f, 0.0f};
    for (int i = 0; i < 16; i++) {
        if (monster[i].state == 2 && monster[i].unk_0D0 != 0 && monster[i].unk_0D4 != 0) {
            if (chara[i][0].shadow_frame != NULL) {
                CCharacter *character = &chara[i][0];
                character->ShadowStep();
                character->GetPosition(position);
                character->GetRotation(rotation);
                chara[i][0].shadow_frame->SetPosition(position);
                chara[i][0].shadow_frame->SetRotation(0.0f, rotation[1], 0.0f);
                position[1] -= monster[i].unk_0CC;
                MGDrawShadowFast(chara[i][0].shadow_frame, position, light);
            }
        }
    }
}

void CMonstorUnit::CheckViewLevel() {
    sceVu0FVECTOR player_position;
    sceVu0FVECTOR monster_position;
    int sorted[16];
    int active[16];
    sceVu0CopyVector(player_position, CharaMain.pos);
    int active_count = 0;
    for (int i = 0; i < 16; i++) {
        active[i] = -1;
    }
    for (int i = 0; i < 16; i++) {
        sorted[i] = -1;
        monster[i].unk_0E8 = 0;
        if (monster[i].state == -1 || monster[i].unk_0D4 == 0) {
            continue;
        }
        CCharacter *character = &chara[i][0];
        character->GetPosition(monster_position);
        monster_position[3] = 1;
        player_position[3] = 1;
        float distance = DistVector(player_position, monster_position);
        monster[i].player_distance = distance;
        if (monster[i].state == 1 && distance < monster[i].unk_0A4) {
            monster[i].state = 2;
        }
        if (monster[i].state == 2 && distance > 10.0f + monster[i].unk_0A4) {
            monster[i].state = 1;
        }
        if (monster[i].hp <= 0) {
            monster[i].state = 2;
        }
        if (monster[i].state == 2) {
            active[active_count] = i;
            active_count++;
        }
    }
    int sorted_count = 0;
    if (active_count > 4) {
        int floor = UserStatus->cur_floor;
        int max_floor = maxFloorTbl__3[selectMapNo];
        if (floor + 1 == max_floor) return;
        for (int i = 0; i < active_count; i++) {
            int closest = -1;
            float distance = 3200.0f;
            for (int j = 0; j < active_count; j++) {
                if (active[j] != -1 && !(distance <= monster[active[j]].player_distance)) {
                    distance = monster[active[j]].player_distance;
                    closest = j;
                }
            }
            if (closest != -1) {
                sorted[sorted_count] = active[closest];
                active[closest] = -1;
                sorted_count++;
            }
        }
        for (int i = 4; i < active_count; i++) {
            if (sorted[i] != -1 && monster[sorted[i]].state == 2 && monster[sorted[i]].hp > 0 && monster[sorted[i]].kind != 2) {
                monster[sorted[i]].state = 1;
                monster[sorted[i]].unk_0E8 = 1;
            }
        }
    }
}

int CMonstorUnit::SelectAttachi() {
    int item;
    int chance = (int)(100.0f * (float)rand() / 2147483648.0f);
    if (chance > 70) {
        return -1;
    }
    chance = (int)(100.0f * (float)rand() / 2147483648.0f);
    int changed = 0;
    int best = 0;
    for (int i = 1; i < 5; i++) {
        int greater = monster[unk_090].attachment_weight[best] < monster[unk_090].attachment_weight[i];
        if (greater) {
            best = i;
            changed = 1;
        }
    }
    if (chance < 30 && changed != 0) {
        item = best + 0x51;
        if (item < 0x51 || item >= 0x56) {
            item = -1;
        }
    } else {
        item = monster[unk_090].attachment_kind + 0x6f;
        if (item < 0x6f || item >= 0x79) {
            item = -1;
        }
    }
    return item;
}
INCLUDE_ASM("asm/nonmatchings/monstorunit", CheckDmg__12CMonstorUnitFv);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @1518);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @1521);
void CMonstorUnit::MoveCheck(float *position, float *movement, int flat) {
    sceVu0FVECTOR start;
    sceVu0FVECTOR center;
    sceVu0FVECTOR ground;
    sceVu0FVECTOR end;
    sceVu0FVECTOR toward;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR top;
    sceVu0FVECTOR end_ground;
    sceVu0CopyVector(start, position);
    end[0] = start[0] + movement[0];
    end[1] = start[1] + movement[1];
    end[2] = start[2] + movement[2];
    movement[3] = 1.0f;
    sceVu0Normalize(direction, movement);
    direction[1] = 1.0f;
    sceVu0CopyVector(top, end);
    sceVu0CopyVector(end_ground, end);
    CUserStatus *status = UserStatus;
    float height[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};
    top[1] += height[status->cur_chara];
    end_ground[1] = 1.0f;
    float upper = top[1];
    float lower = end[1];
    for (int i = 0; i < 16; i++) {
        if (monster[i].state == 2 && monster[i].unk_0D4 != 0) {
            if (effect3[i].count == 0) {
                CCharacter *character = &chara[i][0];
                character->GetPosition(center);
                character->GetPosition(ground);
                ground[1] = 1.0f;
                if (flat != 0) {
                    center[1] = 1.0f;
                    lower = 1.0f;
                }
                float distance = DistVector(ground, end_ground);
                float radius = monster[i].unk_044;
                if (distance < 6.0f + radius) {
                    int clear = 1;
                    float ceiling = center[1] + 2.0f * radius;
                    if (!(ceiling < upper) && center[1] < upper) clear = 0;
                    if (!(ceiling < lower) && center[1] < lower) clear = 0;
                    if (ceiling <= upper && !(center[1] <= lower)) clear = 0;
                    if (!(ceiling < upper) && center[1] < lower) clear = 0;
                    if (clear == 0) {
                        toward[0] = center[0] - start[0];
                        toward[2] = center[2] - start[2];
                        toward[1] = 0.0f;
                        toward[3] = 1.0f;
                        sceVu0Normalize(toward, toward);
                        if (!(sceVu0InnerProduct(direction, toward) <= 0.33333334f)) {
                            movement[0] = 0.0f;
                            movement[1] -= 2.0f;
                            movement[2] = 0.0f;
                            return;
                        }
                    }
                }
            } else {
                for (int j = 0; j < effect3[i].count; j++) {
                    sceVu0CopyVector(center, effect3[i].position[j]);
                    sceVu0CopyVector(ground, effect3[i].position[j]);
                    ground[1] = 1.0f;
                    if (DistVector(ground, end_ground) <= 6.0f + effect3[i].radius[j]) {
                        if (flat != 0) {
                            center[1] = 1.0f;
                            lower = 1.0f;
                        }
                        int clear = 1;
                        float bottom = center[1] - effect3[i].radius[j];
                        float ceiling = center[1] + effect3[i].radius[j];
                        if (!(bottom <= upper) && ceiling < upper) clear = 0;
                        if (!(bottom <= lower) && ceiling < lower) clear = 0;
                        if (bottom < upper && !(ceiling <= lower)) clear = 0;
                        if (!(bottom <= upper) && ceiling < lower) clear = 0;
                        if (clear == 0) {
                            toward[0] = center[0] - start[0];
                            toward[2] = center[2] - start[2];
                            toward[1] = 0.0f;
                            toward[3] = 1.0f;
                            sceVu0Normalize(toward, toward);
                            if (!(sceVu0InnerProduct(direction, toward) <= 0.33333334f)) {
                                movement[0] = 0.0f;
                                movement[1] -= 2.0f;
                                movement[2] = 0.0f;
                                return;
                            }
                        }
                    }
                }
            }
        }
    }
}

void CMonstorUnit::MoveCheck2() {
    sceVu0FVECTOR player_position;
    sceVu0FVECTOR next_position;
    sceVu0FVECTOR position;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR displacement;
    sceVu0FVECTOR towards_player;
    sceVu0FVECTOR flat_player;
    sceVu0FVECTOR flat_next;
    sceVu0CopyVector(player_position, CharaMain.pos);
    CCharacter *character = &chara[unk_090][0];
    character->GetPosition(position);
    next_position[0] = position[0] + monster[unk_090].movement[0] * monster[unk_090].movement_speed;
    next_position[1] = position[1] + monster[unk_090].movement[1] * monster[unk_090].movement_speed;
    next_position[2] = position[2] + monster[unk_090].movement[2] * monster[unk_090].movement_speed;
    displacement[0] = next_position[0] - position[0];
    displacement[1] = 0;
    displacement[2] = next_position[2] - position[2];
    displacement[3] = 1;
    sceVu0Normalize(displacement, displacement);
    sceVu0Normalize(direction, monster[unk_090].movement);
    sceVu0CopyVector(flat_player, player_position);
    sceVu0CopyVector(flat_next, next_position);
    flat_player[1] = 1;
    flat_next[1] = 1;
    if (DistVector(flat_player, flat_next) <= 6.0f + monster[unk_090].unk_044 && next_position[1] < 18.0f + player_position[1]) {
        towards_player[0] = player_position[0] - position[0];
        towards_player[2] = player_position[2] - position[2];
        towards_player[1] = 0;
        towards_player[3] = 1;
        sceVu0Normalize(towards_player, towards_player);
        if (!(sceVu0InnerProduct(displacement, towards_player) <= 0.0f)) {
            monster[unk_090].movement[0] = 0;
            monster[unk_090].movement[1] = 0;
            monster[unk_090].movement[2] = 0;
            monster[unk_090].movement_speed = 0;
            return;
        }
    }
}

void CMonstorUnit::MoveChecMonster() {
    sceVu0FVECTOR other_position;
    sceVu0FVECTOR next_position;
    sceVu0FVECTOR position;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR displacement;
    sceVu0FVECTOR towards_other;
    sceVu0FVECTOR flat_other;
    sceVu0FVECTOR flat_next;
    CCharacter *character = &chara[unk_090][0];
    character->GetPosition(position);
    next_position[0] = position[0] + monster[unk_090].movement[0] * monster[unk_090].movement_speed;
    next_position[1] = position[1] + monster[unk_090].movement[1] * monster[unk_090].movement_speed;
    next_position[2] = position[2] + monster[unk_090].movement[2] * monster[unk_090].movement_speed;
    displacement[0] = next_position[0] - position[0];
    displacement[1] = 0;
    displacement[2] = next_position[2] - position[2];
    displacement[3] = 1;
    sceVu0Normalize(displacement, displacement);
    sceVu0Normalize(direction, monster[unk_090].movement);
    sceVu0CopyVector(flat_next, next_position);
    flat_next[1] = 1;
    for (int i = 0; i < 16; i++) {
        if (monster[i].state == 2 && i != unk_090) {
            CCharacter *other = &chara[i][0];
            other->GetPosition(other_position);
            sceVu0CopyVector(flat_other, other_position);
            flat_other[1] = 1;
            float distance = DistVector(flat_other, flat_next);
            float own_radius = monster[unk_090].collision_radius;
            float radius = monster[i].collision_radius;
            if (distance <= radius + own_radius && next_position[1] < other_position[1] + 2.0f * radius) {
                towards_other[0] = other_position[0] - position[0];
                towards_other[2] = other_position[2] - position[2];
                towards_other[1] = 0;
                towards_other[3] = 1;
                sceVu0Normalize(towards_other, towards_other);
                if (!(sceVu0InnerProduct(displacement, towards_other) <= 0.0f)) {
                    monster[unk_090].movement[0] = 0;
                    monster[unk_090].movement[1] = 0;
                    monster[unk_090].movement[2] = 0;
                    monster[unk_090].movement_speed = 0;
                    return;
                }
            }
        }
    }
}
void CMonstorUnit::Step(int pause) {
    sceVu0FVECTOR position, destination, hit;
    CBoxVu0 box;
    sceVu0FVECTOR other_position, width_start, width_hit;
    sceVu0FVECTOR turn_position, rotation, direction;
    sceVu0FVECTOR drop_position, key_position, attachment_position, money_position;
    CheckViewLevel();
    if (pause != 0) {
        unk_098 = 1;
        return;
    }
    if (unk_098 != 0) {
        for (int i = 0; i < 16; i++) {
            if (monster[i].state == 2) {
                monster[i].requested_motion_flags &= ~4;
                if (monster[i].requested_motion_flags == 2) {
                    chara[i][0].SetMotion(monster[i].requested_motion, 2);
                    if (!(monster[i].requested_motion_speed < 0.0f))
                        chara[i][0].SetMotionSpeed(monster[i].requested_motion_speed);
                    for (int j = 0; j < monster[i].unk_0B4; j++) {
                        chara[i][j + 1].SetMotion(monster[i].requested_motion, 2);
                        if (!(monster[i].requested_motion_speed < 0.0f))
                            chara[i][j + 1].SetMotionSpeed(monster[i].requested_motion_speed);
                    }
                } else {
                    chara[i][0].SetMotion(monster[i].requested_motion, 0);
                    if (!(monster[i].requested_motion_speed < 0.0f))
                        chara[i][0].SetMotionSpeed(monster[i].requested_motion_speed);
                    for (int j = 0; j < monster[i].unk_0B4; j++) {
                        chara[i][j + 1].SetMotion(monster[i].requested_motion, 0);
                        if (!(monster[i].requested_motion_speed < 0.0f))
                            chara[i][j + 1].SetMotionSpeed(monster[i].requested_motion_speed);
                    }
                }
            }
        }
        unk_098 = 0;
    }
    BtActStatus.monstor_target = -1;
    for (int i = 0; i < 16; i++) {
        if (monster[i].state == 2) {
            unk_090 = i;
            if (monster[unk_090].unk_0F4 != 0) {
                monster[unk_090].requested_motion_flags &= ~4;
                if (monster[unk_090].requested_motion_flags == 2) {
                    chara[unk_090][0].SetMotion(monster[unk_090].requested_motion, 2);
                    if (!(monster[unk_090].requested_motion_speed < 0.0f))
                        chara[unk_090][0].SetMotionSpeed(monster[unk_090].requested_motion_speed);
                    for (int j = 0; j < monster[unk_090].unk_0B4; j++) {
                        chara[unk_090][j + 1].SetMotion(monster[unk_090].requested_motion, 2);
                        if (!(monster[unk_090].requested_motion_speed < 0.0f))
                            chara[unk_090][j + 1].SetMotionSpeed(monster[unk_090].requested_motion_speed);
                    }
                } else {
                    chara[unk_090][0].SetMotion(monster[unk_090].requested_motion, 0);
                    for (int j = 0; j < monster[unk_090].unk_0B4; j++) {
                        chara[unk_090][j + 1].SetMotion(monster[unk_090].requested_motion, 0);
                        if (!(monster[unk_090].requested_motion_speed < 0.0f))
                            chara[unk_090][j + 1].SetMotionSpeed(monster[unk_090].requested_motion_speed);
                    }
                }
                monster[unk_090].unk_0F4 = 0;
            }
            if (monster[unk_090].unk_0D4 != 0) {
                if (unk_044 != 0) monster[unk_090].unk_010 = 180;
                WorkBuffer__2->Reset();
                monster[unk_090].collision_poly = (CCPoly *)WorkBuffer__2->Alloc(2000);
                chara[unk_090][0].GetPosition(position);
                // These locals preserve MWCC's retail float-argument scheduling.
                float collision_radius = 30.0f;
                float collision_height = 5.0f;
                monster[unk_090].unk_050 = setCollisionData(NowDngMap, monster[unk_090].collision_poly, position, 30, 5);
                int original_count = monster[unk_090].unk_050;
                box.max[0] = 30.0f + position[0];
                box.max[1] = 80.0f + position[1];
                box.max[2] = 30.0f + position[2];
                box.min[0] = position[0] - 30.0f;
                box.min[1] = position[1] - 80.0f;
                box.min[2] = position[2] - 30.0f;
                for (int j = 0; j < 16; j++) {
                    if (j != unk_090 && monster[j].state == 2) {
                        chara[j][0].GetPosition(other_position);
                        collision->SetPosition(other_position);
                        float scale = 2.0f * (0.1f * monster[j].collision_radius);
                        collision->SetScale(scale, scale, scale);
                        monster[unk_090].unk_050 += collision->PickUpNearPoly(monster[unk_090].collision_poly + monster[unk_090].unk_050, box);
                    }
                }
                if (monster[unk_090].unk_050 >= 400) printf("err %d\n", monster[unk_090].unk_050);
                switch (CheckDmg()) {
                case 0: break;
                case 1: interpreter[unk_090].run(110); script_state[unk_090] = 1; break;
                case 2: interpreter[unk_090].run(120); script_state[unk_090] = 1; break;
                }
                if (monster[unk_090].unk_008 > 0) {
                    PalletStep();
                    if (monster[unk_090].unk_098 > 0) monster[unk_090].unk_098--;
                } else {
                    if (script_state[unk_090] == 0) {
                        if (monster[unk_090].unk_0D4 == 1) {
                            interpreter[unk_090].run(50);
                            monster[unk_090].unk_0D4 = -1;
                        } else interpreter[unk_090].run(100);
                        script_state[unk_090] = 1;
                    } else {
                        interpreter[unk_090].resume();
                        if (interpreter[unk_090].IsEnd() != 0) script_state[unk_090] = 0;
                    }
                    chara[unk_090][0].GetPosition(position);
                    if (!(monster[unk_090].unk_180[0] <= 0.0f)) {
                        sceVu0CopyVector(monster[unk_090].movement, monster[unk_090].unk_170);
                        monster[unk_090].movement_speed = monster[unk_090].unk_180[0];
                        monster[unk_090].unk_180[0] -= monster[unk_090].unk_180[1];
                        if (monster[unk_090].unk_180[0] <= 0.0f) {
                            monster[unk_090].unk_180[0] = 0.0f;
                            monster[unk_090].movement_speed = 0.0f;
                        }
                    }
                    if (monster[unk_090].unk_0A8 <= 0) MoveCheck2();
                    if (monster[unk_090].unk_0A8 <= 0) MoveChecMonster();
                    monster[unk_090].unk_050 = original_count;
                    if (monster[unk_090].movement_speed != 0.0f || (monster[unk_090].unk_088 != 0 && monster[unk_090].movement_speed == 0.0f)) {
                        destination[0] = position[0] + 10.0f * monster[unk_090].movement[0];
                        destination[1] = position[1] + 10.0f * monster[unk_090].movement[1];
                        destination[2] = position[2] + 10.0f * monster[unk_090].movement[2];
                        position[1] += 5.0f; destination[1] += 5.0f;
                        if (CheckHit(monster[unk_090].collision_poly, monster[unk_090].unk_050, position, destination, hit, 0, 0) >= 0 && monster[unk_090].unk_0A8 <= 0) {
                            position[1] -= 5.0f;
                            monster[unk_090].movement_speed = 0.0f;
                            chara[unk_090][0].SetPosition(position);
                        } else {
                            position[1] -= 5.0f;
                            if (monster[unk_090].unk_088 != 0 && !(monster[unk_090].ground_distance <= 0.0001f)) {
                                destination[0] = position[0] + monster[unk_090].movement[0] * monster[unk_090].movement_speed;
                                destination[1] = position[1] + (monster[unk_090].movement[1] * monster[unk_090].movement_speed - 0.2f);
                                destination[2] = position[2] + monster[unk_090].movement[2] * monster[unk_090].movement_speed;
                            } else {
                                destination[0] = position[0] + monster[unk_090].movement[0] * monster[unk_090].movement_speed;
                                destination[1] = position[1] + monster[unk_090].movement[1] * monster[unk_090].movement_speed;
                                destination[2] = position[2] + monster[unk_090].movement[2] * monster[unk_090].movement_speed;
                            }
                            chara[unk_090][0].SetPosition(destination);
                            if (monster[unk_090].unk_088 != 0 && !(monster[unk_090].ground_distance <= 0.0001f)) {
                                monster[unk_090].movement_speed = DistVector(destination, position);
                                destination[0] -= position[0]; destination[1] -= position[1]; destination[2] -= position[2];
                                sceVu0Normalize(monster[unk_090].movement, destination);
                            }
                        }
                        chara[unk_090][0].GetPosition(width_start); width_start[1] += 5.0f;
                        if (CheckWidth(monster[unk_090].collision_poly, monster[unk_090].unk_050, width_start, monster[unk_090].unk_044, width_hit, 0) != 0) {
                            width_hit[1] -= 5.0f; chara[unk_090][0].SetPosition(width_hit);
                        }
                    }
                    monster[unk_090].ground_distance = 0.0f;
                    chara[unk_090][0].GetPosition(position); position[1] += 10.0f;
                    float ground_depth = -130.0f;
                    if (CheckHitVertical(monster[unk_090].collision_poly, monster[unk_090].unk_050, position, ground_depth, hit, 0) >= 0) {
                        position[1] -= 10.0f;
                        if (position[1] < hit[1]) {
                            position[1] = hit[1];
                            if (monster[unk_090].unk_088 != 0) {
                                monster[unk_090].movement[1] *= -1.0f;
                                if (!(monster[unk_090].movement[1] <= 0.0f)) {
                                    monster[unk_090].movement_speed *= 0.5f * (2.0f - monster[unk_090].movement[1]);
                                    if (monster[unk_090].movement_speed < 0.2f) monster[unk_090].movement_speed = 0.0f;
                                }
                            }
                        }
                        monster[unk_090].ground_distance = position[1] - hit[1];
                        monster[unk_090].ground_y = hit[1];
                        if (monster[unk_090].unk_088 != 0) {
                            chara[unk_090][0].SetPosition(position);
                            if (monster[unk_090].unk_0D6 == 0) chara[unk_090][0].SetPosition(hit);
                        }
                    }
                    if (monster[unk_090].unk_084 != 0.0f) {
                        chara[unk_090][0].GetPosition(turn_position); chara[unk_090][0].GetRotation(rotation);
                        sceVu0SubVector(direction, monster[unk_090].unk_070, turn_position);
                        float angle = atan2f(direction[0], direction[2]);
                        rotation[1] = AngleInterpolate(rotation[1], angle, monster[unk_090].unk_084, 0);
                        chara[unk_090][0].SetRotation(rotation);
                        if (AngleCmp(rotation[1], angle, 0.052359879f) == 0) monster[unk_090].unk_084 = 0.0f;
                    }
                    if (monster[unk_090].unk_098 > 0) monster[unk_090].unk_098--;
                    if (monster[unk_090].unk_0A8 > 0) monster[unk_090].unk_0A8--;
                    if (event[unk_090].timer == 2) {
                        NowShotEffect->Set(monster[unk_090].unk_0AC, event[unk_090].position, event[unk_090].local_position);
                        NowShotEffect->SetUserID2(unk_090);
                        if (event[unk_090].damage_override != -1) NowShotEffect->SetDmg(event[unk_090].damage_override);
                        event[unk_090].timer = 0;
                    }
                    if (event2[unk_090].timer == 2) {
                        NowShotEffect->Set(monster[unk_090].unk_0AE, event2[unk_090].position, event2[unk_090].local_position);
                        NowShotEffect->SetUserID2(unk_090);
                        if (event2[unk_090].damage_override != -1) NowShotEffect->SetDmg(event2[unk_090].damage_override);
                        event2[unk_090].timer = 0;
                    }
                    PalletStep(); SoundCheck();
                    if (monster[unk_090].state == -1) {
                        CDngStatusData *status = (CDngStatusData *)UserStatus;
                        int current_chara = UserStatus->cur_chara;
                        int no_exp;
                        WEAPON_HAVE *weapon = &status->chara_weapons[current_chara][status->equipped_weapon_slot[current_chara]];
                        no_exp = 0;
                        if (status->CheckDefaultWeapon(current_chara) == 0) no_exp = 1;
                        if (weapon->item_no == 0x10C && SaveData->GetGameFlag(0x30) == 0) no_exp = 1;
                        if (monster[unk_090].last_attacker == current_chara && no_exp == 0) {
                            int max_exp = GetWeaponMaxExp(weapon);
                            int exp = monster[unk_090].unk_0B0;
                            if (unk_044 != 0) exp *= 2;
                            if (effect[unk_090].hit_attributes & 0x2000) exp *= 1.2f;
                            if (UserStatus->res_limit_zone_current == 10) {
                                weapon->unk_14 -= exp;
                                if (weapon->unk_14 <= 0) weapon->unk_14 = 0;
                            } else if (weapon->unk_14 < max_exp) {
                                int updated = weapon->unk_14 + exp;
                                if (updated >= max_exp) {
                                    weapon->unk_14 = max_exp;
                                    DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
                                    DngMessMan.unk_14 = weapon->unk_02;
                                    DngMessMan.unk_24 = 150; DngMessMan.unk_04 = 480; DngMessMan.unk_1C = 0;
                                    weapon->unk_14 = max_exp;
                                } else weapon->unk_14 = updated;
                            }
                        }
                        if (effect[unk_090].hit_attributes & 0x10) UserStatus->AddDrink(current_chara, 10, 255.0f);
                        if (monster[unk_090].unk_03C > 0) {
                            chara[unk_090][0].GetPosition(drop_position);
                            drop_position[0] += 1.5f; drop_position[1] -= monster[unk_090].ground_distance; drop_position[0] += 1.5f;
                            RandomItem->Set(drop_position, 1, monster[unk_090].unk_03C, -1);
                            monster[unk_090].unk_038 = 0;
                        }
                        if (monster[unk_090].kind != 2 && monster[unk_090].unk_0DA != 0) {
                            printf("************ item = %d ************ \n", monster[unk_090].unk_0A0);
                            if (monster[unk_090].unk_0A0 == -1 && monster[unk_090].unk_0E0 != -1 && (100.0f * (float)rand() / 2147483648.0f) < 10.0f)
                                monster[unk_090].unk_0A0 = monster[unk_090].unk_0E0;
                            if (monster[unk_090].unk_0A0 != -1) {
                                if (SetGateKeyStack(monster[unk_090].unk_0A0) != 0) {
                                    chara[unk_090][0].GetPosition(key_position); key_position[1] -= monster[unk_090].ground_distance;
                                    RandomItem->Set(key_position, 1, -1, monster[unk_090].unk_0A0);
                                }
                            } else {
                                int attachment = SelectAttachi();
                                if (monster[unk_090].last_attacker == -1 && attachment != -1) {
                                    chara[unk_090][0].GetPosition(attachment_position); attachment_position[1] -= monster[unk_090].ground_distance;
                                    RandomItem->Set(attachment_position, 1, -1, attachment);
                                    monster[unk_090].unk_0A0 = attachment;
                                } else monster[unk_090].unk_0A0 = -1;
                            }
                            if (monster[unk_090].unk_0A0 == -1) {
                                if ((int)(100.0f * (float)rand() / 2147483648.0f) < monster[unk_090].unk_038) {
                                    int index = unk_090;
                                    int base = monster[index].unk_034;
                                    int money = base + (int)(((float)base * (float)rand() / 2.0f) / 2147483648.0f);
                                    int attributes = effect[index].hit_attributes;
                                    if (attributes & 2) money *= 2;
                                    if ((attributes & 4) && money >= 2) money *= 0.5;
                                    chara[index][0].GetPosition(money_position); money_position[1] -= monster[unk_090].ground_distance;
                                    RandomItem->Set(money_position, 1, money, -1);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}



void CMonstorUnit::CleanViewMonstor(int mode) {
    for (int i = 0; i < 16; i++) {
        monster[i].state = -1;
        monster[i].unk_008 = 0;
        monster[i].unk_00C = 0;
        monster[i].unk_010 = 0;
        monster[i].unk_014 = 0;
        monster[i].unk_050 = 0;
        monster[i].movement[2] = 0;
        monster[i].movement[1] = 0;
        monster[i].movement[0] = 0;
        monster[i].unk_070[2] = 0;
        monster[i].unk_070[1] = 0;
        monster[i].unk_070[0] = 0;
        monster[i].movement_speed = 0;
        monster[i].unk_084 = 0;
        monster[i].unk_088 = 1;
        monster[i].unk_044 = 13.0f;
        monster[i].collision_radius = 13.0f;
        monster[i].unk_094 = 0;
        monster[i].unk_098 = 0;
        monster[i].unk_0A0 = -1;
        monster[i].unk_0A4 = 300.0f;
        monster[i].unk_0A8 = 0;
        monster[i].unk_0AC = -1;
        monster[i].unk_0AE = -1;
        monster[i].unk_0C0 = -1;
        monster[i].unk_0CC = 1.0f;
        monster[i].unk_0FC = 0;
        monster[i].unk_110 = 1.0f;
        monster[i].unk_114 = 1.0f;
        monster[i].lock_range = 120.0f;
        monster[i].unk_11C = 1;
        monster[i].unk_0D4 = -1;
        monster[i].unk_0D8 = -1;
        monster[i].unk_03C = 0;
        monster[i].event_flag2 = -1;
        monster[i].event_flag2_pending = 0;
        monster[i].palette_alpha = 128.0f;
        monster[i].palette_alpha_step = 0;
        monster[i].palette_delay = 0;
        monster[i].palette_cycles = 0;
        monster[i].unk_0D6 = 0;
        monster[i].palette_override_pending = 0;
        monster[i].unk_0F4 = 0;
        monster[i].unk_0E8 = 0;
        monster[i].unk_0B4 = 0;
        monster[i].unk_0D0 = 1;
        monster[i].unk_0D2 = 1;
        monster[i].unk_170[0] = 0;
        monster[i].unk_170[1] = 0;
        monster[i].unk_170[2] = 0;
        monster[i].unk_170[3] = 1;
        monster[i].unk_180[0] = 0;
        monster[i].unk_180[1] = 0;
        monster[i].unk_180[2] = 1;
        script_state[i] = 0;
        if (script[i] != 0) {
            script[i]->used = 0;
        }
        for (int j = 0; j < 16; j++) {
            effect[i].timer[j] = 0;
            effect[i].motion_start[j] = 0;
        }
        for (int j = 0; j < 16; j++) {
            effect2[i].active[j] = 0;
        }
        for (int j = 0; j < 12; j++) {
            effect3[i].frame[j] = 0;
            effect3[i].timer[j] = 0;
            effect3[i].count = 0;
        }
        for (int j = 0; j < 16; j++) {
            sound[i].id[j] = -1;
            sound[i].cooldown[j] = 0;
        }
        sound[i].sequence_id = -1;
        event[i].frame = 0;
        event[i].timer = 0;
        event2[i].frame = 0;
        event2[i].timer = 0;
    }
    unk_044 = mode;
    unk_04C = 0;
}
int CMonstorUnit::SetupBaseModel(int slot, int model_no, int effect_mode, CDataAlloc2<1> *alloc) {
    MONSTOR_MODEL *description = &MonstorTable[model_no];
    char filename[64];
    CFrameAttr attr;
    int file_size;
    attr.unk_0C = 1;
    sprintf(filename, "dun/monstor/%s.chr", description->model_name[0]);
    LoadFile(filename, read_buffer, NULL);
    wait_now_loading_vsync();
    CCharacter *character = &base_chara[slot][0];
    character->InitializeTexAnime(MonsterTexAnim, 320);
    character->LoadPackData3(read_buffer, "info.cfg", alloc, 42, alloc, 1, 0);
    base_chara[slot][0].frame->SetAttr(attr, 1, 64);
    SetFrameAttr(base_chara[slot][0].frame, 1);
    for (int j = 0; j < 3; j++) {
        if (description->model_name[j + 1][0] != 0) {
            sprintf(filename, "dun/monstor/%s.chr", description->model_name[j + 1]);
            LoadFile(filename, read_buffer, NULL);
            wait_now_loading_vsync();
            base_chara[slot][j + 1].LoadPackData(read_buffer, "info.cfg", alloc, alloc);
            base_chara[slot][j + 1].frame->SetAttr(attr, 1, 64);
            SetFrameAttr(base_chara[slot][j + 1].frame, 1);
        }
    }
    sprintf(filename, "dun/monstor/%s.stb", description->script_name);
    LoadFile(filename, read_buffer, &file_size);
    wait_now_loading_vsync();
    script_data[slot] = (char *)(alloc->base + alloc->used * 16);
    alloc->Alloc((((file_size >> 6) + 1) << 6) >> 4);
    memcpy(script_data[slot], read_buffer, file_size);
    memcpy(&model[slot], description, sizeof(MONSTOR_MODEL));
    int count = 2;
    if (description->kind == 2) {
        count = 6;
    }
    if (description->shot_effect[0] != -1) {
        int effect = NowShotEffect->Entry(BtEntryEffectTbl[description->shot_effect[0]], read_buffer, effect_mode, alloc, count);
        if (effect == -1) {
            printf("******* ShotEntry Error !!***********\n");
        } else {
            model[slot].shot_effect[0] = effect;
        }
    }
    if (description->shot_effect[1] != -1) {
        int effect = NowShotEffect->Entry(BtEntryEffectTbl[description->shot_effect[1]], read_buffer, effect_mode, alloc, count);
        if (effect == -1) {
            printf("******* ShotEntry Error !!***********\n");
        } else {
            model[slot].shot_effect[1] = effect;
        }
    }
    unk_048++;
    return 1;
}

int CMonstorUnit::SetupViewMonstor(int model_no, float *position, int event_flag) {
    unk_090 = -1;
    for (int i = 0; i < 16; i++) {
        if (monster[i].state == -1) {
            unk_090 = i;
            break;
        }
    }
    if (unk_090 == -1) {
        return 0;
    }
    script[unk_090]->Reset();
    BtSetEventScript(&interpreter[unk_090], script_data[model_no], script[unk_090]);
    chara[unk_090][0] = base_chara[model_no][0];
    chara[unk_090][0].motion[0] = &chara[unk_090][0].motion_type;
    chara[unk_090][0].SetPosition(position);
    float zero = 0.0f;
    chara[unk_090][0].SetRotation(zero, zero, zero);
    if (UserStatus->cur_georama == 3 && UserStatus->cur_floor == 17 && unk_090 == 1) {
        InitBee(chara[1][0].frame, 15);
    }
    monster[unk_090].unk_0B4 = 0;
    for (int j = 0; j < 3; j++) {
        if (model[model_no].model_name[j + 1][0] != 0) {
            chara[unk_090][j + 1] = base_chara[model_no][j + 1];
            chara[unk_090][j + 1].motion[0] = &chara[unk_090][j + 1].motion_type;
            chara[unk_090][j + 1].frame->SetParent(chara[unk_090][0].frame);
            monster[unk_090].unk_0B4++;
        }
    }
    monster[unk_090].state = 1;
    monster[unk_090].base_model = model_no;
    monster[unk_090].max_hp = model[model_no].max_hp;
    monster[unk_090].hp = model[model_no].max_hp;
    monster[unk_090].attachment_kind = model[model_no].attachment_kind;
    for (int j = 0; j < 5; j++) {
        monster[unk_090].attachment_weight[j] = model[model_no].attachment_weight[j];
    }
    monster[unk_090].unk_090 = model[model_no].unk_064;
    monster[unk_090].unk_092 = model[model_no].unk_066;
    monster[unk_090].unk_034 = model[model_no].unk_070;
    monster[unk_090].unk_038 = model[model_no].unk_074;
    monster[unk_090].kind = model[model_no].kind;
    monster[unk_090].name_no = model[model_no].name_no;
    monster[unk_090].unk_044 = model[model_no].collision_radius;
    monster[unk_090].collision_radius = model[model_no].collision_radius;
    monster[unk_090].unk_0AC = model[model_no].shot_effect[0];
    monster[unk_090].unk_0AE = model[model_no].shot_effect[1];
    monster[unk_090].unk_0B0 = model[model_no].unk_06C;
    monster[unk_090].unk_0D8 = model[model_no].unk_080;
    monster[unk_090].unk_0DA = model[model_no].unk_082;
    monster[unk_090].unk_0DC = model[model_no].unk_084;
    monster[unk_090].unk_0DE = model[model_no].unk_086;
    monster[unk_090].unk_0E0 = model[model_no].unk_088;
    monster[unk_090].event_flag2 = event_flag;
    monster[unk_090].unk_180[2] = model[model_no].unk_098;
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 6; j++) {
            effect[unk_090].parameter[i][j] = model[model_no].effect_parameter[j];
        }
    }
    if (model[model_no].attachment_kind == 8) {
        monster[unk_090].unk_0D4 = 0;
        switch (model[model_no].kind) {
        case 3:
            NowDngMap->SetMimicEvent(position[0], position[1], position[2], unk_090, 1);
            break;
        case 4:
            NowDngMap->SetMimicEvent(position[0], position[1], position[2], unk_090, 0);
            break;
        }
    } else {
        monster[unk_090].unk_0D4 = -1;
    }
    for (int i = 0; i < 3; i++) {
        event_flags[unk_090][i] = 0;
    }
    if (interpreter[unk_090].check_program(1) != 0) {
        interpreter[unk_090].run(1);
    }
    script_state[unk_090] = 0;
    unk_04C++;
    return 1;
}

