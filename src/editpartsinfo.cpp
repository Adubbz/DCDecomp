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
        parts[plot].placed = 0;
    }
}

void CEditPartsInfo::Save(int georama_no, CSaveData *save_data) {
    int plot;
    SV_GEORAMA_DATA *georama = save_data->GetGrdData(georama_no);
    if (georama == NULL) {
        return;
    }

    georama->request_count = parts_max;
    for (plot = 0; plot < 24; plot++) {
        georama->request_complete[plot] = request[plot];
        SV_EDIT_PARTS_INFO *saved_part = save_data->GetEditPartsInfo(georama_no, plot);
        if (saved_part == NULL) {
            continue;
        }
        saved_part->flag = parts[plot].unk_08;
        saved_part->part_id = parts[plot].completion_flags;
        saved_part->unk_6 = parts[plot].placed;
        saved_part->progress = parts[plot].stock;
        for (int element = 0; element < 6; element++) {
            saved_part->npc_slot[element] = parts[plot].elements[element].enabled;
        }
    }
}

void CEditPartsInfo::Load(int georama_no, CSaveData *save_data, int load_requests) {
    int plot;

    if (georama_no < 0 || georama_no >= 6) {
        return;
    }
    Initialize(georama_no);
    SV_GEORAMA_DATA *georama = save_data->GetGrdData(georama_no);
    if (georama == NULL) {
        return;
    }
    if (load_requests != 0) {
        parts_max = georama->request_count;
    }
    for (plot = 0; plot < 24; plot++) {
        SV_EDIT_PARTS_INFO *saved_part = save_data->GetEditPartsInfo(georama_no, plot);
        if (saved_part == NULL) {
            continue;
        }
        parts[plot].unk_08 = saved_part->flag;
        parts[plot].completion_flags = saved_part->part_id;
        if (load_requests != 0) {
            parts[plot].placed = saved_part->unk_6;
            request[plot] = georama->request_complete[plot];
        }
        if (saved_part->progress > 0) {
            parts[plot].stock = saved_part->progress;
        }
        for (int element = 0; element < 6; element++) {
            parts[plot].elements[element].enabled = saved_part->npc_slot[element];
        }
    }
}

void CEditPartsInfo::Initialize(int georama_no) {
    int plot;
    int name;
    char **names;
    int element;
    EDIT_PARTS_ATRA *source;
    EDIT_PARTS_ATRA empty_part;

    memset(&empty_part, 0, sizeof(empty_part));
    for (element = 0; element < 6; element++) {
        empty_part.elements[element].unk_04 = -1;
    }

    unk_1624 = 0;
    for (plot = 0; plot < 24; plot++) {
        if (georama_no < 0 || georama_no >= 6) {
            source = &empty_part;
        } else {
            source = GetEditAtraPartsData(georama_no, plot);
        }
        parts[plot].parts_no = plot;
        parts[plot].unk_08 = 0;
        parts[plot].completion_flags = 0;
        parts[plot].stock = source->max;
        parts[plot].placed = 0;
        parts[plot].unk_10 = source->unk_08;
        parts[plot].kind = source->kind;
        for (element = 0; element < 6; element++) {
            parts[plot].elements[element].id = source->elements[element].id;
            parts[plot].elements[element].unk_04 = source->elements[element].unk_04;
            parts[plot].elements[element].enabled = 0;
            names = parts[plot].elements[element].names;
            names[0] = NULL;
            for (name = 0; name < 4; name++) {
                names[name] = NULL;
                if (source->elements[element].names[name] != NULL &&
                    source->elements[element].names[name][0] != '\0') {
                    names[name] = source->elements[element].names[name];
                }
            }
            parts[plot].elements[element].unk_1C = source->elements[element].unk_18;
        }
    }
}

void CEditPartsInfo::Initialize(int index, EPARTS_INFO_HEADER *header) {
    parts[index].parts_no = index;
    parts[index].unk_08 = 0;
    parts[index].completion_flags = 0;
    parts[index].placed = 0;
    for (int element = 0; element < 6; element++) {
    }
    parts[index].width = header->width;
    parts[index].height = header->height;
    parts[index].header = header;
}
