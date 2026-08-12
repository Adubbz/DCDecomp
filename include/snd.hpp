#pragma once

#include "common.h"

class CRect_i_;
class CTexture;
struct sceVif1Packet;

/**
 * @file
 * Declares the sound effect calls that the game makes while it draws, and the
 * sprite calls that retail's sound translation unit also carries.
 */

/**
 * Works out the volume and the pan of a sound at a position.
 *
 * @mangled SndGetVolPan__FPfPfPfff
 * @address 0x15AC00
 * @size 0x200
 */
void SndGetVolPan(float *vol, float *pan, float *pos, float near, float far);

/**
 * Sets the volume of a sound effect.
 *
 * @mangled SndSetSeVol__Fiii
 * @address 0x15A900
 * @size 0x70
 * @unknownret
 */
void SndSetSeVol(int se_no, int vol, int voice);

/**
 * Sets the volume of a sound effect, as a share of the loudest volume.
 *
 * @mangled SndSetSeVolf__Fifi
 * @address 0x15AAB0
 * @size 0x60
 * @unknownret
 */
void SndSetSeVolf(int se_no, float vol, int voice);

/**
 * Sets the pan of a sound effect, as a share of the widest pan.
 *
 * @mangled SndSetSePanf__Fifi
 * @address 0x15AB10
 * @size 0x80
 * @unknownret
 */
void SndSetSePanf(int se_no, float pan, int voice);

/**
 * Draws one part of a texture into a rectangle of the screen, at one alpha.
 *
 * @mangled set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
 * @address 0x15C310
 * @size 0x320
 * @unknownret
 */
void set2DSprite(sceVif1Packet *, CTexture *, const CRect_i_ &, const CRect_i_ &, unsigned char);

/**
 * Draws one part of a texture into a rectangle of the screen, at one colour.
 *
 * @mangled set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
 * @address 0x15C630
 * @size 0x350
 * @unknownret
 */
void set2DSprite(sceVif1Packet *, CTexture *, const CRect_i_ &, const CRect_i_ &, unsigned char,
                 unsigned char, unsigned char, unsigned char);

/**
 * Draws one part of a texture into a rectangle of the screen, turned about a point.
 *
 * @mangled set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iif
 * @address 0x15E540
 * @size 0x590
 * @unknownret
 */
void set2DSprite(sceVif1Packet *, CTexture *, const CRect_i_ &, const CRect_i_ &, int, int, float);

/**
 * Draws one four-cornered shape of one colour.
 *
 * @mangled setColSprite__FP13sceVif1PacketPiPiPiPiUcUcUcUc
 * @address 0x15DED0
 * @size 0x250
 * @unknownret
 */
void setColSprite(sceVif1Packet *, int *, int *, int *, int *, unsigned char, unsigned char,
                  unsigned char, unsigned char);
