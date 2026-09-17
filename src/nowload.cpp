#include "common.h"

#include <eekernel.h>
#include <libdma.h>
#include <libgraph.h>
#include <libpkt.h>

#include <cstdio>

#include "dataread.hpp"
#include "mainselect.hpp"
#include "mglib.hpp"
#include "nowload.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "tim2.hpp"

/**
 * Whether the loading-screen operation has ended.
 */
extern int end_flag;
/**
 * Requests that the loading display be disabled.
 */
extern int now_loding_off;
/**
 * Whether the loading display has completed a field.
 */
extern int now_loading_vsync_end;
extern int now_loding_flag;
extern int nl_start_cnt;
extern float col_cnt;
extern float col_add;
extern int logo_count;
extern int count__2;
extern int map_title_no;
extern int VSyncField;
extern int DBuffID;
extern u_int now_load[2000];
extern sceGsDBuff nowloadDB;
extern sceVif1Packet nlPacket;
extern CTexture nl_tex;
extern CTexture nl_tex2;

int check_now_loading(void) {
    return end_flag;
}

void clear_now_loading_vsync_end(void) {
    now_loading_vsync_end = 0;
}

int check_now_loading_vsync_end(void) {
    return now_loading_vsync_end;
}

void wait_now_loading_vsync(void) {
    if (end_flag == 0) {
        clear_now_loading_vsync_end();
        do {

        } while (check_now_loading_vsync_end() == 0);
    }
}

void now_loading_off(void) {
    now_loding_off = 1;
}

#ifdef NON_MATCHING
/**
 * Loads the loading screen for one map, arms its vertical-sync callback, and starts its fade.
 *
 * @mangled init_now_loading__Fi
 * @address 0x153FC0
 * @size 0x354
 */
void init_now_loading(int title_number) {
    end_flag = 1;
    if (now_loding_off != 0) {
        now_loding_off = 0;
        return;
    }

    u_char raw_archive[64064];
    u_char *archive = (u_char *) (((u_int) raw_archive + 63) & ~63);
    int archive_size;
    char image_directory[64] = "img";
    char path[64] = "";

    now_loding_flag = 0;
    if (LanguageCode > 0) {
        sprintf(image_directory, "img_%d", LanguageCode);
    }
    if (title_number < 5) {
        sprintf(path, "%s/mt0%d.tm2", image_directory, title_number + 1);
    } else if (title_number < 100) {
        sprintf(path, "%s/mt%d.tm2", image_directory, title_number);
    } else {
        sprintf(path, "%s/mt%d.tm2", image_directory, title_number - 99);
    }

    if (title_number == 0x321) {
        sprintf(path, "%s/title.img", image_directory);
        if (LoadFile2(path, archive, &archive_size, 0) == 0) {
            return;
        }
        LoadTexture("SCElogo", archive, &nl_tex, 0x1A40, 10000);
        LoadTexture("L5logo", archive, &nl_tex2, 8000, 0x2774);
    } else {
        if (path[0] == '\0' || LoadFile2(path, archive, &archive_size, 0) == 0) {
            return;
        }
        LoadTexture((TM2_head *) archive, &nl_tex, 0x1A40, 8000);
    }

    map_title_no = title_number;
    nl_start_cnt = 20;
    sceGsSetDefDBuff(&nowloadDB, 0, 640, 224, 2, 0x31, 1);
    nowloadDB.clear0.rgbaq.A = 0x80;
    nowloadDB.clear1.rgbaq.A = 0x80;
    sceVif1PkInit(&nlPacket, now_load);
    col_cnt = 0.0f;
    col_add = 1.0f;
    count__2 = 0;
    logo_count = 0;
    end_flag = 0;
    now_loading_vsync_end = 1;
    MGInitVSyncCallBack(VSyncCallBack_Load);
}
#else
INCLUDE_ASM("asm/nonmatchings/nowload", init_now_loading__Fi);
#endif
INCLUDE_RODATA("asm/nonmatchings/nowload", @285__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @286);
INCLUDE_RODATA("asm/nonmatchings/nowload", @287);
INCLUDE_RODATA("asm/nonmatchings/nowload", @288);
INCLUDE_RODATA("asm/nonmatchings/nowload", @289);
INCLUDE_RODATA("asm/nonmatchings/nowload", @290);

#ifdef NON_MATCHING
/**
 * Draws the loading screen and advances its fade once per vertical sync.
 *
 * @mangled VSyncCallBack_Load__Fi
 * @address 0x154320
 * @size 0x450
 */
int VSyncCallBack_Load(int field) {
    (void) field;
    if (end_flag == 0) {
        VSyncField = !((*(volatile u_long *) 0x12001000 >> 13) & 1);
        if (nl_start_cnt == 0) {
            sceDmaSync(DmaCH1, 0, 0);
            sceVif1PkReset(&nlPacket);
            if (map_title_no == 0x321) {
                if (logo_count == 0) {
                    CRect_i_ screen(0x60, 0xC0, 0x1C0, 0x40);
                    CRect_i_ source(0, 0, 0x1C0, 0x40);
                    set2DSprite(&nlPacket, &nl_tex, screen, source, (u_char) col_cnt);
                }
                if (logo_count == 1) {
                    CRect_i_ screen(0x100, 0xA0, 0x80, 0x80);
                    CRect_i_ source(0, 0, 0x80, 0x80);
                    set2DSprite(&nlPacket, &nl_tex2, screen, source, (u_char) col_cnt);
                }
                if (count__2 == 0) {
                    col_cnt += col_add * 2.0f;
                }
                if (col_cnt > 128.0f) {
                    count__2 = 220;
                    col_cnt = 128.0f;
                    col_add *= -1.0f;
                }
                if (col_cnt < 0.0f) {
                    count__2 = 100;
                    col_cnt = 0.0f;
                    col_add *= -1.0f;
                    if (logo_count == 1) {
                        end_flag = 1;
                    }
                    logo_count++;
                }
            } else {
                CRect_i_ screen(0x80, 0xA0, 0x180, 0x80);
                CRect_i_ source(0, 0, 0x180, 0x80);
                set2DSprite(&nlPacket, &nl_tex, screen, source, (u_char) col_cnt);
                if (count__2 == 0) {
                    col_cnt += col_add;
                }
                if (col_cnt > 128.0f) {
                    count__2 = 120;
                    col_cnt = 128.0f;
                    col_add *= -1.0f;
                }
                if (col_cnt < 0.0f) {
                    end_flag = 1;
                    col_cnt = 0.0f;
                }
            }
            count__2--;
            if (count__2 < 0) {
                count__2 = 0;
            }
            sceVif1PkEnd(&nlPacket, 0);
            sceVif1PkTerminate(&nlPacket);
            iFlushCache(0);
            sceDmaSend(DmaCH1, nlPacket.pBase);
        }
        nl_start_cnt--;
        if (nl_start_cnt < 0) {
            nl_start_cnt = 0;
        }
        sceGsDrawEnv1 *draw = DBuffID != 0 ? &nowloadDB.draw1 : &nowloadDB.draw0;
        sceGsSetHalfOffset(draw, 0x800, 0x800, VSyncField);
        iSyncDCache(&nowloadDB, &nlPacket);
        sceGsSwapDBuff(&nowloadDB, DBuffID);
        DBuffID = !DBuffID;
        sceDmaSync(DmaCH2, 0, 0);
    }
    now_loading_vsync_end = 1;
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/nowload", VSyncCallBack_Load__Fi);
#endif

#ifdef NON_MATCHING
/**
 * Uploads a named image and its palette to video memory and records where they went.
 *
 * @mangled LoadTexture__FPcPUcP8CTextureii
 * @address 0x154770
 * @size 0x1D4
 */
void LoadTexture(char *name, u_char *archive, CTexture *texture, int image_address,
                 int palette_address) {
    SetTextureInfo(texture, name, archive);
    sceGsTex0 *tex0 = (sceGsTex0 *) &texture->tex0;
    sceGsLoadImage load;
    sceGsSetDefLoadImage(&load, (short) image_address, tex0->TBW, tex0->PSM, 0, 0,
                         texture->width, texture->height);
    FlushCache(0);
    sceGsExecLoadImage(&load, texture->image[2]);
    if (texture->bpp == 0) {
        sceGsSetDefLoadImage(&load, (short) palette_address, 1, 0, 0, 0, 8, 2);
    }
    if (texture->bpp == 1) {
        sceGsSetDefLoadImage(&load, (short) palette_address, 1, 0, 0, 0, 16, 16);
    }
    FlushCache(0);
    if (texture->bpp < 2) {
        sceGsExecLoadImage(&load, texture->clut);
    }
    tex0->TBP0 = image_address;
    tex0->bits.tcc = 1;
    tex0->CBP = palette_address;
}
#else
INCLUDE_ASM("asm/nonmatchings/nowload", LoadTexture__FPcPUcP8CTextureii);
#endif

#ifdef NON_MATCHING
/**
 * Uploads one already-located image and its palette to video memory and records where they went.
 *
 * @mangled LoadTexture__FP8TM2_headP8CTextureii
 * @address 0x154950
 * @size 0x1D4
 */
void LoadTexture(TM2_head *image, CTexture *texture, int image_address, int palette_address) {
    SetTextureInfo(texture, "maptitle", image);
    sceGsTex0 *tex0 = (sceGsTex0 *) &texture->tex0;
    sceGsLoadImage load;
    sceGsSetDefLoadImage(&load, (short) image_address, tex0->TBW, tex0->PSM, 0, 0,
                         texture->width, texture->height);
    FlushCache(0);
    sceGsExecLoadImage(&load, texture->image[2]);
    if (texture->bpp == 0) {
        sceGsSetDefLoadImage(&load, (short) palette_address, 1, 0, 0, 0, 8, 2);
    }
    if (texture->bpp == 1) {
        sceGsSetDefLoadImage(&load, (short) palette_address, 1, 0, 0, 0, 16, 16);
    }
    FlushCache(0);
    if (texture->bpp < 2) {
        sceGsExecLoadImage(&load, texture->clut);
    }
    tex0->TBP0 = image_address;
    tex0->bits.tcc = 1;
    tex0->CBP = palette_address;
}
#else
INCLUDE_ASM("asm/nonmatchings/nowload", LoadTexture__FP8TM2_headP8CTextureii);
#endif
INCLUDE_RODATA("asm/nonmatchings/nowload", @388__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @249__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @250__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @251__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @252__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @253);
INCLUDE_RODATA("asm/nonmatchings/nowload", @254__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @255__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @256__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @257__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @258__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @259);
INCLUDE_RODATA("asm/nonmatchings/nowload", @260);
INCLUDE_RODATA("asm/nonmatchings/nowload", @261);
INCLUDE_RODATA("asm/nonmatchings/nowload", @262);
INCLUDE_RODATA("asm/nonmatchings/nowload", @263__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @264__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @265);
INCLUDE_RODATA("asm/nonmatchings/nowload", @266__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @267);
INCLUDE_RODATA("asm/nonmatchings/nowload", @268);
INCLUDE_RODATA("asm/nonmatchings/nowload", @269);
INCLUDE_RODATA("asm/nonmatchings/nowload", @270__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @271);
INCLUDE_RODATA("asm/nonmatchings/nowload", @272);
INCLUDE_RODATA("asm/nonmatchings/nowload", @273);
INCLUDE_RODATA("asm/nonmatchings/nowload", @274);
INCLUDE_RODATA("asm/nonmatchings/nowload", @275);
INCLUDE_RODATA("asm/nonmatchings/nowload", @276);
INCLUDE_RODATA("asm/nonmatchings/nowload", @277);
INCLUDE_RODATA("asm/nonmatchings/nowload", @278);
INCLUDE_RODATA("asm/nonmatchings/nowload", @279);
INCLUDE_RODATA("asm/nonmatchings/nowload", @280);
INCLUDE_RODATA("asm/nonmatchings/nowload", @281);
INCLUDE_RODATA("asm/nonmatchings/nowload", @282);
INCLUDE_RODATA("asm/nonmatchings/nowload", @283);
INCLUDE_RODATA("asm/nonmatchings/nowload", @284__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @285__3);
INCLUDE_RODATA("asm/nonmatchings/nowload", @286__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @287__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @288__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @289__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @290__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @291);
INCLUDE_RODATA("asm/nonmatchings/nowload", @292);
INCLUDE_RODATA("asm/nonmatchings/nowload", @293);
INCLUDE_RODATA("asm/nonmatchings/nowload", @294);
INCLUDE_RODATA("asm/nonmatchings/nowload", @295);
INCLUDE_RODATA("asm/nonmatchings/nowload", @296);
INCLUDE_RODATA("asm/nonmatchings/nowload", @297);
INCLUDE_RODATA("asm/nonmatchings/nowload", @298__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @299__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @300);
INCLUDE_RODATA("asm/nonmatchings/nowload", @301);
INCLUDE_RODATA("asm/nonmatchings/nowload", @302);
INCLUDE_RODATA("asm/nonmatchings/nowload", @303);
INCLUDE_RODATA("asm/nonmatchings/nowload", @304);
INCLUDE_RODATA("asm/nonmatchings/nowload", @305);
INCLUDE_RODATA("asm/nonmatchings/nowload", @306);
INCLUDE_RODATA("asm/nonmatchings/nowload", @307);
INCLUDE_RODATA("asm/nonmatchings/nowload", @308__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @309);
INCLUDE_RODATA("asm/nonmatchings/nowload", @310);
INCLUDE_RODATA("asm/nonmatchings/nowload", @311);
INCLUDE_RODATA("asm/nonmatchings/nowload", @312);
INCLUDE_RODATA("asm/nonmatchings/nowload", @313);
INCLUDE_RODATA("asm/nonmatchings/nowload", @314);
INCLUDE_RODATA("asm/nonmatchings/nowload", @315);
INCLUDE_RODATA("asm/nonmatchings/nowload", @316);
INCLUDE_RODATA("asm/nonmatchings/nowload", @317);
INCLUDE_RODATA("asm/nonmatchings/nowload", @318);
INCLUDE_RODATA("asm/nonmatchings/nowload", @319);
INCLUDE_RODATA("asm/nonmatchings/nowload", @320);
INCLUDE_RODATA("asm/nonmatchings/nowload", @321);
INCLUDE_RODATA("asm/nonmatchings/nowload", @322);
INCLUDE_RODATA("asm/nonmatchings/nowload", @323);
INCLUDE_RODATA("asm/nonmatchings/nowload", @324);
INCLUDE_RODATA("asm/nonmatchings/nowload", @325);
INCLUDE_RODATA("asm/nonmatchings/nowload", @326);
INCLUDE_RODATA("asm/nonmatchings/nowload", @327);
INCLUDE_RODATA("asm/nonmatchings/nowload", @328);
INCLUDE_RODATA("asm/nonmatchings/nowload", @329);
INCLUDE_RODATA("asm/nonmatchings/nowload", @330__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @331__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @332__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @333__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @334__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @335__2);
INCLUDE_RODATA("asm/nonmatchings/nowload", @336);
INCLUDE_RODATA("asm/nonmatchings/nowload", @337);
