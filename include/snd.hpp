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
 * Resets the sound manager: the background music, the ambient loop and the
 * sound-effect sequences start again from nothing, no sound-effect, voice or
 * music set counts as loaded, and the configuration file names are cleared.
 * None of the four arguments is read.
 *
 * @mangled SndInitialize__Fiiii
 * @address 0x159200
 * @size 0x8C
 */
void SndInitialize(int, int, int, int);

/**
 * Gives the sound system back what it holds, on the way out of an area.
 *
 * @mangled SndExit__Fv
 * @address 0x159290
 * @size 0xC0
 */
void SndExit(void);

/**
 * Steps every sound that is playing.
 *
 * @mangled SndStep__Fv
 * @address 0x159350
 * @size 0x100
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
 */
void SndStopAllSe(void);

/**
 * Stops the background music at once.
 *
 * @mangled SndBgmStop__Fv
 * @address 0x159BA0
 * @size 0x58
 */
void SndBgmStop(void);

/**
 * Fades the background music out and then stops it.
 *
 * @mangled SndBgmFadeOutStop__Fv
 * @address 0x159C50
 * @size 0xA8
 */
void SndBgmFadeOutStop(void);

/**
 * Stops the ambient loop.
 *
 * @mangled SndAmbientStop__Fv
 * @address 0x15B190
 * @size 0x44
 */
void SndAmbientStop(void);

/** Starts the requested ambient loop. */
void SndAmbientPlay(int ambient_no);

/** Sets the ambient loop's normalized volume. */
void SndAmbientSetVolf(float volume);

/**
 * Returns the default volume of the ambient loop that is playing, as its MIDI
 * state records it, or 64 when that loop has no state.
 *
 * @mangled SndGetAmbientDefaultVol__Fv
 * @address 0x15B2A0
 * @size 0x68
 */
int SndGetAmbientDefaultVol();

/**
 * Starts the ambient system from nothing, and reports whether it came up.
 *
 * @mangled SndAmbientInit__Fv
 * @address 0x15B0F0
 * @size 0x1C
 */
int SndAmbientInit(void);

/**
 * Works out the volume and the pan of a sound at a position.
 *
 * @mangled SndGetVolPan__FPfPfPfff
 * @address 0x15AC00
 * @size 0x200
 */
void SndGetVolPan(float *vol, float *pan, float *pos, float near, float far);

/**
 * Scales a sound effect's table volume by a normalized factor, and clamps the
 * result to the range the sound calls take.
 *
 * @mangled SndGetVolf__Fif
 * @address 0x15A970
 * @size 0xB4
 */
int SndGetVolf(int se_no, float vol);

/**
 * Converts a normalized pan into the hardware pan the sound calls take.
 *
 * @mangled SndGetPanf__Ff
 * @address 0x15AA30
 * @size 0x74
 */
int SndGetPanf(float pan);

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
 */
int SndSeSeqPlayStop(int se_no, int length, int voice);

/**
 * Clears every sound-effect sequence slot.
 *
 * @mangled SndSeSeqInit__Fv
 * @address 0x15AED0
 * @size 0x4C
 */
void SndSeSeqInit(void);

/**
 * Turns the bilinear filter on or off for the sprites that follow.
 *
 * @mangled setbilinear__Fi
 * @address 0x15BC10
 * @size 0xC
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

/**
 * Returns the background-music volume the configuration asks for.
 *
 * @mangled SndGetDefaultBgmVol__Fv
 * @address 0x159DF0
 * @size 0x48
 */
int SndGetDefaultBgmVol(void);

/**
 * Polls the background-music bank load, and hands the file to the driver once it lands.
 *
 * @mangled SndBgmSyncBG__Fv
 * @address 0x159AB0
 * @size 0x80
 */
int SndBgmSyncBG(void);

/**
 * Polls the sound-effect bank load, and hands the file to the driver once it lands.
 *
 * @mangled SndSoundSyncBG__Fv
 * @address 0x15A630
 * @size 0x80
 */
int SndSoundSyncBG(void);

/**
 * Polls the voice bank load, and hands the file to the driver once it lands.
 *
 * @mangled SndVoiceSyncBG__Fv
 * @address 0x15B530
 * @size 0x80
 */
int SndVoiceSyncBG(void);

/** Plays one menu sound effect. */
void SndSPSePlay(int se_no, int vol);

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

/**
 * Starts loading a background-music bank into a caller-provided buffer, and
 * returns whether it did: zero when that bank is already the one loaded, or
 * when the load could not be started.
 */
int SndBgmLoadBG(int bgm_no, u_int *buffer, int *size);

/**
 * Starts loading a sound-effect bank into a caller-provided buffer, and
 * returns whether it did: zero when that set is already the one loaded, or
 * when the load could not be started.
 */
int SndSoundLoadBG(int set_no, u_int *buffer, int *size);

/**
 * Starts loading a voice bank into a caller-provided buffer, and returns
 * whether it did: zero when that set is already the one loaded, or when the
 * load could not be started.
 */
int SndVoiceLoadBG(int set_no, u_int *buffer, int *size);

/**
 * Starts loading a special-effect sound bank into a caller-provided buffer, and
 * returns whether the load was started.
 *
 * @mangled SndSPSeLoadBG__FiPUiPi
 * @address 0x15B760
 * @size 0x94
 */
int SndSPSeLoadBG(int set_no, u_int *buffer, int *size);

/** Fades a background-music stream in. */
void SndBgmFadeIn(int bgm_no, int frames, int mode);

/** Fades a background-music stream out. */
void SndBgmFadeOut(int bgm_no, int frames);

/**
 * Steps the background-music fade, and applies the volume it reaches.
 *
 * @mangled SndBgmFadeInOut__Fv
 * @address 0x159F90
 * @size 0xF4
 */
void SndBgmFadeInOut(void);

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
