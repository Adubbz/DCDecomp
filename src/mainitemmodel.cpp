#pragma argument_flag 0
#pragma argument_flag_ones 33, 34, 39, 59, 225, 254, 266, 268
#include "mainitemmodel.hpp"

#include <cstdio>
#pragma argument_flag_ones 58
#include <libvu0.h>

#include <cstring>

#include "character.hpp"
#include "collisiondata.hpp"
#include "dataalloc.hpp"
#include "dun/gameloop.hpp"
#include "frame.hpp"
#include "itembombeffect.hpp"
#include "itemdata.hpp"
#include "mds.hpp"
#include "mglib.hpp"
#include "shot_effect.hpp"
#include "snd.hpp"
#include "texture.hpp"

int CMainItemModel::GetFreeCashNo() {
    for (int i = 0; i < 6; i++) {
        if (cash[i] == NULL) {
            return i;
        }
    }

    return -1;
}

int CMainItemModel::GetFreeModelNo() {
    for (int i = 0; i < 16; i++) {
        if (model[i] == -1) {
            return i;
        }
    }

    return -1;
}

int CMainItemModel::SetCashModel(int item_no, unsigned int *model_data, unsigned int *texture_data, int texture_size) {
    int slot = GetFreeCashNo();

    if (slot == -1) {
        return -1;
    }

    BtItemCashArea[slot].Reset();
    u_char         *texture_copy = BtItemCashArea[slot].base + BtItemCashArea[slot].used * 16;
    CDataAlloc2<1> *area = &BtItemCashArea[slot];
    area->Alloc((texture_size >> 4) + 1);
    memcpy(texture_copy, texture_data, texture_size);
    TexManager.DeleteTextureBlock(slot + 0x38);
    TexManager.CleanUpBuffer();
    LOADTEXTURE_INFO2 textures[2] = {};
    textures[0].name = (char *) texture_copy;
    textures[0].block_no = slot + 0x38;
    TexManager.LoadTextureBlockEX(slot + 0x38, textures);
    cash[slot] = (u_int *) LoadMDSFile(model_data, area, 0, NULL, NULL);
    cash_lock[slot] = 1;
    cash_item[slot] = item_no;
    int model_no = GetFreeModelNo();
    model[model_no] = 0;
    model_cash[model_no] = slot;
    return model_no;
}

void CMainItemModel::DeleteModel(int model_no) {
    cash_lock[model_cash[model_no]]--;

    if (cash_lock[model_cash[model_no]] <= 0) {
        cash[model_cash[model_no]] = NULL;
        cash_lock[model_cash[model_no]] = 0;
        printf(MainItemRemoveMessage);
    }

    model[model_no] = -1;
    model_cash[model_no] = -1;
}

int CMainItemModel::SetHandModel(int source_no) {
    int hand_no = GetFreeModelNo();

    if (hand_no == -1) {
        return -1;
    }

    model[hand_no] = 1;
    float zero = 0.0f;
    frame[hand_no].SetPosition(zero, zero, zero);
    float angle = 1.5707964f;
    frame[hand_no].SetRotation(angle, 0.0f, 0.0f);
    model_cash[hand_no] = model_cash[source_no];
    cash_lock[model_cash[source_no]]++;
    printf(MainItemHandMessage, hand_no, cash_lock[model_cash[source_no]]);
    return hand_no;
}

void CMainItemModel::AllReleasItem() {
    for (int i = 0; i < 16; i++) {
        switch (model[i]) {
            case 1:
                DeleteModel(i);
                break;
        }
    }
}

/**
 * Creates a thrown model at a position with a copied heading vector.
 */
int CMainItemModel::SetThrowModel(int source_no, float *position, float *heading) {
    int slot = GetFreeModelNo();
    model[slot] = 2;
    sceVu0CopyVector(velocity[slot], heading);
    frame[slot].SetPosition(position);
    frame[slot].SetRotation(1.5707964f, 0.0f, 0.0f);
    throw_time[slot] = 0;
    model_cash[slot] = model_cash[source_no];
    cash_lock[model_cash[source_no]]++;
    return slot;
}

void CMainItemModel::Draw() {
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;
    CFrame       *hand = CharaMain.frame->SearchFrame("item");
    int           i;
    s32          *cash_no;
    CFrame       *placement;

    for (i = 0; i < 16; i++) {
        switch (model[i]) {
            case 1:
                cash_no = &model_cash[i];
                TexManager.ReloadTexture(Vif1Packet, *cash_no + 0x38);
                placement = &frame[i];
                sceVu0CopyVector(position, placement->position);
                placement->GetRotation(rotation);
                ((CFrame *) cash[*cash_no])->SetPosition(position);
                ((CFrame *) cash[*cash_no])->SetRotation(rotation[0], rotation[1], rotation[2]);
                ((CFrame *) cash[*cash_no])->SetReference(hand);
                MGDraw((CFrame *) cash[*cash_no]);
                break;
            case 2:
                cash_no = &model_cash[i];
                TexManager.ReloadTexture(Vif1Packet, *cash_no + 0x38);
                placement = &frame[i];
                sceVu0CopyVector(position, placement->position);
                placement->GetRotation(rotation);
                placement->SetPosition(position);
                ((CFrame *) cash[*cash_no])->SetPosition(position);
                ((CFrame *) cash[*cash_no])->SetRotation(rotation[0], rotation[1], rotation[2]);
                ((CFrame *) cash[*cash_no])->DeleteReference();
                MGDraw((CFrame *) cash[*cash_no]);
                break;
            case 3:
                cash_no = &model_cash[i];
                TexManager.ReloadTexture(Vif1Packet, *cash_no + 0x38);
                ((CFrame *) cash[*cash_no])->DeleteReference();
                placement = &frame[i];
                sceVu0CopyVector(position, placement->position);
                placement->GetRotation(rotation);
                ((CFrame *) cash[*cash_no])->SetPosition(position);
                ((CFrame *) cash[*cash_no])->SetRotation(rotation[0], rotation[1], rotation[2]);
                MGDraw((CFrame *) cash[*cash_no]);
                break;
            case -1:
            case 0:
                break;
        }
    }
}

char MainItemRemoveMessage[] __attribute__((section(".rodata"))) = "remove !!\n";
char MainItemHandMessage[] __attribute__((section(".rodata"))) = "code = %d, lock = %d\n";
int  ItemThrowStep(float *position, float *velocity);

void CMainItemModel::Step() {
    int           i;
    int           step_result;
    CFrame       *placement;
    int           item_no;
    sceVu0FVECTOR position;
    sceVu0FVECTOR up = {0.0f, 1.0f, 0.0f, 0.0f};

    for (i = 0; i < 16; i++) {
        switch (model[i]) {
            case 1:
                break;
            case 2: {
                placement = &frame[i];
                sceVu0CopyVector(position, placement->position);
                step_result = ItemThrowStep(position, velocity[i]);
                placement->SetPosition(position);

                if (step_result == 2) {
                    throw_time[i] = 45;
                }

                throw_time[i]++;

                if (throw_time[i] < 45) {
                    break;
                }

                throw_time[i] = 0;
                item_no = cash_item[model_cash[i]];

                switch (item_no) {
                    case 0xA0:
                        NowColData->Set(position, 8, 5, 8.0f, 1.0f, 2, 2, 0, 0);
                        DeleteModel(i);
                        break;
                    case 0xA7:
                        NowColData->Set(position, 8, 5, 8.0f, 1.0f, 2, 2, 0x800, 0);
                        DeleteModel(i);
                        break;
                    case 0xA6:
                        NowColData->Set(position, 2, 5, 8.0f, 1.0f, 2, 2, 0x100, 0);
                        DeleteModel(i);
                        break;
                    case 0xA9:
                        NowColData->Set(position, 2, 5, 8.0f, 1.0f, 2, 2, 0x200, 0);
                        DeleteModel(i);
                        break;
                    case 0x9F:
                    default:
                        SetBombEffect(position, 3, (selectMapNo + 1) * 30, 1.0f);
                        DeleteModel(i);
                        break;
                    case 0x98:
                        SndSePlay(0x69, -1, 0);
                        SndSePlay(0x6C, -1, 0);
                        MasekiEffect[4].Set(position, up, -1, -1, 0, NULL, -1);
                        MasekiEffect[4].SetDmg((int) (30.0f * (float) (selectMapNo + 1)));
                        MasekiEffect[4].SetEnemyAttr(1);
                        MasekiEffect[4].SetWait(2);
                        DeleteModel(i);
                        break;
                    case 0xA1:
                    case 0xA2:
                    case 0xA3:
                    case 0xA4:
                    case 0xA5: {
                        SndSePlay(item_no - 0x3C, -1, 0);
                        SndSePlay(0x6C, -1, 0);
                        CSHOT_EFFECT *effect = &MasekiEffect[item_no - 0xA1];
                        effect->Set(position, up, -1, -1, 0, NULL, -1);
                        effect->SetDmg((int) (30.0f * (float) (selectMapNo + 1)));
                        effect->SetLifeTime(10);
                        effect->SetWait(5);
                        DeleteModel(i);
                        break;
                    }
                }

                break;
            }
            case 3:
            case -1:
            case 0:
                break;
        }
    }
}

void CMainItemModel::Initialize() {
    for (int i = 0; i < 6; i++) {
        cash[i] = NULL;
        cash_lock[i] = 0;
        throw_time[i] = 0;
    }

    for (int i = 0; i < 16; i++) {
        model[i] = -1;
        frame[i].SetPosition(0.0f, 0.0f, 0.0f);
        frame[i].SetRotation(3.1415927f, 0.0f, 0.0f);
    }
}

int CActiveItemPack::CheckStatusType() {
    int type;

    if (now <= 0) {
        return 0;
    }

    int item_no = item[now];
    type = -1;

    if (item_no == -1) {
        return 0;
    }

    switch (item_no) {
        case 145:
        case 146:
        case 147:
        case 150:
        case 151:
            type = 2;
            break;
        case 148:
        case 149:
        case 153:
        case 154:
        case 155:
        case 170:
            type = 4;
            break;
    }

    if (type != -1) {
        return type;
    }

    if (ITEM_LIST[item_no - 81].kind_flags & 2) {
        return 1;
    }

    if (item_no == 0xEB) {
        return 3;
    }

    return 0;
}
