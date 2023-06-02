.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel deci2Putchar
/* 15BE0 00115AE0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 15BE4 00115AE4 1000B1FF */  sd         $17, 0x10($sp)
/* 15BE8 00115AE8 2500113C */  lui        $17, (0x2509F0 >> 16)
/* 15BEC 00115AEC 0000B0FF */  sd         $16, 0x0($sp)
/* 15BF0 00115AF0 F009258E */  lw         $5, (0x2509F0 & 0xFFFF)($17)
/* 15BF4 00115AF4 2D808000 */  daddu      $16, $4, $0
/* 15BF8 00115AF8 3000BFFF */  sd         $31, 0x30($sp)
/* 15BFC 00115AFC 7E00A228 */  slti       $2, $5, 0x7E
/* 15C00 00115B00 09004014 */  bnez       $2, .L00115B28
/* 15C04 00115B04 2000B2FF */   sd        $18, 0x20($sp)
/* 15C08 00115B08 2A00123C */  lui        $18, %hi(D_002A57C0)
/* 15C0C 00115B0C F00920AE */  sw         $0, (0x2509F0 & 0xFFFF)($17)
/* 15C10 00115B10 C0574226 */  addiu      $2, $18, %lo(D_002A57C0)
/* 15C14 00115B14 2D204000 */  daddu      $4, $2, $0
/* 15C18 00115B18 5855040C */  jal        kputs
/* 15C1C 00115B1C 7F0040A0 */   sb        $0, 0x7F($2)
/* 15C20 00115B20 02000010 */  b          .L00115B2C
/* 15C24 00115B24 F009258E */   lw        $5, (0x2509F0 & 0xFFFF)($17)
.L00115B28:
/* 15C28 00115B28 2A00123C */  lui        $18, %hi(D_002A57C0)
.L00115B2C:
/* 15C2C 00115B2C 0A000224 */  addiu      $2, $0, 0xA
/* 15C30 00115B30 0D000216 */  bne        $16, $2, .L00115B68
/* 15C34 00115B34 C0574226 */   addiu     $2, $18, %lo(D_002A57C0)
/* 15C38 00115B38 C0574426 */  addiu      $4, $18, %lo(D_002A57C0)
/* 15C3C 00115B3C F00920AE */  sw         $0, (0x2509F0 & 0xFFFF)($17)
/* 15C40 00115B40 2110A400 */  addu       $2, $5, $4
/* 15C44 00115B44 3000BFDF */  ld         $31, 0x30($sp)
/* 15C48 00115B48 000050A0 */  sb         $16, 0x0($2)
/* 15C4C 00115B4C 2D184000 */  daddu      $3, $2, $0
/* 15C50 00115B50 2000B2DF */  ld         $18, 0x20($sp)
/* 15C54 00115B54 1000B1DF */  ld         $17, 0x10($sp)
/* 15C58 00115B58 0000B0DF */  ld         $16, 0x0($sp)
/* 15C5C 00115B5C 010060A0 */  sb         $0, 0x1($3)
/* 15C60 00115B60 58550408 */  j          kputs
/* 15C64 00115B64 4000BD27 */   addiu     $sp, $sp, 0x40
.L00115B68:
/* 15C68 00115B68 0100A324 */  addiu      $3, $5, 0x1
/* 15C6C 00115B6C F00923AE */  sw         $3, (0x2509F0 & 0xFFFF)($17)
/* 15C70 00115B70 2110A200 */  addu       $2, $5, $2
/* 15C74 00115B74 000050A0 */  sb         $16, 0x0($2)
/* 15C78 00115B78 3000BFDF */  ld         $31, 0x30($sp)
/* 15C7C 00115B7C 2000B2DF */  ld         $18, 0x20($sp)
/* 15C80 00115B80 1000B1DF */  ld         $17, 0x10($sp)
/* 15C84 00115B84 0000B0DF */  ld         $16, 0x0($sp)
/* 15C88 00115B88 0800E003 */  jr         $31
/* 15C8C 00115B8C 4000BD27 */   addiu     $sp, $sp, 0x40