#pragma once

#ifdef __cplusplus
extern "C" {
#endif

/* The 128-bit register the GIF and VIF pass a tag in. */
typedef unsigned __int128 sceVif1PkQuad;

/* One packet being built for VIF1. */
struct sceVif1Packet;

void sceVif1PkCnt(struct sceVif1Packet *packet, int flags);
void sceVif1PkOpenDirectCode(struct sceVif1Packet *packet, int flags);
void sceVif1PkCloseDirectCode(struct sceVif1Packet *packet);
void sceVif1PkOpenGifTag(struct sceVif1Packet *packet, sceVif1PkQuad tag);
void sceVif1PkCloseGifTag(struct sceVif1Packet *packet);
void sceVif1PkAddGsAD(struct sceVif1Packet *packet, int reg, unsigned long value);
void sceVif1PkCall(struct sceVif1Packet *packet, void *program, int flags);
void sceVif1PkTerminate(struct sceVif1Packet *packet);

#ifdef __cplusplus
}
#endif
