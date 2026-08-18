#pragma once

#include "common.h"

#include "objectframe.hpp"

/**
 * @file
 * Declares the object that a map places, with the frames that give it a
 * shadow, a shade and a collision shape.
 */

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;

/**
 * Draws one object of a map, together with the shadow it casts, the shade
 * that lies on it and the shape that collision reads.
 */
class CMapObject : public CObjectFrame {
public:
    CFrame *collision_frame; /**< Frame that collision reads; zero where the object has none. */
    CFrame *shadow_frame;    /**< Frame that the shadow draws from; zero where the object casts none. */
    CFrame *shade_frame;     /**< Frame that the shade draws from; zero where the object takes none. */
    CFrame *unk_0DC;
    float shadow_offset; /**< Height that the shadow drops below the object. */
    s32 unk_0E4;
    s32 unk_0E8;
    s32 unk_0EC;

    /**
     * Puts the collision frame where the object is and gives it back.
     *
     * @mangled GetCollisionFrame__10CMapObjectFv
     * @address 0x1574F0
     * @size 0xA0
     */
    CFrame *GetCollisionFrame(void);

    /**
     * Turns a named part of every frame the object holds on or off.
     *
     * @mangled FrameObjectOnOff__10CMapObjectFPci
     * @address 0x157590
     * @size 0x130
     */
    virtual void FrameObjectOnOff(char *name, int on);

    /**
     * Draws the object.
     *
     * @mangled Draw__10CMapObjectFv
     * @address 0x1576C0
     * @size 0x40
     */
    virtual void Draw(void);

    /**
     * Draws the object at the level of detail that suits its distance from
     * the eye, and gives back the level that it drew.
     *
     * @mangled DrawLOD__10CMapObjectFPfiiPi
     * @address 0x157700
     * @size 0x60
     */
    virtual void DrawLOD(float *distance, int lowest, int highest, int *out_level);

    /**
     * Drops the shadow of the object onto the ground below it.
     *
     * @mangled DrawShadow__10CMapObjectFi
     * @address 0x157760
     * @size 0x110
     */
    void DrawShadow(int fast);

    /**
     * Draws the shade that lies on the object.
     *
     * @mangled DrawShade__10CMapObjectFv
     * @address 0x157870
     * @size 0xA0
     */
    void DrawShade(void);

    /**
     * Puts the object at rest at the world origin with no frame of its own.
     *
     * @mangled Initialize__10CMapObjectFv
     * @address 0x157910
     * @size 0x60
     */
    void Initialize(void);

    /**
     * Makes an object that a map has yet to place.
     *
     * @mangled __ct__10CMapObjectFv
     * @address 0x157970
     * @size 0x70
     */
    CMapObject(void);
};

STATIC_ASSERT(sizeof(CMapObject) == 0xF0);
