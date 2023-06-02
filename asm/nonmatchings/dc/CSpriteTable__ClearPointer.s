.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearPointer__12CSpriteTableFv
/* 2C1F0 0012C0F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2C1F4 0012C0F4 2000BF7F */  sq         $31, 0x20($sp)
/* 2C1F8 0012C0F8 1000B17F */  sq         $17, 0x10($sp)
/* 2C1FC 0012C0FC 0000B07F */  sq         $16, 0x0($sp)
/* 2C200 0012C100 28868070 */  paddub     $16, $4, $0
/* 2C204 0012C104 0000838C */  lw         $3, 0x0($4)
/* 2C208 0012C108 8C0083AC */  sw         $3, 0x8C($4)
/* 2C20C 0012C10C 288E0070 */  paddub     $17, $0, $0
/* 2C210 0012C110 0C000010 */  b          .L0012C144
/* 2C214 0012C114 00000000 */   nop
.L0012C118:
/* 2C218 0012C118 28260072 */  paddub     $4, $16, $0
/* 2C21C 0012C11C 30B0040C */  jal        GetNext__12CSpriteTableFv
/* 2C220 0012C120 00000000 */   nop
/* 2C224 0012C124 80181100 */  sll        $3, $17, 2
/* 2C228 0012C128 21207000 */  addu       $4, $3, $16
/* 2C22C 0012C12C 0C0082AC */  sw         $2, 0xC($4)
/* 2C230 0012C130 0C00838C */  lw         $3, 0xC($4)
/* 2C234 0012C134 300060AC */  sw         $0, 0x30($3)
/* 2C238 0012C138 0C00838C */  lw         $3, 0xC($4)
/* 2C23C 0012C13C 4C0083AC */  sw         $3, 0x4C($4)
/* 2C240 0012C140 01003126 */  addiu      $17, $17, 0x1
.L0012C144:
/* 2C244 0012C144 0400038E */  lw         $3, 0x4($16)
/* 2C248 0012C148 2A182302 */  slt        $3, $17, $3
/* 2C24C 0012C14C F2FF6014 */  bnez       $3, .L0012C118
/* 2C250 0012C150 00000000 */   nop
/* 2C254 0012C154 2000BF7B */  lq         $31, 0x20($sp)
/* 2C258 0012C158 1000B17B */  lq         $17, 0x10($sp)
/* 2C25C 0012C15C 0000B07B */  lq         $16, 0x0($sp)
/* 2C260 0012C160 3000BD27 */  addiu      $sp, $sp, 0x30
/* 2C264 0012C164 0800E003 */  jr         $31
/* 2C268 0012C168 00000000 */   nop
/* 2C26C 0012C16C 00000000 */  nop
