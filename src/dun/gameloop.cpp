#include "dun/gameloop.hpp"

/* `#if DUN_COMPILE_SHORT` guards C++ that reproduces retail's control flow but
 * not its length -- MWCC shares a subexpression retail computes twice -- so
 * compiling it would move every function after it. It is off, and the marker
 * below the guard supplies the function instead.
 *
 * `#if DUN_COMPILE_SHARED_RODATA` guards C++ that matches on its own but
 * reaches a string another function in this unit still supplies through a
 * marker. The compiler cannot see the marker's copy, so it writes a second
 * one and the constants after it move. It is off, and the marker below each
 * guard supplies the function instead; turn it on once the sharing functions
 * are decompiled. */

/* `#if DUN_COMPILE_SBSS` guards C++ that declares one of retail's
 * function-local statics. Those land in `.sbss`, which the dun overlay keeps
 * in main's image as one block, so a static written before the rest of the
 * block exists moves every `.bss` address after it. It is off for the same
 * reason `DUN_COMPILE_DATA` is, and flips with the small-bss dump. */

/* `#if DUN_COMPILE_DATA` guards C++ whose local array initialiser makes MWCC
 * emit a `.data` template. The overlay is one translation unit, so MWLD places
 * the whole of its `.data` at once: until every function that contributes to
 * that section is written, `asm/data/dun/data.data.s` has to supply it and a
 * template from the source would be appended past retail's. It is off, and the
 * marker below each guard supplies the function instead; turn it on together
 * with the section dumps once the unit is finished. */

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
#include "runscript_opcodes.hpp"
#include "savedata.hpp"
#include "shop_battlemenu.hpp"
#include "shot_effect.hpp"
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
 * Names one monster of a floor's enemy layout.
 */
struct BT_ENEMY_LAYOUT {
    s32 unk_00;
    s32 monster_no; /**< Identifies the monster, or -1 where the list ends. */
    s32 unk_08;
};

/**
 * Names every monster one floor lays out.
 */
struct BT_ENEMY_FLOOR {
    BT_ENEMY_LAYOUT monster[9]; /**< The monsters the floor can hold. */
    s32 unk_6C;
};

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
 * Names what the Georama editor is doing; the dungeon reads a few of its
 * fields on the way in and out.
 */
struct ED_EVENT_INFO {
    u8 unk_000[0x30];
    s32 unk_030;
    s32 fukidashi;
    u8 unk_038[0x4];
    float unk_03C;
    u8 unk_040[0x20];
    s32 unk_060;
    s32 unk_064;
    s32 unk_068;
    s32 unk_06C;
    u8 unk_070[0x44];
    s32 unk_0B4[6];
    u8 unk_0CC[0x28];
    s32 unk_0F4[6];
    u8 unk_10C[0x68];
    s32 unk_174[6];
    u8 unk_18C[0x174];
    s32 unk_300;
    u8 unk_304[0x14C];
};

STATIC_ASSERT(sizeof(ED_EVENT_INFO) == 0x450);

/**
 * Names what the dungeon event running now is waiting on.
 */
struct BT_EVENT_INFO {
    u8 unk_00[0x2C];
    s32 unk_2C;
    u8 unk_30[0x4];
    s32 unk_34;
    u8 unk_38[0x4C];
    s32 *floor_result;  /**< Where the floor the player chose is written back. */
    s32 *escape_result; /**< Where the escape answer is written back. */
    u8 unk_8C[0x2C];
    s32 unk_B8;
    s32 unk_BC;
};

STATIC_ASSERT(sizeof(BT_EVENT_INFO) == 0xC0);

/* What the dungeon event running now is waiting on. */
extern "C" BT_EVENT_INFO BtEventInfo;

/* The debug message overlay. */
extern "C" CDebugFont CDbgMsg;

/* What the Georama editor is doing. */
extern "C" ED_EVENT_INFO EdEventInfo;

/**
 * Names the model each item the player is running draws with.
 */
struct ACTIVE_ITEM {
    s32 now;                /**< Slot the player is using now. */
    s32 item[4];            /**< Item each slot runs. */
    s32 model[9];           /**< Model each slot draws with, or -1 for none. */
    CMainItemModel *models; /**< The pool the models come out of. */
};

/* The models of the items the player is running. */
extern "C" ACTIVE_ITEM activeItem;

/* The effect table each playable character draws its own effects from. */
extern "C" void *MyEffectEntry_Tbl[16];

/* The monsters each floor of each dungeon lays out. */
extern "C" BT_ENEMY_FLOOR *BtEnemyLayoutList[7];

/* The same for the back dungeon. */
extern "C" BT_ENEMY_FLOOR *BtUraEnemyLayoutList[7];

/* Script working memory, one block per monster on the floor. */
extern "C" CDataAlloc2_1_ MonstorScriptBuffer[16];

/* One texture animation for every texture the player's model draws. */
extern "C" CTexAnimeData CharaMainTexAnim[64];

/* One texture animation for every monster the game knows. */
extern "C" CTexAnimeData MonsterTexAnim[320];

/* The effect the player's own character shoots. */
extern "C" CSHOT_EFFECT CharaMainEffect;

/* The effect the player's own character breaks things with. */
extern "C" CSHOT_EFFECT CharaMainEffectCrash;

/* The effect the player's character is shooting now. */
extern CSHOT_EFFECT *NowMainEffect;

/* The machine gun that Osmond's rapid-fire action shoots. */
extern "C" CSHOT_MACHINGUN OzumondShot;

/* The flame that Osmond's flamethrower action shoots. */
extern "C" CSHOT_FIREBAR OzumondFire;

/* The effect data Osmond's default weapon shoots. */
extern unsigned int *ozumond_default_effect;

/* The buffer the player's own effect models load into. */
extern "C" CDataAlloc2_1_ WEffectModelBuffer;

/* The buffer the weapon models load into. */
extern "C" CDataAlloc2_1_ WeaponModelBuffer;

/* The weapon models the player's character can hold. */
extern "C" CCharacter CrashWeapon;
extern "C" CCharacter DefaultWeapon;
extern "C" CCharacter MainWeapon;

/* Whether the player's character holds an item out. */
extern "C" s32 CharaMainHandViewFlag;

extern void BtGetWeaponNamePath2(char *name, char *path, int chara, int weapon);

/* The shot effects the dungeon has running. */
extern CSHOT_EFFECT *NowShotEffect;

/* The buffers the dungeon loads its data into. */
extern "C" CDataAlloc2_1_ MainModelBuffer;
extern "C" CDataAlloc2_1_ MapModelBuffer;
extern "C" CDataAlloc2_1_ CharaModelBuffer;
extern "C" CDataAlloc2_1_ MasekiModelBuffer;
extern "C" CDataAlloc2_1_ MonstorModelBuffer;
extern "C" CDataAlloc2_1_ BtMesBuffer;
extern "C" CDataAlloc2_1_ BtSteebMesBuffer;
extern "C" CDataAlloc2_1_ BtStartLogoBuffer;
extern "C" CDataAlloc2_1_ BtSystemScriptFileBuffer;

/** Provides the current dungeon map. */
extern "C" CDungeonMap *NowDngMap;

/** Provides the model used when an item is stolen. */
extern "C" CFrameVu1 *StealModel;

/** Provide the dungeon cursor models. */
extern "C" CFrame *cursorFrame;
extern "C" CFrame *bombCursorFrame;
extern "C" CFrame *bicCursorFrame;

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
extern "C" CDataAlloc2_1_ MotionData;

/* The textures the loading screen itself draws with. */
extern "C" LOADTEXTURE_INFO texdata2[];

/* Every texture the dungeon loads on its way in, and the block each goes to. */
extern "C" LOADTEXTURE_INFO2 texdata__2[];

/* The texture manager the dungeon loads its textures through. */
extern "C" CTextureManager TexManager;

/* The buffer a pack file is read into. */
extern "C" unsigned int *read_buffer;

/* The floor the player chose. */
extern "C" s32 selectMapNo;

/* The colours the enemy life gauge draws its border with. */
extern "C" spRGBA ELifeB1;
extern "C" spRGBA ELifeB2;

/* The colour the enemy life gauge draws the life it has lost with. */
extern "C" spRGBA ELifeN1;

/* The colours the enemy life gauge draws the life it has left with. */
extern "C" spRGBA ELife1;
extern "C" spRGBA ELife2;

/* The shot effect Ruby's charge is running, or -1 for none. */
extern "C" s32 ruby_effect_id;

/* Where Ruby's shot starts, and the way it flies. */
extern "C" sceVu0FVECTOR ruby_effect_pos;
extern "C" sceVu0FVECTOR ruby_effect_vec;

/* The marks that a weapon throws off as it breaks. */
extern "C" CHitMark WeaponCrashEffect;

/* The trail that the player's weapon leaves as it swings. */
extern "C" CWeaponEffect CWeaponFx;

/* The weapon each character starts with. */
extern "C" s32 defWeapon__6[];

/* The colour each weapon element gives that trail. */
extern "C" u8 wep_rgb[][3];

/* The weapon that the player has equipped. */
extern WEAPON_HAVE *NowWeaponHave;

/* The model of the weapon that the player has equipped. */
extern CCharacter *NowWeapon;

/* The camera that the dungeon draws through. */
extern CCameraFollow *NowCamera__3;

/* How near the camera is allowed to come to what it follows. */
extern "C" float camera_near_dist__2;

/* The frame that the player's model hangs off. */
extern CFrame *CharaFrame;

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
extern CDungeonMap *NowDngMap;

/* The events of the floor the dungeon is drawing. */
extern CDungeonEventMan *NowEventMan;

/* The items lying on the floor the dungeon is drawing. */
extern CRandomItem *RandomItem;

/* The texture a dropped pile of gold draws with. */
extern "C" CTexture *GoldTex;

/* Whether the player has the map of this floor equipped. */
extern "C" s32 BtEquipMap;

/* Whether the player has a sun stone equipped. */
extern "C" s32 BtEquipMasuisyou;

/* The monsters of the floor that the player is on. */
extern CMonstorUnit *NowMonstorUnit;

/* The messages the dungeon shows over the picture. */
extern "C" CDngMessageMan DngMessMan;

/* Which of the running items the mini item menu has the cursor on. */
extern "C" s32 itemNowSel;

/* Whether the player is in the back dungeon rather than the main one. */
extern "C" s32 BtUraDongeon;

/* The alpha of each of the three floor-title logos. */
extern "C" s32 rogoAlphaA[3];

/* Whether the floor title is on screen. */
extern "C" s32 rogoSwitch2;

/* The vertical position of the floor title, in screen pixels. */
extern "C" s32 rogoY3;

/* How long the floor title has been on screen, in frames. */
extern "C" s32 startCnt2;

/* Which of the dungeon's loops runs this frame. */
extern "C" s32 BtGameModeFlag;

/* Which item the mini item menu has the cursor on. */
extern "C" s32 miniItemSelNo;

/* Which character the mini character menu has the cursor on. */
extern "C" s32 BtMiniChrSelectNo;

/* Why the dungeon is being left, or zero while the player is still in it. */
extern "C" s32 existFlag;

/* Whether the player is leaving the trial dungeon. */
extern "C" s32 tryalExit;

/* Whether the mini-map draws; SetMIniMapStatus takes it away and gives it back. */
extern "C" s32 infoMap;

/* What the mini-map drew before SetMIniMapStatus took it away. */
extern "C" s32 infoMapOld;

/* The characters that walk the dungeon alongside the player. */
extern "C" CNPCharacter NPCUnit[6];

/* Whether the monsters are hidden this frame. */
extern "C" s32 CMonUnitHyde;

/* Which dungeon event is playing, or zero while the player has control. */
extern "C" s32 BtEventMode;

/* Whether a monster is held over from the floor the player came from. */
extern "C" s32 CMonUnitHold;

/* Whether an effect is held over from the floor the player came from. */
extern "C" s32 CEffectHold;

/* Whether the player's model skips interpolation on its next drive step. */
extern "C" s32 driveNoInterpolate;

/* How long until the player can be damaged again, in frames. */
extern "C" s32 dmg_check_wait;

/* How long until Ozumond's action plays its sound again, in frames. */
extern "C" s32 ozumond_snd_cnt;

/* Whether an enemy is locked on. */
extern "C" s32 lockOnTargetFlag;

/* The effect that a short Atlamillia use lights the player with. */
extern "C" CCharacter shortAtraEffect;

/* Whether that effect is running, and how bright it is. */
extern "C" s32 atraGetStatus;
extern "C" float atraGetStatusRate__2;

/* The colour that a status ailment tints the player's model with. */
extern "C" float StatusColor[3];

/* Whether the player is running on a speed boost. */
extern "C" s32 BtBySpeedFlag;

/* The shots the player's character has in the air. */
extern "C" CSHOT *NowShotData;

/* What the game is doing now. */
extern "C" s32 gameTask;

/* Whether the player is pressing the button that fires an action. */
extern "C" s32 PadInput_OK;

/* Which monster is locked on, or -1 for none. */
extern "C" s32 lockOnTargetNo;

/* The marks that the hits the player took have left. */
extern "C" CHitPointMark MyHitPointMark[16];

/* The way the last blow throws the player. */
extern "C" sceVu0FVECTOR blowVelo;

/* How fast the player is being thrown. */
extern "C" sceVu0FVECTOR velo__2;

/* How hard the player is pushing the stick. */
extern "C" float stickVector;

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

/* Whether the player is escaping the dungeon. */
extern "C" s32 EscapeFlag;

/* The field that the drainage map draws. */
extern "C" CDranMapField *NowDranMapField;

/* Whether the character-change effect is playing. */
extern "C" s32 NewChangeFxFlag;

/* Whether each treasure-box opening effect is playing. */
extern "C" s32 itemOpenSmallFlag;
extern "C" s32 itemOpenBigFlag;

/* Whether the dungeon draws anything at all this frame. */
extern "C" s32 BtAllDrawFlag;

/* Whether the models hold their step this frame. */
extern "C" s32 driveStepHold;

/* Whether the water splash is playing. */
extern "C" s32 Water_Splash_actFlag;

/* Which short Atlamillia use is running. */
extern "C" s32 atraShortGetType;

/* The shock wave the dungeon has running. */
extern "C" CShockWave *NowShockWave;

/* The buffer the camera test builds its polygon list in. */
extern "C" CDataAlloc2_1_ *WorkBuffer__2;

/* Where the camera looks, relative to what it follows. */
extern "C" sceVu0FVECTOR ref_off;

/* How hard the player is turning the camera. */
extern "C" float inputH1;

/* Distances the camera keeps from what it follows. */
extern "C" float camera_up_near_dist;
extern "C" float camera_far_dist__2;
extern "C" float camera_far_dist_limmit;

/* The collisions the dungeon tests against. */
extern "C" CCollisionData *NowColData;

/* The damage numbers the dungeon draws. */
extern "C" CHitValue *NowHitValue;

/* Where the item the player is about to throw will land. */
extern "C" BOMB_INFO BombInfo;

/* How square on to the player each monster of the floor stands. */
extern "C" float MonstorPicupInner[36];

/* How long the lock-on cursor stays on screen, in frames. */
extern "C" float targetCursorCnt;

/* Whether the lock-on cursor draws. */
extern "C" s32 lockOnTargetDraw;

/* Which way the player is shifting the lock-on cursor, or -1 for neither. */
extern "C" s32 targetCursorShiftNo;

/* How many monsters the player could lock on to. */
extern "C" s32 targetCursorShiftRot;

/* The heading the eye camera looks along. */
extern "C" float viewAngleH__2;

/* The pitch the eye camera looks along. */
extern "C" float viewAngleV__2;

/* The colour the ambient-colour animation drives the player's model to. */
extern "C" float unitAmbientAnime_rgb[3];

/* Whether the ambient-colour animation is running on the player's model. */
extern "C" s32 unitAmbientAnime_flag;

/* How far through the ambient-colour animation the player's model is. */
extern "C" float unitAmbientAnime_Count;

/* How long the ambient-colour animation runs for, in frames. */
extern "C" s32 unitAmbientAnime_Timer;

/* How fast the ambient-colour animation runs. */
extern "C" float unitAmbientAnime_Speed;

/* The texture that the floor number draws with. */
extern "C" CTexture *TEX_Floor1;

/* The name of the texture that the floor number draws with. */
extern "C" char floor_name[32];

/* The map info file each dungeon loads its floors from. */
extern "C" char *MapInfoNameArea[7];

/* The VU1 program that the loading screen draws through. */
extern "C" char Vu_prog0f[];

/* Which entry the main menu has the cursor on. */
extern "C" s32 main_select_menu_no;

extern "C" void sceVif1PkCall(sceVif1Packet *packet, void *program, int flags);
extern "C" void sceVif1PkTerminate(sceVif1Packet *packet);
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
extern "C" CDataAlloc2_1_ TextureData;
extern "C" CDataAlloc2_1_ BtScriptWorkBuffer;
extern "C" CDataAlloc2_1_ BtItemCashArea[6];

/* Where the pack file the dungeon read last went. */
extern "C" unsigned int *old_read_buffer;

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
extern "C" CSHOT_EFFECT ShotEffect[5];

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
extern "C" CTexture *TEX_WepGage;
extern "C" CTexture *TEX_Stayframe;
extern "C" CTexture *TEX_Shadow;

/* The bombs the dungeon has running. */
extern "C" CItemBombEffect *NowBombEffect;

/* Which language the disc was pressed for. */
extern "C" s32 LanguageCode;

/* Which button fires an action and which cancels one. */
extern "C" s32 PadInput_NO;

/* Whether the debug overlay draws. */
extern "C" s32 BtDebugFlag;

/* Whether the player asked to leave through the menu. */
extern "C" s32 exitMenuFlag;

/* Which lighting the field draws under. */
extern "C" s32 lightingMode;

/* The message the dungeon drew last, so a repeat does not show twice. */
extern "C" s32 oldMsgNo;
extern "C" s32 oldMsgNo2;

/* How far the camera is allowed to pull back. */
extern "C" s32 camera_dist_mode__3;

/* Whether the camera is moving itself, and how long it has been. */
extern "C" s32 cameraAuto;
extern "C" s32 faceEyeCount;

/* Which way the player is looking. */
extern "C" s32 viewMode__2;

/* Which event the dungeon is showing a marker for. */
extern "C" s32 iventInfo;
extern "C" s32 iventMarker;

/* Whether the picture is being captured this frame. */
extern "C" s32 frameCaputer;

/* Which character the player is walking as. */
extern "C" s32 nowUnitNow;

/* Whether the monsters draw this frame. */
extern "C" s32 MonstorViewFlag;

/* Whether the effects are hidden this frame. */
extern "C" s32 CEffectHyde;

/* Whether the Atlamillia message board is up. */
extern "C" s32 atraGetMsgBord;

/* Whether the player picked up a gate key this floor. */
extern "C" s32 gateItemFlag;

/* How long the dungeon has been waiting for the player, in frames. */
extern "C" s32 timeOutCount;

/* Whether the item list the menu caches is still good. */
extern "C" s32 BtItemListCashFlag;

/* How long the camera waits before it moves itself, in frames. */
extern "C" s32 defCameraWait;

/* Whether the monster names are hidden. */
extern "C" s32 MonstorNameOff;

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
void SetDataBuffer(CDataAlloc2_1_ *buffer, int blocks);

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
 * Puts the Georama editor's fade back to the start.
 *
 * @mangled EdFadeInit__Fv
 */
void EdFadeInit(void);

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

INCLUDE_ASM("asm/nonmatchings/dun/gameloop", _dun_text_start);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_617__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_618__4);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_619__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_620__5);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_621__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_622__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_623__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_624__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_625__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_626__8);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_627__8);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_628__8);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_629__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_630__9);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_631__8);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_632__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_633__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_634__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_635__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_636__6);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_637__5);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_638__7);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_639__9);

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
            char *found = GetPackFile(read_buffer, name, &size);

            if (found != NULL) {
                info[i].name = found;
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

#if DUN_COMPILE_DATA
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", LoadTempTexture__FPPciPc);
#endif /* DUN_COMPILE_DATA */

#if DUN_COMPILE_DATA
void SetTempTexture(int block, char *name) {
    LOADTEXTURE_INFO2 info[2] = {0};

    info[0].block_no = block;
    info[0].name = name;
    TexManager.DeleteTextureBlock(block);
    TexManager.LoadTextureBlockEX(block, info);
}
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", SetTempTexture__FiPc);
#endif /* DUN_COMPILE_DATA */

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
        DUNGEON_EVENT_STATE *event = &DngEventMan.event[i];

        event->unk_00 = 0;
        event->unk_34 = 0;
        event->unk_38 = 0;
        event->unk_30 = 0;
        event->unk_3C = -1;
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
        ShotEffect[i].Initialize();
    }
    NowShotEffect = ShotEffect;
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
        CWeaponFx.unk_490[i] = 0;
    }
    CWeaponFx.colour[0].r = CWeaponFx.colour[2].r = 0x40;
    CWeaponFx.colour[0].g = CWeaponFx.colour[2].g = 0x40;
    CWeaponFx.colour[0].b = CWeaponFx.colour[2].b = 0x40;
    CWeaponFx.colour[1].r = CWeaponFx.colour[3].r = 6;
    CWeaponFx.colour[1].g = CWeaponFx.colour[3].g = 6;
    CWeaponFx.colour[1].b = CWeaponFx.colour[3].b = 6;
    CWeaponFx.unk_520 = 0;
    CWeaponFx.unk_524 = 0;
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
    MGBeginDrawShadow(TexManager.GetTexture("shadow_buf", -1)->m_tex0);

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
#if DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA
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

        sceVu0CopyMatrix(place, lamp->world);
        up[0] = place[3][0];
        up[1] = place[3][1];
        up[2] = place[3][2];
        lamp->GetWorldPosition(world, up);
        sceVu0CopyVector(stood, CharaFrame->pos);

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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", Draw_MainUnit__Fv);
#endif /* DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA */
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_1059__2);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_1797);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_1806);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_1807);
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", MainDraw__Fv__3);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4385);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4395);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4396);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4400);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4404);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4405);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4406);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4407);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4408);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4409);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4410);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4411);
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", MoveChara__Fv__2);
#if DUN_COMPILE_DATA && DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA
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
        sceVu0CopyVector(pos, CharaFrame->pos);
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
                    y -= 6.283184f;
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
        sceVu0CopyVector(hand, CharaFrame->pos);

        float chara_height[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};

        float height = chara_height[UserStatus->cur_chara];

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
        for (i = 0; i < 6; i++) {
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
        CUserStatus *status = UserStatus;
        s8 owner = status->cur_chara;
        s8 *slots = status->equipped_weapon_slot;
        WEAPON_HAVE *weapon = &status->chara_weapons[owner][slots[owner]];

        if (weapon->durability_f <= 10.0f &&
            status->chara_weapons[owner][slots[owner]].item_no != defWeapon__6[owner]) {
            static int warning_cnt = 0;
            int wait = (int) weapon->durability_f * 10;

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
    NowDranMapField->Step();
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
        if (collision->unk_3C00[i] == 0) {
            continue;
        }
        if (collision->hit[i].unk_70 > 0) {
            collision->hit[i].unk_70--;
        } else {
            collision->hit[i].unk_70 = collision->hit[i].unk_74;
        }
        collision->hit[i].life--;
        if (collision->hit[i].life <= 0) {
            collision->unk_3C00[i] = 0;
            collision->hit[i].unk_38 = 0.0f;
            continue;
        }
        collision->hit[i].unk_3C += collision->hit[i].unk_40;
        if (collision->hit[i].unk_38 != 0.0f) {
            sceVu0ScaleVectorXYZ(collision->hit[i].unk_10, collision->hit[i].unk_10,
                                 collision->hit[i].unk_38);
        }
    }

    if (StatusErrCheck(4) != 0 || StatusErrCheck(8) != 0) {
        CUserStatus *status = UserStatus;
        s8 owner = status->cur_chara;
        s16 *left = status->unk_42E0;

        if (left[owner] > 0) {
            left[owner]--;

            CUserStatus *now = UserStatus;
            s8 who = now->cur_chara;

            if (now->unk_42E0[who] == 0) {
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
        s8 *who = &status->cur_chara;

        if (*who == 0) {
            if (BtActStatus.unk_14A == 0) {
                gain *= 0.25f;
            } else {
                gain = 0.0f;
            }
            BtActStatus.unk_14A = 0;
        }
        if (*who == 4) {
            if (BtActStatus.unk_14A == 0) {
                gain *= 0.25f;
            } else {
                gain = 0.0f;
            }
            BtActStatus.unk_14A = 0;
        }
        if (*who == 5) {
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
        if (*who == 1) {
            gain *= 1.5f;
        }
        if (*who == 3) {
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
    float water_max = status->water_max[status->cur_chara];
    float water_now = status->water_now[status->cur_chara];
    static int heal_counter = 0;

    s8 *healed = &status->cur_chara;

    heal_counter++;
    if (!(heal_counter < 240)) {
        if ((NowWeaponHave->flags & 0x800) && status->hp[*healed] > 0) {
            status->AddNowLife(*healed, 1, 255.0f);
        }
        heal_counter = 0;
    }

    UserStatus->Step(0);
    DngMessMan.SetStatus_Dry(water_max, water_now,
                             UserStatus->water_now[UserStatus->cur_chara]);
    BtStatusAlarmAnime();

    for (i = 0; i < FrameObjAnimCnt; i++) {
        ObjAnimePlay(&FrameObjAnim[i]);
    }

    CDungeonMap *map = NowDngMap;

    map->fire.FireStep();
    map->fire.RasterStep();
    CWeaponFx.Step();
    for (i = 0; i < 4; i++) {
        CWeaponElFx[i].Step();
    }
    for (i = 0; i < 32; i++) {
        HitValue[i].Step();
    }
    mainItemModel.Step();
    WeaponCrashEffect.Step();
    for (i = 0; i < 16; i++) {
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
    for (i = 0; i < 3; i++) {
        CBomb__2[i].Step();
    }
    for (i = 0; i < 5; i++) {
        MasekiEffect[i].Step();
    }
    NowShockWave->Step();

    CSHOT_EFFECT *effects = NowShotEffect;

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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", motionDrive__Fv);
#endif /* DUN_COMPILE_DATA && DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA */
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4830);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4831);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4833);
#if DUN_COMPILE_SHORT
void BtCleatRandomMap(void) {
    int i;

    NowDngMap = &MainDungeonMap;
    NowEventMan = &DngEventMan;
    ((CDngStatusData *) UserStatus)->LostGateKey();

    CDungeonEventMan *events = NowEventMan;

    for (i = 0; i < 96; i++) {
        events->event[i].unk_00 = 0;
        events->event[i].unk_34 = 0;
        events->event[i].unk_38 = 0;
        events->event[i].unk_30 = 0;
        events->event[i].unk_3C = -1;
    }

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

    CTexture *gold = GoldTex;

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
    RandomItem = &MainRandomItem;

    NowDngMap->buildRandomMap(6, 1);
    NowDngMap->buildEventData(UserStatus->cur_floor, NowDngMap->unk_BDEC, 1);
    NowDngMap->FlushCheckMask();
    NowDngMap->DrawMapCalc(NowDngMap->unk_BDEC);
    NowEventMan->SetupEvent(NowDngMap, NowDngMap->unk_BDEC);

    // The back dungeon starts from the floor that was just built, then lays
    // out its own events and items on top.
    NowDngMap = &UraDungeonMap;
    NowEventMan = &UraEventMan;
    UraDungeonMap = MainDungeonMap;
    UraEventMan = DngEventMan;

    for (i = 0; i < 96; i++) {
        UraEventMan.event[i].unk_00 = 0;
        UraEventMan.event[i].unk_34 = 0;
        UraEventMan.event[i].unk_38 = 0;
        UraEventMan.event[i].unk_30 = 0;
        UraEventMan.event[i].unk_3C = -1;
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

    UraDungeonMap.buildRandomMap(6, 0);
    UraDungeonMap.buildEventData(UserStatus->cur_floor, UraDungeonMap.unk_BDEC, 0);
    UraDungeonMap.FlushCheckMask();
    UraDungeonMap.DrawMapCalc(UraDungeonMap.unk_BDEC);
    UraEventMan.SetupEvent(&UraDungeonMap, UraDungeonMap.unk_BDEC);

    NowDngMap = &MainDungeonMap;
    NowEventMan = &DngEventMan;
    UserStatus->ClearEventFlag();
    BtUraDongeon = 0;
    BtEquipMap = 0;
    BtEquipMasuisyou = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BtCleatRandomMap__Fv);
#endif /* DUN_COMPILE_SHORT */
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

    CSHOT_EFFECT *effects = NowShotEffect;

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
#if DUN_COMPILE_SHARED_RODATA
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", EquipReAttach__FP10CCharacteri);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4979);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4980);
#endif /* DUN_COMPILE_SHARED_RODATA */
#if DUN_COMPILE_SHARED_RODATA
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

    NowWeapon->SetPosition(0.0f, 0.0f, 0.0f);
    NowWeapon->SetRotation(0.0f, 0.0f, 0.0f);
    NowWeapon->frame->SetReference(hand);
    NowWeapon->Step();

    for (i = 0; i < 32; i++) {
        CWeaponFx.unk_490[i] = 0;
    }
    CWeaponFx.colour[0].r = CWeaponFx.colour[2].r = 0x40;
    CWeaponFx.colour[0].g = CWeaponFx.colour[2].g = 0x40;
    CWeaponFx.colour[0].b = CWeaponFx.colour[2].b = 0x40;
    CWeaponFx.colour[1].r = CWeaponFx.colour[3].r = 6;
    CWeaponFx.colour[1].g = CWeaponFx.colour[3].g = 6;
    CWeaponFx.colour[1].b = CWeaponFx.colour[3].b = 6;
    CWeaponFx.unk_520 = 0;
    CWeaponFx.unk_524 = 0;
    CWeaponFx.InitSet(NowWeapon->frame, "dcol0", "dcol1");
    SetWeaponColor();
}
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", EquipWeaponFrame__FP10CCharacterii);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_4997);
#endif /* DUN_COMPILE_SHARED_RODATA */
#if DUN_COMPILE_DATA
void LoadWeapon2(unsigned int *crash_data, unsigned int *default_data, unsigned int *main_data,
                 int chara, int reload) {
    int weapon_kind[6] = {1, 4, 6, 5, 10, 7};
    int weapon_first[6] = {0x101, 0x12B, 0x13A, 0x14B, 0x15B, 0x16B};
    char weapon_name[64];
    char weapon_model_path[64];

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

    BtGetWeaponNamePath2(weapon_name, weapon_model_path, chara,
                         status->chara_weapons[owner][status->equipped_weapon_slot[owner]].item_no -
                             weapon_first[chara]);
    MainWeapon.Initialize();
    MainWeapon.LoadPackData3(main_data, weapon_model_path, &WeaponModelBuffer, 0x1D,
                             &WeaponModelBuffer, 1, 0);
    EquipWeaponFrame(&MainWeapon, chara, CharaMainHandViewFlag);

    // The effect models take whatever the weapon models leave.
    s32 used = WeaponModelBuffer.used;
    u8 *free_start = WeaponModelBuffer.buffer + used * 16;
    s64 free_size = 0x33450 - CharaModelBuffer.used - used;

    WEffectModelBuffer.buffer = free_start;
    WEffectModelBuffer.size = free_size;
    WEffectModelBuffer.used = 0;

    CUserStatus *equipped = UserStatus;
    s8 chara_no = equipped->cur_chara;

    MenuWeaponSpSet(NowWeapon,
                    &equipped->chara_weapons[chara_no][equipped->equipped_weapon_slot[chara_no]]);
    BtActStatus.unk_048 = 100.0f;
    BtActStatus.unk_0A4 = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", LoadWeapon2__FPUiPUiPUiii);
#endif /* DUN_COMPILE_DATA */
#if DUN_COMPILE_DATA && DUN_COMPILE_SHARED_RODATA
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", SwordDmgCheck1__Ffi);
#endif /* DUN_COMPILE_DATA && DUN_COMPILE_SHARED_RODATA */

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

BT_SHOT_EFFECT *Get_Main_EffectPtr(int chara, int form) {
    switch (chara) {
        case 0:
            return (BT_SHOT_EFFECT *) MyEffectEntry_Tbl[0];
        case 1:
            return (BT_SHOT_EFFECT *) MyEffectEntry_Tbl[1];
        case 2:
            return (BT_SHOT_EFFECT *) MyEffectEntry_Tbl[2];
        case 3:
            // Ruby draws a different set for each of her forms.
            if (form < 0 || form >= 5) {
                form = 0;
            }
            return (BT_SHOT_EFFECT *) MyEffectEntry_Tbl[3 + form];
        case 4:
            return (BT_SHOT_EFFECT *) MyEffectEntry_Tbl[8];
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
            return (BT_SHOT_EFFECT *) MyEffectEntry_Tbl[9 + entry];
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

        CharaMainEffectCrash.Entry2((BT_SHOT_EFFECT *) MyEffectEntry_Tbl[9],
                                    crash, 0x10, &WEffectModelBuffer, 6);
    }
    if (UserStatus->cur_chara == 3) {
        unsigned int *crash = ozumond_default_effect;

        CharaMainEffectCrash.Entry2((BT_SHOT_EFFECT *) MyEffectEntry_Tbl[3],
                                    crash, 0x10, &WEffectModelBuffer, 6);
    }
    NowMainEffect = &CharaMainEffect;
}
#if DUN_COMPILE_DATA
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
        sceVu0CopyVector(pos, CharaFrame->pos);
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
    CharaFrame = CharaMain.frame;

    if (chara == 5) {
        LOADTEXTURE_INFO2 info[2] = {{NULL, 0x46, 0}, {NULL, 0x46, 0}};
        int size;

        char *hand_texture = GetPackFile(chara_data, "c05w_h.img", &size);
        u8 *at = CharaModelBuffer.buffer + CharaModelBuffer.used * 16;

        memcpy(at, hand_texture, size);
        size = (((size >> 6) + 1) << 6) >> 4;
        CharaModelBuffer.Alloc(size);
        info[0].name = (char *) at;
        TexManager.DeleteTextureBlock(0x46);
        TexManager.LoadTextureBlockEX(0x46, info);

        char *effect = GetPackFile(chara_data, "mgan01.chr", &size);

        ozumond_default_effect = (unsigned int *) (CharaModelBuffer.buffer +
                                                   CharaModelBuffer.used * 16);
        memcpy(ozumond_default_effect, effect, size);
        size = (((size >> 6) + 1) << 6) >> 4;
        CharaModelBuffer.Alloc(size);
    }

    if (chara == 3) {
        int size;
        char *effect = GetPackFile(chara_data, "c05_f03.chr", &size);

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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", LoadChara2__FiiPUiPUiPUiPUi);
#endif /* DUN_COMPILE_DATA */
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_5197);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_5198);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_5199);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_5200);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_5201);

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
    CharaFrame->SetPosition(200.0f, 0.0f, 150.0f);

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

#if DUN_COMPILE_DATA && DUN_COMPILE_SBSS
int BtCheckDamageProc(void) {
    static int dmgSnd = 0;
    sceVu0FVECTOR pos;
    sceVu0FVECTOR from;
    sceVu0FVECTOR blow;
    float value[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    sceVu0FVECTOR at;
    sceVu0FVECTOR away;
    float heavy_value[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    float chara_radius[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};
    float blow_radius[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};
    float heavy_radius[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};
    int taken = 0;
    int blown = 0;

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

        int no = NowColData->CheckHitUser(pos, 1, chara_radius[UserStatus->cur_chara]);

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
            COLLISION_HIT *hit = &NowColData->hit[no];
            int guard = UserStatus->unk_4348[UserStatus->cur_chara];

            if (StatusErrCheck(8) != 0) {
                guard *= 2;
            }
            damage -= guard;
            if (damage <= 0) {
                damage = 0;
            }

            int monster = -1;

            if (hit->owner != -1) {
                monster = (hit->owner - 200) / 5;
                if (monster >= 0 && monster < 16) {
                    NowMonstorUnit->monster[monster].unk_0C0 = damage;
                }
                NowMonstorUnit->chara[monster].GetPosition(from);
            }

            int roll = (int) (100.0f * (float) rand() / 2147483648.0f);

            // A hit that drains takes water off the player and gives it to
            // whatever landed it.
            if ((hit->flags & 0x40000) && roll < 20 && monster != -1) {
                u16 *water = &UserStatus->unk_4346;
                u16 had = UserStatus->unk_4346;

                if (had >= 11) {
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
                    s32 *vol = &UserStatus->active_item_vol[slot];

                    (*vol)--;
                    if (*vol <= 0) {
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
                    s32 *vol = &UserStatus->active_item_vol[slot];

                    (*vol)--;
                    if (*vol <= 0) {
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
                    s32 *vol = &UserStatus->active_item_vol[slot];

                    (*vol)--;
                    if (*vol <= 0) {
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
                    s32 *vol = &UserStatus->active_item_vol[slot];

                    (*vol)--;
                    if (*vol <= 0) {
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
                        NowColData->unk_3C00[no] = 0;
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

                    value[1] = blow_radius[UserStatus->cur_chara];
                    HitValueEntry(NowHitValue, value, damage, 2, CharaMain.frame);

                    sceVu0CopyVector(blowVelo, NowColData->hit[no].velocity);
                    unitBlowActionRot(blowVelo);
                    if (NowColData->hit[no].unk_48 != 3) {
                        NowColData->unk_3C00[no] = 0;
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
                        NowColData->unk_3C00[no] = 0;
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
                        NowColData->unk_3C00[no] = 0;
                    }

                    heavy_value[1] = heavy_radius[UserStatus->cur_chara];
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BtCheckDamageProc__Fv);
#endif /* DUN_COMPILE_DATA && DUN_COMPILE_SBSS */
#if DUN_COMPILE_DATA && DUN_COMPILE_SHARED_RODATA
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

            CharaFrame->SetRotation(0.0f, turned, 0.0f);
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
            s16 *item = &slots[itemNowSel];
            s16 *left = &item[3];

            if (*left == 1) {
                *item = -1;
                slots[itemNowSel + 3] = 0;
            } else {
                (*left)--;
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
            BtActStatus.unk_00C = 0x1B;
        }
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BattleActionThlow__Fv);
#endif /* DUN_COMPILE_DATA && DUN_COMPILE_SHARED_RODATA */
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_5627);
#if DUN_COMPILE_DATA
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
        s16 *item = &slots[itemNowSel];
        s16 *left = &item[3];

        // The last use takes the item away; anything else just spends one.
        if (*left == 1) {
            *item = -1;
            slots[itemNowSel + 3] = 0;
        } else {
            (*left)--;
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BattleActionDrink__Fv);
#endif /* DUN_COMPILE_DATA */

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

#if DUN_COMPILE_DATA
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
                        setShotVector(vector, 5.0f, CharaMain.GetRotation()->y, 0.0f);
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
                            shots->unk_310[i] = 1.0f;
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
                            shots->unk_310[i] = 1.0f;
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
            // Retail reads gameTask here and does nothing with what it
            // finds; MWCC drops the test, so the function comes out three
            // instructions short of retail's.
            if (gameTask == 10) {
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BattleActionPlay_Jinn__FP10CCharacteri);
#endif /* DUN_COMPILE_DATA */
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_5735);

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

#if DUN_COMPILE_DATA && DUN_COMPILE_SHARED_RODATA
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

        if (shot_no != -1) {
            NowMainEffect->SetWepStatus(NowWeaponHave->flags);
            NowMainEffect->SetVsMonster(NowWeaponHave->vs_monster);
            NowMainEffect->SetDmg(damage);
        }
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BattleActionShotRuby__FP10CCharacterifi);
#endif /* DUN_COMPILE_DATA && DUN_COMPILE_SHARED_RODATA */
#if DUN_COMPILE_SHARED_RODATA
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BattleActionPlay_Ruby__FP10CCharacteri);
#endif /* DUN_COMPILE_SHARED_RODATA */

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

#if DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BattleActionPlay_Ozumond__Fi);
#endif /* DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA */
#if DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BattleActionPlay_Ozumond_H__Fi);
#endif /* DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA */
#if DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", BattleActionPlay_Ozumond_F__Fi);
#endif /* DUN_COMPILE_SBSS && DUN_COMPILE_SHARED_RODATA */

INCLUDE_ASM("asm/nonmatchings/dun/gameloop", CameraAutoMove__FP13CCameraFollowP6CCPolyPfff__2);
/* FIXME: This function isn't being renamed correctly after being made static
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
*/

#if DUN_COMPILE_SBSS
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
    int j;
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

    box.unk_00[0] = look[0] > eye[0] ? look[0] : eye[0];
    box.unk_00[1] = look[1] > eye[1] ? look[1] : eye[1];
    box.unk_00[2] = look[2] > eye[2] ? look[2] : eye[2];
    box.unk_10[0] = look[0] < eye[0] ? look[0] : eye[0];
    box.unk_10[1] = look[1] < eye[1] ? look[1] : eye[1];
    box.unk_10[2] = look[2] < eye[2] ? look[2] : eye[2];

    if (NowDngMap->unk_BDEC != 1) {
        i = 0;
        while (NowDngMap->parts[i].frame[0] != NULL) {
            CFrame *frame = i == -1 ? NULL : NowDngMap->parts[i].unk_004;

            if (frame != NULL) {
                sceVu0CopyVector(eye, NowDngMap->parts[i].unk_110);

                CDungeonMap *map = NowDngMap;
                int turn = (int) map->parts[i].unk_170;

                turn += i == -1 ? 0 : map->parts[i].unk_008;

                if (turn >= 4) {
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
        for (j = 0; j < 20; j++) {
            for (i = 0; i < 20; i++) {
                CDungeonMap *map = NowDngMap;
                s32 parts_no = map->cells[i + j * 20].parts_no;
                CFrame *frame = parts_no == -1 ? NULL : map->parts[parts_no].unk_004;

                if (frame == NULL) {
                    continue;
                }
                if (!(map->cells[i + j * 20].unk_08 <= 240.0f)) {
                    continue;
                }

                int turn = map->cells[i + j * 20].direction;

                turn += parts_no == -1 ? 0 : map->parts[parts_no].unk_008;

                if (turn >= 4) {
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
    if (cnt >= 61) {
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
        int last = -1;

        sceVu0InnerProduct(forward, (float *) &poly[hit_poly[0]].unk_00[0x30]);

        for (i = 0; i < hits; i++) {
            sceVu0SubVector(towards, hit_point[i], pos);
            if (sceVu0InnerProduct(forward, towards) < 0.0f) {
                break;
            }
            last = i;
        }

        if (last >= 0) {
            sceVu0CopyVector(facing, (float *) &poly[hit_poly[last]].unk_00[0x30]);
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
            sceVu0CopyVector(facing_last, (float *) &poly[hit_poly[0]].unk_00[0x30]);
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
            float step = (NowCamera__3->GetHeight() - 5.0f) * rate;

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
        NowMonstorUnit->chara[lockOnTargetNo].GetPosition(locked);

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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", autoCamTrial__Fv);
#endif /* DUN_COMPILE_SBSS */
void DelActiveItem(int slot) {
    // The two arrays are adjacent, and retail walks the second one off the
    // first rather than off the save data again.
    // The two arrays are adjacent, and retail walks the second one off the
    // first rather than off the save data again.
    s16 *slots = UserStatus->active_item;
    s16 *item = &slots[slot];
    s16 *left = &item[3];

    // The last use takes the item away; anything else just spends one.
    if (*left == 1) {
        *item = -1;
        *left = 0;
        if (activeItem.model[slot] != -1) {
            activeItem.models->DeleteModel(activeItem.model[slot]);
            activeItem.model[slot] = -1;
        }
    } else {
        (*left)--;
    }
}
#if DUN_COMPILE_SHORT
int Run_TrapCircle(MAP_TRAP_CIRCLE *trap) {
    if (trap != NULL) {
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
        gauge = &status->unk_4346;
        had = status->unk_4346;
        chara = status->cur_chara;
        slots = status->equipped_weapon_slot;
        slot = slots[chara];
        weapon = &status->chara_weapons[chara][slot];
        element = -1;
        se = 0;
        kind = trap->kind;

        // A character still holding the weapon they started with takes the
        // first trap instead of whatever the circle says.
        if (status->chara_weapons[chara][slot].item_no == defWeapon__6[chara] ||
            status->chara_weapons[chara][slot].item_no == defWeapon__6[chara] + 1) {
            kind = 0;
        }

        switch (kind) {
            case 0:
                BtSetStatusErr(8);
                se = 0xE1;
                break;
            case 1: {
                int added = (int) (had * 1.2f) + 10;

                if (had + added < 0xFFFF) {
                    status->unk_4346 += added;
                } else {
                    status->unk_4346 = 0xFFFF;
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
}
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", Run_TrapCircle__FP15MAP_TRAP_CIRCLE);
#endif /* DUN_COMPILE_SHORT */

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

#if DUN_COMPILE_SBSS
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", DrawtargetCursor__FPffff);
#endif /* DUN_COMPILE_SBSS */
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6367);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6745);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6746);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6747);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6748);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6749);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6750);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6751);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6753);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6754);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6755);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6756);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6757);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6758);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6759);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6774);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6775);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6776);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6777);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6778);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6779);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6780);
#if DUN_COMPILE_DATA
int SetNearLockOnTarget(int from, int nearest_only) {
    CUserStatus *status = UserStatus;
    sceVu0FVECTOR at;
    sceVu0FVECTOR towards;
    sceVu0FVECTOR pos[16];
    float dist[16];
    int found[16];
    sceVu0FVECTOR forward = {0.0f, 0.0f, 1.0f, 1.0f};
    sceVu0FMATRIX unit;
    sceVu0FMATRIX turn;
    int order[16];
    int screen[4];
    float range_rate[6] = {1.2f, 1.4f, 1.1f, 1.5f, 1.0f, 1.8f};
    float away;
    float rate;
    int i;
    int count;
    int n;
    int k;
    int j;
    int m;

    rate = range_rate[status->cur_chara];

    CharaFrame->GetRotation(at);
    sceVu0UnitMatrix(unit);
    sceVu0RotMatrixY(turn, unit, at[1]);
    sceVu0ApplyMatrix(forward, turn, forward);
    sceVu0Normalize(forward, forward);

    count = 0;
    sceVu0CopyVector(at, CharaFrame->pos);

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

        monsters->chara[i].GetPosition(pos[i]);

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

    for (n = 0; n < 16; n++) {
        order[n] = -1;
    }

    // The nearest one that is still free goes into each place in turn.
    for (k = 0; k < count; k++) {
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
        NowMonstorUnit->chara[target].GetPosition(at);
        at[1] += NowMonstorUnit->chara[target].unk_0B4;
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", SetNearLockOnTarget__Fii);
#endif /* DUN_COMPILE_DATA */
#if DUN_COMPILE_DATA
void setTargetCursor(int on) {
    CUserStatus *status = UserStatus;
    sceVu0FVECTOR target;
    sceVu0FVECTOR stood;
    sceVu0FVECTOR flat_stood;
    sceVu0FVECTOR flat_target;
    int screen[4];
    float range_rate[6] = {1.2f, 1.4f, 1.1f, 1.5f, 1.0f, 1.8f};
    float width;
    float height;
    int keep;

    float rate = range_rate[status->cur_chara];

    if (on != 0) {
        keep = 1;

        if (NowMonstorUnit->monster[lockOnTargetNo].state != 2 ||
            NowMonstorUnit->monster[lockOnTargetNo].hp <= 0) {
            keep = 0;
        }
        if (NowMonstorUnit->monster[lockOnTargetNo].unk_11C == 0) {
            keep = 0;
        }

        sceVu0CopyVector(stood, CharaFrame->pos);
        NowMonstorUnit->chara[lockOnTargetNo].GetPosition(target);

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
        }

        float drop = stood[1] - target[1];

        drop = drop < 0.0f ? -drop : drop;
        if (!(drop < 80.0f)) {
            keep = 0;
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
            }
        }
    } else {
        targetCursorShiftRot = SetNearLockOnTarget(0, 1);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", setTargetCursor__Fi);
#endif /* DUN_COMPILE_DATA */

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

#if DUN_COMPILE_SBSS
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", setUnitDamageColor__Fi);
#endif /* DUN_COMPILE_SBSS */

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

#if DUN_COMPILE_DATA
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
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", LoadStartLogo__Fi);
#endif /* DUN_COMPILE_DATA */

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
#if DUN_COMPILE_SBSS
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

    sceVif1PkCall(Vif1Packet, (void *) Vu_prog0f, 0);
    sceVif1PkTerminate(Vif1Packet);
    TexManager.ReloadTexture(Vif1Packet, 12);
    CDbgMsg.Draw();
    return chosen;
}
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", LoaderLoop__Fv);
#endif /* DUN_COMPILE_SBSS */
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6807);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6808);
INCLUDE_RODATA("asm/nonmatchings/dun/gameloop", LIT_6809);

void InitEyeCamera(void) {
    sceVu0FVECTOR pos;

    viewAngleH__2 = CharaMain.GetRotation()->y;
    viewAngleV__2 = 0.0f;
    sceVu0CopyVector(pos, CharaMain.pos);
}

#if DUN_COMPILE_DATA
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
    float eye_height[6] = {16.0f, 14.0f, 16.0f, 16.0f, 18.0f, 15.0f};

    float height = eye_height[status->cur_chara];

    pos[1] += height - 1.5f;
    ref[0] += pos[0];
    ref[1] += pos[1];
    ref[2] += pos[2];

    NowCamera__3->SetPos(pos);
    NowCamera__3->SetRef(ref);
}
#else
INCLUDE_ASM("asm/nonmatchings/dun/gameloop", EyeCamera__Fv);
#endif /* DUN_COMPILE_DATA */
