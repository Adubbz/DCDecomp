.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 34CC0 00134BC0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 34CC4 00134BC4 8000BF7F */  sq         $31, 0x80($sp)
/* 34CC8 00134BC8 7000B77F */  sq         $23, 0x70($sp)
/* 34CCC 00134BCC 6000B67F */  sq         $22, 0x60($sp)
/* 34CD0 00134BD0 5000B57F */  sq         $21, 0x50($sp)
/* 34CD4 00134BD4 4000B47F */  sq         $20, 0x40($sp)
/* 34CD8 00134BD8 3000B37F */  sq         $19, 0x30($sp)
/* 34CDC 00134BDC 2000B27F */  sq         $18, 0x20($sp)
/* 34CE0 00134BE0 1000B17F */  sq         $17, 0x10($sp)
/* 34CE4 00134BE4 0000B07F */  sq         $16, 0x0($sp)
/* 34CE8 00134BE8 28BE8070 */  paddub     $23, $4, $0
/* 34CEC 00134BEC 28B6A070 */  paddub     $22, $5, $0
/* 34CF0 00134BF0 28AEC070 */  paddub     $21, $6, $0
/* 34CF4 00134BF4 28A6E070 */  paddub     $20, $7, $0
/* 34CF8 00134BF8 289E0071 */  paddub     $19, $8, $0
/* 34CFC 00134BFC 28962071 */  paddub     $18, $9, $0
/* 34D00 00134C00 288E4071 */  paddub     $17, $10, $0
/* 34D04 00134C04 28866071 */  paddub     $16, $11, $0
/* 34D08 00134C08 2826C072 */  paddub     $4, $22, $0
/* 34D0C 00134C0C 0A83040C */  jal        sceVif1PkTerminate
/* 34D10 00134C10 00000000 */   nop
/* 34D14 00134C14 0000C58E */  lw         $5, 0x0($22)
/* 34D18 00134C18 2826E072 */  paddub     $4, $23, $0
/* 34D1C 00134C1C 2836A072 */  paddub     $6, $21, $0
/* 34D20 00134C20 283E8072 */  paddub     $7, $20, $0
/* 34D24 00134C24 28466072 */  paddub     $8, $19, $0
/* 34D28 00134C28 284E4072 */  paddub     $9, $18, $0
/* 34D2C 00134C2C 28562072 */  paddub     $10, $17, $0
/* 34D30 00134C30 285E0072 */  paddub     $11, $16, $0
/* 34D34 00134C34 00D4040C */  jal        DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 34D38 00134C38 00000000 */   nop
/* 34D3C 00134C3C 28864070 */  paddub     $16, $2, $0
/* 34D40 00134C40 2826C072 */  paddub     $4, $22, $0
/* 34D44 00134C44 282E4070 */  paddub     $5, $2, $0
/* 34D48 00134C48 DE83040C */  jal        sceVif1PkReserve
/* 34D4C 00134C4C 00000000 */   nop
/* 34D50 00134C50 28160072 */  paddub     $2, $16, $0
/* 34D54 00134C54 8000BF7B */  lq         $31, 0x80($sp)
/* 34D58 00134C58 7000B77B */  lq         $23, 0x70($sp)
/* 34D5C 00134C5C 6000B67B */  lq         $22, 0x60($sp)
/* 34D60 00134C60 5000B57B */  lq         $21, 0x50($sp)
/* 34D64 00134C64 4000B47B */  lq         $20, 0x40($sp)
/* 34D68 00134C68 3000B37B */  lq         $19, 0x30($sp)
/* 34D6C 00134C6C 2000B27B */  lq         $18, 0x20($sp)
/* 34D70 00134C70 1000B17B */  lq         $17, 0x10($sp)
/* 34D74 00134C74 0000B07B */  lq         $16, 0x0($sp)
/* 34D78 00134C78 9000BD27 */  addiu      $sp, $sp, 0x90
/* 34D7C 00134C7C 0800E003 */  jr         $31
/* 34D80 00134C80 00000000 */   nop
/* 34D84 00134C84 00000000 */  nop
/* 34D88 00134C88 00000000 */  nop
/* 34D8C 00134C8C 00000000 */  nop
