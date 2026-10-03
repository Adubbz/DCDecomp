#include "common.h"

#include <libvu0.h>

#include <cstring>

#include "edit.hpp"
#include "editground.hpp"
#include "editloop3.hpp"
#include "editpartsinfo.hpp"

// Retail's EdInitToEPInfo lays the cell map and names out 0x78 bytes in, past its own header; the
// host header is 0xA0 bytes, so 0x78 lands on its element names and function table. They start past
// the host's header instead.
int EdInitToEPInfo(INIT_PARTSINFO *init, EPARTS_INFO_HEADER *header) {
    header->header_size = sizeof(EPARTS_INFO_HEADER);
    header->width = init->width;
    header->height = init->height;
    header->kind = init->kind;
    header->cell = NULL;

    for (int i = 0; i < 6; i++) {
        header->element_id[i] = init->element_id[i];
        header->element_name[i] = NULL;
    }

    u8 *write = (u8 *) header + header->header_size;
    header->cell = write;

    for (int i = 0; i < header->width * header->height; i++) {
        *write++ = init->cell[i][0];
    }

    for (int i = 0; i < 6; i++) {
        header->element_name[i] = (char *) write;
        strcpy((char *) write, init->element_name[i]);
        write += strlen(init->element_name[i]);
        *write++ = '\0';
        *write++ = '\0';
    }

    header->data_size = write - (u8 *) header;
    return header->data_size;
}
