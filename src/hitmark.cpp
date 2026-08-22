#include "hitmark.hpp"

#include <libvu0.h>

#include <cstdlib>

#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

void CHitMark::Set(float *position, float *direction, int kind, float spread, float shrink,
                   float gravity, float speed, int count, float floor_y) {
    int i;

    SetPosition(position);
    this->kind = kind;
    this->unk_5C4 = spread;
    this->unk_5C0 = shrink;
    this->gravity = gravity;
    this->speed = speed;
    this->floor_y = floor_y;

    // The burst leaves along one direction, at the speed the caller asks for.
    sceVu0Normalize(direction, direction);
    direction[0] *= this->speed;
    direction[1] *= this->speed;
    direction[2] *= this->speed;

    for (i = 0; i < count; i++) {
        // Every mark starts a little away from the point of the hit, and
        // leaves in a direction that is scattered about the one it was given.
        this->offset[i][0] = rand() / 2147483648.0f - 0.5f;
        this->offset[i][1] = rand() / 2147483648.0f - 0.5f;
        this->offset[i][2] = rand() / 2147483648.0f - 0.5f;
        this->offset[i][3] = 1.0f;
        this->velocity[i][0] =
            direction[0] + this->unk_5C4 * rand() / 2147483648.0f - this->unk_5C4 / 2.0f;
        this->velocity[i][1] =
            direction[0] + this->unk_5C4 * rand() / 2147483648.0f - this->unk_5C4 / 2.0f;
        this->velocity[i][2] =
            direction[0] + this->unk_5C4 * rand() / 2147483648.0f - this->unk_5C4 / 2.0f;
        this->size[i] = 0.1f + 1.2f * rand() / 2147483648.0f;
        this->used[i] = 1;
    }
    this->count = HIT_MARK_MAX;
}

void CHitMark::Draw() {
    int top_left[4];
    int top_right[4];
    int bottom_left[4];
    int bottom_right[4];
    sceVu0FVECTOR base;
    sceVu0FVECTOR pos;
    CTexture *texture;
    int i;

    if (this->count == 0) {
        return;
    }

    sceVu0CopyVector(base, this->pos);
    texture = TexManager.GetTexture("basefx00", -1);

    for (i = 0; i < this->count; i++) {
        if (this->used[i] == 0) {
            continue;
        }
        pos[0] = base[0] + this->offset[i][0];
        pos[1] = base[1] + this->offset[i][1];
        pos[2] = base[2] + this->offset[i][2];
        pos[3] = 1.0f;
        if (MGRotTransPers3DSprite(top_left, bottom_right, pos, this->size[i],
                                   this->size[i] / 2.0f, 0) != 1) {
            continue;
        }

        // The two corners that the sprite call gives back are opposite, so the
        // other two take one part from each.
        top_right[0] = bottom_right[0];
        top_right[1] = top_left[1];
        top_right[2] = top_left[2];
        bottom_left[0] = top_left[0];
        bottom_left[1] = bottom_right[1];
        bottom_left[2] = bottom_right[2];

        switch (this->kind) {
            case 0: {
                CRect_i_ rect;
                rect.x = 0x00;
                rect.y = 0x00;
                rect.width = 0x10;
                rect.height = 0x10;
                set3DSprite(Vif1Packet, texture, rect, top_left, top_right, bottom_left, bottom_right,
                            0x80);
                break;
            }
            case 1: {
                CRect_i_ rect;
                rect.x = 0x30;
                rect.y = 0x10;
                rect.width = 0x10;
                rect.height = 0x10;
                set3DSprite(Vif1Packet, texture, rect, top_left, top_right, bottom_left, bottom_right,
                            0x80);
                break;
            }
            case 2: {
                CRect_i_ rect;
                rect.x = 0x40;
                rect.y = 0x00;
                rect.width = 0x10;
                rect.height = 0x10;
                set3DSprite(Vif1Packet, texture, rect, top_left, top_right, bottom_left, bottom_right,
                            0x80);
                break;
            }
            case 3: {
                CRect_i_ rect;
                rect.x = 0x10;
                rect.y = 0x00;
                rect.width = 0x20;
                rect.height = 0x20;
                set3DSprite(Vif1Packet, texture, rect, top_left, top_right, bottom_left, bottom_right,
                            0x40);
                break;
            }
            case 4: {
                CRect_i_ rect;
                rect.x = 0x68;
                rect.y = 0x20;
                rect.width = 0x18;
                rect.height = 0x18;
                set3DSprite(Vif1Packet, texture, rect, top_left, top_right, bottom_left, bottom_right,
                            0x80);
                break;
            }
        }
    }
}

void CHitMark::Step() {
    sceVu0FVECTOR base;
    int i;

    sceVu0CopyVector(base, this->pos);
    if (this->count == 0) {
        return;
    }

    for (i = 0; i < this->count; i++) {
        if (this->used[i] == 0) {
            continue;
        }
        this->offset[i][0] += this->velocity[i][0];
        this->offset[i][1] += this->velocity[i][1];
        this->offset[i][2] += this->velocity[i][2];
        this->velocity[i][1] -= this->gravity;

        // A mark that reaches the floor bounces off it, and loses most of the
        // speed it fell with.
        if (base[1] + this->offset[i][1] <= this->floor_y) {
            this->velocity[i][1] *= -0.7f;
        }

        this->size[i] -= this->unk_5C0;
        if (this->size[i] <= 0.1f) {
            this->used[i] = 0;
            this->count--;
        }
    }
    this->unk_5C4 -= 0.05f;
}

void CHitMark::Initialize() {
    int i;

    for (i = 0; i < HIT_MARK_MAX; i++) {
        this->used[i] = 0;
    }
    this->unk_5D0 = HIT_MARK_MAX;
    this->count = 0;
}

void CHitPointMark::Draw() {
    int top_left[4];
    int top_right[4];
    int bottom_left[4];
    int bottom_right[4];
    CRect_i_ rect;

    if (this->on == 0) {
        return;
    }
    if (MGRotTransPers3DSprite(top_left, bottom_right, this->pos, 5.0f, 2.5f, 0) != 1) {
        return;
    }
    if (this->blink != 1) {
        return;
    }

    top_right[0] = bottom_right[0];
    top_right[1] = top_left[1];
    top_right[2] = top_left[2];
    bottom_left[0] = top_left[0];
    bottom_left[1] = bottom_right[1];
    bottom_left[2] = bottom_right[2];

    rect.x = 0x00;
    rect.y = 0x20;
    rect.width = 0x30;
    rect.height = 0x30;
    set3DSprite(Vif1Packet, TexManager.GetTexture("basefx00", -1), rect, top_left, top_right,
                bottom_left, bottom_right, 0x80);
}

void CHitPointMark::Step() {
    if (this->on == 0) {
        return;
    }
    // The mark shows for four steps and hides for four, so that it blinks.
    if (this->timer % 4 == 0) {
        this->blink ^= 1;
    }
    if (this->timer == 0) {
        this->on = 0;
        return;
    }
    this->timer--;
}

/* The debug strings the rest of the unit prints; the functions that name
 * them are still assembly, and a table in `.data` points at them. */
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1522);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1523);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1524);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1525);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1526);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1527);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1528);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1529);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1530);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1531);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1532);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1533);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1534);
INCLUDE_RODATA("asm/nonmatchings/hitmark", LIT_1535);
