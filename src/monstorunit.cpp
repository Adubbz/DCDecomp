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

BEE_STATE BeeTbl[800];
CTexAnimeData MonsterTexAnim[320];

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
                CMonstorChara *character = &chara[i];
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
                        CMonstorChara *character = &chara[i];
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
                            CMonstorChara *character = &chara[i];
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
    CMonstorChara *character = &chara[unk_090];
    character->GetPosition(position);
    float frame = chara[unk_090].motion_type.state.time;
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
            CMonstorChara *character = &chara[i];
            character->GetPosition(position);
            position[1] += chara[i].unk_0B4;
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
            if (chara[i].shadow_frame != NULL) {
                CMonstorChara *character = &chara[i];
                character->ShadowStep();
                character->GetPosition(position);
                character->GetRotation(rotation);
                chara[i].shadow_frame->SetPosition(position);
                chara[i].shadow_frame->SetRotation(0.0f, rotation[1], 0.0f);
                position[1] -= monster[i].unk_0CC;
                MGDrawShadowFast(chara[i].shadow_frame, position, light);
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
        CMonstorChara *character = &chara[i];
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
                CMonstorChara *character = &chara[i];
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
    CMonstorChara *character = &chara[unk_090];
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
    CMonstorChara *character = &chara[unk_090];
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
            CMonstorChara *other = &chara[i];
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
INCLUDE_ASM("asm/nonmatchings/monstorunit", Step__12CMonstorUnitFi);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2233__2);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2237__2);
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
            effect[i].active[j] = 0;
        }
        for (int j = 0; j < 16; j++) {
            effect2[i].active[j] = 0;
        }
        for (int j = 0; j < 12; j++) {
            effect3[i].active[j] = 0;
            effect3[i].timer[j] = 0;
            effect3[i].count = 0;
        }
        for (int j = 0; j < 16; j++) {
            sound[i].id[j] = -1;
            sound[i].cooldown[j] = 0;
        }
        sound[i].sequence_id = -1;
        event[i].active = 0;
        event[i].timer = 0;
        event2[i].active = 0;
        event2[i].timer = 0;
    }
    unk_044 = mode;
    unk_04C = 0;
}
INCLUDE_ASM("asm/nonmatchings/monstorunit", SetupBaseModel__12CMonstorUnitFiiiP14CDataAlloc2_1_);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2328);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2329);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2330);
INCLUDE_RODATA("asm/nonmatchings/monstorunit", @2331);
INCLUDE_ASM("asm/nonmatchings/monstorunit", SetupViewMonstor__12CMonstorUnitFiPfi);
