.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPackFileExt__FPUiPcPPUiiPiPPc
/* 3F970 0013F870 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 3F974 0013F874 9000BF7F */  sq         $31, 0x90($sp)
/* 3F978 0013F878 8000BE7F */  sq         $fp, 0x80($sp)
/* 3F97C 0013F87C 7000B77F */  sq         $23, 0x70($sp)
/* 3F980 0013F880 6000B67F */  sq         $22, 0x60($sp)
/* 3F984 0013F884 5000B57F */  sq         $21, 0x50($sp)
/* 3F988 0013F888 4000B47F */  sq         $20, 0x40($sp)
/* 3F98C 0013F88C 3000B37F */  sq         $19, 0x30($sp)
/* 3F990 0013F890 2000B27F */  sq         $18, 0x20($sp)
/* 3F994 0013F894 1000B17F */  sq         $17, 0x10($sp)
/* 3F998 0013F898 0000B07F */  sq         $16, 0x0($sp)
/* 3F99C 0013F89C 28B68070 */  paddub     $22, $4, $0
/* 3F9A0 0013F8A0 28AEA070 */  paddub     $21, $5, $0
/* 3F9A4 0013F8A4 28BEC070 */  paddub     $23, $6, $0
/* 3F9A8 0013F8A8 28F6E070 */  paddub     $fp, $7, $0
/* 3F9AC 0013F8AC 28A60071 */  paddub     $20, $8, $0
/* 3F9B0 0013F8B0 289E2071 */  paddub     $19, $9, $0
/* 3F9B4 0013F8B4 28860070 */  paddub     $16, $0, $0
/* 3F9B8 0013F8B8 288E0070 */  paddub     $17, $0, $0
.L0013F8BC:
/* 3F9BC 0013F8BC 2826C072 */  paddub     $4, $22, $0
/* 3F9C0 0013F8C0 282E2072 */  paddub     $5, $17, $0
/* 3F9C4 0013F8C4 AC00A627 */  addiu      $6, $sp, 0xAC
/* 3F9C8 0013F8C8 A800A727 */  addiu      $7, $sp, 0xA8
/* 3F9CC 0013F8CC 00FE040C */  jal        GetPackFile__FPUiiPPcPi
/* 3F9D0 0013F8D0 00000000 */   nop
/* 3F9D4 0013F8D4 28964070 */  paddub     $18, $2, $0
/* 3F9D8 0013F8D8 29004012 */  beqz       $18, .L0013F980
/* 3F9DC 0013F8DC 00000000 */   nop
/* 3F9E0 0013F8E0 AC00A58F */  lw         $5, 0xAC($sp)
/* 3F9E4 0013F8E4 0A000010 */  b          .L0013F910
/* 3F9E8 0013F8E8 00000000 */   nop
.L0013F8EC:
/* 3F9EC 0013F8EC 3C1E0200 */  dsll32     $3, $2, 24
/* 3F9F0 0013F8F0 3F1E0300 */  dsra32     $3, $3, 24
/* 3F9F4 0013F8F4 2E000224 */  addiu      $2, $0, 0x2E
/* 3F9F8 0013F8F8 04006214 */  bne        $3, $2, .L0013F90C
/* 3F9FC 0013F8FC 00000000 */   nop
/* 3FA00 0013F900 0100A524 */  addiu      $5, $5, 0x1
/* 3FA04 0013F904 05000010 */  b          .L0013F91C
/* 3FA08 0013F908 00000000 */   nop
.L0013F90C:
/* 3FA0C 0013F90C 0100A524 */  addiu      $5, $5, 0x1
.L0013F910:
/* 3FA10 0013F910 0000A280 */  lb         $2, 0x0($5)
/* 3FA14 0013F914 F5FF4014 */  bnez       $2, .L0013F8EC
/* 3FA18 0013F918 00000000 */   nop
.L0013F91C:
/* 3FA1C 0013F91C 2826A072 */  paddub     $4, $21, $0
/* 3FA20 0013F920 8E14040C */  jal        strcasecmp
/* 3FA24 0013F924 00000000 */   nop
/* 3FA28 0013F928 12004014 */  bnez       $2, .L0013F974
/* 3FA2C 0013F92C 00000000 */   nop
/* 3FA30 0013F930 80201000 */  sll        $4, $16, 2
/* 3FA34 0013F934 2110E402 */  addu       $2, $23, $4
/* 3FA38 0013F938 000052AC */  sw         $18, 0x0($2)
/* 3FA3C 0013F93C 04006012 */  beqz       $19, .L0013F950
/* 3FA40 0013F940 00000000 */   nop
/* 3FA44 0013F944 AC00A38F */  lw         $3, 0xAC($sp)
/* 3FA48 0013F948 21106402 */  addu       $2, $19, $4
/* 3FA4C 0013F94C 000043AC */  sw         $3, 0x0($2)
.L0013F950:
/* 3FA50 0013F950 04008012 */  beqz       $20, .L0013F964
/* 3FA54 0013F954 00000000 */   nop
/* 3FA58 0013F958 A800A38F */  lw         $3, 0xA8($sp)
/* 3FA5C 0013F95C 21108402 */  addu       $2, $20, $4
/* 3FA60 0013F960 000043AC */  sw         $3, 0x0($2)
.L0013F964:
/* 3FA64 0013F964 01001026 */  addiu      $16, $16, 0x1
/* 3FA68 0013F968 2A081E02 */  slt        $at, $16, $fp
/* 3FA6C 0013F96C 04002010 */  beqz       $at, .L0013F980
/* 3FA70 0013F970 00000000 */   nop
.L0013F974:
/* 3FA74 0013F974 01003126 */  addiu      $17, $17, 0x1
/* 3FA78 0013F978 D0FF0010 */  b          .L0013F8BC
/* 3FA7C 0013F97C 00000000 */   nop
.L0013F980:
/* 3FA80 0013F980 28160072 */  paddub     $2, $16, $0
/* 3FA84 0013F984 9000BF7B */  lq         $31, 0x90($sp)
/* 3FA88 0013F988 8000BE7B */  lq         $fp, 0x80($sp)
/* 3FA8C 0013F98C 7000B77B */  lq         $23, 0x70($sp)
/* 3FA90 0013F990 6000B67B */  lq         $22, 0x60($sp)
/* 3FA94 0013F994 5000B57B */  lq         $21, 0x50($sp)
/* 3FA98 0013F998 4000B47B */  lq         $20, 0x40($sp)
/* 3FA9C 0013F99C 3000B37B */  lq         $19, 0x30($sp)
/* 3FAA0 0013F9A0 2000B27B */  lq         $18, 0x20($sp)
/* 3FAA4 0013F9A4 1000B17B */  lq         $17, 0x10($sp)
/* 3FAA8 0013F9A8 0000B07B */  lq         $16, 0x0($sp)
/* 3FAAC 0013F9AC B000BD27 */  addiu      $sp, $sp, 0xB0
/* 3FAB0 0013F9B0 0800E003 */  jr         $31
/* 3FAB4 0013F9B4 00000000 */   nop
/* 3FAB8 0013F9B8 00000000 */  nop
/* 3FABC 0013F9BC 00000000 */  nop
