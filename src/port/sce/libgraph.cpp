#include <libgraph.h>

void sceGsResetGraph(short mode, short inter, short omode, short ffmd) {
    PS2_STUB();
}

void sceGsResetPath() {
    PS2_STUB();
}

int sceGsSyncV(int mode) {
    PS2_STUB();
}

int sceGsSyncPath(int mode, u_short timeout) {
    PS2_STUB();
}

void sceGsSyncVCallback(int (*callback)(int)) {
    PS2_STUB();
}

void sceGsSetDefDBuff(sceGsDBuff *db, int psm, int w, int h, int ztest, int zpsm, int clear) {
    PS2_STUB();
}

void sceGsSwapDBuff(sceGsDBuff *db, int id) {
    PS2_STUB();
}

void sceGsSetHalfOffset(sceGsDrawEnv1 *env, short offx, short offy, short field) {
    PS2_STUB();
}

void sceGsSetDefStoreImage(sceGsStoreImage *si, short sbp, short sbw, short spsm, short ssax, short ssay, short rrw, short rrh) {
    PS2_STUB();
}

void sceGsExecStoreImage(sceGsStoreImage *si, u_long128 *dest) {
    PS2_STUB();
}

void sceGsSetDefLoadImage(sceGsLoadImage *li, short dbp, short dbw, short dpsm, short dsax, short dsay, short rrw, short rrh) {
    PS2_STUB();
}

void sceGsExecLoadImage(sceGsLoadImage *li, u_long128 *source) {
    PS2_STUB();
}
