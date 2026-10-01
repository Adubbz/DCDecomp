#pragma once

#include "common.h"

// What the title replacement units share.

// The previous frame drawn over the whole logical frame at alpha (0x80 opaque) through the current
// ALPHA register: the motion trail of the title scenes.
void TitlePortFeedback(u_char alpha);
