#pragma constant_flag 0
#pragma constant_flag_ones 11,14,15,17,22,25,26,30,34,35
#pragma constant_flag_ones 36,39,42,53,55,57,61,64,65,66
#pragma constant_flag_ones 67,69,70,71,81,83,86,90,95,97
#pragma constant_flag_ones 99,102,103,114,115,116,117,121,123,131
#pragma constant_flag_ones 132,134,135,136,137,138,142,143,149,151
#pragma constant_flag_ones 152,154,155,156,157,158,161,163,164,165
#pragma constant_flag_ones 174,179,180,181,186,191,192,193,194,196
#pragma constant_flag_ones 197,198,199,200,207,208,210,211,215,218
#pragma constant_flag_ones 223,224,226,227,228,234,249,252,258,261
#pragma constant_flag_ones 268,269,272,276,278,280,283,286,293,297
#pragma constant_flag_ones 301,302,303,305,306,307,308
#include "camera.hpp"
#include "character.hpp"
#include "dataalloc.hpp"
#include "common.h"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>
#include <cmath>
#include "mathutil.hpp"
#include "mds.hpp"
#include "mglib.hpp"
#include "renderinfo.hpp"
#include "title/bombeffect.hpp"
#include "title/majinbeem.hpp"
#include "title/script.hpp"
#include "sound.hpp"
#include <cstdlib>
#include "texture.hpp"
#include "vector.hpp"
#include "wind.hpp"

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
class CRect
{
public:
    CRect()
    {
        h = 0;
        w = 0;
        y = 0;
        x = 0;
    }
    CRect(T x_, T y_, T w_, T h_)
    {
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

/* The three classes this scene places in the world, declared here rather than reached through
   headers of their own because each is another unit's to type. Only the members this file touches
   are named; the extents are the sizes the executable gives the objects below. */

/* A frame parented to an object, which is what lets the world transform drive a model. */
class CObjectFrame : public CObject
{
public:
    virtual void FrameObjectOnOff(char* name, int on);
    virtual void Draw();

    void SetFrame(CFrameVu1* frame, int unknown0);
};

/* One piece of scenery. The scene builds a table of them, hands each its model, and drives them
   through the object dispatch like anything else in the world. */
class CMapObject : public CObjectFrame
{
public:
    CMapObject();

    virtual void Draw();

    void Initialize();
    void DrawShadow(int unknown0);

    char unk_00[36];
    CFrameVu1* lod_model;
    char unk_28[8];
    float lod_distance;
    int unk_34;
    int unk_38;
    char unk_3C[4];
};

/* The scene's one fire, which is a light rather than a model. */
class CFireOmni
{
public:
    CFireOmni();

    void FireStep();
    void FireCreate();
    void DrawFire(int unknown0, int unknown1, CCamera* camera, float* eye, float scale,
                  int unknown2, float unknown3);

    char unk_00[32];
    sceVu0FVECTOR position;
    char unk_30[16];
};

/* One piece of scenery as the scene was laid out: the model, the model its distant form is drawn
   from, where it stands in tenths of a world unit, and its heading in degrees. */
struct MAPOBJ_INFO
{
    char* name;
    char* lod_name;
    float position[3];
    float rotation[3];
};

/* The river the scene draws, which is a grid the file sizes and colours once and then shakes every
   tick. Another unit's class to type; only what this file calls and the extent are named. */
class RenderInfo;

class CWater
{
public:
    CWater();

    void SetVertex(float* a, float* b, float* c, float* d);
    void SetSize(int width, int height, CDataAlloc2<1>* buffer);
    void SetParam(float unknown0, float unknown1, float unknown2, float unknown3);
    void SetColor(u_char r, u_char g, u_char b, u_char a);
    void Shake(int x, int y, float force);
    void Hamon();
    void DrawVu1(RenderInfo* info, sceVif1Packet* packet, u_long128* buffer);

    char unk_00[176];
    CFrame frame;
    char unread1[16];
};

/* One looping object animation: a frame is found by name and then driven between two motion
   numbers at a rate, with a scale and a position offset of its own. */
class OBJ_ANIME_SEQ
{
public:
    OBJ_ANIME_SEQ();

    void Initialize();

    char name[16];
    int motion_start;
    int motion_end;
    char unk_18[8];
    sceVu0FVECTOR scale;
    sceVu0FVECTOR position;
    float unk_40;
    float unk_44;
    float step;
    char unk_4C[60];
};

/* One particle of the smoke this scene gives off, and the pool the group hands them out of. Both
   classes are another unit's to type; this file only sizes the pool and names the group. */
class CEffect;
class CEffectParam;

class CEffectGroup
{
public:
    CEffectGroup() { Initialize(0, 0); }

    void Initialize(CEffect* table, int max);
    void Clear();
    void EnterEffect(CEffectParam* param);
    void Step(int unknown0);
    void Draw();

    char unk_00[8];
};

/* What one particle is entered with. Only the fields the smoke sets are named; the rectangle is a
   member rather than filler because the block's own construction zeroes it. */
class CEffectParam
{
public:
    CEffectParam() {}

    void Initialize();

    int life;
    int kind;
    float unk_08;
    float unk_0C;
    char unk_10[16];
    sceVu0FVECTOR position;
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
    int unk_B0;
    int unk_B4;
    float grow;
    CTexture* texture;
    CRect<int> rect;
    char unread6[4];
    int fade;
    char unread7[8];
};

/* One actor's face, as this scene animates it. The eyes and the mouth are two strips of frames
   stacked bottom-up in one 256-wide texture — the eyes down the left half and the mouth down the
   right — and a tick copies the current frame of each over the plate the model draws with. The
   two offsets are measured from the bottom edge of the 128-pixel plate, and the two frame numbers
   are kept here rather than read from the script twice because the transfer needs them twice. */
struct FACE_INFO
{
    char* plate;
    char* strip;
    int eye_bottom;
    int eye_height;
    int mouth_bottom;
    int mouth_height;
    int eye;
    int mouth;
    int strip_bottom;
    int unk_24;
    int unk_28;
};

/* One sound the demon's rampage plays, timed against the scene's own tick count rather than against
   a motion. Only the first four fields are read here; the two after them are the row as the table
   was written and nothing reconstructed reaches them yet. */
struct SND_INFO
{
    int group;
    int no;
    int voice;
    int count;
    int unk_10;
    int unk_14;
};

void wait_now_loading_vsync();
void OPAnalyz(char* name);
void OPMdsLoad();
void OpPlayVolSE(int group, int no, int voice, float volume);
void OpPlayVolPanSE(float* position, float near_dist, float far_dist, int group, int no,
                    int voice);
void OpSetVolPanSE(float* position, float near_dist, float far_dist, int group, int no,
                   int voice);
void OpBgmPlay();
void InitObjAnime(CFrame* frame, OBJ_ANIME_SEQ* sequence);
void ObjAnimePlay(OBJ_ANIME_SEQ* sequence);
void SetFrameAttr(CFrame* frame, int attr);
void MoveImageTest(sceVif1Packet* packet, int sbp, int sbw, int spsm, const CRect<int>& rect,
                   int dbp, int dbw, int dpsm, int dsax, int dsay, int dir);
void set2DSprite(sceVif1Packet* packet, CTexture* texture, const CRect<int>& src,
                 const CRect<int>& dst, u_char r, u_char g, u_char b, u_char a);
float DistVector(float* from, float* to);
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetFogParm(float near_z, float far_z, u_char r, u_char g, u_char b, float far_fog,
                  float near_fog);
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetAmbient(float* color);
void MGDraw(CFrame* frame);
void MGSetGsZBUF(sceGsZbuf* zbuf);
void MGBeginDrawShadow(sceGsTex0 tex);
void MGEndDrawShadow(u_char alpha);
void MGGetFBuffTex(sceGsTex0* tex);
void MGGetFBuffBackTex(sceGsTex0* tex);
void MGMoveImage(sceGsTex0* dst, const CRect<int>& rect, sceGsTex0* src, int dsax, int dsay,
                 int dir);
sceVif1Packet* GetVif1Packet();
void DepthOfField(float* dist, int level, int alpha, int blur);

extern "C" char* strcpy(char* dst, const char* src);

extern sceVif1Packet* Vif1Packet;
extern sceGifTag GiftagAD;
extern sceGsZbuf mgZBuffer;
extern u_int* read_buffer;
extern CCharacter Chara[23];
extern CCharacter Cam[4];
extern char CharaTex[23];
extern CDataAlloc2<1> CharaDataBuffer[7];
extern CDataAlloc2<1> MapDataBuffer;
extern CDataAlloc2<1> WaterBuffer;
extern int OpBgmSqPort;
extern MOTION_INFO Op_MotionInfo;
extern int OP_FireList;
extern sceVu0FVECTOR OP_FirePosition[96];
extern float OP_FireScale[96];
extern int OP_FireFlg[96];
extern CCamera OP_MainCamera;
extern CFrame* OP_CharaFrame;
extern CMapObject OP_NornMapObj[76];
extern CMapObject OP_NornMapObj2[87];
extern sceVu0FVECTOR op_fogRate;
extern u_char op_fogColor[3];
extern RenderInfo mgRenderInfo;
extern sceVu0FVECTOR ambientlight;
extern sceVu0FMATRIX light;
extern sceVu0FMATRIX lightcolor;
extern int SceneNp;
extern int Pause;

static void MapLoad();
static void MapLoad2();
static void LoadCharaMajin();
static void DrawDancer();
static void InchikiShadow();
static void DrawShadow(int no, float x, float y, float z);
static void MajinBeemProcess();
static void SmokeProcess();
static void WaterProcess();
static int KageCheck(int no);
static void LightSet(float x, float y, float z, int chara);
static void setTexScroll();
static void setTexAnim();
void FaceChange(int no);
void FaceChangeD(int no);

static CFireOmni CFire;
static OBJ_ANIME_SEQ Fuusya[2];
static CWind Wind;
static CFrame* TaimatsuFrame[12];
static OBJ_ANIME_SEQ Taimatsu[12];
CWater Water;
static CMapObject OP_NornMapObj3[4];
static CBombEffect CBomb[3];
static CFrameVu1* DoransFuusya[2];
static CEffect* EffectTable;
static CEffectGroup Smoke;
static CMajinBeem CBeem[3];
static CFrameVu1* Shadow[16];
static CFrame* CharaF[3];

static int MBeemCnt;
static float FireStep;
static int MajinBgmStart;
static int DanceBgmStart;
static int DanceBgmCnt;
static int SndCnt;

/* One actor's blinking and speaking. The mouth is driven from the script's own clock rather than
   from a motion: while the actor is talking, a new mouth frame is picked at random every sixth
   hundredth of a second left on the timer, and the timer running out closes the mouth and ends the
   line. The eyes are whatever the script last asked for. The cache is flushed on both sides of the
   two transfers because the plate is a texture the previous tick drew from and the next one will. */
void FaceChange(int no)
{
    static FACE_INFO face[21] = {
        { 0, 0, 42, 40, 87, 35, 0, 0, 256, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 32, 40, 84, 35, 0, 0, 448, 3, 0 },
        { "c09a01", "c09a01an", 10, 40, 73, 35, 0, 0, 448, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 8, 40, 76, 35, 0, 0, 256, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { "p09a01", "p09a01an_2", 44, 40, 92, 32, 0, 0, 256, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { "c01d01", "c01d01an_3", 27, 48, 78, 44, 0, 0, 512, 3, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 },
        { 0, 0, 42, 40, 87, 35, 0, 0, 320, 2, 0 }
    };
    CTexture* plate;
    CTexture* strip;
    int sbp;
    int dbp;
    int sbw;
    int dbw;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128*)&GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    if (face[no].plate == 0) {
        return;
    }

    plate = TexManager.GetTexture(face[no].plate, -1);
    strip = TexManager.GetTexture(face[no].strip, -1);

    if (plate == 0 || strip == 0) {
        return;
    }

    sbp = strip->tex0 & 0x3fff;
    dbp = plate->tex0 & 0x3fff;
    sbw = (strip->tex0 >> 14) & 0x3f;
    dbw = (plate->tex0 >> 14) & 0x3f;

    face[no].eye = CScript.obj[no].eye;

    CRect<int> eye(0, face[no].strip_bottom - face[no].eye_height * (face[no].eye + 1), 128,
                   face[no].eye_height);

    MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8, eye, dbp, dbw, SCE_GS_PSMT8, 0,
                  128 - face[no].eye_height - face[no].eye_bottom, 0);

    if (CScript.obj[no].mouth_time >= CScript.motion_step) {
        CScript.obj[no].mouth_time -= CScript.motion_step;

        if (CScript.obj[no].talk) {
            if ((int)(100.0f * CScript.obj[no].mouth_time) % 6 == 0) {
                CScript.obj[no].mouth = rand() % 4;
            }
        }
    } else {
        CScript.obj[no].mouth = 0;
        CScript.obj[no].talk = 0;
    }

    face[no].mouth = CScript.obj[no].mouth;

    CRect<int> mouth(128,
                     face[no].strip_bottom - face[no].mouth_height * (face[no].mouth + 1),
                     128, face[no].mouth_height);

    MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8, mouth, dbp, dbw, SCE_GS_PSMT8, 0,
                  128 - face[no].mouth_height - face[no].mouth_bottom, 0);

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128*)&GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}

/* The background loads are one wrapper per file because the script names them by index: each waits
   for the previous read to land, starts the next, and marks the load done by putting the script's
   own load number back to none. */
void OpC_LoadDataBG()
{
    while (ReadBGSync()) ;
    LoadFileBG("opdat/norn2/norn2.pim", (u_long128*)read_buffer, 0);
    CScript.load_no = -1;
}

void OpC_LoadDataBG2()
{
    while (ReadBGSync()) ;
    LoadFileBG("opdat/norn2/ndance.pak", (u_long128*)read_buffer, 0);
    CScript.load_no = -1;
}

void OpC_LoadDataBG3()
{
    while (ReadBGSync()) ;
    LoadFileBG("opdat/norn2/majin.pak", (u_long128*)read_buffer, 0);
    CScript.load_no = -1;
}

void OpC_LoadDataBG4()
{
    while (ReadBGSync()) ;
    LoadFileBG("opdat/norn2/norn2.pim", (u_long128*)read_buffer, 0);
    CScript.load_no = -1;
}

void OpC_LoadDataBG5()
{
    while (ReadBGSync()) ;
    LoadFileBG("opdat/norn3/norn3.pak", (u_long128*)read_buffer, 0);
    CScript.load_no = -1;
}

/* The set-up for the scene the dance is danced in: the whole of Norune at night, its scenery placed
   from a configuration file rather than a table of this file's own, and its images filled into a
   manifest whose first six rows are the registry's fixed surfaces. The second manifest is the same
   array written over again, because the second pack is read only once the first block is entered. */
void OpC_InitProcess()
{
    while (ReadBGSync()) ;

    LOADTEXTURE_INFO2 tex[] = {
        { "#water_buff#640#224#4", 22, 0 },
        { "#blender#640#224#4", 0, 0 },
        { "#fontbase#512#256#1", 26, 0 },
        { "#fukidashibase#640#224#4", 26, 0 },
        { "#shadow_buff#640#224#4", 23, 0 },
        { "#frame_image#640#224#4", 22, 0 },
        { 0, 0, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 11, 0 },
        { 0, 11, 0 },
        { 0, 11, 0 },
        { 0, 11, 0 },
        { 0, 26, 0 },
        { 0, 26, 0 },
        { 0, 26, 0 },
        { 0, 19, 0 },
        { 0, 19, 0 },
        { 0, 19, 0 },
        { 0, 0, 0 }
    };

    tex[6].name = (char*)GetPackFile(read_buffer, "fire.img", 0);
    tex[7].name = (char*)GetPackFile(read_buffer, "t0203.img", 0);
    tex[8].name = (char*)GetPackFile(read_buffer, "e01b01.img", 0);
    tex[9].name = (char*)GetPackFile(read_buffer, "e01b02.img", 0);
    tex[10].name = (char*)GetPackFile(read_buffer, "e01b03.img", 0);
    tex[11].name = (char*)GetPackFile(read_buffer, "e01t01.img", 0);
    tex[12].name = (char*)GetPackFile(read_buffer, "t0205.img", 0);
    tex[13].name = (char*)GetPackFile(read_buffer, "t0003.img", 0);
    tex[14].name = (char*)GetPackFile(read_buffer, "e01s03.img", 0);
    tex[15].name = (char*)GetPackFile(read_buffer, "e01s06.img", 0);
    tex[16].name = (char*)GetPackFile(read_buffer, "t0001.img", 0);
    tex[17].name = (char*)GetPackFile(read_buffer, "gaiji.img", 0);
    tex[18].name = (char*)GetPackFile(read_buffer, "fuki256.img", 0);
    tex[19].name = (char*)GetPackFile(read_buffer, "syst04.img", 0);
    tex[20].name = (char*)GetPackFile(read_buffer, "pause.img", 0);
    tex[21].name = (char*)GetPackFile(read_buffer, "pause_e.img", 0);
    tex[22].name = (char*)GetPackFile(read_buffer, "start2.img", 0);

    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, tex);

    LoadFile("opdat/norn2/norn2b.pak", (void*)read_buffer, 0);

    tex[0].name = (char*)GetPackFile(read_buffer, "t0201.img", 0);
    tex[0].block_no = 12;
    tex[0].unk_08 = 0;
    tex[1].name = (char*)GetPackFile(read_buffer, "t0206.img", 0);
    tex[1].block_no = 12;
    tex[1].unk_08 = 0;
    tex[2].name = (char*)GetPackFile(read_buffer, "c01d01.img", 0);
    tex[2].block_no = 2;
    tex[2].unk_08 = 0;
    tex[3].name = (char*)GetPackFile(read_buffer, "c01d01an.img", 0);
    tex[3].block_no = 2;
    tex[3].unk_08 = 0;
    tex[4].name = (char*)GetPackFile(read_buffer, "p03a01.img", 0);
    tex[4].block_no = 13;
    tex[4].unk_08 = 0;
    tex[5].name = (char*)GetPackFile(read_buffer, "p08a01.img", 0);
    tex[5].block_no = 14;
    tex[5].unk_08 = 0;
    tex[6].name = (char*)GetPackFile(read_buffer, "p07a01.img", 0);
    tex[6].block_no = 7;
    tex[6].unk_08 = 0;
    tex[7].name = (char*)GetPackFile(read_buffer, "yokobue.img", 0);
    tex[7].block_no = 7;
    tex[7].unk_08 = 0;
    tex[8].name = (char*)GetPackFile(read_buffer, "p02a01.img", 0);
    tex[8].block_no = 8;
    tex[8].unk_08 = 0;
    tex[9].name = (char*)GetPackFile(read_buffer, "guiter.img", 0);
    tex[9].block_no = 8;
    tex[9].unk_08 = 0;
    tex[10].name = 0;
    tex[10].block_no = 0;
    tex[10].unk_08 = 0;

    TexManager.LoadTextureBlock(-1, tex);

    CharaTex[11] = 2;
    CharaTex[12] = 13;
    CharaTex[13] = 14;
    CharaTex[9] = 3;
    CharaTex[11] = 2;
    CharaTex[12] = 13;
    CharaTex[13] = 14;
    CharaTex[14] = 4;
    CharaTex[15] = 5;
    CharaTex[16] = 6;
    CharaTex[17] = 7;
    CharaTex[18] = 8;
    CharaTex[19] = 9;
    CharaTex[20] = 9;
    CharaTex[1] = 15;
    CharaTex[4] = 15;
    CharaTex[3] = 16;
    CharaTex[5] = 17;

    CSnd.SetReverb(0, 3, 20);
    CSnd.SetReverb(1, 4, 5);
    CSnd.LoadSoundFileFromPack("o03a.txt", read_buffer);
    CSnd.SetVol(15, 256);
    CSnd.SetVol(14, 256);
    CSnd.SetVol(13, 256);
    CSnd.SetVol(12, 256);
    CSnd.SQ_Play(1, 0);

    sceVu0FVECTOR river1 = { 50.0f, 100.0f, -100.0f, 0.0f };

    OpPlayVolPanSE(river1, 50.0f, 500.0f, 15, 16, 21);

    sceVu0FVECTOR river2 = { 0.0f, 0.0f, 0.0f, 0.0f };

    OpPlayVolPanSE(river2, 50.0f, 500.0f, 15, 16, 22);

    sceVu0FVECTOR river3 = { 0.0f, 0.0f, 300.0f, 0.0f };

    OpPlayVolPanSE(river3, 100.0f, 300.0f, 15, 16, 24);
    CSnd.Step();
    DanceBgmStart = 0;
    DanceBgmCnt = 0;

    CharaDataBuffer[0].used = 0;
    Chara[11].LoadPackData(read_buffer, "04c01d.cfg",  &CharaDataBuffer[0], 0);

    CFrameAttr attr11;

    attr11.unk_08 = 0;
    Chara[11].frame->SetAttr(attr11, 1, 4);
    Chara[11].motion_type.state.time = 10.0f;
    Chara[11].motion_type.state.unk_08 = 0.05f;
    Chara[11].motion_type.state.motion_no = 0;
    Chara[11].motion_type.state.playing_no = 0;

    Chara[17].LoadPackData(read_buffer, "04p07a.cfg",  &CharaDataBuffer[0], 0);

    CFrameAttr attr17;

    attr17.unk_08 = 0;
    Chara[17].frame->SetAttr(attr17, 1, 4);
    Chara[17].motion_type.state.time = 10.0f;
    Chara[17].motion_type.state.unk_08 = 0.05f;
    Chara[17].motion_type.state.motion_no = 0;
    Chara[17].motion_type.state.playing_no = 0;

    Chara[18].LoadPackData(read_buffer, "04p02a.cfg",  &CharaDataBuffer[0], 0);

    CFrameAttr attr18;

    attr18.unk_08 = 0;
    Chara[18].frame->SetAttr(attr18, 1, 4);
    Chara[18].motion_type.state.time = 10.0f;
    Chara[18].motion_type.state.unk_08 = 0.05f;
    Chara[18].motion_type.state.motion_no = 0;
    Chara[18].motion_type.state.playing_no = 0;

    Chara[12].LoadPackData(read_buffer, "04p03a.cfg",  &CharaDataBuffer[0], 0);

    CFrameAttr attr12;

    attr12.unk_08 = 0;
    Chara[12].frame->SetAttr(attr12, 1, 4);
    Chara[12].motion_type.state.time = 10.0f;
    Chara[12].motion_type.state.unk_08 = 0.05f;
    Chara[12].motion_type.state.motion_no = 0;
    Chara[12].motion_type.state.playing_no = 0;

    CharaDataBuffer[6].used = 0;
    Chara[13].LoadPackData(read_buffer, "04p08a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr13;

    attr13.unk_08 = 0;
    Chara[13].frame->SetAttr(attr13, 1, 4);
    Chara[13].motion_type.state.time = 10.0f;
    Chara[13].motion_type.state.unk_08 = 0.05f;
    Chara[13].motion_type.state.motion_no = 0;
    Chara[13].motion_type.state.playing_no = 0;

    OP_FireList = 0;
    OPAnalyz("opdat/norn2.cfg");
    OPMdsLoad();
    MapLoad();

    for (int i = 0; i < 2; i++) {
        Fuusya[i].Initialize();
        Fuusya[i].motion_start = 0;
        Fuusya[i].motion_end = 0;
        Fuusya[i].scale[2] = 0.0f;
        Fuusya[i].scale[1] = 0.0f;
        Fuusya[i].scale[0] = 0.0f;
        Fuusya[i].position[2] = 0.0f;
        Fuusya[i].position[1] = 0.0f;
        Fuusya[i].position[0] = 0.0f;
        Fuusya[i].unk_44 = 0.0f;
        Fuusya[i].unk_40 = 0.0f;
        Fuusya[i].step = -0.5f;
        strcpy(Fuusya[i].name, "hane");
        InitObjAnime(DoransFuusya[i], &Fuusya[i]);
    }

    for (int i = 0; i < 8; i++) {
        Taimatsu[i].Initialize();
        Taimatsu[i].motion_start = 3;
        Taimatsu[i].motion_end = 4;
        Taimatsu[i].scale[2] = 80.0f;
        Taimatsu[i].scale[1] = 80.0f;
        Taimatsu[i].scale[0] = 80.0f;
        Taimatsu[i].position[2] = 128.0f;
        Taimatsu[i].position[1] = 128.0f;
        Taimatsu[i].position[0] = 128.0f;
        strcpy(Taimatsu[i].name, "effect");
        InitObjAnime(TaimatsuFrame[i], &Taimatsu[i]);
    }

    Taimatsu[8].Initialize();
    Taimatsu[8].motion_start = 3;
    Taimatsu[8].motion_end = 4;
    Taimatsu[8].scale[0] = 110.0f;
    Taimatsu[8].scale[2] = 120.0f;
    Taimatsu[8].scale[1] = 120.0f;
    Taimatsu[8].position[0] = 128.0f;
    Taimatsu[8].position[2] = 125.0f;
    Taimatsu[8].position[1] = 125.0f;
    strcpy(Taimatsu[8].name, "hikari");
    InitObjAnime(TaimatsuFrame[8], &Taimatsu[8]);

    sceVu0FVECTOR corner0 = { -160.0f, 0.0f, -160.0f, 1.0f };
    sceVu0FVECTOR corner1 = { 160.0f, 0.0f, -160.0f, 1.0f };
    sceVu0FVECTOR corner2 = { -160.0f, 0.0f, 160.0f, 1.0f };
    sceVu0FVECTOR corner3 = { 160.0f, 0.0f, 160.0f, 1.0f };

    Water.SetVertex(corner0, corner1, corner2, corner3);
    Water.frame.SetPosition(0.0f, -10.0f, 0.0f);
    Water.SetSize(32, 32, &WaterBuffer);
    Water.SetParam(0.1f, 0.015f, 0.0f, 2.0f);
    Water.SetColor(128, 128, 128, 128);

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 8; j++) {
            CBomb[i].active[j] = 0;
        }
    }

    for (int i = 0; i < 3; i++) {
        CBeem[i].active = 0;
        CBeem[i].alphas[59] = 0.0f;
    }

    MBeemCnt = 0;
    FireStep = 1.0f;
    CScript.init_no = 0;
}

/* The dancers, which is a texture load rather than a scene: the shadow model all sixteen actors
   share, then the five villagers who join the dance, each loaded straight after the block its
   images went into. */
void OpC_InitProcess2()
{
    while (ReadBGSync()) ;

    TexManager.DeleteTextureBlock(0);
    TexManager.DeleteTextureBlock(14);
    TexManager.CleanUpBuffer();

    LOADTEXTURE_INFO2 tex[15] = {
        { "#blender#640#224#4", 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 }
    };

    tex[1].name = (char*)GetPackFile(read_buffer, "fire.img", 0);
    tex[1].block_no = 0;
    tex[1].unk_08 = 0;
    tex[2].name = 0;

    TexManager.LoadTextureBlock(0, tex);

    tex[0].name = (char*)GetPackFile(read_buffer, "ashikage.img", 0);
    tex[0].block_no = 17;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(17, tex);

    CharaDataBuffer[6].used = 0;

    CFrameVu1* shadow = LoadMDSFile((u_int*)GetPackFile(read_buffer, "ashikage.mds", 0),
                                    &CharaDataBuffer[6], 2, 0, 0);

    for (int i = 0; i < 16; i++) {
        Shadow[i] = shadow;
    }

    tex[0].name = (char*)GetPackFile(read_buffer, "p05b01.img", 0);
    tex[0].block_no = 4;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(4, tex);
    Chara[14].LoadPackData(read_buffer, "04p05b.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr14;

    attr14.unk_08 = 0;
    Chara[14].frame->SetAttr(attr14, 1, 4);
    Chara[14].motion_type.state.time = 1.0f;
    Chara[14].motion_type.state.unk_08 = 1.0f;
    Chara[14].motion_type.state.motion_no = 0;
    Chara[14].motion_type.state.playing_no = 0;

    tex[0].name = (char*)GetPackFile(read_buffer, "p15a01.img", 0);
    tex[0].block_no = 9;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(9, tex);
    Chara[19].LoadPackData(read_buffer, "04p15a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr19;

    attr19.unk_08 = 0;
    Chara[19].frame->SetAttr(attr19, 1, 4);
    Chara[19].motion_type.state.time = 1.0f;
    Chara[19].motion_type.state.unk_08 = 1.0f;
    Chara[19].motion_type.state.motion_no = 0;
    Chara[19].motion_type.state.playing_no = 0;

    Chara[20].LoadPackData(read_buffer, "04p16a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr20;

    attr20.unk_08 = 0;
    Chara[20].frame->SetAttr(attr20, 1, 4);
    Chara[20].motion_type.state.time = 1.0f;
    Chara[20].motion_type.state.unk_08 = 1.0f;
    Chara[20].motion_type.state.motion_no = 0;
    Chara[20].motion_type.state.playing_no = 0;

    tex[0].name = (char*)GetPackFile(read_buffer, "p01a01.img", 0);
    tex[0].block_no = 5;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(5, tex);
    Chara[15].LoadPackData(read_buffer, "04p01a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr15;

    attr15.unk_08 = 0;
    Chara[15].frame->SetAttr(attr15, 1, 4);
    Chara[15].motion_type.state.time = 300.0f;
    Chara[15].motion_type.state.unk_08 = 0.5f;
    Chara[15].motion_type.state.motion_no = 0;
    Chara[15].motion_type.state.playing_no = 0;

    tex[0].name = (char*)GetPackFile(read_buffer, "p12a01.img", 0);
    tex[0].block_no = 6;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(6, tex);
    Chara[16].LoadPackData(read_buffer, "04p12a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr16;

    attr16.unk_08 = 0;
    Chara[16].frame->SetAttr(attr16, 1, 4);
    Chara[16].motion_type.state.time = 300.0f;
    Chara[16].motion_type.state.unk_08 = 0.5f;
    Chara[16].motion_type.state.motion_no = 0;
    Chara[16].motion_type.state.playing_no = 0;

    CScript.init_no = 0;
}

/* The demon's arrival: the two halves of it the scene animates, the beam it fires, and the four
   pieces of sky and moonlight the rest of the scene is drawn against. The sky is given an attribute
   mask of its own because it is drawn behind everything rather than lit with it. */
void OpC_InitProcess3()
{
    while (ReadBGSync()) ;

    TexManager.DeleteTextureBlock(7);
    TexManager.DeleteTextureBlock(5);
    TexManager.DeleteTextureBlock(6);
    TexManager.DeleteTextureBlock(4);
    TexManager.DeleteTextureBlock(9);
    TexManager.DeleteTextureBlock(10);
    TexManager.CleanUpBuffer();

    LOADTEXTURE_INFO2 tex[4];

    tex[0].name = (char*)GetPackFile(read_buffer, "b0203.img", 0);
    tex[0].block_no = 10;
    tex[0].unk_08 = 0;
    tex[1].name = (char*)GetPackFile(read_buffer, "b0204.img", 0);
    tex[1].block_no = 10;
    tex[1].unk_08 = 0;
    tex[2].name = (char*)GetPackFile(read_buffer, "tukikage.img", 0);
    tex[2].block_no = 10;
    tex[2].unk_08 = 0;
    tex[3].name = 0;

    TexManager.LoadTextureBlock(10, tex);

    tex[0].name = (char*)GetPackFile(read_buffer, "c08a01.img", 0);
    tex[0].block_no = 15;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(15, tex);

    tex[0].name = (char*)GetPackFile(read_buffer, "c09a01.img", 0);
    tex[0].block_no = 16;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(16, tex);

    tex[0].name = (char*)GetPackFile(read_buffer, "beem.img", 0);
    tex[0].block_no = 17;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(17, tex);

    CharaDataBuffer[6].used = 0;
    Chara[1].LoadPackData(read_buffer, "04c08a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr1;

    attr1.unk_08 = 0;
    Chara[1].frame->SetAttr(attr1, 1, 4);
    Chara[1].motion_type.state.time = 10.0f;
    Chara[1].motion_type.state.unk_08 = 0.5f;
    Chara[1].motion_type.state.motion_no = 0;
    Chara[1].motion_type.state.playing_no = 0;

    Chara[3].LoadPackData(read_buffer, "04c09a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr3;

    attr3.unk_08 = 0;
    Chara[3].frame->SetAttr(attr3, 1, 4);
    Chara[3].motion_type.state.time = 10.0f;
    Chara[3].motion_type.state.unk_08 = 0.5f;
    Chara[3].motion_type.state.motion_no = 0;
    Chara[3].motion_type.state.playing_no = 0;

    CFrameAttr sky;

    sky.unk_14 = 1;
    sky.unk_54 = 0;

    CFrameVu1* frame = LoadMDSFile((u_int*)GetPackFile(read_buffer, "b0203.mds", 0),
                                   &MapDataBuffer, 2, 0, 0);

    frame->SetAttr(sky, 1, 4608);
    CMapObject& sky0 = OP_NornMapObj3[0];

    sky0.Initialize();
    sky0.SetFrame(frame, 0);
    OP_NornMapObj3[0].unk_38 = 0;
    OP_NornMapObj3[0].unk_34 = 0;
    sky0.SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    sky0.SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    frame = LoadMDSFile((u_int*)GetPackFile(read_buffer, "b0204.mds", 0), &MapDataBuffer, 2, 0, 0);
    frame->SetAttr(sky, 1, 4608);
    OP_NornMapObj3[1].Initialize();
    OP_NornMapObj3[1].SetFrame(frame, 0);
    OP_NornMapObj3[1].unk_38 = 0;
    OP_NornMapObj3[1].unk_34 = 0;

    CMapObject& sky1 = OP_NornMapObj3[1];

    sky1.SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    sky1.SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    frame = LoadMDSFile((u_int*)GetPackFile(read_buffer, "b0302.mds", 0), &MapDataBuffer, 2, 0, 0);
    OP_NornMapObj3[2].Initialize();
    OP_NornMapObj3[2].SetFrame(frame, 0);
    OP_NornMapObj3[2].unk_38 = 0;
    OP_NornMapObj3[2].unk_34 = 0;

    CMapObject& sky2 = OP_NornMapObj3[2];

    sky2.SetPosition(CVector3_f_(-1147.01f, 2524.122f, 1603.736f));
    sky2.SetRotation(CVector3_f_(0.49406955f, 2.3992832f, -0.07209257f));

    frame = LoadMDSFile((u_int*)GetPackFile(read_buffer, "tukikage.mds", 0), &MapDataBuffer, 2, 0,
                        0);
    OP_NornMapObj3[3].Initialize();
    OP_NornMapObj3[3].SetFrame(frame, 0);
    OP_NornMapObj3[3].unk_38 = 0;
    OP_NornMapObj3[3].unk_34 = 0;

    CMapObject& sky3 = OP_NornMapObj3[3];

    sky3.SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    sky3.SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    CSnd.SetReverb(0, 4, 50);
    CSnd.SetReverb(1, 4, 5);
    CSnd.LoadSoundFileFromPack("o03b.txt", read_buffer);
    CSnd.SetVol(15, 256);
    CSnd.SetVol(14, 256);
    CSnd.SetVol(13, 256);
    CSnd.SetVol(12, 256);
    MajinBgmStart = 0;
    SndCnt = 0;
    CScript.init_no = 0;
}

/* The village once the demon has been through it, which is the first scene's manifest with the
   explosion and the dust it throws up added and everything the dance needed left out. */
void OpC_InitProcess4()
{
    while (ReadBGSync()) ;

    TexManager.DeleteTextureBlock(0);
    TexManager.DeleteTextureBlock(10);
    TexManager.DeleteTextureBlock(11);
    TexManager.CleanUpBuffer();

    LOADTEXTURE_INFO2 tex[15] = {
        { "#blender#640#224#4", 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 }
    };

    tex[1].name = (char*)GetPackFile(read_buffer, "fire.img", 0);
    tex[1].block_no = 0;
    tex[1].unk_08 = 0;
    tex[2].name = (char*)GetPackFile(read_buffer, "t0203.img", 0);
    tex[2].block_no = 10;
    tex[2].unk_08 = 0;
    tex[3].name = (char*)GetPackFile(read_buffer, "e01b01.img", 0);
    tex[3].block_no = 10;
    tex[3].unk_08 = 0;
    tex[4].name = (char*)GetPackFile(read_buffer, "e01b02.img", 0);
    tex[4].block_no = 10;
    tex[4].unk_08 = 0;
    tex[5].name = (char*)GetPackFile(read_buffer, "e01b03.img", 0);
    tex[5].block_no = 10;
    tex[5].unk_08 = 0;
    tex[6].name = (char*)GetPackFile(read_buffer, "e01t01.img", 0);
    tex[6].block_no = 10;
    tex[6].unk_08 = 0;
    tex[7].name = (char*)GetPackFile(read_buffer, "t0205.img", 0);
    tex[7].block_no = 10;
    tex[7].unk_08 = 0;
    tex[8].name = (char*)GetPackFile(read_buffer, "t0003.img", 0);
    tex[8].block_no = 11;
    tex[8].unk_08 = 0;
    tex[9].name = (char*)GetPackFile(read_buffer, "e01s03.img", 0);
    tex[9].block_no = 11;
    tex[9].unk_08 = 0;
    tex[10].name = (char*)GetPackFile(read_buffer, "e01s06.img", 0);
    tex[10].block_no = 11;
    tex[10].unk_08 = 0;
    tex[11].name = (char*)GetPackFile(read_buffer, "t0001.img", 0);
    tex[11].block_no = 11;
    tex[11].unk_08 = 0;
    tex[12].name = (char*)GetPackFile(read_buffer, "bakuhatu.img", 0);
    tex[12].block_no = 17;
    tex[12].unk_08 = 0;
    tex[13].name = (char*)GetPackFile(read_buffer, "sunakemuri.img", 0);
    tex[13].block_no = 17;
    tex[13].unk_08 = 0;
    tex[14].name = 0;

    TexManager.LoadTextureBlock(-1, tex);
    CScript.init_no = 0;
}

/* The burning village: the ruined map, the smoke pool the fires feed, and the five actors who walk
   through it. The cloth Toan carries is driven by this file's own wind rather than the scene's. */
void OpC_InitProcess5()
{
    while (ReadBGSync()) ;

    TexManager.DeleteTextureBlock(13);
    TexManager.DeleteTextureBlock(17);
    TexManager.DeleteTextureBlock(0);
    TexManager.CleanUpBuffer();

    LOADTEXTURE_INFO2 tex[15] = {
        { "#blender#640#224#4", 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 }
    };

    tex[1].name = (char*)GetPackFile(read_buffer, "fire.img", 0);
    tex[1].block_no = 0;
    tex[1].unk_08 = 0;
    tex[2].name = 0;

    TexManager.LoadTextureBlock(0, tex);

    tex[0].name = (char*)GetPackFile(read_buffer, "smoke.img", 0);
    tex[0].block_no = 17;
    tex[0].unk_08 = 0;
    tex[1].name = (char*)GetPackFile(read_buffer, "beem.img", 0);
    tex[1].block_no = 17;
    tex[1].unk_08 = 0;
    tex[2].name = (char*)GetPackFile(read_buffer, "bakuhatu.img", 0);
    tex[2].block_no = 17;
    tex[2].unk_08 = 0;
    tex[3].name = (char*)GetPackFile(read_buffer, "sunakemuri.img", 0);
    tex[3].block_no = 17;
    tex[3].unk_08 = 0;
    tex[4].name = 0;

    TexManager.LoadTextureBlock(17, tex);

    CharaDataBuffer[6].used = 0;
    MapLoad2();

    Chara[11].LoadPackData(read_buffer, "04c01d.cfg",  &CharaDataBuffer[0], 0);

    CFrameAttr attr11;

    attr11.unk_08 = 0;
    Chara[11].frame->SetAttr(attr11, 1, 4);
    Chara[11].motion_type.state.time = 10.0f;
    Chara[11].motion_type.state.unk_08 = 0.05f;
    Chara[11].motion_type.state.motion_no = 0;
    Chara[11].motion_type.state.playing_no = 0;
    Chara[11].unk_C98 = (int)&Wind;

    tex[0].name = (char*)GetPackFile(read_buffer, "p09a01.img", 0);
    tex[0].block_no = 3;
    tex[0].unk_08 = 0;
    tex[1].name = (char*)GetPackFile(read_buffer, "p09a01an.img", 0);
    tex[1].block_no = 3;
    tex[1].unk_08 = 0;
    tex[2].name = 0;

    TexManager.LoadTextureBlock(3, tex);
    Chara[9].LoadPackData(read_buffer, "04p09a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr9;

    attr9.unk_08 = 0;
    Chara[9].frame->SetAttr(attr9, 1, 4);
    Chara[9].motion_type.state.time = 5.0f;
    Chara[9].motion_type.state.unk_08 = 1.0f;
    Chara[9].motion_type.state.motion_no = 0;
    Chara[9].motion_type.state.playing_no = 0;

    tex[0].name = (char*)GetPackFile(read_buffer, "p08a01.img", 0);
    tex[0].block_no = 14;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(14, tex);
    Chara[13].LoadPackData(read_buffer, "04p08a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr13;

    attr13.unk_08 = 0;
    Chara[13].frame->SetAttr(attr13, 1, 4);
    Chara[13].motion_type.state.time = 5.0f;
    Chara[13].motion_type.state.unk_08 = 1.0f;
    Chara[13].motion_type.state.motion_no = 0;
    Chara[13].motion_type.state.playing_no = 0;

    Chara[18].LoadPackData(read_buffer, "04p02a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr18;

    attr18.unk_08 = 0;
    Chara[18].frame->SetAttr(attr18, 1, 4);
    Chara[18].motion_type.state.time = 10.0f;
    Chara[18].motion_type.state.unk_08 = 0.5f;
    Chara[18].motion_type.state.motion_no = 0;
    Chara[18].motion_type.state.playing_no = 0;

    Chara[1].LoadPackData(read_buffer, "04c08a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr1;

    attr1.unk_08 = 0;
    Chara[1].frame->SetAttr(attr1, 1, 4);
    Chara[1].motion_type.state.time = 10.0f;
    Chara[1].motion_type.state.unk_08 = 0.5f;
    Chara[1].motion_type.state.motion_no = 0;
    Chara[1].motion_type.state.playing_no = 0;

    Chara[3].LoadPackData(read_buffer, "04c09a.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr3;

    attr3.unk_08 = 0;
    Chara[3].frame->SetAttr(attr3, 1, 4);
    Chara[3].motion_type.state.time = 10.0f;
    Chara[3].motion_type.state.unk_08 = 0.5f;
    Chara[3].motion_type.state.motion_no = 0;
    Chara[3].motion_type.state.playing_no = 0;

    Fuusya[0].Initialize();
    Fuusya[0].motion_start = 0;
    Fuusya[0].motion_end = 0;
    Fuusya[0].scale[2] = 0.0f;
    Fuusya[0].scale[1] = 0.0f;
    Fuusya[0].scale[0] = 0.0f;
    Fuusya[0].position[2] = 0.0f;
    Fuusya[0].position[1] = 0.0f;
    Fuusya[0].position[0] = 0.0f;
    Fuusya[0].unk_44 = 0.0f;
    Fuusya[0].unk_40 = 0.0f;
    Fuusya[0].step = -0.5f;
    strcpy(Fuusya[0].name, "hane");
    InitObjAnime(DoransFuusya[0], &Fuusya[0]);

    Fuusya[1].Initialize();
    Fuusya[1].motion_start = 0;
    Fuusya[1].motion_end = 3;
    Fuusya[1].scale[2] = 0.0f;
    Fuusya[1].scale[1] = 0.0f;
    Fuusya[1].scale[0] = 0.0f;
    Fuusya[1].position[0] = 0.0f;
    Fuusya[1].position[1] = 0.0f;
    Fuusya[1].position[2] = -90.0f;
    Fuusya[1].unk_40 = 0.0f;
    Fuusya[1].unk_44 = 0.0f;
    Fuusya[1].step = -0.048f;
    strcpy(Fuusya[1].name, "obj1");
    InitObjAnime(DoransFuusya[1], &Fuusya[1]);

    for (int i = 0; i < 5; i++) {
        Taimatsu[i].Initialize();
        Taimatsu[i].motion_start = 3;
        Taimatsu[i].motion_end = 4;
        Taimatsu[i].scale[2] = 80.0f;
        Taimatsu[i].scale[1] = 80.0f;
        Taimatsu[i].scale[0] = 80.0f;
        Taimatsu[i].position[2] = 128.0f;
        Taimatsu[i].position[1] = 128.0f;
        Taimatsu[i].position[0] = 128.0f;
        strcpy(Taimatsu[i].name, "effect");
        InitObjAnime(TaimatsuFrame[i], &Taimatsu[i]);
    }

    Taimatsu[8].Initialize();
    Taimatsu[8].motion_start = 3;
    Taimatsu[8].motion_end = 4;
    Taimatsu[8].scale[0] = 110.0f;
    Taimatsu[8].scale[2] = 120.0f;
    Taimatsu[8].scale[1] = 120.0f;
    Taimatsu[8].position[0] = 128.0f;
    Taimatsu[8].position[2] = 125.0f;
    Taimatsu[8].position[1] = 125.0f;
    strcpy(Taimatsu[8].name, "hikari");
    InitObjAnime(TaimatsuFrame[8], &Taimatsu[8]);

    EffectTable = (CEffect*)CharaDataBuffer[0].Alloc(12800);
    Smoke.Initialize(EffectTable, 50);
    Smoke.Clear();
    CScript.init_no = 0;
}

/* Where the village stands, as the scene was laid out: a model, the model its distant form is drawn
   from, a position in tenths of a world unit and a heading in degrees, one row per piece of scenery.
   A row with no model of its own is another copy of the row above it, which is how a terrace of
   identical houses costs one model load. The two windmills and the eight torches are kept aside as
   they pass because the object animations are registered against those frames by name. */
static void MapLoad()
{
    MAPOBJ_INFO norn[] = {
    { "opdat/norn2/t0207.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/e01h01_0.mds", "opdat/norn2/e01h01_s.mds", { -35.0f, 0.0f, -20.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/e01h05_2.mds", 0, { 50.0f, 0.0f, 20.0f }, { 0.0f, -90.0f, 0.0f } },
    { "opdat/norn2/e01h11_2.mds", 0, { 50.0f, 0.0f, -10.0f }, { 0.0f, -90.0f, 0.0f } },
    { "opdat/norn2/e01h07_2.mds", 0, { 5.0f, 0.0f, -20.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/e01h08_2.mds", 0, { -45.0f, 0.0f, -45.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/e01h02_2.mds", 0, { -60.0f, 0.0f, 30.0f }, { 0.0f, 90.0f, 0.0f } },
    { "opdat/norn2/e01h06_2.mds", 0, { 0.0f, 4.7424f, 79.274f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/e01a02_1.mds", 0, { 0.0f, 0.0f, 59.965f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/t0002.mds", 0, { -23.7809f, 0.0f, 19.8331f }, { 0.0f, -4.4f, 0.0f } },
    { 0, 0, { 23.1908f, 0.0f, 38.0943f }, { 0.0f, -170.971f, 0.0f } },
    { "opdat/norn2/e01t01_0.mds", 0, { -45.0f, 0.1f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/e01t01_1.mds", 0, { 65.0f, 0.1f, 45.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 55.0f, 0.1f, 55.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.1f, 55.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 55.0f, 0.1f, 5.0f }, { 0.0f, -90.0f, 0.0f } },
    { "opdat/norn2/e01c01_0.mds", 0, { 25.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.0f, 5.0f }, { 0.0f, -90.0f, 0.0f } },
    { "opdat/norn2/e01c02_0.mds", 0, { -45.0f, 0.0f, 25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.0f, 15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -5.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -15.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 15.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/e01c06_0.mds", 0, { -45.0f, 0.0f, 35.0f }, { 0.0f, 180.0f, 0.0f } },
    { "opdat/norn2/e01c07_0.mds", 0, { -35.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 5.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { "opdat/norn2/e01c08_0.mds", 0, { 25.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -45.0f, -0.01f, 5.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { -45.0f, -0.01f, 25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -45.0f, -0.01f, 15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -5.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -15.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 15.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 25.0f, -0.01f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, -0.01f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, -0.01f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -45.0f, -0.01f, 35.0f }, { 0.0f, 180.0f, 0.0f } },
    { 0, 0, { -35.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 5.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { "opdat/norn2/e01w01_0.mds", 0, { 25.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.0f, 5.0f }, { 0.0f, -90.0f, 0.0f } },
    { "opdat/norn2/e01w02_0.mds", 0, { -45.0f, 0.0f, 25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.0f, 15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -5.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -15.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 15.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/e01w06_0.mds", 0, { -45.0f, 0.0f, 35.0f }, { 0.0f, 180.0f, 0.0f } },
    { "opdat/norn2/e01r02_0.mds", 0, { -35.0f, 0.05f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.05f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
    { "opdat/norn2/e01r02_0.mds", 0, { -15.0f, 0.05f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -5.0f, 0.05f, -5.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { -15.0f, 0.05f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.05f, -5.0f }, { 0.0f, 90.0f, 0.0f } },
    { "opdat/norn2/e01r03_0.mds", 0, { -15.0f, 0.05f, -35.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -15.0f, 0.05f, -5.0f }, { 0.0f, 180.0f, 0.0f } },
    { "opdat/norn2/e01r06_0.mds", 0, { -35.0f, 0.05f, -5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 5.0f, 0.05f, -5.0f }, { 0.0f, -90.0f, 0.0f } },
    { "opdat/norn2/t0004.mds", 0, { -32.9331f, 0.06f, 10.3033f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -36.9302f, 0.06f, 10.3033f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -36.9302f, 0.06f, -0.0916f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -32.9331f, 0.06f, -0.0916f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 3.0797f, 0.06f, -0.0916f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 7.0849f, 0.06f, -0.0916f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 7.0849f, 0.06f, 10.3125f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 3.0797f, 0.06f, 10.3125f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/t0213.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } }
    };
    CFrameAttr attr;
    CFrameVu1* frame;
    int i;
    CFrameVu1* ground_frame;

    attr.unk_0C = 1;
    MapDataBuffer.used = 0;

    for (i = 0; i < 75; i++) {
        if (norn[i].name) {
            LoadFile(norn[i].name, (void*)read_buffer, 0);
            frame = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);
        }

        if (i == 4) DoransFuusya[0] = frame;
        if (i == 5) DoransFuusya[1] = frame;
        if (i >= 67 && i < 75) TaimatsuFrame[i - 67] = frame;

        SetFrameAttr(frame, 1);
        frame->SetAttr(attr, 1, 64);

        CMapObject& object = OP_NornMapObj[i];

        object.Initialize();
        object.SetFrame(frame, 0);
        OP_NornMapObj[i].unk_38 = 0;
        OP_NornMapObj[i].unk_34 = 0;

        object.SetPosition(CVector3_f_(10.0f * norn[i].position[0],
                                           10.0f * norn[i].position[1],
                                           10.0f * norn[i].position[2]));
        object.SetRotation(CVector3_f_((float)(PI * norn[i].rotation[0] / 180),
                                           (float)(PI * norn[i].rotation[1] / 180),
                                           (float)(PI * norn[i].rotation[2] / 180)));

        object.FrameObjectOnOff("win1", 0);
        object.FrameObjectOnOff("light1", 0);

        if (norn[i].lod_name) {
            LoadFile(norn[i].lod_name, (void*)read_buffer, 0);
            object.lod_model = LoadMDSFile(read_buffer, &MapDataBuffer, 14, 0, 0);
            object.lod_distance = -20.0f;
        }
    }

    MAPOBJ_INFO ground[] = {
    { "opdat/norn/t0006.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/t0001.mds", 0, { -33.25f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -23.25f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -13.25f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -3.25f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 14.9146f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 24.9146f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 34.9146f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 36.4833f, 0.03f, 17.4747f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 36.4833f, 0.03f, 27.4747f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 36.4833f, 0.03f, 37.4747f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 36.4833f, 0.03f, 47.4747f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 34.9598f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { 25.8411f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { 16.0658f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { 6.657f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -6.7301f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -15.4243f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -24.5027f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -33.5025f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -35.0227f, 0.03f, 47.4712f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -35.0227f, 0.03f, 37.4712f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -35.0227f, 0.03f, 27.4712f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -35.0227f, 0.03f, 17.4712f }, { 0.0f, 90.0f, 0.0f } },
    { "opdat/norn2/t0003.mds", 0, { -28.23f, 0.03f, 13.1174f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -18.23f, 0.03f, 13.1174f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -8.23f, 0.03f, 13.1174f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 19.937f, 0.03f, 13.1174f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 29.937f, 0.03f, 13.1174f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 36.4365f, 0.03f, 22.4967f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 36.4365f, 0.03f, 32.4967f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 36.4365f, 0.03f, 42.4967f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 31.6374f, 0.03f, 52.3176f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { 21.6374f, 0.03f, 52.3176f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { 11.6374f, 0.03f, 52.3176f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -10.1013f, 0.03f, 52.3176f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -20.1013f, 0.03f, 52.3176f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -30.1013f, 0.03f, 52.3176f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -34.9775f, 0.03f, 42.4508f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -34.9775f, 0.03f, 32.4508f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -34.9775f, 0.03f, 22.4508f }, { 0.0f, 90.0f, 0.0f } },
    { "opdat/norn2/t0212.mds", 0, { 0.0f, 0.02f, 30.0f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/t0208.mds", 0, { 0.0f, 0.0f, 29.999f }, { 0.0f, 0.0f, 0.0f } },
    { "opdat/norn2/t0201.mds", 0, { 8.1246f, 0.0f, 21.2374f }, { 0.0f, -190.452f, 0.0f } },
    { 0, 0, { 9.3114f, 0.0f, 21.4458f }, { 0.0f, -243.621f, 0.0f } },
    { 0, 0, { 9.8278f, 0.0f, 22.3789f }, { 0.0f, -237.204f, 0.0f } },
    { 0, 0, { 9.6149f, 1.2748f, 21.9196f }, { 0.0f, -237.777f, 0.0f } },
    { 0, 0, { -10.8524f, 0.0f, 38.0058f }, { 0.0f, 279.8325f, 0.0f } },
    { 0, 0, { -11.6807f, 0.0f, 36.7247f }, { 0.0f, 281.7807f, 0.0f } },
    { 0, 0, { -11.9794f, 0.0f, 37.8902f }, { 0.0f, 287.5107f, 0.0f } },
    { 0, 0, { -12.2587f, 0.0f, 39.046f }, { 0.0f, 288.9999f, 0.0f } },
    { 0, 0, { -10.9969f, 0.0f, 39.1231f }, { 0.0f, 280.291f, 0.0f } },
    { 0, 0, { 24.4449f, 0.0f, 28.8081f }, { 0.0f, -84.5684f, 0.0f } },
    { 0, 0, { 24.5097f, 1.2748f, 29.317f }, { 0.0f, -84.5684f, 0.0f } },
    { 0, 0, { 24.7114f, 0.0f, 29.8031f }, { 0.0f, -84.5684f, 0.0f } },
    { 0, 0, { 24.9802f, 1.2748f, 30.2274f }, { 0.0f, -84.5684f, 0.0f } },
    { 0, 0, { 25.2412f, 0.0f, 30.6682f }, { 0.0f, -84.5684f, 0.0f } },
    { "opdat/norn2/t0202.mds", 0, { 6.9352f, 0.0f, 22.8016f }, { 0.0f, -66.4631f, 0.0f } },
    { 0, 0, { -14.5591f, 0.0f, 35.5869f }, { 0.0f, 112.4143f, 0.0f } },
    { "opdat/norn2/t0203.mds", 0, { 8.5959f, 0.0f, 23.4822f }, { 0.0f, -49.7327f, 0.0f } },
    { 0, 0, { -13.0716f, 0.0f, 36.4929f }, { 0.0f, 129.2592f, 0.0f } },
    { 0, 0, { -14.4103f, 0.0f, 37.4364f }, { 0.0f, 112.5289f, 0.0f } },
    { "opdat/norn2/t0204.mds", 0, { -9.0122f, 0.0f, 20.8749f }, { 0.0f, -234.912f, 0.0f } },
    { 0, 0, { -9.9647f, 0.0f, 21.4127f }, { 0.0f, -227.234f, 0.0f } },
    { 0, 0, { -10.7374f, 0.0f, 22.1576f }, { 0.0f, -223.797f, 0.0f } },
    { 0, 0, { -9.4268f, 0.9971f, 21.1822f }, { 0.0f, -241.444f, 0.0f } },
    { 0, 0, { -10.3487f, 0.9971f, 21.8464f }, { 0.0f, -225.287f, 0.0f } },
    { 0, 0, { -9.8716f, 1.9904f, 21.4498f }, { 0.0f, -228.61f, 0.0f } },
    { 0, 0, { 12.8223f, 0.0f, 26.3336f }, { 0.0f, -343.545f, 0.0f } },
    { 0, 0, { 11.8478f, 0.0f, 26.9861f }, { 0.0f, -348.702f, 0.0f } },
    { 0, 0, { 11.9701f, 0.0f, 28.1885f }, { 0.0f, -354.661f, 0.0f } },
    { 0, 0, { 13.085f, 0.0f, 27.3741f }, { 0.0f, -346.983f, 0.0f } },
    { 0, 0, { 11.7334f, 0.9971f, 27.8052f }, { 0.0f, -348.358f, 0.0f } },
    { 0, 0, { 12.58f, 0.9971f, 26.905f }, { 0.0f, -337.013f, 0.0f } },
    { 0, 0, { 12.8088f, 0.0f, 38.6433f }, { 0.0f, -382.965f, 0.0f } },
    { 0, 0, { 11.6416f, 0.0f, 38.5285f }, { 0.0f, -388.121f, 0.0f } },
    { 0, 0, { 10.9726f, 0.0f, 39.535f }, { 0.0f, -394.08f, 0.0f } },
    { 0, 0, { 12.3514f, 0.0f, 39.6143f }, { 0.0f, -386.402f, 0.0f } },
    { 0, 0, { 11.0331f, 0.9971f, 39.0886f }, { 0.0f, -387.777f, 0.0f } },
    { 0, 0, { 12.2587f, 0.9971f, 38.9308f }, { 0.0f, -376.433f, 0.0f } },
    { "opdat/norn2/t0205.mds", 0, { -9.8702f, 2.9808f, 21.5102f }, { 0.0f, -140.374f, 0.0f } },
    { 0, 0, { -11.6688f, 1.2789f, 36.7089f }, { 0.0f, -61.7649f, 0.0f } },
    { 0, 0, { 12.4831f, 1.9258f, 26.9556f }, { 0.0f, -84.3394f, 0.0f } },
    { "opdat/norn2/t0206.mds", 0, { -4.3913f, 0.0f, 18.9443f }, { 0.0f, 18.3347f, 0.0f } },
    { 0, 0, { -13.2586f, 0.0f, 27.5378f }, { 0.0f, 77.6931f, 0.0f } },
    { 0, 0, { 4.648f, 0.0f, 19.1829f }, { 0.0f, -21.6578f, 0.0f } },
    { 0, 0, { 13.7675f, 0.0f, 33.1962f }, { 0.0f, -110.58f, 0.0f } }
    };

    for (int j = 0; j < 87; j++) {
        if (ground[j].name) {
            LoadFile(ground[j].name, (void*)read_buffer, 0);
            ground_frame = LoadMDSFile(read_buffer, &MapDataBuffer, 2, 0, 0);
        }

        if (j > 0) {
            ground_frame->SetAttr(attr, 1, 64);
            SetFrameAttr(ground_frame, 1);
        }

        if (j == 41) TaimatsuFrame[8] = ground_frame;

        if (j == 0) {
            CFrame* sun = ground_frame->SearchFrame("sun3");

            float x, y, z;

            y = 400.0f;
            z = -30.0f;
            x = 420.0f;
            sun->SetPosition(x, (float)y, (float)z);
        }

        CMapObject& object = OP_NornMapObj2[j];

        object.Initialize();
        object.SetFrame(ground_frame, 0);
        OP_NornMapObj2[j].unk_38 = 0;
        OP_NornMapObj2[j].unk_34 = 0;

        object.SetPosition(CVector3_f_(10.0f * ground[j].position[0],
                                           10.0f * ground[j].position[1],
                                           10.0f * ground[j].position[2]));
        object.SetRotation(CVector3_f_((float)(PI * ground[j].rotation[0] / 180),
                                           (float)(PI * ground[j].rotation[1] / 180),
                                           (float)(PI * ground[j].rotation[2] / 180)));
    }
}

/* The same village after the demon has burned it, which is a second layout rather than a change to
   the first: the models come out of the pack the background read left in memory rather than off the
   disc, so every row is a name inside it. */
static void MapLoad2()
{
    MAPOBJ_INFO norn[] = {
    { "b0301.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
    { "e01h01_1.mds", 0, { -35.0f, 0.0f, -20.0f }, { 0.0f, 0.0f, 0.0f } },
    { "e01h05_2.mds", 0, { 50.0f, 0.0f, 20.0f }, { 0.0f, -90.0f, 0.0f } },
    { "e01h11_2.mds", 0, { 55.0f, 0.0f, -10.0f }, { 0.0f, -90.0f, 0.0f } },
    { "e01h07_2.mds", 0, { 5.0f, 0.0f, -20.0f }, { 0.0f, 0.0f, 0.0f } },
    { "e01h02_2.mds", 0, { -60.0f, 0.0f, 30.0f }, { 0.0f, 90.0f, 0.0f } },
    { "e01h06_2.mds", 0, { 0.0f, 4.7424f, 79.274f }, { 0.0f, 0.0f, 0.0f } },
    { "e01a02_1.mds", 0, { 0.0f, 0.0f, 59.965f }, { 0.0f, 0.0f, 0.0f } },
    { "t0304.mds", 0, { -5.0f, 0.0f, -45.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.0f, -45.0f }, { 0.0f, 0.0f, 0.0f } },
    { "t0305.mds", 0, { 45.0f, 0.0f, -50.0f }, { 0.0f, 0.0f, 0.0f } },
    { "t0002.mds", 0, { -23.7809f, 0.0f, 19.8331f }, { 0.0f, -4.4f, 0.0f } },
    { 0, 0, { 23.1908f, 0.0f, 38.0943f }, { 0.0f, -170.971f, 0.0f } },
    { "e01t01_0.mds", 0, { -45.0f, 0.1f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 65.0f, 0.1f, 45.0f }, { 0.0f, 0.0f, 0.0f } },
    { "e01t01_1.mds", 0, { 55.0f, 0.1f, -35.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.1f, 55.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { -55.0f, 0.1f, 5.0f }, { 0.0f, -90.0f, 0.0f } },
    { "e01c01_0.mds", 0, { 25.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.0f, 5.0f }, { 0.0f, -90.0f, 0.0f } },
    { "e01c02_0.mds", 0, { -45.0f, 0.0f, 25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.0f, 15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -5.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -15.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 15.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
    { "e01c06_0.mds", 0, { -45.0f, 0.0f, 35.0f }, { 0.0f, 180.0f, 0.0f } },
    { "e01c07_0.mds", 0, { -35.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 5.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { "e01c08_0.mds", 0, { 25.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -45.0f, -0.01f, 5.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { -45.0f, -0.01f, 25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -45.0f, -0.01f, 15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -5.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -15.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 15.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 25.0f, -0.01f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, -0.01f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, -0.01f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -45.0f, -0.01f, 35.0f }, { 0.0f, 180.0f, 0.0f } },
    { 0, 0, { -35.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 5.0f, -0.01f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { "e01w01_0.mds", 0, { 25.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.0f, 5.0f }, { 0.0f, -90.0f, 0.0f } },
    { "e01w02_0.mds", 0, { -45.0f, 0.0f, 25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -45.0f, 0.0f, 15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -5.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -15.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 15.0f, 0.0f, 5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -5.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 25.0f, 0.0f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
    { "e01w06_0.mds", 0, { -45.0f, 0.0f, 35.0f }, { 0.0f, 180.0f, 0.0f } },
    { "e01r02_0.mds", 0, { -35.0f, 0.05f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.05f, -35.0f }, { 0.0f, 90.0f, 0.0f } },
    { "e01r02_0.mds", 0, { -15.0f, 0.05f, -25.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -5.0f, 0.05f, -5.0f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { -15.0f, 0.05f, -15.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -25.0f, 0.05f, -5.0f }, { 0.0f, 90.0f, 0.0f } },
    { "e01r03_0.mds", 0, { -15.0f, 0.05f, -35.0f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -15.0f, 0.05f, -5.0f }, { 0.0f, 180.0f, 0.0f } },
    { "e01r06_0.mds", 0, { -35.0f, 0.05f, -5.0f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { 5.0f, 0.05f, -5.0f }, { 0.0f, -90.0f, 0.0f } },
    { "t0302.mds", 0, { 2.9721f, 0.06f, -0.6331f }, { 0.0f, 36.2109f, 0.0f } },
    { 0, 0, { 7.2685f, 0.06f, 11.4402f }, { 0.0f, -116.883f, 0.0f } },
    { 0, 0, { 2.9715f, 0.06f, 12.3798f }, { 0.0f, 135.9057f, 0.0f } },
    { 0, 0, { 7.6022f, 0.06f, -3.0402f }, { 0.0f, 75.5158f, 0.0f } },
    { 0, 0, { -35.9097f, 0.06f, 12.6724f }, { 0.0f, 145.6459f, 0.0f } },
    { "t0213.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
    { "t0306.mds", 0, { 45.0f, 0.0f, 50.0f }, { 0.0f, 90.0f, 0.0f } },
    { "t0307.mds", 0, { 45.0f, 0.0f, 50.0f }, { 0.0f, 180.0f, 0.0f } }
    };
    CFrameAttr attr;
    CFrameVu1* frame;
    int i;
    CFrameVu1* ground_frame;

    attr.unk_0C = 1;
    CharaDataBuffer[0].used = 0;

    for (i = 0; i < 76; i++) {
        if (norn[i].name) {
            frame = LoadMDSFile((u_int*)GetPackFile(read_buffer, norn[i].name, 0),
                                &CharaDataBuffer[0], 2, 0, 0);
        }

        if (i == 4) DoransFuusya[0] = frame;
        if (i == 74) DoransFuusya[1] = frame;
        if (i >= 69 && i < 74) TaimatsuFrame[i - 69] = frame;

        frame->SetAttr(attr, 1, 64);
        SetFrameAttr(frame, 1);

        CMapObject& object = OP_NornMapObj[i];

        object.Initialize();
        object.SetFrame(frame, 0);
        OP_NornMapObj[i].unk_38 = 0;
        OP_NornMapObj[i].unk_34 = 0;

        object.SetPosition(CVector3_f_(10.0f * norn[i].position[0],
                                           10.0f * norn[i].position[1],
                                           10.0f * norn[i].position[2]));
        object.SetRotation(CVector3_f_((float)(PI * norn[i].rotation[0] / 180),
                                           (float)(PI * norn[i].rotation[1] / 180),
                                           (float)(PI * norn[i].rotation[2] / 180)));

        object.FrameObjectOnOff("win1", 0);
        object.FrameObjectOnOff("light1", 0);

        if (norn[i].lod_name) {
            LoadFile(norn[i].lod_name, (void*)read_buffer, 0);
            object.lod_model = LoadMDSFile(read_buffer, &MapDataBuffer, 14, 0, 0);
            object.lod_distance = -20.0f;
        }
    }

    MAPOBJ_INFO ground[] = {
    { "t0006.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
    { "t0001.mds", 0, { -33.25f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -23.25f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -3.25f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 14.9146f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 24.9146f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 34.9146f, 0.03f, 13.0707f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 36.4833f, 0.03f, 17.4747f }, { 0.0f, -90.0f, 0.0f } },
    { 0, 0, { 6.657f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -24.5027f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -33.5025f, 0.03f, 52.2721f }, { 0.0f, -180.0f, 0.0f } },
    { 0, 0, { -35.0227f, 0.03f, 37.4712f }, { 0.0f, 90.0f, 0.0f } },
    { 0, 0, { -35.0227f, 0.03f, 27.4712f }, { 0.0f, 90.0f, 0.0f } },
    { "t0301.mds", 0, { -35.6934f, 0.0f, 20.4342f }, { 0.0f, 130.0f, 0.0f } },
    { 0, 0, { -32.5089f, 0.0f, 46.7067f }, { 0.0f, -74.3699f, 0.0f } },
    { 0, 0, { -10.4729f, 0.0f, 13.2973f }, { 0.0f, 79.7557f, 0.0f } },
    { 0, 0, { 15.1651f, 0.0f, 54.5186f }, { 0.0f, 207.0f, 0.0f } },
    { 0, 0, { 35.441f, 0.0f, 28.889f }, { 0.0f, 156.3029f, 0.0f } },
    { 0, 0, { -6.7649f, 0.0f, 49.889f }, { 0.0f, 17.6471f, 0.0f } },
    { 0, 0, { -17.6795f, 0.0f, 54.369f }, { 0.0f, 105.768f, 0.0f } },
    { 0, 0, { 34.153f, 0.0f, 39.193f }, { 0.0f, 42.628f, 0.0f } },
    { 0, 0, { 28.736f, 0.0f, 55.7777f }, { 0.0f, 121.467f, 0.0f } },
    { "t0003.mds", 0, { -28.23f, 0.03f, 13.1174f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 19.937f, 0.03f, 13.1174f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { 29.937f, 0.03f, 13.1174f }, { 0.0f, 0.0f, 0.0f } },
    { 0, 0, { -30.1013f, 0.03f, 52.3176f }, { 0.0f, -180.0f, 0.0f } },
    { "t0212.mds", 0, { 0.0f, 0.02f, 30.0f }, { 0.0f, 0.0f, 0.0f } },
    { "t0208.mds", 0, { 0.0f, 0.0f, 29.999f }, { 0.0f, 0.0f, 0.0f } },
    { "t0201.mds", 0, { 9.8278f, 0.0f, 22.3789f }, { 0.0f, -237.204f, 0.0f } },
    { 0, 0, { -11.6807f, 0.0f, 36.7247f }, { 0.0f, 281.7807f, 0.0f } },
    { "t0303.mds", 0, { 5.6932f, 0.0f, 21.7183f }, { 0.0f, -40.0f, 0.0f } },
    { 0, 0, { 8.0326f, 0.0f, 25.0416f }, { 0.0f, 57.0f, 0.0f } },
    { 0, 0, { 8.1469f, 0.0f, 18.4168f }, { 0.0f, 77.0f, 0.0f } },
    { 0, 0, { -11.9749f, 0.0f, 34.2407f }, { 0.0f, 157.0f, 0.0f } },
    { 0, 0, { -10.5469f, 0.0f, 36.1527f }, { 0.0f, 217.0f, 0.0f } },
    { 0, 0, { -18.8727f, 0.0f, 32.604f }, { 0.0f, 40.0f, 0.0f } },
    { 0, 0, { 12.1088f, 0.0f, 43.2429f }, { 0.0f, -55.0f, 0.0f } },
    { 0, 0, { -25.5735f, 0.0f, 30.4597f }, { 0.0f, -52.0f, 0.0f } },
    { 0, 0, { -27.1088f, 0.0f, 29.2536f }, { 0.0f, 22.0f, 0.0f } },
    { 0, 0, { -28.1088f, 0.0f, 33.4081f }, { 0.0f, 78.0f, 0.0f } },
    { "t0202.mds", 0, { 6.9352f, 0.0f, 22.8016f }, { 0.0f, -66.4631f, 0.0f } },
    { 0, 0, { -14.5591f, 0.0f, 35.5869f }, { 0.0f, 112.4143f, 0.0f } },
    { "t0203.mds", 0, { 8.5959f, 0.0f, 23.4822f }, { 0.0f, -49.7327f, 0.0f } },
    { 0, 0, { -13.0716f, 0.0f, 36.4929f }, { 0.0f, 129.2592f, 0.0f } },
    { 0, 0, { -14.4103f, 0.0f, 37.4364f }, { 0.0f, 112.5289f, 0.0f } },
    { "t0204.mds", 0, { 19.0043f, 0.0f, 20.5515f }, { 0.0f, 18.2201f, 0.0f } },
    { 0, 0, { 23.1962f, 0.0f, 27.52f }, { 0.0f, 71.7343f, 0.0f } },
    { 0, 0, { 19.0335f, 0.0f, 22.3668f }, { 0.0f, 39.5341f, 0.0f } },
    { 0, 0, { 15.9599f, 0.0f, 27.5015f }, { 0.0f, -11.6883f, 0.0f } },
    { 0, 0, { -11.7777f, 0.0f, 28.0256f }, { 0.0f, -16.9596f, 0.0f } },
    { 0, 0, { -8.2194f, 0.0f, 22.6732f }, { 0.0f, -23.3767f, 0.0f } },
    { 0, 0, { -8.9274f, 0.0f, 17.7011f }, { 0.0f, 28.9917f, 0.0f } },
    { 0, 0, { -15.2388f, 0.0f, 22.5856f }, { 0.0f, -15.5854f, 0.0f } },
    { 0, 0, { -12.4433f, 0.0f, 23.0674f }, { 0.0f, 15.2407f, 0.0f } },
    { 0, 0, { -11.3862f, 0.0f, 21.697f }, { 0.0f, -10.657f, 0.0f } },
    { 0, 0, { 11.704f, 0.0f, 38.1355f }, { 0.0f, -45.7425f, 0.0f } },
    { 0, 0, { 14.5128f, 0.0f, 38.3406f }, { 0.0f, -16.272f, 0.0f } },
    { 0, 0, { 10.6253f, 0.0f, 40.4613f }, { 0.0f, 25.3247f, 0.0f } },
    { 0, 0, { -21.0844f, 0.0f, 38.2517f }, { 0.0f, 50.0f, 0.0f } },
    { "t0205.mds", 0, { -11.6688f, 1.2789f, 36.7089f }, { 0.0f, -61.7649f, 0.0f } },
    { "t0206.mds", 0, { -4.3913f, 0.0f, 18.9443f }, { 0.0f, 18.3347f, 0.0f } },
    { 0, 0, { 13.2586f, 0.0f, 33.1962f }, { 0.0f, 110.58f, 0.0f } }
    };

    for (int j = 0; j < 62; j++) {
        if (ground[j].name) {
            ground_frame = LoadMDSFile((u_int*)GetPackFile(read_buffer, ground[j].name, 0),
                                       &CharaDataBuffer[6], 2, 0, 0);
        }

        if (j > 0) {
            ground_frame->SetAttr(attr, 1, 64);
            SetFrameAttr(ground_frame, 1);
        }

        if (j == 26) TaimatsuFrame[8] = ground_frame;

        CMapObject& object = OP_NornMapObj2[j];

        object.Initialize();
        object.SetFrame(ground_frame, 0);
        OP_NornMapObj2[j].unk_38 = 0;
        OP_NornMapObj2[j].unk_34 = 0;

        object.SetPosition(CVector3_f_(10.0f * ground[j].position[0],
                                           10.0f * ground[j].position[1],
                                           10.0f * ground[j].position[2]));
        object.SetRotation(CVector3_f_((float)(PI * ground[j].rotation[0] / 180),
                                           (float)(PI * ground[j].rotation[1] / 180),
                                           (float)(PI * ground[j].rotation[2] / 180)));

        if (j == 0) {
            object.FrameObjectOnOff("sun3", 0);
        }
    }
}

/* The tick's motion. Every one of the twenty-three actors the script is displaying takes whatever
   it last asked for — a motion whose frame has run past its last key falls through to the motion
   queued behind it — and is then placed from a frame of the camera's own model found by name, which
   is how an actor walks with a camera move animated in the same file. The name table is two entries
   shorter than the loop that reads it, which is the original's own reach past its end.

   The last camera of the scene is the one the fire and the windmill are timed against: while it
   runs, the motion step drops to a twentieth and the camera shakes by a random amount whose spread
   narrows as the shot goes on. */
void OpC_MotionProcess()
{
    for (int i = 0; i < 23; i++) {
        if (CScript.obj[i].disp) {
            if (CScript.obj[i].motion_end != -1) {
                if (Chara[i].motion_type.state.time >
                    (float)(Chara[i].motion_type.motion_info[CScript.obj[i].motion].end - 1)) {
                    CScript.obj[i].motion = CScript.obj[i].motion_end;
                    CScript.obj[i].motion_end = -1;
                }
            }

            Chara[i].motion_type.state.unk_08 = CScript.obj[i].step;
            Chara[i].motion_no = CScript.obj[i].motion;
            Chara[i].flags = 0;
            Chara[i].motion_speed = -1.0f;
        }
    }

    typedef float MotionLocal0, MotionLocal1, MotionLocal2, MotionLocal3, MotionLocal4,
        MotionLocal5, MotionLocal6, MotionLocal7, MotionLocal8, MotionLocal9,
        MotionLocal10, MotionLocal11, MotionLocal12, MotionLocal13, MotionLocal14,
        MotionLocal15, MotionLocal16, MotionLocal17, MotionLocal18, MotionLocal19,
        MotionLocal20, MotionLocal21, MotionLocal22, MotionLocal23;
    char* name[21] = { "", "c08a", "", "", "c08a", "point", "", "", "", "p09a", "", "c01d", "p03a",
                       "p08a", "p05b", "p01a", "p12a", "p07a", "p02a", "p15a", "p16a" };
    sceVu0FMATRIX matrix;

    for (int i = 0; i < 23; i++) {
        if (CScript.obj[i].disp) {
            CFrame* frame = Cam[SceneNp].frame->SearchFrame(name[i]);

            if (frame) {
                frame->GetLWMatrix(matrix);
                Chara[i].SetRotation(0.0f, atan2f(matrix[2][0], matrix[2][2]), 0.0f);
                float x = matrix[3][0];
                float y = matrix[3][1];
                float z = matrix[3][2];
                Chara[i].SetPosition(x, y, z);
            }
        }
    }

    if (CScript.obj[1].disp) {
        CFrame* frame = Chara[1].frame->SearchFrame("f0");

        if (frame) {
            sceVu0FMATRIX beem;

            frame->GetLWMatrix(beem);
            sceVu0Normalize(beem[0], beem[0]);
            sceVu0Normalize(beem[1], beem[1]);
            sceVu0Normalize(beem[2], beem[2]);
            Chara[3].SetPosition(0.0f, 0.0f, 0.0f);
            Chara[3].SetRotation(0.0f, 0.0f, 0.0f);
            Chara[3].frame->SetTransMatrix(beem);
        }
    }

    sceVu0FVECTOR dir;

    dir[0] = -0.1f;
    dir[2] = 0.1f;
    dir[1] = 0.0f;
    dir[3] = 0.0f;
    Wind.SetDir(dir);
    Wind.SetVelocity(0.2f);
    Chara[11].unk_C98 = (int)&Wind;
    Wind.Step();

    static int camera = 0;

    if (camera != CScript.camera_start) {
        camera = CScript.camera_start;

        switch (camera) {
        case 59:
        case 95:
            Chara[11].ClothStep(-1);
            for (int i = 0; i < 10; i++) {
                Chara[11].ClothStep(0);
            }
            break;

        case 75:
            Chara[4].motion_type.state.time = 5.0f;
            break;

        case 76:
            Chara[4].motion_type.state.time = 5.0f;
            Chara[1].motion_type.state.time = 35.0f;
            break;

        case 77:
            Chara[1].motion_type.state.time = 35.0f;
            break;
        }
    }

    if (!Pause) {
        ObjAnimePlay(&Fuusya[0]);

        if (CScript.scene != 7) {
            ObjAnimePlay(&Fuusya[1]);
        } else if (CScript.camera_start > 34) {
            ObjAnimePlay(&Fuusya[1]);
        }
    }

    if (!Pause) {
        if (CScript.scene == 7) {
            for (int i = 0; i < 5; i++) {
                ObjAnimePlay(&Taimatsu[i]);
            }

            ObjAnimePlay(&Taimatsu[8]);
        } else {
            for (int i = 0; i < 9; i++) {
                ObjAnimePlay(&Taimatsu[i]);
            }
        }
    }

    static float step = 0.5f;
    static float d = 2.0f;

    switch (CScript.camera_start) {
    case 96:
        Fuusya[1].step = -0.12f;
        break;

    case 97:
        d = 2.0f;
        Fuusya[1].step = -0.04f;
        break;

    case 100:
        if (Cam[SceneNp].motion_type.state.time < 258.0f) {
            step = 0.025f;
            Fuusya[1].step = -0.0048f;

            if (FireStep >= 1.0f) {
                FireStep = 0.0f;
            }

            FireStep += 0.1f;
        } else {
            if (Cam[SceneNp].motion_type.state.time < 270.0f) {
                sceVu0FVECTOR ref;

                OP_MainCamera.GetRef(ref);

                if (d < 100.0f) {
                    d += 0.5f;
                }

                ref[1] += (float)(rand() % 10) / d;
                OP_MainCamera.SetRef(ref);
            }

            step = 0.5f;
            Fuusya[1].step = -10.0f;
            FireStep = 1.0f;
        }

        Op_MotionInfo.speed = step;
        CScript.motion_step = step;
        Chara[11].motion_type.motion_info[5].speed = step;
        break;
    }

    if (CScript.obj[4].load != -1) {
        LoadCharaMajin();
    }
}

/* The demon's second half, which is loaded while the scene is already running: the script asks for
   it by putting a load number on the actor, and this is the three ticks that answer — start the
   read, wait for it, unpack it — after which both numbers go back to none. */
static void LoadCharaMajin()
{
    switch (CScript.obj[4].load_motion) {
    case 0:
        LoadFileBG("opdat/norn2/majinb.pak", (u_long128*)read_buffer, 0);
        CScript.obj[4].load_motion = 1;
        break;

    case 1:
        if (!ReadBGSync()) {
            CScript.obj[4].load_motion = 2;
        }
        break;

    case 2:
        Chara[4].Initialize();
        Chara[4].LoadPackData(read_buffer, "04c08b.cfg",  &CharaDataBuffer[6], 0);
        Chara[4].motion_type.state.time = 5.0f;
        Chara[4].motion_type.state.unk_08 = 1.0f;
        Chara[4].motion_type.state.motion_no = 0;
        Chara[4].motion_type.state.playing_no = 0;
        CScript.obj[4].load = -1;
        CScript.obj[4].load_motion = -1;
        break;
    }
}

/* The tick's sound. Most of the scene is a table played against one counter — a row states which
   sample goes on which tick of the count, which is what keeps a long cut in step without the script
   naming every effect — and the four footfalls beside it are windows on an actor's own motion frame
   with a wait behind them, so a motion that stalls inside a window plays the step once. Which of
   the two footfall samples the first actor takes is decided by which camera is running and how far
   its motion has gone, because the ground under him changes part way through the scene. */
void OpC_SoundProcess()
{
    static float vol = 40.0f;
    static int cnt = 0;

    if (!DanceBgmStart) {
        vol = 40.0f;

        if (CScript.camera_start >= 58) {
            DanceBgmCnt = DanceBgmCnt + 1;
        }

        if (DanceBgmCnt == 63) {
            OpBgmSqPort = 0;
            OpBgmPlay();
        }
    }

    static int se = 0;

    if (CScript.camera_start == 70) {
        if (!se) {
            CSnd.SQ_Play(1, 0);
            se = 1;
        }
    } else {
        se = 0;
    }

    if (CScript.camera_start < 69) {
        sceVu0FVECTOR river1 = { 50.0f, 100.0f, -100.0f, 0.0f };

        OpSetVolPanSE(river1, 50.0f, 500.0f, 15, 16, 21);

        sceVu0FVECTOR river2 = { 0.0f, 0.0f, 0.0f, 0.0f };

        float river2Near;
        float river2Far;
        river2Far = (float)(CScript.camera_start - CScript.camera_start + 500);
        river2Near = 50.0f;
        OpSetVolPanSE(river2, river2Near, river2Far, 15, 16, 22);

        sceVu0FVECTOR river3 = { 0.0f, 0.0f, 300.0f, 0.0f };

        float river3Near;
        float river3Far;
        river3Far = (float)(cnt - cnt + 300);
        river3Near = 100.0f;
        OpSetVolPanSE(river3, river3Near, river3Far, 15, 16, 24);
    }

    static SND_INFO SndInfo[43] = {
        { 14, 40, 50, 893, 0, 90 },
        { 14, 40, 55, 1100, 0, 127 },
        { 14, 40, 52, 1100, 1, 127 },
        { 14, 40, 52, 1292, 0, 127 },
        { 14, 40, 56, 1292, 1, 127 },
        { 14, 40, 57, 1292, 2, 127 },
        { 14, 40, 52, 1554, 0, 127 },
        { 14, 40, 57, 1554, 1, 127 },
        { 14, 40, 53, 1585, 0, 127 },
        { 14, 40, 55, 1585, 1, 127 },
        { 14, 40, 52, 1863, 0, 127 },
        { 14, 40, 57, 1863, 1, 127 },
        { 14, 40, 52, 2033, 0, 127 },
        { 14, 40, 57, 2033, 1, 127 },
        { 14, 40, 52, 2115, 0, 127 },
        { 14, 40, 57, 2115, 0, 127 },
        { 14, 40, 53, 2156, 0, 127 },
        { 14, 40, 55, 2156, 1, 127 },
        { 14, 40, 53, 2217, 0, 127 },
        { 14, 40, 57, 2217, 1, 127 },
        { 14, 40, 53, 2275, 0, 127 },
        { 14, 40, 55, 2275, 1, 127 },
        { 14, 40, 59, 2349, 0, 127 },
        { 14, 40, 71, 2441, 0, 80 },
        { 14, 40, 61, 2445, 0, 127 },
        { 14, 40, 62, 2469, 0, 127 },
        { 14, 40, 64, 2503, 0, 127 },
        { 14, 40, 65, 2528, 0, 127 },
        { 14, 40, 62, 2528, 0, 127 },
        { 14, 40, 66, 2586, 0, 127 },
        { 14, 40, 61, 2588, 1, 127 },
        { 14, 40, 67, 2642, 0, 127 },
        { 14, 40, 61, 2686, 0, 127 },
        { 14, 40, 69, 2740, 0, 127 },
        { 14, 40, 62, 2756, 0, 127 },
        { 14, 40, 69, 2810, 0, 127 },
        { 14, 40, 72, 3006, 3, 100 },
        { 14, 1, 67, 3006, 4, 127 },
        { 14, 40, 67, 3307, 0, 127 },
        { 14, 40, 74, 3339, 0, 127 },
        { 14, 40, 74, 3572, 0, 127 },
        { 14, 40, 75, 4255, 0, 127 },
        { 14, 40, 77, 4305, 0, 127 }
    };

    if (!Pause && CScript.camera_start >= 70) {
        SndCnt = SndCnt + 1;
    }

    for (int i = 0; i < 43; i++) {
        if (SndCnt == SndInfo[i].count) {
            OpPlayVolSE(SndInfo[i].group, SndInfo[i].no, SndInfo[i].voice, 1.0f);
        }
    }

    int ground = 40;

    if (CScript.camera_start == 58 && Cam[SceneNp].motion_type.state.time < 80.0f) {
        ground = 44;
    }

    if (CScript.camera_start == 67 && Cam[SceneNp].motion_type.state.time > 45.0f) {
        ground = 44;
    }

    if (CScript.camera_start == 67 && Cam[SceneNp].motion_type.state.time > 70.0f) {
        ground = 40;
    }

    if (CScript.obj[11].motion == 2 || CScript.obj[11].motion == 7) {
        static int wait = 0;
        sceVu0FVECTOR position;
        float frame;

        sceVu0CopyVector(position, Chara[11].pos);
        frame = (int)Chara[11].motion_type.state.time;

        if (wait == 0) {
            if (frame > 73.0f && frame < 75.0f) {
                if (ground == 40) {
                    OpPlayVolPanSE(position, 10.0f, 400.0f, 14, 21, 20);
                } else {
                    OpPlayVolPanSE(position, 10.0f, 400.0f, 14, 21, 32);
                }

                wait = 4;
            } else if (frame > 83.0f && frame < 85.0f) {
                if (ground == 40) {
                    OpPlayVolPanSE(position, 10.0f, 400.0f, 14, 21, 21);
                } else {
                    OpPlayVolPanSE(position, 10.0f, (float)(ground - ground + 400), 14, 21, 33);
                }

                wait = 4;
            }
        } else {
            wait = wait - 1;
        }
    }

    if (CScript.obj[11].motion == 5) {
        static int wait = 0;
        sceVu0FVECTOR position;
        float frame;

        sceVu0CopyVector(position, Chara[11].pos);
        frame = (int)Chara[11].motion_type.state.time;

        if (wait == 0) {
            if (frame > 258.0f && frame < 260.0f) {
                OpPlayVolPanSE(position, 10.0f, 400.0f, 14, 21, 20);
                wait = 4;
            } else if (frame > 268.0f && frame < 270.0f) {
                OpPlayVolPanSE(position, 10.0f, 400.0f, 14, 21, 21);
                wait = 4;
            }
        } else {
            wait = wait - 1;
        }
    }

    if (CScript.obj[13].disp) {
        static int wait = 0;
        sceVu0FVECTOR position;
        float frame;

        sceVu0CopyVector(position, Chara[13].pos);
        frame = (int)Chara[13].motion_type.state.time;

        if (wait == 0) {
            if (frame > 123.0f && frame < 125.0f) {
                OpPlayVolPanSE(position, 10.0f, (float)(wait - wait + 300), 14, 21, 20);
                wait = 4;
            } else if (frame > 133.0f && frame < 135.0f) {
                OpPlayVolPanSE(position, 10.0f, (float)(wait - wait + 300), 14, 21, 21);
                wait = 4;
            }
        } else {
            wait = wait - 1;
        }
    }

    if (CScript.scene == 6 && CScript.obj[12].disp) {
        static int wait = 0;
        sceVu0FVECTOR position;
        float frame;

        sceVu0CopyVector(position, Chara[12].pos);
        frame = (int)Chara[12].motion_type.state.time;

        if (wait == 0) {
            if (frame > 33.0f && frame < 35.0f) {
                OpPlayVolPanSE(position, 10.0f, (float)(wait - wait + 300), 14, 21, 20);
                wait = 4;
            } else if (frame > 43.0f && frame < 45.0f) {
                OpPlayVolPanSE(position, 10.0f, 300.0f, 14, 21, 21);
                wait = 4;
            }
        } else {
            wait = wait - 1;
        }
    }
}

/* The tick's drawing, in the order the frame is built: the fog and the projection the camera asks
   for, the world, the light the lightning flash overrides, the depth of field, the actors' shadows
   onto the one buffer that holds them all, the actors themselves, the water, the map's own shadows,
   the fires, the beam and the explosions. The light and the ambient colour are saved on the way in
   and put back on the way out, because every object in the scene is lit from its own position by
   LightSet rather than from one light for the whole frame. */
void OpC_DrawProcess()
{
    sceVu0FMATRIX light_save;
    sceVu0FVECTOR ambient_save;
    float far_fog;

    sceVu0CopyMatrix(light_save, light);
    sceVu0CopyVector(ambient_save, ambientlight);
    far_fog = op_fogRate[1];

    switch (CScript.camera_start) {
    case 58:
    case 62:
    case 90:
        far_fog = 10000;
        break;

    case 59:
    case 61:
        far_fog = 600.0f;
        break;

    case 64:
        typedef float RenderPhase0, RenderPhase1, RenderPhase2;
        MGSetRenderInfo(mgRenderInfo.scale[0], 6.0f, 0xffff);
        break;

    case 74:
    case 91:
    case 92:
    case 97:
    case 99:
        MGSetRenderInfo(mgRenderInfo.scale[0], 4.0f, 0xffff);
        break;

    default:
        typedef float DefaultRenderPhase;
        MGSetRenderInfo(mgRenderInfo.scale[0], 8.0f, 0xffff);
        break;
    }

    MGSetFogParm(op_fogRate[0], far_fog, op_fogColor[0], op_fogColor[1], op_fogColor[2],
                 op_fogRate[2], op_fogRate[3]);

    switch (CScript.scene) {
    case 5:
        TexManager.ReloadTexture(Vif1Packet, 10);

        for (int i = 0; i < 3; i++) {
            ((CMapObject&)OP_NornMapObj3[i]).Draw();
        }

        if (CScript.camera_start < 72) {
            ((CMapObject&)OP_NornMapObj3[3]).Draw();
        }
        break;

    case 7:
        TexManager.ReloadTexture(Vif1Packet, 10);

        for (int i = 0; i < 74; i++) {
            CMapObject& object = OP_NornMapObj[i];
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, object.pos);
            LightSet(position[0], position[1], position[2], 0);
            object.Draw();
        }

        if (CScript.camera_start == 100 &&
            Cam[SceneNp].motion_type.state.time > 262.0f) {
            CMapObject& object = OP_NornMapObj[75];
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, object.pos);
            LightSet(position[0], position[1], position[2], 0);
            object.Draw();
        } else {
            CMapObject& object = OP_NornMapObj[74];
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, object.pos);
            LightSet(position[0], position[1], position[2], 0);
            object.Draw();
        }

        TexManager.ReloadTexture(Vif1Packet, 11);

        for (int i = 0; i < 26; i++) {
            CMapObject& object = OP_NornMapObj2[i];
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, object.pos);
            LightSet(position[0], position[1], position[2], 0);
            object.Draw();
        }

        TexManager.ReloadTexture(Vif1Packet, 12);

        for (int i = 26; i < 62; i++) {
            CMapObject& object = OP_NornMapObj2[i];
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, object.pos);
            LightSet(position[0], position[1], position[2], 0);
            object.Draw();
        }
        break;

    default:
        TexManager.ReloadTexture(Vif1Packet, 10);

        for (int i = 0; i < 75; i++) {
            CMapObject& object = OP_NornMapObj[i];
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, object.pos);
            LightSet(position[0], position[1], position[2], 0);
            object.Draw();
        }

        TexManager.ReloadTexture(Vif1Packet, 11);

        for (int i = 0; i < 41; i++) {
            CMapObject& object = OP_NornMapObj2[i];
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, object.pos);
            LightSet(position[0], position[1], position[2], 0);
            object.Draw();
        }

        TexManager.ReloadTexture(Vif1Packet, 12);

        for (int i = 41; i < 87; i++) {
            CMapObject& object = OP_NornMapObj2[i];
            sceVu0FVECTOR position;

            sceVu0CopyVector(position, object.pos);
            LightSet(position[0], position[1], position[2], 0);
            object.Draw();
        }
        break;
    }

    static int flg = 0;
    static int bright = 255;

    if (CScript.sprite == 1) {
        CScript.sprite = 0;
        flg = 1;
        bright = 255;
    }

    if (flg == 1) {
        sceVu0FMATRIX color;

        sceVu0CopyMatrix(color, lightcolor);

        int on = 0;

        if (color[0][0] < (float)bright) {
            color[0][0] = (float)bright;
            on = 1;
        }

        if (color[0][1] < (float)bright) {
            color[0][1] = (float)bright;
            on = 1;
        }

        if (color[0][2] < (float)bright) {
            color[0][2] = (float)bright;
            on = 1;
        }

        bright = bright - 4;
        MGSetPLight(light, color);

        if (!on) {
            flg = 0;
        }
    } else {
        bright = 255;
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    switch (CScript.camera_start) {
    case 58:
    case 60:
    case 70:
    case 71:
        break;

    case 62: {
            float dof[2] = { 200.0f, 400.0f };

            DepthOfField(dof, 2, 32, 0);
        }
        break;

    case 63:
    case 64:
    case 65:
    case 66: {
            float dof[2] = { 200.0f, 400.0f };

            DepthOfField(dof, 2, 64, 0);
        }
        break;

    default: {
            float dof[2] = { 200.0f, 400.0f };

            DepthOfField(dof, 2, 48, 0);
        }
        break;
    }

    if (CScript.scene == 5 && CScript.camera_start > 76 && CScript.camera_start < 86) {
        sceGsTex0 back;

        MGGetFBuffBackTex(&back);

        CTexture texture;

        texture.tex0 = *(u_long*)&back;
        set2DSprite(Vif1Packet, &texture, CRect<int>(0, 0, 640, 448), CRect<int>(0, 0, 640, 224),
                    128, 128, 128, 105);
    }

    for (int i = 0; i < 23; i++) {
        if (KageCheck(i) && CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, 23);
            MGBeginDrawShadow(*(sceGsTex0*)&TexManager.GetTexture("shadow_buff", -1)->tex0);

            if (!Pause) {
                Chara[i].ShadowStep();
            }

            if (CScript.scene != 5) {
                sceVu0FVECTOR position;

                sceVu0CopyVector(position, Chara[i].pos);
                LightSet(position[0], position[1], position[2], 1);
            }

            Chara[i].DrawShadow();
            MGEndDrawShadow(52);
        }
    }

    for (int i = 0; i < 23; i++) {
        if (CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);

            if (!Pause) {
                Chara[i].Step();
                Chara[i].ClothStep(0);
            }

            if (CScript.scene != 5) {
                sceVu0FVECTOR position;

                sceVu0CopyVector(position, Chara[i].pos);
                LightSet(position[0], position[1], position[2], 0);
            }

            FaceChangeD(i);
            Chara[i].Draw();
        }
    }

    if (CScript.scene == 4) {
        InchikiShadow();
        DrawDancer();
    }

    if (CScript.camera_start > 66 && CScript.camera_start < 69) {
        TexManager.ReloadTexture(Vif1Packet, 10);
        WaterProcess();
    }

    if (CScript.scene != 5 && CScript.camera_start < 60) {
        TexManager.ReloadTexture(Vif1Packet, 23);
        MGBeginDrawShadow(*(sceGsTex0*)&TexManager.GetTexture("shadow_buff", -1)->tex0);

        if (CScript.scene != 7) {
            for (int i = 0; i < 75; i++) {
                CMapObject& object = OP_NornMapObj[i];
                sceVu0FVECTOR position;

                sceVu0CopyVector(position, object.pos);
                LightSet(position[0], position[1], position[2], 0);
                object.DrawShadow(0);
            }
        } else {
            for (int i = 0; i < 76; i++) {
                CMapObject& object = OP_NornMapObj[i];
                sceVu0FVECTOR position;

                sceVu0CopyVector(position, object.pos);
                LightSet(position[0], position[1], position[2], 0);
                object.DrawShadow(0);
            }
        }

        MGEndDrawShadow(52);
    }

    if (CScript.scene != 5 && OP_FireList > 0) {
        TexManager.ReloadTexture(GetVif1Packet(), 0);

        if (!Pause && FireStep >= 1.0f) {
            CFire.FireStep();
        }

        CFire.FireCreate();
        OP_CharaFrame = Cam[SceneNp].frame;

        sceVu0FVECTOR eye;

        sceVu0CopyVector(eye, OP_CharaFrame->position);

        if (CScript.scene != 7) {
            for (int i = 0; i < 22; i++) {
                float z = OP_FirePosition[i][2];
                float y = OP_FirePosition[i][1];
                float x = OP_FirePosition[i][0];

                CFire.position[0] = 10.0f * x;
                CFire.position[1] = 10.0f * y;
                CFire.position[2] = 10.0f * z;
                CFire.position[3] = 1.0f;

                int flg = OP_FireFlg[i];

                if (flg == 1) {
                    CFire.DrawFire(1, 1, &OP_MainCamera, eye, OP_FireScale[i], 3,
                                   (float)(15.0 * OP_FireScale[i]));
                } else {
                    CFire.DrawFire(1, 1, &OP_MainCamera, eye, OP_FireScale[i], 2, 15.0f);
                }
            }
        } else {
            for (int i = 0; i < OP_FireList; i++) {
                if (i < 22) {
                    OP_FirePosition[i][1] = -100.0f;
                }

                float z = OP_FirePosition[i][2];
                float y = OP_FirePosition[i][1];
                float x = OP_FirePosition[i][0];

                CFire.position[0] = 10.0f * x;
                CFire.position[1] = 10.0f * y;
                CFire.position[2] = 10.0f * z;
                CFire.position[3] = 1.0f;

                int flg = OP_FireFlg[i];

                if (flg == 1) {
                    CFire.DrawFire(1, 1, &OP_MainCamera, eye, OP_FireScale[i], 3, 15.0f);
                } else {
                    CFire.DrawFire(1, 1, &OP_MainCamera, eye, OP_FireScale[i], 2, 15.0f);
                }
            }
        }
    }

    if (CScript.scene >= 5) {
        if (CScript.camera_start == 77 &&
            Cam[SceneNp].motion_type.state.time > 37.5f && !MajinBgmStart) {
            MajinBgmStart = 1;
            OpBgmSqPort = 0;
            OpBgmPlay();
            CSnd.Fade(1, -1.0f, 0);
        }

        MajinBeemProcess();
    }

    if (CScript.scene == 7) {
        TexManager.ReloadTexture(Vif1Packet, 17);
        SmokeProcess();
    }

    if (CScript.scene >= 6) {
        if (CScript.bom_req) {
            int no = CScript.bom_no;
            float size = CScript.bom_size[no];

            for (int i = 0; i < 8; i++) {
                sceVu0CopyVector(CBomb[no].positions[i], CScript.bom_pos[no]);
                CBomb[no].phases[i] = 0;
                CBomb[no].counters[i] = -(i * 3);
                CBomb[no].alphas[i] = 128.0f;
                CBomb[no].sizes[i] = size;
                CBomb[no].active[i] = 1;
            }

            CBomb[no].phases[0] = 2;
            CBomb[no].phases[1] = 1;
            CBomb[no].alphas[5] = 32.0f;
            CBomb[no].alphas[6] = 32.0f;
            CBomb[no].alphas[7] = 32.0f;
            CScript.bom_req = 0;
        }

        TexManager.ReloadTexture(Vif1Packet, 17);

        int dust;

        if (CScript.camera_start == 100) {
            dust = 1;
        } else {
            dust = 0;
        }

        for (int i = 0; i < 3; i++) {
            if (!Pause) {
                CBomb[i].Step();
            }

            CBomb[i].Draw(&OP_MainCamera, dust);
        }
    }

    sceVu0CopyMatrix(light, light_save);
    sceVu0CopyVector(ambientlight, ambient_save);
    MGSetPLight(light, lightcolor);
    MGSetAmbient(ambientlight);
}

/* The two dancers the crowd is watching, which are drawn from the camera's own frame tree rather
   than from the scene: each is placed where a named frame of the camera's model stands, lit from
   there, and given a pair of foot shadows of its own. */
static void DrawDancer()
{
    sceVu0FMATRIX matrix;
    register float zero = 0.0f;

    if (CScript.obj[19].disp) {
        TexManager.ReloadTexture(Vif1Packet, CharaTex[19]);
        CharaF[0] = Chara[19].frame;

        CFrame* frame = Cam[SceneNp].frame->SearchFrame("p15a1");

        if (frame) {
            frame->GetLWMatrix(matrix);
            CharaF[0]->SetRotation(0.0f, atan2f(matrix[2][0], matrix[2][2]), (float)zero);
            float x = matrix[3][0];
            float y = matrix[3][1];
            float z = matrix[3][2];
            CharaF[0]->SetPosition(x, y, z);
            LightSet(matrix[3][0], matrix[3][1], matrix[3][2], 0);
            MGDraw(CharaF[0]);

            frame = CharaF[0]->SearchFrame("r_foot");

            if (frame) {
                frame->GetLWMatrix(matrix);
                DrawShadow(10, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
            }

            frame = CharaF[0]->SearchFrame("l_foot");

            if (frame) {
                frame->GetLWMatrix(matrix);
                DrawShadow(11, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
            }
        }

        TexManager.ReloadTexture(Vif1Packet, CharaTex[19]);
        CharaF[1] = Chara[19].frame;

        CFrame* frame2 = Cam[SceneNp].frame->SearchFrame("p15a2");

        if (frame2) {
            frame2->GetLWMatrix(matrix);
            CharaF[1]->SetRotation((float)zero, atan2f(matrix[2][0], matrix[2][2]), zero);
            float x = matrix[3][0];
            float y = matrix[3][1];
            float z = matrix[3][2];
            CharaF[1]->SetPosition(x, y, z);
            LightSet(matrix[3][0], matrix[3][1], matrix[3][2], 0);
            MGDraw(CharaF[1]);

            frame = CharaF[1]->SearchFrame("r_foot");

            if (frame) {
                frame->GetLWMatrix(matrix);
                DrawShadow(12, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
            }

            frame = CharaF[1]->SearchFrame("l_foot");

            if (frame) {
                frame->GetLWMatrix(matrix);
                DrawShadow(13, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
            }
        }
    }

    float dancer_tail;
    if (CScript.obj[20].disp) {
        TexManager.ReloadTexture(Vif1Packet, CharaTex[20]);
        CharaF[2] = Chara[20].frame;

        CFrame* frame = Cam[SceneNp].frame->SearchFrame("p16a1");

        if (frame) {
            sceVu0FMATRIX matrix2;

            frame->GetLWMatrix(matrix2);
            CharaF[2]->SetRotation(0.0f, atan2f(matrix2[2][0], matrix2[2][2]), (float)zero);
            float x = matrix2[3][0];
            float y = matrix2[3][1];
            float z = matrix2[3][2];
            CharaF[2]->SetPosition(x, y, z);
            LightSet(matrix2[3][0], matrix2[3][1], matrix2[3][2], 0);
            MGDraw(CharaF[2]);

            frame = CharaF[2]->SearchFrame("r_foot");

            if (frame) {
                frame->GetLWMatrix(matrix2);
                DrawShadow(14, (float)matrix2[3][0], (float)matrix2[3][1], (float)matrix2[3][2]);
            }

            frame = CharaF[2]->SearchFrame("l_foot");

            if (frame) {
                frame->GetLWMatrix(matrix2);
                DrawShadow(15, (float)matrix2[3][0], (float)matrix2[3][1], (float)matrix2[3][2]);
            }
        }
    }
}

/* Every dancer's feet, drawn as sixteen flat models placed under the frames they belong to rather
   than as shadows the renderer casts, which is what the name says: the scene has more actors than
   the shadow buffer would hold. */
static void InchikiShadow()
{
    sceVu0FMATRIX matrix;
    CFrame* frame;

    if (CScript.obj[14].disp) {
        frame = Chara[14].frame->SearchFrame("r_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(0, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }

        frame = Chara[14].frame->SearchFrame("l_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(1, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }
    }

    if (CScript.obj[15].disp) {
        frame = Chara[15].frame->SearchFrame("r_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(2, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }

        frame = Chara[15].frame->SearchFrame("l_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(3, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }
    }

    if (CScript.obj[16].disp) {
        frame = Chara[16].frame->SearchFrame("r_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(4, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }

        frame = Chara[16].frame->SearchFrame("l_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(5, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }
    }

    if (CScript.obj[17].disp) {
        frame = Chara[17].frame->SearchFrame("eff19");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(4, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }

        frame = Chara[17].frame->SearchFrame("eff7");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(5, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }
    }

    if (CScript.obj[18].disp) {
        frame = Chara[18].frame->SearchFrame("r_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(4, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }

        frame = Chara[18].frame->SearchFrame("l_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(5, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }
    }

    if (CScript.obj[19].disp) {
        frame = Chara[19].frame->SearchFrame("r_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(6, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }

        frame = Chara[19].frame->SearchFrame("l_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(7, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }
    }

    if (CScript.obj[20].disp) {
        frame = Chara[20].frame->SearchFrame("r_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(6, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }

        frame = Chara[20].frame->SearchFrame("l_foot");

        if (frame) {
            frame->GetLWMatrix(matrix);
            DrawShadow(7, (float)matrix[3][0], (float)matrix[3][1], (float)matrix[3][2]);
        }
    }
}

/* One of those flat models, placed and turned to face the light rather than the camera. The ambient
   colour it is drawn under falls with the height it is drawn at, so a foot lifted far enough off
   the ground has no shadow at all. */
static void DrawShadow(int no, float x, float y, float z)
{
    sceVu0FVECTOR ambient = { 0.0f, 0.0f, 0.0f, 54.0f };

    TexManager.ReloadTexture(Vif1Packet, 17);
    ambient[3] = ambient[3] - 10.0f * y;

    if (ambient[3] > 0.0f) {
        MGSetAmbient(ambient);

        float dir = atan2f(x, z - 300.0f);

        Shadow[no]->SetPosition(x, 0.05f, z);
        Shadow[no]->SetRotation(1.5533431f, dir, 0.0f);
        MGDraw(Shadow[no]);
        MGSetAmbient(ambientlight);
    }
}

/* The beam the demon fires, which is started by the script and then runs on its own. A beam the
   script marks as ending is aimed from a frame of the demon's own model at the frame the camera
   carries; one it does not is aimed between the two points the script names. The tail is filled
   with sixty copies of the head so that the first tick has a trail to shift along. */
static void MajinBeemProcess()
{
    char* name[10] = { "yubi", "heso", "l_asi", "r_asi", "kuti", "toutyou", "yubi", "yubi", "yubi",
                       "heso" };

    if (CScript.beem_req) {
        float speed;

        if (CScript.scene == 5) {
            speed = 4.5f;
        } else {
            speed = 8.0f;
        }

        int no = CScript.beem_no;

        if (CScript.beem_end) {
            static sceVu0FVECTOR pos = {0.0f, 0.0f, 0.0f, 0.0f};
            static sceVu0FVECTOR pos2 = {0.0f, 0.0f, 0.0f, 0.0f};
            sceVu0FMATRIX matrix;

            CFrame* frame = Chara[1].frame->SearchFrame(name[MBeemCnt]);

            MBeemCnt = MBeemCnt + 1;

            if (frame) {
                frame->GetLWMatrix(matrix);
                pos[0] = matrix[3][0];
                pos[1] = matrix[3][1];
                pos[2] = matrix[3][2];
            }

            CFrame* end = Cam[SceneNp].frame->SearchFrame("end");

            if (end) {
                end->GetLWMatrix(matrix);
                pos2[0] = matrix[3][0];
                pos2[1] = matrix[3][1];
                pos2[2] = matrix[3][2];
            }

            if (MBeemCnt - 1 == 2 || MBeemCnt - 1 == 3) {
                sceVu0CopyVector(CBeem[no].target, pos2);
                CBeem[no].speed = speed;

                for (int i = 0; i < 60; i++) {
                    sceVu0CopyVector(CBeem[no].positions[i], pos);
                    CBeem[no].state = 0;
                    CBeem[no].counters[i] = -i;
                    CBeem[no].alphas[i] = 128.0f - (float)(2 * i);
                    CBeem[no].sizes[i] = 20.0f - (float)(i / 3);

                    if (CBeem[no].sizes[i] < 8.0f) {
                        CBeem[no].sizes[i] = 8.0f;
                    }

                    CBeem[no].active = 1;
                }

                for (int i = 0; i < 10; i++) {
                    CBeem[no].sizes[i] = 20.0f;
                }

                CBeem[no].alphas[59] = 128.0f;
                CBeem[no].sizes[59] = 48.0f;
            } else {
                sceVu0CopyVector(CBeem[no].target, pos2);
                CBeem[no].speed = speed;

                for (int i = 0; i < 60; i++) {
                    sceVu0CopyVector(CBeem[no].positions[i], pos);
                    CBeem[no].state = 0;
                    CBeem[no].counters[i] = -i;
                    CBeem[no].alphas[i] = 128.0f - (float)(2 * i);
                    CBeem[no].sizes[i] = 20.0f - (float)(i / 3);

                    if (CBeem[no].sizes[i] < 8.0f) {
                        CBeem[no].sizes[i] = 8.0f;
                    }

                    CBeem[no].active = 1;
                }

                for (int i = 0; i < 10; i++) {
                    CBeem[no].sizes[i] = 20.0f;
                }

                CBeem[no].alphas[59] = 128.0f;
                CBeem[no].sizes[59] = 32.0f;
            }
        } else {
            sceVu0CopyVector(CBeem[no].target, CScript.beem_to[no]);
            CBeem[no].speed = speed;

            for (int i = 0; i < 60; i++) {
                sceVu0CopyVector(CBeem[no].positions[i], CScript.beem_from[no]);
                CBeem[no].state = 0;
                CBeem[no].counters[i] = -i;
                CBeem[no].alphas[i] = 128.0f - (float)(2 * i);
                CBeem[no].sizes[i] = 20.0f - (float)(i / 3);

                if (CBeem[no].sizes[i] < 8.0f) {
                    CBeem[no].sizes[i] = 8.0f;
                }

                CBeem[no].active = 1;
            }

            for (int i = 0; i < 10; i++) {
                CBeem[no].sizes[i] = 20.0f;
            }

            CBeem[no].alphas[59] = 128.0f;
            CBeem[no].sizes[59] = 0.0f;
        }

        CScript.beem_req = 0;
    }

    TexManager.ReloadTexture(Vif1Packet, 17);

    for (int i = 0; i < 3; i++) {
        if (!Pause) {
            CBeem[i].Step();
        }

        CBeem[i].Draw(&OP_MainCamera);
    }

    if (CScript.obj[1].disp && CScript.scene == 5) {
        sceVu0FVECTOR head;
        int at;

        if (MBeemCnt == 0) {
            at = 0;
        } else {
            at = MBeemCnt - 1;
        }

        CFrame* frame = Chara[1].frame->SearchFrame(name[at]);

        if (frame) {
            sceVu0FMATRIX matrix;

            frame->GetLWMatrix(matrix);
            head[0] = matrix[3][0];
            head[1] = matrix[3][1];
            head[2] = matrix[3][2];
            OP_CharaFrame = Cam[SceneNp].frame;

            sceVu0FVECTOR eye;

            sceVu0CopyVector(eye, OP_CharaFrame->position);
            CBeem[CScript.beem_no].Draw2(&OP_MainCamera, head, eye);
        }
    }
}

/* The two columns of smoke the burning village gives off, entered into the effect pool one particle
   apiece every eighth tick. Everything about a particle but where it starts is random: its scale,
   how fast it spins, how fast it turns and which of the four quarters of the smoke texture it is
   drawn from. */
static void SmokeProcess()
{
    static int cnt = 0;

    cnt = cnt + 1;

    if (cnt > 7) {
        cnt = 0;
    }

    if (cnt == 0) {
        sceVu0FVECTOR position = { 400.0f, 10.0f, -450.0f, 1.0f };
        CEffectParam param;

        param.Initialize();
        sceVu0CopyVector(param.position, position);
        param.kind = 1;
        param.scale = 0.5f * rand() / 2147483648.0f;
        param.spin_step = (float)PI / (20.0f + 10 * rand() / 2147483648.0f);
        param.unk_B0 = 2;
        param.unk_B4 = 1;
        param.grow = 0.15f;
        param.spin = 1.5f + 0.2f * rand() / 2147483648.0f;
        param.alpha_step = 0.04f;
        param.alpha_step2 = 0.04f;
        param.life = 120;
        param.texture = TexManager.GetTexture("gray smoke", -1);

        switch (rand() % 4) {
        case 0:
            param.rect = CRect<int>(0, 0, 64, 64);
            break;

        case 1:
            param.rect = CRect<int>(64, 0, 64, 64);
            break;

        case 2:
            param.rect = CRect<int>(0, 64, 64, 64);
            break;

        case 3:
            param.rect = CRect<int>(64, 64, 64, 64);
            break;
        }

        param.unk_08 = 20.0f;
        param.unk_0C = 20.0f;
        param.fade = 60;
        Smoke.EnterEffect(&param);

        position[0] = -550;
        position[1] = 0.0f;
        position[2] = 300.0f;

        CEffectParam param2;

        param2.Initialize();
        sceVu0CopyVector(param2.position, position);
        param2.kind = 1;
        param2.scale = 0.5f * rand() / 2147483648.0f;
        param2.spin_step = (float)PI / (20.0f + 10 * rand() / 2147483648.0f);
        param2.unk_B0 = 2;
        param2.unk_B4 = 1;
        param2.grow = 0.15f;
        param2.spin = 1.5f + 0.2f * rand() / 2147483648.0f;
        param2.alpha_step = 0.04f;
        param2.alpha_step2 = 0.04f;
        param2.life = 120;
        param2.texture = TexManager.GetTexture("gray smoke", -1);

        switch (rand() % 4) {
        case 0:
            param2.rect = CRect<int>(0, 0, 64, 64);
            break;

        case 1:
            param2.rect = CRect<int>(64, 0, 64, 64);
            break;

        case 2:
            param2.rect = CRect<int>(0, 64, 64, 64);
            break;

        case 3:
            param2.rect = CRect<int>(64, 64, 64, 64);
            break;
        }

        param2.unk_08 = 20.0f;
        param2.unk_0C = 20.0f;
        param2.fade = 60;
        Smoke.EnterEffect(&param2);
    }

    Smoke.Step(1);
    Smoke.Draw();
}

/* The river, which is drawn as a grid that refracts what is already in the frame buffer: the frame
   is copied into the surface the grid samples, the grid is placed under the camera, and the depth
   write is turned off so the water does not occlude what is drawn after it. */
static void WaterProcess()
{
    setTexScroll();
    setTexAnim();

    sceGsTex0 frame;

    MGGetFBuffTex(&frame);

    CRect<int> rect(0, 0, 640, 224);
    sceGsTex0 surface = *(sceGsTex0*)&TexManager.GetTexture("water_buff", -1)->tex0;

    MGMoveImage(&frame, rect, &surface, 0, 0, 0);

    sceVu0FVECTOR ref;

    OP_MainCamera.GetRef(ref);
    ref[1] = -13.0f;
    Water.frame.SetPosition(ref);

    sceGsZbuf zbuf = mgZBuffer;

    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);
    Water.Shake((int)(32.0f * rand() / 2147483648.0f), (int)(32.0f * rand() / 2147483648.0f),
                -0.5f);
    Water.Hamon();
    Water.DrawVu1(&mgRenderInfo, GetVif1Packet(), 0);
    MGSetGsZBUF(&mgZBuffer);
}

/* Which of the twenty-three actors gets a shadow drawn into the shadow buffer. The dancers do not,
   because they carry the flat models InchikiShadow places instead; the demon does not, because it
   is in the air. */
static int KageCheck(int no)
{
    if (no == 1) return 0;
    if (no == 3) return 0;
    if (no == 4) return 0;
    if (no == 5) return 0;
    if (no == 14) return 0;
    if (no == 15) return 0;
    if (no == 16) return 0;
    if (CScript.scene < 7 && no == 18) return 0;
    if (no == 17) return 0;
    if (no == 19) return 0;
    if (no == 20) return 0;

    return 1;
}

/* The light one object is drawn under, aimed at it from two points beside the camera rather than
   from one direction for the whole frame, which is what gives the village its lamplight. The light
   colour falls with distance and jitters by a few levels a tick, and the ambient colour falls with
   distance too — except in the burning village, where it is raised instead. */
static void LightSet(float x, float y, float z, int chara)
{
    sceVu0FVECTOR dir;

    dir[0] = -x;

    if (chara == 0) {
        dir[1] = 50.1f;
    } else {
        dir[1] = 250.1f;
    }

    dir[2] = 299.99f - z;
    sceVu0Normalize(dir, dir);
    light[0][0] = dir[0];
    light[1][0] = dir[1];
    light[2][0] = dir[2];
    dir[0] = x;
    dir[1] = 70.1f;
    dir[2] = z - 299.99f;
    sceVu0Normalize(dir, dir);
    light[0][1] = dir[0];
    light[1][1] = dir[1];
    light[2][1] = dir[2];

    sceVu0FMATRIX color;

    sceVu0CopyMatrix(color, lightcolor);

    sceVu0FVECTOR from;
    sceVu0FVECTOR to;

    from[0] = x;
    from[1] = y;
    from[2] = z;
    from[3] = 0.0f;
    to[0] = 0.0f;
    to[1] = 0.0f;
    to[2] = 299.99f;
    to[3] = 0.0f;

    int fall = (int)DistVector(from, to) / 20;

    if (fall > 60) {
        fall = 60;
    }

    color[0][0] = color[0][0] - (float)fall;
    color[0][0] = color[0][0] + (float)(rand() % 20 - 10);
    MGSetPLight(light, color);

    sceVu0FVECTOR ambient;

    sceVu0CopyVector(ambient, ambientlight);

    if (CScript.scene != 7) {
        fall = (int)DistVector(from, to) / 10;

        if (fall > 20) {
            fall = 20;
        }

        ambient[0] += 20.0f;
        ambient[0] = ambient[0] - (float)fall;
    } else {
        ambient[0] += 25.0f;
        ambient[1] += 10.0f;
    }

    MGSetAmbient(ambient);
}

static int setTexScrollCnt;
static float setTexScrollCntf;
static int setTexAnimCnt;
static float setTexAnimCntf;

/* The waterfall, which is one 128-pixel texture scrolled sideways over another at half a pixel a
   tick and wrapped by copying the two halves separately. */
static void setTexScroll()
{
    if (setTexScrollCntf >= 126.0f) {
        setTexScrollCntf = 0.0f;
    } else {
        setTexScrollCntf += 0.5f;
    }

    setTexScrollCnt = (int)setTexScrollCntf;

    CTexture* plate = TexManager.GetTexture("e01b20", -1);
    CTexture* strip = TexManager.GetTexture("e01b21", -1);

    if (plate == 0 || strip == 0) {
        return;
    }

    int dbp = plate->tex0 & 0x3fff;
    int sbp = strip->tex0 & 0x3fff;
    int dbw = (plate->tex0 >> 14) & 0x3f;
    int sbw = (strip->tex0 >> 14) & 0x3f;
    sceGsTex0 dtex;
    sceGsTex0 stex;

    dtex.TBP0 = dbp;
    dtex.TBW = dbw;
    dtex.PSM = SCE_GS_PSMT8;
    stex.TBP0 = sbp;
    stex.TBW = sbw;
    stex.PSM = SCE_GS_PSMT8;

    if (setTexScrollCnt != 128) {
        MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8,
                      CRect<int>(setTexScrollCnt, 0, 128 - setTexScrollCnt, 128), dbp, dbw,
                      SCE_GS_PSMT8, 0, 0, 0);
    }

    if (setTexScrollCnt != 0) {
        MoveImageTest(Vif1Packet, sbp, sbw, SCE_GS_PSMT8, CRect<int>(0, 0, setTexScrollCnt, 128),
                      dbp, dbw, SCE_GS_PSMT8, 128 - setTexScrollCnt, 0, 0);
    }
}

/* The river's surface, which is eight 64-pixel frames stacked in a strip of their own and copied
   one at a time over the plate the grid samples, at a fifth of a frame per tick. The cache is
   flushed on both sides because the plate is a texture the previous tick drew from. */
static void setTexAnim()
{
    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128*)&GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    if (setTexAnimCntf >= 7.0f) {
        setTexAnimCntf = 0.0f;
    } else {
        setTexAnimCntf += 0.2f;
    }

    setTexAnimCnt = (int)setTexAnimCntf;

    CTexture* strip = TexManager.GetTexture("e01b23", -1);
    CTexture* plate = TexManager.GetTexture("e01b22", -1);

    if (strip == 0 || plate == 0) {
        return;
    }

    MGMoveImage((sceGsTex0*)&strip->tex0, CRect<int>(0, setTexAnimCnt * 64, 64, 64),
                (sceGsTex0*)&plate->tex0, 0, 0, 0);
    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128*)&GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, SCE_GS_TEXFLUSH, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}

