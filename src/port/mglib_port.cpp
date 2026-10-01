#include "mglib_port.hpp"

// Placeholder bodies until the 3D path lands; they let the units that depend on this
// contract link in the meantime.

gfx::DrawState MGPortDrawState() {
    return {};
}

void MGPortApplyTest(gfx::DrawState &, const sceGsTest &) {}
void MGPortApplyZbuf(gfx::DrawState &, const sceGsZbuf &) {}
void MGPortApplyAlpha(gfx::DrawState &, const sceGsAlpha &) {}
void MGPortApplyTexa(gfx::DrawState &, const sceGsTexa &) {}

float MGPortLogicalX(int gs_x) {
    return (gs_x - 27648) / 16.0f;
}

float MGPortLogicalY(int gs_y) {
    return (gs_y - 0x7880) / 8.0f;
}

float MGPortDepth(unsigned gs_z) {
    return gs_z / 16700000.0f;
}
