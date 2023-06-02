.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__12CSpriteTableFP12SPRITE_TABLEii
/* 2C160 0012C060 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 2C164 0012C064 0000BF7F */  sq         $31, 0x0($sp)
/* 2C168 0012C068 040087AC */  sw         $7, 0x4($4)
/* 2C16C 0012C06C 0400828C */  lw         $2, 0x4($4)
/* 2C170 0012C070 11004128 */  slti       $at, $2, 0x11
/* 2C174 0012C074 03002014 */  bnez       $at, .L0012C084
/* 2C178 0012C078 00000000 */   nop
/* 2C17C 0012C07C 10000224 */  addiu      $2, $0, 0x10
/* 2C180 0012C080 040082AC */  sw         $2, 0x4($4)
.L0012C084:
/* 2C184 0012C084 000085AC */  sw         $5, 0x0($4)
/* 2C188 0012C088 080086AC */  sw         $6, 0x8($4)
/* 2C18C 0012C08C C0100600 */  sll        $2, $6, 3
/* 2C190 0012C090 23104600 */  subu       $2, $2, $6
/* 2C194 0012C094 C0100200 */  sll        $2, $2, 3
/* 2C198 0012C098 2110A200 */  addu       $2, $5, $2
/* 2C19C 0012C09C 900082AC */  sw         $2, 0x90($4)
/* 2C1A0 0012C0A0 3CB0040C */  jal        ClearPointer__12CSpriteTableFv
/* 2C1A4 0012C0A4 00000000 */   nop
/* 2C1A8 0012C0A8 0000BF7B */  lq         $31, 0x0($sp)
/* 2C1AC 0012C0AC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 2C1B0 0012C0B0 0800E003 */  jr         $31
/* 2C1B4 0012C0B4 00000000 */   nop
/* 2C1B8 0012C0B8 00000000 */  nop
/* 2C1BC 0012C0BC 00000000 */  nop
