#pragma once

#include "common.h"

#include <libvu0.h>

class CBoxVu0;
class CCollision;
class CVisualVu1;
class CCPoly;
struct RenderInfo;
class sceVif1Packet;

/* The per-frame drawing attributes, kept inside the frame rather than beside it. SetAttr copies
   them one field per mask bit, so a field's position and width are settled while its meaning is
   not — which is why most of them are still unnamed. */
class CFrameAttr {
public:
    CFrameAttr();

    void Initialize();

    short draw_on;
    float unk_04;
    char unk_08;
    char unk_09;
    char unk_0A;
    char unk_0B;
    char fog_enable; /**< Whether fog affects the frame during rendering. */
    char unk_0D;
    char colour_dirty; /**< Whether modified model colours must be uploaded before drawing. */
    char unk_0F;
    float unk_10;
    char unk_14;
    sceVu0FVECTOR color;
    char unk_30;
    char unk_31;
    sceVu0FVECTOR unk_40;
    short unk_50;
    short unk_52;
    char unk_54;
    char unk_55;
    short unk_56;
    short unk_58;
};

/* A node of the scene hierarchy: a transform with a name, linked to its neighbours rather than
   held in an array. The world matrix is cached and world_valid says whether the cache still
   holds; everything that moves a frame clears it. */
class CFrame {
public:
    CFrame();

    void SetPosition(float x, float y, float z);
    void SetPosition(float *position);
    void SetScale(float x, float y, float z);
    void SetScale(float *scale);
    int GetFrameNum();
    void SetParent(CFrame *parent);
    void SetBrother(CFrame *brother);
    void SetChild(CFrame *child);
    void SetReference(CFrame *reference);
    void DeleteReference();
    void GetLWMatrix(sceVu0FMATRIX matrix);
    float (*GetInverseMatrix())[4];
    void SetTransMatrix(sceVu0FMATRIX matrix);
    void SetTransMatrix(float *quaternion);
    CFrame *SearchFrame(char *name);
    void GetBoundBox(CBoxVu0 *box, int children);
    void ScaleBoundBox(float *scale);
    void SetAttr(CFrameAttr &attr, int children, int mask);
    void GetWorldPosition(float *world, float *local);
    void SetRotation(float x, float y, float z);
    void GetRotation(float *rotation);
    void SetRotType(int type);
    CFrame &operator=(CFrame &other);
    void SetCollision(CCollision *collision);
    int PickUpNearPoly(CCPoly *poly, const CBoxVu0 &box);

    int flags;
    CCollision *collision;
    sceVu0FVECTOR max;
    sceVu0FVECTOR min;
    sceVu0FVECTOR corner[8];
    CFrameAttr attr;
    CFrame *parent;
    int reference;
    char name[32];
    CFrame *child;
    CFrame *brother;
    CFrame *elder;
    sceVu0FMATRIX world;
    sceVu0FMATRIX inverse;
    sceVu0FMATRIX local;
    sceVu0FVECTOR scale;
    sceVu0FVECTOR position;
    sceVu0FVECTOR rotation;
    int world_valid;
    int no_rotation;
    int rot_type;
    int srt;

    virtual int DrawVu1(unsigned int *packet, RenderInfo *info);
    virtual int DrawVu1(sceVif1Packet *packet, RenderInfo *info);
    virtual void Initialize();
};

class CFrameVu1;

/* Which of a frame's own axes `LookAt` holds perpendicular to the direction of its target. */
enum _FRAMECONSTRAINT {
    FRAME_CONSTRAINT_Z,
    FRAME_CONSTRAINT_Y,
    FRAME_CONSTRAINT_X
};

int FrameNameComp(char *left, char *right);
void SetFrameAttr(CFrame *frame, int children);
int LookAt(CFrameVu1 *frame, float *target, _FRAMECONSTRAINT constraint);
int LookAt(CFrameVu1 *frame, CFrameVu1 *target, _FRAMECONSTRAINT constraint);
