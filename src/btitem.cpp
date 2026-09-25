#include "common.h"

#include <libvu0.h>

#include "btactstatus.hpp"
#include "btitem.hpp"
#include "btmisc.hpp"
#include "character.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dngmessageman.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "frame.hpp"
#include "gamepad.hpp"
#include "menu_draw.hpp"
#include "menu_dungeon.hpp"
#include "menu_save.hpp"
#include "nowload.hpp"
#include "snd.hpp"
#include "sysmes.hpp"
#include "userstatus.hpp"

/* Battle item handling: treasure boxes, pickups and thrown items. */

/**
 * Item identifier shown by the small-treasure and attachment pickup flows.
 */
extern int BtGetTreasureboxSmall_itemNo;

/**
 * Item quantity shown by the small-treasure and attachment pickup flows.
 */
extern int BtGetTreasureboxSmall_itemVolume;

/**
 * Step the gate-key and attachment pickup presentations are on.
 */
extern int GateKey_Sled;

/**
 * Step the small character-select window is on.
 */
extern int BtMiniChrSelecter_Sled;

/**
 * Selection mode the small character-select window was opened with.
 */
extern int BtMiniChrSel_Type;

/**
 * Step the small item-select window is on.
 */
extern int BtMiniItemSelect_Sled;

/**
 * Holds the party where it stands instead of running its movement step.
 */
extern int driveStepHold;

/**
 * Freezes the drawn frame so a menu can open over it.
 */
extern int frameCaputer;

/**
 * Item the small item-select window returned, or -1.
 */
extern int miniItemSelNo;

/**
 * Mode the battle loop runs its menus in.
 */
extern int BtGameModeFlag;

/**
 * Event the dungeon loop is running, or -1 when none is.
 */
extern int iventInfo;

/**
 * Stops the monster units stepping.
 */
extern int CMonUnitHold;

/**
 * Stops the effects stepping.
 */
extern int CEffectHold;

/**
 * Marks that the party is holding a gate key.
 */
extern int gateItemFlag;

/**
 * Item the gate-key presentation is showing.
 */
extern int GateKey_itemNo;

/**
 * Model of the item a pickup presentation is showing.
 */
extern int itemOpenItemMds;

/**
 * Texture of the item a pickup presentation is showing.
 */
extern int itemOpenItemImg;

/**
 * Hides the monster units instead of drawing them.
 */
extern int CMonUnitHyde;

/**
 * Hides the effects instead of drawing them.
 */
extern int CEffectHyde;

/**
 * Model the escape presentation draws.
 */
extern int escape_chr;

/**
 * Step the escape presentation is on.
 */
extern int escape_sled;

extern "C" CDataAlloc2<1> BtCashBuffer;

#include <cstdio>
#include <cstring>

#include "btmisc.hpp"
#include "camerafollow.hpp"
#include "collision.hpp"
#include "dispctrl.hpp"
#include "dungeonmap.hpp"
#include "dungeonparts.hpp"
#include "edit.hpp"
#include "editloop3.hpp"
#include "mainitemmodel.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "monstorunit.hpp"
#include "motionmodel.hpp"
#include "savedata.hpp"
#include "texture.hpp"
#include "vector.hpp"
#include "weaponeffect.hpp"

extern char *charaNameTbl[6];
extern int defWeapon__4[6];
extern char *ITEM_NAME_TBL_NEW[];
extern "C" CWeaponEffect CWeaponFx;
extern "C" CCharacter *NowWeapon;
extern s32 BtItemListCashFlag;
extern int BtGetTreasurebox_Sled;
extern int BtGetAtraBoll_Sled;
extern int TreasureboxBig_itemNo;
extern int TreasureboxBig_itemType;
extern float TreasureboxBig_itemScale;
extern int BtAtraGetID;
extern int BtAtraGetNo;
extern CFrame *itemBoxModel;
extern s32 itemOpenBigFlag;
extern s32 itemOpenSmallFlag;
extern float itemWeponScale;
extern float itemNormalScale;
extern s32 iventActive;
extern "C" CCameraFollow SubCamera;
extern "C" CCameraFollow MainCamera__4;
extern CCameraFollow *NowCamera__3;
extern "C" int BtEquipMap;
extern "C" int BtEquipMasuisyou;
extern s32 atraShortGetType;
extern s32 atraGetStatus;
extern float atraGetStatusRate;
extern s32 atraGetMsgBord;
extern float atraGetMsgBordRate;
extern sceVu0FVECTOR atraGetPos;
extern sceVu0FVECTOR atraGetRot;
extern "C" CDispCtrl DispFade__3;
extern "C" s32 driveNoInterpolate;
extern s32 EscapeFlag;
extern u_int *itemOpenItemChr;
extern u_int *shortAtraEffectPtr;
extern "C" CActiveItemPack activeItem;
extern "C" CMotionModel itemOpenBig;
extern "C" CMotionModel itemOpenBigFx;
extern "C" CMotionModel itemOpenSmall;
extern "C" CMotionModel itemOpenSmallFx;
extern "C" CCharacter shortAtraEffect;
extern "C" CCharacter EscapeEffect;

void setCameraPassData(CFrameVu1 *frame, CCamera *camera, char *position_name, char *reference_name);
void getAtraToSaveData(int atra, int atra_no, CSaveData *save, int dungeon, int floor);
void getCharacterVector(float *vector, float pitch);

/**
 * Computes the quantity represented by an acquired attachment.
 */
int createAttachVolume(int item_no, int dungeon);

#ifdef NON_MATCHING
void selectChrUnit(int chara_no, int reload) {
    char name[64];
    char name1[64];
    char name2[64];
    char path[64];
    char effect_path[64];
    int size;

    printf("%d -> %d\n", UserStatus->cur_chara, chara_no);
    if (chara_no == UserStatus->cur_chara && reload == 0) {
        return;
    }
    UserStatus->cur_chara = chara_no;
    LoadFile(charaNameTbl[chara_no], read_buffer, &size);
    wait_now_loading_vsync();
    size = (u_int) (((size >> 6) + 1) << 6) >> 2;
    u_int *weapon0 = &read_buffer[size];
    int weapon_no = defWeapon__4[chara_no];
    BtGetWeaponNamePath3(name, path, weapon_no);
    BtGetWeaponNamePath3(name1, path, defWeapon__4[chara_no] + 1);
    BtGetWeaponNamePath3(name2, path,
                         UserStatus->chara_weapons[chara_no][UserStatus->equipped_weapon_slot[chara_no]].item_no);
    sprintf(path, "commenu/weapon/%s", name);
    LoadFile(path, weapon0, &size);
    u_int *weapon1 = &weapon0[(u_int) (((size >> 6) + 1) << 6) >> 2];
    sprintf(path, "commenu/weapon/%s", name1);
    LoadFile(path, weapon1, NULL);
    u_int *weapon2 = &weapon1[(u_int) (((size >> 6) + 1) << 6) >> 2];
    sprintf(path, "commenu/weapon/%s", name2);
    LoadFile(path, weapon2, NULL);
    wait_now_loading_vsync();
    LoadChara2(chara_no, 0, read_buffer, weapon0, weapon1, weapon2);
    SetWeaponAttachStatus(NowWeaponHave);
    BT_SHOT_EFFECT *effect = Get_Main_EffectPtr(chara_no, NowWeaponHave->best_elem);
    sprintf(effect_path, "dun/mainchara/wep_eff/%s.chr", (char *) effect);
    printf("[%d] %s\n", chara_no, effect_path);
    LoadFile(effect_path, read_buffer, &size);
    wait_now_loading_vsync();
    printf("fsize = %d\n", size);
    MainChara_Effect(effect, read_buffer, 0);
    CWeaponFx.InitSet(NowWeapon->frame, "dcol0", "dcol1");
    SetWeaponColor();
    SndVoiceLoad(UserStatus->cur_chara);
    unsigned int *buffer = read_buffer;
    LoadFileMenuData("itemlst.img", buffer);
    wait_now_loading_vsync();
    SetTempTexture(0x28, (char *) read_buffer);
    BtItemListCashFlag = 1;
    nowUnitNow = UserStatus->cur_chara;
    if (UserStatus->CheckLife() == 0) {
        CUserStatus *user = UserStatus;
        int cur_chara = user->cur_chara;
        user->hp[cur_chara] = 1;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", selectChrUnit__Fii);
#endif
INCLUDE_RODATA("asm/nonmatchings/btitem", @635__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @636);
INCLUDE_RODATA("asm/nonmatchings/btitem", @637);
INCLUDE_RODATA("asm/nonmatchings/btitem", @638);
INCLUDE_RODATA("asm/nonmatchings/btitem", @639__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @640__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @641);
/**
 * Marks the active item icons as loaded by the battle item-list flow.
 */
extern s32 BtItemListCashFlag;

/**
 * Loads the image used by the active item icons.
 *
 * @mangled LoadActiveItemIcon__Fv
 * @address 0x1D13A0
 * @size 0x4C
 */
void LoadActiveItemIcon(void) {
    unsigned int *buffer = read_buffer;
    LoadFileMenuData("itemlst.img", buffer);
    wait_now_loading_vsync();
    SetTempTexture(0x28, (char *) read_buffer);
    BtItemListCashFlag = 1;
}
/**
 * Opens the large treasure chest and starts its presentation.
 *
 * @mangled BtGetTreasureboxBig_Init__Fv
 * @address 0x1D13F0
 * @size 0x418
 */
#ifdef NON_MATCHING
void BtGetTreasureboxBig_Init() {
    char *chara_files[6] = {"dun/mainchara/c01d_ex00.chr", "dun/mainchara/c04b_ex00.chr",
                            "dun/mainchara/c06b_ex00.chr", "dun/mainchara/c05a_ex00.chr",
                            "dun/mainchara/c10b_ex00.chr", "dun/mainchara/c18a_ex00.chr"};
    char model_path[64];
    char texture_path[64];
    int size;
    TREASURE_BOX *box = &NowDngMap->boxes[NowDngMap->events[iventActive].index];
    int item_no = box->item_no;

    ResetMovePower();
    if (((CDngStatusData *) UserStatus)->CheckWeaponRot(item_no) >= 10) {
        SndSePlay(0xCE, -1, 0);
        SetSystemMes(((CDngStatusData *) UserStatus)->CheckWeaponUser(item_no) + 0x49, -1, 5, 0, NULL, NULL);
        NowDngMap->boxes[NowDngMap->events[iventActive].index].lid_angle = -20.0f;
        SetMIniMapStatus(0);
        iventInfo = -1;
        CMonUnitHold = 1;
        CMonUnitHyde = 1;
        CEffectHold = 1;
        CEffectHyde = 1;
        DngMessMan.unk_00 = 0;
        UserStatus->step_disable = 1;
        BtActStatus.unk_00C = 0;
        BtActStatus.unk_09C = 1;
        BtGetTreasurebox_Sled = 10;
        autoCamTrial();
        return;
    }
    if (item_no == 0x12F && PlayerAllItemCheck(0x12F) != 0) {
        item_no = 0x130;
    }
    TreasureboxBig_itemType = 0;
    if (((CDngStatusData *) UserStatus)->CheckWeaponUser(item_no) == 1) {
        TreasureboxBig_itemType = 1;
    }
    if (((CDngStatusData *) UserStatus)->CheckWeaponUser(item_no) == 5) {
        TreasureboxBig_itemType = 2;
    }
    if (((CDngStatusData *) UserStatus)->CheckWeaponUser(item_no) == 3) {
        TreasureboxBig_itemType = 3;
    }
    TreasureboxBig_itemNo = item_no;
    NowDngMap->events[iventActive].kind = -1;
    BtGetItemNamePath(model_path, texture_path, item_no);
    BtCashBuffer.base = (u_char *) read_buffer;
    BtCashBuffer.limit = 0x445C0;
    BtCashBuffer.used = 0;
    StartReadBG();
    itemOpenItemMds = (int) (BtCashBuffer.base + BtCashBuffer.used * 16);
    LoadFileBG(model_path, (u_long128 *) itemOpenItemMds, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    itemOpenItemImg = (int) (BtCashBuffer.base + BtCashBuffer.used * 16);
    LoadFileBG(texture_path, (u_long128 *) itemOpenItemImg, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    itemOpenItemChr = (u_int *) (BtCashBuffer.base + BtCashBuffer.used * 16);
    LoadFileBG(chara_files[UserStatus->cur_chara], (u_long128 *) itemOpenItemChr, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    SndSPSeLoadBG(2, (u_int *) (BtCashBuffer.base + BtCashBuffer.used * 16), &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    itemOpenBig.frame->SetRotation(0.0f, 0.0f, 0.0f);
    DngMessMan.unk_00 = 0;
    UserStatus->step_disable = 1;
    BtActStatus.unk_00C = 0;
    BtActStatus.unk_09C = 1;
    BtGetTreasurebox_Sled = 0;
    autoCamTrial();
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxBig_Init__Fv);
#endif
/**
 * Runs the large treasure chest's presentation and reports when it ends.
 *
 * @mangled BtGetTreasureboxBig_Loop__Fv
 * @address 0x1D1810
 * @size 0x7A8
 */
#ifdef NON_MATCHING
int BtGetTreasureboxBig_Loop() {
    sceVu0FVECTOR position;
    sceVu0FVECTOR item_position;
    int done = 0;

    switch (BtGetTreasurebox_Sled) {
        case 0:
            if (SndSPSeSyncBG() == 0 && ReadBGSync() == 0) {
                SetTempTexture(0x1C, (char *) itemOpenItemImg);
                itemBoxModel = LoadMDSFile((u_int *) itemOpenItemMds, &BtCashBuffer, 0, NULL, NULL);
                CharaMain.LoadPackData(itemOpenItemChr, "base2.cfg", &BtCashBuffer, &BtCashBuffer);
                BtActStatus.unk_054 = 0;
                BtGetTreasurebox_Sled++;
            }
            autoCamTrial();
            break;
        case 1: {
            SetMIniMapStatus(0);
            iventInfo = -1;
            CMonUnitHold = 1;
            CMonUnitHyde = 1;
            CEffectHold = 1;
            CEffectHyde = 1;
            TREASURE_BOX *box = &NowDngMap->boxes[NowDngMap->events[iventActive].index];
            sceVu0CopyVector(position, box->pos);
            box->lid_angle = -30.0f;
            box->unk_24 = 0;
            itemOpenBig.frame->SetPosition(position);
            itemOpenBigFx.frame->SetPosition(position);
            itemOpenBigFx.frame->SetRotation(0.0f, 0.0f, 0.0f);
            sceVu0CopyVector(item_position, position);
            item_position[0] -= 5.0f;
            item_position[1] += 13.0f;
            switch (TreasureboxBig_itemType) {
                case 0:
                    itemBoxModel->SetRotation(1.5707964f, 0.0f, 1.5707964f);
                    itemBoxModel->SetPosition(item_position);
                    TreasureboxBig_itemScale = 1.0f;
                    break;
                case 1:
                    itemBoxModel->SetRotation(-1.5707964f, -1.5707964f, 0.0f);
                    item_position[0] += 3.5f;
                    itemBoxModel->SetPosition(item_position);
                    TreasureboxBig_itemScale = 1.0f;
                    break;
                case 2:
                    itemBoxModel->SetRotation(-1.5707964f, 3.141592f, 0.0f);
                    item_position[0] += 2.5f;
                    itemBoxModel->SetPosition(item_position);
                    TreasureboxBig_itemScale = 1.0f;
                    break;
                case 3:
                    itemBoxModel->SetRotation(0.0f, 1.570796f, 0.0f);
                    item_position[0] += 3.5f;
                    itemBoxModel->SetPosition(item_position);
                    TreasureboxBig_itemScale = 2.0f;
                    break;
            }
            itemBoxModel->SetScale(0.01f, 0.01f, 0.01f);
            itemWeponScale = 0.1f;
            CharaMain.SetPosition(position);
            CharaMain.SetRotation(0.0f, 0.0f, 0.0f);
            BtActStatus.unk_00C = 0x2C;
            itemOpenBig.motion.state.time = 10.0f;
            itemOpenBigFx.motion.state.time = 10.0f;
            itemOpenBigFlag = 1;
            SubCamera = MainCamera__4;
            NowCamera__3 = &SubCamera;
            NowCamera__3->FollowOff();
            autoCamTrial();
            BtGetTreasurebox_Sled++;
            break;
        }
        case 2: {
            setCameraPassData((CFrameVu1 *) itemOpenBigFx.frame, NowCamera__3, "cam", "int");
            float time = itemOpenBigFx.motion.state.time;
            if (!(time <= 14.0f) && time < 15.0f) {
                SndSePlay(0xCE, -1, 0);
                SndSPSePlay(2, -1);
            }
            time = itemOpenBigFx.motion.state.time;
            if (!(time <= 50.0f) && time <= 55.0f) {
                float scale = TreasureboxBig_itemScale / 5.0f * (time - 50.0f);
                itemWeponScale = scale;
                itemBoxModel->SetScale(scale, scale, scale);
            }
            if (!(itemOpenBigFx.motion.state.time < 79.0f)) {
                itemOpenBigFlag = 2;
                BtActStatus.unk_00C = 0x2D;
                BtGetTreasurebox_Sled++;
                ItemGetMes(TreasureboxBig_itemNo, -1, 0x28, 1);
            }
            break;
        }
        case 3:
            setCameraPassData((CFrameVu1 *) itemOpenBigFx.frame, NowCamera__3, "cam", "int");
            if (GamePad.Down(0x60) != 0) {
                BtActStatus.unk_054 = 1;
                TexManager.DeleteTextureBlock(0x1C);
                TexManager.CleanUpTextureList();
                ((CDngStatusData *) UserStatus)->GetItem(TreasureboxBig_itemNo, 0);
                NowCamera__3->FollowOn();
                sceVu0CopyVector(position, CharaMain.pos);
                position[2] += 10.0f;
                CharaMain.SetPosition(position);
                CharaMain.SetRotation(0.0f, -3.1415927f, 0.0f);
                BtActStatus.unk_00C = 0;
                DngMessMan.unk_00 = 1;
                UserStatus->step_disable = 0;
                SetMIniMapStatus(1);
                CMonUnitHold = 0;
                CMonUnitHyde = 0;
                CEffectHold = 0;
                CEffectHyde = 0;
                itemOpenBigFlag = 0;
                BtActStatus.unk_09C = 0;
                ClearSystemMes();
                NowCamera__3 = &MainCamera__4;
                done = 1;
            }
            break;
        case 10:
            if (GamePad.Down(0x60) != 0) {
                ClearSystemMes();
                DngMessMan.unk_00 = 1;
                UserStatus->step_disable = 0;
                BtActStatus.unk_09C = 0;
                NowDngMap->boxes[NowDngMap->events[iventActive].index].lid_angle = 0.0f;
                SetMIniMapStatus(1);
                CMonUnitHold = 0;
                CMonUnitHyde = 0;
                CEffectHold = 0;
                CEffectHyde = 0;
                done = 1;
            }
            break;
    }
    return done;
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxBig_Loop__Fv);
#endif
/**
 * Opens the small treasure chest and starts its presentation.
 *
 * @mangled BtGetTreasureboxSmall_Init__Fi
 * @address 0x1D1FC0
 * @size 0x4A0
 */
#ifdef NON_MATCHING
void BtGetTreasureboxSmall_Init(int chance) {
    char *chara_files[6] = {"dun/mainchara/c01d_ex00.chr", "dun/mainchara/c04b_ex00.chr",
                            "dun/mainchara/c06b_ex00.chr", "dun/mainchara/c05a_ex00.chr",
                            "dun/mainchara/c10b_ex00.chr", "dun/mainchara/c18a_ex00.chr"};
    char model_path[64];
    char texture_path[64];
    int size;
    int item_no = NowDngMap->boxes[NowDngMap->events[iventActive].index].item_no;

    ResetMovePower();
    int full = ((CDngStatusData *) UserStatus)->CheckItemGet(item_no);
    if (full != 0) {
        SndSePlay(0xCF, -1, 0);
        if (full == 1) {
            SetSystemMes(0x48, -1, 5, 0, NULL, NULL);
        }
        if (full == 2) {
            SetSystemMes(0x51, -1, 5, 0, NULL, NULL);
        }
        NowDngMap->boxes[NowDngMap->events[iventActive].index].lid_angle = -20.0f;
        SetMIniMapStatus(0);
        iventInfo = -1;
        CMonUnitHold = 1;
        CMonUnitHyde = 1;
        CEffectHold = 1;
        CEffectHyde = 1;
        DngMessMan.unk_00 = 0;
        UserStatus->step_disable = 1;
        BtActStatus.unk_09C = 1;
        BtActStatus.unk_00C = 0;
        BtGetTreasurebox_Sled = 10;
        autoCamTrial();
        return;
    }
    NowDngMap->events[iventActive].kind = -1;
    if (ITEM_NAME_TBL_NEW[item_no - 81] == NULL) {
        item_no = 0x66;
    }
    int volume = createAttachVolume(item_no, chance);
    printf("get attach vol = %d\n", volume);
    BtGetTreasureboxSmall_itemNo = item_no;
    BtGetTreasureboxSmall_itemVolume = volume;
    strcpy(model_path, "dun/item/main_data/");
    strcat(model_path, ITEM_NAME_TBL_NEW[item_no - 81]);
    strcpy(texture_path, model_path);
    strcat(model_path, ".mds");
    strcat(texture_path, ".img");
    printf("[%d]%s\n", item_no, model_path);
    printf("[%d]%s\n", item_no, texture_path);
    BtCashBuffer.base = (u_char *) read_buffer;
    BtCashBuffer.limit = 0x445C0;
    BtCashBuffer.used = 0;
    StartReadBG();
    itemOpenItemMds = (int) (BtCashBuffer.base + BtCashBuffer.used * 16);
    LoadFileBG(model_path, (u_long128 *) itemOpenItemMds, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    itemOpenItemImg = (int) (BtCashBuffer.base + BtCashBuffer.used * 16);
    LoadFileBG(texture_path, (u_long128 *) itemOpenItemImg, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    itemOpenItemChr = (u_int *) (BtCashBuffer.base + BtCashBuffer.used * 16);
    LoadFileBG(chara_files[UserStatus->cur_chara], (u_long128 *) itemOpenItemChr, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    SndSPSeLoadBG(2, (u_int *) (BtCashBuffer.base + BtCashBuffer.used * 16), &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    itemOpenSmall.frame->SetRotation(0.0f, 0.0f, 0.0f);
    DngMessMan.unk_00 = 0;
    UserStatus->step_disable = 1;
    BtActStatus.unk_09C = 1;
    BtActStatus.unk_00C = 0;
    BtGetTreasurebox_Sled = 0;
    autoCamTrial();
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxSmall_Init__Fi);
#endif
/**
 * Runs the small treasure chest's presentation and reports when it ends.
 *
 * @mangled BtGetTreasureboxSmall_Loop__Fv
 * @address 0x1D2460
 * @size 0x690
 */
#ifdef NON_MATCHING
int BtGetTreasureboxSmall_Loop() {
    sceVu0FVECTOR position;
    int done = 0;

    switch (BtGetTreasurebox_Sled) {
        case 0:
            if (ReadBGSync() == 0) {
                SndSPSeSyncBG();
                SetTempTexture(0x1C, (char *) itemOpenItemImg);
                itemBoxModel = LoadMDSFile((u_int *) itemOpenItemMds, &BtCashBuffer, 0, NULL, NULL);
                CharaMain.LoadPackData(itemOpenItemChr, "base2.cfg", &BtCashBuffer, &BtCashBuffer);
                BtActStatus.unk_054 = 0;
                BtGetTreasurebox_Sled++;
            }
            autoCamTrial();
            break;
        case 1: {
            SetMIniMapStatus(0);
            iventInfo = -1;
            CMonUnitHold = 1;
            CMonUnitHyde = 1;
            CEffectHold = 1;
            CEffectHyde = 1;
            TREASURE_BOX *box = &NowDngMap->boxes[NowDngMap->events[iventActive].index];
            sceVu0CopyVector(position, box->pos);
            box->lid_angle = -30.0f;
            box->unk_24 = 0;
            itemOpenSmall.frame->SetPosition(position);
            itemOpenSmallFx.frame->SetPosition(position);
            itemOpenSmallFx.frame->SetRotation(0.0f, 0.0f, 0.0f);
            position[1] += 13.0f;
            itemBoxModel->SetPosition(position);
            position[1] -= 13.0f;
            itemBoxModel->SetScale(0.01f, 0.01f, 0.01f);
            itemNormalScale = 0.1f;
            CharaMain.SetPosition(position);
            CharaMain.SetRotation(0.0f, 0.0f, 0.0f);
            BtActStatus.unk_00C = 0x2A;
            itemOpenSmall.motion.state.time = 10.0f;
            itemOpenSmallFx.motion.state.time = 10.0f;
            itemOpenSmallFlag = 1;
            SubCamera = MainCamera__4;
            NowCamera__3 = &SubCamera;
            NowCamera__3->FollowOff();
            autoCamTrial();
            BtGetTreasurebox_Sled++;
            break;
        }
        case 2: {
            setCameraPassData((CFrameVu1 *) itemOpenSmallFx.frame, NowCamera__3, "cam", "int");
            float time = itemOpenSmallFx.motion.state.time;
            if (!(time <= 19.0f) && time < 20.4f) {
                SndSePlay(0xCF, -1, 0);
                SndSPSePlay(2, -1);
            }
            time = itemOpenSmallFx.motion.state.time;
            if (!(time <= 50.0f) && time <= 55.0f) {
                float scale = 0.2f * (time - 50.0f);
                itemNormalScale = scale;
                itemBoxModel->SetScale(scale, scale, scale);
            }
            if (!(itemOpenSmallFx.motion.state.time < 79.0f)) {
                BtActStatus.unk_00C = 0x2B;
                itemOpenSmallFlag = 2;
                if (BtGetTreasureboxSmall_itemVolume != 0) {
                    ItemGetMes(BtGetTreasureboxSmall_itemNo, BtGetTreasureboxSmall_itemVolume, 0x28, 1);
                } else {
                    ItemGetMes(BtGetTreasureboxSmall_itemNo, -1, 0x28, 1);
                }
                BtGetTreasurebox_Sled++;
            }
            break;
        }
        case 3:
            setCameraPassData((CFrameVu1 *) itemOpenSmallFx.frame, NowCamera__3, "cam", "int");
            if (GamePad.Down(0x60) != 0) {
                BtActStatus.unk_054 = 1;
                TexManager.DeleteTextureBlock(0x1C);
                TexManager.CleanUpTextureList();
                if ((unsigned int) (BtGetTreasureboxSmall_itemNo - 0xE9) < 2U) {
                    if (BtGetTreasureboxSmall_itemNo == 0xE9) {
                        BtEquipMap = 1;
                    }
                    if (BtGetTreasureboxSmall_itemNo == 0xEA) {
                        BtEquipMasuisyou = 1;
                    }
                } else {
                    ((CDngStatusData *) UserStatus)->GetItem(BtGetTreasureboxSmall_itemNo, BtGetTreasureboxSmall_itemVolume);
                }
                sceVu0CopyVector(position, CharaMain.pos);
                position[2] += 10.0f;
                CharaMain.SetPosition(position);
                CharaMain.SetRotation(0.0f, -3.1415927f, 0.0f);
                ClearSystemMes();
                BtActStatus.unk_00C = 0;
                DngMessMan.unk_00 = 1;
                UserStatus->step_disable = 0;
                BtActStatus.unk_09C = 0;
                SetMIniMapStatus(1);
                CMonUnitHold = 0;
                CMonUnitHyde = 0;
                CEffectHold = 0;
                CEffectHyde = 0;
                itemOpenSmallFlag = 0;
                NowCamera__3 = &MainCamera__4;
                done = 1;
            }
            break;
        case 10:
            if (GamePad.Down(0x60) != 0) {
                ClearSystemMes();
                DngMessMan.unk_00 = 1;
                UserStatus->step_disable = 0;
                BtActStatus.unk_09C = 0;
                NowDngMap->boxes[NowDngMap->events[iventActive].index].lid_angle = 0.0f;
                SetMIniMapStatus(1);
                CMonUnitHold = 0;
                CMonUnitHyde = 0;
                CEffectHold = 0;
                CEffectHyde = 0;
                done = 1;
            }
            break;
    }
    return done;
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxSmall_Loop__Fv);
#endif
/**
 * Starts the short presentation for picking up an Atla.
 *
 * @mangled BtAtraGetShort_Init__Fv
 * @address 0x1D2AF0
 * @size 0x180
 */
#ifdef NON_MATCHING
void BtAtraGetShort_Init() {
    int size;

    atraShortGetType = 1;
    BtCashBuffer.base = (u_char *) read_buffer;
    BtCashBuffer.limit = 0x445C0;
    BtCashBuffer.used = 0;
    StartReadBG();
    itemOpenItemChr = (u_int *) (BtCashBuffer.base + BtCashBuffer.used * 16);
    LoadFileBG("dun/mainchara/c01d_ex00.chr", (u_long128 *) itemOpenItemChr, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    shortAtraEffectPtr = (u_int *) (BtCashBuffer.base + BtCashBuffer.used * 16);
    LoadFileBG("dun/effect/saget.chr", (u_long128 *) shortAtraEffectPtr, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    SndSPSeLoadBG(1, (u_int *) (BtCashBuffer.base + BtCashBuffer.used * 16), &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    DngMessMan.unk_00 = 0;
    ResetMovePower();
    UserStatus->step_disable = 1;
    BtAtraGetNo = iventActive;
    iventActive = -1;
    BtGetAtraBoll_Sled = 0;
    BtActStatus.unk_09C = 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtAtraGetShort_Init__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/btitem", @656__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @657__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @658__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @659__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @660);
INCLUDE_RODATA("asm/nonmatchings/btitem", @661);
INCLUDE_RODATA("asm/nonmatchings/btitem", @747);
INCLUDE_RODATA("asm/nonmatchings/btitem", @754);
INCLUDE_RODATA("asm/nonmatchings/btitem", @755);
INCLUDE_RODATA("asm/nonmatchings/btitem", @792);
INCLUDE_RODATA("asm/nonmatchings/btitem", @793);
INCLUDE_RODATA("asm/nonmatchings/btitem", @794__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @795__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @796);
INCLUDE_RODATA("asm/nonmatchings/btitem", @866__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @902);
/**
 * Runs the Atla pickup presentation and reports when it ends.
 *
 * @mangled BtAtraGetShort_Loop__Fii
 * @address 0x1D2C70
 * @size 0x61C
 */
#ifdef NON_MATCHING
int BtAtraGetShort_Loop(int map_no, int floor) {
    sceVu0FVECTOR position;
    int done = -1;

    switch (BtGetAtraBoll_Sled) {
        case 0:
            if (SndSPSeSyncBG() == 0 && ReadBGSync() == 0) {
                CharaMain.LoadPackData(itemOpenItemChr, "base2.cfg", &BtCashBuffer, &BtCashBuffer);
                BtActStatus.unk_054 = 0;
                shortAtraEffect.LoadPackData2(shortAtraEffectPtr, "info.cfg", &BtCashBuffer, 0x1C, &BtCashBuffer, 0);
                SetMIniMapStatus(0);
                iventInfo = -1;
                atraGetStatus = 1;
                CMonUnitHold = 1;
                CMonUnitHyde = 1;
                CEffectHold = 1;
                CEffectHyde = 1;
                sceVu0CopyVector(atraGetPos, CharaMain.pos);
                CharaMain.GetRotation(atraGetRot);
                driveNoInterpolate = 1;
                ATRA_BOLL *boll = &NowDngMap->atra[NowDngMap->events[BtAtraGetNo].index];
                shortAtraEffect.SetPosition(boll->pos);
                shortAtraEffect.SetRotation(0.0f, 0.0f, 0.0f);
                shortAtraEffect.SetMotion(0, 6);
                atraGetStatusRate = 0.0f;
                int atra_id = ((CDngStatusData *) UserStatus)->atra_registry[map_no][boll->atra_no].id;
                BtAtraGetID = atra_id;
                NowDngMap->atra[NowDngMap->events[BtAtraGetNo].index].used = 0;
                NowDngMap->events[BtAtraGetNo].kind = -1;
                getAtraToSaveData(atra_id, boll->atra_no, SaveData, map_no, floor);
                sceVu0CopyVector(position, boll->pos);
                CharaMain.SetPosition(position);
                CharaMain.SetRotation(0.0f, 0.0f, 0.0f);
                BtActStatus.unk_00C = 0x2E;
                driveNoInterpolate = 1;
                SubCamera = MainCamera__4;
                NowCamera__3 = &SubCamera;
                NowCamera__3->FollowOff();
                shortAtraEffect.SetMotionCamera(NowCamera__3);
                BtGetAtraBoll_Sled++;
            }
            autoCamTrial();
            break;
        case 1: {
            if (atraGetStatusRate < 256.0f) {
                atraGetStatusRate += 2.0f;
            }
            float time = shortAtraEffect.motion_type.state.time;
            if (!(time < 53.0f) && time < 54.0f) {
                SndSPSePlay(1, -1);
            }
            if (!(shortAtraEffect.motion_type.state.time < 129.5f)) {
                AtraGetMes(map_no, BtAtraGetID, 0x28);
                atraGetStatus = 2;
                atraGetMsgBord = 1;
                atraGetMsgBordRate = 0.0f;
                BtActStatus.unk_00C = 0x2F;
                BtGetAtraBoll_Sled++;
            }
            break;
        }
        case 2:
            if (atraGetMsgBordRate < 128.0f) {
                atraGetMsgBordRate += 4.0f;
            } else {
                BtGetAtraBoll_Sled++;
            }
            break;
        case 3:
            if (GamePad.Down(0x60) != 0) {
                DispFade__3.FadeInit(0.0f);
                DispFade__3.FadeOutStart(8.0f);
                BtGetAtraBoll_Sled++;
            }
            break;
        case 4:
            if (DispFade__3.GetRate() == 128.0f) {
                DispFade__3.FadeInStart(8.0f);
                autoCamTrial();
                BtGetAtraBoll_Sled++;
            }
            break;
        case 5:
            BtActStatus.unk_054 = 1;
            ClearSystemMes();
            SetMIniMapStatus(1);
            DngMessMan.unk_00 = 1;
            atraGetStatus = 0;
            NowCamera__3 = &MainCamera__4;
            CharaMain.SetRotation(0.0f, -3.1415927f, 0.0f);
            CMonUnitHold = 0;
            CMonUnitHyde = 0;
            CEffectHold = 0;
            CEffectHyde = 0;
            atraGetMsgBord = 0;
            NowCamera__3->SetSpeed(6.0f);
            NowCamera__3->FollowOn();
            UserStatus->step_disable = 0;
            BtActStatus.unk_00C = 0;
            BtActStatus.unk_09C = 0;
            done = 1;
            break;
    }
    return done;
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtAtraGetShort_Loop__Fii);
#endif

/**
 * Opens the small character-select window in the given selection mode.
 *
 * @mangled BtMiniChrSelect_Init__Fi
 * @address 0x1D3290
 * @size 0x40
 */
void BtMiniChrSelect_Init(int type) {
    SetMIniMapStatus(0);
    DngMessMan.unk_00 = 0;
    BtMiniChrSelecter_Sled = 0;
    BtMiniChrSel_Type = type;
}

/**
 * Runs the small character-select window and reports the choice.
 *
 * @mangled BtMiniChrSelect_Loop__Fv
 * @address 0x1D32D0
 * @size 0x128
 */
#ifdef NON_MATCHING
int BtMiniChrSelect_Loop() {
    static int frameWait;
    int done = 0;

    switch (BtMiniChrSelecter_Sled) {
        case 0:
            BtMiniChrSelecter_Sled++;
            frameWait = 0;
            driveStepHold = 1;
            frameCaputer = 1;
            break;
        case 1:
            frameWait++;
            if (frameWait >= 2) {
                BtMiniChrSelecter_Sled++;
            }
            break;
        case 2: {
            frameCaputer = 0;
            driveStepHold = 0;
            int blocks[2] = {0x128, 0xD8};
            StartQuickChange((u_long128 *) read_buffer, 0x17, blocks, BtMiniChrSel_Type);
            BtGameModeFlag = 5;
            BtMiniChrSelecter_Sled++;
            autoCamTrial();
            break;
        }
        case 3:
            SetMIniMapStatus(1);
            done = 1;
            DngMessMan.unk_00 = 1;
            nowUnitNow = UserStatus->cur_chara;
            ResetStatusInfo();
            autoCamTrial();
            break;
    }
    return done;
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtMiniChrSelect_Loop__Fv);
#endif
/**
 * Opens the small item-select window.
 *
 * @mangled BtMiniItemSelect__Fv
 * @address 0x1D3400
 * @size 0x38
 */
void BtMiniItemSelect(void) {
    SetMIniMapStatus(0);
    DngMessMan.unk_00 = 0;
    BtMiniItemSelect_Sled = 0;
    driveStepHold = 1;
}

/**
 * Runs one frame of the small item-select window, and reports when it closes.
 *
 * @mangled BtMiniItemSelect_Loop__Fv
 * @address 0x1D3440
 * @size 0x118
 */
int BtMiniItemSelect_Loop(void) {
    int done = 0;

    switch (BtMiniItemSelect_Sled) {
        case 0:
            BtMiniItemSelect_Sled++;
            frameCaputer = 1;
            break;

        case 1:
            BtMiniItemSelect_Sled++;
            break;

        case 2: {
            frameCaputer = 0;
            driveStepHold = 0;
            miniItemSelNo = -1;

            ITEM_PACK *pack = &UserStatus->item_pack;

            InitEventItemSelect(0x18, BtEventInfo.unk_3C, pack, 0xB4, 0xD2, BtEventInfo.unk_7C, 0);
            BtGameModeFlag = 3;
            BtMiniItemSelect_Sled++;
            break;
        }

        case 3:
            if (BtEventInfo.unk_80 != 0) {
                ((int *) BtEventInfo.unk_80)[1] = miniItemSelNo;
            }
            BtEventInfo.unk_80 = 0;
            SetMIniMapStatus(1);
            done = 1;
            DngMessMan.unk_00 = done;
            break;
    }

    return done;
}

/**
 * Starts the gate-key pickup presentation for the given item.
 *
 * @mangled BtGetGateKey_Init__Fi
 * @address 0x1D3560
 * @size 0x13C
 */
void BtGetGateKey_Init(int item_no) {
    char model_path[64];
    char texture_path[64];
    u_char *model;
    u_char *texture;
    int size;

    GateKey_itemNo = item_no;
    BtGetItemNamePath(model_path, texture_path, item_no);
    BtCashBuffer.base = (u_char *) read_buffer;
    BtCashBuffer.limit = 0x445C0;
    BtCashBuffer.used = 0;
    StartReadBG();
    model = BtCashBuffer.base + BtCashBuffer.used * 16;
    itemOpenItemMds = (int) model;
    LoadFileBG(model_path, (u_long128 *) model, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    texture = BtCashBuffer.base + BtCashBuffer.used * 16;
    itemOpenItemImg = (int) texture;
    LoadFileBG(texture_path, (u_long128 *) texture, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    ResetMovePower();
    DngMessMan.unk_00 = 0;

    CUserStatus *user = UserStatus;

    user->step_disable = 1;
    BtActStatus.unk_00C = 0;
    BtActStatus.unk_09C = 1;
    GateKey_Sled = 0;
    autoCamTrial();
}

/**
 * Runs the gate-key presentation and reports when it ends.
 *
 * @mangled BtGetGateKey_Loop__Fv
 * @address 0x1D36A0
 * @size 0x3D0
 */
#ifdef NON_MATCHING
int BtGetGateKey_Loop() {
    sceVu0FVECTOR eye;
    sceVu0FVECTOR ref;
    sceVu0FVECTOR ahead;
    int done = 0;

    switch (GateKey_Sled) {
        case 0:
            if (ReadBGSync() == 0) {
                SetTempTexture(0x1C, (char *) itemOpenItemImg);
                itemBoxModel = LoadMDSFile((u_int *) itemOpenItemMds, &BtCashBuffer, 0, NULL, NULL);
                itemBoxModel->SetReference(CharaMain.frame->SearchFrame("item"));
                itemBoxModel->SetPosition((0, 0.0f), (0, (0, 0.0f)), (0, (0, 0.0f)));
                itemBoxModel->SetRotation(0.0f, 0.0f, 0.0f);
                itemBoxModel->SetScale((0, (0, 1.0f)), 1.0f, (0, 1.0f));
                gateItemFlag = 1;
                GateKey_Sled++;
            }
            autoCamTrial();
            break;
        case 1:
            SetMIniMapStatus(0);
            iventInfo = -1;
            CMonUnitHold = 1;
            CMonUnitHyde = 1;
            CEffectHold = 1;
            CEffectHyde = 1;
            BtActStatus.unk_00C = 0x22;
            SubCamera.FollowOff();
            sceVu0CopyVector(ref, CharaMain.pos);
            ref[1] += 12.0f;
            SubCamera.SetRef(ref);
            sceVu0CopyVector(eye, CharaMain.pos);
            getCharacterVector(ahead, 0.0f);
            sceVu0ScaleVectorXYZ(ahead, ahead, 40.0f);
            eye[0] += ahead[0];
            eye[1] += 20.0f + ahead[1];
            eye[2] += ahead[2];
            SubCamera.SetPos(eye);
            NowCamera__3 = &SubCamera;
            NowCamera__3->Step(-1);
            NowCamera__3->FollowOff();
            SndSePlay(0x128, -1, 0);
            autoCamTrial();
            GateKey_Sled++;
            break;
        case 2: {
            float end = CharaMain.motion_type.motion_info[34].end;
            float time = CharaMain.motion_type.state.time;
            if (!(time < end - 0.5f) && time <= end) {
                ItemGetMes(GateKey_itemNo, -1, 0x28, 1);
                BtActStatus.unk_00C = 0x23;
                GateKey_Sled++;
            }
            break;
        }
        case 3:
            if (GamePad.Down(0x60) != 0) {
                TexManager.DeleteTextureBlock(0x1C);
                TexManager.CleanUpTextureList();
                DngMessMan.unk_00 = 1;
                UserStatus->step_disable = 0;
                SetMIniMapStatus(1);
                CMonUnitHold = 0;
                CMonUnitHyde = 0;
                CEffectHold = 0;
                CEffectHyde = 0;
                gateItemFlag = 0;
                BtActStatus.unk_09C = 0;
                ClearSystemMes();
                NowCamera__3 = &MainCamera__4;
                done = 1;
            }
            break;
    }
    return done;
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetGateKey_Loop__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/btitem", @969);

void BtGetAttach_Init(int dungeon, int item_no) {
    int volume = 0;

    if (item_no >= 0x51 && item_no < 0x79) {
        volume = createAttachVolume(item_no, dungeon);
    }
    BtGetTreasureboxSmall_itemNo = item_no;
    BtGetTreasureboxSmall_itemVolume = volume;
    ((CDngStatusData *) UserStatus)->GetItem(item_no, volume);
    ClearSystemMes();
    ItemGetMes(BtGetTreasureboxSmall_itemNo, BtGetTreasureboxSmall_itemVolume, 0x78, 0);
}

/**
 * Runs one frame of the attachment pickup message, and reports when it ends.
 *
 * @mangled BtGetAttach_Loop__Fv
 * @address 0x1D3B00
 * @size 0xF0
 */
int BtGetAttach_Loop(void) {
    int done = 0;

    switch (GateKey_Sled) {
        case 0:
            SetMIniMapStatus(0);
            iventInfo = -1;
            CMonUnitHold = 1;
            CEffectHold = 1;
            ItemGetMes(BtGetTreasureboxSmall_itemNo, BtGetTreasureboxSmall_itemVolume, 0x28, 1);
            GateKey_Sled++;
            break;

        case 1:
            if (GamePad.Down(0x60) != 0) {
                DngMessMan.unk_00 = 1;
                UserStatus->step_disable = 0;
                SetMIniMapStatus(1);
                CMonUnitHold = 0;
                CEffectHold = 0;
                gateItemFlag = 0;
                BtActStatus.unk_09C = 0;
                ClearSystemMes();
                done = 1;
            }
            break;
    }

    return done;
}

/**
 * Starts the presentation that carries the party off the floor.
 *
 * @mangled BtEscape_Init__Fv
 * @address 0x1D3BF0
 * @size 0x14C
 */
void BtEscape_Init(void) {
    u_char *chr;
    int size;

    BtCashBuffer.base = (u_char *) read_buffer;
    BtCashBuffer.limit = 0x445C0;
    BtCashBuffer.used = 0;
    StartReadBG();
    chr = BtCashBuffer.base + BtCashBuffer.used * 16;
    escape_chr = (int) chr;
    LoadFileBG("dun/effect/escape.chr", (u_long128 *) chr, &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    SndSPSeLoadBG(8, (u_int *) (BtCashBuffer.base + BtCashBuffer.used * 16), &size);
    BtCashBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    DngMessMan.unk_00 = 0;

    CUserStatus *user = UserStatus;

    user->step_disable = 1;
    CMonUnitHold = 1;
    CMonUnitHyde = 1;
    CEffectHold = 1;
    CEffectHyde = 1;
    SetMIniMapStatus(0);
    iventInfo = -1;
    ResetMovePower();
    BtActStatus.unk_00C = 0;
    BtActStatus.unk_09C = 1;
    escape_sled = 0;
    autoCamTrial();
}

INCLUDE_RODATA("asm/nonmatchings/btitem", @549__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @595__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @596__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @597__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @598);
INCLUDE_RODATA("asm/nonmatchings/btitem", @599__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @600);
INCLUDE_RODATA("asm/nonmatchings/btitem", @601);
INCLUDE_RODATA("asm/nonmatchings/btitem", @602);
INCLUDE_RODATA("asm/nonmatchings/btitem", @603);
INCLUDE_RODATA("asm/nonmatchings/btitem", @604__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @605);
INCLUDE_RODATA("asm/nonmatchings/btitem", @606__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @607__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @608__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @609);
INCLUDE_RODATA("asm/nonmatchings/btitem", @610__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @611__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @612__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @613);
INCLUDE_RODATA("asm/nonmatchings/btitem", @614__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @615__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @616__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @617__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @618);
INCLUDE_RODATA("asm/nonmatchings/btitem", @619__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @620__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @621__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @622__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @623__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @624__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @625__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @626__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @627__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @628__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @629__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @630__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @631__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @632__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @633__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @634__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @635__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @636__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @637__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @638__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @639__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @640__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @641__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @642__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @643__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @644__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @645__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @646__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @647__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @648__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @649);
INCLUDE_RODATA("asm/nonmatchings/btitem", @650__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @651);
INCLUDE_RODATA("asm/nonmatchings/btitem", @652);
INCLUDE_RODATA("asm/nonmatchings/btitem", @653__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @654__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @655__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @656__5);
INCLUDE_RODATA("asm/nonmatchings/btitem", @657__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @658__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @659__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @660__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @661__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @662__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @663);
INCLUDE_RODATA("asm/nonmatchings/btitem", @664__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @665__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @666__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @667__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @668);
INCLUDE_RODATA("asm/nonmatchings/btitem", @669);
INCLUDE_RODATA("asm/nonmatchings/btitem", @670);
INCLUDE_RODATA("asm/nonmatchings/btitem", @671);
INCLUDE_RODATA("asm/nonmatchings/btitem", @672);
INCLUDE_RODATA("asm/nonmatchings/btitem", @673);
INCLUDE_RODATA("asm/nonmatchings/btitem", @674);
INCLUDE_RODATA("asm/nonmatchings/btitem", @675);
INCLUDE_RODATA("asm/nonmatchings/btitem", @676);
INCLUDE_RODATA("asm/nonmatchings/btitem", @677);
INCLUDE_RODATA("asm/nonmatchings/btitem", @678__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @679__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @680__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @681__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @682__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @683);
INCLUDE_RODATA("asm/nonmatchings/btitem", @684);
INCLUDE_RODATA("asm/nonmatchings/btitem", @685);
INCLUDE_RODATA("asm/nonmatchings/btitem", @686__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @687__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @688__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @689__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @690__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @691__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @692__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @693);
INCLUDE_RODATA("asm/nonmatchings/btitem", @694);
INCLUDE_RODATA("asm/nonmatchings/btitem", @695);
INCLUDE_RODATA("asm/nonmatchings/btitem", @696);
INCLUDE_RODATA("asm/nonmatchings/btitem", @697);
INCLUDE_RODATA("asm/nonmatchings/btitem", @698);
INCLUDE_RODATA("asm/nonmatchings/btitem", @699);
INCLUDE_RODATA("asm/nonmatchings/btitem", @700__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @701__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @702);
INCLUDE_RODATA("asm/nonmatchings/btitem", @703__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @704__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @705);
INCLUDE_RODATA("asm/nonmatchings/btitem", @706);
INCLUDE_RODATA("asm/nonmatchings/btitem", @707__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @708__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @709__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @710);
INCLUDE_RODATA("asm/nonmatchings/btitem", @711);
INCLUDE_RODATA("asm/nonmatchings/btitem", @712);
INCLUDE_RODATA("asm/nonmatchings/btitem", @713);
INCLUDE_RODATA("asm/nonmatchings/btitem", @714__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @715__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @716__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @717__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @718__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @719__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @720__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @721__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @722__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @723__3);
INCLUDE_RODATA("asm/nonmatchings/btitem", @724__2);
INCLUDE_RODATA("asm/nonmatchings/btitem", @725__5);
INCLUDE_RODATA("asm/nonmatchings/btitem", @726__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @727__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @728__5);
INCLUDE_RODATA("asm/nonmatchings/btitem", @729__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @730__5);
INCLUDE_RODATA("asm/nonmatchings/btitem", @731__5);
INCLUDE_RODATA("asm/nonmatchings/btitem", @732__5);
INCLUDE_RODATA("asm/nonmatchings/btitem", @733__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @734__4);
INCLUDE_RODATA("asm/nonmatchings/btitem", @735__3);
/**
 * Runs the escape presentation and reports when it ends.
 *
 * @mangled BtEscape_Loop__Fv
 * @address 0x1D3D40
 * @size 0x18C
 */
#ifdef NON_MATCHING
int BtEscape_Loop() {
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;
    int done = 0;

    switch (escape_sled) {
        case 0:
            if (SndSPSeSyncBG() == 0 && ReadBGSync() == 0) {
                EscapeEffect.LoadPackData2((u_int *) escape_chr, "info.cfg", &BtCashBuffer, 0x1C, &BtCashBuffer, 0);
                EscapeEffect.SetMotion(0, 6);
                EscapeEffect.motion_type.state.time = 10.0f;
                EscapeFlag = 1;
                sceVu0CopyVector(position, CharaMain.pos);
                CharaMain.GetRotation(rotation);
                EscapeEffect.SetPosition(position);
                EscapeEffect.SetRotation(rotation);
                EdFadeInit();
                EdFadeOut(0x78, (0, 0.0f), (0, 0.0f), 0.0f);
                SndSPSePlay(8, -1);
                escape_sled++;
            }
            autoCamTrial();
            break;
        case 1:
            if (EdFadeOutCheck() != 0) {
                done = 1;
            }
            autoCamTrial();
            break;
    }
    return done;
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtEscape_Loop__Fv);
#endif
/**
 * Builds the models of the items in the active slots.
 *
 * @mangled BtSetActiveItemModel__FPUi
 * @address 0x1D3ED0
 * @size 0x1B0
 */
#ifdef NON_MATCHING
void BtSetActiveItemModel(u_int *buffer) {
    char model_path[64];
    char texture_path[64];
    int model_size;
    int texture_size;

    for (int i = 0; i < 3; i++) {
        int item_no = UserStatus->item_pack.quick_item_slot[i];
        if (item_no == -1) {
            continue;
        }
        BtGetItemNamePath(model_path, texture_path, item_no);
        LoadFile(model_path, buffer, &model_size);
        wait_now_loading_vsync();
        model_size = (u_int) (((model_size >> 6) + 1) << 6) >> 2;
        LoadFile(texture_path, &buffer[model_size], &texture_size);
        wait_now_loading_vsync();
        if (activeItem.model[i + 1] != -1) {
            activeItem.models->DeleteModel(activeItem.model[i + 1]);
            activeItem.model[i + 1] = -1;
        }
        if (activeItem.model[i + 1] != -1) {
            activeItem.models->DeleteModel(activeItem.model[i + 1]);
        }
        activeItem.model[i + 1] = activeItem.models->SetCashModel(item_no, buffer, &buffer[model_size], texture_size);
        activeItem.model[i + 5] = 0;
        activeItem.item[i + 1] = item_no;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", BtSetActiveItemModel__FPUi);
#endif

/**
 * Computes the velocity needed to move an object between two points in time.
 *
 * @mangled ParabolicInitialVector__FPfPfPfff
 * @address 0x1D4080
 * @size 0x7C
 */
void ParabolicInitialVector(float *velocity, float *from, float *to, float gravity, float time) {
    velocity[0] = (to[0] - from[0]) / time;
    velocity[1] = (2.0f * (to[1] - from[1]) - time * (gravity * time)) / (2.0f * time);
    velocity[2] = (to[2] - from[2]) / time;
    velocity[3] = 1.0f;
    float negative_one = -1.0f;
    velocity[1] = velocity[1] * negative_one;
}

/**
 * Builds the velocity of a shot fired at the given speed and angles.
 *
 * @mangled setShotVector__FPffff
 * @address 0x1D4100
 * @size 0x98
 */
void setShotVector(float *velocity, float speed, float angle_y, float angle_x) {
    sceVu0FMATRIX rotation;
    sceVu0FMATRIX unit;

    velocity[0] = 0.0f;
    velocity[1] = 0.0f;
    velocity[2] = speed;
    velocity[3] = 1.0f;
    sceVu0UnitMatrix(unit);
    sceVu0RotMatrixX(rotation, unit, angle_x);
    sceVu0RotMatrixY(rotation, rotation, angle_y);
    sceVu0ApplyMatrix(velocity, rotation, velocity);
}

#ifdef NON_MATCHING
void getCharacterVector(float *vector, float pitch) {
    sceVu0FVECTOR forward = {0.0f, 0.0f, 1.0f, 1.0f};
    sceVu0FVECTOR rotation;
    sceVu0FMATRIX matrix;
    sceVu0FMATRIX yaw;
    sceVu0FMATRIX tilt;

    CharaMain.frame->GetRotation(rotation);
    sceVu0UnitMatrix(yaw);
    sceVu0RotMatrixY(yaw, yaw, rotation[1]);
    sceVu0UnitMatrix(tilt);
    sceVu0RotMatrixX(tilt, tilt, pitch);
    sceVu0MulMatrix(matrix, yaw, tilt);
    sceVu0ApplyMatrix(vector, matrix, forward);
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", getCharacterVector__FPff);
#endif
/**
 * Advances a thrown item along its arc.
 *
 * @mangled ItemThrowStep__FPfPf
 * @address 0x1D4260
 * @size 0x2D4
 */
#ifdef NON_MATCHING
int ItemThrowStep(float *position, float *velocity) {
    sceVu0FVECTOR next;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR hit;
    sceVu0FVECTOR normal;

    next[0] = position[0] + velocity[0];
    next[1] = position[1] + velocity[1];
    next[2] = position[2] + velocity[2];
    next[3] = 1.0f;
    velocity[1] -= 0.12f;
    sceVu0Normalize(direction, velocity);
    for (int unit = 0; unit < 16; unit++) {
        for (int i = 0; i < 16; i++) {
            MONSTOR_EFFECT_STATE *effect = &NowMonstorUnit->effect[unit];
            if (effect->timer[i] != 0 && DistVector(effect->position[i], position) <= 1.5f + effect->radius[i]) {
                return 2;
            }
        }
    }
    WorkBuffer__2->used = 0;
    CCPoly *polys = (CCPoly *) WorkBuffer__2->Alloc(2000);
    int found = CheckHit(polys, setCollisionData(NowDngMap, polys, position, 20.0f, 1.5f), position, next, hit, 1, 4);
    if (found >= 0) {
        sceVu0CopyVector(normal, polys[found].normal);
        sceVu0Normalize(normal, normal);
        ReflectionPlane(normal, hit, position, velocity);
        sceVu0CopyVector(position, hit);
        position[0] += 1.3f * normal[0];
        position[1] += 1.3f * normal[1];
        position[2] += 1.3f * normal[2];
        velocity[0] *= 0.4f;
        velocity[1] *= 0.4f;
        velocity[2] *= 0.4f;
        return 1;
    }
    sceVu0CopyVector(position, next);
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/btitem", ItemThrowStep__FPfPf);
#endif
