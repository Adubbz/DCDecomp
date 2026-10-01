#include "mglib.hpp"
#include "types.h"

#include <eekernel.h>
#include <libdma.h>
#include <libpkt.h>
#include <sifdev.h>

#include <cmath>
#include <cstdio>
#include <cstring>

#include "collision.hpp"
#include "dataalloc.hpp"
#include "dataset.hpp"
#include "frame.hpp"
#include "mathutil.hpp"
#include "platform/renderer.hpp"
#include "rect.hpp"
#include "texture.hpp"
#include "vutext.hpp"

/** Whether MGBeginFrame started a frame for MGEndFrame to present. */
static bool frame_begun;

void MGBeginFrame() {
    frame_begun = RendererBeginFrame();
}

void MGEndFrame() {
    if (frame_begun) {
        RendererEndFrame();
        frame_begun = false;
    }
}
