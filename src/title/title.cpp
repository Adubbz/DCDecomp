#pragma constant_flag 0
#pragma constant_flag_ones 2, 9, 12, 13, 14, 15, 28, 35, 37, 48
#pragma constant_flag_ones 49, 53, 54, 60, 61, 62, 65, 68, 74, 75
#pragma constant_flag_ones 77, 78, 82, 84, 87, 91, 92, 101, 102, 103
#pragma constant_flag_ones 108, 113, 115, 117, 121, 122, 123, 125, 126, 128
#pragma constant_flag_ones 129, 131, 132, 133, 139, 140, 146, 147, 149, 155
#pragma constant_flag_ones 166, 170, 171, 172, 173, 183, 187, 188, 194, 215
#pragma constant_flag_ones 216, 217, 222, 226, 228, 236, 237, 243, 246, 250
#pragma constant_flag_ones 252, 254, 256, 260, 263, 268, 277, 279, 280, 281
#pragma constant_flag_ones 282, 276

#include "common.h"

#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>

#include <cmath>
#include <cstdlib>

#include "camera.hpp"
#include "camerafollow.hpp"
#include "character.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "gamepad.hpp"
#include "mathutil.hpp"
#include "mds.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "title/cursol.hpp"
#include "title/logo.hpp"
#include "title/scfader.hpp"
#include "title/sprite.hpp"

/* Its retail name is already mangled, so it is reached the way main.cpp
   reaches it. */
extern "C" void MapJump__Fii(int map_no, int event_no);

extern CSound CSnd;

/* The rectangle every 2D draw takes, declared here rather than reached through rect.h because the
   two constructors that header states are not this file's: every rectangle here is built by one
   that assigns x, y, w and h in that order, and rect.h's assigns them in the other. */
template <class T>
class CRect {
public:
    CRect() {}

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
};

/* One piece of scenery the third scene lays out: the model file, where it stands and how far it is
   turned about the vertical axis, in degrees. */
struct MAP_INFO {
    char *name;
    float position[3];
    float rotation;
};

/* What this file reaches of the display layer. It is declared here rather than reached through
   mglib.h because that header states the rectangle above, and the two spellings of it cannot both
   be in one translation unit. */
extern sceVif1Packet *Vif1Packet;

sceVif1Packet *GetVif1Packet();
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetBGColor(float r, float g, float b, float a);
void MGSetViewMatrix(sceVu0FMATRIX view, float *position);
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetAmbient(float *color);
void MGDraw(CFrame *frame);
void MGSetGsTEST(sceGsTest *test);
void MGGetFBuffTex(sceGsTex0 *tex);
void MGGetFBuffBackTex(sceGsTex0 *tex);
void MGStretchMoveImage(sceGsTex0 *src, const CRect<int> &src_rect, sceGsTex0 *dst,
                        const CRect<int> &dst_rect);
void MGClearZBuffer(int mode);

extern u_int *read_buffer;
extern int CursorVibeCnt;
extern u_int Vu_prog0f[];

extern CDataAlloc2<1> VisualData;
extern CDataAlloc2<1> MotionData;
extern CDataAlloc2<1> TextureData;

/* The rectangle DrawObjectVibe takes by value. It is four ints and not a CRect: the two are the
   same fields and the name the call encodes is this one. */
struct RECT {
    int x;
    int y;
    int w;
    int h;
};

void InitializeDataBuffer();
void SetDataBuffer(CDataAlloc2<1> *buffer, int size);
void SetPacketReadBuffer(int size, int offset);
void setbilinear(int on);
int LoadFileMenuData(char *name, u_int *buffer);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, u_char alpha);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, u_char r, u_char g, u_char b, u_char a);
void DrawObjectVibe(int id, int frame, CTexture *texture, RECT rect, u_char size, int alpha);

void InitOpeningBook(u_long128 *pack, int *param);
int OpeningBookKey();
void OpeningBookDraw();
void InitMenuSave(int mode, int type, u_long128 *pack);
int MenuSaveKey();
void DrawMenuSave(char *name);
void InitMenuOption(int mode, int type, u_long128 *pack);
int MenuOptionKey();
void DrawMenuOption();

#include "object.hpp"
#include "texture.hpp"
#include "title/dispfade.hpp"
#include "title/script.hpp"
#include "wind.hpp"

#define PI 3.14159265358979323846

class OBJ_ANIME_SEQ {
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
class CWater {
public:
    CWater();

    void SetVertex(float *v0, float *v1, float *v2, float *v3);
    void SetSize(int x, int y, CDataAlloc2<1> *buffer);
    void SetParam(float unknown0, float unknown1, float unknown2, float unknown3);
    void SetColor(u_char r, u_char g, u_char b, u_char a);
    void Shake(int x, int y, float power);
    void Hamon();
    int DrawVu1(RenderInfo *info, sceVif1Packet *packet, u_long128 *unknown0);

    char unread[176];
    CFrameVu1 frame;
};

/* Named rather than included, because a unit's include list is a dial on the order a call's
   floating-point arguments are set up in and nothing here needs the definition: adding
   renderinfo.h alone takes RushInit's three-float SetFollow out of the order the image has. */
class RenderInfo;

/* A frame parented to an object, which is what lets the world transform drive a model. */
class CObjectFrame : public CObject {
public:
    virtual void FrameObjectOnOff(char *name, int on);
    virtual void Draw();

    void SetFrame(CFrameVu1 *frame, int unknown0);
};

/* One piece of scenery. The movie builds a table of them, hands each its model, and drives them
   through the object dispatch like anything else in the world. */
class CMapObject : public CObjectFrame {
public:
    CMapObject();

    virtual void Draw();

    void Initialize();
    void DrawShadow(int unknown0);

    char unk_18[36];
    CFrameVu1 *lod_model;
    char unk_4C[8];
    float lod_distance;
    int unk_40;
    int unk_44;
    char unk_3C[4];
};

/* The dust the running feet kick up, declared here for the same reason. */
class CRunEffect {
public:
    CRunEffect();

    void Lighting(int on);
    void Set(float *position);
    void Step();
    void Draw();

    char unread[208];
};

/* The movie's one fire, which is a light rather than a model. */
class CFireOmni {
public:
    CFireOmni();

    void FireStep();
    void FireCreate();

    void SetPosition(float x, float y, float z) {
        position[0] = 10.0f * x;
        position[1] = 10.0f * y;
        position[2] = 10.0f * z;
        position[3] = 1.0f;
    }

    void DrawFire(int unknown0, int unknown1, CCamera *camera, float *eye, float scale,
                  int unknown2, float unknown3);

    char unk_18[32];
    sceVu0FVECTOR position;
    char unk_4C[16];
};

/* A run of frames the world draws as one. */
class CMap {
public:
    void Initialize();
    CMapObject *SetObject(CFrameVu1 *frame, int unknown0, int unknown1);
    CMapObject *SetObject(int no, CFrameVu1 *frame, int unknown0, int unknown1);
    CMapObject *GetObject(int no);
    void Draw();

    char unread[2800];
};

void wait_now_loading_vsync();
void InitializeDataBuffer();
void SetDataBuffer(CDataAlloc2<1> *buffer, int size);
void SetPacketReadBuffer(int size, int offset);
void MGSetRenderInfo(float scale, float near_z, float far_z);
void MGSetBGColor(float r, float g, float b, float a);
void InitObjAnime(CFrame *frame, OBJ_ANIME_SEQ *sequence);
void ObjAnimePlay(OBJ_ANIME_SEQ *sequence);
sceVif1Packet *GetVif1Packet();
void MGSetPLight(sceVu0FMATRIX light, sceVu0FMATRIX color);
void MGSetViewMatrix(sceVu0FMATRIX view, float *position);
void MGGetFBuffBackTex(sceGsTex0 *tex);
void MGGetFBuffTex(sceGsTex0 *tex);
void MGMoveImage(sceGsTex0 *src, const CRect<int> &rect, sceGsTex0 *dst, int dsax, int dsay,
                 int dir);
void MGSetGsZBUF(sceGsZbuf *zbuf);
void MGSetAmbient(float *color);
void setAlphaFlag(sceVif1Packet *packet, sceGsAlpha *alpha);
void MGBeginDrawShadow(sceGsTex0 tex);
void MGEndDrawShadow(u_char alpha);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, u_char alpha);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, u_char r, u_char g, u_char b, u_char a);
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect<int> &dst,
                 const CRect<int> &src, int width, int height, float angle);
void DepthOfField(float *dist, int level, int alpha, int blur);
void OPAnalyz(char *name);
void OPMdsLoad();
extern "C" char *strcpy(char *dst, const char *src);

void SndSetCamera(CCamera *camera);
void SndInitialize(int unknown0, int unknown1, int unknown2, int unknown3);
void SndSetReadBuffer(u_int *buffer);
void SndSoundLoad(int no);
void SndAmbientPlay(int no);
void SndBgmInit();
void SndBgmLoad(int no);
void SndBgmPlay(int no);
void SndBgmFadeOut(int time, int unknown0);
void SndBgmStop();
void SndAmbientStop();
void SndStep();
void SndSePlay(int se, float *position, float near_dist, float far_dist);

extern u_int *read_buffer;
extern u_int Vu_prog0f[];
extern sceVif1Packet *Vif1Packet;
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
extern CTexAnimeData TexAnimeDataMovie[30];
extern CRunEffect CRunFx;

extern CFrame *OP_CharaFrame;
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

extern void SetObjAnime(char *name, CFrameVu1 *frame, float *scale, float *position);
void MotionProcess();
void DrawProcess();
void SoundProcess();
void WaterProcess();
void DataLoad();
static void InitProcA();
void DrawProcA();
static void InitProcB();
void DrawProcB();
static void AtraLight();
static void InitProcC();
void DrawProcC();
static void InitProcD();
void DrawProcD();
static void InitProcE();
void DrawProcE();
static void InitProcF();
void DrawProcF();
static void InitProcG();
void DrawProcG();
static void InitProcH();
void DrawProcH();
static void InitProcI();
void DrawProcI();
static void InitProcTitle();
void DrawProcTitle();

/* The step the title screen is on. The symbol is eight bytes and the file's own initializer
   zeroes only the first of them, which nothing a plain int can be spelled as does; the second word
   is never read or written anywhere in the overlay. */
class CProcess {
public:
    CProcess() { no = 0; }

    int no;
    int unk_04;
};

void TitleDraw();
void TiPlayVolSE(int group, int no, int voice, float volume);

/* Nothing reads this, and nothing in the image stands for it: the link this file was built by
   removed it. It is here because the compiler carries state from one definition to the next, and
   the follow camera below is constructed with its four arguments evaluated in an order no
   declaration that emits nothing reaches. Deleting it puts three of those four constants in the
   wrong registers. */

CCamera Camera(4.0f);
CCameraFollow FCamera(60.0f, 20.0f, 0.0f, 4.0f);
CCharacter Cloud;
CCharacter Logo;
CCharacter Spark[9];

extern CScFader CFade;

extern int Fade1;
extern int Fade2;
extern int Fade3;
extern int Fade4;
extern int Wait;
extern int opcnt;
extern int keywait;
extern u_char brink;
extern int brinkcnt;
extern int EffCnt;

/* Nothing calls this and nothing reads the table it writes: the link this file was built by
   removed both. They are here because the compiler carries state from one definition to the next,
   and the camera calls in TitleInit below evaluate their arguments in an order that no declaration
   emitting nothing reaches. */

void DataLoad() {
    if (CScript.load_no != -1) {
    load_wait:
        if (ReadBGSync())
            goto load_wait;
    }

    switch (CScript.load_no) {
        case 0: {
            void *buffer = read_buffer;
            LoadFile("rmdat/rmdat1.pak", buffer, 0);
            break;
        }
        case 1:
            LoadFileBG("rmdat/rmdat2.pak", (u_long128 *) read_buffer, 0);
            break;
        case 2:
            LoadFileBG("rmdat/rmdat3.pak", (u_long128 *) read_buffer, 0);
            break;
        case 3:
            LoadFileBG("rmdat/rmdat4.pak", (u_long128 *) read_buffer, 0);
            break;
        case 4:
            LoadFileBG("rmdat/rmdat5.pak", (u_long128 *) read_buffer, 0);
            break;
        case 5:
            LoadFileBG("rmdat/rmdat6.pak", (u_long128 *) read_buffer, 0);
            break;
        case 6:
            LoadFileBG("rmdat/rmdat7.pak", (u_long128 *) read_buffer, 0);
            break;
        case 7:
            LoadFileBG("rmdat/rmdat8.pak", (u_long128 *) read_buffer, 0);
            break;
        case 8:
            LoadFileBG("rmdat/rmdat9.pak", (u_long128 *) read_buffer, 0);
            break;
        case 9:
            LoadFileBG("rmdat/title.pak", (u_long128 *) read_buffer, 0);
            break;
    }
    CScript.load_no = -1;

    if (CScript.init_no != -1) {
        while (ReadBGSync())
            ;
        StartReadBG();
    }

    switch (CScript.init_no) {
        case 0:
            InitProcA();
            break;
        case 1:
            InitProcB();
            break;
        case 2:
            InitProcC();
            break;
        case 3:
            InitProcD();
            break;
        case 4:
            InitProcE();
            break;
        case 5:
            InitProcF();
            break;
        case 6:
            InitProcG();
            break;
        case 7:
            InitProcH();
            break;
        case 8:
            InitProcI();
            break;
        case 9:
            InitProcTitle();
            break;
    }
    CScript.init_no = -1;
}

static void InitProcA() {
    wait_now_loading_vsync();

    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {0, 20, 0},
        {0, 0, 0},
        {0, 1, 0},
        {0, 2, 0},
        {0, 3, 0},
        {0, 4, 0},
        {0, 5, 0},
        {0, 10, 0},
        {0, 10, 0},
        {"", 0, 0}};

    textures[2].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[3].name = (char *) GetPackFile(read_buffer, "effect.img", 0);
    textures[4].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "c12a01.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "c08a01.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "c09a01.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "e04a01.img", 0);
    textures[9].name = (char *) GetPackFile(read_buffer, "s1401.img", 0);
    textures[10].name = (char *) GetPackFile(read_buffer, "e01s01.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[1] = 2;
    CharaTex[2] = 3;
    CharaTex[3] = 4;
    CharaTex[4] = 5;
    CharaTex[5] = 5;
    CharaTex[6] = 5;
    CharaTex[7] = 5;
    CharaTex[8] = 5;

    wait_now_loading_vsync();

    char *chara[5] = {"02c01d.cfg", "02c12a.cfg", "02c08a.cfg", "02c09a.cfg", "02e04a.cfg"};

    CharaDataBuffer.Reset();

    for (int i = 0; i < 4; i++) {
        Chara[i].LoadPackData(read_buffer, chara[i], &CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[i].frame->SetAttr(attr, 1, 4);
        Chara[i].motion_type.state.time = 1.0f;
        Chara[i].motion_type.state.unk_08 = 0.05f;
        Chara[i].motion_type.state.motion_no = 0;
        Chara[i].motion_type.state.playing_no = 0;
    }

    Chara[2].motion_type.state.time = 10.0f;
    Chara[3].motion_type.state.time = 10.0f;
    Chara[0].unk_C98 = (int) &Wind;
    Chara[1].FootSoundEnable(0);

    for (int j = 4; j < 9; j++) {
        Chara[j].LoadPackData(read_buffer, chara[4], &CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[j].frame->SetAttr(attr, 1, 4);
        Chara[j].motion_type.state.unk_08 = 0.05f;
        Chara[j].motion_type.state.motion_no = 0;
        Chara[j].motion_type.state.playing_no = 0;
        Chara[j].SetScale(5.0f, (float) (j - j + 5), 5.0f);
    }

    Chara[4].motion_type.state.time = 1.0f;
    Chara[5].motion_type.state.time = 4.0f;
    Chara[6].motion_type.state.time = 8.0f;
    Chara[7].motion_type.state.time = 12.0f;
    Chara[8].motion_type.state.time = 16.0f;
    OP_CharaFrame = Chara[0].frame;

    wait_now_loading_vsync();

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();
    OP_BuildingMap2.Initialize();

    CFrameAttr map_attr;

    CFrameVu1 *map = LoadMDSFile(GetPackFile(read_buffer, "s1402.mds", 0), &MapDataBuffer, 2, 0, 0);

    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);

    CMapObject *object = OP_GroundMap.SetObject(map, 0, 0);

    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    sceVu0FVECTOR scale;
    sceVu0FVECTOR position;

    scale[0] = 0.0f;
    scale[1] = 0.0f;
    scale[2] = 0.0f;
    position[0] = 0.0f;
    position[1] = 0.015f;
    position[2] = 0.0f;
    SetObjAnime("tenkyu", map, scale, position);

    scale[0] = 0.0f;
    scale[1] = 0.0f;
    scale[2] = 0.0f;
    position[0] = 0.015f;
    position[1] = 0.0f;
    position[2] = 0.0f;
    SetObjAnime("tenkyu2", map, scale, position);

    scale[0] = 0.0f;
    scale[1] = 0.0f;
    scale[2] = 0.0f;
    position[0] = 0.05f;
    position[1] = 0.0f;
    position[2] = 0.0f;
    SetObjAnime("tenkyu3", map, scale, position);

    scale[0] = 0.0f;
    scale[1] = 0.0f;
    scale[2] = 0.0f;
    position[0] = 1.0f;
    position[1] = 0.015f;
    position[2] = 0.0f;
    SetObjAnime("inazuma", map, scale, position);

    map = LoadMDSFile(GetPackFile(read_buffer, "s1401.mds", 0), &MapDataBuffer, 2, 0, 0);
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    wait_now_loading_vsync();

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[4] = {"0201cp.cfg", "0202cp.cfg", "0203cp.cfg", "0204cp.cfg"};

    for (int k = 0; k < 4; k++) {
        Cam[k].LoadPackData(read_buffer, campath[k], &PathDataBuffer, 0);
        Cam[k].motion_type.state.time = 1.0f;
        Cam[k].motion_type.state.unk_08 = 1.0f;
        Cam[k].motion_type.state.motion_no = 0;
        Cam[k].motion_type.state.playing_no = 0;
        Cam[k].motion_type.camera = &MainCamera;
    }

    wait_now_loading_vsync();
    OPAnalyz("sim:rmdat/rmdat1.cfg");
    OPMdsLoad();
}

void DrawProcA() {
    sceVu0FMATRIX flash = {
        {100.0f, 80.0f, 60.0f, 0.0f},
        {90.0f, 90.0f, 50.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f}};
    sceVu0FMATRIX scene_color;
    sceVu0FMATRIX chara_color;

    sceVu0CopyMatrix(scene_color, lightcolor);
    sceVu0CopyMatrix(chara_color, flash);

    static int lightning = 0;
    static int col = 0;

    if (rand() % 127 == 0) {
        col = 254;
        lightning = 4;

        int se = rand() % 6;

        if (se < 6) {
            SndSePlay(se + 67, -1, 0);
        }
    }

    if (CScript.camera_start == 0) {
        if (Cam[SceneNp].motion_type.state.time > 20.0f && !StartLightning) {
            StartLightning = 1;
            col = 254;
            lightning = 4;
            SndSePlay(74, -1, 0);
        }
    }

    for (int i = 0; i < 4; i++) {
        if (lightcolor[i][0] < (float) col) {
            scene_color[i][0] = (float) col;
        }
        if (lightcolor[i][1] < (float) col) {
            scene_color[i][1] = (float) col;
        }
        if (lightcolor[i][2] < (float) col) {
            scene_color[i][2] = (float) col;
        }
        if (flash[i][0] < (float) col) {
            chara_color[i][0] = (float) col;
        }
        if (flash[i][1] < (float) col) {
            chara_color[i][1] = (float) col;
        }
        if (flash[i][2] < (float) col) {
            chara_color[i][2] = (float) col;
        }
        if (col > 2) {
            col -= 2;
        }
    }

    typedef float ap0, ap1, ap2, ap3, ap4, ap5, ap6, ap7, ap8, ap9, ap10, ap11,
        ap12, ap13, ap14, ap15;
    if (CScript.camera_start == 2) {
        Chara[6].SetScale((float) (col - col + 2), 2.0f, 2.0f);
        Chara[8].SetScale(2.0f, 2.0f, 2.0f);
    }

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
            Chara[i].Step();
            Chara[i].ClothStep(0);
            MGSetPLight(light, chara_color);
            Chara[i].Draw();
        }
    }

    MGSetPLight(light, scene_color);
    TexManager.ReloadTexture(Vif1Packet, 10);

    CMapObject *object = OP_GroundMap.GetObject(0);
    sceVu0FVECTOR camera_position;

    MainCamera.GetPos(camera_position);
    object->SetPosition(camera_position);

    if (lightning) {
        object->FrameObjectOnOff("inazuma", 1);
    } else {
        object->FrameObjectOnOff("inazuma", 0);
        OP_AnimeSeq[OP_AnimeSeqRot - 1].unk_40 = (float) (rand() % 10) / 10.0f;
        ObjAnimePlay(&OP_AnimeSeq[OP_AnimeSeqRot - 1]);
    }

    if (lightning > 0) {
        lightning--;
    }

    sceVu0FVECTOR ambient = {90.0f, 90.0f, 90.0f, 128.0f};

    MGSetAmbient(ambient);

    sceGsAlpha alpha = mgAlpha;

    alpha.bits.a = 0;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 1;
    setAlphaFlag(Vif1Packet, &alpha);
    object->Draw();
    MGSetAmbient(ambientlight);
    setAlphaFlag(Vif1Packet, &mgAlpha);
    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_BuildingMap.Draw();
    TexManager.ReloadTexture(GetVif1Packet(), 0);

    sceVu0FVECTOR eye;

    OP_CharaFrame = Cam[SceneNp].frame;
    sceVu0CopyVector(eye, OP_CharaFrame->position);

    CFire.FireStep();
    CFire.FireCreate();

    for (int i = 0; i < OP_FireList; i++) {
        float z = OP_FirePosition[i][2];
        float y = OP_FirePosition[i][1];
        float x = OP_FirePosition[i][0];

        CFire.position[0] = 10.0f * x;
        CFire.position[1] = 10.0f * y;
        CFire.position[2] = 10.0f * z;
        CFire.position[3] = 1.0f;

        float *fire_scale = &OP_FireScale[i];
        CFire.DrawFire(1, 1, &MainCamera, eye, *fire_scale, 15, 15.0f);
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[3] = {1000.0f, 2000.0f, 3000.0f};

    DepthOfField(dof, 3, 32, 0);
}

CFrame *ObjectFrame3;
CProcess CProcess;
CScFader CFade;

CSprite CSprite;
CLogo CLogo;
CCursol CCursol;

static float TitleCameraWork[4];

static void InitProcB() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {"#water_buff#640#224#4", 21, 0},
        {0, 20, 0},
        {0, 0, 0},
        {0, 10, 0},
        {0, 1, 0},
        {0, 2, 0},
        {0, 3, 0},
        {0, 4, 0},
        {0, 8, 0},
        {0, 9, 0},
        {"", 0, 0}};

    textures[4].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "effect.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "d01m01.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "e01a01.img", 0);
    textures[9].name = (char *) GetPackFile(read_buffer, "saget.img", 0);
    textures[10].name = (char *) GetPackFile(read_buffer, "d01etc.img", 0);
    textures[11].name = (char *) GetPackFile(read_buffer, "rm04ex.img", 0);
    textures[12].name = (char *) GetPackFile(read_buffer, "c01w03.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[1] = 2;
    CharaTex[2] = 3;
    CharaTex[3] = 4;
    CharaTex[7] = 8;
    CharaTex[8] = 9;

    char *chara[4] = {"rm05c01d.cfg", "rm04e01a.cfg", "rm05saget.cfg", "d01o03_m.cfg"};

    CharaDataBuffer.Reset();

    for (int i = 0; i < 30; i++) {
        TexAnimeDataMovie[i].Initialize();
    }

    Chara[3].InitializeTexAnime(TexAnimeDataMovie, 30);
    Chara[3].TexAnimeOn(0);
    Chara[0].LoadPackData(read_buffer, "c01d.cfg", &CharaDataBuffer, 0);
    Chara[0].LoadPackData(read_buffer, "rm04c01d.cfg", &CharaDataBuffer, 0);

    for (int j = 0; j < 4; j++) {
        Chara[j].LoadPackData(read_buffer, chara[j], &CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[j].frame->SetAttr(attr, 1, 4);
        Chara[j].motion_type.state.time = 1.0f;
        Chara[j].motion_type.state.unk_08 = 0.05f;
        Chara[j].motion_type.state.motion_no = 0;
        Chara[j].motion_type.state.playing_no = 0;
    }

    Chara[1].motion_type.state.time = 10.0f;
    Chara[2].motion_type.state.time = 30.0f;
    Chara[0].unk_C98 = (int) &Wind;
    Chara[7].LoadPackData(read_buffer, "rm04ex.cfg", &CharaDataBuffer, 0);
    Chara[8].LoadPackData(read_buffer, "c01w03.cfg", &CharaDataBuffer, 0);

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();

    CFrameAttr map_attr;

    CFrameVu1 *map = LoadMDSFile(GetPackFile(read_buffer, "s4201.mds", 0), &MapDataBuffer, 2, 0, 0);

    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);

    CMapObject *object = OP_GroundMap.SetObject(map, 0, 0);

    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s4202.mds", 0), &MapDataBuffer, 2, 0, 0);
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[4] = {"rm03cam.cfg", "rm04cam.cfg", "rm05cam.cfg"};

    for (int k = 0; k < 3; k++) {
        Cam[k].LoadPackData(read_buffer, campath[k], &PathDataBuffer, 0);
        Cam[k].motion_type.state.time = 1.0f;
        Cam[k].motion_type.state.unk_08 = 1.0f;
        Cam[k].motion_type.state.motion_no = 0;
        Cam[k].motion_type.state.playing_no = 0;
        Cam[k].motion_type.camera = &MainCamera;
    }

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OPAnalyz("sim:rmdat/rmdat2.cfg");
    OPMdsLoad();

    sceVu0FVECTOR v0 = {260.0f, 0.0f, -400.0f, 1.0f};
    sceVu0FVECTOR v1 = {380.0f, 0.0f, -400.0f, 1.0f};
    sceVu0FVECTOR v2 = {260.0f, 0.0f, -250.0f, 1.0f};
    sceVu0FVECTOR v3 = {380.0f, 0.0f, -250.0f, 1.0f};

    Water.SetVertex(v0, v1, v2, v3);
    typedef float bp0, bp1, bp2;
    Water.frame.SetPosition(0.0f, -4.0f, 0.0f);
    Water.SetSize(24, 24, &WaterBuffer);
    Water.SetParam(0.1f, 0.015f, 0.0f, 2.0f);
    Water.SetColor(100, 110, 120, 128);
}

void DrawProcB() {
    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_GroundMap.Draw();
    OP_BuildingMap.Draw();

    WaterProcess();

    TexManager.ReloadTexture(Vif1Packet, 23);
    CTexture *texture = TexManager.GetTexture("shadow_buff", -1);

    MGBeginDrawShadow(*(sceGsTex0 *) &texture->tex0);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            Chara[i].ShadowStep();
            Chara[i].DrawShadow();
        }
    }

    MGEndDrawShadow(52);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            sceVu0FMATRIX save_light;
            sceVu0FMATRIX save_lightcolor;

            sceVu0CopyMatrix(save_light, light);
            sceVu0CopyMatrix(save_lightcolor, lightcolor);

            if (i == 0 && CScript.camera_start == 6) {
                AtraLight();
            }

            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
            Chara[i].TextureAnime(CharaTex[i]);
            Chara[i].Step();
            Chara[i].ClothStep(0);
            Chara[i].Draw();

            sceVu0CopyMatrix(light, save_light);
            sceVu0CopyMatrix(lightcolor, save_lightcolor);
            MGSetPLight(light, lightcolor);
        }
    }

    TexManager.ReloadTexture(GetVif1Packet(), 0);

    if (CScript.camera_start == 4) {
        sceVu0FVECTOR position;

        sceVu0CopyVector(position, Chara[0].frame->position);
        CRunFx.Lighting(1);

        int frame = (int) Chara[0].motion_type.state.time;

        if ((frame >= 73 && frame < 74) || (frame >= 83 && frame < 84)) {
            CRunFx.Set(position);
        }

        CRunFx.Step();
        CRunFx.Draw();
    }

    sceVu0FVECTOR eye;

    OP_CharaFrame = Cam[SceneNp].frame;
    sceVu0CopyVector(eye, OP_CharaFrame->position);

    CFire.FireStep();
    CFire.FireCreate();

    for (int i = 0; i < OP_FireList; i++) {
        float z = OP_FirePosition[i][2] / 10.0f;
        float y = OP_FirePosition[i][1] / 10.0f;
        float x = OP_FirePosition[i][0] / 10.0f;

        CFire.SetPosition(x, y, z);

        CFire.DrawFire(1, 1, &MainCamera, eye, OP_FireScale[i], 3, 15.0f);
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[2] = {400.0f, 1000.0f};

    DepthOfField(dof, 2, 32, 0);
}

static void AtraLight() {
    if (Chara[2].motion_type.state.time >= 40.0f) {
        CFrame *frame = Chara[2].frame->SearchFrame("light01");

        if (frame) {
            sceVu0FVECTOR position;
            sceVu0FVECTOR eye;
            sceVu0FVECTOR dir;
            sceVu0FVECTOR world;
            sceVu0FMATRIX matrix;

            sceVu0CopyMatrix(matrix, frame->local);
            position[0] = matrix[3][0];
            position[1] = matrix[3][1];
            position[2] = matrix[3][2];
            frame->GetWorldPosition(world, position);

            OP_CharaFrame = Chara[0].frame;
            sceVu0CopyVector(eye, OP_CharaFrame->position);

            dir[0] = world[0] - eye[0];
            dir[1] = world[1] - eye[1] - 12.0f;
            dir[2] = world[2] - eye[2];

            float len = sqrt(dir[0] * dir[0] + dir[1] * dir[1] + dir[2] * dir[2]);

            if (len <= 10.0f) {
                len = 10.0f;
            }

            float power = 5.0f * (100.0f / (len * len));

            sceVu0Normalize(dir, dir);
            dir[0] *= power;
            dir[1] *= power;
            dir[2] *= power;
            dir[3] = 0.0f;

            light[0][3] = dir[0];
            light[1][3] = dir[1];
            light[2][3] = dir[2];
            light[3][3] = 0.0f;

            lightcolor[3][0] = 0.8359375f * atraGetStatusRate;
            lightcolor[3][1] = 0.9765625f * atraGetStatusRate;
            lightcolor[3][2] = 0.66015625f * atraGetStatusRate;
            lightcolor[3][3] = 0.5f * atraGetStatusRate;
            atraGetStatusRate += 2.0f;

            MGSetPLight(light, lightcolor);
        }
    }
}

static void InitProcC() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {"#water_buff#640#224#4", 21, 0},
        {0, 20, 0},
        {0, 0, 0},
        {0, 10, 0},
        {0, 10, 0},
        {0, 10, 0},
        {0, 1, 0},
        {0, 9, 0},
        {"", 0, 0}};

    textures[4].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "effect.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "s04b01.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "s04b02.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "s04w01.img", 0);
    textures[9].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[10].name = (char *) GetPackFile(read_buffer, "pat.img", 0);
    TexManager.DeleteTextureBlock(0);
    TexManager.CleanUpBuffer();
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[8] = 9;

    CharaDataBuffer.Reset();
    Chara[0].LoadPackData(read_buffer, "c01d.cfg", &CharaDataBuffer, 0);

    CFrameAttr attr;

    attr.unk_08 = 0;
    Chara[0].frame->SetAttr(attr, 1, 4);
    Chara[0].motion_type.state.time = 10.0f;
    Chara[0].motion_type.state.unk_08 = 0.05f;
    Chara[0].motion_type.state.motion_no = 0;
    Chara[0].motion_type.state.playing_no = 0;
    Chara[0].FootSoundEnable(0);
    Chara[0].unk_C98 = (int) &Wind;

    Chara[8].LoadPackData(read_buffer, "pat.cfg", &CharaDataBuffer, 0);
    attr.unk_08 = 0;
    Chara[8].frame->SetAttr(attr, 1, 4);
    Chara[8].motion_type.state.time = 1.0f;
    Chara[8].motion_type.state.unk_08 = 0.05f;
    Chara[8].motion_type.state.motion_no = 0;
    Chara[8].motion_type.state.playing_no = 0;

    MAP_INFO norn[] = {
        {"s04g01_0.mds", 0.0f, 0.0f, 0.0f, 0.0f},
        {"s04g02_0.mds", 0.0f, 0.0f, 0.0f, 0.0f},
        {"s04g04_0.mds", 0.0f, 0.0f, 0.0f, 0.0f},
        {"s04g06_0.mds", 0.0f, 0.0f, 0.0f, 0.0f},
        {"s04g03_0.mds", 0.0f, 0.0f, 0.0f, 0.0f},
        {"s04g05_0.mds", 0.0f, 0.0f, 0.0f, 0.0f},
        {"s04r01_0.mds", 0.0f, 0.0f, 74.0f, 0.0f},
        {"s04r02_0.mds", -56.68f, 0.0f, 47.566f, -50.0f},
        {"s04r03_0.mds", 32.439f, 0.0f, -66.51f, 154.0f},
        {"s04r05_0.mds", 82.0f, -10.0f, 109.0f, -90.0f},
        {"s04r06_0.mds", 61.832f, 10.0f, -127.0f, -28.0f},
        {"s04r07_0.mds", -54.64f, 10.0f, -115.6f, 25.0f},
        {"s04r08_0.mds", -90.85f, 10.0f, 75.585f, 125.0f},
        {"s04w01_0.mds", 0.0f, 0.0f, 0.0f, 0.0f},
        {"s04w02_0.mds", 0.0f, 0.0f, 0.0f, 0.0f},
        {"s04h01_0.mds", 0.0f, -10.0f, 0.0f, 0.0f},
        {"s04h02_0.mds", 127.0f, -10.0f, 109.0f, 0.0f},
        {"s04h03_0.mds", -140.0f, -10.0f, 110.0f, 125.0f},
        {"s04h03_0.mds", 90.0f, -10.0f, -180.0f, -28.0f},
        {"s04h03_0.mds", -80.0f, -10.0f, -170.0f, 25.0f},
        {"s04a01_0.mds", -63.15f, -15.0f, 128.0f, 50.0f},
        {"s04a01_0.mds", -126.0f, -15.0f, -110.0f, -20.0f},
        {"s04a01_0.mds", -178.0f, -15.0f, 46.0f, 10.0f},
        {"s04a01_0.mds", 12.0f, -15.0f, -218.0f, -70.0f},
        {"s04a01_0.mds", 204.0f, -15.0f, -152.0f, -140.0f},
        {"s04a01_0.mds", 244.0f, -15.0f, 14.0f, 190.0f}};

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();

    CFrameAttr map_attr;
    CFrameVu1 *map;

    for (int i = 0; i < 26; i++) {
        map = LoadMDSFile(GetPackFile(read_buffer, norn[i].name, 0), &MapDataBuffer, 2, 0, 0);

        map_attr.fog_enable = 1;
        map->SetAttr(map_attr, 1, 64);
        SetFrameAttr(map, 1);

        CMapObject &object = OP_NornMapObj[i];

        object.Initialize();
        object.SetFrame(map, 0);
        OP_NornMapObj[i].unk_44 = 0;
        OP_NornMapObj[i].unk_40 = 0;
        object.SetPosition(CVector3_f_(norn[i].position[0], norn[i].position[1],
                                       norn[i].position[2]));
        object.SetRotation(CVector3_f_(0.0f, (float) (PI * norn[i].rotation / 180), 0.0f));
    }

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[4] = {"rm06cam.cfg"};

    for (int j = 0; j < 1; j++) {
        Cam[j].LoadPackData(read_buffer, campath[j], &PathDataBuffer, 0);
        Cam[j].motion_type.state.time = 1.0f;
        Cam[j].motion_type.state.unk_08 = 1.0f;
        Cam[j].motion_type.state.motion_no = 0;
        Cam[j].motion_type.state.playing_no = 0;
        Cam[j].motion_type.camera = &MainCamera;
    }

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OPAnalyz("sim:rmdat/rmdat3.cfg");
    OPMdsLoad();

    sceVu0FVECTOR v0 = {-120.0f, 0.0f, -120.0f, 1.0f};
    sceVu0FVECTOR v1 = {120.0f, 0.0f, -120.0f, 1.0f};
    sceVu0FVECTOR v2 = {-120.0f, 0.0f, 120.0f, 1.0f};
    sceVu0FVECTOR v3 = {-120.0f, 0.0f, 120.0f, 1.0f};

    Water.SetVertex(v0, v1, v2, v3);
    Water.frame.SetPosition((float) (OP_FireList & 0), 0.0f, 0.0f);
    Water.SetSize(32, 32, &WaterBuffer);
    Water.SetParam(0.1f, 0.015f, 0.0f, 2.0f);
    Water.SetColor(128, 128, 128, 128);
}

void DrawProcC() {
    TexManager.ReloadTexture(Vif1Packet, 10);

    for (int i = 0; i < 26; i++) {
        CMapObject *object = &OP_NornMapObj[i];

        object->Draw();
    }

    WaterProcess();

    TexManager.ReloadTexture(Vif1Packet, 23);
    CTexture *texture = TexManager.GetTexture("shadow_buff", -1);

    MGBeginDrawShadow(*(sceGsTex0 *) &texture->tex0);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            Chara[i].ShadowStep();
            Chara[i].DrawShadow();
        }
    }

    MGEndDrawShadow(52);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
            Chara[i].Step();
            Chara[i].ClothStep(0);
            Chara[i].Draw();
        }
    }

    sceVu0FVECTOR eye;

    TexManager.ReloadTexture(GetVif1Packet(), 0);
    OP_CharaFrame = Cam[SceneNp].frame;
    sceVu0CopyVector(eye, OP_CharaFrame->position);

    CFire.FireStep();
    CFire.FireCreate();

    for (int i = 0; i < OP_FireList; i++) {
        float z = OP_FirePosition[i][2] / 10.0f;
        float y = OP_FirePosition[i][1] / 10.0f;
        float x = OP_FirePosition[i][0] / 10.0f;

        CFire.position[0] = 10.0f * x;
        CFire.position[1] = 10.0f * y;
        CFire.position[2] = 10.0f * z;
        CFire.position[3] = 1.0f;

        CFire.DrawFire(1, 1, &MainCamera, eye, OP_FireScale[i], 2, 15.0f);
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[2] = {400.0f, 1000.0f};

    DepthOfField(dof, 2, 32, 0);
}

static void InitProcD() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {0, 20, 0},
        {0, 10, 0},
        {0, 1, 0},
        {0, 1, 0},
        {0, 2, 0},
        {0, 9, 0},
        {"", 0, 0}};

    textures[3].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[4].name = (char *) GetPackFile(read_buffer, "d02i01.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "c01d01an.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "e54a01.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "c01w11.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[1] = 2;
    CharaTex[2] = 2;
    CharaTex[8] = 9;

    char *chara[3] = {"rm07c01d.cfg", "rm07e54b.cfg", "rm07e54a.cfg"};

    CharaDataBuffer.Reset();

    for (int i = 0; i < 30; i++) {
        TexAnimeDataMovie[i].Initialize();
    }

    Chara[0].InitializeTexAnime(TexAnimeDataMovie, 30);
    Chara[0].LoadPackData(read_buffer, "c01d.cfg", &CharaDataBuffer, 0);

    for (int j = 0; j < 3; j++) {
        Chara[j].LoadPackData(read_buffer, chara[j], &CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[j].frame->SetAttr(attr, 1, 4);
        Chara[j].motion_type.state.time = 1.0f;
        Chara[j].motion_type.state.unk_08 = 0.05f;
        Chara[j].motion_type.state.motion_no = 0;
        Chara[j].motion_type.state.playing_no = 0;
    }

    Chara[0].motion_type.state.time = 10.0f;
    Chara[1].motion_type.state.time = 10.0f;
    Chara[2].motion_type.state.time = 10.0f;
    Chara[8].LoadPackData(read_buffer, "c01w11.cfg", &CharaDataBuffer, 0);
    Chara[0].TexAnimeOn(2);
    Chara[0].unk_C98 = (int) &Wind;

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();
    OP_BuildingMap2.Initialize();

    CFrameAttr map_attr;

    CFrameVu1 *map = LoadMDSFile(GetPackFile(read_buffer, "s44g01_0.mds", 0), &MapDataBuffer, 2, 0,
                                 0);

    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);

    CMapObject *object = OP_GroundMap.SetObject(map, 0, 0);

    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s44g02_0.mds", 0), &MapDataBuffer, 2, 0, 0);
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[1] = {"rm07cam.cfg"};

    for (int k = 0; k < 1; k++) {
        Cam[k].LoadPackData(read_buffer, campath[k], &PathDataBuffer, 0);
        Cam[k].motion_type.state.time = 10.0f;
        Cam[k].motion_type.state.unk_08 = 1.0f;
        Cam[k].motion_type.state.motion_no = 0;
        Cam[k].motion_type.state.playing_no = 0;
        Cam[k].motion_type.camera = &MainCamera;
    }

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OPAnalyz("sim:rmdat/rmdat4.cfg");
    OPMdsLoad();
}

void DrawProcD() {
    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_GroundMap.Draw();
    OP_BuildingMap.Draw();

    TexManager.ReloadTexture(Vif1Packet, 23);
    CTexture *texture = TexManager.GetTexture("shadow_buff", -1);

    MGBeginDrawShadow(*(sceGsTex0 *) &texture->tex0);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            Chara[i].ShadowStep();
            Chara[i].DrawShadow();
        }
    }

    MGEndDrawShadow(52);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
            Chara[i].TextureAnime(CharaTex[i]);
            Chara[i].Step();
            Chara[i].ClothStep(0);
            Chara[i].Draw();
        }
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[2] = {400.0f, 1000.0f};

    DepthOfField(dof, 2, 32, 0);
}

static void InitProcE() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {0, 20, 0},
        {0, 10, 0},
        {0, 1, 0},
        {0, 1, 0},
        {0, 2, 0},
        {0, 2, 0},
        {"", 0, 0}};

    textures[3].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[4].name = (char *) GetPackFile(read_buffer, "s4501.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "c01d01an.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "c04b01.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "c04b01an.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[1] = 2;

    char *chara[2] = {"rm09c01d.cfg", "rm09c04b.cfg"};

    CharaDataBuffer.Reset();

    for (int i = 0; i < 30; i++) {
        TexAnimeDataMovie[i].Initialize();
    }

    Chara[0].InitializeTexAnime(TexAnimeDataMovie, 30);
    Chara[1].InitializeTexAnime(TexAnimeDataMovie, 30);
    Chara[0].LoadPackData(read_buffer, "c01d.cfg", &CharaDataBuffer, 0);

    for (int j = 0; j < 2; j++) {
        Chara[j].LoadPackData(read_buffer, chara[j], &CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[j].frame->SetAttr(attr, 1, 4);
        Chara[j].motion_type.state.time = 1.0f;
        Chara[j].motion_type.state.unk_08 = 0.05f;
        Chara[j].motion_type.state.motion_no = 0;
        Chara[j].motion_type.state.playing_no = 0;
    }

    Chara[0].TexAnimeOn(2);
    Chara[1].TexAnimeOn(1);
    Chara[0].unk_C98 = (int) &Wind;

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();
    OP_BuildingMap2.Initialize();

    CFrameAttr map_attr;

    CFrameVu1 *map = LoadMDSFile(GetPackFile(read_buffer, "s4501.mds", 0), &MapDataBuffer, 2, 0, 0);

    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);

    CMapObject *object = OP_GroundMap.SetObject(map, 0, 0);

    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->FrameObjectOnOff("door2", 0);

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[4] = {"rm08cam.cfg", "rm09cam.cfg"};

    for (int k = 0; k < 2; k++) {
        Cam[k].LoadPackData(read_buffer, campath[k], &PathDataBuffer, 0);
        Cam[k].motion_type.state.time = 1.0f;
        Cam[k].motion_type.state.unk_08 = 1.0f;
        Cam[k].motion_type.state.motion_no = 0;
        Cam[k].motion_type.state.playing_no = 0;
        Cam[k].motion_type.camera = &MainCamera;
    }

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OPAnalyz("sim:rmdat/rmdat5.cfg");
    OPMdsLoad();
}

void DrawProcE() {
    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_GroundMap.Draw();

    if (CScript.camera_start == 10 &&
        Cam[SceneNp].motion_type.state.time >= 70.0f) {
        Chara[0].TexAnimeOn(3);
    }

    TexManager.ReloadTexture(Vif1Packet, 23);
    CTexture *texture = TexManager.GetTexture("shadow_buff", -1);

    MGBeginDrawShadow(*(sceGsTex0 *) &texture->tex0);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            Chara[i].ShadowStep();
            Chara[i].DrawShadow();
        }
    }

    MGEndDrawShadow(52);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
            Chara[i].TextureAnime(CharaTex[i]);
            Chara[i].Step();
            Chara[i].ClothStep(0);
            Chara[i].Draw();
        }
    }
}

static void InitProcF() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {0, 20, 0},
        {0, 10, 0},
        {0, 1, 0},
        {0, 1, 0},
        {0, 2, 0},
        {0, 3, 0},
        {0, 9, 0},
        {"", 0, 0}};

    textures[3].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[4].name = (char *) GetPackFile(read_buffer, "d02b01.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "c01d01an.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "c14a01.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "rm11rock.img", 0);
    textures[9].name = (char *) GetPackFile(read_buffer, "c01w01.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[1] = 2;
    CharaTex[2] = 2;
    CharaTex[3] = 2;
    CharaTex[4] = 2;
    CharaTex[5] = 3;
    CharaTex[8] = 9;

    char *chara[6] = {
        "rm10c01d.cfg", "rm10c14a.cfg", "rm10c14b.cfg",
        "rm10c14c.cfg", "rm10c14d.cfg", "rm11rock.cfg"};

    CharaDataBuffer.Reset();

    for (int i = 0; i < 30; i++) {
        TexAnimeDataMovie[i].Initialize();
    }

    Chara[0].InitializeTexAnime(TexAnimeDataMovie, 30);
    Chara[0].LoadPackData(read_buffer, "c01d.cfg", &CharaDataBuffer, 0);

    for (int j = 0; j < 6; j++) {
        Chara[j].LoadPackData(read_buffer, chara[j], &CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[j].frame->SetAttr(attr, 1, 4);
        Chara[j].motion_type.state.time = 1.0f;
        Chara[j].motion_type.state.unk_08 = 0.05f;
        Chara[j].motion_type.state.motion_no = 0;
        Chara[j].motion_type.state.playing_no = 0;
    }

    Chara[0].TexAnimeOn(4);
    Chara[0].unk_C98 = (int) &Wind;
    Chara[8].LoadPackData(read_buffer, "c01w01.cfg", &CharaDataBuffer, 0);
    Chara[0].motion_type.state.time = 150.0f;
    Chara[1].motion_type.state.time = 135.0f;
    Chara[2].motion_type.state.time = 135.0f;
    Chara[3].motion_type.state.time = 135.0f;
    Chara[4].motion_type.state.time = 135.0f;

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();
    OP_BuildingMap2.Initialize();

    CFrameAttr map_attr;

    CFrameVu1 *map = LoadMDSFile(GetPackFile(read_buffer, "s4601.mds", 0), &MapDataBuffer, 2, 0, 0);

    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);

    CMapObject *object = OP_GroundMap.SetObject(map, 0, 0);

    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s4602.mds", 0), &MapDataBuffer, 2, 0, 0);
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->FrameObjectOnOff("rock1", 0);

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[4] = {"rm10cam.cfg", "rm11cam.cfg"};

    for (int k = 0; k < 2; k++) {
        Cam[k].LoadPackData(read_buffer, campath[k], &PathDataBuffer, 0);
        Cam[k].motion_type.state.time = 1.0f;
        Cam[k].motion_type.state.unk_08 = 1.0f;
        Cam[k].motion_type.state.motion_no = 0;
        Cam[k].motion_type.state.playing_no = 0;
        Cam[k].motion_type.camera = &MainCamera;
    }

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OPAnalyz("sim:rmdat/rmdat6.cfg");
    OPMdsLoad();
}

void DrawProcF() {
    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_GroundMap.Draw();
    OP_BuildingMap.Draw();

    if (CScript.obj[5].disp) {
        TexManager.ReloadTexture(Vif1Packet, CharaTex[5]);
        Chara[5].Step();
        Chara[5].Draw();
    }

    TexManager.ReloadTexture(Vif1Packet, 23);
    CTexture *texture = TexManager.GetTexture("shadow_buff", -1);

    MGBeginDrawShadow(*(sceGsTex0 *) &texture->tex0);

    for (int i = 0; i < 9; i++) {
        if (i != 5) {
            if (CScript.obj[i].disp) {
                Chara[i].ShadowStep();
                Chara[i].DrawShadow();
            }
        }
    }

    MGEndDrawShadow(52);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            if (i != 5) {
                TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
                Chara[i].TextureAnime(CharaTex[i]);
                Chara[i].Step();
                Chara[i].ClothStep(0);
                Chara[i].Draw();
            }
        }
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[2] = {400.0f, 1000.0f};

    DepthOfField(dof, 2, 32, 0);
}

static void InitProcG() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {0, 20, 0},
        {0, 10, 0},
        {0, 10, 0},
        {0, 10, 0},
        {0, 1, 0},
        {0, 2, 0},
        {0, 2, 0},
        {0, 2, 0},
        {"", 0, 0}};

    textures[3].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[4].name = (char *) GetPackFile(read_buffer, "s4701.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "e02s01.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "e02s06.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "c06a01.img", 0);
    textures[9].name = (char *) GetPackFile(read_buffer, "c06a01an.img", 0);
    textures[10].name = (char *) GetPackFile(read_buffer, "c06w01.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[1] = 2;
    CharaTex[2] = 2;

    char *chara[3] = {"rm14ebc01d.cfg", "rm14ebc06a.cfg", "rm13c06a.cfg"};

    CharaDataBuffer.Reset();
    Chara[0].LoadPackData(read_buffer, "c01d.cfg", &CharaDataBuffer, 0);

    for (int i = 0; i < 3; i++) {
        Chara[i].LoadPackData(read_buffer, chara[i], &CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[i].frame->SetAttr(attr, 1, 4);
        Chara[i].motion_type.state.time = 1.0f;
        Chara[i].motion_type.state.unk_08 = 0.05f;
        Chara[i].motion_type.state.motion_no = 0;
        Chara[i].motion_type.state.playing_no = 0;
    }

    Chara[0].motion_type.state.time = 10.0f;
    Chara[1].motion_type.state.time = 10.0f;
    Chara[2].motion_type.state.time = 82.0f;
    Chara[0].unk_C98 = (int) &Wind;
    Chara[1].unk_C98 = (int) &Wind;
    Chara[2].unk_C98 = (int) &Wind;

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();
    OP_BuildingMap2.Initialize();

    CFrameAttr map_attr;

    CFrameVu1 *map = LoadMDSFile(GetPackFile(read_buffer, "s4701.mds", 0), &MapDataBuffer, 2, 0, 0);

    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);

    CMapObject *object = OP_GroundMap.SetObject(map, 0, 0);

    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "e02s01_0.mds", 0), &MapDataBuffer, 2, 0, 0);
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[3] = {"rm12cam.cfg", "rm13cam.cfg", "rm14cam.cfg"};

    for (int j = 0; j < 3; j++) {
        Cam[j].LoadPackData(read_buffer, campath[j], &PathDataBuffer, 0);
        Cam[j].motion_type.state.time = 1.0f;
        Cam[j].motion_type.state.unk_08 = 1.0f;
        Cam[j].motion_type.state.motion_no = 0;
        Cam[j].motion_type.state.playing_no = 0;
        Cam[j].motion_type.camera = &MainCamera;
    }

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OPAnalyz("sim:rmdat/rmdat7.cfg");
    OPMdsLoad();
}

void DrawProcG() {
    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_GroundMap.Draw();
    OP_BuildingMap.Draw();

    TexManager.ReloadTexture(Vif1Packet, 23);
    CTexture *texture = TexManager.GetTexture("shadow_buff", -1);

    MGBeginDrawShadow(*(sceGsTex0 *) &texture->tex0);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            Chara[i].ShadowStep();
            Chara[i].DrawShadow();
        }
    }

    MGEndDrawShadow(52);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
            Chara[i].Step();
            Chara[i].ClothStep(0);
            Chara[i].Draw();
        }
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[2] = {400.0f, 1000.0f};

    DepthOfField(dof, 2, 32, 0);
}

static void InitProcH() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {0, 20, 0},
        {0, 0, 0},
        {0, 10, 0},
        {0, 1, 0},
        {0, 2, 0},
        {0, 3, 0},
        {0, 4, 0},
        {0, 9, 0},
        {"", 0, 0}};

    textures[3].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[4].name = (char *) GetPackFile(read_buffer, "fire.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "d01b01.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "c12a01.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "f_boll_2.img", 0);
    textures[9].name = (char *) GetPackFile(read_buffer, "rm16yuka.img", 0);
    textures[10].name = (char *) GetPackFile(read_buffer, "c01w01.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[1] = 2;
    CharaTex[2] = 3;
    CharaTex[3] = 4;
    CharaTex[8] = 9;

    Chara[0].LoadPackData(read_buffer, "rm15c12a.cfg", &CharaDataBuffer, 0);

    CFrameAttr attr;

    attr.unk_08 = 0;
    Chara[0].frame->SetAttr(attr, 1, 4);
    Chara[0].motion_type.state.time = 10.0f;
    Chara[0].motion_type.state.unk_08 = 0.05f;
    Chara[0].motion_type.state.motion_no = 0;
    Chara[0].motion_type.state.playing_no = 0;
    Chara[0].FootSoundEnable(0);

    Chara[1].LoadPackData(read_buffer, "c01d.cfg", &CharaDataBuffer, 0);
    attr.unk_08 = 0;
    Chara[1].frame->SetAttr(attr, 1, 4);
    Chara[1].motion_type.state.time = 70.0f;
    Chara[1].motion_type.state.unk_08 = 0.05f;
    Chara[1].motion_type.state.motion_no = 0;
    Chara[1].motion_type.state.playing_no = 0;

    Chara[2].LoadPackData(read_buffer, "f_boll_2.cfg", &CharaDataBuffer, 0);
    attr.unk_08 = 0;
    Chara[2].frame->SetAttr(attr, 1, 4);
    Chara[2].motion_type.state.time = 20.0f;
    Chara[2].motion_type.state.unk_08 = 0.05f;
    Chara[2].motion_type.state.motion_no = 0;
    Chara[2].motion_type.state.playing_no = 0;

    Chara[3].LoadPackData(read_buffer, "rm16yuka.cfg", &CharaDataBuffer, 0);
    attr.unk_08 = 0;
    Chara[3].frame->SetAttr(attr, 1, 4);
    Chara[3].motion_type.state.time = 2.0f;
    Chara[3].motion_type.state.unk_08 = 0.05f;
    Chara[3].motion_type.state.motion_no = 0;
    Chara[3].motion_type.state.playing_no = 0;

    Chara[8].LoadPackData(read_buffer, "c01w01.cfg", &CharaDataBuffer, 0);
    Chara[1].unk_C98 = (int) &Wind;

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();
    OP_BuildingMap2.Initialize();

    CFrameAttr map_attr;

    CFrameVu1 *map = LoadMDSFile(GetPackFile(read_buffer, "s4801.mds", 0), &MapDataBuffer, 2, 0, 0);

    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);

    CMapObject *object = OP_GroundMap.SetObject(map, 0, 0);

    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s4802.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(0, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s4803.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(1, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s4804.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(2, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s4805.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(3, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s4806.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(4, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[2] = {"rm15cam.cfg", "rm16cam.cfg"};

    for (int i = 0; i < 2; i++) {
        Cam[i].LoadPackData(read_buffer, campath[i], &PathDataBuffer, 0);
        Cam[i].motion_type.state.time = 1.0f;
        Cam[i].motion_type.state.unk_08 = 1.0f;
        Cam[i].motion_type.state.motion_no = 0;
        Cam[i].motion_type.state.playing_no = 0;
        Cam[i].motion_type.camera = &MainCamera;
    }

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OPAnalyz("sim:rmdat/rmdat8.cfg");
    OPMdsLoad();
}

void DrawProcH() {
    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_GroundMap.Draw();
    OP_BuildingMap.Draw();

    if (CScript.obj[3].disp) {
        TexManager.ReloadTexture(Vif1Packet, CharaTex[3]);
        Chara[3].Step();
        Chara[3].ClothStep(0);
        Chara[3].Draw();
    }

    TexManager.ReloadTexture(Vif1Packet, 23);
    CTexture *texture = TexManager.GetTexture("shadow_buff", -1);

    MGBeginDrawShadow(*(sceGsTex0 *) &texture->tex0);

    for (int i = 0; i < 9; i++) {
        if (CScript.obj[i].disp) {
            Chara[i].ShadowStep();
            Chara[i].DrawShadow();
        }
    }

    MGEndDrawShadow(52);

    for (int i = 0; i < 9; i++) {
        if (i != 3 && CScript.obj[i].disp) {
            TexManager.ReloadTexture(Vif1Packet, CharaTex[i]);
            Chara[i].Step();
            Chara[i].ClothStep(0);
            Chara[i].Draw();
        }
    }

    sceVu0FVECTOR eye;

    TexManager.ReloadTexture(GetVif1Packet(), 0);
    OP_CharaFrame = Cam[SceneNp].frame;
    sceVu0CopyVector(eye, OP_CharaFrame->position);

    CFire.FireStep();
    CFire.FireCreate();

    for (int i = 0; i < OP_FireList; i++) {
        float z = OP_FirePosition[i][2] / 10.0f;
        float y = OP_FirePosition[i][1] / 10.0f;
        float x = OP_FirePosition[i][0] / 10.0f;

        CFire.position[0] = 10.0f * x;
        CFire.position[1] = 10.0f * y;
        CFire.position[2] = 10.0f * z;
        CFire.position[3] = 1.0f;

        CFire.DrawFire(1, 1, &MainCamera, eye, OP_FireScale[i], 3, 15.0f);
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[2] = {400.0f, 1000.0f};

    DepthOfField(dof, 2, 32, 0);
}

static void InitProcI() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {0, 20, 0},
        {0, 3, 0},
        {0, 10, 0},
        {0, 10, 0},
        {0, 1, 0},
        {0, 2, 0},
        {"", 0, 0}};

    textures[3].name = (char *) GetPackFile(read_buffer, "start.img", 0);
    textures[4].name = (char *) GetPackFile(read_buffer, "e305ex2.img", 0);
    textures[5].name = (char *) GetPackFile(read_buffer, "s1202.img", 0);
    textures[6].name = (char *) GetPackFile(read_buffer, "s2401.img", 0);
    textures[7].name = (char *) GetPackFile(read_buffer, "c01d01.img", 0);
    textures[8].name = (char *) GetPackFile(read_buffer, "m18ashiba.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);

    CharaTex[0] = 1;
    CharaTex[1] = 2;
    CharaTex[2] = 3;

    char *chara[3] = {"rm18c01d.cfg", "rm18ashiba.cfg", "info2.cfg"};

    CharaDataBuffer.Reset();
    Chara[0].LoadPackData(read_buffer, "c01d.cfg", &CharaDataBuffer, 0);

    for (int i = 0; i < 3; i++) {
        Chara[i].LoadPackData(read_buffer, chara[i], &CharaDataBuffer, 0);

        CFrameAttr attr;

        attr.unk_08 = 0;
        Chara[i].frame->SetAttr(attr, 1, 4);
        Chara[i].motion_type.state.time = 1.0f;
        Chara[i].motion_type.state.unk_08 = 0.05f;
        Chara[i].motion_type.state.motion_no = 0;
        Chara[i].motion_type.state.playing_no = 0;
    }

    Chara[1].motion_type.state.time = 23.0f;
    Chara[0].unk_C98 = (int) &Wind;
    Chara[2].SetScale(20.0f, 20.0f, 20.0f);

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    MapDataBuffer.Reset();
    OP_GroundMap.Initialize();
    OP_BuildingMap.Initialize();
    OP_BuildingMap2.Initialize();

    CFrameAttr map_attr;

    CFrameVu1 *map = LoadMDSFile(GetPackFile(read_buffer, "s24g01_0.mds", 0), &MapDataBuffer, 2, 0,
                                 0);

    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);

    CMapObject *object = OP_GroundMap.SetObject(map, 0, 0);

    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s24g02_0.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(0, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s24g03_0.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(1, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "ship.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap.SetObject(2, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    map = LoadMDSFile(GetPackFile(read_buffer, "s24g04_0.mds", 0), &MapDataBuffer, 2, 0, 0);
    map_attr.fog_enable = 1;
    map->SetAttr(map_attr, 1, 64);
    SetFrameAttr(map, 1);
    object = OP_BuildingMap2.SetObject(0, map, 0, 0);
    object->SetPosition(CVector3_f_(0.0f, 0.0f, 0.0f));
    object->SetRotation(CVector3_f_(0.0f, 0.0f, 0.0f));

    PathDataBuffer.Reset();
    SceneNp = -1;

    char *campath[4] = {"rm17cam.cfg", "rm18cam.cfg"};

    for (int j = 0; j < 2; j++) {
        Cam[j].LoadPackData(read_buffer, campath[j], &PathDataBuffer, 0);
        Cam[j].motion_type.state.time = 1.0f;
        Cam[j].motion_type.state.unk_08 = 1.0f;
        Cam[j].motion_type.state.motion_no = 0;
        Cam[j].motion_type.state.playing_no = 0;
        Cam[j].motion_type.camera = &MainCamera;
    }

    OP_FireList = 0;
    OP_AnimeSeqRot = 0;
    OPAnalyz("sim:rmdat/rmdat9.cfg");
    OPMdsLoad();
}

void DrawProcI() {
    TexManager.ReloadTexture(Vif1Packet, 10);
    OP_GroundMap.Draw();
    OP_BuildingMap.Draw();

    if (CScript.camera_start == 18) {
        OP_BuildingMap2.Draw();
    }

    if (CScript.obj[1].disp) {
        TexManager.ReloadTexture(Vif1Packet, CharaTex[1]);
        Chara[1].Step();
        Chara[1].Draw();
    }

    if (CScript.obj[2].disp) {
        TexManager.ReloadTexture(Vif1Packet, CharaTex[2]);
        Chara[2].Step();
        Chara[2].Draw();
    }

    if (CScript.obj[0].disp) {
        sceVu0FMATRIX save_light;
        sceVu0FMATRIX save_lightcolor;

        sceVu0CopyMatrix(save_light, light);
        sceVu0CopyMatrix(save_lightcolor, lightcolor);
        light[1][0] = 1.3f;
        MGSetPLight(light, lightcolor);

        TexManager.ReloadTexture(Vif1Packet, 23);
        CTexture *texture = TexManager.GetTexture("shadow_buff", -1);

        MGBeginDrawShadow(*(sceGsTex0 *) &texture->tex0);
        Chara[0].ShadowStep();
        Chara[0].DrawShadow();
        MGEndDrawShadow(52);

        sceVu0CopyMatrix(light, save_light);
        sceVu0CopyMatrix(lightcolor, save_lightcolor);
        MGSetPLight(light, lightcolor);

        TexManager.ReloadTexture(Vif1Packet, CharaTex[0]);
        Chara[0].Step();
        Chara[0].ClothStep(0);
        Chara[0].Draw();
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[2] = {400.0f, 1000.0f};

    DepthOfField(dof, 2, 32, 0);
}

static void InitProcTitle() {
    LOADTEXTURE_INFO2 textures[] = {
        {"#blender#640#224#4", 0, 0},
        {"#frame_image#640#224#4", 22, 0},
        {"#shadow_buff#640#224#4", 23, 0},
        {0, 1, 0},
        {"", 0, 0}};

    textures[3].name = (char *) GetPackFile(read_buffer, "title.img", 0);
    TexManager.Initialize(16352);
    TexManager.LoadTextureBlock(-1, textures);
}

void DrawProcTitle() {
    TexManager.ReloadTexture(Vif1Packet, 1);

    set2DSprite(GetVif1Packet(), TexManager.GetTexture("bg01", -1),
                CRect<int>(320, 224, 768, 768), CRect<int>(0, 0, 768, 768),
                384, 384, TitleAngle);
    TitleAngle -= 0.0005f;

    set2DSprite(GetVif1Packet(), TexManager.GetTexture("dc01", -1),
                CRect<int>(0, 80, 288, 160), CRect<int>(0, 0, 288, 160),
                128);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("dc01", -1),
                CRect<int>(288, 129, 352, 160), CRect<int>(288, 49, 352, 160),
                128);
    set2DSprite(GetVif1Packet(), TexManager.GetTexture("dc01", -1),
                CRect<int>(0, 366, 640, 48), CRect<int>(0, 208, 640, 48),
                TitleFade);

    TitleFadeCnt++;
    if (TitleFadeCnt >= 60) {
        TitleFade++;
        if (TitleFade >= 128) {
            TitleFade = 128;
        }
    }

    TexManager.ReloadTexture(Vif1Packet, 22);

    float dof[3] = {1000.0f, 2000.0f, 3000.0f};
    DepthOfField(dof, 3, 32, 0);
}

static void TitleSetCamera(float x, float y, float z, float dist, float height) {
    int i = 1;
    int j = 2;
    int k = 3;
    int l = 4;

    TitleCameraWork[0] = 0.0f;
}
