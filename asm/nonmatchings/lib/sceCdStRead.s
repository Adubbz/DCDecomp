.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceCdStRead
/* C0B0 0010BFB0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* C0B4 0010BFB4 7000B7FF */  sd         $23, 0x70($sp)
/* C0B8 0010BFB8 2500173C */  lui        $23, (0x250270 >> 16)
/* C0BC 0010BFBC 8000BEFF */  sd         $fp, 0x80($sp)
/* C0C0 0010BFC0 4000B4FF */  sd         $20, 0x40($sp)
/* C0C4 0010BFC4 2DF0E000 */  daddu      $fp, $7, $0
/* C0C8 0010BFC8 2000B2FF */  sd         $18, 0x20($sp)
/* C0CC 0010BFCC 2DA0A000 */  daddu      $20, $5, $0
/* C0D0 0010BFD0 0000B0FF */  sd         $16, 0x0($sp)
/* C0D4 0010BFD4 2D908000 */  daddu      $18, $4, $0
/* C0D8 0010BFD8 7002E28E */  lw         $2, (0x250270 & 0xFFFF)($23)
/* C0DC 0010BFDC 2D80C000 */  daddu      $16, $6, $0
/* C0E0 0010BFE0 9000BFFF */  sd         $31, 0x90($sp)
/* C0E4 0010BFE4 6000B6FF */  sd         $22, 0x60($sp)
/* C0E8 0010BFE8 5000B5FF */  sd         $21, 0x50($sp)
/* C0EC 0010BFEC 3000B3FF */  sd         $19, 0x30($sp)
/* C0F0 0010BFF0 05004018 */  blez       $2, .L0010C008
/* C0F4 0010BFF4 1000B1FF */   sd        $17, 0x10($sp)
/* C0F8 0010BFF8 2900043C */  lui        $4, %hi(D_002972A0)
/* C0FC 0010BFFC 2D284002 */  daddu      $5, $18, $0
/* C100 0010C000 A611040C */  jal        printf
/* C104 0010C004 A0728424 */   addiu     $4, $4, %lo(D_002972A0)
.L0010C008:
/* C108 0010C008 2500023C */  lui        $2, (0x2502B8 >> 16)
/* C10C 0010C00C B802438C */  lw         $3, (0x2502B8 & 0xFFFF)($2)
/* C110 0010C010 03006014 */  bnez       $3, .L0010C020
/* C114 0010C014 2DB00000 */   daddu     $22, $0, $0
/* C118 0010C018 35000010 */  b          .L0010C0F0
/* C11C 0010C01C 2D100000 */   daddu     $2, $0, $0
.L0010C020:
/* C120 0010C020 2D980000 */  daddu      $19, $0, $0
/* C124 0010C024 2D208002 */  daddu      $4, $20, $0
/* C128 0010C028 E65A040C */  jal        sceSifWriteBackDCache
/* C12C 0010C02C C02A1200 */   sll       $5, $18, 11
/* C130 0010C030 24000012 */  beqz       $16, .L0010C0C4
/* C134 0010C034 2500153C */   lui       $21, %hi(dum_mode)
/* C138 0010C038 06000010 */  b          .L0010C054
/* C13C 0010C03C C0321300 */   sll       $6, $19, 11
.L0010C040:
/* C140 0010C040 04000012 */  beqz       $16, .L0010C054
/* C144 0010C044 C0321300 */   sll       $6, $19, 11
/* C148 0010C048 18002012 */  beqz       $17, .L0010C0AC
/* C14C 0010C04C 7002E28E */   lw        $2, (0x250270 & 0xFFFF)($23)
/* C150 0010C050 C0321300 */  sll        $6, $19, 11
.L0010C054:
/* C154 0010C054 23285302 */  subu       $5, $18, $19
/* C158 0010C058 21308602 */  addu       $6, $20, $6
/* C15C 0010C05C 2D200000 */  daddu      $4, $0, $0
/* C160 0010C060 02000724 */  addiu      $7, $0, 0x2
/* C164 0010C064 8430040C */  jal        sceCdStream
/* C168 0010C068 C802A826 */   addiu     $8, $21, %lo(dum_mode)
/* C16C 0010C06C FFFF5130 */  andi       $17, $2, 0xFFFF
/* C170 0010C070 02840200 */  srl        $16, $2, 16
/* C174 0010C074 0B000012 */  beqz       $16, .L0010C0A4
/* C178 0010C078 21987102 */   addu      $19, $19, $17
/* C17C 0010C07C 7002E28E */  lw         $2, (0x250270 & 0xFFFF)($23)
/* C180 0010C080 08004018 */  blez       $2, .L0010C0A4
/* C184 0010C084 2DB00002 */   daddu     $22, $16, $0
/* C188 0010C088 2900043C */  lui        $4, %hi(D_002972D0)
/* C18C 0010C08C 2D286002 */  daddu      $5, $19, $0
/* C190 0010C090 D0728424 */  addiu      $4, $4, %lo(D_002972D0)
/* C194 0010C094 2D302002 */  daddu      $6, $17, $0
/* C198 0010C098 2D384002 */  daddu      $7, $18, $0
/* C19C 0010C09C A611040C */  jal        printf
/* C1A0 0010C0A0 2D400002 */   daddu     $8, $16, $0
.L0010C0A4:
/* C1A4 0010C0A4 E6FF7216 */  bne        $19, $18, .L0010C040
/* C1A8 0010C0A8 7002E28E */   lw        $2, (0x250270 & 0xFFFF)($23)
.L0010C0AC:
/* C1AC 0010C0AC 03004018 */  blez       $2, .L0010C0BC
/* C1B0 0010C0B0 2900043C */   lui       $4, %hi(D_00297318)
/* C1B4 0010C0B4 A611040C */  jal        printf
/* C1B8 0010C0B8 18738424 */   addiu     $4, $4, %lo(D_00297318)
.L0010C0BC:
/* C1BC 0010C0BC 0B000010 */  b          .L0010C0EC
/* C1C0 0010C0C0 0000D6AF */   sw        $22, 0x0($fp)
.L0010C0C4:
/* C1C4 0010C0C4 2500083C */  lui        $8, %hi(dum_mode)
/* C1C8 0010C0C8 2D284002 */  daddu      $5, $18, $0
/* C1CC 0010C0CC 2D308002 */  daddu      $6, $20, $0
/* C1D0 0010C0D0 C8020825 */  addiu      $8, $8, %lo(dum_mode)
/* C1D4 0010C0D4 2D200000 */  daddu      $4, $0, $0
/* C1D8 0010C0D8 8430040C */  jal        sceCdStream
/* C1DC 0010C0DC 02000724 */   addiu     $7, $0, 0x2
/* C1E0 0010C0E0 02840200 */  srl        $16, $2, 16
/* C1E4 0010C0E4 FFFF5330 */  andi       $19, $2, 0xFFFF
/* C1E8 0010C0E8 0000D0AF */  sw         $16, 0x0($fp)
.L0010C0EC:
/* C1EC 0010C0EC 2D106002 */  daddu      $2, $19, $0
.L0010C0F0:
/* C1F0 0010C0F0 9000BFDF */  ld         $31, 0x90($sp)
/* C1F4 0010C0F4 8000BEDF */  ld         $fp, 0x80($sp)
/* C1F8 0010C0F8 7000B7DF */  ld         $23, 0x70($sp)
/* C1FC 0010C0FC 6000B6DF */  ld         $22, 0x60($sp)
/* C200 0010C100 5000B5DF */  ld         $21, 0x50($sp)
/* C204 0010C104 4000B4DF */  ld         $20, 0x40($sp)
/* C208 0010C108 3000B3DF */  ld         $19, 0x30($sp)
/* C20C 0010C10C 2000B2DF */  ld         $18, 0x20($sp)
/* C210 0010C110 1000B1DF */  ld         $17, 0x10($sp)
/* C214 0010C114 0000B0DF */  ld         $16, 0x0($sp)
/* C218 0010C118 0800E003 */  jr         $31
/* C21C 0010C11C A000BD27 */   addiu     $sp, $sp, 0xA0
