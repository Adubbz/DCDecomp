#include "objanime.hpp"

#include <libvu0.h>

#include "candleeffect.hpp"
#include "editloop.hpp"
#include "fireomni.hpp"
#include "frame.hpp"
#include "texture.hpp"

/** The one fire and the one candle the editor lends to every map part. */
extern CFireOmni Fire;
extern CCandleEffect Candle;

/**
 * Controls whether all object animations are stopped.
 */
extern int all_stop;

/**
 * Clears one object-animation sequence.
 *
 * @mangled Initialize__13OBJ_ANIME_SEQFv
 * @address 0x165C90
 * @size 0x14
 */
void OBJ_ANIME_SEQ::Initialize(void) {
    type = -1;
    completion_flag = 0;
}
/**
 * Constructs an object-animation sequence.
 *
 * @mangled __ct__13OBJ_ANIME_SEQFv
 * @address 0x165CB0
 * @size 0x30
 */
OBJ_ANIME_SEQ::OBJ_ANIME_SEQ(void) {
    Initialize();
}

void ObjAnimeAllStop(void) {
    all_stop = 1;
}

void ObjAnimeAllStart(void) {
    all_stop = 0;
}
/**
 * Attaches an object animation to one frame.
 *
 * @mangled InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
 * @address 0x165D00
 * @size 0xC4
 */
#ifdef NON_MATCHING
int InitObjAnime(CFrame *frame, OBJ_ANIME_SEQ *sequence) {
    int i;

    for (i = 0; i < 10; i++) {
        sequence->frames[i] = NULL;
    }
    if (sequence->type < 0) {
        return 0;
    }
    // An empty name means the animation drives the frame it was given.
    if (sequence->name[0] != 0) {
        sequence->frames[0] = frame->SearchFrame(sequence->name);
    } else {
        sequence->frames[i] = frame;
    }
    if (sequence->frames[0] == NULL) {
        return 0;
    }
    sceVu0CopyVector(sequence->current, sequence->range);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/objanime", InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ);
#endif
/**
 * Attaches an object animation to a list of frames.
 *
 * @mangled InitObjAnime__FPP6CFrameP13OBJ_ANIME_SEQ
 * @address 0x165DD0
 * @size 0xFC
 */
#ifdef NON_MATCHING
int InitObjAnime(CFrame **frames, OBJ_ANIME_SEQ *sequence) {
    if (sequence->type < 0) {
        return 0;
    }
    for (int i = 0; i < 10; i++) {
        sequence->frames[i] = NULL;
    }
    for (int i = 0; i < 4; i++) {
        sequence->frames[i] = NULL;
        if (frames[i] != NULL) {
            if (sequence->name[0] != 0) {
                sequence->frames[i] = frames[i]->SearchFrame(sequence->name);
            } else {
                sequence->frames[i] = frames[i];
            }
        }
    }
    sceVu0CopyVector(sequence->current, sequence->range);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/objanime", InitObjAnime__FPP6CFrameP13OBJ_ANIME_SEQ);
#endif
/**
 * Attaches an object animation to a counted list of frames.
 *
 * @mangled InitObjAnime__FPP6CFrameiP13OBJ_ANIME_SEQ
 * @address 0x165ED0
 * @size 0x138
 */
#ifdef NON_MATCHING
int InitObjAnime(CFrame **frames, int count, OBJ_ANIME_SEQ *sequence) {
    int found = 0;

    if (sequence->type < 0) {
        return 0;
    }
    if (count >= 11) {
        count = 10;
    }
    for (int i = 0; i < 10; i++) {
        sequence->frames[i] = NULL;
    }
    // The named frames are packed down, so a list with holes still fills
    // the front of the sequence.
    for (int i = 0; i < count; i++) {
        if (frames[i] != NULL) {
            if (sequence->name[0] != 0) {
                sequence->frames[found] = frames[i]->SearchFrame(sequence->name);
            } else {
                sequence->frames[found] = frames[i];
            }
            if (sequence->frames[found] != NULL) {
                found++;
            }
        }
    }
    sceVu0CopyVector(sequence->current, sequence->range);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/objanime", InitObjAnime__FPP6CFrameiP13OBJ_ANIME_SEQ);
#endif
/**
 * Attaches an object animation to the frames one function point names.
 *
 * @mangled InitObjAnime__FPP6CFrameiP16EPARTS_FUNC_DATAP13OBJ_ANIME_SEQ
 * @address 0x166010
 * @size 0x160
 */
INCLUDE_ASM("asm/nonmatchings/objanime", InitObjAnime__FPP6CFrameiP16EPARTS_FUNC_DATAP13OBJ_ANIME_SEQ);
#ifdef NON_MATCHING
/**
 * Reports whether an animated value has passed its target in the direction it moves.
 *
 * @mangled end_check__Ffff
 * @address 0x166170
 * @size 0x68
 */
int end_check(float value, float target, float step) {
    if (step > 0.0f) {
        return value > target;
    }
    return value < target;
}
#else
#ifdef NON_MATCHING
static int end_check(float value, float target, float speed) {
    // Which way the value is travelling decides which side of the target ends it.
    if (!(speed <= 0.0f)) {
        return !(value <= target);
    }
    return value < target;
}
#else
INCLUDE_ASM("asm/nonmatchings/objanime", end_check__Ffff);
#endif
#endif
/**
 * Advances one object animation by a frame.
 *
 * @mangled ObjAnimePlay__FP13OBJ_ANIME_SEQ
 * @address 0x1661E0
 * @size 0x78C
 */
INCLUDE_ASM("asm/nonmatchings/objanime", ObjAnimePlay__FP13OBJ_ANIME_SEQ);

void InitEditEffect(CFrame *frame, EDIT_EFFECT_INFO *effect) {
    if (frame == NULL) {
        effect->frame = NULL;
        return;
    }

    effect->frame = frame->SearchFrame(effect->frame_name);
    if (effect->frame == NULL) {
        effect->frame = frame;
    }
}

/**
 * Attaches an editor effect to the frame a function point names.
 *
 * @mangled InitEditEffect__FP6CFrameP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFO
 * @address 0x1669D0
 * @size 0x1E0
 */
INCLUDE_ASM("asm/nonmatchings/objanime", InitEditEffect__FP6CFrameP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFO);

int CheckEditEffect(EDIT_EFFECT_INFO *effect, float time) {
    if (effect->kind <= 0) {
        return 0;
    }
    if (effect->map_flag > 0 && EdGetMapFlag(effect->map_flag)) {
        return 0;
    }

    // An effect whose start is later than its end runs across midnight.
    if (effect->start > effect->end && effect->start > time && effect->end <= time) {
        return 0;
    }
    if (effect->start < effect->end && (effect->start > time || effect->end <= time)) {
        return 0;
    }

    // The effect draws only while its frame and every parent above it are shown.
    CFrame *frame = effect->frame;
    if (frame == NULL) {
        return 1;
    }
    if (!(frame->attr.draw_on & 1)) {
        return 0;
    }
    for (frame = frame->parent; frame != NULL; frame = frame->parent) {
        if (!(frame->attr.draw_on & 1)) {
            return 0;
        }
    }
    return 1;
}

/**
 * Advances the editor's shared fire, candle and flame effects.
 *
 * @mangled EditEffectStep__Fv
 * @address 0x166D10
 * @size 0xC4
 */
void EditEffectStep(void) {
    Fire.FireStep();
    Candle.Step();
    Candle.SetTexture(TexManager.GetTexture("rousoku", -1));
    Fire.SetTexture(TexManager.GetTexture("lightling", -1),
                    TexManager.GetTexture("blender", -1));
}
/**
 * Rebuilds the editor's fire texture for the frame.
 *
 * @mangled EditEffectStep2__Fv
 * @address 0x166DE0
 * @size 0x28
 */
void EditEffectStep2(void) {
    Fire.FireCreate();
}
/**
 * Draws one editor effect, choosing the kind from its record.
 *
 * @mangled DrawEditEffect__FP16EDIT_EFFECT_INFOP7CCameraP12CEffectGroup
 * @address 0x166E10
 * @size 0x24C
 */
INCLUDE_ASM("asm/nonmatchings/objanime", DrawEditEffect__FP16EDIT_EFFECT_INFOP7CCameraP12CEffectGroup);
