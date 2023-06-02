.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__6CFrameFv
/* 27E70 00127D70 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 27E74 00127D74 1000BF7F */  sq         $31, 0x10($sp)
/* 27E78 00127D78 0000B07F */  sq         $16, 0x0($sp)
/* 27E7C 00127D7C 28868070 */  paddub     $16, $4, $0
/* 27E80 00127D80 400280AC */  sw         $0, 0x240($4)
/* 27E84 00127D84 01000224 */  addiu      $2, $0, 0x1
/* 27E88 00127D88 440282AC */  sw         $2, 0x244($4)
/* 27E8C 00127D8C 400180AC */  sw         $0, 0x140($4)
/* 27E90 00127D90 3C0180AC */  sw         $0, 0x13C($4)
/* 27E94 00127D94 380180AC */  sw         $0, 0x138($4)
/* 27E98 00127D98 100180AC */  sw         $0, 0x110($4)
/* 27E9C 00127D9C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 27EA0 00127DA0 1C0282AC */  sw         $2, 0x21C($4)
/* 27EA4 00127DA4 180282AC */  sw         $2, 0x218($4)
/* 27EA8 00127DA8 140282AC */  sw         $2, 0x214($4)
/* 27EAC 00127DAC 100282AC */  sw         $2, 0x210($4)
/* 27EB0 00127DB0 2C0280AC */  sw         $0, 0x22C($4)
/* 27EB4 00127DB4 280280AC */  sw         $0, 0x228($4)
/* 27EB8 00127DB8 240280AC */  sw         $0, 0x224($4)
/* 27EBC 00127DBC 200280AC */  sw         $0, 0x220($4)
/* 27EC0 00127DC0 3C0280AC */  sw         $0, 0x23C($4)
/* 27EC4 00127DC4 380280AC */  sw         $0, 0x238($4)
/* 27EC8 00127DC8 340280AC */  sw         $0, 0x234($4)
/* 27ECC 00127DCC 300280AC */  sw         $0, 0x230($4)
/* 27ED0 00127DD0 180080AC */  sw         $0, 0x18($4)
/* 27ED4 00127DD4 140080AC */  sw         $0, 0x14($4)
/* 27ED8 00127DD8 100080AC */  sw         $0, 0x10($4)
/* 27EDC 00127DDC 280080AC */  sw         $0, 0x28($4)
/* 27EE0 00127DE0 240080AC */  sw         $0, 0x24($4)
/* 27EE4 00127DE4 200080AC */  sw         $0, 0x20($4)
/* 27EE8 00127DE8 50010426 */  addiu      $4, $16, 0x150
/* 27EEC 00127DEC 2A86040C */  jal        sceVu0UnitMatrix
/* 27EF0 00127DF0 00000000 */   nop
/* 27EF4 00127DF4 90010426 */  addiu      $4, $16, 0x190
/* 27EF8 00127DF8 2A86040C */  jal        sceVu0UnitMatrix
/* 27EFC 00127DFC 00000000 */   nop
/* 27F00 00127E00 D0010426 */  addiu      $4, $16, 0x1D0
/* 27F04 00127E04 2A86040C */  jal        sceVu0UnitMatrix
/* 27F08 00127E08 00000000 */   nop
/* 27F0C 00127E0C 28260070 */  paddub     $4, $0, $0
/* 27F10 00127E10 09000010 */  b          .L00127E38
/* 27F14 00127E14 00000000 */   nop
.L00127E18:
/* 27F18 00127E18 00110400 */  sll        $2, $4, 4
/* 27F1C 00127E1C 21185000 */  addu       $3, $2, $16
/* 27F20 00127E20 300060AC */  sw         $0, 0x30($3)
/* 27F24 00127E24 340060AC */  sw         $0, 0x34($3)
/* 27F28 00127E28 380060AC */  sw         $0, 0x38($3)
/* 27F2C 00127E2C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 27F30 00127E30 3C0062AC */  sw         $2, 0x3C($3)
/* 27F34 00127E34 01008424 */  addiu      $4, $4, 0x1
.L00127E38:
/* 27F38 00127E38 08008228 */  slti       $2, $4, 0x8
/* 27F3C 00127E3C F6FF4014 */  bnez       $2, .L00127E18
/* 27F40 00127E40 00000000 */   nop
/* 27F44 00127E44 B0000426 */  addiu      $4, $16, 0xB0
/* 27F48 00127E48 309F040C */  jal        Initialize__10CFrameAttrFv
/* 27F4C 00127E4C 00000000 */   nop
/* 27F50 00127E50 01000324 */  addiu      $3, $0, 0x1
/* 27F54 00127E54 000003AE */  sw         $3, 0x0($16)
/* 27F58 00127E58 040000AE */  sw         $0, 0x4($16)
/* 27F5C 00127E5C 180100A2 */  sb         $0, 0x118($16)
/* 27F60 00127E60 480200AE */  sw         $0, 0x248($16)
/* 27F64 00127E64 4C0200AE */  sw         $0, 0x24C($16)
/* 27F68 00127E68 140100AE */  sw         $0, 0x114($16)
/* 27F6C 00127E6C 1000BF7B */  lq         $31, 0x10($sp)
/* 27F70 00127E70 0000B07B */  lq         $16, 0x0($sp)
/* 27F74 00127E74 2000BD27 */  addiu      $sp, $sp, 0x20
/* 27F78 00127E78 0800E003 */  jr         $31
/* 27F7C 00127E7C 00000000 */   nop