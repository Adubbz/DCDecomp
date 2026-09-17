#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 1383

#include "randomitem.hpp"

#include <libvu0.h>

#include <cmath>

#include "character.hpp"
#include "dngstatusdata.hpp"
#include "gameutil.hpp"
#include "hitvalue.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "shot_freefuncs.hpp"
#include "snd.hpp"
#include "texture.hpp"

extern "C" CCharacter CharaMain;
extern CDngStatusData *UserStatus;
extern CHitValue *NowHitValue;

#ifdef NON_MATCHING
void CRandomItem::Draw(void) {
    for (int i = 0; i < 32; i++) {
        if (id[i] == -1 || distance[i] > 200.0f) {
            continue;
        }

        sceVu0FVECTOR draw_position;
        int texel_x;
        int texel_y;
        sceVu0CopyVector(draw_position, position[i]);
        draw_position[1] += 8.0f * sinf(phase[i]);

        if (amount[i] != -1) {
            texel_x = 0x40;
            texel_y = 0;
        } else {
            switch (item_no[i]) {
                case 195:
                case 201:
                case 202:
                case 203:
                case 204:
                case 205:
                case 206:
                    texel_x = 0;
                    texel_y = 0;
                    break;
                case 196:
                    texel_x = 0x40;
                    texel_y = 0x40;
                    break;
                case 198:
                    texel_x = 0;
                    texel_y = 0x40;
                    break;
                default:
                    texel_x = 0x40;
                    texel_y = 0xC0;
                    break;
            }
            if (item_no[i] >= 81 && item_no[i] < 86) {
                texel_x = 0;
                texel_y = 0x80;
            }
            if (item_no[i] >= 111 && item_no[i] < 121) {
                texel_x = 0x40;
                texel_y = 0x80;
            }
        }
        BtSet3DCellModel(draw_position, gold_texture, 3.5f, texel_x, texel_y, 0x40, 0x40,
                         0x80);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", Draw__11CRandomItemFv);
#endif
#ifdef NON_MATCHING
void CRandomItem::MapSymbolDraw(void) {
    CTexture *texture = TexManager.GetTexture("itempack", -1);
    CRect_i_ source(0x50, 0x68, 8, 8);

    for (int i = 0; i < 32; i++) {
        if (id[i] != -1 && amount[i] == -1) {
            int x = (int) (0.96f * (position[i][0] - 80.0f));
            int y = (int) (0.96f * (position[i][2] - 80.0f));
            CRect_i_ destination(x + 0x184, y + 0x48, 8, 8);
            set2DSprite(Vif1Packet, texture, destination, source);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", MapSymbolDraw__11CRandomItemFv);
#endif
INCLUDE_RODATA("asm/nonmatchings/randomitem", @1383);
#ifdef NON_MATCHING
int CRandomItem::checkEvent(void) {
    for (int i = 0; i < 32; i++) {
        int event = pickup_event[i];
        if (event != -1) {
            pickup_event[i] = -1;
            return event;
        }
    }
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", checkEvent__11CRandomItemFv);
#endif
#ifdef NON_MATCHING
int CRandomItem::checkErr(void) {
    for (int i = 0; i < 32; i++) {
        if (pickup_blocked[i] > 0 && pickup_blocked[i] < 3) {
            pickup_blocked[i] = 3;
            return 1;
        }
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", checkErr__11CRandomItemFv);
#endif
#ifdef NON_MATCHING
int CRandomItem::CheckPosition(void) {
    sceVu0FVECTOR player_position;
    int gold = 0;

    sceVu0CopyVector(player_position, CharaMain.pos);
    for (int i = 0; i < 32; i++) {
        if (id[i] == -1 || state[i] != 1) {
            continue;
        }

        distance[i] = DistVector(position[i], player_position);
        if (pickup_blocked[i] > 0 && distance[i] >= 8.5f) {
            pickup_blocked[i] = 0;
        }
        if (pickup_blocked[i] != 0 || distance[i] > 5.0f) {
            continue;
        }

        if (amount[i] == -1 && item_no[i] != -1) {
            int blocked = UserStatus->CheckItemGet(item_no[i]);
            if (blocked == 0) {
                pickup_event[i] = item_no[i];
                id[i] = -1;
            } else {
                pickup_blocked[i] = blocked;
            }
        } else {
            state[i] = 2;
            if (item_no[i] == -1) {
                SndSePlay(0xDF, -1, 0);
            }
            gold += amount[i];
            position[i][1] += 5.0f;
            HitValueEntry(NowHitValue, position[i], gold, 1, NULL);
            position[i][1] -= 5.0f;
        }
    }
    return gold;
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", CheckPosition__11CRandomItemFv);
#endif
#ifdef NON_MATCHING
void CRandomItem::Set(float *drop_position, int slot_id, int gold, int item) {
    int slot = CheckID();
    if (slot != -1) {
        sceVu0CopyVector(position[slot], drop_position);
        position[slot][1] += 1.75f;
        id[slot] = slot_id;
        amount[slot] = gold;
        item_no[slot] = item;
        pickup_event[slot] = -1;
        state[slot] = 0;
        phase[slot] = 0.0f;
        pickup_blocked[slot] = 0;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", Set__11CRandomItemFPfiii);
#endif
#ifdef NON_MATCHING
int CRandomItem::CheckID(void) {
    for (int i = 0; i < 32; i++) {
        if (id[i] == -1) {
            return i;
        }
    }
    bob_phase = 0.0f;
    return -1;
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", CheckID__11CRandomItemFv);
#endif
#ifdef NON_MATCHING
int CRandomItem::CheckItemNo(int item) {
    for (int i = 0; i < 32; i++) {
        if (id[i] != -1 && item_no[i] == item) {
            return item;
        }
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", CheckItemNo__11CRandomItemFi);
#endif
#ifdef NON_MATCHING
void CRandomItem::Step(void) {
    bob_phase += 0.05235988f;
    if (bob_phase > 3.1415927f) {
        bob_phase -= 3.1415927f;
    }

    for (int i = 0; i < 32; i++) {
        if (id[i] == -1) {
            continue;
        }
        switch (state[i]) {
            case 0:
                phase[i] += 0.10471976f;
                if (phase[i] > 3.1415927f) {
                    state[i] = 1;
                    phase[i] = 0.0f;
                    SndSePlay(item_no[i] == -1 ? 0xDD : 0xDE, -1, 0);
                }
                break;
            case 1:
                break;
            case 2:
                phase[i] += 0.10471976f;
                if (phase[i] > 2.5132742f) {
                    id[i] = -1;
                }
                break;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/randomitem", Step__11CRandomItemFv);
#endif
