#include "common.h"

#include <libvu0.h>

#include "btactstatus.hpp"
#include "btitem.hpp"
#include "btmisc.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dngmessageman.hpp"
#include "dngstatusdata.hpp"
#include "dun/gameloop.hpp"
#include "gamepad.hpp"
#include "menu_draw.hpp"
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

/**
 * Computes the quantity represented by an acquired attachment.
 */
int createAttachVolume(int item_no, int dungeon);

INCLUDE_ASM("asm/nonmatchings/btitem", selectChrUnit__Fii);
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
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxBig_Init__Fv);
/**
 * Runs the large treasure chest's presentation and reports when it ends.
 *
 * @mangled BtGetTreasureboxBig_Loop__Fv
 * @address 0x1D1810
 * @size 0x7A8
 */
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxBig_Loop__Fv);
/**
 * Opens the small treasure chest and starts its presentation.
 *
 * @mangled BtGetTreasureboxSmall_Init__Fi
 * @address 0x1D1FC0
 * @size 0x4A0
 */
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxSmall_Init__Fi);
/**
 * Runs the small treasure chest's presentation and reports when it ends.
 *
 * @mangled BtGetTreasureboxSmall_Loop__Fv
 * @address 0x1D2460
 * @size 0x690
 */
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetTreasureboxSmall_Loop__Fv);
/**
 * Starts the short presentation for picking up an Atla.
 *
 * @mangled BtAtraGetShort_Init__Fv
 * @address 0x1D2AF0
 * @size 0x180
 */
INCLUDE_ASM("asm/nonmatchings/btitem", BtAtraGetShort_Init__Fv);
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
INCLUDE_ASM("asm/nonmatchings/btitem", BtAtraGetShort_Loop__Fii);

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
INCLUDE_ASM("asm/nonmatchings/btitem", BtMiniChrSelect_Loop__Fv);
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
INCLUDE_ASM("asm/nonmatchings/btitem", BtGetGateKey_Loop__Fv);
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
INCLUDE_ASM("asm/nonmatchings/btitem", BtEscape_Loop__Fv);
/**
 * Builds the models of the items in the active slots.
 *
 * @mangled BtSetActiveItemModel__FPUi
 * @address 0x1D3ED0
 * @size 0x1B0
 */
INCLUDE_ASM("asm/nonmatchings/btitem", BtSetActiveItemModel__FPUi);

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

INCLUDE_ASM("asm/nonmatchings/btitem", getCharacterVector__FPff);
/**
 * Advances a thrown item along its arc.
 *
 * @mangled ItemThrowStep__FPfPf
 * @address 0x1D4260
 * @size 0x2D4
 */
INCLUDE_ASM("asm/nonmatchings/btitem", ItemThrowStep__FPfPf);
