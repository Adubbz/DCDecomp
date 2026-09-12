#pragma once

#include "common.h"

class RenderInfo;
class sceVif1Packet;
struct MDT_MATERIAL;

/**
 * Which of the Vector Unit's drawing modes a visual is drawn in. The image states the type — the
   draw entry points carry it by value — and nothing states its enumerators, so the only one named
   here is the value a frame passes.
 */
enum VU1_PROGRAM {
    VU1_PROGRAM_UNKNOWN6 = 6
};

/**
 * The drawable half of a scene node. A frame carries the transform and one of these carries the
   geometry, so the same model file can be attached to any frame and the same frame can hold any of
   the three kinds below. The unit that defines them is not reconstructed yet, so each class here
   states its extent, the members the model loader reaches, and nothing else. The extents are the
   sizes the loader's own allocations name rather than sizes anybody chose.
 */

/**
 * The base nothing is constructed from directly: two words of its own, the vtable pointer where
   the first virtual declaration puts it, and one word behind it.
 */
class CVisual {
public:
    int unk_00;
    int unk_04;

    virtual void Initialize();

    int unk_0C;
};

/**
 * Geometry the Vector Unit draws from a data block built once at load time. The address of that
   block and its size in quadwords are what the loader reads back after asking for it, so that it
   can reserve exactly as much as was written and account for it.
 */
class CVisualVu1 : public CVisual {
public:
    CVisualVu1();

    /**
     * Builds the Vector Unit data block for a model into `block` and answers the size it
       wrote, in quadwords: the loader reserves exactly that much and the visual keeps the
       same number in vu_size.
     */
    int CreateVUdataFromMDT(u_int *block, u_int *data, int unknown0, int unknown1);

    /**
     * Builds the block again from a model image the visual already holds, and answers its size
       in quadwords the same way. Only the visual that keeps its model reaches this; the block
       is written back over the one the loader reserved, so the size answered is the same one.
     */
    int CreateVUdataFromMDTRemake(u_int *block, u_int *data, int unknown0);

    /**
 * The one it takes over from its base and the five it adds, in the order the vtable holds them —
       which is what decides the slot each call site reaches, so the order is evidence rather than
       layout.
 */
    virtual void Initialize();
    virtual void SetMDTDataAddress(u_int *data);
    virtual u_int *GetMDTDataAddress();
    virtual int RemakeData(u_int *data);
    virtual int DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                        u_long128 *unknown0, int unknown1, int unknown2);
    virtual int DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info,
                        VU1_PROGRAM program, u_long128 *unknown0, int unknown1, int unknown2);

    int unk_00;
    int unk_04;
    u_int *vu_data; /**< Vector Unit command data built for this visual. */
    u_int vu_size;  /**< Size of the Vector Unit data in quadwords. */
};

/**
 * The same with a copy of the model file kept beside the built block, which is what lets the
   geometry be rebuilt later without the loader. vu_data0 and vu_data1 are the same address
   unless a second block was built for the model, and then they are the two of them.
 */
class CVisualMDTVu1 : public CVisualVu1 {
public:
    CVisualMDTVu1();

    /* Every one of them, because a block that is kept can be rebuilt and one that is not cannot. */
    virtual void Initialize();
    virtual void SetMDTDataAddress(u_int *data);
    virtual u_int *GetMDTDataAddress();
    virtual int RemakeData(u_int *data);
    virtual int DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                        u_long128 *unknown0, int unknown1, int unknown2);
    virtual int DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info,
                        VU1_PROGRAM program, u_long128 *unknown0, int unknown1, int unknown2);

    u_int *data; /**< Retained source MDT image used to rebuild the visual. */
    int unk_00;
    u_int *vu_data0; /**< Primary built Vector Unit data block. */
    u_int *vu_data1; /**< Secondary built Vector Unit data block. */
};

/**
 * The silhouette caster. It adds no field of its own — the loader allocates it at its base class's
   size — and differs in how its block is built and in the edge pass that runs beside it.
 */
class CVisualShadow : public CVisualMDTVu1 {
public:
    /* The three the silhouette builds differently; how the block is kept is its base's business,
       so the three that answer that are the ones it leaves alone. */
    virtual int RemakeData(u_int *data);
    virtual int DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                        u_long128 *unknown0, int unknown1, int unknown2);
    virtual int DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info,
                        VU1_PROGRAM program, u_long128 *unknown0, int unknown1, int unknown2);

    void CreateVUdataShadow(u_int *block, u_int *data);
};

/**
 * The two pieces of a drawing packet that a visual's own data does not carry: the material the
   Vector Unit lights with, and the texture registers the GS needs. Both answer how many words
   they wrote, so a builder adds rather than tracks.
 */
/**
 * Writes the material the Vector Unit lights with into the packet and answers the words written.
 * A visual reached with no material of its own gets the fixed empty one, which is the same length,
 * so a builder can add the answer without looking at which was written.
 *
 * @mangled SetMaterial__FPUiP12MDT_MATERIAL
 * @address 0x134D40
 * @size 0x74
 */
int SetMaterial(u_int *packet, MDT_MATERIAL *material);

/**
 * Writes the pair of texture registers the GS samples the visual with into the packet and answers
 * the words written.
 *
 * @mangled SetTEX0__FPUiUlUl
 * @address 0x134DC0
 * @size 0xFC
 */
int SetTEX0(u_int *packet, u_long tex0, u_long tex1);
