#include <libgraph.h>

void sceGsResetGraph(short mode, short inter, short omode, short ffmd) {
    PS2_UNIMPLEMENTED();
}

void sceGsResetPath() {
    PS2_UNIMPLEMENTED();
}

int sceGsSyncV(int mode) {
    PS2_UNIMPLEMENTED();
}

int sceGsSyncPath(int mode, u_short timeout) {
    PS2_UNIMPLEMENTED();
}

void sceGsSyncVCallback(int (*callback)(int)) {
    PS2_UNIMPLEMENTED();
}

void sceGsSetDefDBuff(sceGsDBuff *db, int psm, int w, int h, int ztest, int zpsm, int clear) {
    PS2_UNIMPLEMENTED();
}

void sceGsSwapDBuff(sceGsDBuff *db, int id) {
    PS2_UNIMPLEMENTED();
}

void sceGsSetHalfOffset(sceGsDrawEnv1 *env, short offx, short offy, short field) {
    PS2_UNIMPLEMENTED();
}

void sceGsSetDefStoreImage(sceGsStoreImage *si, short sbp, short sbw, short spsm, short ssax, short ssay, short rrw, short rrh) {
    PS2_UNIMPLEMENTED();
}

void sceGsExecStoreImage(sceGsStoreImage *si, u_long128 *dest) {
    PS2_UNIMPLEMENTED();
}

void sceGsSetDefLoadImage(sceGsLoadImage *li, short dbp, short dbw, short dpsm, short dsax, short dsay, short rrw, short rrh) {
    PS2_UNIMPLEMENTED();
}

void sceGsExecLoadImage(sceGsLoadImage *li, u_long128 *source) {
    PS2_UNIMPLEMENTED();
}
