#pragma constant_flag 0
#pragma constant_flag_ones 16,18
#pragma argument_flag 0
#pragma argument_flag_ones 14,16,20,22,31,33,45,47,109,418
#pragma argument_flag_ones 430,452,453,463,464,474,475,485,486,533
#pragma argument_flag_ones 534,537,547,548,551,561,562,565,585,586
#pragma argument_flag_ones 589,599,600,603,615,616,619,629,630,633
#pragma argument_flag_ones 643,644,647,657,658,661,671,672,675,685
#pragma argument_flag_ones 686,689,699,700,703,713,714,717,727,728
#pragma argument_flag_ones 731,744,745,748,762,768,775
/* The title screen's own loop. Retail compiles it apart from the rest of the
   title unit: its constants are a run of their own, which is why the three
   names it shares with the code before it are spelled twice in the image. */

#include "title/logo.hpp"
#include "camera.hpp"
#include "title/scfader.hpp"

#include "title/cursol.hpp"

#include "title/sprite.hpp"

#include "camerafollow.hpp"
#include "character.hpp"
#include "dataalloc.hpp"
#include "common.h"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>
#include <cmath>
#include "mathutil.hpp"
#include "mds.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include <cstdlib>

/* Its retail name is already mangled, so it is reached the way main.cpp
   reaches it. */
extern "C" void MapJump__Fii(int map_no, int event_no);

extern CSound CSnd;

/* The rectangle every 2D draw takes, declared here rather than reached through rect.h because the
   two constructors that header states are not this file's: every rectangle here is built by one
   that assigns x, y, w and h in that order, and rect.h's assigns them in the other. */
template <class T>
class CRect
{
public:
    CRect() {}
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
} ;

/* One piece of scenery the third scene lays out: the model file, where it stands and how far it is
   turned about the vertical axis, in degrees. */
struct MAP_INFO
{
    char* name;
    float position[3];
    float rotation;
};

/* What this file reaches of the display layer. It is declared here rather than reached through
   mglib.h because that header states the rectangle above, and the two spellings of it cannot both
   be in one translation unit. */
extern sceVif1Packet* Vif1Packet;

sceVif1Packet* GetVif1Packet();
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetBGColor(float r, float g, float b, float a);
void MGSetViewMatrix(sceVu0FMATRIX view, float* position);
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetAmbient(float* color);
void MGDraw(CFrame* frame);
void MGSetGsTEST(sceGsTest* test);
void MGGetFBuffTex(sceGsTex0* tex);
void MGGetFBuffBackTex(sceGsTex0* tex);
void MGStretchMoveImage(sceGsTex0* src, const CRect<int>& src_rect, sceGsTex0* dst,
                        const CRect<int>& dst_rect);
void MGClearZBuffer(int mode);

extern u_int* read_buffer;
extern int CursorVibeCnt;
extern u_int Vu_prog0f[];

extern CDataAlloc2<1> VisualData;
extern CDataAlloc2<1> MotionData;
extern CDataAlloc2<1> TextureData;

/* The rectangle DrawObjectVibe takes by value. It is four ints and not a CRect: the two are the
   same fields and the name the call encodes is this one. */
struct RECT
{
    int x;
    int y;
    int w;
    int h;
};

void InitializeDataBuffer();
void SetDataBuffer(CDataAlloc2<1>* buffer, int size);
void SetPacketReadBuffer(int size, int offset);
void setbilinear(int on);
int LoadFileMenuData(char* name, u_int* buffer);
void set2DSprite(sceVif1Packet* packet, CTexture* texture, const CRect<int>& dst,
                 const CRect<int>& src, u_char alpha);
void set2DSprite(sceVif1Packet* packet, CTexture* texture, const CRect<int>& dst,
                 const CRect<int>& src, u_char r, u_char g, u_char b, u_char a);
void DrawObjectVibe(int id, int frame, CTexture* texture, RECT rect, u_char size, int alpha);

void InitOpeningBook(u_long128* pack, int* param);
int OpeningBookKey();
void OpeningBookDraw();
void InitMenuSave(int mode, int type, u_long128* pack);
int MenuSaveKey();
void DrawMenuSave(char* name);
void InitMenuOption(int mode, int type, u_long128* pack);
int MenuOptionKey();
void DrawMenuOption();

#include "title/dispfade.hpp"
#include "object.hpp"
#include "title/script.hpp"
#include "texture.hpp"

#define PI 3.14159265358979323846

class OBJ_ANIME_SEQ
{
public:
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

/* The classes this movie places in the world, declared here rather than reached through headers of
   their own because each is another unit's to type. Only the members this file touches are named;
   the extents are the sizes the executable gives the objects below. */

/* The rippling water plane the outdoor scenes stand on. The frame is where the plane sits in the
   world. */
class CWater
{
public:
    CWater();

    void SetVertex(float* v0, float* v1, float* v2, float* v3);
    void SetSize(int x, int y, CDataAlloc2<1>* buffer);
    void SetParam(float unknown0, float unknown1, float unknown2, float unknown3);
    void SetColor(u_char r, u_char g, u_char b, u_char a);
    void Shake(int x, int y, float power);
    void Hamon();
    int DrawVu1(RenderInfo* info, sceVif1Packet* packet, u_long128* unknown0);

    char unread[176];
    CFrameVu1 frame;
};

/* Named rather than included, because a unit's include list is a dial on the order a call's
   floating-point arguments are set up in and nothing here needs the definition: adding
   renderinfo.h alone takes RushInit's three-float SetFollow out of the order the image has. */
class RenderInfo;

/* A frame parented to an object, which is what lets the world transform drive a model. */
class CObjectFrame : public CObject
{
public:
    virtual void FrameObjectOnOff(char* name, int on);
    virtual void Draw();

    void SetFrame(CFrameVu1* frame, int unknown0);
};

/* One piece of scenery. The movie builds a table of them, hands each its model, and drives them
   through the object dispatch like anything else in the world. */
class CMapObject : public CObjectFrame
{
public:
    CMapObject();

    virtual void Draw();

    void Initialize();
    void DrawShadow(int unknown0);

    char unk_18[36];
    CFrameVu1* lod_model;
    char unk_4C[8];
    float lod_distance;
    int unk_40;
    int unk_44;
    char unk_3C[4];
};

/* The dust the running feet kick up, declared here for the same reason. */
class CRunEffect
{
public:
    CRunEffect();

    void Lighting(int on);
    void Set(float* position);
    void Step();
    void Draw();

    char unread[208];
};

/* The movie's one fire, which is a light rather than a model. */
class CFireOmni
{
public:
    CFireOmni();

    void FireStep();
    void FireCreate();
    void SetPosition(float x, float y, float z)
    {
        position[0] = 10.0f * x;
        position[1] = 10.0f * y;
        position[2] = 10.0f * z;
        position[3] = 1.0f;
    }
    void DrawFire(int unknown0, int unknown1, CCamera* camera, float* eye, float scale,
                  int unknown2, float unknown3);

    char unk_18[32];
    sceVu0FVECTOR position;
    char unk_4C[16];
};

/* The wind the cloth simulation reads, which every scene points its cloth-carrying character at. */
class CWind
{
public:
    CWind();

    void SetDir(float* dir);
    void SetVelocity(float velocity);
    void Step();

    char unread[48];
};

/* A run of frames the world draws as one. */
class CMap
{
public:
    void Initialize();
    CMapObject* SetObject(CFrameVu1* frame, int unknown0, int unknown1);
    CMapObject* SetObject(int no, CFrameVu1* frame, int unknown0, int unknown1);
    CMapObject* GetObject(int no);
    void Draw();

    char unread[2800];
};

void wait_now_loading_vsync();
void InitializeDataBuffer();
void SetDataBuffer(CDataAlloc2<1>* buffer, int size);
void SetPacketReadBuffer(int size, int offset);
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetBGColor(float r, float g, float b, float a);
void InitObjAnime(CFrame* frame, OBJ_ANIME_SEQ* sequence);
void ObjAnimePlay(OBJ_ANIME_SEQ* sequence);
sceVif1Packet* GetVif1Packet();
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetViewMatrix(sceVu0FMATRIX view, float* position);
void MGGetFBuffBackTex(sceGsTex0* tex);
void MGGetFBuffTex(sceGsTex0* tex);
void MGMoveImage(sceGsTex0* src, const CRect<int>& rect, sceGsTex0* dst, int dsax, int dsay,
                 int dir);
void MGSetGsZBUF(sceGsZbuf* zbuf);
void MGSetAmbient(float* color);
void setAlphaFlag(sceVif1Packet* packet, sceGsAlpha* alpha);
void MGBeginDrawShadow(sceGsTex0 tex);
void MGEndDrawShadow(u_char alpha);
void set2DSprite(sceVif1Packet* packet, CTexture* texture, const CRect<int>& dst,
                 const CRect<int>& src, u_char alpha);
void set2DSprite(sceVif1Packet* packet, CTexture* texture, const CRect<int>& dst,
                 const CRect<int>& src, u_char r, u_char g, u_char b, u_char a);
void set2DSprite(sceVif1Packet* packet, CTexture* texture, const CRect<int>& dst,
                 const CRect<int>& src, int width, int height, float angle);
void DepthOfField(float* dist, int level, int alpha, int blur);
void OPAnalyz(char* name);
void OPMdsLoad();
extern "C" char* strcpy(char* dst, const char* src);

void SndSetCamera(CCamera* camera);
void SndInitialize(int unknown0, int unknown1, int unknown2, int unknown3);
void SndSetReadBuffer(u_int* buffer);
void SndSoundLoad(int no);
void SndAmbientPlay(int no);
void SndBgmInit();
void SndBgmLoad(int no);
void SndBgmPlay(int no);
void SndBgmFadeOut(int time, int unknown0);
void SndBgmStop();
void SndAmbientStop();
void SndStep();
void SndSePlay(int se, float* position, float near_dist, float far_dist);

extern u_int* read_buffer;
extern u_int Vu_prog0f[];
extern sceVif1Packet* Vif1Packet;
extern CGamePad GamePad;
extern OBJ_ANIME_SEQ OP_AnimeSeq[32];
extern int OP_AnimeSeqRot;
extern CTextureManager TexManager;
extern CCharacter Chara[23];
extern CMapObject OP_NornMapObj[76];
extern int OP_FireList;
extern sceVu0FVECTOR OP_FirePosition[96];
extern float OP_FireScale[96];
extern CMap OP_GroundMap;
extern CMap OP_BuildingMap;
extern CMap OP_BuildingMap2;
extern sceGsZbuf mgZBuffer;
extern RenderInfo mgRenderInfo;
extern sceVu0FMATRIX light;
extern sceVu0FMATRIX lightcolor;
extern sceVu0FVECTOR ambientlight;
extern sceGsAlpha mgAlpha;
extern CDataAlloc2<1> MapDataBuffer;
extern CDataAlloc2<1> TextureData;

extern CCameraFollow MainCamera;
extern CDispFade DispFade;
extern CFireOmni CFire;
extern CWind Wind;
extern CWater Water;
extern char CharaTex[9];
extern CDataAlloc2<1> CharaDataBuffer;
extern tagFRAME_INF frame_info_cam[300];
extern CCharacter Cam[4];
extern MOTION_INFO MotionInfo;
extern CDataAlloc2<1> PathDataBuffer;
extern CDataAlloc2<1> WaterBuffer;
extern CDataAlloc2<1> DummyDataBuffer;
extern CTexAnimeData TexAnimeData[30];
extern CRunEffect CRunFx;

extern CFrame* OP_CharaFrame;
extern u_char bEnd;
extern int EndCnt;
extern int CameraMode;
extern int SceneNp;
extern float TitleAngle;
extern int StartDisp;
extern int TitleFade;
extern int TitleFadeCnt;
extern int StartLightning;
extern float atraGetStatusRate;

extern void SetObjAnime(char* name, CFrameVu1* frame, float* scale, float* position);
void MotionProcess();
void DrawProcess();
void SoundProcess();
void WaterProcess();
void DataLoad();
void InitProcA();
void DrawProcA();
void InitProcB();
void DrawProcB();
void AtraLight();
void InitProcC();
void DrawProcC();
void InitProcD();
void DrawProcD();
void InitProcE();
void DrawProcE();
void InitProcF();
void DrawProcF();
void InitProcG();
void DrawProcG();
void InitProcH();
void DrawProcH();
void InitProcI();
void DrawProcI();
void InitProcTitle();
void DrawProcTitle();

/* The step the title screen is on. The symbol is eight bytes and the file's own initializer
extern zeroes only the first of them, which nothing a plain int can be spelled as does;
   is never read or written anywhere in the overlay. */
class CProcess
{
public:
    CProcess() { no = 0; }

    int no;
    int unk_04;
};

void TitleDraw();
void TiPlayVolSE(int group, int no, int voice, float volume);

extern CFrame* ObjectFrame3;

/* Nothing reads this, and nothing in the image stands for it: the link this file was built by
   removed it. It is here because the compiler carries state from one definition to the next, and
   the follow camera below is constructed with its four arguments evaluated in an order no
   declaration that emits nothing reaches. Deleting it puts three of those four constants in the
   wrong registers. */

extern CCamera Camera;
extern CCameraFollow FCamera;
extern CCharacter Cloud;
extern CCharacter Logo;
extern CCharacter Spark[9];

extern CProcess CProcess;
extern CScFader CFade;

extern CSprite CSprite;
extern CLogo CLogo;
extern CCursol CCursol;

int Fade1;
int Fade2;
int Fade3;
int Fade4;
int Wait;
int opcnt;
int keywait;
u_char brink;
int brinkcnt;
int EffCnt;

/* Nothing calls this and nothing reads the table it writes: the link this file was built by
   removed both. They are here because the compiler carries state from one definition to the next,
   and the camera calls in TitleInit below evaluate their arguments in an order that no declaration
   emitting nothing reaches. */
extern float TitleCameraWork[8];


void TitleInit(int no)
{
    int i;
    float scale = 750.0f;
    float far_z = 65535.0f;

    InitializeDataBuffer();
    SetDataBuffer(&VisualData, 200000);
    SetDataBuffer(&MotionData, 500000);
    SetDataBuffer(&TextureData, 300000);
    SetPacketReadBuffer(40000, 300000);

    MGSetRenderInfo(scale, 4.0f, far_z);
    Camera.SetRef(0, 0.0f, 0.0f, 0.0f);
    /* One of these five calls is written from a named zero and the rest are not, and where
       the name is declared is what it is for: this compiler evaluates a call's constant
       arguments in an order set by the declarations standing above the call. */
    float zero = 0.0f;
    Camera.SetPos(0, zero, zero, zero);
    FCamera.SetFollow(0.0f, 0.0f, 0.0f);
    FCamera.SetAngle(0.0f);
    FCamera.SetDistance(180.0f);
    FCamera.SetHeight(2.0f);
    MGSetBGColor(0.0f, 0.0f, 0.0f, 128.0f);
    setbilinear(1);

    LOADTEXTURE_INFO tex[] = {
        { "#frame_image_mes#640#448#4", 26, 0 },
        { "#fukidashibase#640#224#4", 26, 0 },
        { "#fontbase#512#256#1", 26, 0 },
        { "meswin/gaiji.img", 26, 0 },
        { "meswin/fuki256.img", 26, 0 },
        { "meswin/syst04.img", 26, 0 },
        { "", 0, 0 }
    };

    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, tex, read_buffer);
    LoadFileMenuData("stayframe.img", (u_int*)read_buffer);
    TexManager.EnterFixTextureZ((u_char*)read_buffer);
    LoadFile("titledat/title.pak", (void*)read_buffer, 0);

    LOADTEXTURE_INFO2 tex2[] = {
        { (char*)"#frame_image#640#224#4", 0, 0 },
        { (char*)"#frame_image#640#224#4", 1, 0 },
        { (char*)"#frame_image#640#224#4", 2, 0 },
        { (char*)"#frame_image#640#224#4", 3, 0 },
        { 0, 0, 0 },
        { 0, 1, 0 },
        { 0, 1, 0 },
        { 0, 1, 0 },
        { 0, 1, 0 },
        { 0, 1, 0 },
        { 0, 1, 0 },
        { 0, 1, 0 },
        { 0, 1, 0 },
        { 0, 0, 0 }
    };

    tex2[4].name = (char*)GetPackFile(read_buffer, "bg.img", 0);
    tex2[5].name = (char*)GetPackFile(read_buffer, "title.img", 0);
    tex2[6].name = (char*)GetPackFile(read_buffer, "main.img", 0);
    tex2[7].name = (char*)GetPackFile(read_buffer, "pat01.img", 0);
    tex2[8].name = (char*)GetPackFile(read_buffer, "pat02.img", 0);
    tex2[9].name = (char*)GetPackFile(read_buffer, "start.img", 0);
    tex2[10].name = (char*)GetPackFile(read_buffer, "start3.img", 0);
    tex2[11].name = (char*)GetPackFile(read_buffer, "icon01.img", 0);
    tex2[12].name = (char*)GetPackFile(read_buffer, "trial.img", 0);
    TexManager.LoadTextureBlock(-1, tex2);

    sceVu0FVECTOR pos;

    ObjectFrame3 = LoadMDSFile(GetPackFile(read_buffer, "sky.mds", 0), 2, 0);
    pos[0] = 0.0f;
    pos[1] = 0.0f;
    pos[2] = -28.0f;
    ObjectFrame3->SetPosition(pos);

    Cloud.LoadPackData(read_buffer, "cloud.cfg",  &MotionData, 0);
    Cloud.motion_type.state.time = 100.0f;
    Cloud.motion_type.state.unk_08 = 0.1f;
    Cloud.motion_type.state.motion_no = 0;
    Cloud.motion_type.state.playing_no = 0;
    Cloud.motion_type.state.unk_1C = 0;
    Cloud.motion_no = 0;
    Cloud.SetPosition(0.0f, 0.0f, -5.0f);

    Logo.LoadPackData(read_buffer, "logo.cfg",  &MotionData, 0);
    Logo.motion_type.state.time = 1.0f;
    Logo.motion_type.state.unk_08 = 0.1f;
    Logo.motion_type.state.motion_no = 0;
    Logo.motion_type.state.playing_no = 0;
    Logo.motion_type.state.unk_1C = 0;
    Logo.motion_no = 0;

    char* name[9] = {
        "logo_p1.cfg", "logo_p2.cfg", "logo_p3.cfg", "logo_p4.cfg", "logo_p5.cfg",
        "logo_p6.cfg", "logo_p7.cfg", "logo_p8.cfg", "logo_p9.cfg"
    };

    for (i = 0; i < 9; i++) {
        Spark[i].LoadPackData(read_buffer, name[i],  &MotionData, 0);
        Spark[i].motion_type.state.time = 1.0f;
        Spark[i].motion_type.state.unk_08 = 0.1f;
        Spark[i].motion_type.state.motion_no = 0;
        Spark[i].motion_type.state.playing_no = 0;
        Spark[i].motion_type.state.unk_1C = 0;
        Spark[i].motion_no = 0;
        Spark[i].SetPosition(0.0f, 11.599f, -19.099f);
    }

    CSnd.SetReverb(0, 4, 5);
    CSnd.SetReverb(1, 0, 0);
    CSnd.LoadSoundFileFromPack("title.txt", read_buffer);
    CSnd.SetVol(15, 256);
    CSnd.SetVol(14, 256);
    CSnd.SetVol(13, 256);
    CSnd.SetVol(12, 256);
    CSnd.SQ_Play(1, 0);

    Fade1 = Fade2 = Fade3 = Fade4 = Wait = 0;
    opcnt = 0;
    keywait = 0;
    brinkcnt = 0;
    brink = 0;
    EffCnt = 0;
    CProcess.no = 0;
    CFade.value = 0;

    CSprite.Init();
    CLogo.Init();
    CCursol.Init();

    if (no == 1) {
        CCursol.select = 1;
        CCursol.Set(316.0f);
        for (i = 0; i < 10; i++) CCursol.Move();
    }

    GamePad.SetAutoRepeat(20480, 30, 9);
    GamePad.MenuModeOn(120);
}

int TitleLoop()
{
    sceVu0FVECTOR pos;
    sceVu0FMATRIX matrix;
    int i;

    sceVif1PkCall(Vif1Packet, (u_long128*)Vu_prog0f, 0);
    FCamera.GetPos(pos);
    FCamera.Step(1);
    FCamera.GetCameraMatrix(matrix);
    MGSetViewMatrix(matrix, pos);
    Cloud.Step();

    switch (CProcess.no) {
    case 0:
        if (CFade.In()) CProcess.no = 2;
        if (GamePad.Down(2048) && EffCnt > 16) {
            CFade.Skip();
            CProcess.no = 3;
        }
        if (EffCnt < 100) EffCnt++;
        break;

    case 1:
        if (CFade.In2()) CProcess.no = 4;
        break;

    case 2:
        if (Wait < 120) Wait++;
        else CProcess.no = 3;
        if (GamePad.Down(2048)) CProcess.no = 3;
        break;

    case 3:
        if (CSprite.Se() == 0) TiPlayVolSE(14, 38, 21, 1.0f);
        CSprite.Move();
        if (GamePad.Down(2048)) {
            Logo.motion_type.state.time = 116.0f;
            Fade1 = 128;
            CSprite.x[0] = 700.0f;
        }
        if (CSprite.x[0] > 100.0f) {
            if (Logo.motion_type.state.time < 116.0f) {
                for (i = 0; i < 9; i++) Spark[i].Step();
                Logo.Step();
                CLogo.Fade();
            } else {
                if (Fade1 < 128) {
                    Fade1++;
                } else {
                    Fade2 = (Fade2 + 2) & 0x7f;
                    keywait++;
                    if (keywait >= 500) keywait = 500;
                }
                CLogo.Move();
            }
            if (Fade1 > 127 && GamePad.Down(2048)) {
                TiPlayVolSE(13, 122, 25, 1.0f);
                CProcess.no = 4;
                opcnt = 0;
            }
            if (Fade1 > 127) {
                if (opcnt > 1800) {
                    CCursol.select = 3;
                    CProcess.no = 7;
                } else {
                    opcnt++;
                }
            }
        }
        break;

    case 4:
        CLogo.Move();
        if (CCursol.Move()) {
            if (GamePad.Down(4096)) {
                CCursol.select--;
                opcnt = 0;
                TiPlayVolSE(13, 122, 24, 1.0f);
            }
            if (GamePad.Down(16384)) {
                CCursol.select++;
                opcnt = 0;
                TiPlayVolSE(13, 122, 24, 1.0f);
            }
            if (CCursol.select < 0) CCursol.select = 2;
            if (CCursol.select > 2) CCursol.select = 0;
            switch (CCursol.select) {
            case 0: CCursol.Set(288.0f); break;
            case 1: CCursol.Set(316.0f); break;
            case 2: CCursol.Set(348.0f); break;
            }
            if (GamePad.Down(2048) || GamePad.Down(64)) {
                TiPlayVolSE(14, 38, 20, 1.0f);
                CProcess.no = 5;
                opcnt = 0;
            }
            if (GamePad.Down(32)) {
                Fade1 = Fade2 = Fade3 = Fade4 = 0;
                CSprite.Init();
                CLogo.Init();
                CCursol.Init();
                CProcess.no = 3;
                opcnt = 0;
            }
            if (opcnt > 1800) {
                CCursol.select = 3;
                CProcess.no = 7;
            } else {
                opcnt++;
            }
        }
        break;

    case 5:
        CLogo.Move();
        brink = 1;
        brinkcnt++;
        if (brinkcnt > 60) CProcess.no = 6;
        break;

    case 6:
        brinkcnt++;
        if (CFade.Out()) {
            switch (CCursol.GetSelect()) {
            case 0: CProcess.no = 8; break;
            case 1: CProcess.no = 10; break;
            case 2: CProcess.no = 12; break;
            }
        }
        break;

    case 7:
        if (CFade.Out()) {
            SndStopAllSe();
            CSnd.Stop(0);
            CSnd.StopVoice(0);
            CProcess.no = 14;
        }
        break;

    case 8:
        SndStopAllSe();
        CSnd.Stop(0);
        CSnd.StopVoice(0);
        CSnd.SetReverb(0, 4, 40);
        CSnd.SetVol(15, 256);
        CSnd.SetVol(14, 256);
        CSnd.SetVol(13, 256);
        CSnd.SetVol(12, 256);
        CSnd.SQ_Play(0, 0);
        TiPlayVolSE(15, 16, 24, 0.5f);
        {
            int book[2] = { 2, 60 };

            InitOpeningBook((u_long128*)read_buffer, book);
        }
        CProcess.no = 9;
        break;

    case 9:
        if (OpeningBookKey()) CProcess.no = 14;
        break;

    case 10:
        InitMenuSave(0, 2, 0);
        CProcess.no = 11;
        break;

    case 11:
        switch (MenuSaveKey()) {
        case 0:
            CFade.In();
            break;
        case 1:
            /* CSaveData::map_no is private and retail reaches it from another
               translation unit, so this is the offset main.cpp uses rather than
               a getter the class does not have. */
            MapJump__Fii(*(s32 *) ((char *) SaveData + 0x1C8), -1);
            CProcess.no = 14;
            break;
        case 2:
            brink = 0;
            CFade.value = 0;
            CProcess.no = 1;
            break;
        }
        break;

    case 12:
        InitMenuOption(0, 2, 0);
        CProcess.no = 13;
        break;

    case 13:
        CFade.In();
        if (MenuOptionKey()) {
            brink = 0;
            CFade.value = 0;
            CProcess.no = 1;
        }
        break;

    case 14:
        SndStopAllSe();
        CSnd.Stop(0);
        CSnd.StopVoice(0);
        return CCursol.GetSelect() + 1;
    }

    TitleDraw();
    CSnd.Step();
    return 0;
}

void TitleDraw()
{
    sceVu0FVECTOR light0 = { 2.4578f, 9.9294f, -2.8074f, 0.0f };
    sceVu0FVECTOR light1 = { 4.6086f, -10.4028f, -0.8286f, 0.0f };
    sceVu0FVECTOR light2 = { 0.0f, 0.0f, -10.0f, 0.0f };
    sceVu0FMATRIX light;
    sceVu0FMATRIX color = {
        { 191.0f, 105.0f, 76.0f, 128.0f },
        { 63.0f, 51.0f, 127.0f, 128.0f },
        { 40.0f, 30.0f, 30.0f, 128.0f },
        { 0.0f, 0.0f, 0.0f, 0.0f }
    };
    sceVu0FVECTOR light0b = { 0.0f, 6.0f, -8.0f, 0.0f };
    sceVu0FVECTOR light1b = { 0.0f, 0.0f, 0.0f, 0.0f };
    sceVu0FVECTOR light2b = { 0.0f, 0.0f, 0.0f, 0.0f };
    sceVu0FMATRIX lightb;
    sceVu0FMATRIX colorb = {
        { 128.0f, 128.0f, 112.0f, 128.0f },
        { 0.0f, 0.0f, 0.0f, 0.0f },
        { 0.0f, 0.0f, 0.0f, 0.0f },
        { 0.0f, 0.0f, 0.0f, 0.0f }
    };
    sceVu0FVECTOR ambient = { 0.0f, 0.0f, 0.0f, 100.0f };
    int i;

    if (CProcess.no == 0 || (CProcess.no == 6 && CCursol.GetSelect() == 0) || CProcess.no == 7) {
        ambient[3] = (float)CFade.Get(128);
    } else {
        ambient[3] = 128.0f;
    }
    MGSetAmbient(ambient);

    sceVu0Normalize(light0, light0);
    sceVu0Normalize(light1, light1);
    sceVu0Normalize(light2, light2);
    sceVu0NormalLightMatrix(light, light0, light1, light2);
    MGSetPLight(light, color);

    if (CProcess.no != 9 && CProcess.no != 14) {
        static float rot[4] = { 0.0f, 0.0f, 0.0f, 0.0f };

        TexManager.ReloadTexture(GetVif1Packet(), 0);
        rot[1] += 0.001f;
        if (rot[1] > 3.14f) rot[1] -= 6.28f;
        ObjectFrame3->SetRotation(rot[0], rot[1], rot[2]);
        MGDraw(ObjectFrame3);
    }

    if (CProcess.no != 9 && CProcess.no != 14) {
        TexManager.ReloadTexture(GetVif1Packet(), 1);
        if (CProcess.no == 0 || (CProcess.no == 6 && CCursol.GetSelect() == 0) || CProcess.no == 7) {
            ambient[3] = (float)CFade.Get(100);
        } else {
            ambient[3] = 100.0f;
        }
        MGSetAmbient(ambient);
        Cloud.Draw();
    }

    if (CProcess.no != 0 || CFade.Get(128) >= 4) {
        sceGsTest test;

        MGSetGsTEST(&test);
        test.bits.date = 0;
        test.bits.ate = 0;
        MGSetGsTEST(&test);
        setbilinear(1);

        set2DSprite(GetVif1Packet(), TexManager.GetTexture("frame_image", -1),
                    CRect<int>(0, 0, 640, 85), CRect<int>(1, 0, 639, 45),
                    112);

        for (i = 1; i < 4; i++) {
            set2DSprite(GetVif1Packet(), TexManager.GetTexture("frame_image", -1),
                        CRect<int>(0, i * 84 + 1, 640, 84), CRect<int>(1, i * 42, 639, 45),
                        114);
        }

        set2DSprite(GetVif1Packet(), TexManager.GetTexture("frame_image", -1),
                    CRect<int>(0, 336, 640, 105), CRect<int>(1, 167, 639, 57),
                    114);
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("frame_image", -1),
                    CRect<int>(0, 440, 640, 8), CRect<int>(1, 220, 639, 3),
                    114);

        MGSetGsTEST(0);
    }

    {
        sceGsTex0 tex0;
        sceGsTex0 image;

        MGGetFBuffTex(&tex0);
        image = *(sceGsTex0*)&TexManager.GetTexture("frame_image", -1)->tex0;
        tex0.PSM = 1;
        MGStretchMoveImage(&tex0, CRect<int>(0, 0, 10240, 3584), &image,
                           CRect<int>(0, 0, 10240, 3584));
    }
    MGClearZBuffer(0);

    switch (CProcess.no) {
    case 3:
    case 1:
    case 4:
    case 5:
    case 6:
    case 7:
        sceVu0Normalize(light0b, light0b);
        sceVu0Normalize(light1b, light1b);
        sceVu0Normalize(light2b, light2b);
        sceVu0NormalLightMatrix(lightb, light0b, light1b, light2b);
        MGSetPLight(lightb, colorb);
        CLogo.Sparkdraw(Logo.motion_type.state.time);
        CLogo.Draw();

        set2DSprite(GetVif1Packet(), TexManager.GetTexture("main", -1),
                    CRect<int>(0, 62, 288, 170), CRect<int>(0, 0, 288, 170),
                    (u_char)CFade.Get(Fade4));
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("main", -1),
                    CRect<int>(288, 112, 72, 190), CRect<int>(288, 50, 72, 190),
                    (u_char)CFade.Get(Fade4));
        set2DSprite(GetVif1Packet(), TexManager.GetTexture("main", -1),
                    CRect<int>(360, 142, 412, 160), CRect<int>(360, 80, 412, 160),
                    (u_char)CFade.Get(Fade4));

        ambient[3] = (float)CFade.Get(128);
        MGSetAmbient(ambient);
        if (CFade.Get(128) == 128) CSprite.Draw();

        set2DSprite(GetVif1Packet(), TexManager.GetTexture("start", -1),
                    CRect<int>(64, 362, 512, 64), CRect<int>(0, 64, 512, 64),
                    (u_char)CFade.Get(Fade1));

        if (CProcess.no == 3) {
            set2DSprite(GetVif1Packet(), TexManager.GetTexture("start", -1),
                        CRect<int>(64, 296, 512, 64), CRect<int>(0, 0, 512, 64),
                        (u_char)CFade.Get(Fade2));
        } else {
            static int br = 128;

            if (brink) {
                if (brinkcnt % 3 == 0) br = 32;
                else br = 128;
            } else {
                br = 128;
            }

            switch (CCursol.GetSelect()) {
            case 0:
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 280, 256, 32), CRect<int>(0, 0, 256, 32),
                            (u_char)CFade.Get(br));
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 312, 256, 32), CRect<int>(0, 32, 256, 32),
                            (u_char)CFade.Get(32));
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 344, 256, 32), CRect<int>(0, 64, 256, 32),
                            (u_char)CFade.Get(32));
                break;

            case 1:
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 280, 256, 32), CRect<int>(0, 0, 256, 32),
                            (u_char)CFade.Get(32));
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 312, 256, 32), CRect<int>(0, 32, 256, 32),
                            (u_char)CFade.Get(br));
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 344, 256, 32), CRect<int>(0, 64, 256, 32),
                            (u_char)CFade.Get(32));
                break;

            case 2:
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 280, 256, 32), CRect<int>(0, 0, 256, 32),
                            (u_char)CFade.Get(32));
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 312, 256, 32), CRect<int>(0, 32, 256, 32),
                            (u_char)CFade.Get(32));
                set2DSprite(GetVif1Packet(), TexManager.GetTexture("start3", -1),
                            CRect<int>(193, 344, 256, 32), CRect<int>(0, 64, 256, 32),
                            (u_char)CFade.Get(br));
                break;
            }

            if (CProcess.no != 7) {
                setbilinear(0);
                CursorVibeCnt++;

                RECT rect = { 0, 0, 32, 32 };

                DrawObjectVibe(225, CCursol.GetPos(), TexManager.GetTexture("icon01", -1), rect,
                               128, CFade.Get(128));
                setbilinear(1);
            }
        }
        break;

    case 9:
        TexManager.ReloadTexture(GetVif1Packet(), 2);
        OpeningBookDraw();
        break;

    case 11:
        TexManager.ReloadTexture(GetVif1Packet(), 2);
        DrawMenuSave(0);
        break;

    case 13:
        TexManager.ReloadTexture(GetVif1Packet(), 2);
        DrawMenuOption();
        break;
    }

    {
        sceGsTex0 backtex;

        MGGetFBuffBackTex(&backtex);

        CTexture texture;

        texture.tex0 = *(u_long*)&backtex;
        set2DSprite(Vif1Packet, &texture,
                    CRect<int>(0, 0, 640, 448), CRect<int>(0, 0, 640, 224),
                    128, 128, 128, 35);
    }
}
