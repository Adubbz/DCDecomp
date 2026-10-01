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
#include "gfx/gfx.hpp"
#include "mathutil.hpp"
#include "rect.hpp"
#include "texture.hpp"
#include "vutext.hpp"

void MGBeginFrame() {
    gfx::BeginFrame();
}

void MGEndFrame() {
    gfx::EndFrame();
}
