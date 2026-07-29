.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _sceRpcFreePacket
/* 016FD8 00116ED8 1000838C */  lw          $3, 0x10($4)
/* 016FDC 00116EDC FFFF023C */  lui         $2, (0xFFFFFFFE >> 16)
/* 016FE0 00116EE0 FEFF4234 */  ori         $2, $2, (0xFFFFFFFE & 0xFFFF)
/* 016FE4 00116EE4 180080AC */  sw          $0, 0x18($4)
/* 016FE8 00116EE8 24186200 */  and         $3, $3, $2
/* 016FEC 00116EEC 0800E003 */  jr          $31
/* 016FF0 00116EF0 100083AC */   sw         $3, 0x10($4)
/* 016FF4 00116EF4 00000000 */  nop
