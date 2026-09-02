#pragma constant_flag 0
#pragma constant_flag_ones 21,22,28,29,30,31,32,33,41,45
#pragma constant_flag_ones 46,47,52,53,54,55,56,57,58,62
#pragma constant_flag_ones 63,65,66,67,69,70,71,72,73,74
#pragma constant_flag_ones 77,79,80,83,84,85,88,97,99,106
#pragma constant_flag_ones 108,109,113,114,119,120,130,132,153,154
#pragma constant_flag_ones 156,157,160,161,162

#include "camera.hpp"
#include "character.hpp"
#include "common.h"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include <cmath>
#include <cstdlib>
#include "mathutil.hpp"
#include "mds.hpp"
#include "mdt.hpp"
#include "renderinfo.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "texture.hpp"
#include "title/script.hpp"
#include "title/seireiking.hpp"
#include "visual.hpp"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>

/* Spelled here rather than reached through a header because the image holds it only as an
   anonymous pooled constant, which is what a macro gives and a file-scope object does not. */
#define PI 3.14159265358979323846

/* The rectangle a texture transfer takes, declared here rather than reached through rect.h for the
   reason op_b.cpp and op_c.cpp declare their own: rect.h's four-argument constructor assigns h, w,
   y and x in that order and every rectangle this file builds assigns them the other way round. */
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

/* The two classes this scene places in the world, declared here rather than reached through headers
   of their own because each is another unit's to type. Only the members this file touches are
   named; the extents are the sizes the executable gives the objects below. */

/* A frame parented to an object, which is what lets the world transform drive a model. */
class CObjectFrame : public CObject
{
public:
    virtual void FrameObjectOnOff(char* name, int on);
    virtual void Draw();

    void SetFrame(CFrameVu1* frame, int unknown0);
};

/* One piece of scenery. The scene builds a table of them, hands each its model, and drives them
   through the object dispatch like anything else in the world. The frame it was handed is read back
   out of it here, which is what names the first member. */
class CMapObject : public CObjectFrame
{
public:
    CMapObject();

    virtual void Draw();

    void Initialize();
    void DrawShadow(int unknown0);

    CFrameVu1* frame;
    char unk_04[32];
    CFrameVu1* lod_model;
    char unk_28[8];
    float lod_distance;
    int unk_34;
    int unk_38;
    char unk_3C[4];
};

/* One piece of scenery as the scene was laid out: the model, the model its distant form is drawn
   from, where it stands in tenths of a world unit, and its three rotations in degrees. */
struct MAPOBJ_INFO
{
    char* name;
    char* lod_name;
    float position[3];
    float rotation[3];
};

/* The one wind this scene runs, which is the cloth simulation's own class. */
class CWind
{
public:
    CWind();

    void Step();
    void SetDir(float* direction);
    void SetVelocity(float velocity);

    char unk_00[48];
};

/* One actor's face, as this scene animates it. The eyes and the mouth are two strips of frames
   stacked bottom-up in one 256-wide texture — the eyes down the left half and the mouth down the
   right — and a tick copies the current frame of each over the model's face plate. The two offsets
   are measured from the bottom edge of the 128-pixel plate. */
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
    int eye_max;
    int blink;
};

void OPAnalyz(char* name);
void OPMdsLoad();
void OpPlayVolSE(int group, int no, int voice, float volume);
void OpPlayVolPanSE(float* position, float near_dist, float far_dist, int group, int no,
                    int voice);
void OpBgmPlay();
void MoveImageTest(sceVif1Packet* packet, int sbp, int sbw, int spsm, const CRect<int>& rect,
                   int dbp, int dbw, int dpsm, int dsax, int dsay, int dir);
void set2DSprite(sceVif1Packet* packet, CTexture* texture, const CRect<int>& src,
                 const CRect<int>& dst, u_char alpha);
void setAlphaFlag(sceVif1Packet* packet, sceGsAlpha* alpha);
void LensFlare(CTexture* texture, float* position, u_char r, u_char g, u_char b);
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetBGColor(float r, float g, float b, float a);
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetAmbient(float* color);
void MGDraw(CFrame* frame);
void MGBeginDrawShadow(sceGsTex0 tex);
void MGEndDrawShadow(u_char alpha);
int MGRotTransPers2D(int* screen, float* position, int fog);
sceVif1Packet* GetVif1Packet();
void DepthOfField(float* dist, int level, int alpha, int blur);
int SndSyncBG();
void SndBgmPlay(int no);
int SndBgmLoadBG(int no, u_int* buffer, int* size);

extern CSound CSnd;
extern sceVif1Packet* Vif1Packet;
extern sceGifTag GiftagAD;
extern sceGsAlpha mgAlpha;
extern u_int* read_buffer;
extern CCharacter Chara[23];
extern CCharacter Cam[3];
extern char CharaTex[23];
extern CDataAlloc2<1> CharaDataBuffer[7];
extern CDataAlloc2<1> MapDataBuffer;
extern CCamera OP_MainCamera;
extern CFrame* OP_CharaFrame;
extern CMapObject OP_NornMapObj[76];
extern int OP_FireList;
extern RenderInfo mgRenderInfo;
extern sceVu0FVECTOR ambientlight;
extern sceVu0FMATRIX light;
extern sceVu0FMATRIX lightcolor;
extern int SceneNp;
extern int Pause;

static void SkyColor(CFrameVu1* frame);
static void EffectAtraPrizum();
static void RollLight(float* target);
static void EffectSeireiKing(float size);
static void LensFreaProcess();
static void Setsumei();
static void HamonProcess();
void FaceChange(int no);
void FaceChangeMovie(int no);

static CWind Wind;
static CFrameVu1* Hamon[4];
static float HScale[5];
static CCharacter Effect;
static CSeireiKing SeireiKing;

static int amb3;
static CFrameVu1* SkyFrame;

/* One actor's blinking and speaking. The eyes and the mouth are two strips of frames in one
   256-wide texture, and a tick copies the current frame of each over the actor's face plate. The
   mouth is driven from the script's own clock rather than from a motion: while the actor is talking
   a new frame is picked at random every sixth hundredth of a second left on the timer, and the
   timer running out closes the mouth and ends the line. */
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
        { "p09a01", "p09a01an_3", 44, 40, 92, 32, 0, 0, 192, 2, 0 },
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

    if (!Pause) {
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
   own load number back to none. The second one also starts the music bank packed behind the scene
   in the same file, because the second half of the scene is scored differently from the first. */
void OpD_LoadDataBG()
{
    while (ReadBGSync()) ;
    LoadFileBG("opdat/norn4/seirei.pak", (u_long128*)read_buffer, 0);
    CScript.load_no = -1;
}

void OpD_LoadDataBG2()
{
    int size;

    while (ReadBGSync()) ;
    LoadFileBG("opdat/norn4/seirei2.pak", (u_long128*)read_buffer, &size);
    SndBgmLoadBG(0, (u_int*)((u_long128*)read_buffer + (size >> 4) + 1), 0);
    CScript.load_no = -1;
}

/* The set-up for the first of the scene's two halves, the spirit king's hall. Every texture block
   the scene before it left is dropped first, because this is the point in the opening that arrives
   with the most already loaded. The three actors are the king, the king speaking and the girl; the
   ripples the hall's floor carries are one model drawn four times, which is what the four-entry
   frame table and the five-entry scale table are. */
void OpD_InitProcess()
{
    while (ReadBGSync()) ;

    for (int i = 0; i < 17; i++) {
        TexManager.DeleteTextureBlock(i);
    }

    TexManager.CleanUpBuffer();

    LOADTEXTURE_INFO2 tex[] = {
        { "#blender#640#224#4", 0, 0 },
        { 0, 11, 0 },
        { 0, 11, 0 },
        { 0, 4, 0 },
        { 0, 4, 0 },
        { 0, 4, 0 },
        { 0, 4, 0 },
        { 0, 4, 0 },
        { 0, 0, 0 }
    };

    tex[1].name = (char*)GetPackFile(read_buffer, "b0401.img", 0);
    tex[2].name = (char*)GetPackFile(read_buffer, "b0402.img", 0);
    tex[3].name = (char*)GetPackFile(read_buffer, "eef01.img", 0);
    tex[4].name = (char*)GetPackFile(read_buffer, "eef02.img", 0);
    tex[5].name = (char*)GetPackFile(read_buffer, "eef03.img", 0);
    tex[6].name = (char*)GetPackFile(read_buffer, "eef04.img", 0);
    tex[7].name = (char*)GetPackFile(read_buffer, "eef05.img", 0);

    TexManager.LoadTextureBlock(-1, tex);

    tex[0].name = (char*)GetPackFile(read_buffer, "c01d01.img", 0);
    tex[0].block_no = 1;
    tex[0].unk_08 = 0;
    tex[1].name = (char*)GetPackFile(read_buffer, "c01d01an.img", 0);
    tex[1].block_no = 1;
    tex[1].unk_08 = 0;
    tex[2].name = 0;

    TexManager.LoadTextureBlock(1, tex);

    tex[0].name = (char*)GetPackFile(read_buffer, "c03c01.img", 0);
    tex[0].block_no = 2;
    tex[0].unk_08 = 0;
    tex[1].name = 0;

    TexManager.LoadTextureBlock(2, tex);
    MapDataBuffer.used = 0;

    CFrameVu1* frame = LoadMDSFile((u_int*)GetPackFile(read_buffer, "b0401.mds", 0),
                                   &MapDataBuffer, 2, 0, 0);
    CMapObject& hall = OP_NornMapObj[0];

    hall.Initialize();
    hall.SetFrame(frame, 0);
    OP_NornMapObj[0].unk_38 = 0;
    OP_NornMapObj[0].unk_34 = 0;
    hall.SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    hall.SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));
    Hamon[0] = LoadMDSFile((u_int*)GetPackFile(read_buffer, "b0402.mds", 0),
                           &CharaDataBuffer[6], 2, 0, 0);
    Hamon[1] = Hamon[2] = Hamon[3] = Hamon[0];
    HScale[0] = 0.0f;
    HScale[1] = -0.8f;
    HScale[2] = -1.6f;
    HScale[3] = -2.4f;
    HScale[4] = -3.2f;
    OP_FireList = 0;
    OPAnalyz("opdat/seirei.cfg");
    OPMdsLoad();
    CharaDataBuffer[6].used = 0;
    Chara[8].LoadPackData(read_buffer, "05c01d.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr8;

    attr8.unk_08 = 0;
    Chara[8].frame->SetAttr(attr8, 1, 4);
    Chara[8].motion_type.state.time = 60.0f;
    Chara[8].motion_type.state.unk_08 = 0.05f;
    Chara[8].motion_type.state.motion_no = 0;
    Chara[8].motion_type.state.playing_no = 0;
    CharaTex[8] = 1;
    Chara[11].LoadPackData(read_buffer, "05c01e.cfg",  &CharaDataBuffer[6], 0);
    attr8.unk_08 = 0;
    Chara[11].frame->SetAttr(attr8, 1, 4);
    Chara[11].motion_type.state.time = 75.0f;
    Chara[11].motion_type.state.unk_08 = 0.05f;
    Chara[11].motion_type.state.motion_no = 1;
    Chara[11].motion_type.state.playing_no = 1;
    CharaTex[11] = 1;
    Chara[21].LoadPackData(read_buffer, "05c03c.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr21;

    attr21.unk_08 = 0;
    Chara[21].frame->SetAttr(attr21, 1, 4);
    Chara[21].motion_type.state.time = 1.0f;
    Chara[21].motion_type.state.unk_08 = 0.05f;
    Chara[21].motion_type.state.motion_no = 0;
    Chara[21].motion_type.state.playing_no = 0;
    CharaTex[21] = 2;
    Effect.LoadPackData(read_buffer, "atrpeff1.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attre;

    attre.unk_08 = 0;
    Effect.frame->SetAttr(attre, 1, 4);
    Effect.motion_type.state.time = 1.0f;
    Effect.motion_type.state.unk_08 = 1.0f;
    Effect.motion_type.state.motion_no = 0;
    Effect.motion_type.state.playing_no = 0;
    CSnd.SetReverb(0, 4, 50);
    CSnd.SetReverb(1, 2, 5);
    CSnd.LoadSoundFileFromPack("o04a.txt", read_buffer);
    CSnd.SetVol(15, 256);
    CSnd.SetVol(14, 256);
    CSnd.SetVol(13, 256);
    CSnd.SetVol(12, 256);

    LOADTEXTURE_INFO img[] = {
        { "opdat/norn4/i00002.img", 5, 0 },
        { "opdat/norn4/i00006.img", 5, 0 },
        { "opdat/norn4/i00022.img", 6, 0 },
        { "opdat/norn4/0519.img", 7, 0 },
        { "opdat/norn4/0519p.img", 7, 0 },
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

    TexManager.LoadTextureBlock(-1, img, read_buffer);
    SeireiKing.Initialize();
    amb3 = 0;
    CScript.init_no = 0;
}

/* The set-up for the second half, the meadow the girl walks out into. Ten models are placed from a
   table of this file's own rather than from a configuration file: the seventh is the flowers, which
   take a frame attribute the rest do not and whose one named frame is drawn again later under a
   light of its own, the eighth is the sky, whose vertex colours this file writes itself, and the
   tenth is kept aside because the lens flare is aimed at a frame inside it. */
void OpD_InitProcess2()
{
    while (ReadBGSync()) ;

    LOADTEXTURE_INFO2 tex[] = {
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 10, 0 },
        { 0, 3, 0 },
        { 0, 10, 0 },
        { 0, 0, 0 }
    };

    tex[0].name = (char*)GetPackFile(read_buffer, "b0403.img", 0);
    tex[1].name = (char*)GetPackFile(read_buffer, "e01b01.img", 0);
    tex[2].name = (char*)GetPackFile(read_buffer, "t0401.img", 0);
    tex[3].name = (char*)GetPackFile(read_buffer, "e01s01.img", 0);
    tex[4].name = (char*)GetPackFile(read_buffer, "e01s06.img", 0);
    tex[5].name = (char*)GetPackFile(read_buffer, "t0402.img", 0);
    tex[6].name = (char*)GetPackFile(read_buffer, "buterfly.img", 0);
    tex[7].name = (char*)GetPackFile(read_buffer, "lensfler.img", 0);

    TexManager.LoadTextureBlock(-1, tex);

    MAPOBJ_INFO map[] = {
        { "b0403.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "e01g02_0.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "e01g03_0.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "e01g04_0.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "e01h06_2.mds", 0, { 0.0f, 4.7424f, 79.274f }, { 0.0f, 0.0f, 0.0f } },
        { "e01a02_2.mds", 0, { 0.0f, 0.0f, 59.965f }, { 0.0f, 0.0f, 0.0f } },
        { "flower.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "e01s05_0.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "e01s01_0.mds", 0, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
        { "e01s01_1.mds", 0, { 104.195f, 3.399f, -150.395f }, { 0.0f, 0.0f, 0.0f } }
    };
    CFrameAttr attr;
    CFrameVu1* frame;
    int i;

    attr.unk_0C = 1;

    for (i = 1; i < 11; i++) {
        frame = LoadMDSFile((u_int*)GetPackFile(read_buffer, map[i - 1].name, 0),
                            &MapDataBuffer, 2, 0, 0);

        if (i == 7) {
            attr.unk_14 = 1;
            frame->SetAttr(attr, 512, 0);
        }

        if (i < 8) {
            frame->SetAttr(attr, 1, 64);
            SetFrameAttr(frame, 1);
        }

        if (i == 8) {
            SkyColor(frame);
        }

        if (i == 10) {
            SkyFrame = frame;
        }

        CMapObject& object = OP_NornMapObj[i];

        object.Initialize();
        object.SetFrame(frame, 0);
        OP_NornMapObj[i].unk_38 = 0;
        OP_NornMapObj[i].unk_34 = 0;

        if (i == 7) {
            object.FrameObjectOnOff("flo_S", 0);
        }

        object.SetPosition(CVector3_f_(10.0f * map[i - 1].position[0],
                                           10.0f * map[i - 1].position[1],
                                           10.0f * map[i - 1].position[2]));
        object.SetRotation(CVector3_f_((float)(PI * map[i - 1].rotation[0] / 180),
                                           (float)(PI * map[i - 1].rotation[1] / 180),
                                           (float)(PI * map[i - 1].rotation[2] / 180)));
    }

    Chara[22].LoadPackData(read_buffer, "buterfly.cfg",  &CharaDataBuffer[6], 0);

    CFrameAttr attr22;

    attr22.unk_08 = 0;
    Chara[22].frame->SetAttr(attr22, 1, 4);
    Chara[22].motion_type.state.time = 1.0f;
    Chara[22].motion_type.state.unk_08 = 0.05f;
    Chara[22].motion_type.state.motion_no = 0;
    Chara[22].motion_type.state.playing_no = 0;
    CharaTex[22] = 3;
    Chara[5].LoadPackData(read_buffer, "buterfly.cfg",  &CharaDataBuffer[6], 0);
    attr22.unk_08 = 0;
    Chara[5].frame->SetAttr(attr22, 1, 4);
    Chara[5].motion_type.state.time = 1.0f;
    Chara[5].motion_type.state.unk_08 = 0.05f;
    Chara[5].motion_type.state.motion_no = 0;
    Chara[5].motion_type.state.playing_no = 0;
    CharaTex[5] = 3;
    CSnd.SetReverb(0, 4, 30);
    CSnd.SetReverb(1, 2, 5);
    CSnd.LoadSoundFileFromPack("o04b.txt", read_buffer);
    CSnd.SetVol(15, 256);
    CSnd.SetVol(14, 256);
    CSnd.SetVol(13, 256);
    CSnd.SetVol(12, 256);
    CScript.init_no = 0;
}

/* The sky's own colours, written into the model rather than lit: the dome is thirty-two vertices
   around and the two colours alternate two at a time, which is what paints the band the sun sits
   in. Setting the frame's own attribute afterwards is what makes the model draw with them. */
static void SkyColor(CFrameVu1* frame)
{
    if (frame) {
        CVisualVu1* visual = frame->GetVisual();

        if (visual) {
            MDT_HEADER* model = (MDT_HEADER*)visual->GetMDTDataAddress();

            if (model) {
                if (model->unk_14[2]) {
                    sceVu0FVECTOR* color = (sceVu0FVECTOR*)((char*)model + model->unk_14[3]);
                    sceVu0FVECTOR color0 = { 50.0f, 100.0f, 255.0f, 0.0f };
                    sceVu0FVECTOR color1 = { 255.0f, 255.0f, 255.0f, 0.0f };

                    color0[0] = color0[0] / 128.0f;
                    color0[1] = color0[1] / 128.0f;
                    color0[2] = color0[2] / 128.0f;
                    color1[0] = color1[0] / 128.0f;
                    color1[1] = color1[1] / 128.0f;
                    color1[2] = color1[2] / 128.0f;

                    for (int i = 0; i < 32; i++) {
                        if (i % 4 < 2) {
                            color[i][0] = color0[0];
                            color[i][1] = color0[1];
                            color[i][2] = color0[2];
                            color[i][3] = 1.0f;
                        } else {
                            color[i][0] = color1[0];
                            color[i][1] = color1[1];
                            color[i][2] = color1[2];
                            color[i][3] = 1.0f;
                        }
                    }

                    frame->attr.unk_0A = 1;
                }
            }
        }
    }
}

/* The tick's motion. Every actor the script has asked for takes what it last asked, and the ones
   the scene animates are then placed from a frame of the camera's own model found by name. The wind
   picks up when the scene moves outdoors, and a change of camera settles the girl's dress with no
   time passing rather than letting it swing into place. */
void OpD_MotionProcess()
{
    {
        register float zero = 0.0f;

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

                if (CScript.obj[i].step == 1.0f) {
                    if (CScript.obj[i].motion != Chara[i].motion_no) {
                        Chara[i].motion_type.state.time =
                            (float)Chara[i].motion_type.motion_info[CScript.obj[i].motion].start;
                    }
                }

                Chara[i].motion_no = CScript.obj[i].motion;
                Chara[i].flags = 0;
                Chara[i].motion_speed = -1.0f;
            }
        }

        char* name[23] = { "", "", "", "", "", "tyou2", "", "", "c01d", "", "", "c01d", "", "", "", "",
                           "", "", "", "", "", "c03c", "tyou" };
        sceVu0FMATRIX matrix;

        for (int i = 0; i < 23; i++) {
            if (CScript.obj[i].disp) {
                CFrame* frame = Cam[SceneNp].frame->SearchFrame(name[i]);

                if (frame) {
                    frame->GetLWMatrix(matrix);
                    Chara[i].SetRotation(zero, atan2f(matrix[2][0], matrix[2][2]), zero);
                    float x = matrix[3][0];
                    float y = matrix[3][1];
                    float z = matrix[3][2];
                    Chara[i].SetPosition(x, y, z);
                }
            }
        }
    }

    sceVu0FVECTOR dir;

    if (CScript.camera_start < 115) {
        dir[0] = 0.0f;
        dir[2] = 0.0f;
        dir[1] = 0.0f;
        dir[3] = 0.0f;
        Wind.SetDir(dir);
        Wind.SetVelocity(0.0f);
    } else {
        dir[0] = -0.1f;
        dir[2] = 0.1f;
        dir[1] = 0.0f;
        dir[3] = 0.0f;
        Wind.SetDir(dir);
        Wind.SetVelocity(0.2f);
    }

    int no;

    if (CScript.camera_start > 111) {
        no = 11;
    } else {
        no = 8;
    }

    Chara[no].unk_C98 = (int)&Wind;
    Wind.Step();

    static int camera = 0;

    if (camera != CScript.camera_start) {
        camera = CScript.camera_start;

        switch (camera) {
        case 101:
        case 104:
        case 123:
            Chara[no].ClothStep(-1);

            for (int i = 0; i < 20; i++) {
                Chara[no].ClothStep(0);
            }
            break;

        case 106:
        case 109:
        case 112:
        case 115:
        case 125:
            Chara[no].ClothStep(-1);

            for (int i = 0; i < 10; i++) {
                Chara[no].ClothStep(0);
            }
            break;
        }
    }
}

/* The tick's sound, which is a set of camera marks rather than a table: each one acts once and
   clears itself again when the camera moves off it, which is what the flag behind every one is for.
   The last of them reloads the whole sound file, because the second half of the scene is scored
   differently from the first. The one footfall is a window on the girl's own motion frame with a
   wait behind it, so a motion that stalls inside the window plays the step once. */
void OpD_SoundProcess()
{
    {
        static int se = 0;

        if (CScript.camera_start == 111) {
            if (!se) {
                OpPlayVolSE(14, 40, 42, 1.0f);
                OpPlayVolSE(14, 40, 44, 1.0f);
                OpPlayVolSE(14, 40, 49, 1.0f);
                OpPlayVolSE(14, 40, 51, 1.0f);
                OpPlayVolSE(14, 40, 45, 1.0f);
                OpPlayVolSE(14, 40, 47, 1.0f);
                OpPlayVolSE(14, 40, 48, 1.0f);
                se = 1;
            }
        } else {
            se = 0;
        }
    }

    {
        static int mus = 0;

        if (CScript.camera_start == 101) {
            if (CScript.mes_no == 101) {
                if (!mus) {
                    OpBgmPlay();
                    CSnd.SQ_Play(1, 0);
                    mus = 1;
                }
            }
        } else {
            mus = 0;
        }
    }

    {
        static int se = 0;

        if (CScript.camera_start == 110) {
            if (!se) {
                CSnd.Fade(0, -1.0f, 0);
                se = 1;
            }
        } else {
            se = 0;
        }
    }

    {
        static int mus = 0;

        if (CScript.camera_start == 115) {
            if (!mus) {
                OpBgmPlay();
                CSnd.SQ_Play(1, 0);
                mus = 1;
            }
        } else {
            mus = 0;
        }
    }

    {
        static int se = 0;

        if (CScript.camera_start == 118) {
            if (!se) {
                CSnd.Fade(0, -1.0f, 0);
                se = 1;
            }
        } else {
            se = 0;
        }
    }

    {
        static int mus = 0;

        if (CScript.camera_start == 123) {
            if (!mus) {
                SndStopAllSe();
                CSnd.Stop(0);
                CSnd.StopVoice(0);
                CSnd.SetReverb(0, 4, 30);
                CSnd.SetReverb(1, 2, 5);
                CSnd.LoadSoundFileFromPack("o04c.txt", read_buffer);
                CSnd.SetVol(15, 256);
                CSnd.SetVol(14, 256);
                CSnd.SetVol(13, 256);
                CSnd.SetVol(12, 256);

                while (SndSyncBG()) ;

                SndBgmPlay(0);
                CSnd.SQ_Play(1, 0);
                mus = 1;
            }
        } else {
            mus = 0;
        }
    }

    if (CScript.obj[21].disp) {
        static int wait = 0;
        sceVu0FVECTOR position;
        float frame;

        sceVu0CopyVector(position, Chara[21].pos);
        frame = (int)Chara[21].motion_type.state.time;

        if (wait == 0) {
            if (frame > 43.0f && frame < 45.0f) {
                OpPlayVolPanSE(position, 50.0f, 300.0f, 14, 21, 20);
                wait = 4;
            } else if (frame > 53.0f && frame < 55.0f) {
                OpPlayVolPanSE(position, 50.0f, 300.0f, 14, 21, 21);
                wait = 4;
            }
        } else {
            wait = wait - 1;
        }
    }
}

/* The tick's drawing in the order the frame is built. The hall is one object under an ambient the
   script raises a step at a time; the meadow is ten, one of which is held back because the flowers
   are drawn a second time under a light of their own. Then the shadows, the actors, the spirit
   king's effect, and last the three screen fades and the caption. */
void OpD_DrawProcess()
{
    OP_CharaFrame = Cam[SceneNp].frame;

    switch (CScript.camera_start) {
    case 106:
    case 107:
    case 108:
    case 112:
    case 113:
    case 121:
    case 123:
    case 125:
        MGSetRenderInfo(mgRenderInfo.scale[0], 1.0f, 0xffff);
        break;

    case 115:
    case 118:
    case 126:
        MGSetRenderInfo(mgRenderInfo.scale[0], 20.0f, 0xffff);
        break;

    default:
        MGSetRenderInfo(mgRenderInfo.scale[0], 8.0f, 0xffff);
        break;
    }

    if (CScript.camera_start < 115) {
        TexManager.ReloadTexture(Vif1Packet, 11);

        if (CScript.sprite == 1 && amb3 < 127) {
            amb3 = amb3 + 1;
        }

        sceVu0FVECTOR ambient;

        sceVu0CopyVector(ambient, ambientlight);
        ambient[3] = (float)amb3;
        MGSetAmbient(ambient);

        CMapObject& hall = OP_NornMapObj[0];

        hall.Draw();
        MGSetAmbient(ambientlight);
    } else {
        float green = 100.0f;
        float blue = 255.0f;
        MGSetBGColor(50.0f, green, blue, 128.0f);
        TexManager.ReloadTexture(Vif1Packet, 10);

        for (int i = 1; i < 11; i++) {
            if (i == 8) {
                mgRenderInfo.unk_340 = 1;
            } else {
                mgRenderInfo.unk_340 = 0;
            }

            if (i != 7) {
                CMapObject& object = OP_NornMapObj[i];

                object.Draw();
            }
        }

        if (CScript.camera_start > 119) {
            CMapObject& flower = OP_NornMapObj[7];

            flower.FrameObjectOnOff("flo_S", 0);
            flower.Draw();
            flower.FrameObjectOnOff("flo_S", 1);

            CFrame* frame = flower.frame->SearchFrame("flo_S");
            sceVu0FVECTOR ambient;

            sceVu0CopyVector(ambient, ambientlight);
            ambient[3] = 70.0f;
            MGSetAmbient(ambient);
            MGDraw(frame);
            MGSetAmbient(ambientlight);
        }

        if (CScript.camera_start == 124) {
            LensFreaProcess();
        }
    }

    if (CScript.camera_start < 106) {
        HamonProcess();
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[2] = { 400.0f, 1000.0f };

    DepthOfField(dof, 2, 64, 0);

    for (int i = 0; i < 23; i++) {
        if (i != 22 && i != 5 && CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, 23);
            MGBeginDrawShadow(*(sceGsTex0*)&TexManager.GetTexture("shadow_buff", -1)->tex0);

            if (!Pause) {
                Chara[i].ShadowStep();
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

            if (i == 8 || i == 11) {
                FaceChangeMovie(i);
            }

            if (CScript.camera_start >= 111 && CScript.camera_start < 114) {
                sceVu0FVECTOR position;

                sceVu0CopyVector(position, Chara[i].frame->position);
                RollLight(position);
            }

            Chara[i].Draw();
            MGSetPLight(light, lightcolor);
        }
    }

    switch (CScript.camera_start) {
    case 111:
        EffectSeireiKing(2.0f);
        break;

    case 118:
    case 119:
        if (CScript.mes_wait == 0) {
            EffectSeireiKing(4.0f);
        }
        break;

    case 112:
    case 113:
        EffectAtraPrizum();
        break;
    }

    static int fade1 = 0;
    static int fade2 = 0;
    static int fade3 = 0;

    if (CScript.sprite == 2) {
        fade1 = 128;
    } else if (fade1 > 0) {
        fade1 = fade1 - 2;
    }

    if (CScript.sprite == 3) {
        if (fade2 < 128) {
            fade2 = fade2 + 2;
        }
    } else if (fade2 > 0) {
        fade2 = fade2 - 2;
    }

    if (CScript.sprite == 4) {
        if (fade3 < 128) {
            fade3 = fade3 + 2;
        }
    } else if (fade3 > 0) {
        fade3 = fade3 - 1;
    }

    if (fade1) {
        TexManager.ReloadTexture(Vif1Packet, 5);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("i00002", -1),
                    CRect<int>(0, 0, 640, 448), CRect<int>(0, 0, 640, 448), (u_char)fade1);
    }

    if (fade2) {
        TexManager.ReloadTexture(Vif1Packet, 5);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("i00006", -1),
                    CRect<int>(0, 0, 640, 448), CRect<int>(0, 0, 640, 448), (u_char)fade2);
    }

    if (fade3) {
        TexManager.ReloadTexture(Vif1Packet, 6);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("i00022", -1),
                    CRect<int>(0, 0, 640, 448), CRect<int>(0, 0, 640, 448), (u_char)fade3);
    }

    switch (CScript.sprite) {
    case 5:
    case 6:
        TexManager.ReloadTexture(Vif1Packet, 7);
        Setsumei();
        break;
    }
}

/* The prism the spirit king turns above the girl: one model drawn twice, spun opposite ways about
   the frame the actor carries it on, with the spark trail drawn over the top of it. */
static void EffectAtraPrizum()
{
    if (CScript.obj[11].disp) {
        static float rot1 = 0.0f;
        static float rot2 = 0.0f;

        if (!Pause) {
            rot1 += 0.01f;

            if (rot1 > 3.14f) {
                rot1 = rot1 - 6.28f;
            }

            rot2 = rot2 - 0.01f;

            if (rot2 < -3.14f) {
                rot2 += 6.28f;
            }
        }

        sceVu0FMATRIX matrix;
        sceVu0FVECTOR ambient;

        sceVu0CopyVector(ambient, ambientlight);
        ambient[3] = 32.0f;
        MGSetAmbient(ambient);

        sceGsAlpha alpha = mgAlpha;

        alpha.bits.a = 0;
        alpha.bits.b = 2;
        alpha.bits.c = 0;
        alpha.bits.d = 1;
        setAlphaFlag(Vif1Packet, &alpha);
        TexManager.ReloadTexture(Vif1Packet, 4);

        CFrame* frame = Chara[11].frame->SearchFrame("atrp");

        if (frame) {
            frame->GetLWMatrix(matrix);

            if (CScript.camera_start == 112) {
                sceVu0FVECTOR position;
                sceVu0FMATRIX spin;

                sceVu0CopyVector(position, matrix[3]);
                sceVu0UnitMatrix(spin);
                sceVu0RotMatrixY(spin, spin, rot1);
                sceVu0MulMatrix(matrix, matrix, spin);
                sceVu0CopyVector(matrix[3], position);
                Effect.frame->SetTransMatrix(matrix);
                Effect.motion_no = 0;
                Effect.flags = 0;
                Effect.motion_speed = -1.0f;

                if (!Pause) {
                    Effect.Step();
                }

                Effect.Draw();
                frame->GetLWMatrix(matrix);
                sceVu0CopyVector(position, matrix[3]);
                sceVu0UnitMatrix(spin);
                sceVu0RotMatrixY(spin, spin, rot2);
                sceVu0MulMatrix(matrix, matrix, spin);
                sceVu0CopyVector(matrix[3], position);
                Effect.frame->SetTransMatrix(matrix);
                MGDraw(Effect.frame);
            }
        }

        if (!Pause) {
            SeireiKing.Step();
        }

        SeireiKing.Draw(matrix[3], 0.2f, 1);

        sceVu0FVECTOR eye;

        sceVu0CopyVector(eye, OP_CharaFrame->position);
        SeireiKing.Draw2(&OP_MainCamera, matrix[3], eye);
        setAlphaFlag(Vif1Packet, &mgAlpha);
        MGSetAmbient(ambientlight);
    }
}

/* The light the actors are drawn under while the spirit king is out: a direction aimed from the
   effect at the actor rather than one fixed for the whole frame, which is what turns the light
   around a character as the effect moves. The third camera puts the source on a circle of its own
   instead, so the light sweeps while nothing else does. */
static void RollLight(float* target)
{
    if (CScript.camera_start >= 111 && CScript.camera_start < 114) {
        CFrame* frame;

        if (CScript.camera_start == 111) {
            frame = Cam[SceneNp].frame->SearchFrame("hikari");
        } else {
            frame = Chara[11].frame->SearchFrame("atrp");
        }

        sceVu0FMATRIX matrix;
        sceVu0FMATRIX dirs;
        sceVu0FMATRIX colors;
        sceVu0FVECTOR dir;

        frame->GetLWMatrix(matrix);

        switch (CScript.camera_start) {
        case 111:
        case 112:
            dir[0] = matrix[3][0] - target[0];
            dir[1] = matrix[3][1];
            dir[2] = matrix[3][2] - target[2];
            sceVu0Normalize(dir, dir);
            sceVu0CopyMatrix(dirs, light);
            sceVu0CopyMatrix(colors, lightcolor);
            dirs[0][1] = dir[0];
            dirs[1][1] = dir[1];
            dirs[2][1] = dir[2];
            colors[1][0] = 255.0f;
            colors[1][1] = 255.0f;
            colors[1][2] = 255.0f;
            break;

        case 113: {
                static float angle = 0.0f;

                angle += 0.03f;

                if (angle > 3.14f) {
                    angle = angle - 6.28f;
                }

                dir[0] = (float)(matrix[3][0] + sin(angle) * 25.0 - target[0]);
                dir[1] = (float)(matrix[3][1] + 5.0);
                dir[2] = (float)(matrix[3][2] + cos(angle) * 25.0 - target[2]);
                sceVu0Normalize(dir, dir);
                sceVu0CopyMatrix(dirs, light);
                sceVu0CopyMatrix(colors, lightcolor);
                dirs[0][1] = dir[0];
                dirs[1][1] = dir[1];
                dirs[2][1] = dir[2];
                colors[1][0] = 128.0f;
                colors[1][1] = 128.0f;
                colors[1][2] = 128.0f;
            }
            break;
        }

        MGSetPLight(dirs, colors);
    }
}

/* The spirit king itself before it has anything to carry: the trail grows from a frame of the
   camera's own model and is stepped every other tick rather than every one, which is what makes it
   drift rather than dart. */
static void EffectSeireiKing(float size)
{
    CFrame* frame = Cam[SceneNp].frame->SearchFrame("hikari");

    if (frame) {
        sceVu0FMATRIX matrix;

        frame->GetLWMatrix(matrix);
        TexManager.ReloadTexture(Vif1Packet, 4);

        sceVu0FVECTOR head;

        head[0] = matrix[3][0];
        head[1] = matrix[3][1];
        head[2] = matrix[3][2];

        if (!Pause) {
            static int cnt = 0;

            cnt = cnt + 1;

            if (cnt > 1) {
                cnt = 0;
            }

            if (cnt == 0) {
                SeireiKing.Step();
            }
        }

        SeireiKing.Draw(head, size, 2);
    }
}

/* The sun's flare, aimed at a frame inside the sky model the set-up kept aside and drawn only when
   that point projects onto the screen at all. */
static void LensFreaProcess()
{
    sceVu0FVECTOR world;
    int screen[4];
    sceVu0FVECTOR local = { 0.0f, 0.0f, 0.0f, 1.0f };
    CFrame* frame = SkyFrame->SearchFrame("sun1");

    if (frame) {
        frame->GetWorldPosition(world, local);

        if (MGRotTransPers2D(screen, world, 0)) {
            if (TexManager.GetTexture("lensfler", -1)) {
                LensFlare(TexManager.GetTexture("lensfler", -1), world, 255, 255, 255);
            }
        }
    }
}

/* The caption over the meadow: a plate the whole screen wide with the pieces of the text cut out of
   one strip and copied over it, and two counters running underneath that cross-fade one group of
   pieces into another. Which half of the caption is up is the sprite number the script holds; the
   trails of stars across it are drawn from positions of their own rather than from the strip, each
   one steering towards a point off the screen and restarting when it leaves. */
static void Setsumei()
{
    static int cnt1 = 0;
    static int cntA = 0;

    cnt1 = cnt1 + 1;

    if (cnt1 > 30) {
        cnt1 = 0;
        cntA = cntA + 1;

        if (cntA > 1) {
            cntA = 0;
        }
    }

    static int cnt2 = 0;
    static int cntB = 0;

    cnt2 = cnt2 + 1;

    if (cnt2 > 30) {
        cnt2 = 0;
        cntB = cntB + 1;

        if (cntB > 2) {
            cntB = 0;
        }
    }

    static int fadeA1 = 128;
    static int fadeA2 = 0;

    if (cntA == 0) {
        fadeA1 = 128;

        if (fadeA2 > 0) {
            fadeA2 = fadeA2 - 8;
        }
    } else {
        fadeA2 = 128;

        if (fadeA1 > 0) {
            fadeA1 = fadeA1 - 8;
        }
    }

    static int fadeB1 = 128;
    static int fadeB2 = 0;
    static int fadeB3 = 0;

    switch (cntB) {
    case 0:
        fadeB1 = 128;

        if (fadeB2 > 0) {
            fadeB2 = fadeB2 - 8;
        }

        if (fadeB3 > 0) {
            fadeB3 = fadeB3 - 8;
        }
        break;

    case 1:
        fadeB2 = 128;

        if (fadeB1 > 0) {
            fadeB1 = fadeB1 - 8;
        }

        if (fadeB3 > 0) {
            fadeB3 = fadeB3 - 8;
        }
        break;

    case 2:
        fadeB3 = 128;

        if (fadeB1 > 0) {
            fadeB1 = fadeB1 - 8;
        }

        if (fadeB2 > 0) {
            fadeB2 = fadeB2 - 8;
        }
        break;
    }

    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519", -1), CRect<int>(0, 0, 640, 448),
                CRect<int>(0, 0, 640, 448), 128);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(540, 237, 88, 119), CRect<int>(89, 206, 88, 119), (u_char)fadeA1);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(540, 237, 88, 119), CRect<int>(0, 206, 88, 119), (u_char)fadeA2);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(450, 25, 105, 105), CRect<int>(117, 448, 105, 105), (u_char)fadeB1);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(450, 25, 105, 105), CRect<int>(222, 448, 105, 105), (u_char)fadeB2);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(450, 25, 105, 105), CRect<int>(327, 448, 105, 105), (u_char)fadeB3);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(350, 130, 208, 58), CRect<int>(432, 448, 208, 58), (u_char)fadeB1);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(350, 130, 208, 58), CRect<int>(432, 506, 208, 58), (u_char)fadeB2);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(350, 130, 208, 58), CRect<int>(432, 564, 208, 58), (u_char)fadeB3);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(100, 175, 117, 56), CRect<int>(0, 325, 117, 56), (u_char)fadeA1);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>(100, 175, 117, 56), CRect<int>(0, 381, 117, 56), (u_char)fadeA2);

    if (CScript.sprite == 5) {
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>(6, 229, 178, 178), CRect<int>(388, 0, 178, 178), (u_char)fadeA1);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>(184, 229, 178, 178), CRect<int>(388, 0, 178, 178), (u_char)fadeA1);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>(362, 229, 178, 178), CRect<int>(388, 0, 178, 178), (u_char)fadeA1);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>(6, 229, 178, 178), CRect<int>(210, 0, 178, 178), (u_char)fadeA2);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>(184, 229, 178, 178), CRect<int>(210, 0, 178, 178), (u_char)fadeA2);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>(362, 229, 178, 178), CRect<int>(210, 0, 178, 178), (u_char)fadeA2);
    } else {
        static float x = 6.0f;
        static float y = 229.0f;
        static float rot = -1.57f;
        static float x2 = 184.0f;
        static float y2 = 229.0f;
        static float rot2 = 1.57f;
        static float x3 = 362.0f;
        static float y3 = 229.0f;
        static float rot3 = 1.57f;

        float a = atan2f((float)(-100.0f - x), -100.0f - y);

        if (a < rot) {
            rot = rot - 0.05f;
        }

        if (a > rot) {
            rot += 0.05f;
        }

        x = x + (float)(sin(rot) * 4.0);
        y = y + (float)(cos(rot) * 4.0);

        int alpha;

        if (y < 32.0f) {
            alpha = (int)(128.0f - 4.0f * (32.0f - y));
        } else {
            alpha = 128;
        }

        if (alpha < 0) {
            alpha = 0;
        }

        if (y <= 0.0f) {
            x = 6.0f;
            y = 229.0f;
        }

        int cut = (int)((229.0f - y) / 2.0f);

        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>((int)x, (int)y, 178 - cut, 178 - cut),
                    CRect<int>(210, 0, 178, 178), (u_char)alpha);

        float a2 = atan2f(500.0f - x2, -100.0f - y2);

        if (a2 < rot2) {
            rot2 = rot2 - 0.05f;
        }

        if (a2 > rot2) {
            rot2 += 0.05f;
        }

        x2 = x2 + (float)(sin(rot2) * 4.0);
        y2 = y2 + (float)(cos(rot2) * 4.0);

        int alpha2;

        if (y2 < 32.0f) {
            alpha2 = (int)(128.0f - 4.0f * (32.0f - y2));
        } else {
            alpha2 = 128;
        }

        if (alpha2 < 0) {
            alpha2 = 0;
        }

        if (y2 <= 0.0f) {
            x2 = 184.0f;
            y2 = 229.0f;
        }

        int cut2 = (int)((229.0f - y2) / 2.0f);

        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>((int)x2, (int)y2, 178 - cut2, 178 - cut2),
                    CRect<int>(210, 0, 178, 178), (u_char)alpha2);

        float a3 = atan2f(900.0f - x3, -100.0f - y3);

        if (a3 < rot3) {
            rot3 = rot3 - 0.05f;
        }

        if (a3 > rot3) {
            rot3 += 0.05f;
        }

        x3 = x3 + (float)(sin(rot3) * 4.0);
        y3 = y3 + (float)(cos(rot3) * 4.0);

        int alpha3;

        if (y3 < 32.0f) {
            alpha3 = (int)(128.0f - 4.0f * (32.0f - y3));
        } else {
            alpha3 = 128;
        }

        if (alpha3 < 0) {
            alpha3 = 0;
        }

        if (y3 <= 0.0f) {
            x3 = 362.0f;
            y3 = 229.0f;
        }

        int cut3 = (int)((229.0f - y3) / 2.0f);

        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>((int)x3, (int)y3, 178 - cut3, 178 - cut3),
                    CRect<int>(210, 0, 178, 178), (u_char)alpha3);
    }

    static float x = 426.0f;
    static float y = -206.0f;
    static float x2 = 726;
    static float y2 = -306.0f;

    float dx, dy;

    dy = 180.0f - y;
    dx = 40.0f - x;
    float a = atan2f(dx, dy);

    x = x + (float)(sin(a) * 3.0);
    y = y + (float)(cos(a) * 3.0);

    int alpha;

    if (y > 148.0f) {
        alpha = (int)(128.0f - 4.0f * (y - 148.0f));

        if (alpha < 0) {
            alpha = 0;
        }
    } else {
        alpha = 128;
    }

    if (y >= 178.0f) {
        x = 426.0f;
        y = -206.0f;
    }

    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>((int)x, (int)y, 210, 206), CRect<int>(0, 0, 210, 206),
                (u_char)alpha);

    float a2 = atan2f(240.0f - x2, 180.0f - y2);

    x2 = x2 + (float)(sin(a2) * 3.0);
    y2 = y2 + (float)(cos(a2) * 3.0);

    int alpha2;

    if (y2 > 148.0f) {
        alpha2 = (int)(128.0f - 4.0f * (y2 - 148.0f));

        if (alpha2 < 0) {
            alpha2 = 0;
        }
    } else {
        alpha2 = 128;
    }

    if (y2 >= 178.0f) {
        x2 = 726;
        y2 = -306.0f;
    }

    set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                CRect<int>((int)x2, (int)y2, 210, 206), CRect<int>(0, 0, 210, 206),
                (u_char)alpha2);

    if (CScript.sprite == 6) {
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("0519p", -1),
                    CRect<int>(40, 180, 463, 206), CRect<int>(177, 206, 463, 242),
                    (u_char)fadeA1);
    }
}

/* The ripples on the hall's floor: one model drawn four times, each at its own scale and a little
   higher than the last, fading as it grows. The five scales start staggered and then run together,
   which is why the table has one more entry than there are frames to draw; each ripple plays a
   sound of its own the first time it grows past nothing. */
static void HamonProcess()
{
    sceVu0FVECTOR ambient;

    sceVu0CopyVector(ambient, ambientlight);

    for (int i = 0; i < 5; i++) {
        static int se[5] = { 0, 0, 0, 0, 0 };

        if (!Pause && HScale[i] < 3.2f) {
            HScale[i] += 0.005f;
        }

        if (HScale[i] > 0.0f) {
            if (!se[i]) {
                switch (i) {
                case 0:
                    OpPlayVolSE(14, 40, 46, 1.0f);
                    break;

                case 1:
                    OpPlayVolSE(14, 40, 46, 0.85f);
                    break;

                case 2:
                    OpPlayVolSE(14, 40, 46, 0.6f);
                    break;

                case 3:
                    OpPlayVolSE(14, 40, 46, 0.45f);
                    break;

                case 4:
                    OpPlayVolSE(14, 40, 46, 0.3f);
                    break;
                }

                se[i] = 1;
            }

            if (i < 4) {
                Hamon[i]->SetScale(HScale[i], HScale[i], HScale[i]);
                Hamon[i]->SetPosition((float)(i - i), 0.01f + (float)i / 100.0f, 0.0f);
                ambient[3] = 128.0f - 40.0f * HScale[i];

                if (ambient[3] < 0.0f) {
                    ambient[3] = 0.0f;
                }

                MGSetAmbient(ambient);

                sceGsAlpha alpha = mgAlpha;

                alpha.bits.a = 0;
                alpha.bits.b = 2;
                alpha.bits.c = 0;
                alpha.bits.d = 1;
                setAlphaFlag(Vif1Packet, &alpha);
                MGDraw(Hamon[i]);
                setAlphaFlag(Vif1Packet, &mgAlpha);
            }
        }
    }

    MGSetAmbient(ambientlight);
}

