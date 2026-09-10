#pragma once

#include "common.h"

#include <libgraph.h>

class CCamera;
class CRect_i_;
class CTexture;
struct i;
struct spRGBA;
struct sceVif1Packet;

/**
 * Loads one character voice bank.
 *
 * @mangled SndVoiceLoad__Fi
 * @address 0x15B3F0
 * @size 0x90
 */
int SndVoiceLoad(int voice_no);

/**
 * @file
 * Declares the sound effect calls that the game makes while it draws, and the
 * sprite calls that retail's sound translation unit also carries.
 */

/**
 * Gives the sound system back what it holds, on the way out of an area.
 *
 * @mangled SndExit__Fv
 * @address 0x159290
 * @size 0xC0
 * @unknownret
 */
void SndExit(void);

/**
 * Steps every sound that is playing.
 *
 * @mangled SndStep__Fv
 * @address 0x159350
 * @size 0x100
 * @unknownret
 */
void SndStep(void);

/**
 * Starts the background music system from nothing.
 *
 * @mangled SndBgmInit__Fv
 * @address 0x159930
 * @size 0x30
 * @unknownret
 */
void SndBgmInit(void);

/**
 * Stops every sound effect that is playing.
 *
 * @mangled SndStopAllSe__Fv
 * @address 0x15A450
 * @size 0xA0
 * @unknownret
 */
void SndStopAllSe(void);

/**
 * Stops the background music at once.
 *
 * @mangled SndBgmStop__Fv
 * @address 0x159BA0
 * @size 0x58
 * @unknownret
 */
void SndBgmStop(void);

/**
 * Fades the background music out and then stops it.
 *
 * @mangled SndBgmFadeOutStop__Fv
 * @address 0x159C50
 * @size 0xA8
 * @unknownret
 */
void SndBgmFadeOutStop(void);

/**
 * Stops the ambient loop.
 *
 * @mangled SndAmbientStop__Fv
 * @address 0x15B190
 * @size 0x44
 * @unknownret
 */
void SndAmbientStop(void);

/** Starts the requested ambient loop. */
void SndAmbientPlay(int ambient_no);

/** Sets the ambient loop's normalized volume. */
void SndAmbientSetVolf(float volume);

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
 * Plays one sound effect with an integer volume and pan.
 *
 * @mangled SndSePlay__Fiii
 * @address 0x15A6B0
 * @size 0xD0
 * @unknownret
 */
int SndSePlay(int se_no, int voice, int pan);

/**
 * Plays a positional sound effect with distance attenuation.
 *
 * @mangled SndSePlay__FiPfff
 * @address 0x15A810
 * @size 0xF0
 */
void SndSePlay(int se_no, float *position, float near, float far);

/**
 * Plays the sound of one foot at a world position.
 *
 * @mangled SndPlayFootSound__FiiPf
 * @address 0x15ABE0
 * @size 0x120
 * @unknownret
 */
void SndPlayFootSound(int sound_id, int foot, float *position);

/**
 * Plays or stops one sound-effect sequence.
 *
 * @mangled SndSeSeqPlayStop__Fiii
 * @address 0x15AF20
 * @size 0x74
 * @unknownret
 */
void SndSeSeqPlayStop(int sound_id, int step, int flag);

/**
 * Turns the bilinear filter on or off for the sprites that follow.
 *
 * @mangled setbilinear__Fi
 * @address 0x15BC10
 * @size 0xC
 * @unknownret
 */
void setbilinear(int on);

/**
 * Opens a run of sprites that all draw out of one texture.
 *
 * @mangled set2DSprite_Start__FP13sceVif1PacketP8CTexture
 * @address 0x14C220
 * @size 0x19C
 * @unknownret
 */
void set2DSprite_Start(sceVif1Packet *packet, CTexture *texture);

/**
 * Closes that run.
 *
 * @mangled set2DSprite_End__FP13sceVif1PacketP8CTexture
 * @address 0x14C4F0
 * @size 0xA4
 * @unknownret
 */
void set2DSprite_End(sceVif1Packet *packet, CTexture *texture);

/**
 * Sends the palette a texture draws through.
 *
 * @mangled SetClut__FP13sceVif1PacketP8CTextureP1i
 * @address 0x14C5A0
 * @size 0x60
 * @unknownret
 */
void SetClut(sceVif1Packet *packet, CTexture *texture, i *clut);

/**
 * Draws one part of a texture into a rectangle of the screen, at one alpha.
 *
 * @mangled set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
 * @address 0x15C310
 * @size 0x320
 * @unknownret
 */
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &screen,
                 const CRect_i_ &texel, unsigned char alpha);

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
 * Draws a whole texture into a rectangle of the screen, turned about a point.
 *
 * @mangled set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_ii
 * @address 0x15BD00
 * @size 0x300
 * @unknownret
 */
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &screen, int u,
                 int v);

/**
 * Draws one part of a texture into a rectangle of the screen, with a colour
 * of its own at each corner.
 *
 * @mangled set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
 * @address 0x15C980
 * @size 0x82C
 * @unknownret
 */
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &screen,
                 const CRect_i_ &texel, spRGBA *top_left, spRGBA *top_right,
                 spRGBA *bottom_left, spRGBA *bottom_right, int mode);

/**
 * Draws an untextured rectangle with a colour at each of its four corners.
 *
 * @mangled set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
 * @address 0x15E120
 * @size 0x41C
 * @unknownret
 */
void set2DSpriteC4(sceVif1Packet *, const CRect_i_ &, spRGBA *, spRGBA *, spRGBA *, spRGBA *);

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

/**
 * Draws a four-cornered shape of the screen in a flat colour, giving each
 * corner its own.
 *
 * @mangled set3DColSprite__FP13sceVif1PacketPiPiPiPiP6spRGBAP6spRGBAP6spRGBAP6spRGBA
 * @address 0x15D1B0
 * @size 0x2BC
 * @unknownret
 */
void set3DColSprite(sceVif1Packet *, int *, int *, int *, int *, spRGBA *, spRGBA *, spRGBA *,
                    spRGBA *);

/**
 * Draws one part of a texture into a four-cornered shape of the screen, at one
 * alpha.
 *
 * @mangled set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
 * @address 0x15D470
 * @size 0x40
 * @unknownret
 */
void set3DSprite(sceVif1Packet *, CTexture *, const CRect_i_ &, int *, int *, int *, int *,
                 unsigned char);

/**
 * Tells the sound where the camera stands, so that it can pan what it plays.
 *
 * @mangled SndSetCamera__FP7CCamera
 * @address 0x1596F0
 * @size 0x48
 * @unknownret
 */
void SndSetCamera(CCamera *camera);

/**
 * Sets the listener directly from position and rotation vectors.
 */
void SndSetCamera(float *position, float *rotation);

/**
 * Stops one playing sound-effect voice.
 */
void SndSeStop(int se_no, int voice);

/**
 * Sets the background-music volume.
 *
 * @mangled SndSetBgmVol__Fi
 */
void SndSetBgmVol(int volume);

/** Sets the background-music normalized volume. */
void SndSetBgmVolf(float volume);

/**
 * Returns the background-music volume.
 *
 * @mangled SndGetBgmVol__Fv
 */
int SndGetBgmVol();

/** Returns the playing background-music number. */
int SndGetBgmNo();

/** Returns whether a background-music fade is still active. */
int SndCheckFade();

/** Polls the background sound loader. */
int SndSyncBG();

/** Plays one menu sound effect. */
void SndSPSePlay(int se_no, int voice);

/**
 * Stops a playing special sound effect.
 *
 * @mangled SndSPSeStop__Fi
 * @address 0x15B900
 * @size 0x44
 */
void SndSPSeStop(int se_no);

/** Sets the normalized volume of a playing special sound effect. */
void SndSetSPSeVolf(int se_no, float volume);

/** Sets the normalized pan of a playing special sound effect. */
void SndSetSPSePanf(int se_no, float pan);
/** Returns zero once the background sound-effect load has finished. */
int SndSPSeSyncBG(void);

/**
 * Starts loading one background music set.
 *
 * @mangled SndBgmLoad__Fi
 * @address 0x159960
 * @size 0x90
 */
void SndBgmLoad(int set_no);

/**
 * Plays one track of the loaded background music set.
 *
 * @mangled SndBgmPlay__Fi
 * @address 0x159B30
 * @size 0x68
 */
void SndBgmPlay(int track_no);

/**
 * Gives back the sound set that is loaded now.
 *
 * @mangled SndGetNowSetNo__Fv
 * @address 0x15A440
 * @size 0xC
 * @unknownret
 */
int SndGetNowSetNo(void);

/**
 * Points the sound loader at its read buffer.
 *
 * @mangled SndSetReadBuffer__FPUi
 * @address 0x159630
 * @size 0x38
 */
void SndSetReadBuffer(unsigned int *buffer);

/**
 * Starts loading one sound-effect set.
 *
 * @mangled SndSoundLoad__Fi
 * @address 0x15A4F0
 * @size 0x90
 */
void SndSoundLoad(int set_no);

/** Starts loading a background-music bank into a caller-provided buffer. */
void SndBgmLoadBG(int bgm_no, u_int *buffer, int *size);

/** Starts loading a sound-effect bank into a caller-provided buffer. */
void SndSoundLoadBG(int set_no, u_int *buffer, int *size);

/** Starts loading a voice bank into a caller-provided buffer. */
void SndVoiceLoadBG(int set_no, u_int *buffer, int *size);

/** Starts loading a special-effect sound bank into a caller-provided buffer. */
void SndSPSeLoadBG(int set_no, u_int *buffer, int *size);

/** Fades a background-music stream in. */
void SndBgmFadeIn(int bgm_no, int frames, int mode);

/** Fades a background-music stream out. */
void SndBgmFadeOut(int bgm_no, int frames);

/**
 * Submits the blending register that sprites draw with.
 *
 * @mangled setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha
 * @address 0x15BC20
 * @size 0xE0
 */
void setAlphaFlag(sceVif1Packet *packet, sceGsAlpha *alpha);

/**
 * Draws a sprite with the default alpha.
 *
 * @mangled set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_
 * @address 0x15C000
 * @size 0x304
 */
void set2DSprite(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &screen, const CRect_i_ &clip);
