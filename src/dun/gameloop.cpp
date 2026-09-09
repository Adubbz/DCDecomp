#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 910
#pragma constant_flag 0
#pragma constant_flag_ones 374
#pragma argument_flag_free 3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3609
#pragma argument_flag_free 3610, 3611, 3612, 3613, 3614, 3615, 3616, 3617, 3618, 3619
#pragma argument_flag_free 3620, 3621, 3622, 3623, 3624, 3625, 3626, 3627, 3628, 3629
#pragma argument_flag_free 3630, 3631, 3632, 3633, 3634, 3635, 3636, 3637, 3638, 3639
#pragma argument_flag_free 3640, 3641, 3642, 3643, 3644, 3645, 3646, 3647, 3648, 3649
#pragma argument_flag_free 3650, 3651, 3652, 3653, 3654, 3655, 3656, 3657, 3658, 3659
#pragma argument_flag_free 3660, 3661, 3662, 3663, 3664, 3665, 3666, 3667, 3668, 3669
#pragma argument_flag_free 3670, 3671, 3672, 3673, 3674, 3675, 3676, 3677, 3678, 3679
#pragma argument_flag_free 3680, 3681, 3682, 3683, 3684, 3685, 3686, 3687, 3688, 3689
#pragma argument_flag_free 3690, 3691, 3692, 3693, 3694, 3695, 3696, 3697, 3698, 3699
#pragma argument_flag_free 3700, 3701, 3702, 3703, 3704, 3705, 3706, 3707, 3708, 3709
#pragma argument_flag_free 3710, 3711, 3712, 3713, 3714, 3715, 3716, 3717, 3718, 3719
#pragma argument_flag_free 3720, 3721, 3722, 3723, 3724, 3725, 3726, 3727, 3728, 3729
#pragma argument_flag_free 3730, 3731, 3732, 3733, 3734, 3735, 3736, 3737, 3738, 3739
#pragma argument_flag_free 3740, 3741, 3742, 3743, 3744, 3745, 3746, 3747, 3748, 3749
#pragma argument_flag_free 3750, 3751, 3752, 3753, 3754, 3755, 3756, 3757, 3758, 3759
#pragma argument_flag_free 3760, 3761, 3762, 3763, 3764, 3765, 3766, 3767, 3768, 3769
#pragma argument_flag_free 3770, 3771, 3772, 3773, 3774, 3775, 3776, 3777, 3778, 3779
#pragma argument_flag_free 3780, 3781, 3782, 3783, 3784, 3785, 3786, 3787, 3788, 3789
#pragma argument_flag_free 3790, 3791, 3792, 3793, 3794, 3795, 3796, 3797, 3798, 3799
#pragma argument_flag_free 3800, 3801, 3802, 3803, 3804, 3805, 3806, 3807, 3808, 3809
#pragma argument_flag_free 3810, 3811, 3812, 3813, 3814, 3815, 3816, 3817, 3818, 3819
#pragma argument_flag_free 3820, 3821, 3822, 3823, 3824, 3825, 3826, 3827, 3828, 3829
#pragma argument_flag_free 3830, 3831, 3832, 3833, 3834, 3835, 3836, 3837, 3838, 3839
#pragma argument_flag_free 3840, 3841, 3842, 3843, 3844, 3845, 3846, 3847, 3848, 3849
#pragma argument_flag_free 3850, 3851, 3852, 3853, 3854, 3855, 3856, 3857, 3858, 3859
#pragma argument_flag_free 3860, 3861, 3862, 3863, 3864, 3865, 3866, 3867, 3868, 3869
#pragma argument_flag_free 3870, 3871, 3872, 3873, 3874, 3875, 3876, 3877, 3878, 3879
#pragma argument_flag_free 3880
#pragma argument_flag_ones 154, 451, 493, 573, 574, 575, 591, 592, 593, 594
#pragma argument_flag_ones 1155, 1173, 1174, 1175, 1176, 1239, 1249, 1250, 1285, 1289
#pragma argument_flag_ones 1314, 1318, 1326, 1330, 1339, 1364, 1366, 1411, 1456, 1459
#pragma argument_flag_ones 1460, 1464, 1471, 1473, 1489, 1491, 1505, 1755, 1756, 1810
#pragma argument_flag_ones 1811, 1815, 1816, 1817, 1877, 1880, 1906, 1937, 1988, 2045
#pragma argument_flag_ones 2197, 2243, 2244, 2362, 2411, 2426, 2433, 2444, 2450, 2473
#pragma argument_flag_ones 2474, 2475, 2476, 2477, 2521, 2578, 2581, 2582, 2614, 2624
#pragma argument_flag_ones 2700, 2897, 3024, 3309, 3337, 3513, 3515, 3587, 3589, 3684
#pragma argument_flag_ones 3685, 3687, 3688, 3891, 3911, 3922, 3943, 3946, 3947, 3999
#pragma argument_flag_ones 4058, 4069, 4077, 4097, 4100, 4135, 4142, 4157, 4160, 4185
#pragma argument_flag_ones 4213, 4220, 4234, 4253, 4265, 4269, 4270, 4340, 4346, 4355
#pragma argument_flag_ones 4367, 4393, 4415, 4422, 4429, 4688, 4689, 4690, 4733, 4736
#pragma argument_flag 0

#include "dun/gameloop.hpp"

#include <libvu0.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "btactstatus.hpp"
#include "btmisc.hpp"
#include "btsysscript.hpp"
#include "camera.hpp"
#include "camerafollow.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "collision.hpp"
#include "collisiondata.hpp"
#include "dataalloc2_1.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "dispctrl.hpp"
#include "dngmessageman.hpp"
#include "dngstatusdata.hpp"
#include "dranmapfield.hpp"
#include "dungeoneventman.hpp"
#include "dungeonmap.hpp"
#include "edit.hpp"
#include "editloop3.hpp"
#include "frame.hpp"
#include "frameattr.hpp"
#include "gamepad.hpp"
#include "healeffect.hpp"
#include "hit_machingun_effect.hpp"
#include "hitmark.hpp"
#include "hitvalue.hpp"
#include "itembombeffect.hpp"
#include "itemdata.hpp"
#include "mainitemmodel.hpp"
#include "mathutil.hpp"
#include "menu_draw.hpp"
#include "menu_misc.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "monstorunit.hpp"
#include "motionmodel.hpp"
#include "nowload.hpp"
#include "npcharacter.hpp"
#include "objanime.hpp"
#include "randomitem.hpp"
#include "rect.hpp"
#include "runeffect.hpp"
#include "runscript_opcodes.hpp"
#include "savedata.hpp"
#include "shop_battlemenu.hpp"
#include "shot_effect.hpp"
#include "shot_effect_pack.hpp"
#include "shot_firebar.hpp"
#include "shot_freefuncs.hpp"
#include "snd.hpp"
#include "stealitem.hpp"
#include "texture.hpp"
#include "textureanime.hpp"
#include "userstatus.hpp"
#include "weaponeffect.hpp"
#include "weaponelement.hpp"

/**
 * Defines the life gauge that the locked-on enemy draws above itself.
 */
struct ENEMY_LIFE_GAGE {
    s32 life_max; /**< Specifies the life the enemy has at full health. */
    s32 life;     /**< Specifies the life the enemy has now. */
    s32 x;        /**< Specifies the left edge of the gauge, in screen pixels. */
    s32 y;        /**< Specifies the top edge of the gauge, in screen pixels. */
    s32 on;       /**< Whether an enemy is locked on. */
    s32 draw;     /**< Whether the gauge draws this frame. */
};

STATIC_ASSERT(sizeof(ENEMY_LIFE_GAGE) == 0x18);

/* The life gauge of the enemy the player has locked on to. */
extern "C" ENEMY_LIFE_GAGE EnemyLifeGage;

/* The character that the player controls. */
extern "C" CCharacter CharaMain;

/* The hand that the player's character holds an item out with. */
extern "C" CCharacter CharaHand;

/**
 * Names where the item the player is about to throw will land.
 */
struct BOMB_INFO {
    sceVu0FVECTOR pos; /**< Where the thrown item lands. */
    s32 unk_10;
    s32 unk_14; /**< 1 while the player is still aiming. */
    s32 unk_18; /**< How far through the throw the player is. */
    s32 unk_1C;
};

STATIC_ASSERT(sizeof(BOMB_INFO) == 0x20);

/**
 * Draws a window of debug text over the picture.
 */
class CDebugFont {
public:
    s32 x;      /**< Distance of the left edge from the left of the screen. */
    s32 y;      /**< Distance of the top edge from the top of the screen. */
    s32 width;  /**< Distance from the left edge to the right edge. */
    s32 height; /**< Distance from the top edge to the bottom edge. */
    char *name; /**< Names the texture the window draws with. */
    s32 unk_14;
    s32 length;       /**< Characters the text holds now. */
    char text[0x200]; /**< The text the window draws. */

    /**
     * @mangled Draw__10CDebugFontFv
     * @address 0x13DF40
     * @size 0x59C
     * @unknownret
     */
    void Draw(void);
};

STATIC_ASSERT(sizeof(CDebugFont) == 0x21C);

/**
 * Names what the dungeon event running now is waiting on.
 */
struct BT_EVENT_INFO {
    sceVu0FVECTOR unk_00; /**< Where the event the script runs plays. */
    sceVu0FVECTOR unk_10; /**< Which way that event faces. */
    u8 unk_20[0x4];
    s32 unk_24;
    u8 unk_28[0x4];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    s32 unk_38;
    u8 unk_3C[0x48];
    s32 *floor_result;  /**< Where the floor the player chose is written back. */
    s32 *escape_result; /**< Where the escape answer is written back. */
    s32 unk_8C;
    s32 unk_90;
    s32 unk_94;
    s32 unk_98;
    s32 unk_9C;
    s32 unk_A0;
    s32 unk_A4;
    u8 unk_A8[0x4];
    s32 unk_AC;
    u8 unk_B0[0x4];
    s32 unk_B4;
    s32 unk_B8;
    s32 unk_BC;
};

STATIC_ASSERT(sizeof(BT_EVENT_INFO) == 0xC0);

/* What the dungeon event running now is waiting on. */
extern "C" BT_EVENT_INFO BtEventInfo;

/* The debug message overlay. */
extern "C" CDebugFont CDbgMsg;

/* What the Georama editor is doing. */

/* The models of the items the player is running. */
extern "C" CActiveItemPack activeItem;

/* The effect table each playable character draws its own effects from. */
extern "C" BT_SHOT_EFFECT *MyEffectEntry_Tbl[16];

/* The monsters each floor of each dungeon lays out. */
extern "C" BT_ENEMY_FLOOR *BtEnemyLayoutList[7];

/* The same for the back dungeon. */
extern "C" BT_ENEMY_FLOOR *BtUraEnemyLayoutList[7];

/* Script working memory, one block per monster on the floor. */
extern "C" CDataAlloc2<1> MonstorScriptBuffer[16];

/* One texture animation for every texture the player's model draws. */
extern "C" CTexAnimeData CharaMainTexAnim[64];

/* One texture animation for every monster the game knows. */
extern "C" CTexAnimeData MonsterTexAnim[320];

/* The effect the player's own character shoots. */
extern "C" CSHOT_EFFECT CharaMainEffect;

/* The effect the player's own character breaks things with. */
extern "C" CSHOT_EFFECT CharaMainEffectCrash;

/* The machine gun that Osmond's rapid-fire action shoots. */
extern "C" CSHOT_MACHINGUN OzumondShot;

/* The flame that Osmond's flamethrower action shoots. */
extern "C" CSHOT_FIREBAR OzumondFire;

/* The buffer the player's own effect models load into. */
extern "C" CDataAlloc2<1> WEffectModelBuffer;

/* The buffer the weapon models load into. */
extern "C" CDataAlloc2<1> WeaponModelBuffer;

/* The weapon models the player's character can hold. */
extern "C" CCharacter CrashWeapon;
extern "C" CCharacter DefaultWeapon;
extern "C" CCharacter MainWeapon;

extern void BtGetWeaponNamePath2(char *name, char *path, int chara, int weapon);

/* The buffers the dungeon loads its data into. */
extern "C" CDataAlloc2<1> MainModelBuffer;
extern "C" CDataAlloc2<1> MapModelBuffer;
extern "C" CDataAlloc2<1> CharaModelBuffer;
extern "C" CDataAlloc2<1> MasekiModelBuffer;
extern "C" CDataAlloc2<1> MonstorModelBuffer;
extern "C" CDataAlloc2<1> BtMesBuffer;
extern "C" CDataAlloc2<1> BtSteebMesBuffer;
extern "C" CDataAlloc2<1> BtStartLogoBuffer;
extern "C" CDataAlloc2<1> BtSystemScriptFileBuffer;

/** Provide the dungeon cursor models. */

/** Provide reusable dungeon character effects. */
extern "C" CCharacter NewChangeFx;
extern "C" CCharacter Water_Splash;
extern "C" CCharacter Trap_Circle;
extern "C" CTexAnimeData Trap_Circle_TexAnim[16];

/** Provide the item-opening motion effects. */
extern "C" CMotionModel itemOpenSmallFx;
extern "C" CMotionModel itemOpenBigFx;
extern "C" MOTION_INFO itemOpenSmallFx_info;
extern "C" MOTION_INFO itemOpenBigFx_info;

/** Provide the five Atlamillia effects. */
extern "C" CSHOT_EFFECT MasekiEffect[5];
extern "C" BT_SHOT_EFFECT MyEntryEffect_Maseki00;
extern "C" BT_SHOT_EFFECT MyEntryEffect_Maseki01;
extern "C" BT_SHOT_EFFECT MyEntryEffect_Maseki02;
extern "C" BT_SHOT_EFFECT MyEntryEffect_Maseki03;
extern "C" BT_SHOT_EFFECT MyEntryEffect_Maseki04;

/* The buffer the game keeps every loaded motion in; main owns it. */
extern "C" CDataAlloc2<1> MotionData;

/* The textures the loading screen itself draws with. */
extern "C" LOADTEXTURE_INFO texdata2[];

/* Every texture the dungeon loads on its way in, and the block each goes to. */
extern "C" LOADTEXTURE_INFO2 texdata__2[];

/* The texture manager the dungeon loads its textures through. */
extern "C" CTextureManager TexManager;

/* The buffer a pack file is read into. */
extern "C" unsigned int *read_buffer;

/* The colours the enemy life gauge draws its border with. */
extern "C" spRGBA ELifeB1;
extern "C" spRGBA ELifeB2;

/* The colour the enemy life gauge draws the life it has lost with. */
extern "C" spRGBA ELifeN1;

/* The colours the enemy life gauge draws the life it has left with. */
extern "C" spRGBA ELife1;
extern "C" spRGBA ELife2;

/* Where Ruby's shot starts, and the way it flies. */
extern "C" sceVu0FVECTOR ruby_effect_pos;
extern "C" sceVu0FVECTOR ruby_effect_vec;

/* The marks that a weapon throws off as it breaks. */
extern "C" CHitMark WeaponCrashEffect;

/* The trail that the player's weapon leaves as it swings. */
extern "C" CWeaponEffect CWeaponFx;

/* The weapon each character starts with. */
extern "C" s32 defWeapon__6[];

/**
 * How far one character reaches when the game picks what to lock on to.
 */
static inline float CharaRangeRate(CUserStatus *status) {
    float range_rate[6] = {1.2f, 1.4f, 1.1f, 1.5f, 1.0f, 1.8f};

    return range_rate[status->cur_chara];
}

/**
 * How tall one character stands, and how wide their collision reaches.
 */
static inline float CharaHeight(CUserStatus *status) {
    float chara_height[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};

    return chara_height[status->cur_chara];
}

/* The colour each weapon element gives that trail. */
extern "C" u8 wep_rgb[][3];

/* How near the camera is allowed to come to what it follows. */
extern "C" float camera_near_dist__2;

/* The dungeon floor that the player is on. */
extern "C" CDungeonMap MainDungeonMap;

/* The events of the floor that the player is on. */
extern "C" CDungeonEventMan DngEventMan;

/* The items lying on the floor that the player is on. */
extern "C" CRandomItem MainRandomItem;

/* The items lying on the matching floor of the back dungeon. */
extern "C" CRandomItem SubRandomItem;

/* The back dungeon's floor. */
extern "C" CDungeonMap UraDungeonMap;

/* The events of the back dungeon's floor. */
extern "C" CDungeonEventMan UraEventMan;

/* The floor the dungeon is drawing. */

/* The messages the dungeon shows over the picture. */
extern "C" CDngMessageMan DngMessMan;

/* The alpha of each of the three floor-title logos. */
extern "C" s32 rogoAlphaA[3];

/* How long the floor title has been on screen, in frames. */
extern "C" s32 startCnt2;

/* Which character the mini character menu has the cursor on. */
extern "C" s32 BtMiniChrSelectNo;

/* The characters that walk the dungeon alongside the player. */
extern "C" CNPCharacter NPCUnit[6];

/* The effect that a short Atlamillia use lights the player with. */
extern "C" CCharacter shortAtraEffect;

/* Whether that effect is running, and how bright it is. */

/* The colour that a status ailment tints the player's model with. */
extern "C" float StatusColor[3];

/* The marks that the hits the player took have left. */
extern "C" CHitPointMark MyHitPointMark[16];

/* The way the last blow throws the player. */
extern "C" sceVu0FVECTOR blowVelo;

/* How fast the player is being thrown. */
extern "C" sceVu0FVECTOR velo__2;

/* What the debug menu is doing to the player. */
extern "C" s32 DebugStatus[21];

/* The effect that plays as the player escapes the dungeon. */
extern "C" CCharacter EscapeEffect;

/* The countdown that drains a running item. */
extern "C" CMenuItemStep ItemVolumeStep;

/* The message window the dungeon draws over the picture. */
extern "C" ClsMes DngMesStb;

/* The object animations the floor plays, and how many it has. */
extern "C" OBJ_ANIME_SEQ FrameObjAnim[48];
extern "C" s32 FrameObjAnimCnt;

/* The element trails the player's weapon leaves. */
extern "C" CWeaponElement CWeaponElFx[4];

/* The damage numbers the dungeon draws. */
extern "C" CHitValue HitValue[32];

/* The models of the items lying on the floor. */
extern "C" CMainItemModel mainItemModel;

/* The marks the dungeon throws off a hit. */
extern "C" CHitMark HitMark[16];
extern "C" CHitPointMark HitPointMark[16];

/* The models an opened treasure box shows. */
extern "C" CMotionModel itemOpenSmall;
extern "C" CMotionModel itemOpenBig;

/* The item that a monster stole. */
extern "C" CStealItem StealItem;

/* The bombs the player has thrown. */
extern "C" CItemBombEffect CBomb__2[3];

/* The effect Osmond's machine gun leaves where it hits. */
extern "C" CHIT_MACHINGUN_EFFECT OzumondShotEffect;

/* The effect that heals the player. */
extern "C" CHealEffect HealEffect;

/* Whether each treasure-box opening effect is playing. */

/* The buffer the camera test builds its polygon list in. */
extern "C" CDataAlloc2<1> *WorkBuffer__2;

/* Where the camera looks, relative to what it follows. */
extern "C" sceVu0FVECTOR ref_off;

/* Distances the camera keeps from what it follows. */
extern "C" float camera_up_near_dist;
extern "C" float camera_far_dist__2;

/* Where the item the player is about to throw will land. */
extern "C" BOMB_INFO BombInfo;

/* How square on to the player each monster of the floor stands. */
extern "C" float MonstorPicupInner[36];

/* The colour the ambient-colour animation drives the player's model to. */
extern "C" float unitAmbientAnime_rgb[3];

/* The name of the texture that the floor number draws with. */
extern "C" char floor_name[32];

/* The map info file each dungeon loads its floors from. */
extern "C" char *MapInfoNameArea[7];

/* The VU1 program that the loading screen draws through. */
extern "C" char Vu_prog0f[];

/* Which entry the main menu has the cursor on. */
extern "C" s32 main_select_menu_no;

/**
 * Names what the dungeon hands the Georama editor to follow.
 */
struct GAME_ENV {
    CFrame *frame;   /**< Frame that the editor follows. */
    CCamera *camera; /**< Camera that the editor draws through. */
};

/* The camera that every field draws through. */
extern CCamera *NowCameraBase;

/* Where the right stick is pushing the camera. */
extern "C" sceVu0FVECTOR velo2;

/* How fast the player fell the frame before. */
extern "C" sceVu0FVECTOR veloOld;

/* How much faster a boost makes the player run. */
extern "C" float run_speed__2;

/* Where the camera stood before the player looked through their own eyes. */

/* How long the dead screen stays up, and how long it waits first, in frames. */

/* Which character the menu had the cursor on when it opened. */
extern "C" s32 oldUnitNow;

/* Whether the menu asked to leave the floor. */
extern "C" s32 MenuMapJumpMode;

/* How long each of the three floor-title logos stays at full brightness. */
extern "C" s32 rogoAlphaW[3];

/* The buffer a dungeon event script runs out of. */
extern "C" CDataAlloc2<1> BtCashBuffer;

/* Whether the message board draws over the picture. */
extern "C" s32 MesAbsDrawOff;

/**
 * Tells how far the renderer draws, and how it fogs what it draws.
 *
 * @mangled MGSetRenderInfo__Ffff
 */
void MGSetRenderInfo(float far_dist, float near_dist, float max_z);

/**
 * Turns the stick into the motion the player's character walks with.
 *
 * @mangled keyCtrl__FffP11MOTION_INFO
 */
int keyCtrl(float x, float y, MOTION_INFO *motion);

/**
 * Turns a model towards a heading, a step at a time.
 *
 * @mangled unitRotation__FP9CFrameVu1f
 */
float unitRotation(CFrameVu1 *frame, float heading);

/**
 * Puts one system message on the screen.
 *
 * @mangled SetSystemMes__FiiiiPiPi
 */
void SetSystemMes(int mes_no, int frames, int x, int y, int *result, int *unk);

/**
 * Tells the player that only Toan can take an atla.
 *
 * @mangled NotGetAtraMes__Fii
 */
void NotGetAtraMes(int chara, int frames);

/**
 * Tells the player that a character has died.
 *
 * @mangled DeadMes__Fii
 */
void DeadMes(int chara, int frames);

/**
 * Tells the player that the whole party has died.
 *
 * @mangled AllDeadMes__Fi
 */
void AllDeadMes(int frames);

/**
 * Starts and stops the clock that counts how long the game has been played.
 *
 * @mangled PlayTimeCountFlag__Fi
 */
void PlayTimeCountFlag(int on);

/**
 * Tells whether the trial disc has run out of dungeon.
 *
 * @mangled CheckTrialEnd__Fv
 */
int CheckTrialEnd(void);

/**
 * Writes one atla back into the save data.
 *
 * @mangled getAtraToSaveData__FiiP9CSaveDataii
 */
void getAtraToSaveData(int atra, int atra_no, CSaveData *save, int dungeon, int floor);

/**
 * Runs the debug information overlay and gives back what the player chose.
 *
 * @mangled DebugInfomationIF__Fv
 */
int DebugInfomationIF(void);

/**
 * Puts every sound effect sequence the dungeon is playing back to silence.
 *
 * @mangled SndSeSeqAllStop__Fv
 */
void SndSeSeqAllStop(void);

/**
 * @mangled SndSPSePlay__Fii
 */
void SndSPSePlay(int se_no, int voice);

/**
 * Starts the mini item menu, and steps it.
 *
 * @mangled BtMiniItemSelect__Fv
 */
void BtMiniItemSelect(void);

/**
 * @mangled BtMiniItemSelect_Loop__Fv
 */
int BtMiniItemSelect_Loop(void);

/**
 * Starts the mini character menu.
 *
 * @mangled BtMiniChrSelect_Init__Fi
 */
void BtMiniChrSelect_Init(int dead);

/**
 * @mangled BtMiniChrSelect_Loop__Fv
 */
int BtMiniChrSelect_Loop(void);

/**
 * Starts the escape menu.
 *
 * @mangled BtEscape_Init__Fv
 */
void BtEscape_Init(void);

/**
 * @mangled BtEscape_Loop__Fv
 */
int BtEscape_Loop(void);

/**
 * Starts the large treasure box opening.
 *
 * @mangled BtGetTreasureboxBig_Init__Fv
 */
void BtGetTreasureboxBig_Init(void);

/**
 * @mangled BtGetTreasureboxBig_Loop__Fv
 */
int BtGetTreasureboxBig_Loop(void);

/**
 * Starts the small treasure box opening.
 *
 * @mangled BtGetTreasureboxSmall_Init__Fi
 */
void BtGetTreasureboxSmall_Init(int dungeon);

/**
 * @mangled BtGetTreasureboxSmall_Loop__Fv
 */
int BtGetTreasureboxSmall_Loop(void);

/**
 * Starts the short atla pickup.
 *
 * @mangled BtAtraGetShort_Init__Fv
 */
void BtAtraGetShort_Init(void);

/**
 * @mangled BtAtraGetShort_Loop__Fii
 */
int BtAtraGetShort_Loop(int dungeon, int floor);

/**
 * Starts the gate key pickup.
 *
 * @mangled BtGetGateKey_Init__Fi
 */
void BtGetGateKey_Init(int item_no);

/**
 * @mangled BtGetGateKey_Loop__Fv
 */
int BtGetGateKey_Loop(void);

/**
 * Starts the attachment pickup.
 *
 * @mangled BtGetAttach_Init__Fii
 */
void BtGetAttach_Init(int dungeon, int item_no);

/**
 * @mangled BtGetAttach_Loop__Fv
 */
int BtGetAttach_Loop(void);

/**
 * Plays the action that each character fires with the action button.
 *
 * @mangled ToanKey_On__Fv
 */
void ToanKey_On(void);

/**
 * @mangled ToanKey_Play__Fv
 */
void ToanKey_Play(void);

/**
 * @mangled GoroKey_On__Fv
 */
void GoroKey_On(void);

/**
 * @mangled GoroKey_Play__Fv
 */
void GoroKey_Play(void);

/**
 * @mangled UngagaKey_On__Fv
 */
void UngagaKey_On(void);

/**
 * @mangled UngagaKey_Play__Fv
 */
void UngagaKey_Play(void);

/**
 * Tells whether the item in a running slot can be used now.
 *
 * @mangled checkItemUsed__Fi
 */
int checkItemUsed(int slot);

/**
 * Runs the Georama editor's event playback and gives back whether it is done.
 *
 * @mangled EdEventMode__FP13CCameraFollowi
 */
int EdEventMode(CCameraFollow *camera, int unk);

extern void MapJump(int map_no, int event_no);

/* The lighting the dungeon draws the field and the models under. */
extern "C" sceVu0FMATRIX main_light;
extern "C" sceVu0FMATRIX main_lightcolor;
extern "C" sceVu0FVECTOR main_ambientlight;
extern "C" sceVu0FMATRIX sub_light;
extern "C" sceVu0FMATRIX sub_lightcolor;
extern "C" sceVu0FVECTOR sub_ambientlight;

/* The lighting every field starts from. */
extern "C" sceVu0FMATRIX ZeroMatrix;
extern "C" sceVu0FMATRIX def_lightcolor;
extern "C" sceVu0FVECTOR def_ambientlight;

/* More buffers the dungeon loads its data into. */
extern "C" CDataAlloc2<1> TextureData;
extern "C" CDataAlloc2<1> BtScriptWorkBuffer;
extern "C" CDataAlloc2<1> BtItemCashArea[6];

/* The cameras the dungeon draws through. */
extern "C" CCameraFollow MainCamera__4;
extern "C" CCameraFollow SubCamera;

/* The texture animations every dungeon texture runs. */
extern "C" CTextureAnime BtTexAnime;
extern "C" CTexAnimeData BtTexAnimeData[96];

/**
 * Names the drainage fields the dungeon draws, and what each one is doing.
 */
struct DRAN_MAP_FIELD_SET {
    CDranMapField field[12]; /**< The model each field draws. */
    s32 unk_D440[12];
    s32 unk_D470[12];
    s32 unk_D4A0;
    s32 unk_D4A4;
    u8 unk_D4A8[8];
};

STATIC_ASSERT(sizeof(DRAN_MAP_FIELD_SET) == 0xD4B0);

/* The drainage fields the dungeon draws. */
extern "C" DRAN_MAP_FIELD_SET DranMapField;

/* The collisions of the floor the player is on. */
extern "C" CCollisionData CColData;

/* The shots the player's character has in the air. */
extern "C" CSHOT ShotData;

/* The shot effects the dungeon can run. */
extern "C" CSHOT_EFFECT_PACK ShotEffect;

/* The shock wave the dungeon can run. */
extern "C" CShockWave ShockWave;

/* The monsters of the floor that the player is on. */
extern "C" CMonstorUnit MainMonstorUnit;

/* The weapon that the player has equipped. */
extern "C" WEAPON_HAVE WeaponHave;

/* The fade the dungeon draws over the picture. */
extern "C" CDispCtrl DispFade__3;

/* The message windows the dungeon draws over the picture. */
extern "C" ClsMes DngMes1;
extern "C" ClsMes DngMes2;
extern "C" ClsMes BtEventMes0;
extern "C" ClsMes BtEventMes1;

/* The texture each message window builds itself in. */
extern "C" u8 MesWinTexBuff_01[0x100];
extern "C" u8 MesWinTexBuff_02[0x100];
extern "C" u8 MesWinTexBuff_11[0x100];

/* The system messages every message window shares. */
extern short *SystemMes;

/* The debug text window the dungeon draws. */
extern "C" CDebugFont DbgMsg;

/* The textures the dungeon draws its own furniture with. */

/* Which language the disc was pressed for. */
extern "C" s32 LanguageCode;

/* The colour the frame is cleared to, on the front and the back floors. */

/* The colour the fog draws, on the front and the back floors. */
extern "C" u8 main_fogColor[3];
extern "C" u8 sub_fogColor[3];

/* How far the fog reaches and how it thickens, on each of those floors. */
extern "C" float main_fogRate[4];
extern "C" float sub_fogRate[4];

/* The message the dungeon drew last, so a repeat does not show twice. */

/* How far the camera is allowed to pull back. */
extern "C" s32 camera_dist_mode__3;

/* Whether the camera is moving itself, and how long it has been. */

/* Which event the dungeon is showing a marker for. */

/* Whether the player picked up a gate key this floor. */
extern "C" s32 gateItemFlag;

/* Whether the dungeon message window has to be laid out again. */
extern "C" s32 Mes1MakeFlg;
extern "C" s32 Mes2MakeFlg;

/* Where the marker over an event stands. */
extern "C" sceVu0FVECTOR iventPos;

/* The dust the player kicks up as they run. */
extern "C" CRunEffect CRunFx__2;

/* The register that names where the depth buffer lives. */
extern "C" sceGsZbuf mgZBuffer;

/* The register that names how the renderer blends what it draws. */
extern "C" sceGsAlpha mgAlpha;

/**
 * @mangled LoadData__Fv__3
 * @address 0x1DBA930
 * @size 0x6A0
 * @note disambiguated by disassembler ("__3" suffix); real retail name has no suffix
 */
void LoadData__3(void);

/**
 * Hands one allocator the block of memory it hands out.
 *
 * @mangled SetDataBuffer__FP14CDataAlloc2_1_i
 */
void SetDataBuffer(CDataAlloc2<1> *buffer, int blocks);

/**
 * Puts every allocator back to the start of the heap.
 *
 * @mangled InitializeDataBuffer__Fv
 */
void InitializeDataBuffer(void);

/**
 * Splits the read buffer between the packet builder and the file reader.
 *
 * @mangled SetPacketReadBuffer__Fii
 */
void SetPacketReadBuffer(int packet_size, int read_size);

/**
 * Takes every system message off the screen.
 *
 * @mangled ClearSystemMes__Fv
 */
void ClearSystemMes(void);

/**
 * Enters one colour into the font palette and returns the entry it took.
 *
 * @mangled Color2Clut__FUi
 */
unsigned int Color2Clut(unsigned int colour);

/**
 * Reads the models of the items the player can run out of a pack file.
 *
 * @mangled BtSetActiveItemModel__FPUi
 */
void BtSetActiveItemModel(unsigned int *pack);

/**
 * Forgets every gate key the player carried into the dungeon.
 *
 * @mangled ClearGateKeyStack__Fv
 */
void ClearGateKeyStack(void);

/**
 * Hands the sound driver the buffer it reads its banks through.
 *
 * @mangled SndSetReadBuffer__FPUi
 */
void SndSetReadBuffer(unsigned int *buffer);

/**
 * @mangled SndBgmLoad__Fi
 */
void SndBgmLoad(int bgm_no);

/**
 * @mangled SndBgmPlay__Fi
 */
void SndBgmPlay(int bgm_no);

/**
 * @mangled SndSoundLoad__Fi
 */
void SndSoundLoad(int bank_no);

/**
 * @mangled SndAmbientPlay__Fi
 */
void SndAmbientPlay(int ambient_no);

/**
 * @mangled SndAmbientSetVol__Fi
 */
void SndAmbientSetVol(int volume);

/**
 * Puts the battle music back to the start.
 *
 * @mangled BtBattleMusic_Init__Fv
 */
void BtBattleMusic_Init(void);

/**
 * Sets how quickly one of the blend counters runs.
 *
 * @mangled initBlendCnt__Fif
 */
void initBlendCnt(int counter, float speed);

/**
 * Builds the list of Atlamillia the dungeon lays out.
 *
 * @mangled BtAtraListMake__Fi
 */
void BtAtraListMake(int dungeon);

/**
 * Puts the debug information overlay back to the start.
 *
 * @mangled DebugInfomationInit__Fv
 */
void DebugInfomationInit(void);

/**
 * Hands the Georama editor the window it prints its debug text into.
 *
 * @mangled EdDSetFont__FP10CDebugFont
 */
void EdDSetFont(CDebugFont *font);

/**
 * @mangled LoadData__Fv__3
 * @address 0x1DBA930
 * @size 0x6A0
 * @unknownret
 * @note disambiguated by disassembler ("__3" suffix); real retail name has no suffix
 */
static void LoadData(void);

static void CameraAutoMove(CCameraFollow *camera, CCPoly *poly, float *position, float from, float to);

/* The overlay's own small data, in the order retail's link lays it out. */

/* What the dungeon hands the Georama editor to follow. */
GAME_ENV GameEnv;

/* The player's dungeon progress and party. */
CUserStatus *UserStatus;

/* How long the dungeon has been waiting for the player, in frames. */
s32 timeOutCount;
s32 BtRubyDoorKey;

/* Whether the debug overlay draws. */
s32 BtDebugFlag;

/* Whether the game is playing itself for the attract loop. */
s32 autoDemo;

/* Whether the player has finished every floor of the dungeon. */
s32 BtAllClear;
s32 oldMsgNo;
s32 oldMsgNo2;

/* Polygons the step test has picked up this frame. */
s32 colPolyNum;

/* Whether the player is pressing the button that fires an action. */
s32 PadInput_OK;

/* Which button fires an action and which cancels one. */
s32 PadInput_NO;

/* The shot effect Ruby's charge is running, or -1 for none. */
s32 ruby_effect_id;

/* The camera that the dungeon draws through. */
CCameraFollow *NowCamera__3;

/* The heading the eye camera looks along. */
float viewAngleH__2;

/* The pitch the eye camera looks along. */
float viewAngleV__2;

/* Which way the player is looking. */
s32 viewMode__2;
s32 faceEyeCount;
s32 cameraAuto;

/* Whether the camera was moving itself before that. */
s32 cameraAutoOld;

/* Whether the player is in the back dungeon rather than the main one. */
s32 BtUraDongeon;

/** Provides the current dungeon map. */
CDungeonMap *NowDngMap;

/* The field that the drainage map draws. */
CDranMapField *NowDranMapField;

/* The events of the floor the dungeon is drawing. */
CDungeonEventMan *NowEventMan;
u8 main_bgColor[3];
u8 sub_bgColor[3];

/* Which lighting the field draws under. */
s32 lightingMode;

/* The monsters of the floor that the player is on. */
CMonstorUnit *NowMonstorUnit;

/* Whether an effect is held over from the floor the player came from. */
s32 CEffectHold;

/* Whether the effects are hidden this frame. */
s32 CEffectHyde;

/* Whether a monster is held over from the floor the player came from. */
s32 CMonUnitHold;

/* Whether the monsters are hidden this frame. */
s32 CMonUnitHyde;

/* Whether the player's character holds an item out. */
s32 CharaMainHandViewFlag;

/* Whether the monsters draw this frame. */
s32 MonstorViewFlag;

/* The effect the player's character is shooting now. */
CSHOT_EFFECT *NowMainEffect;

/* The model of the weapon that the player has equipped. */
CCharacter *NowWeapon;

/* The weapon that the player has equipped. */
WEAPON_HAVE *NowWeaponHave;

/* The items lying on the floor the dungeon is drawing. */
CRandomItem *RandomItem;

/** Provides the model used when an item is stolen. */
CFrameVu1 *StealModel;

/* The frame that the player's model hangs off. */
CFrameVu1 *CharaFrame;

/* Whether the water splash is playing. */
s32 Water_Splash_actFlag;

/* Whether the player is escaping the dungeon. */
s32 EscapeFlag;

/* Whether the floor title is on screen. */
s32 rogoSwitch2;

/* Where the floor title stood before the menu took the screen. */
s32 oldRogoY3;

/* The vertical position of the floor title, in screen pixels. */
s32 rogoY3;

/* Whether the character-change effect is playing. */
s32 NewChangeFxFlag;

/* Which short Atlamillia use is running. */
s32 atraShortGetType;
float atraGetStatusRate__2;
s32 atraGetStatus;

/* Whether the Atlamillia message board is up. */
s32 atraGetMsgBord;
s32 atraGetMsgBordRate;
s32 shortAtraEffectPtr;
s32 itemNormalScale;
s32 itemOpenSmallFlag;
s32 itemOpenItemMds;
s32 itemOpenItemImg;
s32 itemOpenItemChr;

/* The model the item a gate holds draws with. */
CFrame *itemBoxModel;
s32 itemWeponScale;
s32 itemOpenBigFlag;

/* How long the dungeon has waited before it opens the menu, in frames. */
s32 battleMenuWait;

/* Which item the mini item menu has the cursor on. */
s32 miniItemSelNo;

/* Which of the dungeon's loops runs this frame. */
s32 BtGameModeFlag;

/* Whether the dungeon draws anything at all this frame. */
s32 BtAllDrawFlag;

/* Whether the models hold their step this frame. */
s32 driveStepHold;

/* Whether the picture is being captured this frame. */
s32 frameCaputer;

/* Whether the player's model skips interpolation on its next drive step. */
s32 driveNoInterpolate;

/* Which character the player is walking as. */
s32 nowUnitNow;
CFrame *cursorFrame;
CFrame *bombCursorFrame;
CFrame *bicCursorFrame;

/* Whether the lock-on cursor draws. */
s32 lockOnTargetDraw;

/* Which monster is locked on, or -1 for none. */
s32 lockOnTargetNo;

/* Whether an enemy is locked on. */
s32 lockOnTargetFlag;

/* Which way the player is shifting the lock-on cursor, or -1 for neither. */
s32 targetCursorShiftNo;

/* How many monsters the player could lock on to. */
s32 targetCursorShiftRot;

/* The floor the player chose. */
s32 selectMapNo;

/* Which of the running items the mini item menu has the cursor on. */
s32 itemNowSel;

/* Whether the player has the map of this floor equipped. */
s32 BtEquipMap;

/* Whether the player has a sun stone equipped. */
s32 BtEquipMasuisyou;
s32 iventInfo;
s32 iventMarker;

/* Which event the player is standing on, or -1 for none. */
s32 iventActive;

/* Whether the mini-map draws; SetMIniMapStatus takes it away and gives it back. */
s32 infoMap;

/* What the mini-map drew before SetMIniMapStatus took it away. */
s32 infoMapOld;

/* How hard the player is pushing the stick. */
float stickVector;

/* How hard the player is pushing the right stick. */
float stickVector2;

/* Whether the player is running on a speed boost. */
s32 BtBySpeedFlag;

/* Whether the player asked to leave through the menu. */
s32 exitMenuFlag;

/* Whether the item list the menu caches is still good. */
s32 BtItemListCashFlag;

/* Which item that event holds, or -1 for none. */
s32 BtEventItemNo;

/* The damage numbers the dungeon draws. */
CHitValue *NowHitValue;

/* The shots the player's character has in the air. */
CSHOT *NowShotData;

/* The shot effects the dungeon has running. */
CSHOT_EFFECT_PACK *NowShotEffect;

/* The effect data Osmond's default weapon shoots. */
unsigned int *ozumond_default_effect;

/* The collisions the dungeon tests against. */
CCollisionData *NowColData;

/* The bombs the dungeon has running. */
CItemBombEffect *NowBombEffect;

/* The shock wave the dungeon has running. */
CShockWave *NowShockWave;

/* What the game is doing now. */
s32 gameTask;

/* Why the dungeon is being left, or zero while the player is still in it. */
s32 existFlag;

/* Whether the player is leaving the trial dungeon. */
s32 tryalExit;
s32 DeadKeyWait;
s32 DeadKeyStartWait;
s32 BtEventData;

/* Where the pack file the dungeon read last went. */
unsigned int *old_read_buffer;

/* Which dungeon event is playing, or zero while the player has control. */
s32 BtEventMode;

/* The texture that the floor number draws with. */
CTexture *TEX_Floor1;
CTexture *TEX_WepGage;
CTexture *TEX_Stayframe;
CTexture *TEX_Shadow;

/* The texture a dropped pile of gold draws with. */
CTexture *GoldTex;

/* How long the camera waits before it moves itself, in frames. */
s32 defCameraWait;

/* Whether the monster names are hidden. */
s32 MonstorNameOff;

INCLUDE_ASM("asm/nonmatchings/dun/gameloop", _dun_text_start);

INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @617__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @618__4);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @619__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @620__5);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @621__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @622__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @623__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @624__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @625__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @626__8);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @627__8);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @628__8);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @629__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @630__9);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @631__8);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @632__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @633__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @634__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @635__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @636__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @637__5);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @638__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @639__9);

void LoadBaseTexture(void) {
    LOADTEXTURE_INFO2 info[97];
    int size;
    int i;
    char *name;

    sprintf(texdata__2[2].name, "gatekey0%d.img", selectMapNo + 1);

    unsigned int *pack = read_buffer;

    LoadFile("dun/pack/teximg2.pac", pack, NULL);
    wait_now_loading_vsync();

    i = 0;
    while ((name = texdata__2[i].name) != NULL) {
        // A name that starts with '#' asks the manager for a blank page of
        // that size rather than for a file inside the pack.
        if (name[0] == '#') {
            info[i].name = name;
        } else {
            u_int *found = GetPackFile(read_buffer, name, &size);

            if (found != NULL) {
                info[i].name = (char *) found;
            } else {
                printf("Error::Pack->FileNotFound [%d]%s!!\n", i, name);
                exit__2(-1);
            }
        }
        info[i].block_no = texdata__2[i].block_no;
        i++;
    }
    info[i].name = NULL;
    TexManager.LoadTextureBlock(-1, info);
}

int LoadTempTexture(char **files, int block, char *buffer) {
    LOADTEXTURE_INFO2 info[7] = {0};
    int i;
    int total;
    int size;

    i = 0;
    total = 0;
    while (files[i] != NULL) {
        LoadFile(files[i], buffer, &size);
        wait_now_loading_vsync();
        total += size;
        info[i].block_no = block;
        info[i].name = buffer;
        buffer += ((size >> 6) + 1) << 6;
        i++;
    }

    TexManager.DeleteTextureBlock(block);
    TexManager.LoadTextureBlockEX(block, info);
    return total;
}

void SetTempTexture(int block, char *name) {
    LOADTEXTURE_INFO2 info[2] = {0};

    info[0].block_no = block;
    info[0].name = name;
    TexManager.DeleteTextureBlock(block);
    TexManager.LoadTextureBlockEX(block, info);
}

void MemoryMapDump(void) {
    printf("MainVisualData  \t%d/%d\n", MainModelBuffer.used, 0x9470);
    printf("MotionData      \t%d/%d\n", MotionData.used, 10000);
    printf("CharaModelBuffer\t%d/%d\n", CharaModelBuffer.used, 0x33450);
    printf("MasekiModelBuffer\t%d/%d\n", MasekiModelBuffer.used, 0xFDE8);
    printf("MapVisualData   \t%d/%d\n", MapModelBuffer.used, 0xA7F80);
    s32 monster_size = MonstorModelBuffer.size;

    printf("MonstorModelBuffer\t%d/%d\n", MonstorModelBuffer.used, monster_size);
    printf("SystemScriptBuffer\t%d/%d\n", BtSystemScriptFileBuffer.used, 0x88B8);
    printf("StartLogoBuffer\t    %d/%d\n", BtStartLogoBuffer.used, 5000);
    printf("BtMesBuffer\t        %d/%d\n", BtMesBuffer.used, 0x2904);
    printf("BtSteebMesBuffer\t%d/%d\n", BtSteebMesBuffer.used, 0xDAC);
    TexManager.print_buff_info();
}

void GameInit(void) {
    int size;
    char name[64];
    char gate_name[32];
    short *mes;

    BtDebugFlag = 0;
    exitMenuFlag = 0;
    BtAllDrawFlag = 0;
    selectMapNo = main_select_menu_no;
    UserStatus = (CUserStatus *) SaveData->GetDngStatus();
    UserStatus->Init();
    if (BtEventInfo.unk_B8 != 1) {
        int i;
        CUserStatus *status = UserStatus;

        for (i = 0; i < 6; i++) {
            status->hp[i] = status->max_hp[i];
            status->unk_42C8[i] = 0;
            status->unk_42E0[i] = 0;
        }
        status->res_limit_zone_current = -1;
    }
    int map = selectMapNo;
    CUserStatus *status = UserStatus;

    status->cur_georama = map;

    sceVu0CopyMatrix(main_light, ZeroMatrix);
    sceVu0CopyMatrix(main_lightcolor, def_lightcolor);
    sceVu0CopyVector(main_ambientlight, def_ambientlight);
    sceVu0CopyMatrix(sub_light, ZeroMatrix);
    sceVu0CopyMatrix(sub_lightcolor, def_lightcolor);
    sceVu0CopyVector(sub_ambientlight, def_ambientlight);

    InitializeDataBuffer();
    SetDataBuffer(&MainModelBuffer, 0x9470);
    SetDataBuffer(&MotionData, 10000);
    SetDataBuffer(&CharaModelBuffer, 0x33450);
    SetDataBuffer(&MasekiModelBuffer, 0xFDE8);
    SetDataBuffer(&TextureData, 0xB3B0);
    SetDataBuffer(&BtSystemScriptFileBuffer, 0x88B8);
    SetDataBuffer(&BtMesBuffer, 0x2904);
    SetDataBuffer(&BtSteebMesBuffer, 0xDAC);
    SetDataBuffer(&BtStartLogoBuffer, 5000);
    SetDataBuffer(&BtScriptWorkBuffer, 100000);
    for (int i = 0; i < 6; i++) {
        SetDataBuffer(&BtItemCashArea[i], 2501);
    }
    for (int i = 0; i < 16; i++) {
        SetDataBuffer(&MonstorScriptBuffer[i], 1875);
    }
    SetDataBuffer(&MapModelBuffer, 0xA7F80);
    SetPacketReadBuffer(0x9344, 0x445C0);
    old_read_buffer = read_buffer;

    MainCamera__4.SetDistance(60.0f);
    MainCamera__4.SetHeight(0.0f);
    MainCamera__4.SetFollow(0.0f, 0.0f, 0.0f);
    MainCamera__4.Step(10);
    MainCamera__4.SetSpeed(8.0f);
    MainCamera__4.FollowOn();
    SubCamera.SetDistance(60.0f);
    SubCamera.SetHeight(0.0f);
    SubCamera.SetFollow(0.0f, 0.0f, 0.0f);
    SubCamera.Step(10);
    SubCamera.SetSpeed(8.0f);
    SubCamera.FollowOn();
    NowCamera__3 = &MainCamera__4;

    NowDngMap = &MainDungeonMap;
    NowDngMap->initalize();
    BtTexAnime.Initialize(BtTexAnimeData, 96);
    for (int i = 0; i < 64; i++) {
        DUNGEON_EVENT_SLOT *slot = &DngEventMan.slot[i];

        slot->unk_00 = 0;
        slot->unk_20 = -1;
        slot->unk_1C = -1;
        slot->unk_34 = 0;
        slot->unk_3C = 0;
    }
    for (int i = 0; i < 96; i++) {
        CDungeonEventData *state = &DngEventMan.event[i];

        state->event = NULL;
        state->unk_34 = 0;
        state->unk_38 = 0;
        state->unk_30 = 0;
        state->chara_done = -1;
    }
    NowEventMan = &DngEventMan;
    lightingMode = 0;
    for (int i = 0; i < 12; i++) {
        CDranMapField *field = &DranMapField.field[i];

        field->Initialize();
        DranMapField.unk_D440[i] = 0;
        DranMapField.unk_D470[i] = 3;
    }
    DranMapField.unk_D4A0 = 0;
    DranMapField.unk_D4A4 = 0;
    NowDranMapField = DranMapField.field;
    NowColData = &CColData;

    for (int i = 0; i < 12; i++) {
        ShotData.used[i] = 0;
    }
    NowShotData = &ShotData;
    HealEffect.unk_510 = 0;
    WaterSplash_Init();
    for (int i = 0; i < 5; i++) {
        ShotEffect.effect[i].Initialize();
    }
    NowShotEffect = &ShotEffect;
    for (int i = 0; i < 5; i++) {
        MasekiEffect[i].Initialize();
    }
    for (int i = 0; i < 16; i++) {
        OzumondShot.unk_200[i] = 1;
        OzumondShot.unk_280[i] = 0;
    }
    for (int i = 0; i < 64; i++) {
        OzumondFire.unk_0A00[i] = 1;
        OzumondFire.unk_0C00[i] = -1;
    }
    OzumondFire.unk_0D00 = 0;
    EscapeFlag = 0;
    WeaponCrashEffect.Initialize();
    for (int i = 0; i < 16; i++) {
        HitMark[i].Initialize();
    }
    for (int i = 0; i < 16; i++) {
        OzumondShotEffect.timer[i] = -1;
    }
    NewChangeFxFlag = 0;
    for (int i = 0; i < 32; i++) {
        HitValue[i].unk_5C = 0;
        HitValue[i].unk_10 = 0;
    }
    NowHitValue = HitValue;

    MainMonstorUnit.unk_048 = 0;
    MainMonstorUnit.unk_090 = 0;
    for (int i = 0; i < 16; i++) {
        MainMonstorUnit.script[i] = &MonstorScriptBuffer[i];
    }
    MainMonstorUnit.unk_094 = -1;
    MainMonstorUnit.CleanViewMonstor(0);
    BtSetEventExtendTable();
    NowMonstorUnit = &MainMonstorUnit;
    NowWeaponHave = &WeaponHave;
    SetWeaponAttachStatus(NowWeaponHave);
    BtEventMode = 0;
    EdEventInfo.unk_03C = -1.0f;
    EdEventInfo.unk_300 = 0;
    EdFadeInit();
    ClearGateKeyStack();
    TexManager.Initialize(0x3FE0);
    LoadBaseTexture();

    LoadFileMenuData("itempack.img", (unsigned int *) read_buffer);
    wait_now_loading_vsync();
    TexManager.EnterIMGFile((unsigned char *) read_buffer, -1, 0, 0);
    LoadFileMenuData("stayframe.img", (unsigned int *) read_buffer);
    wait_now_loading_vsync();
    TexManager.EnterFixTextureZ((unsigned char *) read_buffer);

    mainItemModel.Initialize();
    for (int i = 0; i < 4; i++) {
        activeItem.item[i] = -1;
        activeItem.model[i] = -1;
    }
    activeItem.model[8] = -1;
    activeItem.now = 1;
    activeItem.models = &mainItemModel;
    BtSetActiveItemModel(read_buffer);

    BtActStatus.action_on = 0;
    BtActStatus.unk_004 = -1;
    BtActStatus.unk_008 = -1;
    BtActStatus.unk_00C = 0;
    BtActStatus.unk_040 = 0;
    BtActStatus.unk_048 = 100.0f;
    BtActStatus.unk_0A4 = 0;
    BtActStatus.unk_04C = 0;
    BtActStatus.unk_020 = 0;
    BtActStatus.unk_024 = 0;
    BtActStatus.unk_054 = 1;
    BtActStatus.unk_058 = 1;
    BtActStatus.unk_05C = 0;
    BtActStatus.unk_060 = 0;
    BtActStatus.unk_064 = 1;
    BtActStatus.unk_066 = 1;
    BtActStatus.unk_068 = 0;
    BtActStatus.unk_06C = 0;
    BtActStatus.unk_070 = 0;
    BtActStatus.unk_098 = 0;
    BtActStatus.unk_09C = 0;
    BtActStatus.unk_094 = 0;
    BtActStatus.action_no = 0;
    BtActStatus.unk_0A4 = 0;
    BtActStatus.unk_0F8 = 10;
    BtActStatus.unk_0E4 = 0;
    BtActStatus.unk_0E8 = 0;
    BtActStatus.unk_0F0 = 0;
    BtActStatus.move_vector[0] = 0.0f;
    BtActStatus.move_vector[1] = 0.0f;
    BtActStatus.move_vector[2] = 0.0f;
    BtActStatus.move_vector[3] = 0.0f;
    BtActStatus.move_power = 0.0f;
    BtActStatus.move_power_decay = 0.0f;
    BtActStatus.unk_144 = 0;
    BtActStatus.unk_146 = 0;
    BtActStatus.unk_0E0 = 3600;
    BtActStatus.unk_124 = 0;
    BtActStatus.unk_128 = 0;
    BtActStatus.unk_148 = 0;
    BtActStatus.unk_14A = 0;
    EdEventInfo.unk_060 = 1;
    EdEventInfo.unk_064 = 1;
    camera_dist_mode__3 = 2;
    cameraAuto = 0;
    faceEyeCount = 0;
    DispFade__3.FadeInit(128.0f);
    DispFade__3.FadeInStart(1.0f);

    switch (LanguageCode) {
        case 0:
            PadInput_OK = 0x20;
            PadInput_NO = 0x40;
            break;
        case 1:
        default:
            PadInput_OK = 0x40;
            PadInput_NO = 0x20;
            break;
    }

    DngMes1.Preset(1);
    DngMes1.page_arrow = 0;
    DngMes1.centre_rows = 1;
    DngMes1.tex_block = 26;
    DngMes1.stay_frame = 1;
    DngMes1.columns = 15;
    DngMes1.rows = 3;
    DngMes1.text_x = 48;
    DngMes1.text_y = 368;
    DngMes1.char_width = 11;
    DngMes1.char_height = 22;
    DngMes1.style = 0;
    DngMes1.unk_17B0 = MesWinTexBuff_01;

    DngMes2.Preset(1);
    DngMes2.page_arrow = 0;
    DngMes2.centre_rows = 1;
    DngMes2.tex_block = 26;
    DngMes2.stay_frame = 0;
    DngMes2.columns = 15;
    DngMes2.rows = 3;
    DngMes2.text_x = 320;
    DngMes2.text_y = 346;
    DngMes2.char_width = 11;
    DngMes2.char_height = 22;
    DngMes2.unk_17B0 = MesWinTexBuff_02;

    DngMesStb.text_columns = 70;
    DngMesStb.text_rows = 10;
    DngMesStb.text_len = 0;
    DngMesStb.text_width = 0;
    DngMesStb.text_height = 0;
    DngMesStb.fade = 0;
    DngMesStb.fade_in = 1;
    DngMesStb.text_rate = DngMesStb.text_rate_set;
    DngMesStb.waiting = 0;
    DngMesStb.text_at = 0;
    DngMesStb.text_no = 0;
    DngMesStb.text_from = 0;
    DngMesStb.page_from = 0;
    DngMesStb.InitMesWinTbl();
    DngMesStb.clut_now = DngMesStb.clut_default;
    DngMesStb.wait = 0;
    DngMesStb.blink = 0;
    DngMesStb.auto_page_wait = 0;
    DngMesStb.mes_made = -1;
    DngMesStb.edge_alpha = 128;
    for (int i = 0; i < 10; i++) {
        DngMesStb.mes_no[i] = -1;
    }
    for (int i = 0; i < 8; i++) {
        DngMesStb.values[i] = 0;
    }
    DngMesStb.value = 0;
    DngMesStb.value_signed = 0;
    DngMesStb.value_show = 1;
    DngMesStb.value_narrow = 0;
    DngMesStb.space_width = -1;
    DngMesStb.space_area = -1;
    DngMesStb.cursor_row = -1;
    DngMesStb.cursor_y = 0;
    DngMesStb.cursor_lit = 0;
    for (int i = 0; i < 10; i++) {
        DngMesStb.line_pos[i].x = -1;
        DngMesStb.line_pos[i].y = -1;
    }
    DngMesStb.Preset(4);
    DngMesStb.columns = 21;
    DngMesStb.rows = 4;
    DngMesStb.text_rate = 1.0f;
    DngMesStb.text_rate_set = 1.0f;
    DngMesStb.fade_speed = 1.0f;
    DngMesStb.page_arrow = 0;
    DngMesStb.tex_block = 26;
    DngMesStb.tail_on = 0;
    DngMesStb.clut_now = Color2Clut(0x80BFBFBF) & 0xFF;
    DngMesStb.columns = 15;
    DngMesStb.char_width = 12;
    DngMesStb.char_height = 24;
    DngMesStb.unk_17B0 = MesWinTexBuff_11;

    BtEventMes0.char_width = 12;
    BtEventMes0.char_height = 20;
    BtEventMes0.columns = 21;
    BtEventMes0.rows = 4;
    BtEventMes0.text_rate = 0.3f;
    BtEventMes0.text_rate_set = 0.3f;
    BtEventMes0.tex_block = 26;
    BtEventMes0.style = 0;
    BtEventMes0.page_arrow = 0;
    BtEventMes0.centre_rows = 1;
    BtEventMes0.fade_speed = 0.1f;
    BtEventMes0.page_arrow = 1;
    BtEventMes0.unk_17B0 = MesWinTexBuff_01;

    BtEventMes1.columns = 22;
    BtEventMes1.rows = 5;
    BtEventMes1.char_width = 12;
    BtEventMes1.char_height = 24;
    BtEventMes1.text_rate = 0.3f;
    BtEventMes1.text_rate_set = 0.3f;
    BtEventMes1.tex_block = 26;
    BtEventMes1.style = 0;
    BtEventMes1.page_arrow = 0;
    BtEventMes1.centre_rows = 1;
    BtEventMes1.fade_speed = 0.1f;
    BtEventMes1.page_arrow = 1;
    BtEventMes1.unk_17B0 = MesWinTexBuff_02;

    mes = (short *) (BtMesBuffer.buffer + BtMesBuffer.used * 16);
    sprintf(name, "dun/message/ww_mes/dunmsd00_%d.mes", LanguageCode);
    LoadFile(name, mes, &size);
    wait_now_loading_vsync();
    DngMes1.SetBuff(mes);
    DngMes2.SetBuff(mes);
    MonsterNameInit(&DngMes2, mes, MesWinTexBuff_02);
    BtEventMes0.SetBuff(mes);
    BtMesBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    BtMesBuffer.Align64();

    mes = (short *) (BtMesBuffer.buffer + BtMesBuffer.used * 16);
    sprintf(name, "dun/message/ww_mes/font18_%d.mes", LanguageCode);
    LoadFile(name, mes, &size);
    wait_now_loading_vsync();
    BtEventMes1.SetBuff(mes);
    BtMesBuffer.Alloc((((size >> 6) + 1) << 6) >> 4);
    BtMesBuffer.Align64();

    mes = (short *) (BtMesBuffer.buffer + BtMesBuffer.used * 16);
    LoadFile("meswin/system14e.bin", mes, &size);
    wait_now_loading_vsync();
    BtMesBuffer.Alloc((size >> 4) + 1);
    DngMes1.SetBuff_system(SystemMes);
    DngMes2.SetBuff_system(SystemMes);
    BtEventMes0.SetBuff_system(mes);
    ClearSystemMes();

    DngMessMan.unk_24 = -1;
    DngMessMan.unk_04 = 0;
    DngMessMan.unk_00 = 1;
    oldMsgNo = -1;
    oldMsgNo2 = -1;

    MainWeapon.Initialize();
    DefaultWeapon.Initialize();
    CrashWeapon.Initialize();
    for (int i = 0; i < 32; i++) {
        CWeaponFx.used[i] = 0;
    }
    CWeaponFx.colour[0].r = CWeaponFx.colour[2].r = 0x40;
    CWeaponFx.colour[0].g = CWeaponFx.colour[2].g = 0x40;
    CWeaponFx.colour[0].b = CWeaponFx.colour[2].b = 0x40;
    CWeaponFx.colour[1].r = CWeaponFx.colour[3].r = 6;
    CWeaponFx.colour[1].g = CWeaponFx.colour[3].g = 6;
    CWeaponFx.colour[1].b = CWeaponFx.colour[3].b = 6;
    CWeaponFx.cursor = 0;
    CWeaponFx.timer = 0;
    for (int i = 0; i < 4; i++) {
        CWeaponElFx[i].Initialize();
    }

    SndSetReadBuffer(read_buffer);
    if (EdEventInfo.fukidashi != 0) {
        SndBgmLoad(selectMapNo + 100);
        SndBgmPlay(0);
    }
    SndSoundLoad(selectMapNo + 100);
    if (selectMapNo == 6) {
        SndSePlay(0x3D, 0, 0);
    }
    if (selectMapNo == 0) {
        SndSePlay(0x3D, 0, 0);
        SndSePlay(0x35, 0, 0);
    }
    if (selectMapNo == 2) {
        SndSePlay(0x41, 0, 0);
    }
    if (selectMapNo >= 3) {
        SndSePlay(0x42, 0, 0);
    }
    SndAmbientPlay(0);
    SndAmbientSetVol(0);
    BtBattleMusic_Init();

    LoadData();
    LoadStartLogo(selectMapNo);
    initBlendCnt(8, 1.0f);
    atraGetStatus = 0;
    atraGetStatusRate__2 = 0.0f;
    atraGetMsgBord = 0;
    CMonUnitHold = 0;
    CMonUnitHyde = 0;
    CEffectHold = 0;
    CEffectHyde = 0;
    itemOpenSmallFlag = 0;
    itemOpenBigFlag = 0;
    gateItemFlag = 0;
    driveStepHold = 0;
    driveNoInterpolate = 0;
    int dungeon = selectMapNo;

    if (UserStatus->atra_list[dungeon] == -1) {
        BtAtraListMake(dungeon);
    }
    UserStatus->water_drain_disable = 0;
    UserStatus->step_disable = 0;
    nowUnitNow = UserStatus->cur_chara;
    rogoY3 = 32;
    BtStatusAlarmInit();
    for (int i = 0; i < 3; i++) {
        CBomb__2[i].Initialize();
    }
    NowBombEffect = CBomb__2;
    ShockWave.unk_28 = 0;
    NowShockWave = &ShockWave;
    BombInfo.unk_14 = 0;
    frameCaputer = 0;
    BtActStatus.unk_000 = 1;
    viewMode__2 = 0;
    itemNowSel = 1;
    iventInfo = -1;
    iventMarker = 0;
    int minimap = UserStatus->minimap_status;

    if (minimap != 3) {
        infoMap = 1;
        infoMapOld = 1;
    } else {
        infoMap = 0;
        infoMapOld = 0;
    }
    BtActStatus.unk_000 = 1;
    CharaMainHandViewFlag = 0;
    MonstorViewFlag = 1;
    RsetUnitAmbientAnime();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
    lockOnTargetFlag = 0;
    lockOnTargetNo = -1;
    EnemyLifeGage.on = 0;
    EnemyLifeGage.draw = 1;
    existFlag = 0;
    tryalExit = 0;
    timeOutCount = 0;
    TEX_WepGage = TexManager.GetTexture("wepready", -1);
    TEX_Stayframe = TexManager.GetTexture("stayframe", -1);
    TEX_Shadow = TexManager.GetTexture("shadow_buf", -1);
    sprintf(gate_name, "gatekey0%d", selectMapNo + 1);
    GoldTex = TexManager.GetTexture(gate_name, -1);
    if (GoldTex == NULL) {
        printf("******** ERR\n");
    }
    BtMapJumpCashClear();

    CDungeonMap *map_now = NowDngMap;

    map_now->draw_dist_scale = 4.0f;
    ((CDngStatusData *) UserStatus)->SetNowFloor(0);

    CUserStatus *status_now = UserStatus;

    status_now->unk_03 = -1;

    DbgMsg.name = "dbgwork";
    DbgMsg.x = 32;
    DbgMsg.y = 80;
    DbgMsg.width = 256;
    DbgMsg.height = 224;
    DbgMsg.unk_14 = 96;
    DebugInfomationInit();
    EdDSetFont(&DbgMsg);
    StealItem.Initialize(StealModel);
    BtItemListCashFlag = 0;
    defCameraWait = 0;
    MonstorNameOff = 0;
    BtSystemScriptEventInfoInit();
    BtSystemScriptInit();
    BtSystemScriptLoad(selectMapNo);
    MemoryMapDump();
    BtGameModeFlag = 1;
    BtEventInfo.unk_2C = 100;
    BtEventInfo.unk_34 = 0;
    gameTask = 400;
}

int GameLoop(void) {
    float fade[4];
    int i;

    switch (BtGameModeFlag) {
        case 1:
            MoveChara();
            break;
        case 2:
            if (BattleMenuCursor() == 0) {
                BtGameModeFlag = 1;
            }
            break;
    }

    switch (BtGameModeFlag) {
        case 1:
            MainDraw();
            break;
        case 2:
            BattleMenuDraw();
            break;
        case 3:
            if (EventItemSelectLoop(&miniItemSelNo) != 0) {
                BtGameModeFlag = 1;
            }
            break;
        case 4: {
            int floor = DunEnterMenuLoop();

            if (floor != -1) {
                if (BtEventInfo.floor_result != NULL) {
                    BtEventInfo.floor_result[1] = floor;
                }
                BtEventInfo.floor_result = NULL;
                ((CDngStatusData *) UserStatus)->SetNowFloor(floor);
                BtGameModeFlag = 1;
            }
            break;
        }
        case 7: {
            int answer = DngEscapeMsgLoop();

            if (answer > 0) {
                if (BtEventInfo.escape_result != NULL) {
                    BtEventInfo.escape_result[1] = answer;
                }
                BtEventInfo.escape_result = NULL;
                BtGameModeFlag = 1;
            }
            break;
        }
        case 5: {
            int chara = CharaChangeLoop();

            BtMiniChrSelectNo = chara;
            if (chara != 0) {
                BtGameModeFlag = 1;
            }
            break;
        }
    }

    if (existFlag != 0) {
        while (ReadBGSync() == 1) {
        }

        // A floor the player is thrown out of keeps its music; one they leave
        // on their own starts the town music again.
        if (EdEventInfo.unk_030 != 0) {
            SndExit();
            SndBgmInit();
        } else {
            SndStopAllSe();
        }

        EdGetFadeColor(fade);
        MGSetBGColor(fade);
        ((CDngStatusData *) UserStatus)->LostGateKey();

        if (BtEventInfo.unk_B8 == 0) {
            CUserStatus *status = UserStatus;

            for (i = 0; i < 6; i++) {
                status->hp[i] = status->max_hp[i];
                status->unk_42C8[i] = 0;
                status->unk_42E0[i] = 0;
            }
            status->res_limit_zone_current = -1;
        }
        UserStatus->cur_chara = 0;

        CUserStatus *leaving = UserStatus;

        leaving->unk_03 = -1;
        return existFlag;
    }

    if (tryalExit != 0) {
        while (ReadBGSync() == 1) {
        }
        SndExit();

        CUserStatus *leaving = UserStatus;

        leaving->unk_03 = -1;
        return 1;
    }

    SndStep();
    return 0;
}

void Draw_MainUnitShadow(void) {
    float light[4][4];
    float colour[4][4];
    float saved[4][4];
    int i;

    // The shadows are drawn under a dimmed light and the real one goes back
    // afterwards.
    MGGetPLight(light, colour);
    sceVu0CopyMatrix(saved, light);
    light[0][0] *= 0.2f;
    light[2][0] *= 0.2f;
    MGSetPLight(light, colour);

    TexManager.ReloadTexture(Vif1Packet, 15);
    MGBeginDrawShadow(*(sceGsTex0 *) &TexManager.GetTexture("shadow_buf", -1)->tex0);

    if (BtActStatus.unk_054 != 0 && EdEventInfo.unk_064 != 0 &&
        EdEventInfo.unk_060 != 0 && BtActStatus.unk_000 != 0) {
        CharaMain.DrawShadow();
    }

    if (CMonUnitHyde == 0 && BtEventMode == 0) {
        NowMonstorUnit->DrawShadowMonstor();
    }

    if (BtEventMode != 0) {
        for (i = 0; i < 6; i++) {
            if (EdEventInfo.unk_0F4[i] != 0 && EdEventInfo.unk_0B4[i] != 0) {
                NPCUnit[i].DrawShadow();
            }
        }
    }

    MGEndDrawShadow(0x40);
    sceVu0CopyMatrix(light, saved);
    MGSetPLight(light, colour);
}

void Draw_MainUnit(void) {
    float light[4][4];
    float colour[4][4];
    float saved_light[4][4];
    float saved_colour[4][4];
    sceVu0FVECTOR up;
    sceVu0FVECTOR stood;
    sceVu0FVECTOR towards;
    sceVu0FVECTOR world;
    sceVu0FMATRIX place;
    sceVu0FVECTOR ambient;
    sceVu0FVECTOR saved_ambient;

    if (BtActStatus.unk_000 == 0 && EdEventInfo.unk_060 != 0 && EdEventInfo.unk_064 != 0) {
        return;
    }

    MGGetPLight(light, colour);
    sceVu0CopyMatrix(saved_light, light);
    sceVu0CopyMatrix(saved_colour, colour);

    // The Atlamillia lights the player from wherever its effect stands.
    if (atraGetStatus != 0) {
        CFrame *lamp = shortAtraEffect.frame->SearchFrame("light01");

        sceVu0CopyMatrix(place, lamp->local);
        up[0] = place[3][0];
        up[1] = place[3][1];
        up[2] = place[3][2];
        lamp->GetWorldPosition(world, up);
        sceVu0CopyVector(stood, CharaFrame->position);

        towards[0] = world[0] - stood[0];
        towards[1] = world[1] - stood[1] - 12.0f;
        towards[2] = world[2] - stood[2];

        float dist = sqrt(towards[0] * towards[0] + towards[1] * towards[1] +
                          towards[2] * towards[2]);

        if (dist <= 10.0f) {
            dist = 10.0f;
        }

        float power = 5.0f * (100.0f / (dist * dist));

        sceVu0Normalize(towards, towards);
        towards[0] *= power;
        towards[1] *= power;
        towards[2] *= power;
        towards[3] = 0.0f;

        light[0][3] = towards[0];
        light[1][3] = towards[1];
        light[2][3] = towards[2];
        light[3][3] = 0.0f;

        colour[3][0] = 0.8359375f * atraGetStatusRate__2;
        colour[3][1] = 0.9765625f * atraGetStatusRate__2;
        colour[3][2] = 0.66015625f * atraGetStatusRate__2;
        colour[3][3] = 0.5f * atraGetStatusRate__2;
    }

    MGSetPLight(light, colour);
    MGGetAmbient(saved_ambient);
    MGGetAmbient(ambient);

    if (BtEventMode == 0 && BtActStatus.unk_09C == 0) {
        // A speed boost pulses the model blue.
        if (BtBySpeedFlag != 0) {
            static float rate = 0.0f;

            if (rate >= 3.1415927f) {
                rate -= 3.1415927f;
            } else {
                rate += 0.09817477f;
            }
            ambient[0] = 96.0f;
            ambient[1] = 96.0f;
            ambient[2] = 96.0f + 96.0f * sinf(rate);
        }

        if (BtStatusErrColorSet() != 0) {
            ambient[0] = StatusColor[0];
            ambient[1] = StatusColor[1];
            ambient[2] = StatusColor[2];
        }

        float damage = setUnitDamageColor(0);

        if (damage != 128.0f) {
            ambient[0] = damage;
            ambient[1] = damage;
            ambient[2] = damage;
            ambient[3] = 128.0f;
        }
        unitAmbientAnime(ambient);
    }

    MGSetAmbient(ambient);
    TexManager.ReloadTexture(Vif1Packet, 0x11);
    CharaMain.TextureAnime(0x11);
    CharaMain.Draw();

    if (NowWeapon != NULL && NowWeapon->frame != NULL && BtActStatus.unk_058 != 0) {
        TexManager.ReloadTexture(Vif1Packet, 0x1D);
        NowWeapon->Draw();
    }

    MGSetAmbient(saved_ambient);
    sceVu0CopyMatrix(light, saved_light);
    sceVu0CopyMatrix(colour, saved_colour);
    MGSetPLight(light, colour);
}

void MainDraw(void) {
    sceVu0FMATRIX camera;
    sceVu0FVECTOR eye;
    sceVu0FMATRIX view;
    sceVu0FMATRIX unit;
    sceGsTex0 frame_tex;
    sceGsTex0 water_tex;
    int i;

    EdEventInfo.unk_050 = 0;
    NowCamera__3->GetPos(eye);
    NowCamera__3->GetCameraMatrix(camera);
    sceVu0UnitMatrix(unit);
    sceVu0MulMatrix(view, unit, camera);
    MGSetViewMatrix(view, eye);
    SndSetCamera(NowCamera__3);
    sceVif1PkCall(Vif1Packet, (u_long128 *) Vu_prog0f, 0);

    if (BtAllDrawFlag == 0) {
        if (BtItemListCashFlag != 0) {
            TexManager.ReloadTexture(Vif1Packet, 0x28);
            DngActiveItemTextureCopy();
            DngActiveWeaponTextureCopy();
            BtItemListCashFlag = 0;
        }
        EdFadeInOut();
        return;
    }

    if (lightingMode == 0) {
        MGSetPLight(main_light, main_lightcolor);
        MGSetAmbient(main_ambientlight);
        MGSetBGColor(main_bgColor[0], main_bgColor[1], main_bgColor[2], 128.0f);
        MGSetFogParm(main_fogRate[0], main_fogRate[1], main_fogColor[0], main_fogColor[1],
                     main_fogColor[2], main_fogRate[2], main_fogRate[3]);
    } else {
        MGSetPLight(sub_light, sub_lightcolor);
        MGSetAmbient(sub_ambientlight);
        MGSetBGColor(sub_bgColor[0], sub_bgColor[1], sub_bgColor[2], 128.0f);
        MGSetFogParm(sub_fogRate[0], sub_fogRate[1], sub_fogColor[0], sub_fogColor[1],
                     sub_fogColor[2], sub_fogRate[2], sub_fogRate[3]);
    }

    if (BtItemListCashFlag != 0) {
        TexManager.ReloadTexture(Vif1Packet, 0x28);
        DngActiveItemTextureCopy();
        DngActiveWeaponTextureCopy();
        BtItemListCashFlag = 0;
    }

    TexManager.ReloadTexture(Vif1Packet, 3);
    BtTexAnime.TexAnime(3);
    NowDngMap->DrawBGModel(NowCamera__3);
    NowDngMap->DrawDummyModel(NowCamera__3);

    if (NowDngMap->unk_BDEC == 1) {
        NowDngMap->DrawMap(NowCamera__3, CharaFrame);
    } else {
        NowDngMap->DrawMapFreeStyle();
    }

    // The map field's own draw, not the virtual one it inherits: retail binds
    // this call at compile time.
    NowDranMapField->CDranMapField::Draw();

    if (itemOpenSmallFlag == 0 && itemOpenBigFlag == 0) {
        sceVu0FVECTOR box_pos;

        sceVu0CopyVector(box_pos, CharaFrame->position);
        NowDngMap->DrawItemBox(box_pos);
    } else {
        if (itemOpenSmallFlag != 0) {
            itemOpenSmall.Draw();
        }
        if (itemOpenBigFlag != 0) {
            itemOpenBig.Draw();
        }
    }

    if (BtEventMode != 0) {
        sceVu0FVECTOR focus = {200.0f, 500.0f, 0.0f, 0.0f};

        DepthOfField(focus, 3, 0x40, 0);
    }

    if (atraGetStatus == 0) {
        sceVu0FVECTOR atra_pos;

        TexManager.ReloadTexture(Vif1Packet, 0x16);
        sceVu0CopyVector(atra_pos, CharaFrame->position);
        NowDngMap->DrawAtraBoll(atra_pos);
    }

    Draw_MainUnitShadow();

    if (BtActStatus.unk_000 != 0 && EdEventInfo.unk_060 != 0) {
        Draw_MainUnit();
    }

    if (CMonUnitHyde == 0 && BtEventMode == 0) {
        NowMonstorUnit->DrawMonstor();
    }

    if (CharaMainHandViewFlag != 0) {
        TexManager.ReloadTexture(Vif1Packet, 0x11);

        if (UserStatus->cur_chara == 1) {
            CharaHand.Draw();
        }

        if (NowWeapon != NULL && UserStatus->cur_chara == 1 && NowWeapon->frame != NULL &&
            BtActStatus.unk_058 != 0) {
            TexManager.ReloadTexture(Vif1Packet, 0x1D);
            NowWeapon->Draw();
        }
    }

    if (BtEventMode != 0) {
        for (i = 0; i < 6; i++) {
            if (EdEventInfo.unk_0B4[i] != 0) {
                TexManager.ReloadTexture(Vif1Packet, i + 0x20);
                NPCUnit[i].chara.TextureAnime(NPCUnit[i].unk_148C);
                NPCUnit[i].Draw();

                if (i == BtEventInfo.unk_94) {
                    DrawBee(NPCUnit[BtEventInfo.unk_94].chara.frame, 0xF);
                }
            }
        }
    }

    NowDngMap->DrawNPCDraw();
    mainItemModel.Draw();
    TexManager.ReloadTexture(Vif1Packet, 6);
    DrawWaterLing();

    if (Water_Splash_actFlag != 0) {
        Water_Splash.Draw();
    }

    if (NowDngMap->unk_BDEC == 1) {
        CRect_i_ area;
        sceVu0FVECTOR water_pos;

        TexManager.ReloadTexture(Vif1Packet, 0xD);
        MGGetFBuffTex(&frame_tex);
        area.x = 0;
        area.y = 0;
        area.width = 0x280;
        area.height = 0xE0;
        water_tex = *(sceGsTex0 *) &TexManager.GetTexture("water", -1)->tex0;
        MGMoveImage(&frame_tex, area, &water_tex, 0, 0, 0);
        sceVu0CopyVector(water_pos, CharaFrame->position);
        NowDngMap->DrawWater(water_pos, driveStepHold);
    }

    if (CEffectHyde == 0 && BtEventMode == 0) {
        TexManager.ReloadTexture(Vif1Packet, 0x13);
        NowShockWave->Draw(NowCamera__3);

        for (i = 0; i < 3; i++) {
            CBomb__2[i].Draw(NowCamera__3);
        }
        for (i = 0; i < 5; i++) {
            MasekiEffect[i].Draw();
        }

        CSHOT_EFFECT *shot = NowShotEffect->effect;

        for (i = 0; i < 5; i++) {
            shot[i].Draw();
        }
        NowMainEffect->Draw();
    }

    sceVu0FVECTOR raster_pos;

    sceVu0CopyVector(raster_pos, CharaFrame->position);
    TexManager.ReloadTexture(Vif1Packet, 0xE);
    NowDngMap->DrawRaster(CharaFrame);

    if (NowDngMap->unk_BDEC == 1) {
        NowDngMap->DrawFire(CharaFrame, NowCamera__3);
    } else {
        NowDngMap->DrawFireFreeStyle(CharaFrame, NowCamera__3);
    }

    if (atraGetStatus != 0 && atraShortGetType != 0) {
        TexManager.ReloadTexture(Vif1Packet, 0x1C);
        shortAtraEffect.Draw();
    }

    if (gateItemFlag != 0) {
        TexManager.ReloadTexture(Vif1Packet, 0x1C);
        MGDraw(itemBoxModel);
    }

    if (itemOpenSmallFlag != 0) {
        sceVu0FVECTOR ambient;
        sceVu0FVECTOR lift;
        sceVu0FVECTOR held;

        MGGetAmbient(ambient);
        TexManager.ReloadTexture(Vif1Packet, 0x16);
        itemOpenSmallFx.Draw();
        TexManager.ReloadTexture(Vif1Packet, 0x1C);
        sceVu0CopyVector(lift, itemBoxModel->position);
        sceVu0CopyVector(held, lift);

        static float itemposr = -3.1415927f;

        itemposr += 0.10471976f;
        if (itemposr >= 3.1415927f) {
            itemposr -= 6.2831855f;
        }

        lift[1] += 0.5f * sinf(itemposr);
        itemBoxModel->SetPosition(lift);
        MGDraw(itemBoxModel);
        MGSetAmbient(ambient);
        itemBoxModel->SetPosition(held);
    }

    if (itemOpenBigFlag != 0) {
        sceVu0FVECTOR lift;
        sceVu0FVECTOR held;

        TexManager.ReloadTexture(Vif1Packet, 0x16);
        MGDraw(itemOpenBigFx.frame);
        sceVu0CopyVector(lift, itemBoxModel->position);
        sceVu0CopyVector(held, lift);

        static float itemposr = -3.1415927f;

        itemposr += 0.10471976f;
        if (itemposr >= 3.1415927f) {
            itemposr -= 6.2831855f;
        }

        lift[1] += 0.03f * sinf(itemposr);
        itemBoxModel->SetPosition(lift);
        TexManager.ReloadTexture(Vif1Packet, 0x1C);
        MGDraw(itemBoxModel);
    }

    if (NewChangeFxFlag != 0) {
        sceVu0FVECTOR pos;
        sceVu0FVECTOR rot;

        TexManager.ReloadTexture(Vif1Packet, 0xB);
        sceVu0CopyVector(pos, CharaMain.pos);
        CharaMain.GetRotation(rot);
        NewChangeFx.SetPosition(pos);
        NewChangeFx.SetRotation(rot);
        NewChangeFx.Draw();
    }

    if (EscapeFlag != 0) {
        TexManager.ReloadTexture(Vif1Packet, 0x1C);
        EscapeEffect.Draw();
    }

    NowDngMap->DrawTrapCircle();
    TexManager.ReloadTexture(Vif1Packet, 1);

    if (CMonUnitHyde == 0 && BtEventMode == 0) {
        NowMonstorUnit->DrawMonstorCursor();
    }

    if (BtEventInfo.unk_38 != 0) {
        sceVu0FVECTOR mark;

        sceVu0CopyVector(mark, CharaMain.pos);
        mark[1] += 22.0f;

        static float bic_posr = -3.141592f;

        bic_posr += 0.104719736f;
        if (bic_posr >= 3.141592f) {
            bic_posr -= 6.283184f;
        }

        mark[1] += 0.5f * sinf(bic_posr);

        mark[1] += CharaHeight(UserStatus) - 15.0f;
        bicCursorFrame->SetPosition(mark);
        MGDraw(bicCursorFrame);
        BtEventInfo.unk_38 = 0;
    }

    if (BtAllClear == 0 && DebugStatus[10] == 0) {
        int shift;
        int floor_no;
        int digit_x;

        setbilinear(0);

        if (autoDemo == 0 && CMonUnitHyde == 0) {
            setTargetCursor(lockOnTargetFlag);

            if (lockOnTargetDraw != 0) {
                MGDraw(cursorFrame);
                lockOnTargetDraw = 0;
            }
            setbilinear(0);
        }

        if (iventInfo != -1 && iventMarker != 0) {
            sceVu0CopyVector(iventPos, CharaMain.pos);
            iventPos[1] += 22.0f;

            static float bic_posr = -3.141592f;

            bic_posr += 0.104719736f;
            if (bic_posr >= 3.141592f) {
                bic_posr -= 6.283184f;
            }

            iventPos[1] += 0.5f * sinf(bic_posr);

            iventPos[1] += CharaHeight(UserStatus) - 15.0f;
            bicCursorFrame->SetPosition(iventPos);
        }

        if (BombInfo.unk_14 != 0) {
            bombCursorFrame->SetPosition(BombInfo.pos);
            MGDraw(bombCursorFrame);
        }

        if (CEffectHyde == 0 && BtEventMode == 0) {
            MGSetGsZBUF(NULL);
            RandomItem->Draw();
            StealItem.Draw();
        }

        if (autoDemo == 0) {
            sceGsAlpha blend;
            sceGsZbuf depth;

            TexManager.ReloadTexture(Vif1Packet, 0x12);

            blend = mgAlpha;
            blend.bits.a = 0;
            blend.bits.b = 2;
            blend.bits.c = 0;
            blend.bits.d = 1;
            MGSetGsALPHA(&blend);

            depth = mgZBuffer;
            depth.bits.zmsk = 1;
            MGSetGsZBUF(&depth);

            for (i = 0; i < 4; i++) {
                CWeaponElFx[i].Draw();
            }

            WeaponCrashEffect.Draw();

            for (i = 0; i < 16; i++) {
                HitMark[i].Draw();
                HitPointMark[i].Draw();
                MyHitPointMark[i].Draw();
            }

            HealEffect.Draw();

            if (CEffectHyde == 0 && BtEventMode == 0) {
                NowShotData->draw();
                OzumondShotEffect.Draw();
                OzumondFire.Draw();
            }

            CWeaponFx.Draw();
            CRunFx__2.Step();
            CRunFx__2.Draw();
            MGSetGsALPHA(NULL);
            MGSetGsZBUF(NULL);
        }

        if (rogoSwitch2 == 1 && BtEventInfo.unk_8C == 0) {
            TEX_Floor1 = TexManager.GetTexture(floor_name, -1);
            shift = 0;
            floor_no = 0;

            if (UserStatus->cur_floor >= 9) {
                floor_no = -0x24;
            }

            TexManager.ReloadTexture(Vif1Packet, 8);

            if (LanguageCode == 0) {
                switch (selectMapNo) {
                    case 0:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(floor_no + 0xE2, 0xAA, 0x72, 0x32),
                                    CRect_i_(0, 0, 0x72, 0x32), rogoAlphaA[2]);
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0x17D, 0xAA, 0x4C, 0x32),
                                    CRect_i_(0x72, 0, 0x4C, 0x32), rogoAlphaA[2]);
                        break;
                    case 1:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0xBE, 0xAA, 0xBE, 0x32),
                                    CRect_i_(0, 0, 0xBE, 0x32), rogoAlphaA[2]);
                        shift = 0x40;
                        break;
                    case 2:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(floor_no + 0xF5, 0xAA, 0x4C, 0x32),
                                    CRect_i_(0, 0, 0x4C, 0x32), rogoAlphaA[2]);
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0x159, 0xAA, 0x4C, 0x32),
                                    CRect_i_(0x4C, 0, 0x4C, 0x32), rogoAlphaA[2]);
                        shift = -0x24;
                        break;
                    case 3:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0xE8, 0xAA, 0x98, 0x32),
                                    CRect_i_(0, 0, 0x98, 0x32), rogoAlphaA[2]);
                        shift = 0x40;
                        break;
                    case 4:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(floor_no + 0xD7, 0xAA, 0x4C, 0x32),
                                    CRect_i_(0, 0, 0x4C, 0x32), rogoAlphaA[2]);
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0x13B, 0xAA, 0xBE, 0x32),
                                    CRect_i_(0x4C, 0, 0xBE, 0x32), rogoAlphaA[2]);
                        shift = -0x40;
                        break;
                    case 5:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0x135, 0xAA, 0x98, 0x32),
                                    CRect_i_(0, 0, 0x98, 0x32), rogoAlphaA[2]);
                        shift = -0x40;
                        break;
                }

                if (BtUraDongeon != 0) {
                    set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0x120, 0xE6, 0x40, 0x38),
                                CRect_i_(0x13A, 0x78, 0x40, 0x38), rogoAlphaA[2]);
                } else if (UserStatus->res_limit_zone_current >= 0) {
                    set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0xD4, 0xE6, 0xD8, 0x30),
                                CRect_i_(0, 0x78, 0xD8, 0x30), rogoAlphaA[2]);
                }
            }

            if (LanguageCode > 0) {
                switch (selectMapNo) {
                    case 0:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(floor_no + 0x122, 0xAA, 0x2D, 0x32),
                                    CRect_i_(0, 0, 0x2D, 0x32), rogoAlphaA[2]);
                        shift = -0x14;
                        break;
                    case 1:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0xA0, 0xAA, 0xDA, 0x32),
                                    CRect_i_(0, 0, 0xDA, 0x32), rogoAlphaA[2]);
                        shift = 0x40;
                        if (UserStatus->cur_floor < 9) {
                            shift = 0x20;
                        }
                        break;
                    case 2:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0xC8, 0xAA, 0x91, 0x32),
                                    CRect_i_(0, 0, 0x91, 0x32), rogoAlphaA[2]);
                        if (UserStatus->cur_floor >= 9) {
                            shift = 0x20;
                        }
                        break;
                    case 3:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(floor_no + 0xDC, 0xAA, 0x8E, 0x32),
                                    CRect_i_(0, 0, 0x8E, 0x32), rogoAlphaA[2]);
                        shift = 0x10;
                        break;
                    case 4:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(floor_no + 0xC3, 0xAA, 0x4B, 0x32),
                                    CRect_i_(0, 0, 0x4B, 0x32), rogoAlphaA[2]);
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0x13B, 0xAA, 0xC0, 0x32),
                                    CRect_i_(0x60, 0, 0xC0, 0x32), rogoAlphaA[2]);
                        shift = -0x40;
                        break;
                    case 5:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0x108, 0xAA, 0xE1, 0x32),
                                    CRect_i_(0, 0, 0xE1, 0x32), rogoAlphaA[2]);
                        shift = -0x80;
                        break;
                    case 6:
                        set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(floor_no + 0xDC, 0xAA, 0x8E, 0x32),
                                    CRect_i_(0, 0, 0x8E, 0x32), rogoAlphaA[2]);
                        shift = 0x10;
                        break;
                }

                if (BtUraDongeon != 0) {
                    set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0x110, 0xE6, 0x60, 0x38),
                                CRect_i_(0x110, 0x78, 0x60, 0x38), rogoAlphaA[2]);
                } else if (UserStatus->res_limit_zone_current >= 0) {
                    set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(0xD4, 0xE6, 0xF0, 0x30),
                                CRect_i_(0, 0x78, 0xF0, 0x30), rogoAlphaA[2]);
                }
            }

            floor_no = UserStatus->cur_floor + 1;

            if (selectMapNo == 5) {
                floor_no = BtGetFloorLevel(floor_no - 1);
            }

            if (floor_no < 10) {
                digit_x = floor_no % 10 * 0x26;
                set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(shift + 0x15A, 0xAA, 0x26, 0x32),
                            CRect_i_(digit_x, 0x32, 0x26, 0x32), rogoAlphaA[2]);
            }

            if (floor_no >= 10 && floor_no < 100) {
                digit_x = floor_no / 10 * 0x26;
                set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(shift + 0x136, 0xAA, 0x26, 0x32),
                            CRect_i_(digit_x, 0x32, 0x26, 0x32), rogoAlphaA[2]);
                digit_x = floor_no % 10 * 0x26;
                set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(shift + 0x15A, 0xAA, 0x26, 0x32),
                            CRect_i_(digit_x, 0x32, 0x26, 0x32), rogoAlphaA[2]);
            }

            if (floor_no >= 100) {
                int digit = floor_no / 100;

                digit_x = digit * 0x26;
                floor_no -= digit * 100;
                set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(shift + 0x112, 0xAA, 0x26, 0x32),
                            CRect_i_(digit_x, 0x32, 0x26, 0x32), rogoAlphaA[2]);
                digit_x = floor_no / 10 * 0x26;
                set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(shift + 0x136, 0xAA, 0x26, 0x32),
                            CRect_i_(digit_x, 0x32, 0x26, 0x32), rogoAlphaA[2]);
                digit_x = floor_no % 10 * 0x26;
                set2DSprite(Vif1Packet, TEX_Floor1, CRect_i_(shift + 0x15A, 0xAA, 0x26, 0x32),
                            CRect_i_(digit_x, 0x32, 0x26, 0x32), rogoAlphaA[2]);
            }
        }

        TexManager.ReloadTexture(Vif1Packet, 2);

        int gauge_alpha = rogoY3 + 0x60;

        if ((int) BtActStatus.unk_048 >= 100) {
            if (BtActStatus.unk_04C == 0) {
                set2DSprite(Vif1Packet, TEX_WepGage, CRect_i_(0x28, 0x18C, 0x80, 0x1C),
                            CRect_i_(0, 0, 0x80, 0x1C), gauge_alpha);
            } else {
                set2DSprite(Vif1Packet, TEX_WepGage, CRect_i_(0x28, 0x18C, 0x80, 0x1C),
                            CRect_i_(0, 0x1C, 0x80, 0x1C), gauge_alpha);
            }
        }

        float wear = BtActStatus.unk_048;

        if ((int) wear < 100) {
            int left = (int) wear;

            set2DSprite(Vif1Packet, TEX_WepGage, CRect_i_(0x28, 0x18C, 0x80, 0x1C),
                        CRect_i_(0, 0x54, 0x80, 0x1C), gauge_alpha);
            set2DSprite(Vif1Packet, TEX_WepGage, CRect_i_(0x42, 0x18C, left, 0x1C),
                        CRect_i_(0x1A, 0x38, left, 0x1C), gauge_alpha);
        }

        if (infoMap != 0 && NowDngMap->unk_BDEC == 1) {
            sceVu0FVECTOR map_pos;
            sceVu0FVECTOR map_rot;

            TexManager.ReloadTexture(Vif1Packet, 0x1F);
            sceVu0CopyVector(map_pos, CharaFrame->position);
            CharaFrame->GetRotation(map_rot);
            NowDngMap->DrawMiniMap(map_pos, map_rot[1]);
            NowMonstorUnit->DrawMapSymbol(map_pos);
            RandomItem->MapSymbolDraw();
        }

        topStatusInfo(rogoY3, itemNowSel, UserStatus->cur_floor);
        BtStatusErrDraw(rogoY3);

        for (i = 0; i < 32; i++) {
            HitValue[i].Draw();
        }

        if (exitMenuFlag != 0) {
            TexManager.ReloadTexture(Vif1Packet, 7);
            set2DSprite(Vif1Packet, TexManager.GetTexture("pause", -1),
                        CRect_i_(0x100, 0xCC, 0x80, 0x28), 0, 0);
        }

        setbilinear(1);
    }

    if (MonstorNameOff == 0) {
        MonsterNameDraw();
    }

    SetMonsterNameDrawFlag(0);

    if (EdEventInfo.unk_300 != 0) {
        sceVu0FVECTOR fade;

        sceVu0CopyVector(fade, EdEventInfo.unk_09);
        MGFillBox(CRect_i_(0, 0, 0x2800, 0xE00), (int) fade[0], (int) fade[1], (int) fade[2],
                  (int) fade[3]);
    }

    if (BtEventMode != 0) {
        EdEventSpriteDraw();
        EBDraw();
        TexManager.ReloadTexture(Vif1Packet, 0x1A);
        BtEventMes0.DrawMesWin();
        BtEventMes1.DrawMesWin();
    }

    for (i = 0; i < 1; i++) {
        if (EdEventInfo.unk_25C[i] != NULL) {
            TexManager.ReloadTexture(Vif1Packet, i + 0x28);
            MGDraw(EdEventInfo.unk_25C[i]);
        }
    }

    setbilinear(0);
    TexManager.ReloadTexture(Vif1Packet, 0x1A);
    SystemMesStep();
    SystemMesDraw();

    int showing;

    if (DngMessMan.unk_08 > 0) {
        showing = 0;
    } else {
        showing = DngMessMan.unk_00;
    }

    if (showing != 0) {
        if (DngMessMan.unk_1C == 0) {
            int mes_no = DngMessMan.unk_24;

            DngMes1.mes_no[0] = DngMessMan.unk_0C;
            DngMes1.mes_no[1] = DngMessMan.unk_10;
            DngMes1.values[0] = DngMessMan.unk_14;
            DngMes1.values[1] = DngMessMan.unk_18;
            DngMes1.value_signed = 1;
            DngMes1.value_show = 0;

            if (mes_no != oldMsgNo) {
                oldMsgNo = mes_no;
                Mes1MakeFlg = 1;
            }
            if (Mes1MakeFlg != 0) {
                Mes1MakeFlg = DngMes1.MakeMesWin(mes_no);
            }
            if (mes_no != -1) {
                DngMes1.text_x = 0x136;
                DngMes1.text_y = 0x154;
                DngMes1.auto_pos = 9;
                DngMes1.DrawMesWin();
            }
        } else {
            int mes_no = DngMessMan.unk_24;
            int pos[4];

            DngMesStb.value_signed = 1;
            DngMesStb.value_show = 0;

            if (mes_no != oldMsgNo) {
                oldMsgNo = mes_no;
                Mes1MakeFlg = 1;
            }
            if (Mes1MakeFlg != 0) {
                Mes1MakeFlg = DngMesStb.MakeMesWin(mes_no);
            }
            if (mes_no != -1) {
                DngMesStb.auto_pos = 8;
                DngMesStb.AutoSet(pos);
                DngMesStb.DrawMesWin();
            }
        }
    }

    if (BtEventMode != 0) {
        if (DebugStatus[4] != 0) {
            TexManager.ReloadTexture(Vif1Packet, 0xC);
            EdDDrawFont();
        }
    } else {
        TexManager.ReloadTexture(Vif1Packet, 0xC);
        DebugInfomationDraw();
    }

    DispFade__3.FadeIn(Vif1Packet);
    DispFade__3.FadeOut(Vif1Packet);
    EdFadeInOut();

    if (frameCaputer != 0) {
        sceGsSyncPath(0, 0);
        TexManager.ReloadTexture(Vif1Packet, 0x17);
        MGMoveFrameBuffImage((sceGsTex0 *) &TexManager.GetTexture("frame_image", -1)->tex0, 0,
                             0, 0);
    }
}

float oldCameraHeight;
float oldCameraAngle;

/* How hard the player is turning the camera. */
float inputH1;

/**
 *              Runs the dungeon for one frame.
 *
 * `gameTask` says what the dungeon is doing: zero while the player walks the
 * floor, and one of the other states while a menu, an event script or the
 * death sequence has the screen. Every state ends by stepping the models.
 */
void MoveChara(void) {
    /* Where the camera looks relative to what it follows, before the floor's
       own offset is added. */
    static sceVu0FVECTOR reference = {0.0f, 7.5f, 0.0f, 0.0f};
    sceVu0FVECTOR pos;
    float move_z;
    float move_x;
    float ly;
    float lx;
    float angle;
    float rx;
    float ry;

    // An event that sets its own draw distance keeps it; anything else draws
    // the whole floor.
    if (BtEventMode != 0 && EdEventInfo.unk_03C > 0.0f) {
        MGSetRenderInfo(EdEventInfo.unk_03C, 1.0f, (float) 0xFFFF);
    } else {
        MGSetRenderInfo(800.0f, 1.0f, (float) 0xFFFF);
    }
    sceVu0CopyVector(pos, CharaFrame->position);
    angle = NowCamera__3->GetAngleH();
    GameEnv.camera = NowCamera__3;
    GameEnv.frame = CharaFrame;
    lx = GamePad.GetLXf();
    inputH1 = lx;
    ly = GamePad.GetLYf();
    rx = GamePad.GetRXf();
    ry = GamePad.GetRYf();
    {
        sceVu0FVECTOR forward = {0.0f, 0.0f, 1.0f, 1.0f};
        sceVu0FVECTOR rotation;
        sceVu0FVECTOR dir;
        sceVu0FMATRIX rot_matrix;

        CharaMain.frame->GetRotation(rotation);
        sceVu0UnitMatrix(rot_matrix);
        sceVu0RotMatrixY(rot_matrix, rot_matrix, rotation[1]);
        sceVu0ApplyMatrix(dir, rot_matrix, forward);
        sceVu0Normalize(BtActStatus.unk_0C0, dir);
    }
    // The stick is read in screen space, so it turns with the camera before
    // anything acts on it.
    BtActStatus.unk_0C0[0] = lx * cos(angle) + ly * sinf(angle);
    BtActStatus.unk_0C0[2] = ly * cos(angle) - lx * sinf(angle);
    BtActStatus.unk_0C0[1] = 0.0f;
    BtActStatus.unk_0C0[3] = 1.0f;
    if (GamePad.Down2(0x40) != 0) {
        driveStepHold ^= 1;
    }
    if (GamePad.Down2(0x80) != 0) {
        BtAllClear ^= 1;
        MesAbsDrawOff = BtAllClear;
    }
    GamePad.Down(0x100);
    switch (gameTask) {
        case 0:
            if (CheckTrialEnd() != 0) {
                tryalExit = 1;
            } else if (GamePad.Down(0x800) != 0) {
                printf("pause!!\n");
                exitMenuFlag = 1;
                driveStepHold = 1;
                CMonUnitHold = 1;
                CEffectHold = 1;
                PlayTimeCountFlag(0);
                SndSePlay(1, -1, 0);
                gameTask = 0x9B;
            } else {
                move_x = lx * cos(angle) + ly * sinf(angle);
                BtActStatus.unk_0B4 = move_x;
                move_z = ly * cos(angle) - lx * sinf(angle);
                BtActStatus.unk_0B8 = move_z;
                if (StatusErrCheck(0x40) != 0) {
                    move_x /= 2.0f;
                    move_z /= 2.0f;
                }
                BtActStatus.unk_098 = 0;
                if (StatusErrCheck(4) != 0) {
                    lx = 0.0f;
                    move_x = 0.0f;
                    ly = 0.0f;
                    move_z = 0.0f;
                    BtActStatus.unk_098 = 1;
                }
                velo__2[0] = move_x;
                velo__2[2] = move_z;
                velo2[0] = rx * cos(angle) + ry * sinf(angle);
                velo2[2] = ry * cos(angle) - rx * sinf(angle);
                stickVector = DistVector(velo__2);
                BtActStatus.unk_0BC = stickVector;
                stickVector2 = DistVector(velo__2);
                BtActStatus.unk_060 = 0;
                if (lockOnTargetFlag != 0) {
                    velo__2[0] = move_x;
                    velo__2[2] = move_z;
                    if (BtActStatus.unk_128 > 0) {
                        NowCamera__3->SetSpeed(32.0f);
                    } else {
                        NowCamera__3->SetSpeed(14.0f);
                    }
                } else {
                    NowCamera__3->SetSpeed(8.0f);
                    defCameraWait = 0;
                    if (BtBySpeedFlag != 0) {
                        run_speed__2 = 3.0f;
                    } else {
                        run_speed__2 = 1.45f;
                    }
                    velo__2[0] = move_x * run_speed__2;
                    velo__2[2] = move_z * run_speed__2;
                }
                if (stickVector <= 0.01f) {
                    CUserStatus *drain = UserStatus;

                    drain->water_drain_disable = 1;
                } else {
                    UserStatus->water_drain_disable = 0;
                }
                if (UserStatus->unk_431C != 0) {
                    UserStatus->unk_431C = 0;
                    gameTask = 0x1E;
                    EnemyLifeGage.draw = 0;
                    driveStepHold = 1;
                    SetMIniMapStatus(0);
                    iventInfo = -1;
                    rogoSwitch2 = 0;
                    SndSePlay(1, -1, 0);
                } else if (GamePad.Down(0x10) != 0) {
                    int ok = 0;

                    if (move_x == 0.0f && move_z == 0.0f && BtActStatus.action_on == 0) {
                        ok = 1;
                    }
                    if (UserStatus->hp[UserStatus->cur_chara] <= 0) {
                        ok = 0;
                    }
                    if (BtActStatus.unk_098 != 0) {
                        ok = 1;
                    }
                    if (ok != 0) {
                        UserStatus->unk_431C = 0;
                        gameTask = 0x1E;
                        EnemyLifeGage.draw = 0;
                        driveStepHold = 1;
                        SetMIniMapStatus(0);
                        iventInfo = -1;
                        rogoSwitch2 = 0;
                        SndSePlay(1, -1, 0);
                    } else {
                        goto walk;
                    }
                } else {
                walk:
                    if ((move_x != 0.0f || move_z != 0.0f) &&
                        (BtActStatus.action_on == 0 || UserStatus->cur_chara == 5)) {
                        CharaFrame->SetRotation(0.0f, unitRotation(CharaFrame, atan2f(move_x, move_z)),
                                                0.0f);
                    }
                    CharaMain.motion_type.motion_info->speed = 0.05f;
                    BtActStatus.unk_00C = keyCtrl(lx, ly, CharaMain.motion_type.motion_info);
                    if (UserStatus->hp[UserStatus->cur_chara] <= 0) {
                        BtActStatus.unk_00C = 0x17;
                    }
                    if (BtActStatus.unk_020 != 0) {
                        if (stickVector >= 0.8f && UserStatus->cur_chara == 0) {
                            BtActStatus.unk_00C = 0x1D;
                        }
                        BtActStatus.unk_020--;
                    }
                    if (BtActStatus.unk_024 > 0) {
                        BtActStatus.unk_024--;
                    }
                    if (GamePad.Down(0x100) != 0 && UserStatus->party_size >= 2 &&
                        BtActStatus.action_on == 0) {
                        DngMessMan.unk_00 = 0;
                        DngMessMan.unk_24 = -1;
                        DngMessMan.unk_04 = 0;
                        DngMessMan.unk_1C = 0;
                        DngMessMan.unk_20 = 0;
                        DngMessMan.unk_08 = 0;
                        MonstorNameOff = 0;
                        EnemyLifeGage.draw = 0;
                        BtMiniChrSelect_Init(0);
                        oldUnitNow = UserStatus->cur_chara;
                        gameTask = 0x127;
                        autoCamTrial();
                    } else {
                        static int cnt;
                        static char init;
                        sceVu0FVECTOR mask_pos;

                        if (init == 0) {
                            cnt = 0;
                            init = 1;
                        }
                        sceVu0CopyVector(mask_pos, CharaFrame->position);
                        if (cnt >= 5) {
                            NowDngMap->checkMask(mask_pos[0], mask_pos[2]);
                            cnt = 0;
                        }
                        cnt++;
                        if (BtActStatus.action_on == 0) {
                            if (GamePad.Down(0x8000) != 0) {
                                SndSePlay(0, -1, 0);
                                if (itemNowSel < 2) {
                                    itemNowSel = 3;
                                } else {
                                    itemNowSel--;
                                }
                                activeItem.now = itemNowSel;
                            }
                            if (GamePad.Down(0x2000) != 0) {
                                SndSePlay(0, -1, 0);
                                if (itemNowSel >= 3) {
                                    itemNowSel = 1;
                                } else {
                                    itemNowSel++;
                                }
                                activeItem.now = itemNowSel;
                            }
                        }
                        if (GamePad.Down(PadInput_NO) != 0) {
                            if (lockOnTargetNo == -1) {
                                sceVu0FMATRIX look;

                                CharaFrame->GetLWMatrix(look);
                                NowCamera__3->SetAngle(atan2f(look[2][0], look[2][2]) -
                                                       3.141592653589793);
                            } else if (lockOnTargetFlag == 0) {
                                if (lockOnTargetNo != -1) {
                                    lockOnTargetFlag = 1;
                                    SndSePlay(0x11, -1, 0);
                                }
                            } else {
                                lockOnTargetFlag = 0;
                                SndSePlay(2, -1, 0);
                            }
                        }
                        if (GamePad.Down(4) != 0 && BtActStatus.unk_098 == 0 && lockOnTargetFlag != 0) {
                            if (targetCursorShiftNo >= targetCursorShiftRot - 1) {
                                targetCursorShiftNo = 0;
                                targetCursorShiftRot = SetNearLockOnTarget(0, 0);
                                SndSePlay(0x11, -1, 0);
                            } else {
                                targetCursorShiftNo++;
                                targetCursorShiftRot = SetNearLockOnTarget(targetCursorShiftNo, 0);
                                SndSePlay(0x11, -1, 0);
                            }
                        }
                        if (SetBattleStyle(selectMapNo, 0) <= 60.0f && move_x == 0.0f &&
                            move_z == 0.0f) {
                            BtActStatus.unk_00C = 0x12;
                        }
                        if (lockOnTargetFlag != 0) {
                            CCharacter *locked = &NowMonstorUnit->chara[lockOnTargetNo][0];
                            sceVu0FVECTOR target;
                            float face;

                            locked->GetPosition(target);
                            atan2f(pos[0] - target[0], pos[2] - target[2]);
                            face = atan2f(target[0] - pos[0], target[2] - pos[2]);
                            if (BtActStatus.unk_0BC > 0.0f) {
                                CharaFrame->SetRotation(0.0f, face, 0.0f);
                            } else {
                                CharaFrame->SetRotation(0.0f, unitRotation(CharaFrame, face), 0.0f);
                            }
                            if (BtActStatus.action_on == 0) {
                                float turn;
                                float rate;
                                int motion;

                                BtActStatus.unk_00C = 0x12;
                                CharaMain.motion_type.motion_info[18].speed = 0.2f;
                                turn = atan2f(move_x, move_z);
                                turn = face - turn;
                                if (turn < -3.141592f) {
                                    turn += 6.283184f;
                                }
                                if (turn > 3.141592f) {
                                    turn -= 6.283184f;
                                }
                                // Which strafe motion plays comes from the angle
                                // between the way the character faces and the way
                                // the stick points, in five bands around it.
                                motion = 0x12;
                                if (turn > -1.2f && turn < 1.2f) {
                                    motion = 0x15;
                                }
                                if (turn < -2.6f || turn > 2.6f) {
                                    motion = 0x16;
                                }
                                if (turn > 1.2f && turn < 2.6f) {
                                    motion = 0x13;
                                }
                                if (turn < -1.2f && turn > -2.6f) {
                                    motion = 0x14;
                                }
                                if (BtActStatus.unk_0BC > 0.0f) {
                                    BtActStatus.unk_00C = motion;
                                    rate = 0.2f + BtActStatus.unk_0BC;
                                    if (rate >= 1.0f) {
                                        rate = 1.0f;
                                    }
                                    CharaMain.motion_type.motion_info[motion].speed = rate;
                                }
                            }
                        }
                        if (UserStatus->cur_chara == 1 && BtActStatus.action_no == 0xC &&
                            (move_x != 0.0f || move_z != 0.0f)) {
                            CharaFrame->SetRotation(
                                0.0f, unitRotation(CharaFrame, atan2f(move_x, move_z)), 0.0f);
                        }
                        if (GamePad.On(8) != 0 && lockOnTargetFlag != 0 && BtActStatus.unk_098 == 0 &&
                            BtActStatus.unk_094 == 0 && BtActStatus.action_on == 0) {
                            BtActStatus.action_on = 6;
                            BtActStatus.action_no = 8;
                            driveNoInterpolate = 1;
                        }
                        if (BtActStatus.action_on == 6) {
                            float end;

                            if (lockOnTargetFlag == 0) {
                                BtActStatus.action_on = 0;
                                BtActStatus.action_no = 0x12;
                            }
                            if (BtActStatus.action_no == 8) {
                                BtActStatus.unk_00C = 8;
                                end = CharaMain.motion_type.motion_info[8].end;
                                if (CharaMain.motion_type.state.time >= end - 1.0f &&
                                    CharaMain.motion_type.state.time < end) {
                                    BtActStatus.action_no = 9;
                                    BtActStatus.unk_00C = 9;
                                    driveNoInterpolate = 1;
                                }
                            }
                            if (BtActStatus.action_no == 9) {
                                BtActStatus.unk_00C = 9;
                                BtActStatus.unk_060 = 5;
                                if (GamePad.On(8) == 0) {
                                    BtActStatus.action_no = 0xA;
                                    BtActStatus.unk_00C = 0xA;
                                    driveNoInterpolate = 1;
                                }
                            }
                            if (BtActStatus.action_no == 0xA) {
                                BtActStatus.unk_00C = 0xA;
                                end = CharaMain.motion_type.motion_info[10].end;
                                if (CharaMain.motion_type.state.time >= end - 1.5f &&
                                    CharaMain.motion_type.state.time < end) {
                                    BtActStatus.action_on = 0;
                                }
                            }
                        }
                        int script;

                        if (NowMonstorUnit->unk_094 != -1) {
                            BtEventInfo.unk_2C = NowMonstorUnit->unk_094;
                            BtEventInfo.unk_34 = 1;
                            ResetStatusInfo();
                            driveStepHold = 1;
                            EdFadeInit();
                            EdFadeOut(0x78, 0.0f, 0.0f, 0.0f);
                            BtEventInfo.unk_90 = 0;
                            gameTask = 0x226;
                        } else if (UserStatus->CheckLife() != 0 && BtActStatus.action_on == 0 &&
                                   (script = NowMonstorUnit->CheckEventFlag2()) != -1) {
                            BtEventInfo.unk_2C = script;
                            BtEventInfo.unk_34 = 0;
                            gameTask = 0x190;
                        } else if (UserStatus->CheckLife() != 0 && BtActStatus.action_on == 0 &&
                                   NowMonstorUnit->GetMonstorNum() <= 0 &&
                                   (script = BtEventInfo.unk_A0) != -1) {
                            BtEventInfo.unk_2C = script;
                            BtEventInfo.unk_34 = BtEventInfo.unk_A4;
                            BtEventInfo.unk_A0 = -1;
                            BtEventInfo.unk_A4 = 0;
                            printf("dead script !!\n");
                            gameTask = 0x190;
                        } else {
                            MAP_TRAP_CIRCLE *trap = NowDngMap->DistTrapCircle();
                            int event;

                            if (trap != NULL) {
                                SetSystemMes(Run_TrapCircle(trap) + 0x12C, 0x96, 8, 0, NULL, NULL);
                                DngMessMan.unk_08 = 0x96;
                            }
                            if (UserStatus->CheckLife() != 0) {
                                event = RandomItem->checkErr();
                                if (event != 0) {
                                    ClearSystemMes();
                                    if (event == 1) {
                                        SetSystemMes(0x48, 0x78, 8, 0, NULL, NULL);
                                    }
                                    if (event == 2) {
                                        SetSystemMes(0x51, 0x78, 8, 0, NULL, NULL);
                                    }
                                    DngMessMan.unk_08 = 0x78;
                                } else {
                                    event = RandomItem->checkEvent();
                                    if (event != -1) {
                                        switch (event) {
                                            case 195:
                                            case 196:
                                            case 198:
                                            case 201:
                                            case 202:
                                            case 203:
                                            case 204:
                                            case 205:
                                            case 206:
                                                ((CDngStatusData *) UserStatus)->GetItem(event, 0);
                                                BtGetGateKey_Init(event);
                                                gameTask = 0x1FE;
                                                break;
                                            default:
                                                BtGetAttach_Init(selectMapNo, event);
                                                DngMessMan.unk_08 = 0x78;
                                                SndSePlay(0xDF, -1, 0);
                                                autoCamTrial();
                                                break;
                                        }
                                    }
                                    goto steal;
                                }
                            } else {
                            steal:
                                if (UserStatus->CheckLife() != 0) {
                                    int stolen = StealItem.checkEvent();

                                    if (stolen != -1) {
                                        BtGetAttach_Init(selectMapNo, stolen);
                                        DngMessMan.unk_08 = 0x78;
                                        SndSePlay(0xDF, -1, 0);
                                        autoCamTrial();
                                    }
                                }
                                if (BtActStatus.unk_064 != 0 && BtActStatus.unk_098 == 0) {
                                    CDungeonEventData *state = NowEventMan->SearchDataSlotPos2(pos);
                                    sceVu0FVECTOR slot_pos;
                                    sceVu0FVECTOR slot_dir;

                                    if (state != NULL && state->event->chara_no != -1 &&
                                        UserStatus->cur_chara == state->chara_done) {
                                        state = NULL;
                                    }
                                    BtEventInfo.unk_2C = -1;
                                    if (state != NULL && state->event->script_no != -1) {
                                        BtEventInfo.unk_2C = state->event->script_no;
                                        BtEventInfo.unk_34 = state->event->unk_38;
                                        BtEventInfo.unk_38 = 1;
                                        BtEventInfo.unk_24 = 0;
                                        sceVu0CopyVector(slot_pos, state->pos);
                                        sceVu0CopyVector(slot_dir, state->dir);
                                        sceVu0CopyVector(BtEventInfo.unk_00, slot_pos);
                                        sceVu0CopyVector(BtEventInfo.unk_10, slot_dir);
                                    }
                                    if (BtEventInfo.unk_2C != -1) {
                                        if (state->event->chara_no != -1 &&
                                            GamePad.Down(PadInput_OK) != 0) {
                                            if (UserStatus->cur_chara == state->event->chara_no) {
                                                state->chara_done = UserStatus->cur_chara;
                                            }
                                            gameTask = 0x190;
                                            BtEventInfo.unk_24 = 0;
                                            BtEventInfo.unk_B4 = 1;
                                        }
                                        if (state->event->fade != 0) {
                                            EdFadeInit();
                                            EdFadeOut(0x78, 0.0f, 0.0f, 0.0f);
                                            BtEventInfo.unk_38 = 0;
                                            gameTask = 0x1F4;
                                        } else if (state->unk_30 != 0 && GamePad.Down(0x80) != 0) {
                                            gameTask = 0x190;
                                            BtEventInfo.unk_24 = 2;
                                        } else if (GamePad.Down(PadInput_OK) != 0) {
                                            gameTask = 0x190;
                                            BtEventInfo.unk_24 = 1;
                                        } else {
                                            goto action;
                                        }
                                    } else {
                                        goto action;
                                    }
                                } else {
                                action:
                                    if (BtActStatus.unk_094 != 0) {
                                        BtActStatus.action_on = 0;
                                        BtActStatus.unk_028 = 0;
                                        BtActStatus.unk_040 = 0;
                                        BtActStatus.unk_070 = 0;
                                        BtActStatus.unk_064 = 1;
                                        BtActStatus.action_no = 0;
                                        BtActStatus.unk_048 = 100.0f;
                                        BtActStatus.unk_0A4 = 0;
                                        ResetMovePower();
                                    }
                                    if (GamePad.Down(PadInput_OK | 0x80) != 0 &&
                                        BtActStatus.unk_098 == 0 && BtActStatus.unk_094 != 0) {
                                        SetSystemMes(0x47, 0x5A, 8, 0, NULL, NULL);
                                        DngMessMan.unk_08 = 0x5A;
                                        autoCamTrial();
                                        BtActStatus.action_on = 0;
                                        BtActStatus.unk_028 = 0;
                                        BtActStatus.unk_040 = 0;
                                        BtActStatus.unk_070 = 0;
                                        BtActStatus.unk_064 = 1;
                                        BtActStatus.unk_048 = 100.0f;
                                        BtActStatus.unk_0A4 = 0;
                                        ResetMovePower();
                                    } else if (GamePad.Down(PadInput_OK) != 0 &&
                                               BtActStatus.unk_092 == 0xA &&
                                               BtActStatus.unk_098 == 0 &&
                                               UserStatus->cur_chara == 5) {
                                        SetSystemMes(0x50, 0x5A, 8, 0, NULL, NULL);
                                        DngMessMan.unk_08 = 0x5A;
                                        autoCamTrial();
                                    } else {
                                        BtEventItemNo = -1;
                                        if ((iventActive = NowDngMap->GetActiveIvent(CharaFrame)) != -1 &&
                                            BtActStatus.unk_064 != 0 &&
                                            BtActStatus.unk_098 == 0) {
                                            iventInfo = NowDngMap->events[iventActive].kind;
                                            BtEventInfo.unk_38 = 1;
                                            iventMarker = 1;
                                        } else {
                                            iventActive = -1;
                                            iventInfo = -1;
                                            iventMarker = 0;
                                        }
                                        if (GamePad.Down(PadInput_OK) != 0 &&
                                            BtActStatus.unk_098 == 0 && BtActStatus.unk_148 == 0) {
                                            if (iventActive != -1 && BtActStatus.unk_020 == 0) {
                                                int done = 0;
                                                int index;

                                                switch (NowDngMap->events[iventActive].kind) {
                                                    case 2:
                                                        BtActStatus.unk_00C = 0;
                                                        index = NowDngMap->events[iventActive].index;
                                                        if (NowDngMap->boxes[index].kind == 0) {
                                                            if (NowDngMap->boxes[index].unk_30 == 0) {
                                                                gameTask = 0x78;
                                                                done = 1;
                                                                goto opened;
                                                            }
                                                            if (NowDngMap->boxes[index].unk_30 == 5) {
                                                                sceVu0FVECTOR box_pos;
                                                                sceVu0FVECTOR box_dir = {0.0f, 0.0f,
                                                                                         0.0f, 1.0f};

                                                                sceVu0CopyVector(
                                                                    box_pos,
                                                                    NowDngMap->events[iventActive].pos);
                                                                sceVu0CopyVector(BtEventInfo.unk_00,
                                                                                 box_pos);
                                                                sceVu0CopyVector(BtEventInfo.unk_10,
                                                                                 box_dir);
                                                                NowDngMap->events[iventActive].kind = -1;
                                                                BtEventInfo.unk_2C = 0x10;
                                                                BtEventInfo.unk_34 = 0;
                                                                BtEventInfo.unk_AC = index;
                                                                BtEventInfo.unk_24 = 1;
                                                                gameTask = 0x190;
                                                                ResetMovePower();
                                                                done = 1;
                                                            } else {
                                                                BtEventInfo.unk_2C = 0xF;
                                                                BtEventInfo.unk_34 = 0;
                                                                BtEventInfo.unk_AC = index;
                                                                BtEventInfo.unk_24 = 1;
                                                                gameTask = 0x190;
                                                                ResetMovePower();
                                                                done = 1;
                                                            }
                                                        } else {
                                                            done = 1;
                                                            gameTask = 0x82;
                                                        opened:
                                                            SndSePlay(1, -1, 0);
                                                        }
                                                        break;
                                                    case 3:
                                                        BtActStatus.unk_00C = 0;
                                                        if (NowDngMap
                                                                ->atra[NowDngMap
                                                                           ->events[iventActive]
                                                                           .index]
                                                                .used != 0) {
                                                            s8 chara = UserStatus->cur_chara;

                                                            if (UserStatus->cur_chara == 0) {
                                                                gameTask = 0x8C;
                                                                done = 1;
                                                                SndSePlay(1, -1, 0);
                                                            } else {
                                                                NotGetAtraMes(chara, 0x5A);
                                                                DngMessMan.unk_08 = 0x5A;
                                                            }
                                                        }
                                                        break;
                                                    case 8:
                                                        index = NowDngMap->events[iventActive].index;

                                                        CMonstorUnit *unit = NowMonstorUnit;

                                                        if (NowDngMap->boxes[index].item_no >= 0 &&
                                                            NowDngMap->boxes[index].item_no < 0x11) {
                                                            unit->monster[NowDngMap->boxes[index].item_no].unk_0D4 = 1;
                                                        }
                                                        NowDngMap->boxes[index].used = 0;
                                                        NowDngMap->events[iventActive].kind = -1;
                                                        done = 1;
                                                        break;
                                                }
                                                if (done != 0) {
                                                    break;
                                                }
                                                goto play;
                                            } else {
                                                switch (UserStatus->cur_chara) {
                                                    case 0:
                                                        ToanKey_On();
                                                        break;
                                                    case 1:
                                                        BattleActionOn_Jinn();
                                                        break;
                                                    case 2:
                                                        GoroKey_On();
                                                        break;
                                                    case 3:
                                                        BattleActionOn_Ruby();
                                                        break;
                                                    case 4:
                                                        UngagaKey_On();
                                                        break;
                                                    case 5:
                                                        if (BtActStatus.unk_0A0 == 0) {
                                                            BattleActionOn_Ozumond();
                                                        }
                                                        if (BtActStatus.unk_0A0 == 1) {
                                                            BattleActionOn_Ozumond_H();
                                                        }
                                                        if (BtActStatus.unk_0A0 == 2) {
                                                            BattleActionOn_Ozumond_F();
                                                        }
                                                        break;
                                                }
                                                goto play;
                                            }
                                        } else {
                                        play:
                                            if (BtActStatus.action_on == 1) {
                                                switch (UserStatus->cur_chara) {
                                                    case 0:
                                                        ToanKey_Play();
                                                        break;
                                                    case 1:
                                                        BattleActionPlay_Jinn(&CharaMain, 0);
                                                        break;
                                                    case 2:
                                                        GoroKey_Play();
                                                        break;
                                                    case 3:
                                                        BattleActionPlay_Ruby(&CharaMain, 0);
                                                        break;
                                                    case 4:
                                                        UngagaKey_Play();
                                                        break;
                                                    case 5:
                                                        if (BtActStatus.unk_0A0 == 0) {
                                                            BattleActionPlay_Ozumond(0);
                                                        }
                                                        if (BtActStatus.unk_0A0 == 1) {
                                                            BattleActionPlay_Ozumond_H(0);
                                                        }
                                                        if (BtActStatus.unk_0A0 == 2) {
                                                            BattleActionPlay_Ozumond_F(0);
                                                        }
                                                        break;
                                                }
                                            }
                                            BtBySpeedFlag = 0;
                                            if (GamePad.On(0x80) != 0 && BtActStatus.unk_098 == 0 &&
                                                lockOnTargetFlag == 0) {
                                                if (DebugStatus[5] == 0) {
                                                    BtBySpeedFlag = 1;
                                                }
                                                if (BtActStatus.action_on == 0 && gameTask != 0xF0 &&
                                                    BtActStatus.unk_064 != 0) {
                                                    s16 *slots = UserStatus->active_item;

                                                    if (activeItem.CheckStatusType() == 3 &&
                                                        slots[itemNowSel + 3] > 0) {
                                                        s32 *vol;

                                                        // A running item that
                                                        // boosts is spent by the
                                                        // frame while the button
                                                        // is held.
                                                        BtBySpeedFlag = 1;
                                                        vol = &UserStatus
                                                                   ->active_item_vol[itemNowSel - 1];
                                                        if ((*vol -= 1) <= 0) {
                                                            DelActiveItem(itemNowSel);
                                                            DngMessMan.unk_24 = 0xB6;
                                                            DngMessMan.unk_0C =
                                                                GetCommonItemDataSystemMsg(-1);
                                                            DngMessMan.unk_04 = 0xB4;
                                                            DngMessMan.unk_1C = 0;
                                                        }
                                                    }
                                                }
                                            }
                                            if (GamePad.Down(0x80) != 0 && BtActStatus.unk_098 == 0 &&
                                                BtActStatus.action_on == 0 && gameTask != 0xF0 &&
                                                BtActStatus.unk_064 != 0) {
                                                int used;
                                                s16 *slots = UserStatus->active_item;

                                                used = checkItemUsed(itemNowSel - 1);

                                                if (activeItem.CheckStatusType() == 2 && used != 0 &&
                                                    slots[itemNowSel + 3] > 0) {
                                                    CMonUnitHold = 1;
                                                    CEffectHold = 1;
                                                    BtActStatus.action_on = 3;
                                                    BtActStatus.unk_064 = 0;
                                                    BtActStatus.unk_070 = 1;
                                                    if (activeItem.model[8] == -1) {
                                                        activeItem.model[8] =
                                                            activeItem.models->SetHandModel(
                                                                activeItem.model[activeItem.now]);
                                                    }
                                                }
                                                if (activeItem.CheckStatusType() == 4 && used != 0 &&
                                                    slots[itemNowSel + 3] > 0) {
                                                    s16 *left;
                                                    s16 *item;

                                                    setUnitAmbientAnime(64.0f, 1.0f, 0.0f, 122.0f,
                                                                        208.0f);
                                                    SndSePlay(0x13, -1, 0);

                                                    s32 taken = activeItem.item[activeItem.now];

                                                    usedActiveItem(UserStatus, taken);

                                                    s16 *inner = UserStatus->active_item;

                                                    item = &inner[itemNowSel];
                                                    left = &item[3];
                                                    if (*left == 1) {
                                                        s32 *model;

                                                        item[0] = -1;
                                                        inner[itemNowSel + 3] = 0;
                                                        if (activeItem.model[itemNowSel] != -1) {
                                                            model = &activeItem.model[(s32) itemNowSel];
                                                            activeItem.models->DeleteModel(
                                                                activeItem.model[itemNowSel]);
                                                            *model = -1;
                                                        }
                                                    } else {
                                                        (*left)--;
                                                    }
                                                    SndSePlay(0x1B8, -1, 0);
                                                }
                                                if (activeItem.CheckStatusType() == 1 &&
                                                    BtActStatus.unk_064 != 0 && used != 0 &&
                                                    BtActStatus.action_on != 2 &&
                                                    slots[itemNowSel + 3] > 0) {
                                                    printf("throw !!\n");
                                                    if (lockOnTargetFlag == 0) {
                                                        sceVu0FVECTOR hand;

                                                        BtActStatus.action_on = 2;
                                                        BombInfo.unk_14 = 1;
                                                        BombInfo.unk_18 = -1;
                                                        sceVu0CopyVector(hand, CharaMain.pos);
                                                        getCharacterVector(BombInfo.pos, 0.0f);
                                                        BombInfo.pos[0] +=
                                                            hand[0] + 30.0f * BombInfo.pos[0];
                                                        BombInfo.pos[1] = hand[1];
                                                        BombInfo.pos[2] +=
                                                            hand[2] + 30.0f * BombInfo.pos[2];
                                                        BtActStatus.unk_00C = 0x1A;
                                                        BtActStatus.unk_064 = 0;
                                                        BtActStatus.unk_070 = 1;
                                                        if (activeItem.model[8] == -1) {
                                                            activeItem.model[8] =
                                                                activeItem.models->SetHandModel(
                                                                    activeItem.model[activeItem.now]);
                                                        }
                                                    } else {
                                                        BombInfo.unk_18 = 1;
                                                        BtActStatus.action_on = 2;
                                                        BtActStatus.unk_00C = 0x1B;
                                                        BtActStatus.unk_064 = 0;
                                                        BtActStatus.unk_070 = 1;
                                                        if (activeItem.model[8] == -1) {
                                                            activeItem.model[8] =
                                                                activeItem.models->SetHandModel(
                                                                    activeItem.model[activeItem.now]);
                                                        }
                                                    }
                                                }
                                            }
                                            {
                                                CDungeonEventData *state =
                                                    NowEventMan->SearchDataSlotPos(pos);
                                                sceVu0FVECTOR slot_pos;
                                                sceVu0FVECTOR slot_dir;

                                                if (state != NULL && BtActStatus.unk_064 != 0 &&
                                                    state->event->chara_no != -1) {
                                                    BtEventInfo.unk_2C = -1;
                                                    if (state->event->script_no != -1) {
                                                        BtEventInfo.unk_2C = state->event->script_no;
                                                        BtEventInfo.unk_34 = state->event->unk_38;
                                                        BtEventInfo.unk_24 = 0;
                                                        sceVu0CopyVector(slot_pos, state->pos);
                                                        sceVu0CopyVector(slot_dir, state->dir);
                                                        sceVu0CopyVector(BtEventInfo.unk_00, slot_pos);
                                                        sceVu0CopyVector(BtEventInfo.unk_10, slot_dir);
                                                    }
                                                    if (BtEventInfo.unk_2C != -1) {
                                                        gameTask = 0x190;
                                                        BtEventInfo.unk_24 = 1;
                                                        BtEventInfo.unk_B4 = 0;
                                                    } else {
                                                        goto step;
                                                    }
                                                } else {
                                                step:
                                                    BattleActionThlow();
                                                    BattleActionDrink();

                                                    int ok = 1;
                                                    if (BtActStatus.action_on != 0) {
                                                        ok = 0;
                                                    }
                                                    BtActStatus.unk_068 = 0;
                                                    if (BtActStatus.action_on == 1) {
                                                        int slow = 0;

                                                        if (BtActStatus.action_no == 0xE &&
                                                            UserStatus->cur_chara == 0) {
                                                            slow = 1;
                                                        }
                                                        if (BtActStatus.action_no == 0xD &&
                                                            UserStatus->cur_chara == 2) {
                                                            slow = 1;
                                                        }
                                                        if (slow != 0) {
                                                            if (stickVector >= 0.1f) {
                                                                velo__2[0] *= 0.4f;
                                                                velo__2[2] *= 0.4f;
                                                                BtActStatus.unk_00C = 0x1E;
                                                                CharaMain.motion_type.motion_info[30]
                                                                    .speed = 0.2f + stickVector / 2.0f;
                                                            }
                                                            ok = 1;
                                                            BtActStatus.unk_068 = 1;
                                                        }
                                                    }
                                                    if (BtActStatus.unk_060 == 5) {
                                                        if (stickVector >= 0.1f) {
                                                            velo__2[0] *= 0.4f;
                                                            velo__2[2] *= 0.4f;
                                                            BtActStatus.unk_00C = 0x21;
                                                            CharaMain.motion_type.motion_info[33]
                                                                .speed = 0.2f + stickVector / 2.0f;
                                                        }
                                                        ok = 1;
                                                        BtActStatus.unk_068 = 1;
                                                    }
                                                    if (UserStatus->cur_chara == 5) {
                                                        ok = 1;
                                                    }
                                                    if (ok == 0 || BtActStatus.unk_064 == 0) {
                                                        velo__2[2] = 0.0f;
                                                        velo__2[1] = 0.0f;
                                                        velo__2[0] = 0.0f;
                                                    }
                                                    BtCheckDamageProc();
                                                    if (BtActStatus.action_on == 4) {
                                                        float end =
                                                            CharaMain.motion_type.motion_info[4].end;

                                                        if (CharaMain.motion_type.state.time >=
                                                                end - 2.0f &&
                                                            CharaMain.motion_type.state.time <= end) {
                                                            BtActStatus.action_on = 0;
                                                        } else {
                                                            BtActStatus.unk_00C = 4;
                                                        }
                                                    }
                                                    if (BtActStatus.action_on == 5) {
                                                        float end =
                                                            CharaMain.motion_type.motion_info[6].end;

                                                        if (CharaMain.motion_type.state.time >=
                                                                end - 2.0f &&
                                                            CharaMain.motion_type.state.time <= end) {
                                                            BtActStatus.action_on = 0;
                                                        } else {
                                                            BtActStatus.unk_00C = 6;
                                                        }
                                                    }
                                                    if (UserStatus->CheckLife() <= 0 &&
                                                        BtActStatus.unk_024 == 0 &&
                                                        BtActStatus.action_on != 5) {
                                                        UserStatus->hp[UserStatus->cur_chara] = 0;
                                                        DeadKeyWait = 0x168;
                                                        DeadKeyStartWait = 0x3C;
                                                        BtActStatus.unk_098 = 0;
                                                        UserStatus->unk_42C8[UserStatus->cur_chara] = 0;
                                                        UserStatus->unk_42E0[UserStatus->cur_chara] = 0;
                                                        LockOffTargte();
                                                        gameTask = 0xC8;
                                                    } else {
                                                        if (BtActStatus.action_on == 5) {
                                                            velo__2[0] = blowVelo[0];
                                                            velo__2[2] = blowVelo[2];
                                                            for (int i = 0; i < 3; i++) {
                                                                float speed = blowVelo[i];

                                                                float step = 0.018f;

                                                                if (speed < 0.0f) {
                                                                    blowVelo[i] = speed + step;
                                                                    if (blowVelo[i] >= -0.01f) {
                                                                        blowVelo[i] = 0.0f;
                                                                    }
                                                                } else {
                                                                    blowVelo[i] = speed - 0.018f;
                                                                    if (blowVelo[i] <= 0.01f) {
                                                                        blowVelo[i] = 0.0f;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        if (BtActStatus.unk_040 > 0 &&
                                                            BtActStatus.unk_040 == 1) {
                                                            velo__2[0] += BtActStatus.unk_030;
                                                            velo__2[1] += BtActStatus.unk_034;
                                                            velo__2[2] += BtActStatus.unk_038;
                                                            BtActStatus.unk_034 -= 0.1f;
                                                        }
                                                        if (BtActStatus.move_power > 0.0f) {
                                                            sceVu0FVECTOR push;

                                                            sceVu0ScaleVectorXYZ(
                                                                push, BtActStatus.move_vector,
                                                                BtActStatus.move_power);
                                                            velo__2[0] += push[0];
                                                            velo__2[2] += push[2];
                                                            BtActStatus.move_power -=
                                                                BtActStatus.move_power_decay;
                                                            if (BtActStatus.move_power <= 0.0f) {
                                                                BtActStatus.move_power = 0.0f;
                                                            }
                                                        }
                                                        BtActStatus.unk_092 = 0;
                                                        if (DebugStatus[5] != 0) {
                                                            if (NowDngMap->unk_BDEC != 1) {
                                                                sceVu0FVECTOR moved;
                                                                MoveCheckInfo info;
                                                                sceVu0FVECTOR parts_pos;
                                                                CBoxVu0 bound;
                                                                CCPoly foot;
                                                                CCPoly *polys;
                                                                int mode;

                                                                WorkBuffer__2->used = 0;
                                                                polys = (CCPoly *) WorkBuffer__2->Alloc(
                                                                    0x7D0);
                                                                bound.max[0] = 20.0f + pos[0];
                                                                bound.max[1] = 20.0f + pos[1];
                                                                bound.max[2] = 20.0f + pos[2];
                                                                bound.min[0] = pos[0] - 20.0f;
                                                                bound.min[1] = pos[1] - 40.0f;
                                                                bound.min[2] = pos[2] - 20.0f;
                                                                // A random floor
                                                                // is built from map
                                                                // parts, so the
                                                                // polygons come off
                                                                // each part's own
                                                                // collision model.
                                                                int i = 0;

                                                                colPolyNum = 0;
                                                                for (; NowDngMap->parts[i].frame[0] != NULL;
                                                                     i++) {
                                                                    CFrame *collision;
                                                                    int turn;

                                                                    collision = i == -1
                                                                                    ? NULL
                                                                                    : NowDngMap->parts[i]
                                                                                          .collision;
                                                                    if (collision != NULL) {
                                                                        CDungeonParts *part =
                                                                            &NowDngMap->parts[i];

                                                                        sceVu0CopyVector(parts_pos,
                                                                                         part->unk_110);

                                                                        CDungeonMap *map = NowDngMap;
                                                                        CDungeonParts *part2 =
                                                                            &map->parts[i];

                                                                        turn = (int) part2->unk_170;
                                                                        turn += part2->unk_010;
                                                                        if (turn > 3) {
                                                                            turn -= 3;
                                                                        }
                                                                        if (turn == 3) {
                                                                            turn = -1;
                                                                        }
                                                                        float rot = 3.1415927f * (-90.0f * turn) / 180.0f;

                                                                        collision->SetRotation(0.0f, rot, 0.0f);
                                                                        collision->SetPosition(parts_pos);
                                                                        colPolyNum +=
                                                                            collision->PickUpNearPoly(
                                                                                &polys[colPolyNum],
                                                                                bound);
                                                                    }
                                                                }
                                                                for (int i = 0; i < 24; i++) {
                                                                    if (NowDngMap->boxes[i].used != 0) {
                                                                        CFrame *box =
                                                                            NowDngMap->box_collision_model;

                                                                        box->SetPosition(
                                                                            NowDngMap->boxes[i].pos);
                                                                        colPolyNum +=
                                                                            box->PickUpNearPoly(
                                                                                &polys[colPolyNum],
                                                                                bound);
                                                                    }
                                                                }
                                                                colPolyNum = NowDngMap->CreateCollision(
                                                                    polys, bound, colPolyNum);
                                                                colPolyNum =
                                                                    NowDranMapField->AddCollision(
                                                                        polys, colPolyNum, bound);
                                                                NowMonstorUnit->MoveCheck(
                                                                    pos, velo__2, lockOnTargetFlag);
                                                                mode = 1;
                                                                if (UserStatus->cur_chara == 5) {
                                                                    mode = 8;
                                                                }
                                                                MoveCheck(pos, velo__2, moved, &info,
                                                                          polys, colPolyNum, mode);
                                                                if (colPolyNum >= 0x190) {
                                                                    printf("er -> %d\n", colPolyNum);
                                                                }
                                                                sceVu0SubVector(ref_off, moved, pos);
                                                                veloOld[1] = velo__2[1];
                                                                velo__2[1] -= 0.1f;
                                                                if (velo__2[1] < -10.0f) {
                                                                    velo__2[1] = -10.0f;
                                                                }
                                                                sceVu0CopyVector(pos, moved);
                                                                if (info.unk_00 != 0) {
                                                                    velo__2[1] = 0.0f;
                                                                    foot = info.poly;
                                                                    BtActStatus.unk_090 = foot.attr.foot_sound;
                                                                    BtActStatus.unk_092 = foot.attr.ground_kind;
                                                                }
                                                                if (info.unk_60 != 0) {
                                                                    BtActStatus.unk_044 =
                                                                        pos[1] - info.ground_height;
                                                                }
                                                            } else {
                                                                sceVu0FVECTOR moved;
                                                                MoveCheckInfo info;
                                                                CBoxVu0 bound;
                                                                CCPoly foot;
                                                                CCPoly *polys;
                                                                int mode;
                                                                int x;
                                                                int z;

                                                                WorkBuffer__2->used = 0;
                                                                polys = (CCPoly *) WorkBuffer__2->Alloc(
                                                                    0x7D0);
                                                                bound.max[0] = 20.0f + pos[0];
                                                                bound.max[1] = 20.0f + pos[1];
                                                                bound.max[2] = 20.0f + pos[2];
                                                                bound.min[0] = pos[0] - 20.0f;
                                                                bound.min[1] = pos[1] - 40.0f;
                                                                bound.min[2] = pos[2] - 20.0f;
                                                                colPolyNum = 0;
                                                                for (z = 0; z < 20; z++) {
                                                                    for (x = 0; x < 20; x++) {
                                                                        CDungeonMap *cmap = NowDngMap;
                                                                        int parts_no =
                                                                            cmap->cells[x + z * 20]
                                                                                .parts_no;
                                                                        CFrame *collision;
                                                                        MAP_CELL *cell;
                                                                        int turn;

                                                                        collision =
                                                                            parts_no == -1
                                                                                ? NULL
                                                                                : NowDngMap
                                                                                      ->parts[parts_no]
                                                                                      .collision;
                                                                        cell = &NowDngMap
                                                                                    ->cells[x + z * 20];
                                                                        if (selectMapNo == 5 &&
                                                                            parts_no >= 0x28 &&
                                                                            parts_no < 0x2C) {
                                                                            cell->unk_08 -= 160.0f;
                                                                        }
                                                                        if (collision != NULL &&
                                                                            cell->unk_08 <= 240.0f) {
                                                                            int dir = NowDngMap->cells[x + z * 20].direction;
                                                                            int base = parts_no == -1 ? 0 : NowDngMap->parts[parts_no].unk_010;

                                                                            turn = dir;
                                                                            turn += base;
                                                                            if (turn > 3) {
                                                                                turn -= 3;
                                                                            }
                                                                            if (turn == 3) {
                                                                                turn = -1;
                                                                            }
                                                                            float rot = 3.1415927f *
                                                                                        (-90.0f * turn) / 180.0f;

                                                                            collision->SetRotation(0.0f, rot,
                                                                                                   0.0f);
                                                                            collision->SetPosition(
                                                                                160.0f * x, 0.0f,
                                                                                160.0f * z);
                                                                            colPolyNum +=
                                                                                collision
                                                                                    ->PickUpNearPoly(
                                                                                        &polys
                                                                                            [colPolyNum],
                                                                                        bound);
                                                                        }
                                                                    }
                                                                }
                                                                for (int i = 0; i < 24; i++) {
                                                                    if (NowDngMap->boxes[i].used != 0) {
                                                                        CFrame *box =
                                                                            NowDngMap->box_collision_model;

                                                                        box->SetPosition(
                                                                            NowDngMap->boxes[i].pos);
                                                                        colPolyNum +=
                                                                            box->PickUpNearPoly(
                                                                                &polys[colPolyNum],
                                                                                bound);
                                                                    }
                                                                }
                                                                colPolyNum = NowDngMap->CreateCollision(
                                                                    polys, bound, colPolyNum);
                                                                NowMonstorUnit->MoveCheck(
                                                                    pos, velo__2, lockOnTargetFlag);
                                                                mode = 1;
                                                                if (UserStatus->cur_chara == 5) {
                                                                    mode = 8;
                                                                }
                                                                MoveCheck(pos, velo__2, moved, &info,
                                                                          polys, colPolyNum, mode);
                                                                if (colPolyNum >= 0x190) {
                                                                    printf("er -> %d\n", colPolyNum);
                                                                }
                                                                sceVu0SubVector(ref_off, moved, pos);
                                                                veloOld[1] = velo__2[1];
                                                                velo__2[1] -= 0.1f;
                                                                if (velo__2[1] < -10.0f) {
                                                                    velo__2[1] = -10.0f;
                                                                }
                                                                sceVu0CopyVector(pos, moved);
                                                                if (info.unk_00 != 0) {
                                                                    velo__2[1] = 0.0f;
                                                                    foot = info.poly;
                                                                    BtActStatus.unk_090 = foot.attr.foot_sound;
                                                                    BtActStatus.unk_092 = foot.attr.ground_kind;
                                                                }
                                                                if (info.unk_60 != 0) {
                                                                    BtActStatus.unk_044 =
                                                                        pos[1] - info.ground_height;
                                                                }
                                                            }
                                                        } else {
                                                            pos[0] += velo__2[0];
                                                            pos[1] += velo__2[1];
                                                            pos[2] += velo__2[2];
                                                        }
                                                        if (UserStatus->cur_chara != 5) {
                                                            CharaMain.FootSoundEnable(1);
                                                            CharaMain.EventEnable(1);
                                                            CharaMain.SetFootSoundID(
                                                                BtActStatus.unk_090);
                                                        } else {
                                                            static int snd_cnt;
                                                            static char init;
                                                            static int id_cnt;
                                                            static char init2;

                                                            if (init == 0) {
                                                                snd_cnt = 0;
                                                                init = 1;
                                                            }
                                                            if (init2 == 0) {
                                                                id_cnt = 0;
                                                                init2 = 1;
                                                            }
                                                            snd_cnt++;
                                                            if (snd_cnt >= 5) {
                                                                SndSeSeqPlayStop(0x1CC, 5, id_cnt);
                                                                snd_cnt = 0;
                                                                id_cnt++;
                                                                if (id_cnt >= 0xA) {
                                                                    id_cnt = 0;
                                                                }
                                                            }
                                                        }
                                                        if (pos[1] <= -30.0f && selectMapNo == 0) {
                                                            UserStatus->AddNowLife(
                                                                UserStatus->cur_chara, -0x28, 10.0f);
                                                            setUnitAmbientAnime(120.0f, 1.0f, 255.0f,
                                                                                0.0f, 0.0f);
                                                            ResetStatusInfo();
                                                            BtEventInfo.unk_2C = 5;
                                                            BtEventInfo.unk_34 = 0;
                                                            EdFadeOut(0x78, 0.0f, 0.0f, 0.0f);
                                                            gameTask = 0x1F4;
                                                        } else {
                                                            float time;

                                                            if (CharaMain.motion_type.state.time >=
                                                                    (float) 0x12F &&
                                                                CharaMain.motion_type.state.time <=
                                                                    318.0f) {
                                                                sceVu0FVECTOR run_pos;

                                                                sceVu0CopyVector(run_pos,
                                                                                 CharaFrame->position);
                                                                CRunFx__2.Set(run_pos);
                                                            }
                                                            if (BtActStatus.unk_098 == 0) {
                                                                int dust = 0;

                                                                time = CharaMain.motion_type.state.time;
                                                                if (time >= 75.0f && time <= 76.0f) {
                                                                    dust = 1;
                                                                }
                                                                if (time >= 77.0f && time <= 78.0f) {
                                                                    dust = 1;
                                                                }
                                                                if (time >= 85.0f && time <= 86.0f) {
                                                                    dust = 1;
                                                                }
                                                                if (time >= 87.0f && time <= 88.0f) {
                                                                    dust = 1;
                                                                }
                                                                if (CharaMain.motion_no == 2) {
                                                                    if (DistVector(velo__2) >= 0.4f) {
                                                                        if (time >= 38.0f &&
                                                                            time <= 39.0f) {
                                                                            dust = 1;
                                                                        }
                                                                        if (time >= 45.0f &&
                                                                            time <= 46.0f) {
                                                                            dust = 1;
                                                                        }
                                                                    } else {
                                                                        dust = 0;
                                                                    }
                                                                }
                                                                if (dust != 0) {
                                                                    sceVu0FVECTOR step_pos;

                                                                    sceVu0CopyVector(step_pos,
                                                                                     CharaFrame->position);
                                                                    if (UserStatus->cur_chara != 5) {
                                                                        CRunFx__2.Set(step_pos);
                                                                    }
                                                                }
                                                            }
                                                            HealingWater();
                                                            rx = GamePad.GetRXf();
                                                            NowCamera__3->AddHeight(-GamePad.GetRYf());
                                                            if (NowCamera__3->GetHeight() >= 30.0f) {
                                                                NowCamera__3->SetHeight(30.0f);
                                                            }
                                                            NowCamera__3->AddAngle(0.04f * -rx);
                                                            if (lockOnTargetFlag == 0) {
                                                                if (GamePad.On(8) != 0) {
                                                                    NowCamera__3->AddAngle(
                                                                        -0.034906585f);
                                                                }
                                                                if (GamePad.On(4) != 0) {
                                                                    NowCamera__3->AddAngle(
                                                                        0.034906585f);
                                                                }
                                                            }
                                                            if (GamePad.On(1) != 0) {
                                                                sceVu0FMATRIX look;

                                                                CharaFrame->GetLWMatrix(look);
                                                                NowCamera__3->SetAngle(
                                                                    atan2f(look[2][0], look[2][2]) -
                                                                    3.141592653589793);
                                                            }
                                                            if (GamePad.Down(2) != 0 &&
                                                                BtActStatus.unk_020 == 0 &&
                                                                BtActStatus.unk_070 == 0) {
                                                                oldCameraAngle =
                                                                    NowCamera__3->GetAngle();
                                                                oldCameraHeight =
                                                                    NowCamera__3->GetHeight();
                                                                NowCamera__3->FollowOff();
                                                                BtActStatus.unk_000 = 0;
                                                                viewMode__2 = 1;
                                                                InitEyeCamera();
                                                                if (UserStatus->cur_chara == 1) {
                                                                    EquipReAttach(NowWeapon, 1);
                                                                }
                                                                BtActStatus.unk_028 = 0;
                                                                BtActStatus.unk_00C = 0;
                                                                BtActStatus.action_on = 0;
                                                                BtActStatus.action_no = 0;
                                                                LockOffTargte();
                                                                ResetMovePower();
                                                                if (ruby_effect_id != -1 &&
                                                                    UserStatus->cur_chara == 3) {
                                                                    NowMainEffect->OffEffect(
                                                                        ruby_effect_id);
                                                                    ruby_effect_id = -1;
                                                                }
                                                                gameTask = 0xA;
                                                            } else {
                                                                sceVu0FVECTOR follow;

                                                                if (pos[1] < -100.0f) {
                                                                    pos[1] += 200.0f;
                                                                }
                                                                CharaFrame->SetPosition(pos[0], pos[1],
                                                                                        pos[2]);
                                                                sceVu0CopyVector(follow, pos);
                                                                follow[0] += 7.0f * ref_off[0];
                                                                follow[1] +=
                                                                    BtActStatus.unk_120 +
                                                                    (6.0f + (2.0f * ref_off[1] +
                                                                             reference[1]));
                                                                follow[2] += 7.0f * ref_off[2];
                                                                NowCamera__3->SetFollow(
                                                                    follow[0], follow[1], follow[2]);
                                                                if (lockOnTargetFlag != 0) {
                                                                    CCharacter *locked =
                                                                        &NowMonstorUnit
                                                                             ->chara[lockOnTargetNo][0];
                                                                    sceVu0FVECTOR to_target;
                                                                    sceVu0FVECTOR target;
                                                                    float dist;

                                                                    locked->GetPosition(target);
                                                                    dist = DistVector(target, pos);
                                                                    to_target[0] = target[0] - pos[0];
                                                                    to_target[1] = target[1] - pos[1];
                                                                    to_target[2] = target[2] - pos[2];
                                                                    to_target[3] = 1.0f;
                                                                    if (dist >= 20.0f) {
                                                                        dist = 20.0f;
                                                                    }
                                                                    sceVu0Normalize(to_target,
                                                                                    to_target);
                                                                    sceVu0ScaleVectorXYZ(
                                                                        to_target, to_target, dist);
                                                                    to_target[1] = 0.0f;
                                                                    NowCamera__3->SetFollow(
                                                                        pos[0] + to_target[0],
                                                                        BtActStatus.unk_120 +
                                                                            (to_target[1] +
                                                                             (6.0f + pos[1] +
                                                                              reference[1])),
                                                                        pos[2] + to_target[2]);
                                                                }
                                                                autoCamTrial();
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            break;
        case 0x1F4:
            gameTask = 0x190;
            break;
        case 0x226:
            if (EdFadeOutCheck() != 0) {
                int i;
                CSHOT_EFFECT *effects = NowShotEffect->effect;

                for (i = 0; i < 5; i++) {
                    effects[i].Initialize();
                }
                NowMonstorUnit->CleanViewMonstor(BtUraDongeon);

                CMonstorUnit *unit = (CMonstorUnit *) NowMonstorUnit;

                unit->unk_094 = -1;
                driveStepHold = 0;
                gameTask = 0x190;
            }
            break;
        case 0x190:
            LockOffTargte();
            CharaMain.motion_no = 0;
            CharaMain.flags = 0;
            CharaMain.motion_speed = -1.0f;
            BtActStatus.action_on = 0;
            DngMessMan.unk_00 = 0;
            DngMessMan.unk_24 = -1;
            DngMessMan.unk_04 = 0;
            DngMessMan.unk_1C = 0;
            DngMessMan.unk_20 = 0;
            DngMessMan.unk_08 = 0;
            DngMes1.mes_made = -1;
            DngMes2.mes_made = -1;
            DngMesStb.mes_made = -1;
            BtEventInfo.unk_30 = BtEventInfo.unk_2C;
            BtEventInfo.unk_2C = -1;
            ResetMovePower();
            BtSystemScriptInit();
            if (BtEventInfo.unk_34 == 0) {
                printf("********** system mem !!!\n");
                BtCashBuffer.buffer = BtScriptWorkBuffer.buffer;
                BtCashBuffer.size = 0x186A0;
                BtCashBuffer.used = 0;
            }
            if (BtEventInfo.unk_34 != 0) {
                int i;
                CSHOT_EFFECT *effects;

                printf("********** ext mem !!!\n");
                TexManager.DeleteTextureBlock(0x2A);
                TexManager.DeleteTextureBlock(0x26);
                TexManager.CleanUpBuffer();
                TexManager.CleanUpTextureList();
                effects = NowShotEffect->effect;
                for (i = 0; i < 5; i++) {
                    effects[i].Initialize();
                }
                MainMonstorUnit.CleanViewMonstor(BtUraDongeon);
                MonstorModelBuffer.used = 0;
                s32 cash_size = MonstorModelBuffer.size;
                u8 *cash = MonstorModelBuffer.buffer;

                BtCashBuffer.buffer = cash;
                BtCashBuffer.size = cash_size + 0x88B8;
                BtCashBuffer.used = 0;
                read_buffer = old_read_buffer + 0x88B80 / 4;
            }
            if (BtSystemScriptRun(BtEventInfo.unk_30, &BtCashBuffer) == 0) {
                BtSystemScriptAfter();
                gameTask = 0;
            } else {
                gameTask++;
            }
            break;
        case 0x191:
            if (EdEventMode(NowCamera__3, 0) > 0) {
                BtSystemScriptAfter();
                read_buffer = old_read_buffer;
                DngMes1.mes_made = -1;
                DngMes2.mes_made = -1;
                DngMesStb.mes_made = -1;
                Mes1MakeFlg = 1;
                Mes2MakeFlg = 1;
                DngMessMan.unk_24 = -1;
                DngMessMan.unk_04 = 0;
                DngMessMan.unk_1C = 0;
                DngMessMan.unk_20 = 0;
                DngMessMan.unk_08 = 0;
                DngMessMan.unk_00 = 1;
                gameTask = 0;
                printf("exit script\n");
                if (EdEventInfo.return_code == 8) {
                    existFlag = 1;
                }
            }
            SetBattleStyle(selectMapNo, 1);
            switch (BtEventInfo.unk_98) {
                case 1:
                    BtEventInfo.unk_98 = 0;
                    BtMiniItemSelect();
                    gameTask = 0x19A;
                    break;
                case 2:
                    BtEventInfo.unk_98 = 0;
                    gameTask = 0xA0;
                    break;
                case 3:
                    BtEventInfo.unk_98 = 0;
                    InitDunEnterMenu(0x17, selectMapNo, -1);
                    BtGameModeFlag = 4;
                    break;
                case 6:
                    BtEventInfo.unk_98 = 0;
                    DngEscapeMsgInit(&DngMes2, &DngMes1, 0);
                    BtGameModeFlag = 7;
                    break;
                case 4:
                    BtEventInfo.unk_98 = 0;
                    BtSystemScriptAfter();
                    read_buffer = old_read_buffer;
                    ClearGateKeyStack();
                    SaveData->AddNowTime(1.0f);
                    DngMes1.mes_made = -1;
                    DngMes2.mes_made = -1;
                    DngMesStb.mes_made = -1;
                    Mes1MakeFlg = 1;
                    Mes2MakeFlg = 1;
                    DngMessMan.unk_24 = -1;
                    DngMessMan.unk_04 = 0;
                    DngMessMan.unk_1C = 0;
                    DngMessMan.unk_20 = 0;
                    DngMessMan.unk_08 = 0;
                    DngMessMan.unk_00 = 1;
                    if (UserStatus->res_limit_zone_current != -1) {
                        DngMessMan.LimmitZone();
                        SndSPSePlay(0x1B, -1);
                    }
                    if (UserStatus->CheckLife() <= 0) {
                        UserStatus->hp[UserStatus->cur_chara] = 1;
                    }
                    rogoSwitch2 = 1;
                    infoMap = 0;
                    infoMapOld = 0;
                    rogoY3 = -0x60;
                    startCnt2 = 0;
                    gameTask = 0;
                    printf("go dungeon\n");
                    break;
                case 5:
                    BtEventInfo.unk_98 = 0;
                    BtSystemScriptAfter();
                    BtEventInfo.unk_2C = BtEventInfo.unk_9C;
                    gameTask = 0x190;
                    break;
            }
            break;
        case 0x19A:
            if (BtMiniItemSelect_Loop() != 0) {
                gameTask = 0x191;
                DngMes1.mes_made = -1;
                DngMes2.mes_made = -1;
                DngMesStb.mes_made = -1;
            }
            break;
        case 0xA0: {
            int ura = BtUraDongeon;
            CMonstorUnit *unit = NowMonstorUnit;

            unit->unk_048 = 0;
            unit->unk_090 = 0;
            for (int i = 0; i < 16; i++) {
                unit->script[i] = &MonstorScriptBuffer[i];
            }
            unit->unk_094 = -1;
            unit->CleanViewMonstor(ura);
            BtSetEventExtendTable();
            if (BtUraDongeon == 0) {
                BtUraDongeon = 1;
                NowDngMap = &UraDungeonMap;
                NowEventMan = &UraEventMan;
                NowDngMap->RsetMimicEvent();
                RandomItem = &SubRandomItem;
                NowMonstorUnit->CleanViewMonstor(BtUraDongeon);

                int ura = BtUraDongeon;
                CMonstorUnit *unit2 = NowMonstorUnit;

                unit2->unk_048 = 0;
                unit2->unk_090 = 0;
                for (int i = 0; i < 16; i++) {
                    unit2->script[i] = &MonstorScriptBuffer[i];
                }
                unit2->unk_094 = -1;
                unit2->CleanViewMonstor(ura);
                BtSetEventExtendTable();
                BtLoadMonstor(1);
                NowMonstorUnit->ArrangementPos(&UraDungeonMap, 8, -1, 0);
                NowDngMap->DrawMapCalc(NowDngMap->unk_BDEC);
                lightingMode = 1;
            } else {
                BtUraDongeon = 0;
                NowDngMap = &MainDungeonMap;
                NowEventMan = &DngEventMan;
                NowMonstorUnit = &MainMonstorUnit;
                NowDngMap->RsetMimicEvent();
                RandomItem = &MainRandomItem;
                MainMonstorUnit.CleanViewMonstor(BtUraDongeon);

                int ura = BtUraDongeon;

                MainMonstorUnit.unk_048 = 0;
                MainMonstorUnit.unk_090 = 0;
                for (int i = 0; i < 16; i++) {
                    MainMonstorUnit.script[i] = &MonstorScriptBuffer[i];
                }
                MainMonstorUnit.unk_094 = -1;
                MainMonstorUnit.CleanViewMonstor(ura);
                BtSetEventExtendTable();
                BtLoadMonstor(0);
                MainMonstorUnit.ArrangementPos(&MainDungeonMap, 0xF, -1, 0);
                NowDngMap->DrawMapCalc(NowDngMap->unk_BDEC);
                lightingMode = 0;
            }
            gameTask = 0x191;
            break;
        }
        case 0xDC:
            driveStepHold = 1;
            CMonUnitHold = 1;
            CEffectHold = 1;
            DebugStatus[0] = 1;
            GamePad.SetAutoRepeat(0xF00F, 0x14, 3);
            gameTask++;
            break;
        case 0xDD:
            switch (DebugInfomationIF()) {
                case 0x28:
                    GamePad.AutoRepeatOff();
                    driveStepHold = 0;
                    CMonUnitHold = 0;
                    CEffectHold = 0;
                    gameTask++;
                    break;
                case 0x3C:
                    GamePad.AutoRepeatOff();
                    driveStepHold = 0;
                    CMonUnitHold = 0;
                    CEffectHold = 0;
                    gameTask = 0xE3;
                    break;
                case 0x64:
                    GamePad.AutoRepeatOff();
                    driveStepHold = 0;
                    CMonUnitHold = 0;
                    CEffectHold = 0;
                    gameTask = 0xE4;
                    break;
                case 0x8C:
                    GamePad.AutoRepeatOff();
                    driveStepHold = 0;
                    CMonUnitHold = 0;
                    CEffectHold = 0;
                    gameTask = 0;
                    break;
                case 0x1:
                    GamePad.AutoRepeatOff();
                    driveStepHold = 0;
                    CMonUnitHold = 0;
                    CEffectHold = 0;
                    lightingMode = DebugStatus[16];
                    gameTask = 0;
                    break;
                case 0x50:
                    GamePad.AutoRepeatOff();
                    for (int i = 0; i < 8; i++) {
                        int atra_no = NowDngMap->atra[i].atra_no;

                        if (atra_no != -1) {
                            CUserStatus *who = UserStatus;

                            getAtraToSaveData(who->atra_data[selectMapNo][atra_no].unk_00, atra_no,
                                              SaveData, selectMapNo, who->cur_floor);
                        }
                    }
                    driveStepHold = 0;
                    CMonUnitHold = 0;
                    CEffectHold = 0;
                    gameTask = 0;
                    break;
                case 0x5A:
                    GamePad.AutoRepeatOff();
                    driveStepHold = 0;
                    CMonUnitHold = 0;
                    CEffectHold = 0;
                    gameTask++;
                    break;
                case 0x78:
                    GamePad.AutoRepeatOff();
                    switch (DebugStatus[17]) {
                        case 0:
                            UserStatus->unk_42C8[UserStatus->cur_chara] = 0;
                            UserStatus->unk_42E0[UserStatus->cur_chara] = 0;
                            break;
                        case 1:
                            BtSetStatusErr(4);
                            break;
                        case 2:
                            BtSetStatusErr(8);
                            break;
                        case 3:
                            BtSetStatusErr(0x10);
                            break;
                        case 4:
                            BtSetStatusErr(0x20);
                            break;
                        case 5:
                            BtSetStatusErr(0x40);
                            break;
                    }
                    driveStepHold = 0;
                    CMonUnitHold = 0;
                    CEffectHold = 0;
                    gameTask = 0;
                    break;
            }
            break;
        case 0xDE:
            BtEventInfo.unk_2C = DebugStatus[11];
            BtEventInfo.unk_34 = DebugStatus[12];
            BtEventInfo.unk_24 = 0;
            BtSystemScriptLoad(selectMapNo);
            gameTask = 0x190;
            break;
        case 0xE3: {
            int ura = BtUraDongeon;
            CMonstorUnit *unit = NowMonstorUnit;

            unit->unk_048 = 0;
            unit->unk_090 = 0;
            for (int i = 0; i < 16; i++) {
                unit->script[i] = &MonstorScriptBuffer[i];
            }
            unit->unk_094 = -1;
            unit->CleanViewMonstor(ura);
            BtSetEventExtendTable();
            BtLoadMonstor(0);
            NowMonstorUnit->CleanViewMonstor(BtUraDongeon);
            NowMonstorUnit->ArrangementPos(NowDngMap, DebugStatus[13], -1, 0);
            gameTask = 0;
            break;
        }
        case 0xE4: {
            int ura = BtUraDongeon;
            CMonstorUnit *unit = NowMonstorUnit;

            unit->unk_048 = 0;
            unit->unk_090 = 0;
            for (int i = 0; i < 16; i++) {
                unit->script[i] = &MonstorScriptBuffer[i];
            }
            unit->unk_094 = -1;
            unit->CleanViewMonstor(ura);
            BtSetEventExtendTable();
            BtLoadMonstor(0);
            NowMonstorUnit->CleanViewMonstor(BtUraDongeon);
            NowMonstorUnit->ArrangementPos(NowDngMap, DebugStatus[15], DebugStatus[14], 0);
            gameTask = 0;
            break;
        }
        case 0x9B:
            if (GamePad.Down(0x800) != 0) {
                driveStepHold = 0;
                exitMenuFlag = 0;
                CMonUnitHold = 0;
                CEffectHold = 0;
                SndSePlay(1, -1, 0);
                PlayTimeCountFlag(1);
                if (viewMode__2 != 0) {
                    gameTask = 0xA;
                } else {
                    gameTask = 0;
                }
            }
            break;
        case 0x97:
            DispFade__3.FadeInit(0.0f);
            DispFade__3.FadeOutStart(8.0f);
            autoCamTrial();
            gameTask++;
            break;
        case 0x98:
            autoCamTrial();
            if (DispFade__3.GetRate() >= 128.0f) {
                MapJump(0x320, -1);
                existFlag = 1;
            }
            break;
        case 0xAA:
            BtEscape_Init();
            gameTask++;
            break;
        case 0xAB:
            if (BtEscape_Loop() != 0) {
                DispFade__3.FadeInit(128.0f);
                gameTask = 0xB0;
            }
            break;
        case 0xAF:
            DispFade__3.FadeInit(0.0f);
            DispFade__3.FadeOutStart(8.0f);
            autoCamTrial();
            gameTask++;
            break;
        case 0xB0:
            autoCamTrial();
            if (DispFade__3.GetRate() >= 128.0f) {
                int map_no;

                switch (selectMapNo) {
                    case 0:
                        map_no = 0;
                        break;
                    case 1:
                        map_no = 1;
                        break;
                    case 2:
                        map_no = 0x13;
                        break;
                    case 3:
                        map_no = 0x2A;
                        break;
                    case 4:
                        map_no = 0x17;
                        break;
                    case 5:
                        map_no = 0x26;
                        break;
                    case 6:
                        map_no = 0x3C;
                        break;
                }
                MapJump(map_no, -1);
                existFlag = 2;
            }
            break;
        case 0x21C:
            if (GamePad.Down(PadInput_OK | PadInput_NO) != 0) {
                ClearSystemMes();
                driveStepHold = 0;
                CMonUnitHold = 0;
                CMonUnitHyde = 0;
                CEffectHold = 0;
                CEffectHyde = 0;
                gameTask = 0;
            }
            autoCamTrial();
            break;
        case 0x1FE:
            if (BtGetGateKey_Loop() != 0) {
                gameTask = 0;
            }
            autoCamTrial();
            break;
        case 0x208:
            if (BtGetAttach_Loop() != 0) {
                gameTask = 0;
            }
            break;
        case 0xA:
            EyeCamera();
            if (GamePad.Down(0x800) != 0) {
                exitMenuFlag = 1;
                driveStepHold = 1;
                CMonUnitHold = 1;
                CEffectHold = 1;
                PlayTimeCountFlag(0);
                SndSePlay(1, -1, 0);
                gameTask = 0x9B;
            } else {
                int next_task;
                int leaving;
                int hand_ok;

                if (StatusErrCheck(4) != 0) {
                    BtActStatus.unk_098 = 1;
                }
                HealingWater();

                CUserStatus *drain2 = UserStatus;

                hand_ok = 1;
                drain2->water_drain_disable = 1;
                next_task = 0;
                leaving = 0;
                if (NowDngMap->unk_BDEC != 1 && selectMapNo == 0) {
                    sceVu0FVECTOR moved;
                    MoveCheckInfo info;
                    sceVu0FVECTOR parts_pos;
                    CBoxVu0 bound;
                    CCPoly foot;
                    CCPoly *polys;
                    int mode;

                    sceVu0CopyVector(pos, CharaMain.pos);
                    velo__2[2] = 0.0f;
                    velo__2[0] = 0.0f;
                    WorkBuffer__2->used = 0;
                    polys = (CCPoly *) WorkBuffer__2->Alloc(0x7D0);
                    bound.max[0] = 20.0f + pos[0];
                    bound.max[1] = 20.0f + pos[1];
                    bound.max[2] = 20.0f + pos[2];
                    bound.min[0] = pos[0] - 20.0f;
                    bound.min[1] = pos[1] - 40.0f;
                    bound.min[2] = pos[2] - 20.0f;
                    int i = 0;

                    colPolyNum = 0;
                    for (; NowDngMap->parts[i].frame[0] != NULL; i++) {
                        CFrame *collision;
                        int turn;

                        collision = i == -1 ? NULL : NowDngMap->parts[i].collision;
                        if (collision != NULL) {
                            CDungeonParts *part = &NowDngMap->parts[i];

                            sceVu0CopyVector(parts_pos, part->unk_110);

                            CDungeonParts *part2 = &NowDngMap->parts[i];

                            turn = (int) part2->unk_170;
                            turn += part2->unk_010;
                            if (turn > 3) {
                                turn -= 3;
                            }
                            if (turn == 3) {
                                turn = -1;
                            }
                            float rot = 3.1415927f * (-90.0f * turn) / 180.0f;

                            collision->SetRotation(0.0f, rot, 0.0f);
                            collision->SetPosition(parts_pos);
                            colPolyNum += collision->PickUpNearPoly(&polys[colPolyNum], bound);
                        }
                    }
                    colPolyNum = NowDranMapField->AddCollision(polys, colPolyNum, bound);
                    mode = 1;
                    if (UserStatus->cur_chara == 5) {
                        mode = 8;
                    }
                    MoveCheck(pos, velo__2, moved, &info, polys, colPolyNum, mode);
                    if (colPolyNum >= 0x190) {
                        printf("er -> %d\n", colPolyNum);
                    }
                    sceVu0SubVector(ref_off, moved, pos);
                    veloOld[1] = velo__2[1];
                    velo__2[1] -= 0.1f;
                    if (velo__2[1] < -10.0f) {
                        velo__2[1] = -10.0f;
                    }
                    sceVu0CopyVector(pos, moved);
                    if (info.unk_00 != 0) {
                        velo__2[1] = 0.0f;
                        foot = info.poly;
                        BtActStatus.unk_090 = foot.attr.foot_sound;
                        BtActStatus.unk_092 = foot.attr.ground_kind;
                    }
                    if (info.unk_60 != 0) {
                        BtActStatus.unk_044 = pos[1] - info.ground_height;
                    }
                    CharaMain.SetPosition(pos);
                    if (pos[1] <= -30.0f) {
                        leaving = 1;
                    }
                }
                if (GamePad.Down(PadInput_OK) != 0 && BtActStatus.unk_098 == 0 &&
                    BtActStatus.unk_094 != 0) {
                    SetSystemMes(0x47, 0x5A, 8, 0, NULL, NULL);
                    DngMessMan.unk_08 = 0x5A;
                    hand_ok = 0;
                }
                if (GamePad.Down(PadInput_OK) != 0 && BtActStatus.unk_092 == 0xA &&
                    BtActStatus.unk_098 == 0 && UserStatus->cur_chara == 5) {
                    SetSystemMes(0x50, 0x5A, 8, 0, NULL, NULL);
                    DngMessMan.unk_08 = 0x5A;
                    hand_ok = 0;
                }
                s8 who = UserStatus->cur_chara;

                if ((UserStatus->cur_chara == 1 || who == 3 || who == 5) &&
                    hand_ok != 0 && BtActStatus.unk_098 == 0) {
                    float head = viewAngleH__2;

                    if (head - 3.1415927f <= -3.1415927f) {
                        head = viewAngleH__2;
                    }
                    CharaHand.SetRotation(viewAngleV__2, head, 0.0f);
                    CharaMainHandViewFlag = 1;
                    switch (UserStatus->cur_chara) {
                        case 1:
                            if (GamePad.Down(PadInput_OK) != 0) {
                                BattleActionOn_Jinn();
                            }
                            break;
                        case 3:
                            if (GamePad.Down(PadInput_OK) != 0) {
                                BattleActionOn_Ruby();
                            }
                            break;
                        case 5:
                            if (GamePad.Down(PadInput_OK) != 0) {
                                if (BtActStatus.unk_0A0 == 0) {
                                    BattleActionOn_Ozumond();
                                }
                                if (BtActStatus.unk_0A0 == 1) {
                                    BattleActionOn_Ozumond_H();
                                }
                                if (BtActStatus.unk_0A0 == 2) {
                                    BattleActionOn_Ozumond_F();
                                }
                            }
                            break;
                    }
                    if (BtActStatus.action_on == 1) {
                        switch (UserStatus->cur_chara) {
                            case 1:
                                BattleActionPlay_Jinn(&CharaHand, 1);
                                break;
                            case 3:
                                BattleActionPlay_Ruby(&CharaHand, 1);
                                break;
                            case 5:
                                if (BtActStatus.unk_0A0 == 0) {
                                    BattleActionPlay_Ozumond(1);
                                }
                                if (BtActStatus.unk_0A0 == 1) {
                                    BattleActionPlay_Ozumond_H(1);
                                }
                                if (BtActStatus.unk_0A0 == 2) {
                                    BattleActionPlay_Ozumond_F(1);
                                }
                                break;
                        }
                    }
                }
                SetBattleStyle(selectMapNo, 0);
                if (GamePad.Down(0x10) != 0) {
                    int ok = 1;

                    if (BtActStatus.action_on != 0) {
                        ok = 0;
                    }
                    if (BtActStatus.unk_098 != 0) {
                        ok = 1;
                    }
                    if (UserStatus->hp[UserStatus->cur_chara] <= 0) {
                        ok = 0;
                    }
                    if (ok != 0) {
                        gameTask = 0x1E;
                        driveStepHold = 1;
                        SetMIniMapStatus(0);
                        iventInfo = -1;
                        rogoSwitch2 = 0;
                        SndSePlay(1, -1, 0);
                    } else {
                        goto eye_event;
                    }
                } else {
                    CDungeonEventData *state;
                    int damaged;

                eye_event:
                    state = NowEventMan->SearchDataSlotPos(pos);
                    if (state != NULL && state->event->chara_no != -1) {
                        sceVu0FVECTOR slot_pos;
                        sceVu0FVECTOR slot_dir;

                        BtEventInfo.unk_2C = -1;
                        if (state->event->script_no != -1) {
                            BtEventInfo.unk_2C = state->event->script_no;
                            BtEventInfo.unk_34 = state->event->unk_38;
                            BtEventInfo.unk_38 = 1;
                            BtEventInfo.unk_24 = 0;
                            sceVu0CopyVector(slot_pos, state->pos);
                            sceVu0CopyVector(slot_dir, state->dir);
                            sceVu0CopyVector(BtEventInfo.unk_00, slot_pos);
                            sceVu0CopyVector(BtEventInfo.unk_10, slot_dir);
                        }
                        if (BtEventInfo.unk_2C != -1) {
                            leaving = 1;
                            BtEventInfo.unk_24 = 1;
                            BtEventInfo.unk_B4 = 0;
                            next_task = 0x190;
                        }
                    }
                    if (NowMonstorUnit->unk_094 != -1) {
                        BtEventInfo.unk_2C = NowMonstorUnit->unk_094;
                        BtEventInfo.unk_34 = 1;
                        ResetStatusInfo();
                        driveStepHold = 1;
                        EdFadeInit();
                        EdFadeOut(0x78, 0.0f, 0.0f, 0.0f);
                        BtEventInfo.unk_90 = 0;
                        next_task = 0x226;
                        leaving = 1;
                    }
                    if (UserStatus->CheckLife() != 0) {
                        int event = NowMonstorUnit->CheckEventFlag2();

                        if (event != -1) {
                            BtEventInfo.unk_2C = event;
                            BtEventInfo.unk_34 = 0;
                            BtActStatus.unk_070 = 0;
                            next_task = 0x190;
                            leaving = 1;
                        }
                    }
                    if (UserStatus->CheckLife() != 0 && NowMonstorUnit->GetMonstorNum() <= 0) {
                        if (BtEventInfo.unk_A0 != -1) {
                            BtEventInfo.unk_2C = BtEventInfo.unk_A0;
                            BtEventInfo.unk_34 = BtEventInfo.unk_A4;
                            BtEventInfo.unk_A0 = -1;
                            BtEventInfo.unk_A4 = 0;
                            BtActStatus.unk_070 = 0;
                            printf("dead script !!\n");
                            next_task = 0x190;
                            leaving = 1;
                        }
                    }
                    if (UserStatus->CheckLife() != 0) {
                        int stolen = StealItem.checkEvent();

                        if (stolen != -1) {
                            BtGetAttach_Init(selectMapNo, stolen);
                            DngMessMan.unk_08 = 0x78;
                            SndSePlay(0xDF, -1, 0);
                        }
                    }
                    if (UserStatus->CheckLife() <= 0 && BtActStatus.unk_024 == 0) {
                        UserStatus->hp[UserStatus->cur_chara] = 0;
                        DeadKeyWait = 0x168;
                        DeadKeyStartWait = 0x3C;
                        LockOffTargte();
                        next_task = 0xC8;
                        leaving = 1;
                    }
                    damaged = BtCheckDamageProc();
                    if (damaged != 0) {
                        leaving = 1;
                    }
                    if (GamePad.Down(2) != 0 || GamePad.Down(4) != 0 ||
                        GamePad.Down(PadInput_NO) != 0 || leaving != 0) {
                        sceVu0FVECTOR chara_rot;

                        CharaMainHandViewFlag = 0;
                        NowCamera__3->FollowOn();
                        NowCamera__3->SetHeight(oldCameraHeight);
                        NowCamera__3->SetSpeed(1.0f);
                        NowCamera__3->Step(1);
                        NowCamera__3->SetSpeed(8.0f);
                        CharaMain.GetRotation(chara_rot);
                        chara_rot[1] = viewAngleH__2;
                        CharaMain.SetRotation(chara_rot);
                        BtActStatus.unk_000 = 1;
                        viewMode__2 = 0;
                        cameraAuto = cameraAutoOld;
                        if (UserStatus->cur_chara == 1) {
                            EquipReAttach(NowWeapon, 0);
                        }
                        if (ruby_effect_id != -1 && UserStatus->cur_chara == 3) {
                            NowMainEffect->OffEffect(ruby_effect_id);
                            ruby_effect_id = -1;
                        }
                        if (damaged == 0) {
                            BtActStatus.unk_028 = 0;
                            BtActStatus.unk_00C = 0;
                            BtActStatus.action_on = 0;
                        }
                        gameTask = next_task;
                    }
                }
            }
            break;
        case 0x1E:
            oldRogoY3 = rogoY3;
            rogoY3 = -0x60;
            iventInfo = -1;
            oldMsgNo2 = -1;
            oldMsgNo = -1;
            battleMenuWait = 0;
            MonstorNameOff = 1;
            NowCamera__3->SetSpeed(0.0f);
            DngMessMan.unk_00 = 0;
            DngMessMan.unk_24 = -1;
            DngMessMan.unk_04 = 0;
            DngMessMan.unk_1C = 0;
            DngMessMan.unk_20 = 0;
            DngMessMan.unk_08 = 0;
            ClearSystemMes();
            driveStepHold = 1;
            gameTask++;
            break;
        case 0x1F:
            if (battleMenuWait < 3) {
                battleMenuWait++;
            } else {
                frameCaputer = 1;
                gameTask += 2;
            }
            break;
        case 0x20:
            gameTask++;
            break;
        case 0x21: {
            frameCaputer = 0;

            s32 menu[5] = {0x17, 0x18, 0x19, 0x28, 0x29};

            BattleMenuInit(menu, 0);
            BtGameModeFlag = 2;
            oldUnitNow = nowUnitNow;
            NowCamera__3->SetSpeed(8.0f);
            driveStepHold = 0;
            rogoY3 = 0x20;
            DngMes1.mes_made = -1;
            DngMes2.mes_made = -1;
            DngMesStb.mes_made = -1;
            Mes1MakeFlg = 1;
            Mes2MakeFlg = 1;
            DngMessMan.unk_00 = 1;
            DngMessMan.unk_24 = -1;
            DngMessMan.unk_04 = 0;
            DngMessMan.unk_1C = 0;
            DngMessMan.unk_20 = 0;
            DngMessMan.unk_08 = 0xA;
            MonstorNameOff = 0;
            EnemyLifeGage.draw = 1;
            autoCamTrial();
            gameTask++;
            break;
        }
        case 0x22:
            if (MenuMapJumpMode != 0) {
                gameTask = 0xAA;
                autoCamTrial();
            } else {
                if (UserStatus->minimap_status != 3) {
                    infoMap = 1;
                    infoMapOld = 1;
                } else {
                    infoMap = 0;
                    infoMapOld = 0;
                }
                nowUnitNow = UserStatus->cur_chara;
                if (oldUnitNow != nowUnitNow) {
                    gameTask = 0x122;
                    autoCamTrial();
                    if (viewMode__2 != 0) {
                        sceVu0FVECTOR chara_rot;

                        CharaMainHandViewFlag = 0;
                        NowCamera__3->FollowOn();
                        NowCamera__3->SetHeight(oldCameraHeight);
                        NowCamera__3->SetSpeed(1.0f);
                        NowCamera__3->Step(1);
                        NowCamera__3->SetSpeed(8.0f);
                        CharaMain.GetRotation(chara_rot);
                        chara_rot[1] = viewAngleH__2;
                        CharaMain.SetRotation(chara_rot);
                        BtActStatus.unk_000 = 1;
                        viewMode__2 = 0;
                        cameraAuto = cameraAutoOld;
                        if (UserStatus->cur_chara == 1) {
                            EquipReAttach(NowWeapon, 0);
                        }
                    }
                } else {
                    CWeaponFx.InitSet(NowWeapon->frame, "dcol0", "dcol1");
                    SetWeaponAttachStatus(NowWeaponHave);
                    SetWeaponColor();
                    autoCamTrial();
                    if (viewMode__2 != 0) {
                        gameTask = 0xA;
                    } else {
                        gameTask = 0;
                    }
                }
            }
            break;
        case 0x122:
            BtActStatus.action_on = 0;
            BtActStatus.unk_00C = 0;
            gameTask = 0;
            NewChangeFx.motion_no = 0;
            NewChangeFx.flags = 6;
            NewChangeFx.motion_speed = -1.0f;
            NewChangeFx.motion_type.state.time = 1.0f;
            NewChangeFxFlag = 1;
            SndSeSeqAllStop();
            printf("se stop !!\n");
            if (BtActStatus.unk_0E4 != 0) {
                BtActStatus.unk_024 = 0xA0;
                setUnitAmbientAnime(160.0f, 1.0f, 255.0f, 0.0f, 0.0f);
                SndSePlay(0xF, -1, 0);
            } else {
                setUnitAmbientAnime(90.0f, 1.0f, 250.0f, 250.0f, 250.0f);
                SndSePlay(0xF, -1, 0);
            }
            BtActStatus.unk_0E4 = 0;
            autoCamTrial();
            break;
        case 0x123:
            break;
        case 0x127:
            if (BtMiniChrSelect_Loop() != 0) {
                if (BtMiniChrSelectNo == 2) {
                    ClearSystemMes();
                    driveStepHold = 1;
                    gameTask = 0xAF;
                    ((CDngStatusData *) UserStatus)->SetDead();
                } else {
                    if (oldUnitNow == nowUnitNow) {
                        DngMes1.mes_made = -1;
                        DngMes2.mes_made = -1;
                        DngMesStb.mes_made = -1;
                        Mes1MakeFlg = 1;
                        Mes2MakeFlg = 1;
                        DngMessMan.unk_00 = 1;
                        MonstorNameOff = 0;
                        EnemyLifeGage.draw = 1;
                        gameTask = 0;
                    } else {
                        DngMes1.mes_made = -1;
                        DngMes2.mes_made = -1;
                        DngMesStb.mes_made = -1;
                        Mes1MakeFlg = 1;
                        Mes2MakeFlg = 1;
                        DngMessMan.unk_00 = 1;
                        MonstorNameOff = 0;
                        EnemyLifeGage.draw = 1;
                        gameTask = 0x122;
                    }
                    goto chr_selected;
                }
            } else {
            chr_selected:
                autoCamTrial();
            }
            break;
        case 0x78:
            BtGetTreasureboxBig_Init();
            gameTask++;
            break;
        case 0x79:
            if (BtGetTreasureboxBig_Loop() != 0) {
                gameTask = 0;
            }
            break;
        case 0x82:
            BtGetTreasureboxSmall_Init(selectMapNo);
            gameTask++;
            break;
        case 0x83:
            if (BtGetTreasureboxSmall_Loop() != 0) {
                gameTask = 0;
            }
            break;
        case 0x8C:
            BtAtraGetShort_Init();
            iventMarker = 0;
            gameTask++;
            break;
        case 0x8D:
            if (BtAtraGetShort_Loop(selectMapNo, UserStatus->cur_floor) == 1) {
                gameTask = 0;
            }
            break;
        case 0x8E: {
            CMonUnitHold = 1;
            CEffectHold = 1;

            CUserStatus *user = UserStatus;

            user->step_disable = 1;
            DngMessMan.unk_00 = 0;
            NotGetAtraMes(UserStatus->cur_chara, -1);
            gameTask++;
            break;
        }
        case 0x8F:
            if (GamePad.Down(PadInput_OK | PadInput_NO) != 0) {
                CMonUnitHold = 0;
                CEffectHold = 0;
                UserStatus->step_disable = 0;
                DngMessMan.unk_00 = 1;
                ClearSystemMes();
                gameTask = 0;
            }
            break;
        case 0xC8: {
            int slot;

            CUserStatus *step2 = UserStatus;

            step2->step_disable = 1;
            BtActStatus.unk_06C = 1;
            DngMessMan.unk_00 = 0;
            if (ruby_effect_id != -1 && UserStatus->cur_chara == 3) {
                NowMainEffect->OffEffect(ruby_effect_id);
                ruby_effect_id = -1;
            }
            slot = ((CDngStatusData *) UserStatus)->CheckActItemSlot(0xB0);
            if (slot != -1) {
                s8 chara;

                setUnitAmbientAnime(64.0f, 1.0f, 0.0f, 122.0f, 208.0f);
                chara = UserStatus->cur_chara;
                UserStatus->hp[chara] = UserStatus->max_hp[chara] >> 1;
                UserStatus->unk_42C8[UserStatus->cur_chara] = 0;
                UserStatus->unk_42E0[UserStatus->cur_chara] = 0;
                SetSystemMes(0x3E, -1, 8, 0, NULL, NULL);
                BombInfo.unk_14 = 0;
                BombInfo.unk_18 = -1;
                BtActStatus.unk_064 = 1;
                BtActStatus.action_on = 0;
                BtActStatus.unk_070 = 0;
                if (activeItem.model[8] != -1) {
                    activeItem.models->AllReleasItem();
                    activeItem.model[8] = -1;
                }
                BtActStatus.unk_00C = 0;
                BtActStatus.unk_06C = 0;
                DngMessMan.unk_00 = 0;
                CMonUnitHold = 1;
                CEffectHold = 1;
                printf("itemno = %d\n", slot);
                gameTask = 0x212;
                DelActiveItem(slot + 1);
                autoCamTrial();
            } else {
                BtActStatus.unk_00C = 0x17;

                float start = CharaMain.motion_type.motion_info[23].start;
                float end = CharaMain.motion_type.motion_info[23].end;
                if (CharaMain.motion_type.state.time >= 2.0f + start &&
                    CharaMain.motion_type.state.time < 2.3f + start) {
                    SndSePlay(0x1B1, -1, 0);
                }
                if (CharaMain.motion_type.state.time >= end - 2.0f &&
                    CharaMain.motion_type.state.time <= end) {
                    CharaMain.motion_no = BtActStatus.unk_00C;
                    CharaMain.flags = 1;
                    CharaMain.motion_speed = -1.0f;
                    BombInfo.unk_14 = 0;
                    BombInfo.unk_18 = -1;
                    BtActStatus.unk_064 = 1;
                    BtActStatus.action_on = 0;
                    BtActStatus.unk_070 = 0;
                    if (activeItem.model[8] != -1) {
                        activeItem.models->AllReleasItem();
                        activeItem.model[8] = -1;
                    }
                    if (((CDngStatusData *) UserStatus)->GetLiveUnit() != 0 && UserStatus->party_size > 1) {
                        gameTask += 2;
                    } else {
                        gameTask++;
                    }
                }
                autoCamTrial();
            }
            break;
        }
        case 0xC9:
            DeadKeyWait--;
            if (DeadKeyStartWait > 0) {
                DeadKeyStartWait--;
                if (DeadKeyStartWait == 0) {
                    if (UserStatus->party_size == 1) {
                        DeadMes(UserStatus->cur_chara, 0x168);
                    } else {
                        AllDeadMes(0x168);
                    }
                }
            }
            if (GamePad.Down(0x60) != 0 || DeadKeyWait <= 0) {
                ClearSystemMes();
                BtActStatus.unk_06C = 0;
                gameTask = 0xAF;
                ((CDngStatusData *) UserStatus)->SetDead();
            }
            autoCamTrial();
            break;
        case 0xCA:
            BtActStatus.unk_00C = 0x17;
            if (DeadKeyStartWait > 0) {
                DeadKeyStartWait--;
                if (DeadKeyStartWait == 0) {
                    DeadMes(UserStatus->cur_chara, 0x168);
                }
            }
            if (GamePad.Down(0x60) != 0 || DeadKeyWait <= 0) {
                ClearSystemMes();
                BtMiniChrSelect_Init(1);
                UserStatus->step_disable = 0;
                oldUnitNow = UserStatus->cur_chara;
                BtActStatus.unk_06C = 0;
                BtActStatus.unk_0E4 = 1;
                gameTask = 0x127;
            }
            autoCamTrial();
            break;
        case 0x212: {
            s8 chara = UserStatus->cur_chara;

            if (!(UserStatus->hp[chara] < (UserStatus->max_hp[chara] >> 1))) {
                CUserStatus *stepper = UserStatus;

                stepper->step_disable = 1;
                gameTask++;
            }
            autoCamTrial();
            break;
        }
        case 0x213:
            if (GamePad.Down(0x60) != 0) {
                ClearSystemMes();
                UserStatus->step_disable = 0;
                DngMessMan.unk_00 = 1;
                CMonUnitHold = 0;
                CEffectHold = 0;
                gameTask = 0;
                BtActStatus.unk_024 = 0xA0;
                setUnitAmbientAnime(160.0f, 1.0f, 255.0f, 0.0f, 0.0f);
            }
            autoCamTrial();
            break;
    }
    if (rogoSwitch2 != 0) {
        switch (startCnt2) {
            case 0:
                if (rogoAlphaA[2] < 0x80) {
                    rogoAlphaA[2] += 4;
                } else {
                    rogoAlphaW[2] = 0x78;
                    startCnt2++;
                }
                if (rogoY3 < 0x20) {
                    rogoY3 += 2;
                }
                break;
            case 1:
                if (rogoAlphaW[2] > 0) {
                    rogoAlphaW[2]--;
                } else {
                    startCnt2++;
                }
                if (rogoY3 < 0x20) {
                    rogoY3 += 2;
                }
                break;
            case 2:
                if (rogoAlphaA[2] > 0) {
                    rogoAlphaA[2] -= 4;
                } else if (rogoY3 >= 0x20) {
                    startCnt2++;
                }
                if (rogoY3 < 0x20) {
                    rogoY3 += 2;
                }
                break;
            case 3:
                rogoSwitch2 = 0;
                startCnt2 = -1;
                break;
            case -1:
                break;
        }
        if (rogoY3 >= 0x20 && UserStatus->minimap_status != 3) {
            infoMap = 1;
            infoMapOld = 1;
        }
    }
    motionDrive();
}

void motionDrive(void) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR rotation;
    sceVu0FVECTOR hand;
    int chara = UserStatus->cur_chara;
    int i;

    if (BtAllDrawFlag == 0) {
        return;
    }

    if (BtEventMode == 0) {
        NowMonstorUnit->Step(driveStepHold | CMonUnitHold);
    }

    if (BtActStatus.unk_000 != 0 && EdEventInfo.unk_060 != 0) {
        sceVu0CopyVector(pos, CharaFrame->position);
        CharaFrame->GetRotation(rotation);
        CharaMain.SetPosition(pos);
        CharaMain.SetRotation(rotation[0], rotation[1], rotation[2]);

        int blend = 0;

        if (driveNoInterpolate != 0) {
            blend = 4;
            driveNoInterpolate = 0;
        }

        // A held step, an event or a status ailment restarts the motion
        // outright; otherwise it only changes where it differs.
        if (driveStepHold != 0 || EdEventInfo.unk_06C != 0 || BtActStatus.unk_098 != 0) {
            CharaMain.motion_no = BtActStatus.unk_00C;
            CharaMain.flags = 1;
            CharaMain.motion_speed = -1.0f;
            if (chara == 1) {
                CCharacter *weapon = NowWeapon;

                weapon->motion_no = BtActStatus.unk_00C;
                weapon->flags = 1;
                weapon->motion_speed = -1.0f;
            }
            BtActStatus.unk_004 = -1;
        } else if (BtActStatus.unk_004 != BtActStatus.unk_00C) {
            CharaMain.motion_no = BtActStatus.unk_00C;
            CharaMain.flags = blend;
            CharaMain.motion_speed = -1.0f;
            if (chara == 1) {
                CCharacter *weapon = NowWeapon;

                weapon->motion_no = BtActStatus.unk_00C;
                weapon->flags = blend;
                weapon->motion_speed = -1.0f;
            }
            BtActStatus.unk_004 = BtActStatus.unk_00C;
        }

        // Osmond's tail keeps turning on its own.
        if (UserStatus->cur_chara == 5) {
            CFrame *tail = CharaMain.frame->SearchFrame("tukene1");
            CFrame *tail_shadow = CharaMain.shadow_frame->SearchFrame("obj46");

            if (tail != NULL) {
                static float y = 0.0f;

                y += 0.35699910f;
                if (!(y < 3.141592f)) {
                    y = y - 6.283184f;
                }
                tail->SetRotType(2);
                tail->SetRotation(0.0f, AngleLimit(y), 0.0f);
                if (tail_shadow != NULL) {
                    tail_shadow->SetRotType(2);
                    tail_shadow->SetRotation(0.0f, AngleLimit(y), 0.0f);
                }
            }
        }

        if (lockOnTargetFlag != 0 && UserStatus->cur_chara == 1 &&
            CharaMainHandViewFlag == 0) {
            CharaMain.motion_type.unk_38 = CharaFrame->SearchFrame("jnt2_1");
            sceVu0CopyVector(CharaMain.motion_type.unk_40, BtActStatus.unk_080);
            CharaMain.motion_type.unk_34 = 1;
            CharaMain.motion_type.unk_50 = 2;
        } else {
            CharaMain.motion_type.unk_34 = 0;
        }

        CharaMain.Step();
        if (chara == 1) {
            NowWeapon->Step();
        }
        if (BtActStatus.unk_054 != 0) {
            CharaMain.ShadowStep();
        }
    }

    if ((CharaMainHandViewFlag != 0 && UserStatus->cur_chara == 1) ||
        UserStatus->cur_chara == 3) {
        sceVu0CopyVector(hand, CharaFrame->position);

        float height = CharaHeight(UserStatus);

        hand[1] += height - 3.0f;
        CharaHand.SetPosition(hand);

        int blend = 0;

        if (driveNoInterpolate != 0) {
            blend = 4;
            driveNoInterpolate = 0;
        }

        if (driveStepHold != 0 || BtActStatus.unk_098 != 0) {
            CharaHand.motion_no = BtActStatus.unk_00C;
            CharaHand.flags = 1;
            CharaHand.motion_speed = -1.0f;
            if (chara == 1) {
                CCharacter *weapon = NowWeapon;

                weapon->motion_no = BtActStatus.unk_00C;
                weapon->flags = 1;
                weapon->motion_speed = -1.0f;
            }
            BtActStatus.unk_008 = -1;
        } else if (BtActStatus.unk_008 != BtActStatus.unk_00C) {
            CharaHand.motion_no = BtActStatus.unk_00C;
            CharaHand.flags = blend;
            CharaHand.motion_speed = -1.0f;
            if (chara == 1) {
                CCharacter *weapon = NowWeapon;

                weapon->motion_no = BtActStatus.unk_00C;
                weapon->flags = blend;
                weapon->motion_speed = -1.0f;
            }
            BtActStatus.unk_008 = BtActStatus.unk_00C;
        }

        if (chara == 1) {
            NowWeapon->Step();
        }
        CharaHand.Step();
    }

    if (BtEventMode != 0) {
        for (int i = 0; i < 6; i++) {
            if (EdEventInfo.unk_174[i] == 0) {
                NPCUnit[i].ShadowStep();
                NPCUnit[i].Step();
            }
        }
    }

    if (driveStepHold == 1) {
        return;
    }

    if (BtActStatus.unk_148 > 0) {
        BtActStatus.unk_148--;
    }

    // A weapon that is nearly broken keeps saying so.
    if (BtEventMode == 0) {
        WEAPON_HAVE *weapon;
        CUserStatus *status;
        s8 *slots;
        s8 *slots2;
        s8 owner;
        s8 owner2;

        status = UserStatus;
        owner = owner2 = status->cur_chara;
        slots = status->equipped_weapon_slot;
        slots2 = status->equipped_weapon_slot;
        weapon = &status->chara_weapons[owner][(s8) slots[owner]];

        if (weapon->durability_f <= 10.0f &&
            status->chara_weapons[owner2][(s8) slots2[owner2]].item_no != defWeapon__6[(s8) owner]) {
            static int warning_cnt;
            static char init;
            int wait;

            if (init == 0) {
                warning_cnt = 0;
                init = 1;
            }
            wait = (int) weapon->durability_f * 10;
            if (wait < 11) {
                wait = 10;
            }
            if (warning_cnt <= 0) {
                warning_cnt = wait;
                SndSePlay(0x16, -1, 0);
            } else {
                warning_cnt--;
            }
        }
    }

    if (BtActStatus.unk_000 != 0 && EdEventInfo.unk_060 != 0) {
        CharaMain.ClothStep(0);
    }
    if (BtActStatus.unk_06C == 0) {
        NowCamera__3->Step(1);
    }

    if (Water_Splash_actFlag != 0) {
        Water_Splash.Step();

        float end = (float) Water_Splash.motion_type.motion_info[0].end;

        if (Water_Splash.motion_type.state.time >= end - 0.5f &&
            Water_Splash.motion_type.state.time < end) {
            Water_Splash_actFlag = 0;
        }
    }

    StepWaterLing();
    NowDngMap->StepTrapCircle();
    Trap_Circle.Step();
    if (EscapeFlag != 0) {
        EscapeEffect.Step();
    }
    ItemVolumeStep.LoopStep(60);
    NowDngMap->StepNPC();
    NowDranMapField->CDranMapField::Step();
    DngMesStb.Step();

    if (DngMessMan.unk_04 > 0) {
        DngMessMan.unk_04--;
        if (DngMessMan.unk_04 == 0) {
            DngMessMan.unk_1C = 0;
            DngMessMan.unk_24 = -1;
        }
    }
    if (DngMessMan.unk_08 > 0) {
        DngMessMan.unk_08--;
    } else {
        DngMessMan.unk_08 = 0;
    }

    // Every hit that is still in the air counts down and drifts.
    CCollisionData *collision = NowColData;

    for (i = 0; i < 96; i++) {
        if (collision->active[i] == 0) {
            continue;
        }
        if (collision->hit[i].unk_70 > 0) {
            collision->hit[i].unk_70--;
        } else {
            collision->hit[i].unk_70 = collision->hit[i].unk_74;
        }
        collision->hit[i].life--;
        if (collision->hit[i].life <= 0) {
            collision->active[i] = 0;
            collision->hit[i].unk_38 = 0.0f;
            continue;
        }
        collision->hit[i].radius += collision->hit[i].unk_40;
        if (collision->hit[i].unk_38 != 0.0f) {
            sceVu0ScaleVectorXYZ(collision->hit[i].unk_10, collision->hit[i].unk_10,
                                 collision->hit[i].unk_38);
        }
    }

    if (StatusErrCheck(4) != 0 || StatusErrCheck(8) != 0) {
        CUserStatus *status = UserStatus;
        s8 owner = status->cur_chara;
        s16 *left = status->unk_42E0;

        if (left[status->cur_chara] > 0) {
            left[owner]--;

            CUserStatus *now = UserStatus;
            s8 who = now->cur_chara;

            if (now->unk_42E0[now->cur_chara] == 0) {
                now->unk_42C8[who] = 0;
                BtActStatus.unk_098 = 0;
            }
        }
    }

    if (BtActStatus.unk_14C > 0) {
        BtActStatus.unk_14C--;
    }

    // The action gauge fills back up at a rate the weapon sets.
    if ((int) BtActStatus.unk_048 < 100) {
        if (BtActStatus.unk_0F8 < 10) {
            BtActStatus.unk_0F8++;
        }

        float gain = (float) NowWeaponHave->speed / 30.0f;

        if (StatusErrCheck(0x40) != 0) {
            gain /= 2.0f;
        }
        if (StatusErrCheck(8) != 0) {
            gain *= 2.0f;
        }
        if (gain < 1.0f) {
            gain = 1.0f;
        }

        CUserStatus *status = UserStatus;
        s8 *pwho = &status->cur_chara;
        if (status->cur_chara == 0) {
            if (BtActStatus.unk_14A == 0) {
                gain *= 0.25f;
            } else {
                gain = 0.0f;
            }
            BtActStatus.unk_14A = 0;
        }
        if (*pwho == 4) {
            if (BtActStatus.unk_14A == 0) {
                gain *= 0.25f;
            } else {
                gain = 0.0f;
            }
            BtActStatus.unk_14A = 0;
        }
        s8 who = *pwho;
        s8 who2 = *pwho;

        if (*pwho == 5) {
            if (BtActStatus.unk_0A0 != 1) {
                if (BtActStatus.unk_0A4 == 0) {
                    gain = 0.0f;
                } else {
                    gain *= 0.5f;
                }
            } else {
                gain *= 1.5f;
            }
        }
        if (who == 1) {
            gain *= 1.5f;
        }
        if (who2 == 3) {
            gain *= 1.5f;
        }

        BtActStatus.unk_048 += gain;
        if (!((int) BtActStatus.unk_048 < 100)) {
            BtActStatus.unk_048 = 100.0f;
            BtActStatus.unk_04C = 10;
            BtActStatus.unk_0A4 = 0;
        }
    } else if (BtActStatus.unk_04C > 0) {
        BtActStatus.unk_04C--;
    }

    if (BtActStatus.unk_144 > 0) {
        BtActStatus.unk_146 = (int) (16.0f * (float) rand() / 2147483648.0f) - 8;
        BtActStatus.unk_144--;
    }

    BtActStatus.unk_0E0++;
    if (!(BtActStatus.unk_0E0 < 3600)) {
        BtActStatus.unk_0E0 = 3600;
    }

    if (UserStatus->step_disable == 0) {
        BtStatusErrStep();
    }

    CUserStatus *status = UserStatus;
    s8 *phealed = &status->cur_chara;
    float water_max = status->water_max[*phealed];
    float water_now = status->water_now[*phealed];
    static int heal_counter = 0;

    heal_counter++;
    if (!(heal_counter < 240)) {
        if ((NowWeaponHave->flags & 0x800) && status->hp[*phealed] > 0) {
            status->AddNowLife((s8) *phealed, 1, 255.0f);
        }
        heal_counter = 0;
    }

    UserStatus->Step(0);
    float dry = UserStatus->water_now[UserStatus->cur_chara];

    DngMessMan.SetStatus_Dry(water_max, water_now, dry);
    BtStatusAlarmAnime();

    for (int i = 0; i < FrameObjAnimCnt; i++) {
        ObjAnimePlay(&FrameObjAnim[i]);
    }

    CDungeonMap *map = NowDngMap;

    map->fire.FireStep();
    map->fire.RasterStep();
    CWeaponFx.Step();
    for (int i = 0; i < 4; i++) {
        CWeaponElFx[i].Step();
    }
    for (int i = 0; i < 32; i++) {
        HitValue[i].Step();
    }
    mainItemModel.Step();
    WeaponCrashEffect.Step();
    for (int i = 0; i < 16; i++) {
        HitMark[i].Step();
        HitPointMark[i].Step();
        MyHitPointMark[i].Step();
    }

    if (NewChangeFxFlag != 0) {
        NewChangeFx.Step();

        float end = (float) NewChangeFx.motion_type.motion_info[0].end;

        if (NewChangeFx.motion_type.state.time >= end - 0.3f &&
            NewChangeFx.motion_type.state.time < end) {
            NewChangeFxFlag = 0;
        }
    }

    if (atraShortGetType != 0 && atraGetStatus != 0) {
        shortAtraEffect.Step();
    }
    if (itemOpenSmallFlag == 1) {
        itemOpenSmall.Step();
        itemOpenSmallFx.Step();
    }
    if (itemOpenBigFlag == 1) {
        itemOpenBig.Step();
        itemOpenBigFx.Step();
    }

    if (CEffectHold != 0 || BtEventMode != 0) {
        return;
    }

    if (BtActStatus.unk_124 > 0) {
        float shake = BtActStatus.unk_118;

        BtActStatus.unk_120 = 2.0f * (shake * (float) rand()) / 2147483648.0f - shake;
        BtActStatus.unk_118 -= BtActStatus.unk_11C;
        BtActStatus.unk_124--;
    } else {
        BtActStatus.unk_120 = 0.0f;
    }
    if (BtActStatus.unk_128 > 0) {
        BtActStatus.unk_128--;
    }

    int drunk = RandomItem->CheckPosition();
    CUserStatus *drink = UserStatus;
    int water = drink->unk_4346 + drunk;

    if (!(water < 0xFFFF)) {
        drink->unk_4346 = 0xFFFF;
    } else {
        drink->unk_4346 = water;
    }

    RandomItem->Step();
    StealItem.Step();
    for (int i = 0; i < 3; i++) {
        CBomb__2[i].Step();
    }
    for (int i = 0; i < 5; i++) {
        MasekiEffect[i].Step();
    }
    NowShockWave->Step();

    CSHOT_EFFECT *effects = NowShotEffect->effect;

    for (i = 0; i < 5; i++) {
        effects[i].Step();
    }
    OzumondShot.Step();
    OzumondFire.Step();
    OzumondShotEffect.Step();
    NowMainEffect->Step();
    NowShotData->step();
    HealEffect.Step();
}

void BtCleatRandomMap(void) {
    NowDngMap = &MainDungeonMap;
    NowEventMan = &DngEventMan;
    ((CDngStatusData *) UserStatus)->LostGateKey();

    {
        int i;
        CDungeonEventMan *events = NowEventMan;

        for (i = 0; i < 96; i++) {
            CDungeonEventData *slot = &events->event[i];

            slot->event = NULL;
            slot->unk_34 = 0;
            slot->unk_38 = 0;
            slot->unk_30 = 0;
            slot->chara_done = -1;
        }
    }

    {
        int i;
        CDungeonMap *map = NowDngMap;

        for (i = 0; i < 48; i++) {
            map->events[i].kind = -1;
            map->events[i].unk_2C = 0;
        }
        for (i = 0; i < 24; i++) {
            map->boxes[i].used = 0;
            map->boxes[i].lid_angle = 0.0f;
            map->boxes[i].unk_30 = 0;
        }
        map->box_num = 0;
        for (i = 0; i < 8; i++) {
            map->atra[i].used = 0;
        }
        map->atra_num = 0;
        for (i = 0; i < 4; i++) {
            map->room_link[i].used = 0;
        }
    }

    {
        CTexture *gold = GoldTex;
        int i;

        for (i = 0; i < 32; i++) {
            MainRandomItem.unk_290[i] = -1;
            MainRandomItem.unk_494[i] = -1;
            MainRandomItem.unk_514[i] = 0;
        }
        MainRandomItem.gold_texture = gold;
        for (i = 0; i < 32; i++) {
            SubRandomItem.unk_290[i] = -1;
            SubRandomItem.unk_494[i] = -1;
            SubRandomItem.unk_514[i] = 0;
        }
        SubRandomItem.gold_texture = gold;
    }
    RandomItem = &MainRandomItem;

    NowDngMap->buildRandomMap(6, 1);

    s32 map_no = NowDngMap->unk_BDEC;

    NowDngMap->buildEventData(UserStatus->cur_floor, map_no, 1);
    NowDngMap->FlushCheckMask();
    NowDngMap->DrawMapCalc(NowDngMap->unk_BDEC);
    NowEventMan->SetupEvent(NowDngMap, (s32) NowDngMap->unk_BDEC);

    // The back dungeon starts from the floor that was just built, then lays
    // out its own events and items on top.
    NowDngMap = &UraDungeonMap;
    NowEventMan = &UraEventMan;
    UraDungeonMap = MainDungeonMap;
    UraEventMan = DngEventMan;

    {
        int i;

        for (int i = 0; i < 96; i++) {
            CDungeonEventData *slot = &UraEventMan.event[i];

            slot->event = NULL;
            slot->unk_34 = 0;
            slot->unk_38 = 0;
            slot->unk_30 = 0;
            slot->chara_done = -1;
        }
        for (i = 0; i < 48; i++) {
            UraDungeonMap.events[i].kind = -1;
            UraDungeonMap.events[i].unk_2C = 0;
        }
        for (i = 0; i < 24; i++) {
            UraDungeonMap.boxes[i].used = 0;
            UraDungeonMap.boxes[i].lid_angle = 0.0f;
            UraDungeonMap.boxes[i].unk_30 = 0;
        }
        UraDungeonMap.box_num = 0;
        for (i = 0; i < 8; i++) {
            UraDungeonMap.atra[i].used = 0;
        }
        UraDungeonMap.atra_num = 0;
        for (i = 0; i < 4; i++) {
            UraDungeonMap.room_link[i].used = 0;
        }
    }

    UraDungeonMap.buildRandomMap(6, 0);

    s32 ura_map_no = UraDungeonMap.unk_BDEC;

    UraDungeonMap.buildEventData(UserStatus->cur_floor, ura_map_no, 0);
    UraDungeonMap.FlushCheckMask();
    s32 ura_draw_no = UraDungeonMap.unk_BDEC;

    UraDungeonMap.DrawMapCalc(ura_draw_no);
    UraEventMan.SetupEvent(&UraDungeonMap, (s32) UraDungeonMap.unk_BDEC);

    NowDngMap = &MainDungeonMap;
    NowEventMan = &DngEventMan;
    UserStatus->ClearEventFlag();
    BtUraDongeon = 0;
    BtEquipMap = 0;
    BtEquipMasuisyou = 0;
}

void BtCleatFreeMap(void) {
    int i;
    s32 map_no = MainDungeonMap.unk_BDEC;

    MainDungeonMap.buildEventData(UserStatus->cur_floor, map_no, 1);
    MainDungeonMap.FlushCheckMask();
    s32 draw_no = MainDungeonMap.unk_BDEC;

    MainDungeonMap.DrawMapCalc(draw_no);

    s32 event_no = MainDungeonMap.unk_BDEC;

    DngEventMan.SetupEvent(&MainDungeonMap, event_no);

    CTexture *gold = GoldTex;

    for (i = 0; i < 32; i++) {
        MainRandomItem.unk_290[i] = -1;
        MainRandomItem.unk_494[i] = -1;
        MainRandomItem.unk_514[i] = 0;
    }
    MainRandomItem.gold_texture = gold;
    RandomItem = &MainRandomItem;

    UserStatus->ClearEventFlag();
    BtUraDongeon = 0;
    NowDngMap = &MainDungeonMap;
    NowEventMan = &DngEventMan;
    BtEquipMap = 0;
    BtEquipMasuisyou = 0;
}

void BtArrengeMonstor(void) {
    NowMonstorUnit->CleanViewMonstor(BtUraDongeon);
    NowMonstorUnit->ArrangementPos(&MainDungeonMap, 15, -1, 0);
}

void BtLoadMonstor(int ura) {
    int count;
    BT_ENEMY_FLOOR *layout;
    int monster;
    int i;
    int slot;

    MonstorModelBuffer.used = 0;

    s32 ura_dungeon = BtUraDongeon;
    CMonstorUnit *unit = NowMonstorUnit;

    unit->unk_048 = 0;
    unit->unk_090 = 0;
    for (slot = 0; slot < 16; slot++) {
        unit->script[slot] = &MonstorScriptBuffer[slot];
    }
    unit->unk_094 = -1;
    unit->CleanViewMonstor(ura_dungeon);
    BtSetEventExtendTable();

    for (i = 0; i < 320; i++) {
        MonsterTexAnim[i].Initialize();
    }

    TexManager.DeleteTextureBlock(0x2A);
    TexManager.DeleteTextureBlock(0x26);
    TexManager.CleanUpBuffer();
    TexManager.CleanUpTextureList();

    LoadFile("dun/etc/atrcol.mds", read_buffer, NULL);
    wait_now_loading_vsync();
    NowMonstorUnit->collision = LoadCollisionFile(read_buffer, &MonstorModelBuffer);

    CSHOT_EFFECT *effects = NowShotEffect->effect;

    for (i = 0; i < 5; i++) {
        effects[i].Initialize();
    }

    count = 0;
    if (ura == 0) {
        layout = BtEnemyLayoutList[selectMapNo];
    } else {
        layout = BtUraEnemyLayoutList[selectMapNo];
    }
    layout += UserStatus->cur_floor;

    for (monster = 0; monster < 9; monster++) {
        if (layout->monster[monster].monster_no == -1) {
            break;
        }
        count += NowMonstorUnit->SetupBaseModel(count, layout->monster[monster].monster_no,
                                                0x26, &MonstorModelBuffer);
    }
    MemoryMapDump();
}

void EquipReAttach(CCharacter *equipment, int held_out) {
    CFrame *hand;

    if (held_out != 0) {
        hand = CharaHand.frame->SearchFrame("pati1");
    } else {
        hand = CharaMain.frame->SearchFrame("weapon");
    }

    equipment->SetPosition(0.0f, 0.0f, 0.0f);
    equipment->SetRotation(0.0f, 0.0f, 0.0f);
    equipment->frame->SetReference(hand);
}

void EquipWeaponFrame(CCharacter *weapon, int chara, int held_out) {
    CFrame *hand;
    int i;

    NowWeapon = weapon;
    if (held_out != 0 && chara == 1) {
        hand = CharaHand.frame->SearchFrame("pati1");
    } else {
        hand = CharaMain.frame->SearchFrame("weapon");
    }

    if (hand == NULL) {
        printf("no weapon frame !!\n");
        return;
    }

    float zero = 0.0f;

    NowWeapon->SetPosition(zero, zero, zero);
    NowWeapon->SetRotation(zero, zero, zero);
    NowWeapon->frame->SetReference(hand);
    NowWeapon->Step();

    for (i = 0; i < 32; i++) {
        CWeaponFx.used[i] = 0;
    }
    CWeaponFx.colour[0].r = CWeaponFx.colour[2].r = 0x40;
    CWeaponFx.colour[0].g = CWeaponFx.colour[2].g = 0x40;
    CWeaponFx.colour[0].b = CWeaponFx.colour[2].b = 0x40;
    CWeaponFx.colour[1].r = CWeaponFx.colour[3].r = 6;
    CWeaponFx.colour[1].g = CWeaponFx.colour[3].g = 6;
    CWeaponFx.colour[1].b = CWeaponFx.colour[3].b = 6;
    CWeaponFx.cursor = 0;
    CWeaponFx.timer = 0;
    CWeaponFx.InitSet(NowWeapon->frame, "dcol0", "dcol1");
    SetWeaponColor();
}

FUZZY_MATCH("asm/nonmatchings/dun/gameloop", LoadWeapon2__FPUiPUiPUiii)

void LoadWeapon2(unsigned int *crash_data, unsigned int *default_data, unsigned int *main_data,
                 int chara, int reload) {
    int weapon_kind[6] = {1, 4, 6, 5, 10, 7};
    int weapon_first[6] = {0x101, 0x12B, 0x13A, 0x14B, 0x15B, 0x16B};
    char weapon_name[64];
    char weapon_model_path[64];
    // The kind each character's weapon counts as; nothing reads it any more.
    int *kind = &weapon_kind[chara];

    // A reload gives the weapon blocks back before the new models go in.
    if (reload != 0) {
        TexManager.DeleteTextureBlock(0x1D);
        TexManager.DeleteTextureBlock(0x10);
        TexManager.CleanUpBuffer();
        TexManager.CleanUpTextureList();
        WeaponModelBuffer.used = 0;
        WEffectModelBuffer.used = 0;
    }

    BtGetWeaponNamePath2(weapon_name, weapon_model_path, chara, 0);
    CrashWeapon.Initialize();
    CrashWeapon.LoadPackData3(crash_data, weapon_model_path, &WeaponModelBuffer, 0x1D,
                              &WeaponModelBuffer, 1, 0);

    BtGetWeaponNamePath2(weapon_name, weapon_model_path, chara, 1);
    DefaultWeapon.Initialize();
    DefaultWeapon.LoadPackData3(default_data, weapon_model_path, &WeaponModelBuffer, 0x1D,
                                &WeaponModelBuffer, 1, 0);

    CUserStatus *status = UserStatus;
    s8 owner = status->cur_chara;

    // One scratch integer serves the weapon's place in the table and then the
    // block count the effect models start from.
    int work = status->chara_weapons[owner][status->equipped_weapon_slot[owner]].item_no;

    work -= weapon_first[chara];
    BtGetWeaponNamePath2(weapon_name, weapon_model_path, chara, work);
    MainWeapon.Initialize();
    MainWeapon.LoadPackData3(main_data, weapon_model_path, &WeaponModelBuffer, 0x1D,
                             &WeaponModelBuffer, 1, 0);
    EquipWeaponFrame(&MainWeapon, chara, CharaMainHandViewFlag);

    // The effect models take whatever the weapon models leave.
    work = WeaponModelBuffer.used;

    u8 *free_start = WeaponModelBuffer.buffer + work * 16;
    s64 free_size = 0x33450 - CharaModelBuffer.used - work;

    WEffectModelBuffer.buffer = free_start;
    WEffectModelBuffer.size = free_size;
    WEffectModelBuffer.used = 0;

    CUserStatus *equipped = UserStatus;
    s8 chara_no = equipped->cur_chara;

    WEAPON_HAVE *have =
        &equipped->chara_weapons[chara_no][equipped->equipped_weapon_slot[chara_no]];

    MenuWeaponSpSet(NowWeapon, have);
    BtActStatus.unk_048 = 100.0f;
    BtActStatus.unk_0A4 = 0;
}

void SwordDmgCheck1(float amount, int kind) {
    int broke;
    CUserStatus *status = UserStatus;
    s8 chara = status->cur_chara;
    WEAPON_HAVE *weapon = &status->chara_weapons[chara][status->equipped_weapon_slot[chara]];
    float was = weapon->durability_f;
    float warn = (float) (weapon->durability * 0.2);

    broke = BattleSubWeaponDmg(amount, kind);

    // The Chronicle sword says so once, as its durability crosses a fifth.
    if (weapon->item_no == 0x110 && weapon->durability_f <= warn && was >= warn) {
        SetWeaponAttachStatus(NowWeaponHave);
        DngMessMan.unk_24 = 0xB8;
        DngMessMan.unk_04 = 0xF0;
        DngMessMan.unk_1C = 0;
        SndSePlay(0x6F, -1, 0);
        MenuWeaponSpSet(NowWeapon, weapon);
    }

    if (broke == 0) {
        return;
    }

    float spread[4] = {0.0f, 1.0f, 0.0f, 1.0f};
    float offset[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    sceVu0FVECTOR world;
    sceVu0FVECTOR pos;

    sceVu0CopyVector(pos, CharaMain.pos);

    CFrame *hand = CharaMain.frame->SearchFrame("weapon");

    if (hand != NULL) {
        hand->GetWorldPosition(world, offset);
        WeaponCrashEffect.Set(world, spread, 4, 1.5f, 0.01f, 0.01f, 0.3f, 0x20, pos[1]);
    }

    if (broke == 1) {
        EquipWeaponFrame(&CrashWeapon, UserStatus->cur_chara, CharaMainHandViewFlag);
        s8 owner = UserStatus->cur_chara;

        if (owner == 5 || (s8) owner == 3) {
            NowMainEffect = &CharaMainEffectCrash;
            BtActStatus.unk_0A0 = 0;
            BtActStatus.action_on = 0;
        }
    }

    if (broke == 2) {
        EquipWeaponFrame(&DefaultWeapon, UserStatus->cur_chara, CharaMainHandViewFlag);
        s8 owner = UserStatus->cur_chara;

        if (owner == 5 || (s8) owner == 3) {
            NowMainEffect = &CharaMainEffectCrash;
            BtActStatus.unk_0A0 = 0;
            BtActStatus.action_on = 0;
        }
    }
}

FUZZY_MATCH("asm/nonmatchings/dun/gameloop", SetWeaponColor__Fv);

void SetWeaponColor(void) {
    u8 red, green, blue;
    s8 element = NowWeaponHave->best_elem;

    if (element == 5) {
        CWeaponFx.colour[0].r = CWeaponFx.colour[2].r = 0x40;
        CWeaponFx.colour[0].g = CWeaponFx.colour[2].g = 0x40;
        CWeaponFx.colour[0].b = CWeaponFx.colour[2].b = 0x40;
        CWeaponFx.colour[1].r = CWeaponFx.colour[3].r = 6;
        CWeaponFx.colour[1].g = CWeaponFx.colour[3].g = 6;
        CWeaponFx.colour[1].b = CWeaponFx.colour[3].b = 6;
    } else if (element >= 0 && element < 6) {
        blue = wep_rgb[element][2] >> 2;
        green = wep_rgb[element][1] >> 2;
        red = wep_rgb[element][0] >> 2;

        CWeaponFx.colour[0].r = CWeaponFx.colour[2].r = red;
        CWeaponFx.colour[0].g = CWeaponFx.colour[2].g = green;
        CWeaponFx.colour[0].b = CWeaponFx.colour[2].b = blue;
        CWeaponFx.colour[1].r = CWeaponFx.colour[3].r = red / 10.0f;
        CWeaponFx.colour[1].g = CWeaponFx.colour[3].g = green / 10.0f;
        CWeaponFx.colour[1].b = CWeaponFx.colour[3].b = blue / 10.0f;
    }
}

FUZZY_MATCH("asm/nonmatchings/dun/gameloop", Get_Main_EffectPtr__Fii);

BT_SHOT_EFFECT *Get_Main_EffectPtr(int chara, int form) {
    switch (chara) {
        case 0:
            return MyEffectEntry_Tbl[0];
        case 1:
            return MyEffectEntry_Tbl[1];
        case 2:
            return MyEffectEntry_Tbl[2];
        case 3:
            // Ruby draws a different set for each of her forms.
            if (form < 0 || form > 4) {
                form = 0;
            }
            return MyEffectEntry_Tbl[3 + form];
        case 4:
            return MyEffectEntry_Tbl[8];
        case 5: {
            // Osmond draws from the weapon he has equipped rather than a form.
            s32 weapon =
                UserStatus->chara_weapons[chara][UserStatus->equipped_weapon_slot[chara]].item_no;
            int entry = 0;

            BtActStatus.unk_0A0 = 0;
            if (weapon == 0x16D) {
                entry = 3;
                BtActStatus.unk_0A0 = 0;
            }
            if (weapon == 0x170) {
                entry = 0;
                BtActStatus.unk_0A0 = 2;
            }
            if (weapon == 0x171) {
                entry = 0;
                BtActStatus.unk_0A0 = 2;
            }
            if (weapon == 0x172) {
                entry = 4;
                BtActStatus.unk_0A0 = 0;
            }
            if (weapon == 0x173) {
                entry = 1;
                BtActStatus.unk_0A0 = 1;
            }
            if (weapon == 0x174) {
                entry = 5;
                BtActStatus.unk_0A0 = 0;
            }
            if (weapon == 0x175) {
                entry = 2;
                BtActStatus.unk_0A0 = 1;
            }
            if (weapon == 0x176) {
                entry = 2;
                BtActStatus.unk_0A0 = 1;
            }
            return MyEffectEntry_Tbl[9 + entry];
        }
    }
    return NULL;
}

void MainChara_Effect(BT_SHOT_EFFECT *effect, unsigned int *data, int reload) {
    CharaMainEffect.Initialize();
    CharaMainEffectCrash.Initialize();

    if (effect == NULL) {
        return;
    }

    // A reload gives the effect block back before the new models go in.
    if (reload != 0) {
        TexManager.DeleteTextureBlock(0x10);
        TexManager.CleanUpBuffer();
        TexManager.CleanUpTextureList();
        WEffectModelBuffer.used = 0;
    }

    if (CharaMainEffect.Entry2(effect, data, 0x10, &WEffectModelBuffer, 6) == 0) {
        printf("effect entry err!!\n");
    } else {
        printf("set eff sucsess !\n");
    }

    if (UserStatus->cur_chara == 5) {
        unsigned int *crash = ozumond_default_effect;

        CharaMainEffectCrash.Entry2(MyEffectEntry_Tbl[9],
                                    crash, 0x10, &WEffectModelBuffer, 6);
    }
    if (UserStatus->cur_chara == 3) {
        unsigned int *crash = ozumond_default_effect;

        CharaMainEffectCrash.Entry2(MyEffectEntry_Tbl[3],
                                    crash, 0x10, &WEffectModelBuffer, 6);
    }
    NowMainEffect = &CharaMainEffect;
}

void LoadChara2(int chara, int keep_place, unsigned int *chara_data, unsigned int *crash_data,
                unsigned int *default_data, unsigned int *main_data) {
    CFrameAttr frame_attr;
    sceVu0FVECTOR pos;
    sceVu0FVECTOR rotation;
    int i;

    frame_attr.unk_0C = 1;
    frame_attr.unk_08 = 0;
    frame_attr.unk_0B = 0;

    // The model goes back where the one it replaces stood.
    if (keep_place == 0) {
        sceVu0CopyVector(pos, CharaFrame->position);
        CharaFrame->GetRotation(rotation);
    }

    TexManager.DeleteTextureBlock(0x11);
    TexManager.DeleteTextureBlock(0x1D);
    TexManager.DeleteTextureBlock(0x10);
    TexManager.CleanUpBuffer();
    TexManager.CleanUpTextureList();
    CharaModelBuffer.used = 0;

    CharaMain.Initialize();
    for (i = 0; i < 64; i++) {
        CharaMainTexAnim[i].Initialize();
    }
    CharaMain.InitializeTexAnime(CharaMainTexAnim, 64);
    CharaMain.LoadPackData2(chara_data, "base.cfg", &CharaModelBuffer, 0x11,
                            &CharaModelBuffer, 0);
    NowWeapon = NULL;
    CharaHand.Initialize();

    if (chara == 1) {
        CFrameAttr hand_attr;

        hand_attr.unk_08 = 1;
        hand_attr.unk_09 = 0;
        CharaHand.LoadPackData(chara_data, "hand_up.cfg", &CharaModelBuffer,
                               &CharaModelBuffer, NULL);
        CharaHand.frame->SetAttr(hand_attr, 1, 0);
    }
    if (chara == 3) {
        CFrameAttr hand_attr;

        hand_attr.unk_08 = 1;
        hand_attr.unk_09 = 0;
        CharaHand.LoadPackData(chara_data, "hand_up.cfg", &CharaModelBuffer,
                               &CharaModelBuffer, NULL);
        CharaHand.frame->SetAttr(hand_attr, 1, 0);
    }

    CharaMain.frame->SetAttr(frame_attr, 1, 4);

    if (keep_place == 0) {
        CharaMain.frame->SetPosition(pos);
        CharaMain.frame->SetRotation(rotation[0], rotation[1], rotation[2]);
        CharaMain.SetPosition(pos);
        CharaMain.SetRotation(rotation[0], rotation[1], rotation[2]);
    }
    CharaFrame = (CFrameVu1 *) CharaMain.frame;

    if (chara == 5) {
        LOADTEXTURE_INFO2 info[2] = {{NULL, 0x46, 0}, {NULL, 0x46, 0}};
        int size;

        u_int *hand_texture = GetPackFile(chara_data, "c05w_h.img", &size);
        u8 *at = CharaModelBuffer.buffer + CharaModelBuffer.used * 16;

        memcpy(at, hand_texture, size);
        size = (((size >> 6) + 1) << 6) >> 4;
        CharaModelBuffer.Alloc(size);
        info[0].name = (char *) at;
        TexManager.DeleteTextureBlock(0x46);
        TexManager.LoadTextureBlockEX(0x46, info);

        u_int *effect = GetPackFile(chara_data, "mgan01.chr", &size);

        ozumond_default_effect = (unsigned int *) (CharaModelBuffer.buffer +
                                                   CharaModelBuffer.used * 16);
        memcpy(ozumond_default_effect, effect, size);
        size = (((size >> 6) + 1) << 6) >> 4;
        CharaModelBuffer.Alloc(size);
    }

    if (chara == 3) {
        int size;
        u_int *effect = GetPackFile(chara_data, "c05_f03.chr", &size);

        ozumond_default_effect = (unsigned int *) (CharaModelBuffer.buffer +
                                                   CharaModelBuffer.used * 16);
        memcpy(ozumond_default_effect, effect, size);
        size = (((size >> 6) + 1) << 6) >> 4;
        CharaModelBuffer.Alloc(size);
    }

    // The weapon models take whatever the character models leave.
    s32 used = CharaModelBuffer.used;
    u8 *free_start = CharaModelBuffer.buffer + used * 16;
    s64 free_size = 0x33450 - used;

    WeaponModelBuffer.buffer = free_start;
    WeaponModelBuffer.size = free_size;
    WeaponModelBuffer.used = 0;
    LoadWeapon2(crash_data, default_data, main_data, chara, 0);
    MemoryMapDump();
}

extern void BtGetWeaponNamePath3(char *, char *, int);

static void LoadData(void) {
    CFrameAttr frame_attr;
    char weapon_model_path[64];
    char weapon_name[64];
    char weapon_effect_name[64];
    char steal_model_name[64];
    int character_size;
    int weapon_0_size;
    int weapon_1_size;
    int equipped_weapon_size;

    // Configure the model attributes used by the loaded dungeon objects.
    frame_attr.unk_0C = 1;
    frame_attr.unk_04 = 100.0f;
    frame_attr.unk_08 = 0;
    frame_attr.unk_0B = 0;

    UserStatus->cur_chara = 0;
    BtGetWeaponNamePath3(
        weapon_name,
        weapon_effect_name,
        UserStatus->chara_weapons[0][UserStatus->equipped_weapon_slot[0]].item_no);
    printf("[%d] %s\n",
           UserStatus->chara_weapons[0][UserStatus->equipped_weapon_slot[0]].item_no,
           weapon_name);

    strcpy(weapon_model_path, "commenu/weapon/");
    strcat(weapon_model_path, weapon_name);

    // Load the character and weapon data into consecutive 64-byte regions.
    LoadFile("dun/mainchara/c01d.chr", read_buffer, &character_size);
    unsigned int aligned_size = ((character_size >> 6) + 1) << 6;
    unsigned int *weapon_data_0 = read_buffer + (aligned_size >> 2);

    LoadFile("commenu/weapon/c01w00.chr", weapon_data_0, &weapon_0_size);
    aligned_size = ((weapon_0_size >> 6) + 1) << 6;
    unsigned int *weapon_data_1 = weapon_data_0 + (aligned_size >> 2);

    LoadFile("commenu/weapon/c01w01.chr", weapon_data_1, &weapon_1_size);
    aligned_size = ((weapon_1_size >> 6) + 1) << 6;
    unsigned int *equipped_weapon_data = weapon_data_1 + (aligned_size >> 2);

    LoadFile(weapon_model_path, equipped_weapon_data, &equipped_weapon_size);
    wait_now_loading_vsync();
    LoadChara2(UserStatus->cur_chara, 1, read_buffer, weapon_data_0,
               weapon_data_1, equipped_weapon_data);
    float chara_z = 150.0f;

    CharaFrame->SetPosition(200.0f, 0.0f, chara_z);

    BT_SHOT_EFFECT *main_effect = Get_Main_EffectPtr(UserStatus->cur_chara, 0);
    LoadFile("dun/mainchara/wep_eff/c01_fuusya.chr", read_buffer, NULL);
    wait_now_loading_vsync();
    MainChara_Effect(main_effect, read_buffer, 0);

    if (SndVoiceLoad(0) != 0) {
        printf("voice err \n");
    } else {
        printf("snd load\n");
    }

    // Load the shared dungeon pack and its models.
    unsigned int *main_pack = read_buffer;

    LoadFile("dun/pack/maindat.pac", main_pack, NULL);
    wait_now_loading_vsync();
    cursorFrame = LoadMDSFilePack(read_buffer, "dun/etc/cursor.mds", &MainModelBuffer);
    bombCursorFrame = LoadMDSFilePack(read_buffer, "dun/etc/bomblock.mds", &MainModelBuffer);
    bicCursorFrame = LoadMDSFilePack(read_buffer, "dun/etc/bic.mds", &MainModelBuffer);
    bicCursorFrame->SetScale(0.7f, 0.7f, 0.7f);

    NowDngMap->atra_model =
        LoadMDSFilePack(read_buffer, "dun/etc/atr.mds", &MainModelBuffer);
    NowDngMap->collision_model =
        LoadCollisionFilePack(read_buffer, "dun/etc/atrcol.mds", &MainModelBuffer);
    NowDngMap->atra_model->SetAttr(frame_attr, 1, 0);

    NewChangeFx.LoadPackData2((unsigned int *) GetPackFile(read_buffer, "ceffe_s.chr", NULL),
                              "info.cfg", &MainModelBuffer, 11, &MainModelBuffer, 0);
    itemOpenSmallFx.LoadPack(read_buffer, "igetfx", &MainModelBuffer, &MotionData,
                             &itemOpenSmallFx_info, 0);
    itemOpenBigFx.LoadPack(read_buffer, "igetfxb", &MainModelBuffer, &MotionData,
                           &itemOpenBigFx_info, 0);

    Water_Splash.LoadPackData2((unsigned int *) GetPackFile(read_buffer, "water_sp.chr", NULL),
                               "info.cfg", &MainModelBuffer, 6, &MainModelBuffer, 0);

    unsigned int *effect_data =
        (unsigned int *) GetPackFile(read_buffer, "trap01.chr", NULL);
    Trap_Circle.InitializeTexAnime(Trap_Circle_TexAnim, 16);
    Trap_Circle.LoadPackData2(effect_data, "info.cfg", &MainModelBuffer, 71,
                              &MainModelBuffer, 0);
    Trap_Circle.frame->SetAttr(frame_attr, 1, 0x40);

    sprintf(steal_model_name, "kara0%d.mds", selectMapNo + 1);
    unsigned int *steal_model_data =
        (unsigned int *) GetPackFile(read_buffer, steal_model_name, NULL);
    StealModel = (CFrameVu1 *) LoadMDSFile(steal_model_data, &MainModelBuffer, 0, NULL, NULL);

    MasekiModelBuffer.used = 0;
    LoadFile("dun/effect/maseki_ex.chr", read_buffer, NULL);
    wait_now_loading_vsync();
    MasekiEffect[0].Entry2(&MyEntryEffect_Maseki00, read_buffer, 6,
                           &MasekiModelBuffer, 3);

    memcpy(&MasekiEffect[1], &MasekiEffect[0], sizeof(CSHOT_EFFECT));
    MasekiEffect[1].ReEntry(&MyEntryEffect_Maseki01, &MasekiModelBuffer);
    memcpy(&MasekiEffect[2], &MasekiEffect[0], sizeof(CSHOT_EFFECT));
    MasekiEffect[2].ReEntry(&MyEntryEffect_Maseki02, &MasekiModelBuffer);
    memcpy(&MasekiEffect[3], &MasekiEffect[0], sizeof(CSHOT_EFFECT));
    MasekiEffect[3].ReEntry(&MyEntryEffect_Maseki03, &MasekiModelBuffer);
    memcpy(&MasekiEffect[4], &MasekiEffect[0], sizeof(CSHOT_EFFECT));
    MasekiEffect[4].ReEntry(&MyEntryEffect_Maseki04, &MasekiModelBuffer);
}

int BtCheckDamageProc(void) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR from;
    sceVu0FVECTOR blow;
    int taken = 0;
    int blown = 0;

    static int dmgSnd = 0;

    if (dmgSnd > 0) {
        dmgSnd--;
    }

    // The debug menu can hold the player at full health.
    if (DebugStatus[20] == 2) {
        CUserStatus *status = UserStatus;

        status->hp[status->cur_chara] = status->max_hp[status->cur_chara];
        return 0;
    }

    if (BtActStatus.unk_020 == 0 && BtActStatus.unk_024 == 0) {
        sceVu0CopyVector(pos, CharaMain.pos);

        int no = NowColData->CheckHitUser(pos, 1, CharaHeight(UserStatus));

        if (no != -1) {
            taken = 1;
            if (BtActStatus.action_on == 6) {
                blown = taken;
            }

            BombInfo.unk_14 = 0;
            BombInfo.unk_18 = -1;
            BtActStatus.unk_064 = 1;
            BtActStatus.action_on = 0;
            BtActStatus.unk_070 = 0;

            if (activeItem.model[8] != -1) {
                activeItem.models->AllReleasItem();
                activeItem.model[8] = -1;
            }

            BtActStatus.move_power = 0.0f;
            BtActStatus.unk_0A4 = 0;
            BtActStatus.unk_048 = 100.0f;
            CMonUnitHold = 0;
            CEffectHold = 0;

            if (ruby_effect_id != -1 && UserStatus->cur_chara == 3) {
                NowMainEffect->OffEffect(ruby_effect_id);
                ruby_effect_id = -1;
            }

            int damage = NowColData->hit[no].damage;
            int guard = UserStatus->unk_4348[UserStatus->cur_chara];
            int monster;
            int roll;
            COLLISION_HIT *hit = &NowColData->hit[no];

            if (StatusErrCheck(8) != 0) {
                guard *= 2;
            }
            damage -= guard;
            if (damage <= 0) {
                damage = 0;
            }

            monster = -1;

            if (NowColData->hit[no].owner != -1) {
                monster = (NowColData->hit[no].owner - 200) / 5;
                if (monster >= 0 && monster < 16) {
                    NowMonstorUnit->monster[monster].unk_0C0 = damage;
                }
                NowMonstorUnit->chara[monster][0].GetPosition(from);
            }

            roll = (int) (100.0f * (float) rand() / 2147483648.0f);

            // A hit that drains takes water off the player and gives it to
            // whatever landed it.
            if ((hit->flags & 0x40000) && roll < 20 && monster != -1) {
                u16 *water = &UserStatus->unk_4346;
                u16 had = UserStatus->unk_4346;

                if (had > 10) {
                    int drained = had / 5;

                    *water -= drained;
                    SndSePlay(0xDF, -1, 0);
                    NowMonstorUnit->monster[monster].unk_03C += drained;
                    DngMessMan.unk_24 = 0xB5;
                    DngMessMan.unk_04 = 0xB4;
                    DngMessMan.unk_1C = 0;
                }
            }

            if ((hit->flags & 0x1000) && roll < 0x41) {
                BtSetStatusErr(8);
            }
            if (hit->flags & 0x100000) {
                BtSetStatusErr(4);
            }

            if ((hit->flags & 0x100) && roll < 0x41) {
                int slot = ((CDngStatusData *) UserStatus)->CheckActItemSlot(0x84);

                if (slot == -1) {
                    BtSetStatusErr(4);
                } else {
                    CUserStatus *who = UserStatus;
                    s32 *vol = &who->active_item_vol[slot];

                    if (--(*vol) <= 0) {
                        DelActiveItem(slot + 1);
                        DngMessMan.unk_24 = 0xB7;
                        DngMessMan.unk_0C = GetCommonItemDataSystemMsg(0x84);
                        DngMessMan.unk_04 = 0xB4;
                        DngMessMan.unk_1C = 0;
                    }
                }
            }

            if ((hit->flags & 0x200) && roll < 0x41 &&
                (UserStatus->unk_42C8[UserStatus->cur_chara] & 0x10) == 0) {
                int slot = ((CDngStatusData *) UserStatus)->CheckActItemSlot(0x87);

                if (slot == -1) {
                    BtSetStatusErr(0x10);
                    DngMessMan.unk_24 = 0xBB;
                    DngMessMan.unk_04 = 0xB4;
                    DngMessMan.unk_1C = 0;
                } else {
                    CUserStatus *who = UserStatus;
                    s32 *vol = &who->active_item_vol[slot];

                    if (--(*vol) <= 0) {
                        DelActiveItem(slot + 1);
                        DngMessMan.unk_24 = 0xB7;
                        DngMessMan.unk_0C = GetCommonItemDataSystemMsg(0x87);
                        DngMessMan.unk_04 = 0xB4;
                        DngMessMan.unk_1C = 0;
                    }
                }
            }

            if ((hit->flags & 0x400) && roll < 0x41 &&
                (UserStatus->unk_42C8[UserStatus->cur_chara] & 0x20) == 0) {
                int slot = ((CDngStatusData *) UserStatus)->CheckActItemSlot(0x85);

                if (slot == -1) {
                    BtSetStatusErr(0x20);
                    DngMessMan.unk_24 = 0xB9;
                    DngMessMan.unk_04 = 0xB4;
                    DngMessMan.unk_1C = 0;
                } else {
                    CUserStatus *who = UserStatus;
                    s32 *vol = &who->active_item_vol[slot];

                    if (--(*vol) <= 0) {
                        DelActiveItem(slot + 1);
                        DngMessMan.unk_24 = 0xB7;
                        DngMessMan.unk_0C = GetCommonItemDataSystemMsg(0x85);
                        DngMessMan.unk_04 = 0xB4;
                        DngMessMan.unk_1C = 0;
                    }
                }
            }

            if ((hit->flags & 0x800) && roll < 0x41 &&
                (UserStatus->unk_42C8[UserStatus->cur_chara] & 0x40) == 0) {
                int slot = ((CDngStatusData *) UserStatus)->CheckActItemSlot(0x86);

                if (slot == -1) {
                    BtSetStatusErr(0x40);
                    DngMessMan.unk_24 = 0xBA;
                    DngMessMan.unk_04 = 0xB4;
                    DngMessMan.unk_1C = 0;
                } else {
                    CUserStatus *who = UserStatus;
                    s32 *vol = &who->active_item_vol[slot];

                    if (--(*vol) <= 0) {
                        DelActiveItem(slot + 1);
                        DngMessMan.unk_24 = 0xB7;
                        DngMessMan.unk_0C = GetCommonItemDataSystemMsg(0x86);
                        DngMessMan.unk_04 = 0xB4;
                        DngMessMan.unk_1C = 0;
                    }
                }
            }

            // A hit that halves takes half of what the player can hold.
            if (hit->flags & 0x80000) {
                damage = UserStatus->max_hp[UserStatus->cur_chara] >> 1;
            }

            if (NowColData->hit[no].kind == 3) {
                sceVu0CopyVector(blow, NowColData->hit[no].pos);
                GamePad.SetVibration(1, 0xE6, 0x16);

                if (BtActStatus.action_no == 9) {
                    sceVu0CopyVector(blowVelo, NowColData->hit[no].velocity);
                    velo__2[0] = blowVelo[0] / 10.0f;
                    velo__2[2] = blowVelo[2] / 10.0f;
                    if (NowColData->hit[no].unk_48 != 3) {
                        NowColData->active[no] = 0;
                    }
                    if (dmgSnd <= 0) {
                        SndSePlay(0xA2, -1, 0);
                        dmgSnd = 30;
                    }
                } else {
                    SndSePlay(0x1AF, -1, 0);
                    SndSePlay(0xA1, -1, 0);
                    BtActStatus.unk_144 = 15;
                    setUnitAmbientAnime(160.0f, 1.0f, 255.0f, 0.0f, 0.0f);
                    UserStatus->AddNowLife(UserStatus->cur_chara, -damage, 10.0f);

                    float value[4] = {0.0f, 0.0f, 0.0f, 1.0f};

                    value[1] = CharaHeight(UserStatus);
                    HitValueEntry(NowHitValue, value, damage, 2, CharaMain.frame);

                    sceVu0CopyVector(blowVelo, NowColData->hit[no].velocity);
                    unitBlowActionRot(blowVelo);
                    if (NowColData->hit[no].unk_48 != 3) {
                        NowColData->active[no] = 0;
                    }

                    if (damage < UserStatus->hp[UserStatus->cur_chara]) {
                        BtActStatus.action_on = 5;
                        BtActStatus.unk_00C = 6;
                        CharaMain.motion_type.state.time =
                            (float) CharaMain.motion_type.motion_info[6].start;
                    } else {
                        BtActStatus.action_on = 4;
                        BtActStatus.unk_00C = 4;
                        CharaMain.motion_type.state.time =
                            (float) CharaMain.motion_type.motion_info[4].start;
                    }
                    driveNoInterpolate = 1;
                    lockOnTargetFlag = 0;
                    BtActStatus.unk_020 = 0xA0;
                }
            }

            int kind = NowColData->hit[no].kind;

            if (kind == 2 || kind == 4) {
                sceVu0FVECTOR at;
                sceVu0FVECTOR away;

                sceVu0CopyVector(at, NowColData->hit[no].pos);
                GamePad.SetVibration(1, 0xDC, 0xC);

                if (blown != 0) {
                    sceVu0CopyVector(away, CharaMain.pos);
                    if (monster != -1) {
                        away[0] -= from[0];
                        away[1] = 0.0f;
                        away[2] -= from[2];
                    } else {
                        away[0] -= at[0];
                        away[1] = 0.0f;
                        away[2] -= at[2];
                    }

                    sceVu0CopyVector(MyHitPointMark[0].pos, at);
                    MyHitPointMark[0].on = 1;
                    MyHitPointMark[0].blink = 0;
                    MyHitPointMark[0].timer = 0x10;
                    velo__2[0] = away[0] / 2.0f;
                    velo__2[2] = away[2] / 2.0f;
                    if (NowColData->hit[no].unk_48 != 3) {
                        NowColData->active[no] = 0;
                    }
                    if (dmgSnd <= 0) {
                        SndSePlay(0xA2, -1, 0);
                        dmgSnd = 30;
                    }
                } else {
                    SndSePlay(0x1AE, -1, 0);
                    SndSePlay(0xA1, -1, 0);
                    BtActStatus.unk_144 = 25;
                    setUnitAmbientAnime(80.0f, 1.0f, 255.0f, 0.0f, 0.0f);
                    UserStatus->AddNowLife(UserStatus->cur_chara, -damage, 10.0f);
                    if (NowColData->hit[no].unk_48 != 3) {
                        NowColData->active[no] = 0;
                    }

                    float heavy_value[4] = {0.0f, 0.0f, 0.0f, 1.0f};

                    heavy_value[1] = CharaHeight(UserStatus);
                    HitValueEntry(NowHitValue, heavy_value, damage, 2, CharaMain.frame);

                    static int cnt = 0;
                    CHitPointMark *spot = &MyHitPointMark[cnt];

                    sceVu0CopyVector(spot->pos, at);
                    spot->on = 1;
                    spot->blink = 0;
                    spot->timer = 0x10;
                    if (cnt >= 15) {
                        cnt = 0;
                    } else {
                        cnt++;
                    }

                    if (!(stickVector < 0.8f)) {
                        BtActStatus.action_on = 0;
                        BtActStatus.unk_00C = 0x1D;
                    } else {
                        BtActStatus.action_on = 4;
                        BtActStatus.unk_00C = 4;
                        CharaMain.motion_type.state.time =
                            (float) CharaMain.motion_type.motion_info[4].start;
                    }
                    driveNoInterpolate = 1;
                    BtActStatus.unk_020 = 0x50;

                    if (NowColData->hit[no].kind == 4) {
                        BtActStatus.unk_020 = 8;
                        setUnitAmbientAnime(10.0f, 1.0f, 255.0f, 0.0f, 0.0f);
                    } else {
                        setUnitAmbientAnime(80.0f, 1.0f, 255.0f, 0.0f, 0.0f);
                    }
                }
            }
        }
    }

    if (DebugStatus[20] > 0) {
        CUserStatus *status = UserStatus;

        status->hp[status->cur_chara] = status->max_hp[status->cur_chara];
    }
    return taken;
}

void BattleActionThlow(void) {
    sceVu0FVECTOR stood;
    sceVu0FVECTOR aim;

    float facing = NowCamera__3->GetAngle();

    if (BtActStatus.action_on != 2) {
        return;
    }

    // The stick walks the landing point around while the button is held.
    if (BombInfo.unk_14 != 0) {
        if (GamePad.On(0x80) != 0) {
            float stick_x = GamePad.GetLXf();
            float stick_y = GamePad.GetLYf();

            sceVu0CopyVector(stood, CharaMain.pos);
            aim[0] = BombInfo.pos[0] + stick_x * cos(facing) + stick_y * sinf(facing);
            aim[2] = BombInfo.pos[2] + stick_y * cos(facing) - stick_x * sinf(facing);
            aim[1] = BombInfo.pos[1];
            aim[3] = 1.0f;

            float away = DistVector(aim, stood);

            if (!(away < 30.0f) && away <= 120.0f) {
                sceVu0CopyVector(BombInfo.pos, aim);
            }

            float heading = atan2f(aim[0] - stood[0], aim[2] - stood[2]);
            float turned = unitRotation((CFrameVu1 *) CharaFrame, heading);
            float zero = 0.0f;

            CharaFrame->SetRotation(zero, turned, zero);
            BtActStatus.unk_00C = 0x1A;
        } else {
            BombInfo.unk_14 = 0;
            BombInfo.unk_18 = 1;
            BtActStatus.unk_00C = 0x1B;
        }
    }

    if (BombInfo.unk_18 == 1) {
        float throw_frame[6] = {548.0f, 452.0f, 267.0f, 347.0f, 188.0f, 321.0f};
        float end = (float) CharaMain.motion_type.motion_info[27].end;
        float start = throw_frame[UserStatus->cur_chara];

        if (CharaMain.motion_type.state.time >= start &&
            CharaMain.motion_type.state.time <= end) {
            SndSePlay(0x96, -1, 0);

            s16 *slots = UserStatus->active_item;

            if (slots[itemNowSel + 3] == 1) {
                slots[itemNowSel] = -1;
                slots[itemNowSel + 3] = 0;
            } else {
                slots[itemNowSel + 3]--;
            }

            if (lockOnTargetFlag == 0) {
                sceVu0FVECTOR vector;
                sceVu0FVECTOR from;

                if (activeItem.model[8] != -1) {
                    activeItem.models->DeleteModel(activeItem.model[8]);
                }
                activeItem.model[8] = -1;

                float offset[4] = {0.0f, 0.0f, 0.0f, 1.0f};

                CharaMain.frame->SearchFrame("item")->GetWorldPosition(from, offset);
                DistVector(from, BombInfo.pos);
                ParabolicInitialVector(vector, from, BombInfo.pos, 0.12f, 20.0f);
                sceVu0ScaleVectorXYZ(vector, vector, 0.8f);

                if (activeItem.model[8] == -1) {
                    activeItem.models->SetThrowModel(activeItem.model[activeItem.now],
                                                     from, vector);
                }
                BombInfo.unk_18++;
            } else {
                sceVu0FVECTOR lock_vector;
                sceVu0FVECTOR lock_from;

                if (activeItem.model[8] != -1) {
                    activeItem.models->DeleteModel(activeItem.model[8]);
                }
                activeItem.model[8] = -1;

                float lock_offset[4] = {0.0f, 0.0f, 0.0f, 1.0f};
                CFrame *hand = CharaMain.frame->SearchFrame("item");

                if (hand != NULL) {
                    hand->GetWorldPosition(lock_from, lock_offset);
                }

                lock_vector[0] = BtActStatus.unk_080[0] - lock_from[0];
                lock_vector[1] = 5.0f + (BtActStatus.unk_080[1] - lock_from[1]);
                lock_vector[2] = BtActStatus.unk_080[2] - lock_from[2];
                sceVu0Normalize(lock_vector, lock_vector);
                lock_vector[0] *= 4.5f;
                lock_vector[1] *= 4.5f;
                lock_vector[2] *= 4.5f;

                if (activeItem.model[8] == -1) {
                    activeItem.models->SetThrowModel(activeItem.model[activeItem.now],
                                                     lock_from, lock_vector);
                }
                BombInfo.unk_18++;
            }
        }
        BtActStatus.unk_00C = 0x1B;
    }

    if (BombInfo.unk_18 == 2) {
        BtActStatus.unk_00C = 0x1B;

        float end = (float) CharaMain.motion_type.motion_info[27].end;
        float now = CharaMain.motion_type.state.time;

        if (now >= end - 2.0f && now <= end) {
            BtActStatus.action_on = 0;
            BtActStatus.unk_064 = 1;
            BtActStatus.unk_028 = 0;
            driveNoInterpolate = 1;
            if (lockOnTargetFlag != 0) {
                BtActStatus.unk_00C = 0x12;
            }
            BtActStatus.unk_070 = 0;
            BtActStatus.unk_00C = 0;
        }
    }
}

void BattleActionDrink(void) {
    float frame;
    float now;

    if (BtActStatus.action_on != 3) {
        return;
    }

    float drink_frame[6] = {628.0f, 474.0f, 285.0f, 474.0f, 474.0f, 474.0f};

    BtActStatus.unk_00C = 0x1C;
    frame = drink_frame[UserStatus->cur_chara];
    now = CharaMain.motion_type.state.time;

    if (now >= frame && now < frame + 0.3f) {
        SndSePlay(0x97, -1, 0);
    }

    if (now >= frame + 10.0f && now < frame + 10.3f) {
        setUnitAmbientAnime(64.0f, 1.0f, 0.0f, 122.0f, 208.0f);
        SndSePlay(0x13, -1, 0);
    }

    float end = (float) CharaMain.motion_type.motion_info[28].end;

    if (CharaMain.motion_type.state.time >= end - 1.0f &&
        CharaMain.motion_type.state.time <= end) {
        s32 running = activeItem.item[activeItem.now];

        usedActiveItem(UserStatus, running);

        s16 *slots = UserStatus->active_item;

        // The last use takes the item away; anything else just spends one.
        if (slots[itemNowSel + 3] == 1) {
            slots[itemNowSel] = -1;
            slots[itemNowSel + 3] = 0;
        } else {
            slots[itemNowSel + 3]--;
        }

        if (activeItem.model[8] != -1) {
            activeItem.models->DeleteModel(activeItem.model[8]);
        }
        activeItem.model[8] = -1;
        SndSePlay(0x1B8, -1, 0);

        BtActStatus.action_on = 0;
        BtActStatus.unk_064 = 1;
        driveNoInterpolate = 1;
        BtActStatus.unk_070 = 0;
        BtActStatus.unk_00C = 0;
        CMonUnitHold = 0;
        CEffectHold = 0;
        DngMessMan.unk_24 = -1;
        DngMessMan.unk_04 = 0;
        DngMessMan.unk_1C = 0;
        DngMessMan.unk_20 = 0;
        DngMessMan.unk_08 = 0;
    }
}

/* How long until Ozumond's action plays its sound again, in frames. */
s32 ozumond_snd_cnt;

/* How long until the player can be damaged again, in frames. */
s32 dmg_check_wait;

void BattleActionOn_Jinn(void) {
    if (BtActStatus.action_on == 0 && (s32) BtActStatus.unk_048 == 100) {
        BtActStatus.action_step = 0;
        BtActStatus.unk_01C = 0.0f;
        BtActStatus.action_no = 11;
        BtActStatus.action_on = 1;
        BtActStatus.unk_048 = 0.0f;
        driveNoInterpolate = 1;
        SndSePlay(400, -1, 0);
    }
}

void BattleActionPlay_Jinn(CCharacter *chara, int aimed) {
    float now = chara->motion_type.state.time;
    int damage = NowWeaponHave->attack;
    int i;

    // A poisoned weapon hits twice as hard.
    if (StatusErrCheck(8) != 0) {
        damage *= 2;
    }

    if (BtActStatus.action_no == 11) {
        if (GamePad.On(PadInput_OK) == 0) {
            BtActStatus.action_step = 1;
        }
        BtActStatus.unk_00C = 11;

        float end = (float) chara->motion_type.motion_info[11].end;

        // Letting go before the wind-up ends holds the swing; keeping it
        // pressed goes straight on to the throw.
        if (now >= end - 2.0f && now <= end) {
            if (BtActStatus.action_step == 0) {
                BtActStatus.action_no = 12;
            } else {
                BtActStatus.action_no = 13;
            }
        }
    }

    if (BtActStatus.action_no == 13) {
        BtActStatus.unk_00C = 13;

        if (aimed == 0) {
            if (now > 251.0f && now < 252.0f) {
                SndSePlay(0x191, -1, 0);
                SndSePlay(0x1A5, -1, 0);

                sceVu0FVECTOR world;
                sceVu0FVECTOR vector;
                float offset[4] = {0.0f, 0.0f, 0.0f, 1.0f};
                CFrame *hand = NowWeapon->frame->SearchFrame("eff30");

                if (hand != NULL) {
                    hand->GetWorldPosition(world, offset);
                    if (lockOnTargetFlag == 0) {
                        float y = CharaMain.GetRotation()->y;

                        setShotVector(vector, 5.0f, y, 0.0f);
                    } else {
                        vector[0] = BtActStatus.unk_080[0] - world[0];
                        vector[1] = BtActStatus.unk_080[1] - world[1];
                        vector[2] = BtActStatus.unk_080[2] - world[2];
                        sceVu0Normalize(vector, vector);
                        vector[0] *= 5.0f;
                        vector[1] *= 5.0f;
                        vector[2] *= 5.0f;
                    }

                    CSHOT *shots = NowShotData;

                    for (i = 0; i < 12; i++) {
                        if (shots->used[i] == 0) {
                            sceVu0CopyVector(shots->pos[i], world);
                            sceVu0CopyVector(shots->vector[i], vector);
                            shots->life[i] = 0x78;
                            shots->damage[i] = damage;
                            shots->unk_09[i] = 1.0f;
                            shots->unk_280[i] = 0;
                            shots->unk_3A0[i] = 0;
                            shots->used[i] = 1;
                            break;
                        }
                    }
                    BtActStatus.unk_0E0 = 0;
                }
                SwordDmgCheck1(1.0f, 0);
            }
        } else {
            if (now > 21.0f && now < 21.5f) {
                SndSePlay(0x191, -1, 0);
                SndSePlay(0x1A5, -1, 0);

                sceVu0FVECTOR world;
                sceVu0FVECTOR vector;
                float offset[4] = {0.0f, 0.0f, 0.0f, 1.0f};
                CFrame *hand = NowWeapon->frame->SearchFrame("eff30");

                if (hand != NULL) {
                    hand->GetWorldPosition(world, offset);
                    setShotVector(vector, 3.5f, viewAngleH__2, viewAngleV__2);

                    CSHOT *shots = NowShotData;

                    for (i = 0; i < 12; i++) {
                        if (shots->used[i] == 0) {
                            sceVu0CopyVector(shots->pos[i], world);
                            sceVu0CopyVector(shots->vector[i], vector);
                            shots->life[i] = 0x78;
                            shots->damage[i] = damage;
                            shots->unk_09[i] = 1.0f;
                            shots->unk_280[i] = 0;
                            shots->unk_3A0[i] = 0;
                            shots->used[i] = 1;
                            break;
                        }
                    }
                    BtActStatus.unk_0E0 = 0;
                }
                SwordDmgCheck1(1.0f, 0);
            }
        }

        float end = (float) chara->motion_type.motion_info[13].end;

        if (now >= end - 2.0f && now <= end) {
            BtActStatus.unk_028 = 0;
            BtActStatus.unk_00C = 0;
            BtActStatus.action_on = 0;
            if (lockOnTargetFlag != 0) {
                BtActStatus.unk_00C = 0x12;
            }
            // Retail tests the task here and does nothing with the answer.
            if (gameTask == 10) {
                now = now;
            }
        }
    }

    if (BtActStatus.action_no == 12) {
        if (GamePad.On(PadInput_OK) == 0) {
            BtActStatus.action_step = 1;
        }
        BtActStatus.unk_00C = 12;
        driveNoInterpolate = 1;
        if (BtActStatus.action_step != 0) {
            driveNoInterpolate = 1;
            BtActStatus.action_no = 13;
        }
    }
}

void BattleActionOn_Ruby(void) {
    if (BtActStatus.action_on == 0 && (s32) BtActStatus.unk_048 == 100) {
        BtActStatus.action_step = 0;
        BtActStatus.action_no = 11;
        BtActStatus.action_on = 1;
        BtActStatus.unk_048 = 0.0f;
        BtActStatus.unk_01C = 0.0f;
        driveNoInterpolate = 1;
    }
}

void BattleActionShotRuby(CCharacter *chara, int aimed, float scale, int repeat) {
    WEAPON_HAVE *weapon = NowWeaponHave;
    int element = weapon->best_elem;
    int damage = (weapon->attack >> 1) + (weapon->magic >> 1);

    damage = (int) ((float) damage * scale);

    // A poisoned weapon hits twice as hard.
    if (StatusErrCheck(8) != 0) {
        damage *= 2;
    }

    // A repeat shot reuses the start and the way the first one took.
    if (repeat != 0) {
        if (NowMainEffect->Set(ruby_effect_pos, ruby_effect_vec, 3, element, 0, NULL, 1) != -1) {
            NowMainEffect->SetWepStatus(NowWeaponHave->flags);
            NowMainEffect->SetVsMonster(NowWeaponHave->vs_monster);
            NowMainEffect->SetDmg(damage);
            NowMainEffect->SetRandomRate(2.0f);
            NowMainEffect->SetNoSound();
        }
        return;
    }

    if (aimed == 0) {
        int shot_no;

        getFramePos((CFrameVu1 *) chara->frame, "weapon", ruby_effect_pos);

        if (lockOnTargetFlag == 0) {
            getCharacterVector(ruby_effect_vec, 0.0f);
            ruby_effect_vec[0] += ruby_effect_pos[0];
            ruby_effect_vec[1] += ruby_effect_pos[1];
            ruby_effect_vec[2] += ruby_effect_pos[2];
            shot_no = NowMainEffect->Set(ruby_effect_pos, ruby_effect_vec, 3, element, 0, NULL, 1);
        } else {
            sceVu0CopyVector(ruby_effect_vec, BtActStatus.unk_080);
            shot_no = NowMainEffect->Set(ruby_effect_pos, ruby_effect_vec, 3, element, 0, NULL, 1);
        }

        if (shot_no == -1) {
            return;
        }
        NowMainEffect->SetWepStatus(NowWeaponHave->flags);
        NowMainEffect->SetVsMonster(NowWeaponHave->vs_monster);
        NowMainEffect->SetDmg(damage);
        return;
    }

    float offset[4] = {0.0f, 0.0f, 0.0f, 1.0f};

    chara->frame->SearchFrame("weapon")->GetWorldPosition(ruby_effect_pos, offset);
    setShotVector(ruby_effect_vec, 3.5f, viewAngleH__2, viewAngleV__2);
    ruby_effect_vec[0] += ruby_effect_pos[0];
    ruby_effect_vec[1] += ruby_effect_pos[1];
    ruby_effect_vec[2] += ruby_effect_pos[2];

    if (NowMainEffect->Set(ruby_effect_pos, ruby_effect_vec, 3, element, 0, NULL, 1) != -1) {
        NowMainEffect->SetWepStatus(NowWeaponHave->flags);
        NowMainEffect->SetVsMonster(NowWeaponHave->vs_monster);
        NowMainEffect->SetDmg(damage);
    }
}

void BattleActionPlay_Ruby(CCharacter *chara, int aimed) {
    float now = chara->motion_type.state.time;
    int element = NowWeaponHave->best_elem;

    if (BtActStatus.action_no == 11) {
        if (GamePad.On(PadInput_OK) == 0) {
            BtActStatus.action_step = 1;
        }
        BtActStatus.unk_00C = 11;
        ruby_effect_id = -1;

        if (aimed == 0) {
            if (now >= 126.0f && now < 126.3f && BtActStatus.action_step == 0) {
                sceVu0FVECTOR pos;
                sceVu0FVECTOR aim;

                BtActStatus.unk_00C = 14;
                BtActStatus.action_no = 14;
                BtActStatus.unk_01C = 0.0f;
                ruby_effect_id = NowMainEffect->Set(pos, aim, 3, element, 0,
                                                    chara->frame->SearchFrame("item"), 0);
                NowMainEffect->SetLoop(1);
            }
            if (now >= 128.0f && now < 128.3f) {
                BattleActionShotRuby(chara, aimed, 1.0f, 0);
                BtActStatus.unk_0E0 = 0;
                SwordDmgCheck1(0.8f, 0);
                SndSePlay(0x190, -1, 0);
                SndSePlay(0x1A4, -1, 0);
            }
        } else {
            if (now >= 126.0f && now < 126.3f && BtActStatus.action_step == 0) {
                sceVu0FVECTOR pos;
                sceVu0FVECTOR aim;

                BtActStatus.unk_00C = 14;
                BtActStatus.action_no = 14;
                BtActStatus.unk_01C = 0.0f;
                ruby_effect_id = NowMainEffect->Set(pos, aim, 3, element, 0,
                                                    chara->frame->SearchFrame("item"), 0);
                NowMainEffect->SetLoop(1);
            }
            if (now >= 128.0f && now < 128.3f) {
                BattleActionShotRuby(chara, aimed, 1.0f, 0);
                BtActStatus.unk_0E0 = 0;
                SwordDmgCheck1(0.8f, 0);
                SndSePlay(0x190, -1, 0);
                SndSePlay(0x1A4, -1, 0);
            }
        }

        float end = (float) chara->motion_type.motion_info[11].end;

        if (now >= end - 1.0f && now <= end) {
            BtActStatus.unk_028 = 0;
            BtActStatus.unk_00C = 0;
            BtActStatus.action_on = 0;
            if (lockOnTargetFlag != 0 && aimed == 0) {
                BtActStatus.unk_00C = 0x12;
            }
        }
    }

    if (BtActStatus.action_no == 14) {
        if (GamePad.On(PadInput_OK) == 0) {
            BtActStatus.action_step = 1;
        }
        BtActStatus.unk_00C = 14;
        SndSeSeqPlayStop(0x193, 5, 0);

        BtActStatus.unk_01C += 1.0f;
        if (BtActStatus.unk_01C >= 60.0f) {
            BtActStatus.unk_01C = 60.0f;
        }
        if (BtActStatus.unk_01C >= 58.0f && BtActStatus.unk_01C < 58.5f) {
            setUnitAmbientAnime(15.0f, 1.0f, 0.0f, 122.0f, 208.0f);
        }
        if (BtActStatus.action_step != 0) {
            BtActStatus.action_no = 16;
            BtActStatus.unk_048 = 0.0f;
        }
    }

    if (BtActStatus.action_no == 16) {
        BtActStatus.unk_00C = 16;

        // A full charge throws two shots; a short one throws a single
        // stronger shot a little later.
        if (BtActStatus.unk_01C >= 60.0f) {
            if (now >= 216.0f && now < 217.5f && ruby_effect_id != -1) {
                NowMainEffect->OffEffect(ruby_effect_id);
                ruby_effect_id = -1;
            }
            if (aimed == 0) {
                if (now >= 216.0f && now < 216.4f) {
                    BattleActionShotRuby(chara, aimed, 2.2f, 0);
                    BattleActionShotRuby(chara, aimed, 2.2f, 1);
                    BtActStatus.unk_0E0 = 0;
                    SwordDmgCheck1(1.8f, 0);
                    SndSePlay(0x190, -1, 0);
                    SndSePlay(0x1A6, -1, 0);
                }
            } else {
                if (now >= 216.0f && now < 216.3f) {
                    BattleActionShotRuby(chara, aimed, 2.2f, 0);
                    BattleActionShotRuby(chara, aimed, 2.2f, 1);
                    BtActStatus.unk_0E0 = 0;
                    SwordDmgCheck1(1.8f, 0);
                    SndSePlay(0x190, -1, 0);
                    SndSePlay(0x1A6, -1, 0);
                }
            }
        } else {
            if (now >= 216.5f && now < 217.5f && ruby_effect_id != -1) {
                NowMainEffect->OffEffect(ruby_effect_id);
                ruby_effect_id = -1;
            }
            if (now >= 216.5f && now < 216.9f) {
                BattleActionShotRuby(chara, aimed, 1.5f, 0);
                BtActStatus.unk_0E0 = 0;
                SwordDmgCheck1(1.2f, 0);
                SndSePlay(0x190, -1, 0);
                SndSePlay(0x1A6, -1, 0);
            }
        }

        float end = (float) chara->motion_type.motion_info[16].end;

        if (now >= end - 1.0f && now <= end) {
            BtActStatus.unk_028 = 0;
            BtActStatus.unk_00C = 0;
            BtActStatus.action_on = 0;
            if (lockOnTargetFlag != 0 && aimed == 0) {
                BtActStatus.unk_00C = 0x12;
            }
        }
    }
}

void BattleActionOn_Ozumond(void) {
    if (BtActStatus.action_on == 0 && BtActStatus.unk_0A4 == 0) {
        BtActStatus.action_no = 11;
        BtActStatus.action_on = 1;
        BtActStatus.action_step = 0;
        BtActStatus.unk_05C = 0;
        BtActStatus.unk_01C = 1.0f;
        driveNoInterpolate = 1;
        SndSePlay(420, -1, 0);
        ozumond_snd_cnt = 30;
    }
}

void BattleActionOn_Ozumond_H(void) {
    if (BtActStatus.action_on == 0 && (s32) BtActStatus.unk_048 == 100) {
        BtActStatus.action_no = 11;
        BtActStatus.action_on = 1;
        BtActStatus.action_step = 0;
        BtActStatus.unk_05C = 0;
        BtActStatus.unk_048 = 0.0f;
        BtActStatus.unk_01C = 30.0f;
        driveNoInterpolate = 1;
        SndSePlay(420, -1, 0);
        ozumond_snd_cnt = 30;
    }
}

void BattleActionOn_Ozumond_F(void) {
    if (BtActStatus.action_on == 0 && BtActStatus.unk_0A4 == 0) {
        BtActStatus.action_no = 0;
        BtActStatus.action_on = 1;
        BtActStatus.action_step = 0;
        BtActStatus.unk_05C = 0;
        driveNoInterpolate = 1;
        dmg_check_wait = 0;
        SndSePlay(420, -1, 0);
        ozumond_snd_cnt = 30;
    }
}

void BattleActionPlay_Ozumond(int aimed) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR aim;
    sceVu0FVECTOR shot;
    float drain;

    WEAPON_HAVE *weapon = NowWeaponHave;
    int damage = (weapon->attack >> 1) + (weapon->magic >> 1);

    // A poisoned weapon hits twice as hard.
    if (StatusErrCheck(8) != 0) {
        damage *= 2;
    }

    drain = 1.5f - 0.01f * (float) NowWeaponHave->speed;

    if (BtActStatus.action_no != 11) {
        return;
    }

    if (GamePad.On(PadInput_OK) == 0) {
        BtActStatus.action_step = 1;
    }
    SndSeSeqPlayStop(0x190, 5, 0);

    // The action runs until the gauge the weapon drains runs out.
    BtActStatus.unk_048 -= drain;
    if (BtActStatus.unk_048 <= 0.0f) {
        BtActStatus.unk_028 = 0;
        BtActStatus.unk_00C = 0;
        BtActStatus.action_on = 0;
        BtActStatus.unk_0A4 = 1;
        if (lockOnTargetFlag != 0) {
            BtActStatus.unk_00C = 0x12;
        }
    }
    BtActStatus.unk_00C = 11;

    if (aimed == 0) {
        getFramePos((CFrameVu1 *) NowWeapon->frame, "dcol0", pos);
        getCharacterVector(aim, 0.0f);
    } else {
        setShotVector(aim, 3.5f, viewAngleH__2, viewAngleV__2);
        sceVu0CopyVector(pos, CharaMain.pos);
        pos[1] += 10.0f;
    }

    sceVu0CopyVector(shot, aim);
    aim[0] += pos[0];
    aim[1] += pos[1];
    aim[2] += pos[2];

    if (lockOnTargetFlag != 0) {
        shot[0] = BtActStatus.unk_080[0] - pos[0];
        shot[1] = BtActStatus.unk_080[1] - pos[1];
        shot[2] = BtActStatus.unk_080[2] - pos[2];
    }

    static int s_cnt = 0;

    s_cnt++;
    if (s_cnt >= 10) {
        s_cnt = 0;
        if (aimed == 0) {
            NowMainEffect->Set(pos, aim, -1, -1, 0,
                               NowWeapon->frame->SearchFrame("dcol0"), -1);
        }
    }

    static int msg_cnt = 0;

    msg_cnt++;
    if (msg_cnt >= 10) {
        msg_cnt = 0;
        sceVu0Normalize(shot, shot);
        sceVu0ScaleVectorXYZ(shot, shot, 10.0f);
        OzumondShot.Set(pos, shot, damage, 0);
        BtActStatus.unk_0E0 = 0;
        SwordDmgCheck1(0.5f, 0);
    }

    if (BtActStatus.action_step == 1) {
        BtActStatus.unk_028 = 0;
        BtActStatus.unk_00C = 0;
        BtActStatus.action_on = 0;
        if (lockOnTargetFlag != 0) {
            BtActStatus.unk_00C = 0x12;
        }
        NowMainEffect->OffEffect(-1);
    }
}

void BattleActionPlay_Ozumond_H(int aimed) {
    static int wait_cnt;
    sceVu0FVECTOR pos;
    sceVu0FVECTOR aim;
    sceVu0FVECTOR shot;

    WEAPON_HAVE *weapon = NowWeaponHave;
    int element = weapon->best_elem;
    int damage = weapon->attack;

    // A poisoned weapon hits twice as hard.
    if (StatusErrCheck(8) != 0) {
        damage *= 2;
    }

    if (BtActStatus.action_no != 11) {
        return;
    }

    if (GamePad.On(PadInput_OK) == 0) {
        BtActStatus.action_step = 1;
        wait_cnt = 10;
    }
    BtActStatus.unk_00C = 11;

    wait_cnt++;
    if (wait_cnt >= 10) {
        wait_cnt = 0;
        SndSeSeqPlayStop(0x199, 5, 0);

        if (aimed == 0) {
            getFramePos((CFrameVu1 *) NowWeapon->frame, "dcol0", pos);
            getCharacterVector(aim, 0.0f);
        } else {
            setShotVector(aim, 3.5f, viewAngleH__2, viewAngleV__2);
            sceVu0CopyVector(pos, CharaMain.pos);
            pos[1] += 10.0f;
        }

        sceVu0CopyVector(shot, aim);
        aim[0] += pos[0];
        aim[1] += pos[1];
        aim[2] += pos[2];

        int shot_no;

        if (lockOnTargetFlag != 0) {
            shot_no = NowMainEffect->Set(pos, BtActStatus.unk_080, 5, element, 0, NULL, -1);
        } else {
            shot_no = NowMainEffect->Set(pos, aim, 5, element, 0, NULL, -1);
        }

        if (shot_no != -1) {
            NowMainEffect->SetVsMonster(NowWeaponHave->vs_monster);
            NowMainEffect->SetWepStatus(NowWeaponHave->flags);
            NowMainEffect->SetAttribute(GetWeaponElementAttr(NowWeaponHave->best_elem));
            NowMainEffect->SetDmg(damage);
        }

        BtActStatus.action_step = 1;
        BtActStatus.unk_0E0 = 0;
        SwordDmgCheck1(2.0f, 0);
    }

    if (BtActStatus.action_step == 1) {
        BtActStatus.unk_028 = 0;
        BtActStatus.unk_00C = 0;
        BtActStatus.action_on = 0;
        if (lockOnTargetFlag != 0) {
            BtActStatus.unk_00C = 0x12;
        }
    }
}

void BattleActionPlay_Ozumond_F(int aimed) {
    static int wait_cnt = 0;
    sceVu0FVECTOR start;
    sceVu0FVECTOR start_dir;
    sceVu0FVECTOR pos;
    sceVu0FVECTOR aim;

    GetWeaponElementAttr(NowWeaponHave->best_elem);

    int damage = NowWeaponHave->attack;

    // A poisoned weapon hits twice as hard.
    if (StatusErrCheck(8) != 0) {
        damage *= 2;
    }

    if (BtActStatus.action_no == 0) {
        BtActStatus.unk_00C = 11;
        dmg_check_wait++;
        if (dmg_check_wait >= 8) {
            dmg_check_wait = 0;
            SwordDmgCheck1(1.5f, 0);
            BtActStatus.action_no = 1;
            BtActStatus.unk_0E0 = 0;

            if (aimed == 0) {
                getFramePos((CFrameVu1 *) NowWeapon->frame, "dcol0", start);
                getCharacterVector(start_dir, 0.0f);
            } else {
                setShotVector(start_dir, 1.0f, viewAngleH__2, viewAngleV__2);
                sceVu0CopyVector(start, CharaMain.pos);
                start[1] += 10.0f;
            }
            OzumondFire.Init(start, start_dir, 0, 0);
        }

        if (GamePad.On(PadInput_OK) == 0) {
            BtActStatus.unk_028 = 0;
            BtActStatus.unk_00C = 0;
            BtActStatus.action_on = 0;
            if (lockOnTargetFlag != 0) {
                BtActStatus.unk_00C = 0x12;
            }
            wait_cnt = 10;
        }
    }

    if (BtActStatus.action_no != 1) {
        return;
    }

    BtActStatus.unk_00C = 11;
    SndSeSeqPlayStop(0x194, 5, 0);

    // The action runs until the gauge the weapon drains runs out.
    BtActStatus.unk_048 -= 0.5f;
    if (BtActStatus.unk_048 <= 0.0f) {
        BtActStatus.unk_028 = 0;
        BtActStatus.unk_00C = 0;
        BtActStatus.action_on = 0;
        BtActStatus.unk_0A4 = 1;
        if (lockOnTargetFlag != 0) {
            BtActStatus.unk_00C = 0x12;
        }
    }

    if (aimed == 0) {
        getFramePos((CFrameVu1 *) NowWeapon->frame, "dcol0", pos);
        getCharacterVector(aim, 0.0f);
    } else {
        setShotVector(aim, 3.5f, viewAngleH__2, viewAngleV__2);
        sceVu0CopyVector(pos, CharaMain.pos);
        pos[1] += 10.0f;
    }

    OzumondFire.Set(pos, aim, damage, NowWeaponHave->best_elem);

    dmg_check_wait++;
    if (dmg_check_wait >= 30) {
        dmg_check_wait = 0;
        SwordDmgCheck1(2.2f, 0);
        BtActStatus.unk_0E0 = 0;
    }

    if (GamePad.On(PadInput_OK) == 0) {
        BtActStatus.unk_028 = 0;
        BtActStatus.unk_00C = 0;
        BtActStatus.action_on = 0;
        if (lockOnTargetFlag != 0) {
            BtActStatus.unk_00C = 0x12;
        }
        OzumondFire.Rset();
        wait_cnt = 10;
        dmg_check_wait = 0;
    }
}

float camera_far_dist_limmit;

/* The overlay's own copy of the camera walk is static, so only `autoCamTrial`
 * names it. It compiles to retail's code exactly, but while that caller is
 * still supplied by its marker the marker's `jal` needs the disambiguated
 * global the reference dump carries, so both flip together. */
static void CameraAutoMove(CCameraFollow *camera, CCPoly *poly, float *position, float from, float to) {
    float reference[4];
    float offset[4];
    float step;

    camera->GetRef(reference);
    offset[0] = position[0] - reference[0];
    offset[2] = position[2] - reference[2];
    offset[1] = 0.0f;
    camera->SetDistance(0.1f + DistVector(offset));

    step = 0.0f;
    float over = camera->GetDistance() - camera_near_dist__2;
    if (over < step) {
        step = -over / 20.0f;
    }
    if (over > 0.0f) {
        step = over / 30.0f;
    }
    if (step > 2.0f) {
        step = 2.0f;
    }
    if (step < 0.05f) {
        step = 0.05f;
    }
    if (over < 0.0f) {
        step *= 2.0f;
    }

    NowCamera__3->SetAngle(atan2f(offset[0], offset[2]));
    if (from < to) {
        NowCamera__3->AddAngle(0.2f * -step);
    } else {
        NowCamera__3->AddAngle(0.2f * step);
    }

    if (camera->GetDistance() < 0.8f * camera_near_dist__2) {
        camera->AddHeight(1.0f);
    }
}

void autoCamTrial(void) {
    static int cameraDilay = 0;
    sceVu0FVECTOR eye;
    sceVu0FVECTOR look;
    sceVu0FVECTOR along;
    CBoxVu0 box;
    sceVu0FVECTOR pos;
    sceVu0FVECTOR at;
    sceVu0FVECTOR ref;
    sceVu0FVECTOR reach;
    sceVu0FVECTOR forward;
    sceVu0FVECTOR towards;
    int hit_poly[32];
    float hit_point[32][4];
    sceVu0FVECTOR facing;
    sceVu0FVECTOR facing_last;
    sceVu0FVECTOR stood;
    sceVu0FVECTOR chara;
    sceVu0FVECTOR near_chara;
    sceVu0FVECTOR locked;
    float world[4][4];
    CCPoly *poly;
    int i;
    int count;

    if (DebugStatus[5] == 0) {
        return;
    }

    NowCamera__3->GetPos(eye);
    NowCamera__3->GetRef(look);

    along[0] = look[0] - eye[0];
    along[1] = look[1] - eye[1];
    along[2] = look[2] - eye[2];
    along[3] = 1.0f;
    sceVu0Normalize(along, along);
    along[0] *= 30.0f;
    along[1] *= 30.0f;
    along[2] *= 30.0f;

    // Every polygon the floor puts near the camera goes into one list, which
    // the line from the eye to what it looks at is then tested against.
    WorkBuffer__2->used = 0;

    poly = (CCPoly *) WorkBuffer__2->Alloc(0x280);

    count = 0;

    box.max[0] = look[0] > eye[0] ? look[0] : eye[0];
    box.max[1] = look[1] > eye[1] ? look[1] : eye[1];
    box.max[2] = look[2] > eye[2] ? look[2] : eye[2];
    box.min[0] = look[0] < eye[0] ? look[0] : eye[0];
    box.min[1] = look[1] < eye[1] ? look[1] : eye[1];
    box.min[2] = look[2] < eye[2] ? look[2] : eye[2];

    if (NowDngMap->unk_BDEC != 1) {
        CFrame *frame;
        int i;

        i = 0;
        while (NowDngMap->parts[i].frame[0] != NULL) {
            frame = i == -1 ? NULL : NowDngMap->parts[i].unk_004;

            if (frame != NULL) {
                CDungeonParts *part = &NowDngMap->parts[i];

                sceVu0CopyVector(eye, part->unk_110);

                CDungeonMap *map = NowDngMap;
                int turn = (int) ((CDungeonMap *) map)->parts[i].unk_170;

                turn += i == -1 ? 0 : map->parts[i].unk_008;

                if (turn > 3) {
                    turn -= 3;
                }
                if (turn == 3) {
                    turn = -1;
                }
                frame->SetRotation(0.0f, 3.1415927f * (-90.0f * turn) / 180.0f, 0.0f);
                frame->SetPosition(eye);
                count += frame->PickUpNearPoly(&poly[count], box);
            }
            i++;
        }
    } else {
        CFrame *frame;
        int j;
        int i;

        for (j = 0; j < 20; j++) {
            for (i = 0; i < 20; i++) {
                CDungeonMap *map = NowDngMap;
                s32 parts_no = map->cells[i + j * 20].parts_no;

                frame = parts_no == -1 ? NULL : map->parts[parts_no].unk_004;

                if (frame == NULL) {
                    continue;
                }
                if (!(map->cells[i + j * 20].unk_08 <= 240.0f)) {
                    continue;
                }

                int turn = map->cells[i + j * 20].direction;

                turn += parts_no == -1 ? 0 : map->parts[parts_no].unk_008;

                if (turn > 3) {
                    turn -= 3;
                }
                if (turn == 3) {
                    turn = -1;
                }
                frame->SetRotation(0.0f, 3.1415927f * (-90.0f * turn) / 180.0f, 0.0f);
                frame->SetPosition(160.0f * i, 0.0f, 160.0f * j);
                count += frame->PickUpNearPoly(&poly[count], box);
            }
        }
    }

    static int cnt = 0;

    cnt++;
    if (cnt > 60) {
        cnt = 0;
    }

    NowCamera__3->GetPos(pos);
    NowCamera__3->GetRef(ref);
    sceVu0SubVector(forward, ref, pos);
    sceVu0SubVector(reach, pos, forward);
    sceVu0SubVector(reach, pos, ref);
    sceVu0Normalize(reach, reach);
    sceVu0ScaleVectorXYZ(reach, reach, 80.0f);
    reach[0] += ref[0];
    reach[1] += ref[1];
    reach[2] += ref[2];

    int hits = CheckHits(poly, count, ref, reach, 32, hit_poly, hit_point, 1, 0);

    camera_far_dist_limmit = 80.0f;
    if (hits > 0) {
        camera_far_dist_limmit = DistVector(ref, hit_point[0]);
    }

    if (hits > 0) {
        int last;

        sceVu0InnerProduct(forward, poly[hit_poly[0]].normal);
        last = -1;

        for (i = 0; i < hits; i++) {
            sceVu0SubVector(towards, hit_point[i], pos);
            if (sceVu0InnerProduct(forward, towards) < 0.0f) {
                break;
            }
            last = i;
        }

        if (last >= 0) {
            sceVu0CopyVector(facing, poly[hit_poly[last]].normal);
            if (sceVu0InnerProduct(forward, facing) > 0.0f) {
                if (last + 1 < hits) {
                    float away = DistVector(pos, hit_point[last + 1]);

                    if (away - DistVector(pos, hit_point[last]) < 0.0f) {
                        CameraAutoMove(NowCamera__3, &poly[hit_poly[last + 1]],
                                       hit_point[last + 1], 1000000.0f, 1000000.0f);
                    } else {
                        CameraAutoMove(NowCamera__3, &poly[hit_poly[last]],
                                       hit_point[last], 1000000.0f, 1000000.0f);
                    }
                } else if (camera_far_dist_limmit >= camera_near_dist__2 &&
                           camera_far_dist_limmit < camera_far_dist__2) {
                    NowCamera__3->SetPos(hit_point[0]);
                } else {
                    CameraAutoMove(NowCamera__3, &poly[hit_poly[last]], hit_point[last],
                                   1000000.0f, 1000000.0f);
                }
            }
        } else {
            sceVu0CopyVector(facing_last, poly[hit_poly[0]].normal);
            if (sceVu0InnerProduct(forward, facing_last) < 0.0f) {
                CameraAutoMove(NowCamera__3, &poly[hit_poly[0]], hit_point[0],
                               1000000.0f, 1000000.0f);
            }
        }
    }

    // The camera keeps its head above whatever floor is under it.
    sceVu0CopyVector(reach, pos);
    reach[1] += 20.0f;
    if (CheckHitVertical(poly, count, reach, -100.0f, at, 0) >= 0) {
        if (pos[1] - at[1] < 25.0f) {
            pos[1] = 25.0f + at[1];
            NowCamera__3->SetHeight(pos[1] - ref[1] - 0.01f);
        }
    }

    sceVu0CopyVector(chara, CharaMain.pos);
    NowCamera__3->GetPos(stood);

    if (DistVector(chara, stood) < camera_up_near_dist) {
        NowCamera__3->AddHeight(0.5f);
        if (NowCamera__3->GetHeight() <= 1.6f) {
            NowCamera__3->SetHeight(1.6f);
        }
    } else {
        if (NowCamera__3->GetHeight() <= 1.6f) {
            NowCamera__3->SetHeight(1.6f);
        }
        if (!(NowCamera__3->GetHeight() <= 5.0f)) {
            float rate = 0.05f;
            float over = NowCamera__3->GetHeight() - 5.0f;
            float step = over * rate;

            if (step < 0.15f) {
                step = 0.15f;
            }
            if (!(step <= 0.5f)) {
                step = 0.5f;
            }
            NowCamera__3->AddHeight(-step);
        }
    }

    if (!(NowCamera__3->GetDistance() <= camera_far_dist__2)) {
        NowCamera__3->AddDistance(-(NowCamera__3->GetDistance() - camera_far_dist__2) /
                                  10.0f);
    }
    if (NowCamera__3->GetDistance() < camera_near_dist__2) {
        NowCamera__3->AddDistance(-(NowCamera__3->GetDistance() - camera_near_dist__2) /
                                  10.0f);
    }
    if (NowCamera__3->GetDistance() < camera_far_dist_limmit) {
        NowCamera__3->AddDistance(
            -(NowCamera__3->GetDistance() - camera_far_dist_limmit) / 10.0f);
    }

    if (BtActStatus.unk_068 == 0 && NowCamera__3->GetDistance() < camera_far_dist__2) {
        float turn = inputH1;

        inputH1 = inputH1 * (DistVector(ref_off) / 1.3f / 2.0f);
        if (!(inputH1 <= 0.1f)) {
            if (turn < 0.4f) {
                turn = 0.4f;
            }
            if (!(turn <= 1.0f)) {
                turn = 1.0f;
            }
            NowCamera__3->AddAngle(2.5f * (-0.017453292f * turn));
        }
        if (inputH1 < -0.1f) {
            if (!(turn <= -0.4f)) {
                turn = -0.4f;
            }
            if (turn < -1.0f) {
                turn = -1.0f;
            }
            NowCamera__3->AddAngle(2.5f * (-0.017453292f * turn));
        }
    }

    // A locked-on monster pulls the camera round behind the player.
    if (lockOnTargetFlag != 0) {
        sceVu0CopyVector(near_chara, CharaMain.pos);
        NowMonstorUnit->chara[lockOnTargetNo][0].GetPosition(locked);

        float away = DistVector(near_chara, locked);

        if (!(away <= 30.0f)) {
            CharaMain.frame->GetLWMatrix(world);

            float want = (float) (atan2f(world[2][0], world[2][2]) - 3.141592653589793);

            if (!(want <= 3.141592f)) {
                want -= 6.283184f;
            }
            if (want < -3.141592f) {
                want += 6.283184f;
            }

            float angle = NowCamera__3->GetAngle();
            float range = 70.0f * ((60.0f - away) / 30.0f);

            range += 20.0f;

            if (!(range < 90.0f)) {
                range = 90.0f;
            }
            if (range < 0.0f) {
                range = 0.0f;
            }
            if (!(away <= 80.0f)) {
                range = 10.0f;
            }

            if (AngleCmp(want, angle, 0.017453289f * range) != 0) {
                angle = AngleInterpolate(angle, want, 0.3926990f, 0);
                NowCamera__3->SetAngle(angle);
                if (AngleCmp(want, angle, 1.570796f) != 0) {
                    NowCamera__3->SetSpeed(8.0f);
                }
            }
        }
    }
}

FUZZY_MATCH("asm/nonmatchings/dun/gameloop", DelActiveItem__Fi);

void DelActiveItem(int slot) {
    // The two arrays are adjacent, and retail walks the second one off the
    // first rather than off the save data again.
    s16 *slots = UserStatus->active_item;

    // The last use takes the item away; anything else just spends one.
    if (slots[slot + 3] == 1) {
        slots[slot] = -1;
        slots[slot + 3] = 0;
        if (activeItem.model[slot] != -1) {
            activeItem.models->DeleteModel(activeItem.model[slot]);
            activeItem.model[slot] = -1;
        }
    } else {
        slots[slot + 3]--;
    }
}

int Run_TrapCircle(MAP_TRAP_CIRCLE *trap) {
    if (trap == NULL) {
        return;
    }

    int element;
    int se;
    int kind;
    WEAPON_HAVE *weapon;
    int had;
    CUserStatus *status;
    u16 *gauge;
    s8 chara;
    s8 *slots;
    s8 slot;

    status = UserStatus;
    had = status->unk_4346;
    gauge = &status->unk_4346;
    chara = status->cur_chara;
    slots = status->equipped_weapon_slot;
    slot = slots[chara];
    weapon = &status->chara_weapons[chara][slot];
    element = -1;
    se = 0;
    kind = trap->kind;

    // A character still holding the weapon they started with takes the
    // first trap instead of whatever the circle says.
    s16 item_no = status->chara_weapons[status->cur_chara][slot].item_no;

    if (item_no == defWeapon__6[chara] || item_no == defWeapon__6[chara] + 1) {
        kind = 0;
    }

    switch (kind) {
        case 0:
            BtSetStatusErr(8);
            se = 0xE1;
            break;
        case 1: {
            float rate = 1.2f;
            int added = (int) (had * rate) + 10;

            if (had + added >= 0xFFFF) {
                status->unk_4346 = 0xFFFF;
            } else {
                status->unk_4346 += added;
            }
            se = 0xE1;
            break;
        }
        case 2:
            element = 0;
            se = 0xE1;
            break;
        case 3:
            element = 2;
            se = 0xE1;
            break;
        case 4:
            element = 4;
            se = 0xE1;
            break;
        case 5:
            NowMonstorUnit->AllBin2();
            se = 0xE2;
            break;
        case 6: {
            int left = (int) (had - 0.2f * had);

            if (left <= 0) {
                left = 0;
            }
            *gauge = left;
            se = 0xE2;
            break;
        }
        case 7:
            element = 1;
            se = 0xE2;
            break;
        case 8:
            element = 3;
            se = 0xE2;
            break;
        case 9:
            element = 5;
            se = 0xE2;
            break;
    }

    if (element != -1) {
        WeaponDataChangeByRGate(weapon, element);
        SetWeaponAttachStatus(NowWeaponHave);
    }
    SndSePlay(se, -1, 0);
    return kind;
}

void LockOffTargte(void) {
    lockOnTargetDraw = 0;
    lockOnTargetNo = -1;
    lockOnTargetFlag = 0;
    targetCursorShiftNo = -1;
    targetCursorShiftRot = 0.0f;
    EnemyLifeGage.on = 0;
}

void DrawTargetLife(void) {
    CRect_i_ border;
    CRect_i_ ground;
    CRect_i_ life;
    s32 x;
    s32 width;

    if (EnemyLifeGage.on == 0) {
        return;
    }
    if (EnemyLifeGage.draw == 0) {
        return;
    }
    if (((s32 *) SaveData->GetConfigData())[11] != 0) {
        return;
    }

    x = EnemyLifeGage.x - 32;
    EnemyLifeGage.y = (EnemyLifeGage.y >> 1) << 1;
    width = (s32) (64.0f / EnemyLifeGage.life_max * EnemyLifeGage.life);

    if (x >= 577 || x < 0) {
        return;
    }
    if (EnemyLifeGage.y >= 481 || EnemyLifeGage.y < 0) {
        return;
    }

    s32 top = EnemyLifeGage.y - 1;

    border.x = x - 1;
    border.y = top;
    border.width = 66;
    border.height = 6;
    set2DSpriteC4(Vif1Packet, border, &ELifeB1, &ELifeB2, &ELifeB1, &ELifeB2);

    s32 ground_top = EnemyLifeGage.y;

    ground.x = x;
    ground.y = ground_top;
    ground.width = 64;
    ground.height = 4;
    set2DSpriteC4(Vif1Packet, ground, &ELifeN1, &ELifeN1, &ELifeN1, &ELifeN1);

    s32 life_top = EnemyLifeGage.y;

    life.x = x;
    life.y = life_top;
    life.width = width;
    life.height = 4;
    set2DSpriteC4(Vif1Packet, life, &ELife1, &ELife2, &ELife1, &ELife2);
}

/* How long the lock-on cursor stays on screen, in frames. */
float targetCursorCnt;

void DrawtargetCursor(float *world, float width, float height, float alpha) {
    int top_left[4];
    int bottom_right[4];
    CTexture *texture;

    texture = TexManager.GetTexture("d01e04", -1);
    setbilinear(0);
    world[3] = 1.0f;

    if (MGRotTransPers3DSprite(top_left, bottom_right, world, width, height, 0) != 0) {
        // The two corners arrive in the fixed-point screen space the sprite
        // calls take, so they come back to pixels here.
        top_left[0] -= 0x6C08;
        top_left[1] -= 0x7908;
        bottom_right[0] -= 0x6C08;
        bottom_right[1] -= 0x7908;
        top_left[0] >>= 4;
        top_left[1] >>= 3;
        bottom_right[0] >>= 4;
        bottom_right[1] >>= 3;

        static int rate = (int) (16.0f * alpha);

        set2DSprite(Vif1Packet, texture, CRect_i_(top_left[0], top_left[1], 0x10, 0x10),
                    CRect_i_(0, 0x20, 0x10, 0x10), rate);
        set2DSprite(Vif1Packet, texture, CRect_i_(bottom_right[0], top_left[1], 0x10, 0x10),
                    CRect_i_(0, 0, 0x10, 0x10), rate);
        set2DSprite(Vif1Packet, texture, CRect_i_(top_left[0], bottom_right[1], 0x10, 0x10),
                    CRect_i_(0, 0x30, 0x10, 0x10), rate);
        set2DSprite(Vif1Packet, texture, CRect_i_(bottom_right[0], bottom_right[1], 0x10, 0x10),
                    CRect_i_(0, 0x10, 0x10, 0x10), rate);
    }

    setbilinear(1);
    DrawTargetLife();
}

int SetNearLockOnTarget(int from, int nearest_only) {
    CUserStatus *status = UserStatus;
    sceVu0FVECTOR at;
    sceVu0FVECTOR towards;
    sceVu0FVECTOR pos[16];
    float dist[16];
    int found[16];
    float away;
    float rate;
    int k;
    int i;
    int count;
    int n;
    int j;
    int m;

    rate = CharaRangeRate(status);

    CharaFrame->GetRotation(at);

    // Declared here rather than with the rest: mwcc emits a local array's
    // template copy where the declaration stands, and retail's lands after
    // the two calls above, not before them. The slots still come out where
    // they do above, because everything ahead of these is still ahead of them.
    sceVu0FVECTOR forward = {0.0f, 0.0f, 1.0f, 1.0f};
    sceVu0FMATRIX unit;
    sceVu0FMATRIX turn;
    int order[16];
    int screen[4];

    sceVu0UnitMatrix(unit);
    sceVu0RotMatrixY(turn, unit, at[1]);
    sceVu0ApplyMatrix(forward, turn, forward);
    sceVu0Normalize(forward, forward);

    count = 0;
    sceVu0CopyVector(at, CharaFrame->position);

    for (i = 0; i < 16; i++) {
        found[i] = -1;
    }

    for (i = 0; i < 16; i++) {
        int on;

        MonstorPicupInner[i] = 0.0f;

        CMonstorUnit *monsters = NowMonstorUnit;

        if (monsters->monster[i].state != 2) {
            continue;
        }
        if (monsters->monster[i].hp <= 0) {
            continue;
        }
        if (i >= 0 && i < 17) {
            on = monsters->monster[i].unk_0D4;
        }
        if (on == 0) {
            continue;
        }
        if (monsters->monster[i].unk_11C == 0) {
            continue;
        }

        monsters->chara[i][0].GetPosition(pos[i]);

        away = DistVector(at, pos[i]);

        if (!(away < NowMonstorUnit->monster[i].lock_range * rate)) {
            continue;
        }

        towards[0] = pos[i][0] - at[0];
        towards[2] = pos[i][2] - at[2];
        towards[1] = 0.0f;
        towards[3] = 1.0f;
        sceVu0Normalize(towards, towards);

        MonstorPicupInner[i] = sceVu0InnerProduct(forward, towards);
        if (MonstorPicupInner[i] < 0.25f) {
            continue;
        }

        found[count] = i;
        dist[count] = away;
        count++;
    }

    if (count == 0) {
        LockOffTargte();
        return 0;
    }

    // Split from the loop below: mwcc emits the initialisation where the
    // statement stands, which is ahead of the loop that clears order[].
    k = 0;

    for (n = 0; n < 16; n++) {
        order[n] = -1;
    }

    // The nearest one that is still free goes into each place in turn.
    for (; k < count; k++) {
        j = 0;
        while (found[j] == -1) {
            j++;
        }

        float best = dist[j];

        for (m = 0; m < count; m++) {
            if (m == k) {
                continue;
            }
            if (found[m] == -1) {
                continue;
            }
            if (dist[m] < best) {
                best = dist[m];
                j = m;
            }
        }
        order[k] = found[j];
        found[j] = -1;
    }

    int target;

    if (nearest_only == 0) {
        if (count == 1) {
            target = order[0];
        } else {
            if (from >= count) {
                from = 0;
            }
            if (lockOnTargetNo == order[from]) {
                from++;
            }
            if (from >= count) {
                from = 0;
            }
            target = order[from];
        }
    } else {
        target = order[0];
    }

    if (target == -1) {
        LockOffTargte();
        return 0;
    }
    if (lockOnTargetNo == target && nearest_only == 0) {
        return count;
    }

    if (target != -1) {
        NowMonstorUnit->chara[target][0].GetPosition(at);
        at[1] += NowMonstorUnit->chara[target][0].unk_0B4;
        cursorFrame->SetPosition(at);
        lockOnTargetDraw = 1;
        targetCursorCnt = 8.0f;
        at[3] = 1.0f;

        if (MGRotTransPers(screen, at, 0) != 0) {
            SetMonsterNameDrawFlag(1);
            MonsterNamePosSet((screen[0] - 0x6C00) >> 4, (screen[1] - 0x7900) >> 4);
            EnemyLifeGage.x = (screen[0] - 0x6C00) >> 4;
            EnemyLifeGage.y = ((screen[1] - 0x7900) >> 4) + 42;
        } else {
            SetMonsterNameDrawFlag(0);
            EnemyLifeGage.on = 0;
        }

        if (lockOnTargetNo != target) {
            DngMes2.mes_made = -1;
            MonsterNameMake(NowMonstorUnit->monster[target].name_no);
        }
    }

    lockOnTargetNo = target;
    return count;
}

void setTargetCursor(int on) {
    CUserStatus *status = UserStatus;
    sceVu0FVECTOR target;
    sceVu0FVECTOR stood;
    sceVu0FVECTOR flat_stood;
    sceVu0FVECTOR flat_target;
    int screen[4];
    float width;
    float height;
    int keep;

    float rate = CharaRangeRate(status);

    if (on != 0) {
        keep = 1;

        if (NowMonstorUnit->monster[lockOnTargetNo].state != 2 ||
            NowMonstorUnit->monster[lockOnTargetNo].hp <= 0) {
            keep = 0;
        }
        if (NowMonstorUnit->monster[lockOnTargetNo].unk_11C == 0) {
            keep = 0;
        }

        sceVu0CopyVector(stood, CharaFrame->position);
        NowMonstorUnit->chara[lockOnTargetNo][0].GetPosition(target);

        float away = DistVector(stood, target);

        if (!(away < NowMonstorUnit->monster[lockOnTargetNo].lock_range * rate)) {
            keep = 0;
        }

        // A monster the player stands well above stays locked on only while it is
        // near enough on the floor.
        if (NowMonstorUnit->monster[lockOnTargetNo].kind != 2) {
            sceVu0CopyVector(flat_stood, stood);
            sceVu0CopyVector(flat_target, target);
            flat_target[1] = 0.0f;
            flat_stood[1] = 0.0f;

            if (DistVector(flat_stood, flat_target) <=
                    8.0f + NowMonstorUnit->monster[lockOnTargetNo].unk_044 &&
                !(stood[1] <= 10.0f + target[1])) {
                keep = 0;
            }

            float drop = stood[1] - target[1];

            drop = drop < 0.0f ? -drop : drop;
            if (!(drop < 80.0f)) {
                keep = 0;
            }
        }

        target[1] += 8.0f;
        target[3] = 1.0f;

        if (NowMonstorUnit->monster[lockOnTargetNo].unk_0FC != 0) {
            sceVu0CopyVector(target, NowMonstorUnit->monster[lockOnTargetNo].unk_100);
        }
        sceVu0CopyVector(BtActStatus.unk_080, target);

        width = (12.0f + targetCursorCnt) * NowMonstorUnit->monster[lockOnTargetNo].unk_110;
        height = (6.0f + targetCursorCnt / 2.0f) *
                 NowMonstorUnit->monster[lockOnTargetNo].unk_114;

        if (NowMonstorUnit->monster[lockOnTargetNo].name_no > 0 &&
            NowMonstorUnit->monster[lockOnTargetNo].kind != 2) {
            EnemyLifeGage.life_max = NowMonstorUnit->monster[lockOnTargetNo].max_hp;
            EnemyLifeGage.life = NowMonstorUnit->monster[lockOnTargetNo].hp;
            EnemyLifeGage.on = 1;
            EnemyLifeGage.x = 0x280;
            EnemyLifeGage.y = 0;
        }

        target[1] += 10.0f;
        target[3] = 1.0f;

        if (MGRotTransPers(screen, target, 0) != 0) {
            MonsterNameMake(NowMonstorUnit->monster[lockOnTargetNo].name_no);
            MonsterNamePosSet((screen[0] - 0x6C00) >> 4, (screen[1] - 0x7900) >> 4);
            EnemyLifeGage.x = (screen[0] - 0x6C00) >> 4;
            EnemyLifeGage.y = ((screen[1] - 0x7900) >> 4) + 42;
            SetMonsterNameDrawFlag(1);
        } else {
            SetMonsterNameDrawFlag(0);
            EnemyLifeGage.on = 0;
        }

        DrawtargetCursor(BtActStatus.unk_080, width, height, targetCursorCnt);

        // Steve says something about the monster now and then, but only while the
        // player holds a weapon that talks to him.
        s16 weapon = NowWeaponHave->item_no;

        if ((weapon == 0x12F || weapon == 0x138) && lockOnTargetFlag != 0 &&
            NowMonstorUnit->monster[lockOnTargetNo].name_no > 0 &&
            (int) (100.0f * (float) rand() / 2147483648.0f) < 3) {
            DngMessMan.SetSteevMes(NowMonstorUnit->monster[lockOnTargetNo].name_no * 10 + 4000);
        }

        if (keep != 0) {
            if (targetCursorCnt > 0.0f) {
                targetCursorCnt -= 0.5f;
            } else {
                targetCursorCnt = 0.0f;
            }
        } else {
            if (targetCursorCnt < 8.0f) {
                targetCursorCnt += 0.25f;
            } else {
                SndSePlay(2, -1, 0);
                targetCursorShiftNo = 0;
                targetCursorShiftRot = 0;
                lockOnTargetFlag = 0;
                lockOnTargetNo = -1;
                EnemyLifeGage.on = 0;
                return;
            }
        }
        return;
    }

    targetCursorShiftRot = SetNearLockOnTarget(0, 1);
}

void unitBlowActionRot(float *velocity) {
    sceVu0FVECTOR rotation;

    CharaFrame->GetRotation(rotation);
    rotation[1] = atan2f(velocity[0], velocity[2]);
    rotation[1] -= 3.1415927f;
    if (rotation[1] <= -3.1415927f) {
        rotation[1] += 6.2831855f;
    }
    CharaFrame->SetRotation(rotation[0], rotation[1], rotation[2]);
}

float setUnitDamageColor(int hit) {
    static float dmgColor = 128.0f;
    static float dmgVec = 0.0f;
    static int dmgFlag;

    if (hit != 0) {
        dmgFlag = 1;
        dmgVec = 0.0f;
    }

    if (dmgFlag != 0) {
        dmgVec += 0.3926991f;
        dmgColor = 128.0f + 80.0f * sinf(dmgVec);

        // The flash runs for three full turns of the sine and then stops.
        if (dmgVec >= 9.424778f) {
            dmgFlag = 0;
            dmgColor = 128.0f;
        }
    }
    return dmgColor;
}

/* How fast the ambient-colour animation runs. */
float unitAmbientAnime_Speed;

/* How far through the ambient-colour animation the player's model is. */
float unitAmbientAnime_Count;

/* How long the ambient-colour animation runs for, in frames. */
s32 unitAmbientAnime_Timer;

/* Whether the ambient-colour animation is running on the player's model. */
s32 unitAmbientAnime_flag;

void RsetUnitAmbientAnime(void) {
    unitAmbientAnime_flag = 0;
}

void setUnitAmbientAnime(float speed, float time, float red, float green, float blue) {
    unitAmbientAnime_rgb[0] = red;
    unitAmbientAnime_rgb[1] = green;
    unitAmbientAnime_rgb[2] = blue;
    unitAmbientAnime_Count = 0;
    unitAmbientAnime_Speed = speed;
    unitAmbientAnime_Timer = (s32) time;
    unitAmbientAnime_flag = 1;
}

int unitAmbientAnime(float *colour) {
    if (unitAmbientAnime_flag == 0) {
        return 0;
    }

    colour[0] = 64.0f + unitAmbientAnime_rgb[0] * sinf(unitAmbientAnime_Count);
    colour[1] = 64.0f + unitAmbientAnime_rgb[1] * sinf(unitAmbientAnime_Count);
    colour[2] = 64.0f + unitAmbientAnime_rgb[2] * sinf(unitAmbientAnime_Count);
    colour[3] = 128.0f;

    unitAmbientAnime_Count += 3.1415927f / unitAmbientAnime_Speed;
    if (unitAmbientAnime_Count > 3.1415927f) {
        unitAmbientAnime_Timer--;
        if (unitAmbientAnime_Timer <= 0) {
            unitAmbientAnime_flag = 0;
        } else {
            unitAmbientAnime_Count -= 3.1415927f;
            unitAmbientAnime_Timer--;
        }
    }
    return 1;
}

int LoadStartLogo(int map) {
    char *dungeon_name[7] = {
        "dname00.img",
        "dname01.img",
        "dname02.img",
        "dname03.img",
        "dname04.img",
        "dname05.img",
        "dname06.img",
    };
    char *floor_texture[7] = {
        "floor00",
        "floor01",
        "floor02",
        "floor03",
        "floor04",
        "floor05",
        "floor06",
    };
    char *files[5];
    int size;
    int blocks;

    // Only the one texture is loaded; the NULL after it ends the list.
    files[0] = NameExchg(dungeon_name[map], 0);
    files[1] = NULL;
    BtStartLogoBuffer.used = 0;
    size = LoadTempTexture(files, 8, (char *) BtStartLogoBuffer.buffer);
    blocks = (((size >> 6) + 1) << 6) >> 4;
    BtStartLogoBuffer.Alloc(blocks);

    char *name = floor_texture[map];

    TEX_Floor1 = TexManager.GetTexture(name, -1);
    strcpy(floor_name, name);
    return blocks;
}

INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @6774);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @6775);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @6776);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @6777);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @6778);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @6779);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", @6780);

void FloorTitleOn(void) {
    rogoAlphaA[2] = 0;
    rogoSwitch2 = 1;
    rogoY3 = -96;
    startCnt2 = 0;
}

void SetMIniMapStatus(int on) {
    switch (on) {
        case 0:
            infoMapOld = infoMap;
            infoMap = 0;
            break;
        case 1:
            infoMap = infoMapOld;
            break;
    }
}

void ResetStatusInfo(void) {
    BtActStatus.action_on = 0;
    BtActStatus.unk_004 = -1;
    BtActStatus.unk_008 = -1;
    BtActStatus.unk_00C = 0;
    BtActStatus.unk_040 = 0;
    BtActStatus.unk_04C = 0;
    BtActStatus.unk_020 = 0;
    BtActStatus.unk_024 = 0;
    BtActStatus.unk_05C = 0;
    BtActStatus.unk_060 = 0;
    BtActStatus.unk_064 = 1;
    BtActStatus.unk_066 = 1;
    BtActStatus.unk_068 = 0;
    BtActStatus.unk_06C = 0;
    BtActStatus.unk_070 = 0;
    BtActStatus.unk_098 = 0;
    BtActStatus.action_no = 0;
    BtActStatus.unk_0E0 = 3600;
    BtActStatus.unk_0E8 = 0;
    BtActStatus.unk_0F0 = 0;
    BtActStatus.move_power = 0.0f;
    BtActStatus.move_power_decay = 0.0f;
    BtActStatus.unk_124 = 0;
    BtActStatus.unk_0F8 = 10;
    CMonUnitHold = 0;
    CEffectHold = 0;
    BtActStatus.unk_144 = 0;
    BtActStatus.unk_146 = 0;
    BtActStatus.unk_148 = 0;
}

void ResetMovePower(void) {
    BtActStatus.move_power = 0.0f;
    BtActStatus.move_power_decay = 0.0f;
}

void LoaderInit(void) {
    BufferAllClear();
    MGSetBGColor(32.0f, 96.0f, 12.0f, 128.0f);
    TexManager.Initialize(0x3FE0);
    TexManager.EnterTextureFile(texdata2);
    TexManager.LoadTextureBlock(-1, read_buffer);

    CDbgMsg.name = "dbgwork";
    CDbgMsg.x = 32;
    CDbgMsg.y = 16;
    CDbgMsg.width = 256;
    CDbgMsg.height = 224;
    CDbgMsg.unk_14 = 96;
    EdEventInfo.fukidashi = 1;
}

int LoaderLoop(void) {
    char name[96];
    int i;
    int chosen = 0;
    static int nowCursor = 0;

    CDbgMsg.length = sprintf(&CDbgMsg.text[CDbgMsg.length],
                             "- MapInfomationFile Loader -\n");

    for (i = 0; i < 7; i++) {
        strcpy(name, MapInfoNameArea[i]);
        if (nowCursor == i) {
            CDbgMsg.length += sprintf(&CDbgMsg.text[CDbgMsg.length], ">>[%2d] %s\n",
                                      i + 1, name);
        } else {
            CDbgMsg.length += sprintf(&CDbgMsg.text[CDbgMsg.length], "  [%2d] %s\n",
                                      i + 1, name);
        }
    }

    if (GamePad.Down(0x1000) != 0 && nowCursor != 0) {
        nowCursor--;
    }
    if (GamePad.Down(0x4000) != 0 && nowCursor != 6) {
        nowCursor++;
    }

    if (GamePad.Down(0x800) != 0 || GamePad.Down(0x60) != 0) {
        selectMapNo = nowCursor;
        main_select_menu_no = nowCursor;
        MapJump(selectMapNo + 200, -1);
        MGSetBGColor(0.0f, 0.0f, 0.0f, 128.0f);
        chosen = 1;
    }

    sceVif1PkCall(Vif1Packet, (u_long128 *) Vu_prog0f, 0);
    sceVif1PkTerminate(Vif1Packet);
    TexManager.ReloadTexture(Vif1Packet, 12);
    CDbgMsg.Draw();
    return chosen;
}

void InitEyeCamera(void) {
    sceVu0FVECTOR pos;

    viewAngleH__2 = CharaMain.GetRotation()->y;
    viewAngleV__2 = 0.0f;
    sceVu0CopyVector(pos, CharaMain.pos);
}

void EyeCamera(void) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR ref;
    sceVu0FMATRIX rotation;
    sceVu0FMATRIX unit;
    float stick_x;
    float stick_y;

    stick_x = GamePad.GetLXf();
    stick_y = -GamePad.GetLYf();

    // The heading wraps at half a turn either way; the pitch stops short of
    // straight up and straight down.
    if (stick_x > 0.0f) {
        float rate = 0.02f;

        viewAngleH__2 -= stick_x * rate;
        if (viewAngleH__2 < -3.1415927f) {
            viewAngleH__2 += 6.2831855f;
        }
    }
    if (stick_x < -0.0f) {
        float rate = 0.02f;

        viewAngleH__2 -= stick_x * rate;
        if (viewAngleH__2 > 3.1415927f) {
            viewAngleH__2 -= 6.2831855f;
        }
    }
    if (stick_y > 0.0f) {
        if (viewAngleV__2 < 0.65f) {
            float rate = 0.02f;

            viewAngleV__2 += stick_y * rate;
        }
    }
    if (stick_y < -0.0f) {
        if (viewAngleV__2 > -1.0f) {
            float rate = 0.02f;

            viewAngleV__2 += stick_y * rate;
        }
    }

    ref[0] = 0.0f;
    ref[1] = 0.0f;
    ref[2] = 10.0f;
    ref[3] = 0.0f;

    sceVu0UnitMatrix(unit);
    sceVu0RotMatrixX(rotation, unit, viewAngleV__2);
    sceVu0RotMatrixY(rotation, rotation, viewAngleH__2);
    sceVu0ApplyMatrix(ref, rotation, ref);
    sceVu0CopyVector(pos, CharaMain.pos);

    CUserStatus *status = UserStatus;
    float height = CharaHeight(status);

    pos[1] += height - 1.5f;
    ref[0] += pos[0];
    ref[1] += pos[1];
    ref[2] += pos[2];

    NowCamera__3->SetPos(pos);
    NowCamera__3->SetRef(ref);
}
