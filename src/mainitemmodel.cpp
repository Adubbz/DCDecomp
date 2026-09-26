#include "mainitemmodel.hpp"
#include <cstdio>
#pragma argument_flag_ones 58
#include <cstring>
#include <libvu0.h>
#include "dataalloc.hpp"
#include "texture.hpp"
#include "mds.hpp"
#include "frame.hpp"
#include "mglib.hpp"
#include "character.hpp"
#include "collisiondata.hpp"
#include "shot_effect.hpp"
#include "itembombeffect.hpp"
#include "snd.hpp"
#include "itemdata.hpp"
#include "dun/gameloop.hpp"

int CMainItemModel::GetFreeCashNo(void) {
    for (int i = 0; i < 6; i++) {
        if (cash[i] == NULL) {
            return i;
        }
    }
    return -1;
}
int CMainItemModel::GetFreeModelNo(void) {
    for (int i = 0; i < 16; i++) {
        if (model[i] == -1) {
            return i;
        }
    }
    return -1;
}
extern CDataAlloc2<1> BtItemCashArea[6];

int CMainItemModel::SetCashModel(int item_no, unsigned int *model_data, unsigned int *texture_data,
                                 int texture_size) {
    int slot = GetFreeCashNo();

    if (slot == -1) {
        return -1;
    }
    BtItemCashArea[slot].Reset();
    u_char *buffer = BtItemCashArea[slot].base + BtItemCashArea[slot].used * 16;
    CDataAlloc2<1> *area = &BtItemCashArea[slot];
    area->Alloc((texture_size >> 4) + 1);
    memcpy(buffer, texture_data, texture_size);
    TexManager.DeleteTextureBlock(slot + 0x38);
    TexManager.CleanUpBuffer();
    LOADTEXTURE_INFO2 texture[2] = {};
    texture[0].name = (char *) buffer;
    texture[0].block_no = slot + 0x38;
    TexManager.LoadTextureBlockEX(slot + 0x38, texture);
    cash[slot] = (u_int *) LoadMDSFile(model_data, area, 0, NULL, NULL);
    cash_lock[slot] = 1;
    cash_item[slot] = item_no;
    int model_no = GetFreeModelNo();
    model[model_no] = 0;
    model_cash[model_no] = slot;
    return model_no;
}
/** The message logged when a cached model's last user lets it go. */
extern char MainItemRemoveMessage[];

/** The message logged when a model is put in a hand. */
extern char MainItemHandMessage[];

void CMainItemModel::DeleteModel(int index) {
    cash_lock[model_cash[index]]--;
    if (cash_lock[model_cash[index]] <= 0) {
        cash[model_cash[index]] = NULL;
        cash_lock[model_cash[index]] = 0;
        printf(MainItemRemoveMessage);
    }
    model[index] = -1;
    model_cash[index] = -1;
}
int CMainItemModel::SetHandModel(int source) {
    int index = GetFreeModelNo();

    if (index == -1) {
        return -1;
    }
    model[index] = 1;
    float zero = 0.0f;
    frame[index].SetPosition(zero, zero, zero);
    float rot = 1.5707964f;
    frame[index].SetRotation(rot, 0.0f, 0.0f);
    model_cash[index] = model_cash[source];
    cash_lock[model_cash[source]]++;
    printf(MainItemHandMessage, index, cash_lock[model_cash[source]]);
    return index;
}
void CMainItemModel::AllReleasItem(void) {
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
int CMainItemModel::SetThrowModel(int model_index, float *position, float *heading) {
    int slot = GetFreeModelNo();
    model[slot] = 2;
    sceVu0CopyVector(velocity[slot], heading);
    frame[slot].SetPosition(position);
    frame[slot].SetRotation(1.5707964f, 0.0f, 0.0f);
    throw_time[slot] = 0;
    model_cash[slot] = model_cash[model_index];
    cash_lock[model_cash[model_index]]++;
    return slot;
}
void CMainItemModel::Draw(void) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;
    CFrame *hand = CharaMain.frame->SearchFrame("item");
    int i;
    s32 *slot;
    CFrame *placement;

    for (i = 0; i < 16; i++) {
        switch (model[i]) {
            case 1:
                slot = &model_cash[i];
                TexManager.ReloadTexture(Vif1Packet, *slot + 0x38);
                placement = &frame[i];
                sceVu0CopyVector(position, placement->position);
                placement->GetRotation(rotation);
                ((CFrame *) cash[*slot])->SetPosition(position);
                ((CFrame *) cash[*slot])->SetRotation(rotation[0], rotation[1], rotation[2]);
                ((CFrame *) cash[*slot])->SetReference(hand);
                MGDraw((CFrame *) cash[*slot]);
                break;
            case 2:
                slot = &model_cash[i];
                TexManager.ReloadTexture(Vif1Packet, *slot + 0x38);
                placement = &frame[i];
                sceVu0CopyVector(position, placement->position);
                placement->GetRotation(rotation);
                placement->SetPosition(position);
                ((CFrame *) cash[*slot])->SetPosition(position);
                ((CFrame *) cash[*slot])->SetRotation(rotation[0], rotation[1], rotation[2]);
                ((CFrame *) cash[*slot])->DeleteReference();
                MGDraw((CFrame *) cash[*slot]);
                break;
            case 3:
                slot = &model_cash[i];
                TexManager.ReloadTexture(Vif1Packet, *slot + 0x38);
                ((CFrame *) cash[*slot])->DeleteReference();
                placement = &frame[i];
                sceVu0CopyVector(position, placement->position);
                placement->GetRotation(rotation);
                ((CFrame *) cash[*slot])->SetPosition(position);
                ((CFrame *) cash[*slot])->SetRotation(rotation[0], rotation[1], rotation[2]);
                MGDraw((CFrame *) cash[*slot]);
                break;
            case -1:
            case 0:
                break;
        }
    }
}
INCLUDE_RODATA("asm/nonmatchings/mainitemmodel", @880__3);
INCLUDE_RODATA("asm/nonmatchings/mainitemmodel", @892__4);
#ifdef NON_MATCHING
int ItemThrowStep(float *position, float *velocity);
extern "C" CSHOT_EFFECT MasekiEffect[5];

void CMainItemModel::Step(void) {
    sceVu0FVECTOR position;
    sceVu0FVECTOR direction = {0.0f, 0.0f, 0.0f, 0.0f};
    CFrame *placement;

    for (int i = 0; i < 16; i++) {
        switch (model[i]) {
            case 1:
                break;
            case 2: {
                placement = &frame[i];
                sceVu0CopyVector(position, placement->position);
                int result = ItemThrowStep(position, velocity[i]);
                placement->SetPosition(position);
                if (result == 2) {
                    throw_time[i] = 45;
                }
                throw_time[i]++;
                if (throw_time[i] < 45) {
                    break;
                }
                throw_time[i] = 0;
                int item_no = cash_item[model_cash[i]];
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
                        MasekiEffect[4].Set(position, direction, -1, -1, 0, NULL, -1);
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
                        effect->Set(position, direction, -1, -1, 0, NULL, -1);
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
#else
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", Step__14CMainItemModelFv);
#endif
#ifdef NON_MATCHING
void CMainItemModel::Initialize(void) {
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
#else
INCLUDE_ASM("asm/nonmatchings/mainitemmodel", Initialize__14CMainItemModelFv);
#endif
extern ITEM_DATA ITEM_LIST[175];

int CActiveItemPack::CheckStatusType(void) {
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
