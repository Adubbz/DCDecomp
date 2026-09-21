#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "editpartsinfo.hpp"

#include <cstring>

#include "editatra.hpp"
#include "savedata.hpp"

/**
 * Reports whether an editable part is placed and still has work available.
 *
 * @mangled CheckPartsInfo__FP14EDITPARTS_INFO
 * @address 0x199F90
 * @size 0x3C
 */
int CheckPartsInfo(EDITPARTS_INFO *info);

CEditPartsInfo EditPartsInfo;

EDITPARTS_INFO *CEditPartsInfo::GetPartsInfo(int index) {
    if ((index < 0) || (index >= 0x18)) {
        return NULL;
    }
    return &parts[index];
}
int CEditPartsInfo::CheckComplete(int index) {
    EDITPARTS_INFO *info = GetPartsInfo(index);

    if (info == NULL) {
        return 0;
    }
    for (int i = 0; i < 6; i++) {
        // A negative identifier is an unused slot, so it asks for nothing.
        if (info->elements[i].id >= 0 && info->elements[i].enabled == 0) {
            return 0;
        }
    }
    return 1;
}

void CEditPartsInfo::SetCompEvent(int index, int completed) {
    EDITPARTS_INFO *info = GetPartsInfo(index);
    if (info != NULL) {
        if (completed != 0) {
            info->completion_flags |= 1;
            return;
        }
        info->completion_flags &= ~1;
    }
}

int CEditPartsInfo::GetCompEvent(int index) {
    EDITPARTS_INFO *info = GetPartsInfo(index);
    if (info == NULL) {
        return 0;
    }
    return (info->completion_flags & 1) != 0;
}

int CEditPartsInfo::GetRequest(int index) {
    if (index < 0 || index >= 24) {
        return 0;
    }
    return request[index];
}
int CEditPartsInfo::GetNextPartsNum(int index) {
    int remaining = 0;

    for (int i = index + 1; i < 24; i++) {
        EDITPARTS_INFO *info = GetPartsInfo(i);
        if (info == NULL) {
            break;
        }
        if (CheckPartsInfo(info) != 0) {
            remaining++;
        }
    }
    return remaining;
}

int CEditPartsInfo::GetNextParts(int index) {
    for (;;) {
        index++;
        EDITPARTS_INFO *info = GetPartsInfo(index);
        if (info != NULL) {
            if (CheckPartsInfo(info) != 0) {
                return index;
            }
        } else {
            return -1;
        }
    }
}

void CEditPartsInfo::Clear(void) {
    for (int plot = 0; plot < 24; plot++) {
        parts[plot].unk_0C = 0;
    }
}

void CEditPartsInfo::Save(int georama_no, CSaveData *save_data) {
    int plot;
    SV_GEORAMA_DATA *georama = save_data->GetGrdData(georama_no);
    if (georama == NULL) {
        return;
    }

    georama->request_count = unk_00;
    for (plot = 0; plot < 24; plot++) {
        georama->request_complete[plot] = request[plot];
        SV_EDIT_PARTS_INFO *saved_part = save_data->GetEditPartsInfo(georama_no, plot);
        if (saved_part == NULL) {
            continue;
        }
        saved_part->flag = parts[plot].unk_08;
        saved_part->part_id = parts[plot].completion_flags;
        saved_part->unk_6 = parts[plot].unk_0C;
        saved_part->progress = parts[plot].unk_18;
        for (int element = 0; element < 6; element++) {
            saved_part->npc_slot[element] = parts[plot].elements[element].enabled;
        }
    }
}

#ifdef NON_MATCHING
void CEditPartsInfo::Load(int georama_no, CSaveData *save_data, int load_requests) {
    if (georama_no < 0 || georama_no >= 6) {
        return;
    }
    Initialize(georama_no);
    SV_GEORAMA_DATA *georama = save_data->GetGrdData(georama_no);
    if (georama == NULL) {
        return;
    }
    if (load_requests != 0) {
        unk_00 = georama->request_count;
    }
    for (int plot = 0; plot < 24; plot++) {
        SV_EDIT_PARTS_INFO *saved_part = save_data->GetEditPartsInfo(georama_no, plot);
        if (saved_part == NULL) {
            continue;
        }
        EDITPARTS_INFO &part = parts[plot];
        part.unk_08 = saved_part->flag;
        part.completion_flags = saved_part->part_id;
        if (load_requests != 0) {
            part.unk_0C = saved_part->unk_6;
            request[plot] = georama->request_complete[plot];
        }
        if (saved_part->progress > 0) {
            part.unk_18 = saved_part->progress;
        }
        for (int element = 0; element < 6; element++) {
            part.elements[element].enabled = saved_part->npc_slot[element];
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Load__14CEditPartsInfoFiP9CSaveDatai);
#endif

#ifdef NON_MATCHING
void CEditPartsInfo::Initialize(int georama_no) {
    EDIT_PARTS_ATRA empty_part;
    memset(&empty_part, 0, sizeof(empty_part));
    for (int element = 0; element < 6; element++) {
        empty_part.elements[element].id = -1;
    }

    unk_1624[0] = 0;
    for (int plot = 0; plot < 24; plot++) {
        EDIT_PARTS_ATRA *source = &empty_part;
        if (georama_no >= 0 && georama_no < 6) {
            source = GetEditAtraPartsData(georama_no, plot);
        }
        EDITPARTS_INFO &part = parts[plot];
        part.parts_no = plot;
        part.unk_08 = 0;
        part.completion_flags = 0;
        part.unk_18 = source->max;
        part.unk_0C = 0;
        part.unk_10 = source->unk_08;
        part.kind = source->kind;
        for (int element = 0; element < 6; element++) {
            EDITPARTS_ELEMENT &destination = part.elements[element];
            EDIT_PARTS_ELEMENT_ATRA &definition = source->elements[element];
            destination.id = definition.id;
            destination.unk_04 = definition.unk_04;
            destination.enabled = 0;
            for (int name = 0; name < 4; name++) {
                destination.names[name] = NULL;
                if (definition.names[name] != NULL && definition.names[name][0] != '\0') {
                    destination.names[name] = definition.names[name];
                }
            }
            destination.unk_1C = definition.unk_18;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Initialize__14CEditPartsInfoFi);
#endif

#ifdef NON_MATCHING
void CEditPartsInfo::Initialize(int index, EPARTS_INFO_HEADER *header) {
    EDITPARTS_INFO &part = parts[index];
    part.parts_no = index;
    part.unk_08 = 0;
    part.completion_flags = 0;
    part.unk_0C = 0;
    for (int element = 0; element < 6; element++) {
    }
    part.width = header->width;
    part.height = header->height;
    part.header = header;
}
#else
INCLUDE_ASM("asm/nonmatchings/editpartsinfo", Initialize__14CEditPartsInfoFiP18EPARTS_INFO_HEADER);
#endif
