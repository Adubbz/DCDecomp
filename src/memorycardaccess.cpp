#include "memorycardaccess.hpp"

#include <cstdio>
#include <cstring>

#include "menu_draw.hpp"
#include "savedata.hpp"

void InitSaveFileInfoTbl() {
    for (int i = 0; i < MC_DIR_ENTRY_MAX; i++) {
        memset(&SaveFileInfo[i], 0, sizeof(SaveFileInfo[i]));
        SaveFileInfo[i].name[0] = 0;
    }
}

int GetOpenAttribute(char *name) {
    for (int i = 0; i < MC_DIR_ENTRY_MAX; i++) {
        char *entry = SaveFileInfo[i].name;
        if (strcmp(name, entry) == 0) {
            printf("same file existed!!!!!!\n");
            return 1;
        }
    }
    return 0;
}
void CMemoryCardAccess::Initialize() {
    switch (GetMenuLangFlag()) {
        case 0:
            strcpy(this->dir_name, "BISCPS-15004dkcloud");
            break;
        case 1:
        default:
            strcpy(this->dir_name, "BASCUS-97111dkcloud");
            break;
    }
    strcpy(this->file_name, "darkcloud");
    for (int i = 0; i < 0x40; i++) {
        this->current_dir[i] = 0;
    }
    this->port = 0;
    this->file_no = 0;
    this->fd = -1;
    memset(&this->error, 0, sizeof(this->error));
    this->SetVersion("darkcloudVer1.9");
    this->func_no = MC_OPERATION_IDLE;
    this->unk_E0 = 0x3D;
    this->step = 0;
    this->save_buffer = NULL;
    this->unk_D8 = NULL;
    this->read_buffer = NULL;
    this->dir_table = SaveFileInfo;
    this->transferred = 0;
    this->transfer_size = 0;
    memset(this->card, 0, sizeof(this->card));
    memset(this->file_info, 0, sizeof(this->file_info));
    memset(&this->icon, 0, sizeof(this->icon));
    this->card[0].present = 1;
    this->card[1].present = 1;
    printf("SaveData size = %d\n", sizeof(CSaveData));
}
int CMemoryCardAccess::InitForMC() {
    int status = sceMcInit();
    this->Initialize();
    InitSaveFileInfoTbl();

    int result;
    switch (status) {
        case 0:
            printf("Memory Card Initialized Successed!!\n\n\n\n");
            result = 0;
            break;
        case -101:
            result = 1;
            printf("Initialized Failed!!\n");
            break;
        case -120:
            result = 1;
            printf("mcserv.irx is old file\n");
            break;
        case -121:
            result = 1;
            printf("mcman.irx is old file \n");
            break;
    }
    return result;
}
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SetBuff__17CMemoryCardAccessFPc);

void CMemoryCardAccess::SetIconData(MC_ICON_DATA *icon) {
    memcpy(&this->icon.view, &icon->view, sizeof(MC_ICON_FILE));
    memcpy(&this->icon.copy, &icon->copy, sizeof(MC_ICON_FILE));
    memcpy(&this->icon.del, &icon->del, sizeof(MC_ICON_FILE));
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", MakeMcIconSysInfo__17CMemoryCardAccessFv);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @404);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @405__2);

void CMemoryCardAccess::SetFuncNo(int func_no) {
    this->func_no = func_no;
    this->step = 0;
    if (func_no == MC_OPERATION_IDLE) {
        this->unk_E0 = 0x3D;
    }
    sceMcSync(MC_NOWAIT, NULL, NULL);
}

int CMemoryCardAccess::GetFuncNo() {
    return this->func_no;
}

int CMemoryCardAccess::Step() {
    int result;
    int target_file;

    result = 0;
    switch (func_no) {
        case MC_OPERATION_SEARCH_TYPE:
            result = SearchMcType();
            break;
        case MC_OPERATION_GET_DIR:
            result = GetDir();
            break;
        case MC_OPERATION_MAKE_DIR:
            result = MakeDir();
            break;
        case MC_OPERATION_GET_ALL_SAVE_FILE_INFO:
            result = GetAllSaveFileInfo();
            break;
        case MC_OPERATION_SAVE:
            result = SaveToMc(file_no);
            break;
        case MC_OPERATION_LOAD:
            result = LoadFromMc(file_no);
            break;
        case MC_OPERATION_FORMAT:
            result = FormatForMc();
            break;
        case MC_OPERATION_UNFORMAT:
            result = McUnFormatForDebug();
            break;
        case MC_OPERATION_DELETE:
            if (error.code == 0) {
                target_file = file_no;
            } else {
                target_file = error.file_no;
            }
            result = DeleteFile(target_file);
            break;
        case MC_OPERATION_LOAD_CONFIG:
            result = LoadSysConfig();
            break;
        case MC_OPERATION_SAVE_CONFIG:
            result = SaveSysConfig();
            break;
        case MC_OPERATION_WRITE_TEST:
            result = Write();
            break;
        case MC_OPERATION_CONVERT:
            result = Convert();
            break;
    }
    if (result == 1) {
        step = 0;
        SetFuncNo(MC_OPERATION_IDLE);
    } else {
        McError(result);
    }
    return result;
}

void CMemoryCardAccess::SetVersion(char *version) {
    strcpy(this->version, version);
}

char *CMemoryCardAccess::GetVersion() {
    return this->version;
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SearchMcType__17CMemoryCardAccessFv);

int CMemoryCardAccess::GetDir() {
    MC_CARD_INFO *card;
    char name[0x40];
    char path[0x40];
    char dir[0x80];
    char pattern[0x48];
    int cmd;
    int result;

    card = &this->card[this->port];
    switch (this->step) {
        case 0:
            strcpy(name, this->dir_name);
            strcpy(path, "/");
            strcat(path, this->dir_name);
            InitSaveFileInfoTbl();
            card->dir_exists = 0;
            this->step++;
            break;
        case 1:
            strcpy(dir, "/");
            strcat(dir, this->dir_name);
            if (sceMcChdir(this->port, 1, dir, this->current_dir) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 2:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 0xC) {
                return -1;
            }
            if (result < 0) {
                if (result == -4 || result == -2) {
                    return 1;
                }
                if (result < -9) {
                    return -1;
                }
            }
            card->dir_exists = 1;
            result = 0;
            strcpy(pattern, this->file_name);
            strcat(pattern, "*");
            if (sceMcGetDir(this->port, 1, pattern, 0, 15, SaveFileInfo) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 3:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 0xD || (cmd == 0xD && result < 0)) {
                return -1;
            }
            card->dir_entries = result;
            return 1;
    }
    return 0;
}

int CMemoryCardAccess::LoadSysConfig() {
    int port;
    int cmd;
    int result;
    int i;

    port = this->port;
    switch (this->step) {
        case 0:
            if (sceMcOpen(port, 1, this->dir_name, 1) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 1:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 2 || (cmd == 2 && result < 0)) {
                return -1;
            }
            this->fd = result;
            this->transfer_size = 0x40;
            memset(&sys_config, 0, this->transfer_size + 0x40);
            sys_config.values[17] = 1;
            this->transferred = 0;
            if (sceMcRead(this->fd, &sys_config, this->transfer_size) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 2:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 5 || (cmd == 5 && result < 0)) {
                return -1;
            }
            this->transferred += result;
            if (this->transferred < this->transfer_size) {
                break;
            }
            if (sceMcClose(this->fd) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 3:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 3 || (cmd == 3 && result < 0)) {
                return -1;
            }
            if (SaveData->InvertConfig(&sys_config) != 0) {
                for (i = 0; i < 12; i++) {
                }
            }
            return 1;
    }
    return 0;
}

int CMemoryCardAccess::SaveSysConfig() {
    int port;
    int i;
    int cmd;
    int result;

    port = this->port;
    switch (this->step) {
        case 0:
            if (sceMcOpen(port, 1, this->dir_name, 2) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 1:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 2 || (cmd == 2 && result < 0)) {
                return -1;
            }
            this->fd = result;
            this->fd = result;
            this->transferred = 0;
            this->transfer_size = 0x40;
            for (i = 0; i < 18; i++) {
                printf("config%d = %d\n", i, sys_config.values[i]);
            }
            if (sceMcWrite(this->fd, &sys_config, this->transfer_size) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 2:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 6 || (cmd == 6 && result < 0)) {
                return -1;
            }
            this->transferred += result;
            if (this->transferred < this->transfer_size) {
                break;
            }
            if (sceMcFlush(this->fd) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 3:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 0xA || (cmd == 0xA && result < 0)) {
                return -1;
            }
            if (sceMcClose(this->fd) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 4:
            if (sceMcSync(MC_NOWAIT, &cmd, &result) == 0) {
                break;
            }
            if (cmd != 3 || (cmd == 3 && result < 0)) {
                return -1;
            }
            return 1;
    }
    return 0;
}

int CMemoryCardAccess::Write() {
    char buffer[0x198];
    int result;
    int cmd;

    result = 0;
    sceMcChdir(this->port, 1, "/", NULL);
    sceMcSync(MC_WAIT, &cmd, &result);
    sceMcOpen(this->port, 1, "test", 0x202);
    sceMcSync(MC_WAIT, &cmd, &result);
    this->fd = result;
    sceMcWrite(this->fd, buffer, 0x76F800);
    sceMcSync(MC_WAIT, &cmd, &result);
    sceMcFlush(this->fd);
    sceMcSync(MC_WAIT, &cmd, &result);
    sceMcClose(this->fd);
    sceMcSync(MC_WAIT, &cmd, &result);
    return 1;
}

int CMemoryCardAccess::Convert() {
    int result;
    int cmd;
    char src_name[0x80];
    char dst_name[0x80];
    char buffer[0x19000];
    int i;
    int fd;

    sceMcChdir(this->port, 1, "/", "");
    sceMcSync(MC_WAIT, &cmd, &result);
    printf("move to dir\n");
    while (this->MakeDir() == 0) {
    }
    printf("create new dir\n");
    for (i = 0; i < MC_SAVE_FILE_MAX; i++) {
        strcpy(src_name, "BASCUS-97112dkcloud/");
        strcat(src_name, this->file_name);
        strcat(src_name, "%d");
        sprintf(src_name, src_name, i);
        strcpy(dst_name, "BASCUS-97111dkcloud/");
        strcat(dst_name, this->file_name);
        strcat(dst_name, "%d");
        sprintf(dst_name, dst_name, i);
        if (sceMcOpen(this->port, 1, src_name, 1) != 0) {
            continue;
        }
        sceMcSync(MC_WAIT, &cmd, &result);
        if (cmd != 2 || (cmd == 2 && result < 0)) {
            continue;
        }
        fd = result;
        printf("fname = %s\n", src_name);
        memset(this->unk_D8, 0, 0x136E7);
        sceMcRead(fd, this->unk_D8, 0x136A7);
        sceMcSync(MC_WAIT, &cmd, &result);
        sceMcClose(fd);
        sceMcSync(MC_WAIT, &cmd, &result);
        if (sceMcOpen(this->port, 1, dst_name, 0x202) != 0) {
            continue;
        }
        sceMcSync(MC_WAIT, &cmd, &result);
        if (cmd != 2 || (cmd == 2 && result < 0)) {
            continue;
        }
        fd = result;
        printf("fname = %s\n", dst_name);
        memset(buffer, 0, 0x136E7);
        sceMcWrite(fd, this->unk_D8, 0x136A7);
        sceMcSync(MC_WAIT, &cmd, &result);
        sceMcFlush(fd);
        sceMcSync(MC_WAIT, &cmd, &result);
        printf("save %d\n", i);
        sceMcClose(fd);
        sceMcSync(MC_WAIT, &cmd, &result);
    }
    return 1;
}

INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @814);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @815__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @816);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", MakeDir__17CMemoryCardAccessFv);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", GetSaveFileInfoFromMc__17CMemoryCardAccessFi);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @892__5);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @893__4);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @894__4);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1031);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1032__2);

int CMemoryCardAccess::GetAllSaveFileInfo() {
    int result;
    int file_no;
    int status;

    switch (this->step) {
        case 0:
            if (sceMcSync(MC_NOWAIT, NULL, &result) == 0) {
                break;
            }
            this->step++;
            memset(this->file_info, 0, sizeof(this->file_info));
        default:
            file_no = (this->step - 1) >> 2;
            status = this->GetSaveFileInfoFromMc(file_no);
            if (status == 1 && file_no + 1 >= MC_SAVE_FILE_MAX) {
                return 1;
            }
            if (status < 0) {
                return -1;
            }
            break;
    }
    return 0;
}

int CMemoryCardAccess::CheckFileNo(int file_no) {
    char name[0x20];

    if (file_no < 0) {
        return 0;
    }
    strcpy(name, this->file_name);
    strcat(name, "%d");
    sprintf(name, name, file_no);
    return GetOpenAttribute(name);
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", SaveToMc__17CMemoryCardAccessFi);
INCLUDE_ASM("asm/nonmatchings/memorycardaccess", LoadFromMc__17CMemoryCardAccessFi);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1090__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1091);

int CMemoryCardAccess::FormatForMc() {
    int result;
    MC_CARD_INFO *card;
    int cmd;
    int status;

    result = 0;
    card = &this->card[this->port];
    switch (this->step) {
        case 0:
            if (sceMcFormat(this->port, 1) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 1:
            if (sceMcSync(MC_NOWAIT, &cmd, &status) == 0) {
                break;
            }
            if (cmd != 0x10) {
                break;
            }
            if (status < 0) {
                printf("format failed\n");
                return -1;
            }
            printf("format finished\n");
            this->step++;
            break;
        case 2:
            if (sceMcGetInfo(this->port, 1, &card->type, &card->free_size, &card->formatted) == 0) {
                this->step++;
            } else {
                return -1;
            }
            break;
        case 3:
            if (sceMcSync(MC_NOWAIT, &cmd, &status) == 0) {
                break;
            }
            if (cmd != 1) {
                return -1;
            }
            card->present = 1;
            if (status < -9) {
                card->present = 0;
            }
            card->result = status;
            result = 1;
            break;
    }
    return result;
}

INCLUDE_ASM("asm/nonmatchings/memorycardaccess", DeleteFile__17CMemoryCardAccessFi);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1141__2);
INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @1142__2);

int CMemoryCardAccess::GetMsgNo(int msg_no) {
    int result = 0;

    switch (this->GetFuncNo()) {
        case MC_OPERATION_GET_DIR:
            result = msg_no + 5;
            break;
        case MC_OPERATION_MAKE_DIR:
            result = msg_no + 11;
            break;
        case MC_OPERATION_GET_ALL_SAVE_FILE_INFO:
            result = msg_no + 5;
            break;
        case MC_OPERATION_SAVE:
        case MC_OPERATION_SAVE_CONFIG:
            result = msg_no + 11;
            break;
        case MC_OPERATION_LOAD:
        case MC_OPERATION_LOAD_CONFIG:
            result = msg_no + 21;
            break;
        case MC_OPERATION_FORMAT:
            result = msg_no + 35;
            break;
        case MC_OPERATION_UNFORMAT:
            result = msg_no + 39;
            break;
        case MC_OPERATION_DELETE:
            result = msg_no + 41;
            break;
        case 8:
            result = msg_no + 43;
            break;
    }
    return result;
}

int CMemoryCardAccess::McError(int result) {
    MC_ERROR_INFO *info = &this->error;

    switch (result) {
        case -2:
        case -12:
            printf("mc is unformat\n");
            info->code = 6;
            break;
        case -3:
            printf("memory is over or noting, break!\n");
            info->code = 4;
            break;
        case -4:
            printf("file not open or not exist\n");
            break;
        case -5:
            printf("not open by write mode \n");
            break;
        case -8:
            printf("write failed\n");
            break;
    }
    if (result < -10) {
        info->code = 7;
        printf("not memory card or (read write)error = %d\n", result);
    }
    if (result < 0) {
        printf("result = %d\n", result);
        info->func_no = this->GetFuncNo();
        info->step = this->step;
        printf("func = %d\n", info->func_no);
        printf("phase = %d\n", info->step);
        info->file_no = this->file_no;
    }
    return 0;
}

void CMemoryCardAccess::DmySync() {
    int cmd;
    int result;
    int running;

    running = 0;
    while (running == 0) {
        running = sceMcSync(MC_WAIT, &cmd, &result);
    }
}

int CMemoryCardAccess::McUnFormatForDebug() {
    int result;
    int cmd;
    int status;

    switch (this->step) {
        case 0:
            result = sceMcUnformat(this->port, 1);
            if (result == 0) {
                this->step++;
            } else {
                sceMcSync(MC_NOWAIT, &result, &status);
                printf("dmy sync\n");
            }
            break;
        case 1:
            result = sceMcSync(MC_NOWAIT, &cmd, &status);
            if (result == 0) {
                break;
            }
            if (cmd != 0x11) {
                break;
            }
            if (cmd == 0x11 && status < 0) {
                break;
            }
            this->card[this->port].formatted = 0;
            return 1;
    }
    return 0;
}

INCLUDE_RODATA("asm/nonmatchings/memorycardaccess", @594__2);
