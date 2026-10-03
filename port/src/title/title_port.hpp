#pragma once

#include "common.h"

#include <span>

#include "rect.hpp"

// What the title replacement units share.

// The previous frame drawn over the whole logical frame at alpha (0x80 opaque) through the current
// ALPHA register: the motion trail of the title scenes.
void TitlePortFeedback(u_char alpha);

// One band of the title's fog: frame_image's texel rect drawn back over the screen rect at alpha.
struct TitleFogBand {
    CRect_i_ screen;
    CRect_i_ texel;
    u_char   alpha;
};

// The fog's bands, softened as the PS2 softened them (see the definition).
void TitlePortFog(std::span<const TitleFogBand> bands);

// Constructs the title overlay's objects the port defines with host classes, as the overlay's
// static constructors did each time retail loaded TITLE.BIN.
void TitleOverlayConstruct();
