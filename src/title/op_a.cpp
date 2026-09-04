#pragma constant_flag 0
#pragma constant_flag_ones 2, 9, 11, 12, 14, 15, 17, 18, 20, 24
#pragma constant_flag_ones 27, 28, 32, 33, 34, 35, 36, 39, 48, 63
#pragma constant_flag_ones 64, 65, 68, 70, 71, 73, 74, 75, 76, 77
#pragma constant_flag_ones 78, 80, 82, 84, 86, 87, 88, 96, 97, 99
#pragma constant_flag_ones 100, 102, 104, 108, 109, 110, 120, 121, 122, 123
#pragma constant_flag_ones 124, 125, 128, 129, 130, 131, 134, 147, 148, 152
#pragma constant_flag_ones 153, 154, 156, 157, 158, 159
#pragma argument_flag 0
#pragma argument_flag_ones 190, 210, 227, 235, 257, 288, 290, 295, 403, 428
#pragma argument_flag_ones 430, 464, 465, 466, 474, 476, 479, 481, 525, 528
#pragma argument_flag_ones 532, 533, 537, 540, 563, 574, 582, 589, 590, 591
#pragma argument_flag_ones 594, 595, 596, 635, 645, 651, 652, 653, 659, 669
#pragma argument_flag_ones 675, 676, 677, 683, 693, 699, 700, 701, 716, 731
#pragma argument_flag_ones 737, 738, 744, 752, 805, 982
#include "common.h"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>

#include <cmath>
#include <cstdlib>

#include "camera.hpp"
#include "character.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "renderinfo.hpp"
#include "sound.hpp"
#include "texture.hpp"
#include "title/script.hpp"

typedef MOTION_INFO tagMOTION_KEY;

extern CSound CSnd;

/* Spelled here rather than reached through a header because the image holds it only as an
   anonymous pooled constant, which is what a macro gives and a file-scope object does not. */
#define PI 3.14159265358979323846

/* The rectangle a texture transfer takes, declared here rather than reached through rect.h for the
   reason op_b.cpp declares its own: rect.h's four-argument constructor assigns h, w, y and x in
   that order and every rectangle this file builds assigns them the other way round. The default
   constructor keeps rect.h's order and is not dead code — the effect parameter block below carries
   one as a member, so it runs wherever a caller builds that block. */
template <class T>
class CRect {
public:
    CRect() {
        h = 0;
        w = 0;
        y = 0;
        x = 0;
    }

    CRect(T x_, T y_, T w_, T h_) {
        x = x_;
        y = y_;
        w = w_;
        h = h_;
    }

    T x;
    T y;
    T w;
    T h;
} __attribute__((aligned(16)));

/* One row of the table a map sorts its scenery by, and one piece of scenery. Both are another
   unit's to type; this file holds three maps and so has to construct them, which is what needs
   their extents and their constructors and nothing else. */
class CategoryAttr {
public:
    CategoryAttr();

    char unk_00[24];
};

class CMapObject {
public:
    CMapObject();

    char unk_00[240];
} __attribute__((aligned(16)));

/* The scene's own map, of which this file keeps three — the ground, the buildings standing on it
   and a second set of buildings nothing here draws. Initialize is called from the constructor
   rather than by the scene, which is why the three are ready before OpA_InitProcess clears them. */
class CMap {
public:
    CMap() { Initialize(); }

    void Initialize();
    void Draw();

    CategoryAttr category[16];
    CMapObject object[10];
    char unread0[16];
};

/* The scene's one fire, which is a light rather than a model. */
class CFireOmni {
public:
    CFireOmni();

    void FireStep();
    void FireCreate();
    void DrawFire(int unknown0, int unknown1, CCamera *camera, float *eye, float scale,
                  int unknown2, float unknown3);

    char unk_00[32];
    sceVu0FVECTOR pos;
    char unk_30[16];
};

/* One particle of the smoke the chimney gives off, and the pool the group hands them out of. Both
   classes are another unit's to type; this file only sizes the pool and names the group. */
class CEffect;
class CEffectParam;

class CEffectGroup {
public:
    CEffectGroup() { Initialize(0, 0); }

    void Initialize(CEffect *table, int max);
    void Clear();
    void EnterEffect(CEffectParam *param);
    void Step(int unknown0);
    void Draw();

    char unk_00[8];
};

/* What one particle is entered with. Only the fields the smoke sets are named; the rectangle is a
   member rather than filler because the block's own construction zeroes it. */
class CEffectParam {
public:
    CEffectParam() {}

    void Initialize();

    int life;
    int kind;
    float unk_08;
    float draw_on2;
    char unk_10[16];
    sceVu0FVECTOR pos;
    char unk_30[4];
    float spin;
    char unk_38[24];
    float scale;
    char unk_54[12];
    float spin_step;
    char unk_64[28];
    float alpha_step;
    float alpha_step2;
    char unk_88[40];
    int draw_on76;
    int draw_on80;
    float grow;
    CTexture *texture;
    CRect<int> rect;
    char unread6[4];
    int fade;
    char unread7[8];
};

/* One actor's face, as this scene animates it. The eyes and the mouth are two strips of frames
   stacked bottom-up in one 256-wide texture — the eyes down the left half and the mouth down the
   right — and a tick copies the current frame of each over the plate the model draws with. The two
   offsets are measured from the bottom edge of the plate; the blink state is kept here because this
   scene blinks the cast on a clock of its own rather than from the script. */
struct FACE_INFO {
    char *plate;
    char *strip;
    int eye_bottom;
    int eye_height;
    int mouth_bottom;
    int mouth_height;
    int eye;
    int mouth;
    int strip_bottom;
    int eye_max;
    int blink;
};

/* One looping object animation the scene's configuration file registers: a frame is found by name
   and then driven between two motion numbers at a rate, with a scale and a position offset of its
   own. Only the extent is read here — this file plays the table and never builds a row of it. */
class OBJ_ANIME_SEQ {
public:
    OBJ_ANIME_SEQ();

    void Initialize();

    char name[16];
    int motion_start;
    int motion_end;
    char unk_18[8];
    sceVu0FVECTOR scale;
    sceVu0FVECTOR pos;
    float unk_40;
    float draw_on;
    float step;
    char unk_4C[60];
};

void wait_now_loading_vsync();
void OPAnalyz(char *name);
void OPMdsLoad();
void OpPlayVolSE(int group, int no, int voice, float volume);
void OpPlayVolPanSE(float *position, float near_dist, float far_dist, int group, int no,
                    int voice);
void OpSetVolPanSE(float *position, float near_dist, float far_dist, int group, int no,
                   int voice);
void OpBgmPlay();
void ObjAnimePlay(OBJ_ANIME_SEQ *sequence);
void MoveImageTest(sceVif1Packet *packet, int sbp, int sbw, int spsm, const CRect<int> &rect,
                   int dbp, int dbw, int dpsm, int dsax, int dsay, int dir);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &src,
                 const CRect<int> &dst, u_char alpha);
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetAmbient(float *color);
void MGGetAmbient(float *color);
void MGDraw(CFrame *frame);
sceVif1Packet *GetVif1Packet();
void DepthOfField(float *dist, int level, int alpha, int blur);

extern sceVif1Packet *Vif1Packet;
extern sceGifTag GiftagAD;
extern u_int *read_buffer;
extern CCharacter Chara[23];
extern CCharacter Cam[3];
extern char CharaTex[23];
extern CDataAlloc2<1> CharaDataBuffer[7];
extern CDataAlloc2<1> MapDataBuffer;
extern int OpBgmSqPort;
extern CCamera OP_MainCamera;
extern RenderInfo mgRenderInfo;
extern sceVu0FVECTOR ambientlight;
extern sceVu0FMATRIX light;
extern sceVu0FMATRIX lightcolor;
extern int SceneNp;
extern int Pause;

static void LoadTexture();
static void LoadData();
static void SetDanceMotion();
static void InitDancerPos();
static void DrawCloud();
static void SmokeProcess();
static void MoveDancers();
static void ReaderShadow();
static void DancerShadow();
static void ShogunShadow();
static void ShisaiShadow();
static void DrawShadow(float x, float y, float z);
static void setTexScroll();
static void setCloudTexScroll();
/* op_b.cpp owns these three; retail has this unit call across to them. */
void FaceChange(int no);
void LoadCharaData(int kind, int no);
void LoadMotionData();

/* Each of the couple's motion files is one key range — the frame it starts at and the frame it ends
   at — written straight over the character's own first key, so that a file loaded in the background
   takes over without the motion driver being told anything. */
tagMOTION_KEY noroi[10] = {
    {100, 750, 0.5f, 0},
    {201, 533, 0.5f, 0},
    {103, 798, 0.5f, 0},
    {136, 777, 0.5f, 0},
    {1, 352, 0.5f, 0},
    {50, 628, 0.5f, 0},
    {195, 843, 0.5f, 0},
    {103, 675, 0.5f, 0},
    {139, 542, 0.5f, 0},
    {298, 747, 0.5f, 0}};

tagMOTION_KEY dancer[10] = {
    {12, 536, 0.5f, 0},
    {209, 541, 0.5f, 0},
    {111, 806, 0.5f, 0},
    {126, 767, 0.5f, 0},
    {1, 352, 0.5f, 0},
    {1, 628, 0.5f, 0},
    {145, 793, 0.5f, 0},
    {92, 670, 0.5f, 0},
    {139, 542, 0.5f, 0},
    {327, 782, 0.5f, 0}};

/* The scene's own world, and the objects the configuration file fills in. Both frame pointers are
   typed from the loader that writes them rather than from anything here: title/opdata assigns
   LoadCollisionFile's and LoadMDSFile's results to them, and nothing in this file reads either. */
CMap OP_BuildingMap;
CMap OP_BuildingMap2;
CMap OP_GroundMap;
OBJ_ANIME_SEQ OP_AnimeSeq[32];
int OP_AnimeSeqRot;
int OP_FireList;
sceVu0FVECTOR OP_FirePosition[96];
float OP_FireScale[96];
int OP_FireFlg[96];
CFrameVu1 *OP_GroundCol;
CFrameVu1 *OP_SkyFrame;
CFrame *OP_CharaFrame;
char CloudFlag;

CFireOmni CFire;
static sceVu0FVECTOR DancerPos[35];
static sceVu0FVECTOR DancerRot[35];
static CCharacter Cloud;

static CFrameVu1 *Shadow;
static float DancerAmb;
static CEffectGroup Smoke;
static CEffect *EffectTable;
static float DanceWait;
int DanceCnt;
int DanceStart;

/* The dungeon square's set-up. The two maps are cleared first because this scene is placed from a
   configuration file rather than from a table of its own, and the couple's second motion files are
   started in the background so that the first change of step does not wait for a read. */
void OpA_InitProcess() {
    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();
    OPAnalyz("opdat/opinfo.cfg");
    LoadTexture();
    OPMdsLoad();
    LoadFile("opdat/dungeon/dungeon.pak", read_buffer, 0);
    wait_now_loading_vsync();
    LoadData();
    CSnd.SetReverb(0, 4, 80);
    CSnd.SetReverb(1, 4, 60);
    CSnd.LoadSoundFileFromPack("o01a.txt", read_buffer);
    CSnd.SetVol(15, 256);
    CSnd.SetVol(14, 256);
    CSnd.SetVol(13, 256);
    CSnd.SetVol(12, 256);
    CSnd.SE_Play(15, 16, 20, 0, 0);
    wait_now_loading_vsync();
    SetDanceMotion();
    LoadFile("opdat/chara/01p19a1b.chr", (void *) ((char *) read_buffer + 0x10C900), 0);
    LoadFile("opdat/chara/01p17a1b.chr", (void *) read_buffer, 0);
    StartReadBG();
    DanceWait = 0.0f;
    DanceCnt = 1;
    DanceStart = 0;
    CloudFlag = 0;
}

/* The scene's textures. Four rows name the fixed surfaces the registry keeps for every scene and
   the twenty-five after them are filled in by name from the pack this function reads; the empty
   name at the end is what states where the table stops. */
static void LoadTexture() {
    LOADTEXTURE_INFO2 tex[] = {
        {"#blender#640#224#4", 0, 0},
        {"#fontbase#512#256#1", 26, 0},
        {"#fukidashibase#640#224#4", 26, 0},
        {"#frame_image#640#224#4", 22, 0},
        {0, 26, 0},
        {0, 26, 0},
        {0, 26, 0},
        {0, 1, 0},
        {0, 1, 0},
        {0, 6, 1},
        {0, 2, 0},
        {0, 4, 0},
        {0, 4, 0},
        {0, 3, 0},
        {0, 3, 0},
        {0, 5, 0},
        {0, 5, 0},
        {0, 7, 0},
        {0, 8, 0},
        {0, 8, 0},
        {0, 8, 0},
        {0, 10, 0},
        {0, 10, 0},
        {0, 11, 0},
        {0, 0, 0},
        {0, 19, 0},
        {0, 19, 0},
        {0, 19, 0},
        {0, 6, 0},
        {"", 0, 0}};

    TexManager.Initialize(16352);
    LoadFile("opdat/dungeon/dungeon.pim", (void *) read_buffer, 0);

    tex[4].name = (char *) GetPackFile(read_buffer, "gaiji.img", 0);
    tex[5].name = (char *) GetPackFile(read_buffer, "fuki256.img", 0);
    tex[6].name = (char *) GetPackFile(read_buffer, "syst04.img", 0);
    tex[7].name = (char *) GetPackFile(read_buffer, "c07a01.img", 0);
    tex[8].name = (char *) GetPackFile(read_buffer, "c07a01an.img", 0);
    tex[9].name = (char *) GetPackFile(read_buffer, "p17a01.img", 0);
    tex[10].name = (char *) GetPackFile(read_buffer, "c08a01.img", 0);
    tex[11].name = (char *) GetPackFile(read_buffer, "c09a01.img", 0);
    tex[12].name = (char *) GetPackFile(read_buffer, "c09a01an.img", 0);
    tex[13].name = (char *) GetPackFile(read_buffer, "c11a01.img", 0);
    tex[14].name = (char *) GetPackFile(read_buffer, "c11a01an.img", 0);
    tex[15].name = (char *) GetPackFile(read_buffer, "p19a01.img", 0);
    tex[16].name = (char *) GetPackFile(read_buffer, "p19a01an.img", 0);
    tex[17].name = (char *) GetPackFile(read_buffer, "ex.img", 0);
    tex[18].name = (char *) GetPackFile(read_buffer, "cloud.img", 0);
    tex[19].name = (char *) GetPackFile(read_buffer, "cloudan.img", 0);
    tex[20].name = (char *) GetPackFile(read_buffer, "cloud2.img", 0);
    tex[21].name = (char *) GetPackFile(read_buffer, "i01t01.img", 0);
    tex[22].name = (char *) GetPackFile(read_buffer, "i01t02.img", 0);
    tex[23].name = (char *) GetPackFile(read_buffer, "e01s01.img", 0);
    tex[24].name = (char *) GetPackFile(read_buffer, "fire.img", 0);
    tex[25].name = (char *) GetPackFile(read_buffer, "pause.img", 0);
    tex[26].name = (char *) GetPackFile(read_buffer, "pause_e.img", 0);
    tex[27].name = (char *) GetPackFile(read_buffer, "start2.img", 0);
    tex[28].name = (char *) GetPackFile(read_buffer, "ashikage.img", 0);

    TexManager.LoadTextureBlock(-1, tex);

    CharaTex[0] = 1;
    CharaTex[1] = 2;
    CharaTex[4] = 2;
    CharaTex[5] = 2;
    CharaTex[3] = 4;
    CharaTex[2] = 3;
    CharaTex[6] = 5;
    CharaTex[7] = 6;
}

/* The scene's actors. The four in the table are the townspeople around the square, the two after
   them are the couple the scene is about, and the last two are the sky the square is drawn under
   and the one shadow every one of them is drawn onto. */
static void LoadData() {
    char *name[4] = {"01c07a.cfg", "01c08a.cfg", "01c11a.cfg", "01c09a.cfg"};

    for (int i = 0; i < 4; i++) {
        Chara[i].LoadPackData(read_buffer, name[i], CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[i].frame->SetAttr(attr, 1, 4);
        Chara[i].motion_type.state.time = 10.0f;
        Chara[i].motion_type.state.unk_08 = 0.05f;
        Chara[i].motion_type.state.motion_no = 0;
        Chara[i].motion_type.state.playing_no = 0;
    }

    Chara[1].motion_type.state.time = 115.0f;

    wait_now_loading_vsync();

    Chara[6].Initialize();
    Chara[6].frame = LoadMDSFile(GetPackFile(read_buffer, "01p19a.mds", 0), &CharaDataBuffer[4],
                                 6, 0, 0);

    CFrameAttr noroi_attr;

    noroi_attr.unk_08 = 0;
    Chara[6].frame->SetAttr(noroi_attr, 1, 4);

    wait_now_loading_vsync();

    Chara[7].Initialize();
    Chara[7].frame = LoadMDSFile(GetPackFile(read_buffer, "01p17a.mds", 0), &CharaDataBuffer[4],
                                 6, 0, 0);

    CFrameAttr dancer_attr;

    dancer_attr.unk_08 = 0;
    Chara[7].frame->SetAttr(dancer_attr, 1, 4);

    float scale[4] = {4.5f, 1.0f, 4.5f, 0.0f};

    Chara[7].frame->SearchFrame("body")->ScaleBoundBox(scale);

    InitDancerPos();

    wait_now_loading_vsync();

    Cloud.frame = LoadMDSFile(GetPackFile(read_buffer, "01cloud.mds", 0), 2, 0);
    Cloud.SetPosition(0.0f, 50.0f, 20.0f);

    EffectTable = (CEffect *) MapDataBuffer.Alloc(12800);
    Smoke.Initialize(EffectTable, 50);
    Smoke.Clear();

    Shadow = LoadMDSFile(GetPackFile(read_buffer, "ashikage.mds", 0), 2, 0);
}

/* The couple's first dance step. Each takes its motion file's own first key range, which is what
   the background loader then advances one file at a time. */
static void SetDanceMotion() {
    LoadFile("opdat/chara/01p19a1a.chr", (void *) read_buffer, 0);
    Chara[6].LoadPackData(read_buffer, "01p19a1a.cfg", &CharaDataBuffer[4],
                          &CharaDataBuffer[6], 0);
    Chara[6].motion_type.state.time = 120.0f;
    Chara[6].motion_type.state.unk_08 = 0.1f;
    Chara[6].motion_type.state.motion_no = 0;
    Chara[6].motion_type.state.playing_no = 0;
    Chara[6].motion_type.motion_info->start = noroi[0].start;
    Chara[6].motion_type.motion_info->end = noroi[0].end;

    LoadFile("opdat/chara/01p17a1a.chr", (void *) read_buffer, 0);
    Chara[7].LoadPackData(read_buffer, "01p17a1a.cfg", &CharaDataBuffer[4],
                          &CharaDataBuffer[6], 0);
    Chara[7].motion_type.state.time = 1.0f;
    Chara[7].motion_type.state.unk_08 = 0.1f;
    Chara[7].motion_type.state.motion_no = 0;
    Chara[7].motion_type.state.playing_no = 0;
    Chara[7].motion_type.motion_info->start = dancer[0].start;
    Chara[7].motion_type.motion_info->end = dancer[0].end;
}

/* Where the crowd stands, as the square was laid out: thirty-five places in tenths of a world unit
   across seven rows, every one of them facing the couple. */
static void InitDancerPos() {
    float pos[35][4] = {
        {3.0f, 0.0f, 27.0f, 0.0f},
        {0.0f, 0.0f, 27.0f, 0.0f},
        {-3.0f, 0.0f, 27.0f, 0.0f},
        {1.5f, 0.0f, 29.0f, 0.0f},
        {-1.5f, 0.0f, 29.0f, 0.0f},
        {4.5f, 0.0f, 29.0f, 0.0f},
        {-4.5f, 0.0f, 29.0f, 0.0f},
        {3.0f, 0.0f, 31.0f, 0.0f},
        {0.0f, 0.0f, 31.0f, 0.0f},
        {-3.0f, 0.0f, 31.0f, 0.0f},
        {1.5f, 0.0f, 33.0f, 0.0f},
        {-1.5f, 0.0f, 33.0f, 0.0f},
        {4.5f, 0.0f, 33.0f, 0.0f},
        {-4.5f, 0.0f, 33.0f, 0.0f},
        {3.0f, 0.0f, 35.0f, 0.0f},
        {0.0f, 0.0f, 35.0f, 0.0f},
        {-3.0f, 0.0f, 35.0f, 0.0f},
        {1.5f, 0.0f, 37.0f, 0.0f},
        {-1.5f, 0.0f, 37.0f, 0.0f},
        {4.5f, 0.0f, 37.0f, 0.0f},
        {-4.5f, 0.0f, 37.0f, 0.0f},
        {3.0f, 0.0f, 39.0f, 0.0f},
        {0.0f, 0.0f, 39.0f, 0.0f},
        {-3.0f, 0.0f, 39.0f, 0.0f},
        {1.5f, 0.0f, 41.0f, 0.0f},
        {-1.5f, 0.0f, 41.0f, 0.0f},
        {4.5f, 0.0f, 41.0f, 0.0f},
        {-4.5f, 0.0f, 41.0f, 0.0f},
        {3.0f, 0.0f, 43.0f, 0.0f},
        {0.0f, 0.0f, 43.0f, 0.0f},
        {-3.0f, 0.0f, 43.0f, 0.0f},
        {1.5f, 0.0f, 45.0f, 0.0f},
        {-1.5f, 0.0f, 45.0f, 0.0f},
        {4.5f, 0.0f, 45.0f, 0.0f},
        {-4.5f, 0.0f, 45.0f, 0.0f}};

    for (int i = 0; i < 35; i++) {
        DancerPos[i][0] = 10.0f * pos[i][0];
        DancerPos[i][1] = 10.0f * pos[i][1];
        DancerPos[i][2] = 10.0f + 10.0f * pos[i][2];
        DancerRot[i][0] = 0.0f;
        DancerRot[i][1] = PI;
        /* The third store repeats the first rather than clearing the roll, which is deliberate here
           and not a slip left in place: every row of the table has a zero roll already, so the
           line has no effect either way, and the code the compiler emits is not the same without
           it. */
        DancerRot[i][0] = 0.0f;
    }

    Chara[6].SetPosition(0.0f, 0.0f, 250.0f);
    Chara[6].SetRotation(0.0f, PI, 0.0f);
}

/* The tick's drawing, in the order the frame is built: the ground, the buildings standing on it,
   the townspeople, the couple, the crowd behind them, the fires, the sky and last the depth of
   field. The two ambients that fade are what makes the square go dark as the scene turns: one rides
   up over the buildings while the camera holds on them, the other rides the crowd down as the
   couple's motion runs out. */
void OpA_DrawProcess() {
    static sceVu0FVECTOR ambient = {0.0f, 0.0f, 0.0f, 0.0f};
    static int wait;
    sceVu0FVECTOR amb;

    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_GroundMap.Draw();
    TexManager.ReloadTexture(Vif1Packet, 11);

    if (!Pause) {
        setTexScroll();
    }

    if (CScript.camera_start != 44) {
        if (CScript.camera_start < 15 || CScript.camera_start >= 39) {
            OP_BuildingMap.Draw();
        }

        ambient[3] = 0.0f;
        wait = 0;
    } else {
        MGGetAmbient(amb);

        if (wait > 700) {
            if (ambient[3] < 128.0f) {
                ambient[3] += 0.1f;
            }
        } else {
            wait++;
        }

        MGSetAmbient(ambient);
        OP_BuildingMap.Draw();
        MGSetAmbient(amb);
    }

    for (int i = 0; i < 6; i++) {
        if (i != 1 && CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
            FaceChange(i);

            if (!Pause) {
                Chara[i].Step();
            }

            Chara[i].Draw();

            if (i == 2) {
                ShisaiShadow();
            }
            if (i == 3) {
                ShogunShadow();
            }
        }
    }

    if (CScript.obj[1].disp) {
        TexManager.ReloadTexture(Vif1Packet, CharaTex[1]);

        if (!Pause) {
            Chara[1].Step();
        }

        static float col = 0.0f;
        static float am = 0.0f;
        static int wait = 0;

        if (CScript.camera_start == 17) {
            static sceVu0FMATRIX lcolor;

            for (int i = 0; i < 3; i++) {
                if (lightcolor[i][0] > col) {
                    lcolor[i][0] = col;
                }
                if (lightcolor[i][1] > col) {
                    lcolor[i][1] = col;
                }
                if (lightcolor[i][2] > col) {
                    lcolor[i][2] = col;
                }
            }

            if (wait > 180) {
                if (col < 128.0f) {
                    col += 0.5f;
                }
            } else {
                wait++;
            }

            MGSetPLight(light, lcolor);

            sceVu0FVECTOR amb2 = {22.0f, 22.0f, 12.0f, 0.0f};

            amb2[3] = am;

            if (am < 128.0f) {
                am += 0.5f;
            }

            MGSetAmbient(amb2);
        } else {
            am = 0.0f;
            col = 0.0f;
            wait = 0;
        }

        Chara[1].Draw();
    }

    MGSetAmbient(ambientlight);
    MGSetPLight(light, lightcolor);

    sceVu0FVECTOR scene_amb;

    sceVu0CopyVector(scene_amb, ambientlight);

    if (CScript.camera_start == 44) {
        if (Cam[SceneNp].motion_type.state.time > 249.0f) {
            DancerAmb -= 0.2f;

            if (DancerAmb < 0.0f) {
                DancerAmb = 0.0f;
            }

            scene_amb[3] = DancerAmb;
        }
    } else {
        DancerAmb = 127.0f;
    }

    if (CScript.obj[6].disp && !Pause) {
        if (DanceWait < 2.0f || DanceWait > 480.0f) {
            Chara[6].Step();
            Chara[7].Step();
        }

        DanceWait += 1.0f;

        if (DanceWait > 10000) {
            DanceWait = 10000;
        }
    }

    if (CScript.obj[6].disp) {
        TexManager.ReloadTexture(Vif1Packet, CharaTex[6]);
        FaceChange(6);
        MGSetAmbient(scene_amb);
        Chara[6].Draw();
        ReaderShadow();
    }

    if (CScript.obj[7].disp) {
        TexManager.ReloadTexture(Vif1Packet, 6);
        Chara[7].SetPosition(DancerPos[0][0], DancerPos[0][1], DancerPos[0][2]);
        Chara[7].SetRotation(DancerRot[0][0], DancerRot[0][1], DancerRot[0][2]);
        MGSetAmbient(scene_amb);
        Chara[7].Draw();
        DancerShadow();

        int max;

        switch (CScript.camera_start) {
            case 0:
                max = 28;
                break;
            case 3:
                max = 30;
                break;
            case 7:
                max = 30;
                break;
            case 8:
                max = 30;
                break;
            case 9:
                max = 25;
                break;
            case 10:
                max = 15;
                break;
            case 39:
                max = 30;
                break;
            case 43:
                max = 30;
                break;
            case 45:
                max = 14;
                break;
            default:
                max = 35;
                break;
        }

        for (int i = 1; i < max; i++) {
            CFrame *frame = Chara[7].frame;

            frame->SetPosition(DancerPos[i][0], DancerPos[i][1], DancerPos[i][2]);
            frame->SetRotation(DancerRot[i][0], DancerRot[i][1], DancerRot[i][2]);
            MGSetAmbient(scene_amb);
            MGDraw(frame);
            DancerShadow();
        }
    }

    MGSetAmbient(ambientlight);

    sceVu0FVECTOR eye;

    TexManager.ReloadTexture(GetVif1Packet(), 0);
    OP_CharaFrame = Cam[SceneNp].frame;
    sceVu0CopyVector(eye, OP_CharaFrame->position);

    if (!Pause) {
        CFire.FireStep();
    }

    CFire.FireCreate();

    for (int i = 0; i < OP_FireList; i++) {
        float z = OP_FirePosition[i][2];
        float y = OP_FirePosition[i][1];
        float x = OP_FirePosition[i][0];

        CFire.pos[0] = 10.0f * x;
        CFire.pos[1] = 10.0f * y;
        CFire.pos[2] = 10.0f * z;
        CFire.pos[3] = 1.0f;
        CFire.DrawFire(1, 1, &OP_MainCamera, eye, OP_FireScale[i], 15, 15.0f);
    }

    DrawCloud();

    static float cnt = 1024.0f;
    static int sw = 0;

    if (CScript.sprite == 1) {
        TexManager.ReloadTexture(Vif1Packet, 7);

        int alpha = (int) (128.0f - cnt / 4.0f);

        if (alpha < 0) {
            alpha = 0;
        }

        set2DSprite(GetVif1Packet(), TexManager.GetTexture("ex", -1),
                    CRect<int>((int) (272.0f - cnt / 2.0f), (int) (10.0f - cnt / 2.0f),
                               (int) (128.0f + cnt), (int) (128.0f + cnt)),
                    CRect<int>(0, 0, 128, 128), (u_char) alpha);

        if (sw == 0) {
            cnt -= cnt / 2.0f;

            if (cnt < 2.0f) {
                sw = 1;
            }
        } else {
            cnt += cnt / 2.0f;

            if (cnt > 16.0f) {
                sw = 0;
            }
        }
    } else {
        cnt = 1024.0f;
        sw = 0;
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    switch (CScript.camera_start) {
        case 0:
        case 43:
        case 45:
        case 47:
            break;
        case 3:
        case 10:
        case 24:
        case 25: {
            float dof[] = {50.0f};

            DepthOfField(dof, 1, 56, 0);
        } break;
        default: {
            float dof[2] = {200.0f, 400.0f};

            /* These dead values preserve the following sky pass's argument-selection state. */
            float drawPhase0 = 0.0f, drawPhase1 = 0.0f, drawPhase2 = 0.0f, drawPhase3 = 0.0f,
                  drawPhase4 = 0.0f, drawPhase5 = 0.0f, drawPhase6 = 0.0f, drawPhase7 = 0.0f;
            DepthOfField(dof, 2, 40, 0);
        } break;
    }
}

/* The sky, which is one model turned inside out and scrolled rather than a backdrop. It grows from
   nothing over the first few seconds of the scene it belongs to and its own ambient rides up with
   it, so the sky arrives before the square does. */
static void DrawCloud() {
    static sceVu0FVECTOR ambient = {0.0f, 0.0f, 0.0f, 0.0f};
    static float sc = 0.0f;

    if (CScript.sprite == 2) {
        CloudFlag = 1;
    }

    if (CloudFlag == 1) {
        TexManager.ReloadTexture(Vif1Packet, 8);

        if (!Pause) {
            setCloudTexScroll();
        }

        Cloud.frame->SetScale(sc, sc, sc);

        if (CScript.camera_start == 44 || CScript.camera_start == 16) {
            Cloud.SetPosition(0.0f, 30.0f, -10.0f);
            Cloud.SetRotation(0.0f, PI, 0.0f);
        } else {
            Cloud.SetPosition(0.0f, 50.0f, 15.0f);
            Cloud.SetRotation(0.0f, 0.0f, 0.0f);
        }

        sceVu0FVECTOR amb;

        MGGetAmbient(amb);
        MGSetAmbient(ambient);
        Cloud.Draw();
        SmokeProcess();
        MGSetAmbient(amb);

        if (!Pause) {
            if (sc < 1.0) {
                sc = 0.005f + sc;
            }

            if (ambient[3] < 80.0f) {
                ambient[3] += 1.0f;
            }
        }
    } else {
        sc = 0.0f;
        ambient[3] = 0.0f;
    }
}

/* The chimney smoke. One particle is entered every eighth tick, with its speed, its spin and how
   far it drifts taken from the random generator so that no two rise the same way, and a second one
   at a fixed place beside it. */
static void SmokeProcess() {
    static int cnt = 0;

    cnt++;

    if (cnt > 7) {
        cnt = 0;
    }

    CEffectParam param;

    param.Initialize();

    if (cnt == 0) {
        sceVu0FVECTOR from = {0.0f, 80.0f, 22.0f, 1.0f};
        sceVu0FVECTOR from2 = {-30.0f, 100.0f, 30.0f, 1.0f};

        if (CScript.camera_start != 19) {
            sceVu0CopyVector(param.pos, from);
        } else {
            sceVu0CopyVector(param.pos, from2);
        }

        param.kind = 1;
        param.scale = 0.5f * (float) rand() / 2147483648.0f;
        param.spin_step = (float) PI / (20.0f + (float) (rand() * 10) / 2147483648.0f);
        param.draw_on76 = 2;
        param.draw_on80 = 2;
        param.grow = 0.07f;
        param.spin = 1.5f + 0.2f * (float) rand() / 2147483648.0f;
        param.alpha_step = 0.04f;
        param.alpha_step2 = 0.04f;
        param.life = 120;
        param.texture = TexManager.GetTexture("cloud2", -1);
        param.rect = CRect<int>(0, 0, 128, 128);
        param.unk_08 = 30.0f;
        param.draw_on2 = 13.0f;
        param.fade = 60;
        Smoke.EnterEffect(&param);
    }

    Smoke.Step(1);
    Smoke.Draw();

    if (cnt == 0) {
        sceVu0FVECTOR from3 = {0.0f, 50.0f, -17.0f, 1.0f};

        sceVu0CopyVector(param.pos, from3);
        Smoke.EnterEffect(&param);
    }

    /* These dead values preserve the following motion pass's argument-selection state. */
    float motionPhase0 = 0.0f, motionPhase1 = 0.0f, motionPhase2 = 0.0f, motionPhase3 = 0.0f,
          motionPhase4 = 0.0f, motionPhase5 = 0.0f, motionPhase6 = 0.0f, motionPhase7 = 0.0f,
          motionPhase8 = 0.0f, motionPhase9 = 0.0f, motionPhase10 = 0.0f;
    Smoke.Draw();
}

/* The tick's motion. The projection is re-set first because the camera passes through the scenery
   in some of the shots and the near plane has to move with it; the camera is then shaken by a
   random tenth of a unit on each axis for the shots that want it. After that every actor takes what
   the script last asked of it, and the ones the camera's own frame tree carries take their place
   from it instead. */
void OpA_MotionProcess() {
    switch (CScript.camera_start) {
        case 2:
        case 3:
        case 15:
            MGSetRenderInfo(mgRenderInfo.scale[0], 10.0f, 0xffff);
            break;
        case 37: {
            /* The scoped middle arms and folded constants preserve their shared materialisation order. */
            MGSetRenderInfo(mgRenderInfo.scale[0], (float) ((1 << 3) + 2), (0x10000 - 1));
            break;
        }
        case 0:
        case 39: {
            MGSetRenderInfo(mgRenderInfo.scale[0], 16.0f, 0xffff);
            break;
        }
        case 40:
        case 41:
        case 42:
        case 48: {
            MGSetRenderInfo(mgRenderInfo.scale[0], 18.0f, 0xffff);
            break;
        }
        default:
            MGSetRenderInfo(mgRenderInfo.scale[0], 6.0f, 0xffff);
            break;
    }

    bool shake = false;
    static int d;

    switch (CScript.camera_start) {
        case 15:
            shake = true;
            d = 3;
            break;
        case 14:
        case 16:
        case 17:
            shake = true;
            d = 10;
            break;
        case 18:
            if (Cam[SceneNp].motion_type.state.time < 56.0f) {
                shake = true;
                d = 15;
            }
            break;
        case 44:
            if (CloudFlag == 1) {
                shake = true;
                d = 5;
            }
            break;
    }

    if (shake) {
        sceVu0FVECTOR ref;

        OP_MainCamera.GetRef(ref);
        ref[0] += (float) (rand() % d) / 10.0f;
        ref[1] += (float) (rand() % d) / 10.0f;
        ref[2] += (float) (rand() % d) / 10.0f;
        OP_MainCamera.SetRef(ref);
    }

    for (int i = 0; i < OP_AnimeSeqRot; i++) {
        ObjAnimePlay(&OP_AnimeSeq[i]);
    }

    for (int i = 0; i < 6; i++) {
        if (CScript.obj[i].disp) {
            if (CScript.obj[i].motion_end != -1) {
                if (Chara[i].motion_type.state.time >
                    (float) (Chara[i].motion_type.motion_info[CScript.obj[i].motion].end - 1)) {
                    CScript.obj[i].motion = CScript.obj[i].motion_end;
                    CScript.obj[i].motion_end = -1;
                }
            }

            Chara[i].motion_type.state.unk_08 = CScript.obj[i].step;

            if (CScript.obj[i].step == 1.0f) {
                if (CScript.obj[i].motion != Chara[i].motion_no) {
                    Chara[i].motion_type.state.time =
                        (float) Chara[i].motion_type.motion_info[CScript.obj[i].motion].start;
                    Chara[i].motion_no = CScript.obj[i].motion;
                    Chara[i].flags = 4;
                    Chara[i].motion_speed = -1.0f;
                } else {
                    Chara[i].motion_no = CScript.obj[i].motion;
                    Chara[i].flags = 0;
                    Chara[i].motion_speed = -1.0f;
                }
            } else {
                Chara[i].motion_no = CScript.obj[i].motion;
                Chara[i].flags = 0;
                Chara[i].motion_speed = -1.0f;
            }
        }
    }

    if (CScript.obj[6].disp) {
        LoadMotionData();
    }

    char *name[23] = {"c07a", "c08a", "c11a", "c09a", "c08a", "c08c", "p19a", "p17a", 0, 0, 0, 0,
                      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    sceVu0FMATRIX matrix;

    for (int i = 0; i < 8; i++) {
        if (CScript.obj[i].disp && CScript.obj[i].move_req) {
            CFrame *frame = Cam[SceneNp].frame->SearchFrame(name[i]);

            if (frame) {
                frame->GetLWMatrix(matrix);

                if (i == 6) {
                    Chara[i].SetRotation(0.0f, (float) (atan2f(matrix[2][0], matrix[2][2]) + PI),
                                         0.0f);
                } else if (i == 5) {
                    float a = atan2f(-matrix[2][1], matrix[2][2]);

                    if (a > 3.14f) {
                        a -= 6.28f;
                    }
                    if (a < -3.14f) {
                        a += 6.28f;
                    }

                    Chara[i].SetRotation(a, atan2f(matrix[2][0], matrix[2][2]), 0.0f);
                } else {
                    Chara[i].SetRotation(0.0f, atan2f(matrix[2][0], matrix[2][2]), 0.0f);
                }

                if (i == 2 && CScript.camera_start == 36) {
                    static float f;

                    if (Chara[i].motion_type.state.time > 345 &&
                        Chara[i].motion_type.state.time < 350.0f) {
                        f = 1.5f;
                    } else if (Chara[i].motion_type.state.time >= 350.0f) {
                        if (f > 0.0f) {
                            f -= 0.1f;
                        }
                    } else {
                        f = 0.0f;
                    }

                    float x = matrix[3][0];
                    float y = matrix[3][1] - f;
                    float z = matrix[3][2];

                    Chara[i].SetPosition(x, y, z);
                } else {
                    float x = matrix[3][0];
                    float y = matrix[3][1];
                    float z = matrix[3][2];

                    Chara[i].SetPosition(x, y, z);
                }
            }
        }
    }

    if (CScript.obj[6].disp) {
        MoveDancers();
    }

    for (int i = 0; i < 23; i++) {
        if (CScript.obj[i].load != -1) {
            LoadCharaData(CScript.obj[i].load, i);
        }
    }
}

/* Where the crowd stands once the scene is running: thirty-five frames in the camera's own model,
   one per place, so the whole square was animated in the same file as the camera move. */
static void MoveDancers() {
    char *name[35] = {"p17a1", "p17a2", "p17a3", "p17a4", "p17a5", "p17a6", "p17a7", "p17a8",
                      "p17a9", "p17a10", "p17a11", "p17a12", "p17a13", "p17a14", "p17a15",
                      "p17a16", "p17a17", "p17a18", "p17a19", "p17a20", "p17a21", "p17a22",
                      "p17a23", "p17a24", "p17a25", "p17a26", "p17a27", "p17a28", "p17a29",
                      "p17a30", "p17a31", "p17a32", "p17a33", "p17a34", "p17a35"};
    sceVu0FMATRIX matrix;

    if (CScript.obj[7].move_req) {
        for (int i = 0; i < 35; i++) {
            CFrame *frame = Cam[SceneNp].frame->SearchFrame(name[i]);

            if (frame) {
                frame->GetLWMatrix(matrix);
                DancerPos[i][0] = matrix[3][0];
                DancerPos[i][1] = matrix[3][1];
                DancerPos[i][2] = matrix[3][2];
                DancerRot[i][0] = 0.0f;
                DancerRot[i][1] = (float) (atan2f(matrix[2][0], matrix[2][2]) + PI);
                DancerRot[i][2] = 0.0f;
            }
        }
    }
}

/* The couple's own shadows, which are a pair each because a dancer's two feet move apart: the
   effect frames the model carries are found by name and one shadow is drawn under each. */
static void ReaderShadow() {
    sceVu0FMATRIX matrix;

    TexManager.ReloadTexture(Vif1Packet, 6);

    CFrame *frame = Chara[6].frame->SearchFrame("eff20");

    if (frame) {
        frame->GetLWMatrix(matrix);
        DrawShadow(matrix[3][0], matrix[3][1], matrix[3][2]);
    }

    frame = Chara[6].frame->SearchFrame("eff14");

    if (frame) {
        frame->GetLWMatrix(matrix);
        DrawShadow(matrix[3][0], matrix[3][1], matrix[3][2]);
    }
}

static void DancerShadow() {
    sceVu0FMATRIX matrix;
    float *z;
    float *y;
    float *x;
    float xv;
    float yv;
    float zv;

    // The addresses stay valid when the second lookup replaces the matrix, so only the values
    // need to be loaded again.
    Chara[7].frame->SearchFrame("r_foot")->GetLWMatrix(matrix);
    x = &matrix[3][0];
    xv = *x;
    y = &matrix[3][1];
    yv = *y;
    z = &matrix[3][2];
    zv = *z;
    DrawShadow(xv, yv, zv);
    Chara[7].frame->SearchFrame("l_foot")->GetLWMatrix(matrix);
    xv = *x;
    yv = *y;
    zv = *z;
    DrawShadow(xv, yv, zv);
}

static void ShogunShadow() {
    sceVu0FMATRIX matrix;
    float *z;
    float *y;
    float *x;
    float xv;
    float yv;
    float zv;

    // Both effect frames write the same matrix storage, so the coordinate addresses are shared.
    TexManager.ReloadTexture(Vif1Packet, 6);
    Chara[3].frame->SearchFrame("eff66")->GetLWMatrix(matrix);
    x = &matrix[3][0];
    xv = *x;
    y = &matrix[3][1];
    yv = *y;
    z = &matrix[3][2];
    zv = *z;
    DrawShadow(xv, yv, zv);
    Chara[3].frame->SearchFrame("eff62")->GetLWMatrix(matrix);
    xv = *x;
    yv = *y;
    zv = *z;
    DrawShadow(xv, yv, zv);
}

static void ShisaiShadow() {
    sceVu0FMATRIX matrix;
    float *z;
    float *y;
    float *x;
    float xv;
    float yv;
    float zv;

    // Both effect frames write the same matrix storage, so the coordinate addresses are shared.
    TexManager.ReloadTexture(Vif1Packet, 6);
    Chara[2].frame->SearchFrame("eff93")->GetLWMatrix(matrix);
    x = &matrix[3][0];
    xv = *x;
    y = &matrix[3][1];
    yv = *y;
    z = &matrix[3][2];
    zv = *z;
    DrawShadow(xv, yv, zv);
    Chara[2].frame->SearchFrame("eff99")->GetLWMatrix(matrix);
    xv = *x;
    yv = *y;
    zv = *z;
    DrawShadow(xv, yv, zv);
}

/* One shadow, laid on the ground under the point it is given. It fades with height rather than
   being clipped, which is what lets a foot lift without the shadow following it up, and it is never
   brighter than the ambient the crowd is drawn at. */
static void DrawShadow(float x, float y, float z) {
    sceVu0FVECTOR ambient = {0.0f, 0.0f, 0.0f, 64.0f};

    ambient[3] -= 10.0f * y;

    if (ambient[3] > 0.0f) {
        if (ambient[3] > DancerAmb) {
            ambient[3] = DancerAmb;
        }

        MGSetAmbient(ambient);

        float rot = atan2f(x, z);

        Shadow->SetPosition(x, 0.05f, z);
        Shadow->SetRotation(89.0f * PI / 180.0f, rot, 0.0f);
        MGDraw(Shadow);
        MGSetAmbient(ambientlight);
    }
}

/* The tick's sound. The three footfalls are windows on an actor's own motion frame with a wait
   behind each, because a frame number is only inside its window for one tick at the motion's rate
   and the wait keeps a motion that stalls there from playing the step twice. The rest is the
   square's own ambience: the fountain from a fixed point, the wind while the sky is up, and the
   change of music the camera makes when it turns away. */
void OpA_SoundProcess() {
    /* These type-only names preserve the first footfall's argument-selection state. */
    typedef float SoundSetup0, SoundSetup1, SoundSetup2, SoundSetup3, SoundSetup4, SoundSetup5,
        SoundSetup6, SoundSetup7, SoundSetup8, SoundSetup9, SoundSetup10, SoundSetup11,
        SoundSetup12, SoundSetup13, SoundSetup14;
    static int mus = 0;

    if (DanceWait > 5.0f) {
        if (mus == 0) {
            OpBgmSqPort = 0;
            OpBgmPlay();
            mus = 1;
        }
    } else {
        mus = 0;
    }

    sceVu0FVECTOR campos;
    sceVu0FVECTOR pos;

    sceVu0CopyVector(pos, Chara[3].pos);
    OP_MainCamera.GetPos(campos);

    if (CScript.obj[3].motion == 1) {
        int frame = (int) Chara[3].motion_type.state.time;
        static int wait = 0;

        if (wait == 0) {
            if (frame > 38 && frame < 40) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 28);
                wait = 10;
            } else if (frame > 48 && frame < 50) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 29);
                wait = 10;
            }
        } else {
            wait--;
        }
    }

    if (CScript.obj[3].motion == 4) {
        int frame = (int) Chara[3].motion_type.state.time;
        static int wait = 0;

        if (wait == 0) {
            if (frame > 98 && frame < 100) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 28);
                wait = 10;
            } else if (frame > 108 && frame < 110) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 29);
                wait = 10;
            }
        } else {
            wait--;
        }
    }

    if (CScript.obj[3].motion == 10) {
        int frame = (int) Chara[3].motion_type.state.time;
        static int wait = 0;

        if (wait == 0) {
            if (frame > 228 && frame < 230) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 28);
                wait = 10;
            } else if (frame > 238 && frame < 240) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 29);
                wait = 10;
            }
        } else {
            wait--;
        }
    }

    if (CScript.obj[2].motion == 14) {
        int frame = (int) Chara[2].motion_type.state.time;
        static int wait = 0;

        if (wait == 0) {
            if (frame > 295 && frame < 297) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 28);
                wait = 5;
            } else if (frame > 298 && frame < 300) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 29);
                wait = 5;
            } else if (frame > 301 && frame < 303) {
                OpPlayVolPanSE(pos, 100.0f, 500.0f, 14, 21, 28);
                wait = 5;
            }
        } else {
            wait--;
        }
    }

    sceVu0FVECTOR fountain = {0.0f, 0.0f, 0.0f, 0.0f};

    OpSetVolPanSE(fountain, 200.0f, 500.0f, 15, 16, 20);

    static int seflg = 0;
    static int secnt = 0;
    static float vol = 128.0f;

    if (CloudFlag == 1) {
        if (seflg == 0) {
            OpPlayVolSE(15, 16, 28, 0.8f);
            seflg = 1;
        } else if (CScript.camera_start != 44) {
            sceVu0FVECTOR wind = {0.0f, 50.0f, 0.0f, 0.0f};

            OpSetVolPanSE(wind, 100.0f, 400.0f, 15, 16, 28);
        }
    } else {
        seflg = 0;
        secnt = 0;
        vol = 128.0f;
    }

    {
        static int flg = 0;

        if (CScript.camera_start == 44 && Cam[SceneNp].motion_type.state.time > 249.0) {
            if (flg == 0) {
                while (ReadBGSync())
                    ;
                LoadFileBG("opdat/dungeon/o1bbgm.snd", (u_long128 *) read_buffer, 0);
                flg = 1;
            }
        } else {
            flg = 0;
        }
    }

    {
        static int flg = 0;

        if (CScript.camera_start == 14) {
            if (flg == 0) {
                CSnd.Stop(0);
                CSnd.SetReverb(0, 4, 50);
                CSnd.LoadSoundFileFromPack("o01b.txt", read_buffer);
                OpBgmSqPort = 0;
                OpBgmPlay();
                flg = 1;
            }
        } else {
            flg = 0;
        }
    }
}

/* The waterfall behind the square. Its animation is a strip of frames in a texture of its own and
   the plate the world draws is another, so a tick is two local-to-local transfers that between them
   put one frame's worth of the strip over the plate with the seam moving down it; the texture cache
   is flushed first because the plate about to be overwritten is the one the previous tick drew
   from. */
static void setTexScroll() {
    static int setTexScrollCnt = 0;
    static float setTexScrollCntf = 0.0f;

    sceGifTag giftag = {0, 1, 0, 0, 0, 0, 1, SCE_GIF_PACKED_AD};
    CTexture *plate;
    CTexture *strip;
    int dbp;
    int sbp;
    int dbw;
    int sbw;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &giftag);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
    sceVif1PkTerminate(Vif1Packet);

    if (setTexScrollCntf <= 0.0f) {
        setTexScrollCntf = 126.0f;
    } else {
        setTexScrollCntf -= 0.5f;
    }

    setTexScrollCnt = (int) setTexScrollCntf;

    plate = TexManager.GetTexture("i01t06", -1);
    strip = TexManager.GetTexture("i01t06a", -1);

    if (plate == 0 || strip == 0) {
        return;
    }

    dbp = plate->tex0 & 0x3fff;
    sbp = strip->tex0 & 0x3fff;
    dbw = (plate->tex0 >> 14) & 0x3f;
    sbw = (strip->tex0 >> 14) & 0x3f;

    if (setTexScrollCnt != 128) {
        MoveImageTest(Vif1Packet, sbp, sbw, 0,
                      CRect<int>(0, setTexScrollCnt, 128, 128 - setTexScrollCnt),
                      dbp, dbw, 0, 0, 0, 0);
    }

    if (setTexScrollCnt != 0) {
        MoveImageTest(Vif1Packet, sbp, sbw, 0, CRect<int>(0, 0, 128, setTexScrollCnt), dbp, dbw,
                      0, 0, 128 - setTexScrollCnt, 0);
    }
}

/* The sky's own scroll, which is the same two transfers over the cloud plate. */
static void setCloudTexScroll() {
    static int setTexScrollCnt = 0;
    static float setTexScrollCntf = 0.0f;

    sceGifTag giftag = {0, 1, 0, 0, 0, 0, 1, SCE_GIF_PACKED_AD};
    CTexture *plate;
    CTexture *strip;
    int dbp;
    int sbp;
    int dbw;
    int sbw;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &giftag);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
    sceVif1PkTerminate(Vif1Packet);

    if (setTexScrollCntf <= 0.0f) {
        setTexScrollCntf = 126.0f;
    } else {
        setTexScrollCntf -= 0.5f;
    }

    setTexScrollCnt = (int) setTexScrollCntf;

    plate = TexManager.GetTexture("cloud", -1);
    strip = TexManager.GetTexture("cloudan", -1);

    if (plate == 0 || strip == 0) {
        return;
    }

    dbp = plate->tex0 & 0x3fff;
    sbp = strip->tex0 & 0x3fff;
    dbw = (plate->tex0 >> 14) & 0x3f;
    sbw = (strip->tex0 >> 14) & 0x3f;

    if (setTexScrollCnt != 128) {
        MoveImageTest(Vif1Packet, sbp, sbw, 0,
                      CRect<int>(0, setTexScrollCnt, 128, 128 - setTexScrollCnt),
                      dbp, dbw, 0, 0, 0, 0);
    }

    if (setTexScrollCnt != 0) {
        MoveImageTest(Vif1Packet, sbp, sbw, 0, CRect<int>(0, 0, 128, setTexScrollCnt), dbp, dbw,
                      0, 0, 128 - setTexScrollCnt, 0);
    }
}
