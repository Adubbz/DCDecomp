#include "shot_freefuncs.hpp"

#include "cloth.hpp"
#include "clothread.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "texture.hpp"

// Retail brackets the copy with TEXFLUSH; the renderer orders copies and draws itself.
void setItemToReserved(char *page_name, int x, int y, char *item_name, int dsax, int dsay) {
    CTexture *page = TexManager.GetTexture(page_name, -1);
    CTexture *item = TexManager.GetTexture(item_name, -1);

    int sbp = page->tex0 & 0x3FFF;
    int dbp = item->tex0 & 0x3FFF;
    int sbw = (page->tex0 >> 14) & 0x3F;
    int dbw = (item->tex0 >> 14) & 0x3F;

    MoveImageTest(Vif1Packet, sbp, sbw, 0x13, CRect_i_(x, y, 0x20, 0x20), dbp, dbw, 0x13, dsax, dsay, 0);
}
