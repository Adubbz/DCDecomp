.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceRpcFreePacket
/* 16FD8 00116ED8 1000838C */  lw         $3, 0x10($4)
/* 16FDC 00116EDC FFFF023C */  lui        $2, (0xFFFFFFFE >> 16)
/* 16FE0 00116EE0 FEFF4234 */  ori        $2, $2, (0xFFFFFFFE & 0xFFFF)
/* 16FE4 00116EE4 180080AC */  sw         $0, 0x18($4)
/* 16FE8 00116EE8 24186200 */  and        $3, $3, $2
/* 16FEC 00116EEC 0800E003 */  jr         $31
/* 16FF0 00116EF0 100083AC */   sw        $3, 0x10($4)
/* 16FF4 00116EF4 00000000 */  nop
