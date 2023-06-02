.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMapCheck__Fi
/* 10AAB0 0020A9B0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 10AAB4 0020A9B4 2000BF7F */  sq         $31, 0x20($sp)
/* 10AAB8 0020A9B8 1000B17F */  sq         $17, 0x10($sp)
/* 10AABC 0020A9BC 0000B07F */  sq         $16, 0x0($sp)
/* 10AAC0 0020A9C0 2900033C */  lui        $3, %hi(_6344)
/* 10AAC4 0020A9C4 60386624 */  addiu      $6, $3, %lo(_6344)
/* 10AAC8 0020A9C8 3000A527 */  addiu      $5, $sp, 0x30
/* 10AACC 0020A9CC 04000424 */  addiu      $4, $0, 0x4
.L0020A9D0:
/* 10AAD0 0020A9D0 0000C378 */  lq         $3, 0x0($6)
/* 10AAD4 0020A9D4 1000C624 */  addiu      $6, $6, 0x10
/* 10AAD8 0020A9D8 FFFF8424 */  addiu      $4, $4, -0x1
/* 10AADC 0020A9DC 0000A37C */  sq         $3, 0x0($5)
/* 10AAE0 0020A9E0 1000A524 */  addiu      $5, $5, 0x10
/* 10AAE4 0020A9E4 FAFF801C */  bgtz       $4, .L0020A9D0
/* 10AAE8 0020A9E8 00000000 */   nop
/* 10AAEC 0020A9EC 7000A0AF */  sw         $0, 0x70($sp)
/* 10AAF0 0020A9F0 7400B127 */  addiu      $17, $sp, 0x74
/* 10AAF4 0020A9F4 000020AE */  sw         $0, 0x0($17)
/* 10AAF8 0020A9F8 10000324 */  addiu      $3, $0, 0x10
/* 10AAFC 0020A9FC 7800A3AF */  sw         $3, 0x78($sp)
/* 10AB00 0020AA00 0F000324 */  addiu      $3, $0, 0xF
/* 10AB04 0020AA04 7C00A3AF */  sw         $3, 0x7C($sp)
/* 10AB08 0020AA08 8000A0AF */  sw         $0, 0x80($sp)
/* 10AB0C 0020AA0C 68000324 */  addiu      $3, $0, 0x68
/* 10AB10 0020AA10 8400A3AF */  sw         $3, 0x84($sp)
/* 10AB14 0020AA14 15000324 */  addiu      $3, $0, 0x15
/* 10AB18 0020AA18 8800A3AF */  sw         $3, 0x88($sp)
/* 10AB1C 0020AA1C 8C00A3AF */  sw         $3, 0x8C($sp)
/* 10AB20 0020AA20 28860070 */  paddub     $16, $0, $0
/* 10AB24 0020AA24 2D000010 */  b          .L0020AADC
/* 10AB28 0020AA28 00000000 */   nop
.L0020AA2C:
/* 10AB2C 0020AA2C 00211000 */  sll        $4, $16, 4
/* 10AB30 0020AA30 2900033C */  lui        $3, %hi(TownOrDngPos)
/* 10AB34 0020AA34 C0356324 */  addiu      $3, $3, %lo(TownOrDngPos)
/* 10AB38 0020AA38 21286400 */  addu       $5, $3, $4
/* 10AB3C 0020AA3C 2600A010 */  beqz       $5, .L0020AAD8
/* 10AB40 0020AA40 00000000 */   nop
/* 10AB44 0020AA44 0600A384 */  lh         $3, 0x6($5)
/* 10AB48 0020AA48 23006018 */  blez       $3, .L0020AAD8
/* 10AB4C 0020AA4C 00000000 */   nop
/* 10AB50 0020AA50 D901013C */  lui        $at, (0x1D9053C >> 16)
/* 10AB54 0020AA54 3C05248C */  lw         $4, (0x1D9053C & 0xFFFF)($at)
/* 10AB58 0020AA58 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 10AB5C 0020AA5C 00000000 */   nop
/* 10AB60 0020AA60 28264070 */  paddub     $4, $2, $0
/* 10AB64 0020AA64 1C008010 */  beqz       $4, .L0020AAD8
/* 10AB68 0020AA68 00000000 */   nop
/* 10AB6C 0020AA6C 9800A527 */  addiu      $5, $sp, 0x98
/* 10AB70 0020AA70 08B0080C */  jal        Get3DPosTo2DPos__FP6CFramePi
/* 10AB74 0020AA74 00000000 */   nop
/* 10AB78 0020AA78 80101000 */  sll        $2, $16, 2
/* 10AB7C 0020AA7C 21205D00 */  addu       $4, $2, $sp
/* 10AB80 0020AA80 30008384 */  lh         $3, 0x30($4)
/* 10AB84 0020AA84 9800A28F */  lw         $2, 0x98($sp)
/* 10AB88 0020AA88 21104300 */  addu       $2, $2, $3
/* 10AB8C 0020AA8C 7000A2AF */  sw         $2, 0x70($sp)
/* 10AB90 0020AA90 32008384 */  lh         $3, 0x32($4)
/* 10AB94 0020AA94 9C00A28F */  lw         $2, 0x9C($sp)
/* 10AB98 0020AA98 21104300 */  addu       $2, $2, $3
/* 10AB9C 0020AA9C 000022AE */  sw         $2, 0x0($17)
/* 10ABA0 0020AAA0 8000A0AF */  sw         $0, 0x80($sp)
/* 10ABA4 0020AAA4 DA01013C */  lui        $at, (0x1DA0000 >> 16)
/* 10ABA8 0020AAA8 BCED2284 */  lh         $2, -0x1244($at)
/* 10ABAC 0020AAAC 04005014 */  bne        $2, $16, .L0020AAC0
/* 10ABB0 0020AAB0 00000000 */   nop
/* 10ABB4 0020AAB4 8000A28F */  lw         $2, 0x80($sp)
/* 10ABB8 0020AAB8 14004224 */  addiu      $2, $2, 0x14
/* 10ABBC 0020AABC 8000A2AF */  sw         $2, 0x80($sp)
.L0020AAC0:
/* 10ABC0 0020AAC0 D495848F */  lw         $4, -0x6A2C($gp)
/* 10ABC4 0020AAC4 7000A527 */  addiu      $5, $sp, 0x70
/* 10ABC8 0020AAC8 8000A627 */  addiu      $6, $sp, 0x80
/* 10ABCC 0020AACC 80000724 */  addiu      $7, $0, 0x80
/* 10ABD0 0020AAD0 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 10ABD4 0020AAD4 00000000 */   nop
.L0020AAD8:
/* 10ABD8 0020AAD8 01001026 */  addiu      $16, $16, 0x1
.L0020AADC:
/* 10ABDC 0020AADC 1000032A */  slti       $3, $16, 0x10
/* 10ABE0 0020AAE0 D2FF6014 */  bnez       $3, .L0020AA2C
/* 10ABE4 0020AAE4 00000000 */   nop
/* 10ABE8 0020AAE8 2000BF7B */  lq         $31, 0x20($sp)
/* 10ABEC 0020AAEC 1000B17B */  lq         $17, 0x10($sp)
/* 10ABF0 0020AAF0 0000B07B */  lq         $16, 0x0($sp)
/* 10ABF4 0020AAF4 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 10ABF8 0020AAF8 0800E003 */  jr         $31
/* 10ABFC 0020AAFC 00000000 */   nop
