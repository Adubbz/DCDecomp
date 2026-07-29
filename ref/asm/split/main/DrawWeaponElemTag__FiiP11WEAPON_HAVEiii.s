.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawWeaponElemTag__FiiP11WEAPON_HAVEiii
/* 0FA970 001FA870 90FEBD27 */  addiu       $29, $29, -0x170
/* 0FA974 001FA874 A000BF7F */  sq          $31, 0xA0($29)
/* 0FA978 001FA878 9000BE7F */  sq          $30, 0x90($29)
/* 0FA97C 001FA87C 8000B77F */  sq          $23, 0x80($29)
/* 0FA980 001FA880 7000B67F */  sq          $22, 0x70($29)
/* 0FA984 001FA884 6000B57F */  sq          $21, 0x60($29)
/* 0FA988 001FA888 5000B47F */  sq          $20, 0x50($29)
/* 0FA98C 001FA88C 4000B37F */  sq          $19, 0x40($29)
/* 0FA990 001FA890 3000B27F */  sq          $18, 0x30($29)
/* 0FA994 001FA894 2000B17F */  sq          $17, 0x20($29)
/* 0FA998 001FA898 1000B07F */  sq          $16, 0x10($29)
/* 0FA99C 001FA89C 0400B5E7 */  swc1        $f21, 0x4($29)
/* 0FA9A0 001FA8A0 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0FA9A4 001FA8A4 28BE8070 */  paddub      $23, $4, $0
/* 0FA9A8 001FA8A8 28F6A070 */  paddub      $30, $5, $0
/* 0FA9AC 001FA8AC 28AEC070 */  paddub      $21, $6, $0
/* 0FA9B0 001FA8B0 28A6E070 */  paddub      $20, $7, $0
/* 0FA9B4 001FA8B4 289E2071 */  paddub      $19, $9, $0
/* 0FA9B8 001FA8B8 288E0070 */  paddub      $17, $0, $0
/* 0FA9BC 001FA8BC 01000224 */  addiu       $2, $0, 0x1
/* 0FA9C0 001FA8C0 05008216 */  bne         $20, $2, .L001FA8D8
/* 0FA9C4 001FA8C4 00000000 */   nop
/* 0FA9C8 001FA8C8 28260071 */  paddub      $4, $8, $0
/* 0FA9CC 001FA8CC D443070C */  jal         GetWeaponData__Fi
/* 0FA9D0 001FA8D0 00000000 */   nop
/* 0FA9D4 001FA8D4 288E4070 */  paddub      $17, $2, $0
.L001FA8D8:
/* 0FA9D8 001FA8D8 1600B082 */  lb          $16, 0x16($21)
/* 0FA9DC 001FA8DC 0500012A */  slti        $1, $16, 0x5
/* 0FA9E0 001FA8E0 1A002010 */  beqz        $1, .L001FA94C
/* 0FA9E4 001FA8E4 00000000 */   nop
/* 0FA9E8 001FA8E8 40101000 */  sll         $2, $16, 1
/* 0FA9EC 001FA8EC 21105000 */  addu        $2, $2, $16
/* 0FA9F0 001FA8F0 C0180200 */  sll         $3, $2, 3
/* 0FA9F4 001FA8F4 68006424 */  addiu       $4, $3, 0x68
/* 0FA9F8 001FA8F8 2400C227 */  addiu       $2, $30, 0x24
/* 0FA9FC 001FA8FC 21284300 */  addu        $5, $2, $3
/* 0FAA00 001FA900 D4000224 */  addiu       $2, $0, 0xD4
/* 0FAA04 001FA904 3001A2AF */  sw          $2, 0x130($29)
/* 0FAA08 001FA908 3401A4AF */  sw          $4, 0x134($29)
/* 0FAA0C 001FA90C 2C000424 */  addiu       $4, $0, 0x2C
/* 0FAA10 001FA910 3801A4AF */  sw          $4, 0x138($29)
/* 0FAA14 001FA914 18000324 */  addiu       $3, $0, 0x18
/* 0FAA18 001FA918 3C01A3AF */  sw          $3, 0x13C($29)
/* 0FAA1C 001FA91C 0600E226 */  addiu       $2, $23, 0x6
/* 0FAA20 001FA920 2001A2AF */  sw          $2, 0x120($29)
/* 0FAA24 001FA924 0100A224 */  addiu       $2, $5, 0x1
/* 0FAA28 001FA928 2401A2AF */  sw          $2, 0x124($29)
/* 0FAA2C 001FA92C 2801A4AF */  sw          $4, 0x128($29)
/* 0FAA30 001FA930 2C01A3AF */  sw          $3, 0x12C($29)
/* 0FAA34 001FA934 2C95848F */  lw          $4, -0x6AD4($28)
/* 0FAA38 001FA938 2001A527 */  addiu       $5, $29, 0x120
/* 0FAA3C 001FA93C 3001A627 */  addiu       $6, $29, 0x130
/* 0FAA40 001FA940 283E6072 */  paddub      $7, $19, $0
/* 0FAA44 001FA944 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0FAA48 001FA948 00000000 */   nop
.L001FA94C:
/* 0FAA4C 001FA94C 2900023C */  lui         $2, %hi(LIT_2002)
/* 0FAA50 001FA950 00314224 */  addiu       $2, $2, %lo(LIT_2002)
/* 0FAA54 001FA954 D000A327 */  addiu       $3, $29, 0xD0
/* 0FAA58 001FA958 00004278 */  lq          $2, 0x0($2)
/* 0FAA5C 001FA95C 0000627C */  sq          $2, 0x0($3)
/* 0FAA60 001FA960 4A00E226 */  addiu       $2, $23, 0x4A
/* 0FAA64 001FA964 D000A2AF */  sw          $2, 0xD0($29)
/* 0FAA68 001FA968 3000C327 */  addiu       $3, $30, 0x30
/* 0FAA6C 001FA96C D400A227 */  addiu       $2, $29, 0xD4
/* 0FAA70 001FA970 000043AC */  sw          $3, 0x0($2)
/* 0FAA74 001FA974 2826A072 */  paddub      $4, $21, $0
/* 0FAA78 001FA978 7433080C */  jal         GetNowWeaponRate__FP11WEAPON_HAVE
/* 0FAA7C 001FA97C 00000000 */   nop
/* 0FAA80 001FA980 06050046 */  mov.s       $f20, $f0
/* 0FAA84 001FA984 2900033C */  lui         $3, %hi(LIT_2003)
/* 0FAA88 001FA988 10316324 */  addiu       $3, $3, %lo(LIT_2003)
/* 0FAA8C 001FA98C E000A727 */  addiu       $7, $29, 0xE0
/* 0FAA90 001FA990 00006678 */  lq          $6, 0x0($3)
/* 0FAA94 001FA994 100063C4 */  lwc1        $f3, 0x10($3)
/* 0FAA98 001FA998 0000E67C */  sq          $6, 0x0($7)
/* 0FAA9C 001FA99C 1000E3E4 */  swc1        $f3, 0x10($7)
/* 0FAAA0 001FA9A0 2900033C */  lui         $3, %hi(LIT_2004)
/* 0FAAA4 001FA9A4 30316324 */  addiu       $3, $3, %lo(LIT_2004)
/* 0FAAA8 001FA9A8 0001A727 */  addiu       $7, $29, 0x100
/* 0FAAAC 001FA9AC 00006678 */  lq          $6, 0x0($3)
/* 0FAAB0 001FA9B0 100063C4 */  lwc1        $f3, 0x10($3)
/* 0FAAB4 001FA9B4 0000E67C */  sq          $6, 0x0($7)
/* 0FAAB8 001FA9B8 1000E3E4 */  swc1        $f3, 0x10($7)
/* 0FAABC 001FA9BC 0F008016 */  bnez        $20, .L001FA9FC
/* 0FAAC0 001FA9C0 00000000 */   nop
/* 0FAAC4 001FA9C4 28960070 */  paddub      $18, $0, $0
/* 0FAAC8 001FA9C8 09000010 */  b           .L001FA9F0
/* 0FAACC 001FA9CC 00000000 */   nop
.L001FA9D0:
/* 0FAAD0 001FA9D0 08004526 */  addiu       $5, $18, 0x8
/* 0FAAD4 001FA9D4 2826A072 */  paddub      $4, $21, $0
/* 0FAAD8 001FA9D8 5C96080C */  jal         GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
/* 0FAADC 001FA9DC 00000000 */   nop
/* 0FAAE0 001FA9E0 80181200 */  sll         $3, $18, 2
/* 0FAAE4 001FA9E4 21187D00 */  addu        $3, $3, $29
/* 0FAAE8 001FA9E8 E00062AC */  sw          $2, 0xE0($3)
/* 0FAAEC 001FA9EC 01005226 */  addiu       $18, $18, 0x1
.L001FA9F0:
/* 0FAAF0 001FA9F0 0500432A */  slti        $3, $18, 0x5
/* 0FAAF4 001FA9F4 F6FF6014 */  bnez        $3, .L001FA9D0
/* 0FAAF8 001FA9F8 00000000 */   nop
.L001FA9FC:
/* 0FAAFC 001FA9FC 01000324 */  addiu       $3, $0, 0x1
/* 0FAB00 001FAA00 10008316 */  bne         $20, $3, .L001FAA44
/* 0FAB04 001FAA04 00000000 */   nop
/* 0FAB08 001FAA08 0E002012 */  beqz        $17, .L001FAA44
/* 0FAB0C 001FAA0C 00000000 */   nop
/* 0FAB10 001FAA10 283E0070 */  paddub      $7, $0, $0
/* 0FAB14 001FAA14 08000010 */  b           .L001FAA38
/* 0FAB18 001FAA18 00000000 */   nop
.L001FAA1C:
/* 0FAB1C 001FAA1C 40180700 */  sll         $3, $7, 1
/* 0FAB20 001FAA20 21187100 */  addu        $3, $3, $17
/* 0FAB24 001FAA24 12006684 */  lh          $6, 0x12($3)
/* 0FAB28 001FAA28 80180700 */  sll         $3, $7, 2
/* 0FAB2C 001FAA2C 21187D00 */  addu        $3, $3, $29
/* 0FAB30 001FAA30 000166AC */  sw          $6, 0x100($3)
/* 0FAB34 001FAA34 0100E724 */  addiu       $7, $7, 0x1
.L001FAA38:
/* 0FAB38 001FAA38 0500E328 */  slti        $3, $7, 0x5
/* 0FAB3C 001FAA3C F7FF6014 */  bnez        $3, .L001FAA1C
/* 0FAB40 001FAA40 00000000 */   nop
.L001FAA44:
/* 0FAB44 001FAA44 2900033C */  lui         $3, %hi(LIT_2020)
/* 0FAB48 001FAA48 48316724 */  addiu       $7, $3, %lo(LIT_2020)
/* 0FAB4C 001FAA4C 6001A627 */  addiu       $6, $29, 0x160
/* 0FAB50 001FAA50 0000E3DC */  ld          $3, 0x0($7)
/* 0FAB54 001FAA54 0800E0C4 */  lwc1        $f0, 0x8($7)
/* 0FAB58 001FAA58 0000C3FC */  sd          $3, 0x0($6)
/* 0FAB5C 001FAA5C 0800C0E4 */  swc1        $f0, 0x8($6)
/* 0FAB60 001FAA60 64000324 */  addiu       $3, $0, 0x64
/* 0FAB64 001FAA64 6001A3AF */  sw          $3, 0x160($29)
/* 0FAB68 001FAA68 288E0070 */  paddub      $17, $0, $0
/* 0FAB6C 001FAA6C 58000010 */  b           .L001FABD0
/* 0FAB70 001FAA70 00000000 */   nop
.L001FAA74:
/* 0FAB74 001FAA74 28B60070 */  paddub      $22, $0, $0
/* 0FAB78 001FAA78 21183502 */  addu        $3, $17, $21
/* 0FAB7C 001FAA7C 17006224 */  addiu       $2, $3, 0x17
/* 0FAB80 001FAA80 B000A2AF */  sw          $2, 0xB0($29)
/* 0FAB84 001FAA84 17006380 */  lb          $3, 0x17($3)
/* 0FAB88 001FAA88 80101100 */  sll         $2, $17, 2
/* 0FAB8C 001FAA8C C000A2AF */  sw          $2, 0xC0($29)
/* 0FAB90 001FAA90 C000A28F */  lw          $2, 0xC0($29)
/* 0FAB94 001FAA94 21105D00 */  addu        $2, $2, $29
/* 0FAB98 001FAA98 E000428C */  lw          $2, 0xE0($2)
/* 0FAB9C 001FAA9C 21106200 */  addu        $2, $3, $2
/* 0FABA0 001FAAA0 6401B227 */  addiu       $18, $29, 0x164
/* 0FABA4 001FAAA4 000042AE */  sw          $2, 0x0($18)
/* 0FABA8 001FAAA8 000040C6 */  lwc1        $f0, 0x0($18)
/* 0FABAC 001FAAAC 20008046 */  cvt.s.w     $f0, $f0
/* 0FABB0 001FAAB0 02031446 */  mul.s       $f12, $f0, $f20
/* 0FABB4 001FAAB4 2C44040C */  jal         fptosi
/* 0FABB8 001FAAB8 00000000 */   nop
/* 0FABBC 001FAABC 000042AE */  sw          $2, 0x0($18)
/* 0FABC0 001FAAC0 0000428E */  lw          $2, 0x0($18)
/* 0FABC4 001FAAC4 63004228 */  slti        $2, $2, 0x63
/* 0FABC8 001FAAC8 04004014 */  bnez        $2, .L001FAADC
/* 0FABCC 001FAACC 00000000 */   nop
/* 0FABD0 001FAAD0 63000224 */  addiu       $2, $0, 0x63
/* 0FABD4 001FAAD4 000042AE */  sw          $2, 0x0($18)
/* 0FABD8 001FAAD8 01001624 */  addiu       $22, $0, 0x1
.L001FAADC:
/* 0FABDC 001FAADC B000A28F */  lw          $2, 0xB0($29)
/* 0FABE0 001FAAE0 00004280 */  lb          $2, 0x0($2)
/* 0FABE4 001FAAE4 6801A327 */  addiu       $3, $29, 0x168
/* 0FABE8 001FAAE8 000062AC */  sw          $2, 0x0($3)
/* 0FABEC 001FAAEC 0000628C */  lw          $2, 0x0($3)
/* 0FABF0 001FAAF0 63004228 */  slti        $2, $2, 0x63
/* 0FABF4 001FAAF4 03004014 */  bnez        $2, .L001FAB04
/* 0FABF8 001FAAF8 00000000 */   nop
/* 0FABFC 001FAAFC 63000224 */  addiu       $2, $0, 0x63
/* 0FAC00 001FAB00 000062AC */  sw          $2, 0x0($3)
.L001FAB04:
/* 0FAC04 001FAB04 0000428E */  lw          $2, 0x0($18)
/* 0FAC08 001FAB08 C0110200 */  sll         $2, $2, 7
/* 0FAC0C 001FAB0C 00008244 */  mtc1        $2, $f0
/* 0FAC10 001FAB10 00000000 */  nop
/* 0FAC14 001FAB14 60008046 */  cvt.s.w     $f1, $f0
/* 0FAC18 001FAB18 6001A0C7 */  lwc1        $f0, 0x160($29)
/* 0FAC1C 001FAB1C 20008046 */  cvt.s.w     $f0, $f0
/* 0FAC20 001FAB20 430D0046 */  div.s       $f21, $f1, $f0
/* 0FAC24 001FAB24 06AB0046 */  mov.s       $f12, $f21
/* 0FAC28 001FAB28 2C44040C */  jal         fptosi
/* 0FAC2C 001FAB2C 00000000 */   nop
/* 0FAC30 001FAB30 06AB0046 */  mov.s       $f12, $f21
/* 0FAC34 001FAB34 2C44040C */  jal         fptosi
/* 0FAC38 001FAB38 00000000 */   nop
/* 0FAC3C 001FAB3C D000A48F */  lw          $4, 0xD0($29)
/* 0FAC40 001FAB40 D400A327 */  addiu       $3, $29, 0xD4
/* 0FAC44 001FAB44 0000658C */  lw          $5, 0x0($3)
/* 0FAC48 001FAB48 28364070 */  paddub      $6, $2, $0
/* 0FAC4C 001FAB4C 283EC072 */  paddub      $7, $22, $0
/* 0FAC50 001FAB50 90E7070C */  jal         DrawWeaponStatusWaku__Fiiii
/* 0FAC54 001FAB54 00000000 */   nop
/* 0FAC58 001FAB58 C000A28F */  lw          $2, 0xC0($29)
/* 0FAC5C 001FAB5C 21105D00 */  addu        $2, $2, $29
/* 0FAC60 001FAB60 0001438C */  lw          $3, 0x100($2)
/* 0FAC64 001FAB64 B000A28F */  lw          $2, 0xB0($29)
/* 0FAC68 001FAB68 00004280 */  lb          $2, 0x0($2)
/* 0FAC6C 001FAB6C 23506200 */  subu        $10, $3, $2
/* 0FAC70 001FAB70 07002726 */  addiu       $7, $17, 0x7
/* 0FAC74 001FAB74 D000A427 */  addiu       $4, $29, 0xD0
/* 0FAC78 001FAB78 80000524 */  addiu       $5, $0, 0x80
/* 0FAC7C 001FAB7C 6001A627 */  addiu       $6, $29, 0x160
/* 0FAC80 001FAB80 28466072 */  paddub      $8, $19, $0
/* 0FAC84 001FAB84 284E8072 */  paddub      $9, $20, $0
/* 0FAC88 001FAB88 08E7070C */  jal         WepStatusVolumeDraw__F4RECTiPiiiii
/* 0FAC8C 001FAB8C 00000000 */   nop
/* 0FAC90 001FAB90 0900C012 */  beqz        $22, .L001FABB8
/* 0FAC94 001FAB94 00000000 */   nop
/* 0FAC98 001FAB98 D000A28F */  lw          $2, 0xD0($29)
/* 0FAC9C 001FAB9C 02004424 */  addiu       $4, $2, 0x2
/* 0FACA0 001FABA0 D400A227 */  addiu       $2, $29, 0xD4
/* 0FACA4 001FABA4 0000428C */  lw          $2, 0x0($2)
/* 0FACA8 001FABA8 04004524 */  addiu       $5, $2, 0x4
/* 0FACAC 001FABAC 80000624 */  addiu       $6, $0, 0x80
/* 0FACB0 001FABB0 ACE7070C */  jal         DrawLimmitMax__Fiii
/* 0FACB4 001FABB4 00000000 */   nop
.L001FABB8:
/* 0FACB8 001FABB8 D400A327 */  addiu       $3, $29, 0xD4
/* 0FACBC 001FABBC 0000638C */  lw          $3, 0x0($3)
/* 0FACC0 001FABC0 18006624 */  addiu       $6, $3, 0x18
/* 0FACC4 001FABC4 D400A327 */  addiu       $3, $29, 0xD4
/* 0FACC8 001FABC8 000066AC */  sw          $6, 0x0($3)
/* 0FACCC 001FABCC 01003126 */  addiu       $17, $17, 0x1
.L001FABD0:
/* 0FACD0 001FABD0 0500232A */  slti        $3, $17, 0x5
/* 0FACD4 001FABD4 A7FF6014 */  bnez        $3, .L001FAA74
/* 0FACD8 001FABD8 00000000 */   nop
/* 0FACDC 001FABDC 0500012A */  slti        $1, $16, 0x5
/* 0FACE0 001FABE0 1F002010 */  beqz        $1, .L001FAC60
/* 0FACE4 001FABE4 00000000 */   nop
/* 0FACE8 001FABE8 3000C327 */  addiu       $3, $30, 0x30
/* 0FACEC 001FABEC 40101000 */  sll         $2, $16, 1
/* 0FACF0 001FABF0 21105000 */  addu        $2, $2, $16
/* 0FACF4 001FABF4 C0100200 */  sll         $2, $2, 3
/* 0FACF8 001FABF8 21206200 */  addu        $4, $3, $2
/* 0FACFC 001FABFC D4000224 */  addiu       $2, $0, 0xD4
/* 0FAD00 001FAC00 5001A2AF */  sw          $2, 0x150($29)
/* 0FAD04 001FAC04 90010224 */  addiu       $2, $0, 0x190
/* 0FAD08 001FAC08 5401A2AF */  sw          $2, 0x154($29)
/* 0FAD0C 001FAC0C 42000324 */  addiu       $3, $0, 0x42
/* 0FAD10 001FAC10 5801A3AF */  sw          $3, 0x158($29)
/* 0FAD14 001FAC14 16000224 */  addiu       $2, $0, 0x16
/* 0FAD18 001FAC18 5C01A2AF */  sw          $2, 0x15C($29)
/* 0FAD1C 001FAC1C 8A00E226 */  addiu       $2, $23, 0x8A
/* 0FAD20 001FAC20 4001A2AF */  sw          $2, 0x140($29)
/* 0FAD24 001FAC24 4401A4AF */  sw          $4, 0x144($29)
/* 0FAD28 001FAC28 4801A3AF */  sw          $3, 0x148($29)
/* 0FAD2C 001FAC2C 15000224 */  addiu       $2, $0, 0x15
/* 0FAD30 001FAC30 4C01A2AF */  sw          $2, 0x14C($29)
/* 0FAD34 001FAC34 C0101300 */  sll         $2, $19, 3
/* 0FAD38 001FAC38 23105300 */  subu        $2, $2, $19
/* 0FAD3C 001FAC3C C0100200 */  sll         $2, $2, 3
/* 0FAD40 001FAC40 23105300 */  subu        $2, $2, $19
/* 0FAD44 001FAC44 40100200 */  sll         $2, $2, 1
/* 0FAD48 001FAC48 C3390200 */  sra         $7, $2, 7
/* 0FAD4C 001FAC4C 2C95848F */  lw          $4, -0x6AD4($28)
/* 0FAD50 001FAC50 4001A527 */  addiu       $5, $29, 0x140
/* 0FAD54 001FAC54 5001A627 */  addiu       $6, $29, 0x150
/* 0FAD58 001FAC58 C8B3080C */  jal         DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 0FAD5C 001FAC5C 00000000 */   nop
.L001FAC60:
/* 0FAD60 001FAC60 A000BF7B */  lq          $31, 0xA0($29)
/* 0FAD64 001FAC64 9000BE7B */  lq          $30, 0x90($29)
/* 0FAD68 001FAC68 8000B77B */  lq          $23, 0x80($29)
/* 0FAD6C 001FAC6C 7000B67B */  lq          $22, 0x70($29)
/* 0FAD70 001FAC70 6000B57B */  lq          $21, 0x60($29)
/* 0FAD74 001FAC74 5000B47B */  lq          $20, 0x50($29)
/* 0FAD78 001FAC78 4000B37B */  lq          $19, 0x40($29)
/* 0FAD7C 001FAC7C 3000B27B */  lq          $18, 0x30($29)
/* 0FAD80 001FAC80 2000B17B */  lq          $17, 0x20($29)
/* 0FAD84 001FAC84 1000B07B */  lq          $16, 0x10($29)
/* 0FAD88 001FAC88 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 0FAD8C 001FAC8C 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0FAD90 001FAC90 7001BD27 */  addiu       $29, $29, 0x170
/* 0FAD94 001FAC94 0800E003 */  jr          $31
/* 0FAD98 001FAC98 00000000 */   nop
/* 0FAD9C 001FAC9C 00000000 */  nop
