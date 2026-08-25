.include "macro.inc"

.include "macro.inc"

.section .bss, "wa"

glabel D_01CF91F0
    /* 01CF91F0 */ .space 0x10

glabel now_load
    /* 01CF9200 */ .space 0x1F40

glabel nowloadDB
    /* 01CFB140 */ .space 0x230

glabel nlPacket
    /* 01CFB370 */ .space 0x20

glabel nl_tex
    /* 01CFB390 */ .space 0x50

glabel nl_tex2
    /* 01CFB3E0 */ .space 0x50

glabel FrameAttr
    /* 01CFB430 */ .space 0x60

glabel bgm_cfg_file
    /* 01CFB490 */ .space 0x20

glabel snd_cfg_file
    /* 01CFB4B0 */ .space 0x20

glabel voice_cfg_file
    /* 01CFB4D0 */ .space 0x20

glabel sp_cfg_file
    /* 01CFB4F0 */ .space 0x20

glabel camera_pos
    /* 01CFB510 */ .space 0x10

glabel camera_dir
    /* 01CFB520 */ .space 0x10

glabel se_seq
    /* 01CFB530 */ .space 0x100

glabel SystemMessage
    /* 01CFB630 */ .space 0x17B8

/* Automatically generated and unreferenced pad */
glabel D_01CFCDE8
    /* 01CFCDE8 */ .space 0x18

glabel mes_data
    /* 01CFCE00 */ .space 0xBB80

glabel mes_buff
    /* 01D08980 */ .space 0x10000

glabel waveAnimeCnt
    /* 01D18980 */ .space 0x80

glabel rd$690
    /* 01D18A00 */ .space 0x4EC

/* Automatically generated and unreferenced pad */
glabel D_01D18EEC
    /* 01D18EEC */ .space 0x04

glabel Fire
    /* 01D18EF0 */ .space 0x40

glabel Candle
    /* 01D18F30 */ .space 0x30

glabel draw_rect
    /* 01D18F60 */ .space 0x10

glabel eb_key
    /* 01D18F70 */ .space 0x700

glabel EdMoveCharaInfo
    /* 01D19670 */ .space 0xB0

glabel sound_src
    /* 01D19720 */ .space 0x220

glabel now_play_se
    /* 01D19940 */ .space 0x10

glabel now_play_se_flag
    /* 01D19950 */ .space 0x10

glabel dof
    /* 01D19960 */ .space 0x1C

/* Automatically generated and unreferenced pad */
glabel D_01D1997C
    /* 01D1997C */ .space 0x04

glabel thd_light
    /* 01D19980 */ .space 0x40

glabel thd_color
    /* 01D199C0 */ .space 0x40

glabel use_item_list
    /* 01D19A00 */ .space 0x80

glabel ibox_pos
    /* 01D19A80 */ .space 0x10

glabel ibox_rot
    /* 01D19A90 */ .space 0x10

glabel frame_image_tex
    /* 01D19AA0 */ .space 0x50

glabel CurrentDir__3
    /* 01D19AF0 */ .space 0x40

glabel mapjump_name
    /* 01D19B30 */ .space 0x80

glabel EdExchangeInfo
    /* 01D19BB0 */ .space 0x1C

/* Automatically generated and unreferenced pad */
glabel D_01D19BCC
    /* 01D19BCC */ .space 0x04

glabel EditMenuStatus
    /* 01D19BD0 */ .space 0x1C

/* Automatically generated and unreferenced pad */
glabel D_01D19BEC
    /* 01D19BEC */ .space 0x04

