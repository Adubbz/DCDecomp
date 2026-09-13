#include "spritetable.hpp"

INCLUDE_ASM("asm/nonmatchings/spritetable", DrawTable__12CSpriteTableFv);

void CSpriteTable::AddTable(int x, int y, MG_SPRITE *sprite, int list, int flags) {
    if (list < 0) {
        list = 0;
    }
    if (list >= list_count) {
        list = list_count - 1;
    }

    SPRITE_TABLE *node;
    SPRITE_TABLE *(&tail_entries)[16] = tails;
    SPRITE_TABLE **tail = &tail_entries[list];
    node = *tail;
    if (node == NULL) {
        return;
    }

    node->tex0 = sprite->tex0;
    node->x = x;
    node->y = y;
    node->width = sprite->source.width;
    node->height = sprite->source.height;
    node->u = sprite->source.x;
    node->v = sprite->source.y;
    node->u_width = sprite->source.width;
    node->v_height = sprite->source.height;
    node->red = sprite->red;
    node->green = sprite->green;
    node->blue = sprite->blue;
    node->alpha = sprite->alpha;

    if (flags & 1) {
        s16 width = node->width;
        node->x -= width;
    }
    if (flags & 2) {
        s16 height = node->height;
        node->y -= height;
    }
    if (flags & 4) {
        node->x -= (s16) (node->width >> 1);
    }
    if (flags & 8) {
        node->y -= (s16) (node->height >> 1);
    }

    node->next = GetNext();
    *tail = node->next;
}

void CSpriteTable::AddTable(int x, int y, sceGsTex0 *tex0, RECT *source, int list, int flags) {
    union {
        MG_SPRITE sprite;
        u_long128 padding[3];
    } local;

    *(sceGsTex0 *) &local.sprite.tex0 = *tex0;
    local.sprite.source = *source;
    local.sprite.red = 128;
    local.sprite.green = 128;
    local.sprite.blue = 128;
    local.sprite.alpha = 128;
    AddTable(x, y, &local.sprite, list, flags);
}

void CSpriteTable::Initialize(SPRITE_TABLE *new_pool, int count, int lists) {
    list_count = lists;
    if (list_count > 16) {
        list_count = 16;
    }
    pool = new_pool;
    pool_count = count;
    end = new_pool + count;
    ClearPointer();
}

SPRITE_TABLE *CSpriteTable::GetNext() {
    SPRITE_TABLE *next = NULL;

    if ((u_int) current < (u_int) end) {
        next = current;
        current++;
    }
    return next;
}

void CSpriteTable::ClearPointer() {
    current = pool;
    for (int list = 0; list < list_count; list++) {
        heads[list] = GetNext();
        heads[list]->next = NULL;
        tails[list] = heads[list];
    }
}
