#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "stealitem.hpp"

#include <cmath>

#include "character.hpp"
#include "dun/gameloop.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"

void CStealItem::Initialize(CFrameVu1 *model) {
    this->frame = model;
    for (int i = 0; i < STEAL_ITEM_MAX; i++) {
        this->state[i] = -1;
        this->aux_state[i] = -1;
    }
}

void CStealItem::Set(float *position, int item_no) {
    int slot = -1;

    for (int i = 0; i < STEAL_ITEM_MAX; i++) {
        if (this->state[i] == -1) {
            slot = i;
            break;
        }
    }

    if (slot == -1) {
        return;
    }

    sceVu0CopyVector(this->pos[slot], position);
    this->base_height[slot] = position[1];
    this->state[slot] = 0;
    this->speed[slot] = 0.5f;
    this->phase[slot] = 0.0f;
    this->item[slot] = item_no;
    this->angle = 0.0f;
}

void CStealItem::Step() {
    sceVu0FVECTOR target;
    sceVu0FVECTOR direction;

    sceVu0CopyVector(target, CharaMain.pos);
    target[1] = 15.0f;

    this->angle += 0.31415927f;
    if (this->angle >= 6.2831855f) {
        this->angle -= 6.2831855f;
    }

    for (int i = 0; i < STEAL_ITEM_MAX; i++) {
        int state = this->state[i];

        switch (state) {
            case 0:
                this->speed[i] += 0.05f;
                this->pos[i][1] = this->base_height[i] + 12.0f * sinf(this->phase[i]);
                this->phase[i] += 0.034906585f;

                direction[0] = target[0] - this->pos[i][0];
                direction[1] = target[1] - this->pos[i][1];
                direction[2] = target[2] - this->pos[i][2];
                direction[3] = 1.0f;
                sceVu0Normalize(direction, direction);
                sceVu0ScaleVectorXYZ(direction, direction, this->speed[i]);
                this->pos[i][0] += direction[0];
                this->pos[i][1] += direction[1];
                this->pos[i][2] += direction[2];

                if (this->phase[i] >= 1.5707964f) {
                    this->state[i] = 1;
                }
                break;

            case 1:
                if (DistVector(target, this->pos[i]) <= 5.0f) {
                    this->state[i] = 2;
                    break;
                }

                this->speed[i] += 0.02f;
                direction[0] = target[0] - this->pos[i][0];
                direction[1] = target[1] - this->pos[i][1];
                direction[2] = target[2] - this->pos[i][2];
                direction[3] = 1.0f;
                sceVu0Normalize(direction, direction);
                sceVu0ScaleVectorXYZ(direction, direction, this->speed[i]);
                this->pos[i][0] += direction[0];
                this->pos[i][1] += direction[1];
                this->pos[i][2] += direction[2];
                break;

            case 2:
                break;

            case -1:
                break;
        }
    }
}

void CStealItem::Draw() {
    for (int i = 0; i < STEAL_ITEM_MAX; i++) {
        if (this->state[i] == -1) {
            continue;
        }
        this->frame->SetPosition(this->pos[i]);
        this->frame->SetRotation(this->angle, 0.0f, 0.0f);
        MGDraw(this->frame);
    }
}

int CStealItem::checkEvent() {
    for (int i = 0; i < STEAL_ITEM_MAX; i++) {
        if (this->state[i] == -1) {
            continue;
        }
        if (this->state[i] == 2) {
            this->state[i] = -1;
            return this->item[i];
        }
    }
    return -1;
}
