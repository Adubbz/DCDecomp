.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWepAttach__FiiP11WEAPON_HAVEii
/* 12A980 0022A880 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* 12A984 0022A884 9000BF7F */  sq         $31, 0x90($sp)
/* 12A988 0022A888 8000BE7F */  sq         $fp, 0x80($sp)
/* 12A98C 0022A88C 7000B77F */  sq         $23, 0x70($sp)
/* 12A990 0022A890 6000B67F */  sq         $22, 0x60($sp)
/* 12A994 0022A894 5000B57F */  sq         $21, 0x50($sp)
/* 12A998 0022A898 4000B47F */  sq         $20, 0x40($sp)
/* 12A99C 0022A89C 3000B37F */  sq         $19, 0x30($sp)
/* 12A9A0 0022A8A0 2000B27F */  sq         $18, 0x20($sp)
/* 12A9A4 0022A8A4 1000B17F */  sq         $17, 0x10($sp)
/* 12A9A8 0022A8A8 0000B07F */  sq         $16, 0x0($sp)
/* 12A9AC 0022A8AC 28B68070 */  paddub     $22, $4, $0
/* 12A9B0 0022A8B0 28AEA070 */  paddub     $21, $5, $0
/* 12A9B4 0022A8B4 28A6C070 */  paddub     $20, $6, $0
/* 12A9B8 0022A8B8 289E0071 */  paddub     $19, $8, $0
/* 12A9BC 0022A8BC 0000C484 */  lh         $4, 0x0($6)
/* 12A9C0 0022A8C0 C4C7080C */  jal        GetWeaponHoleNum__Fi
/* 12A9C4 0022A8C4 00000000 */   nop
/* 12A9C8 0022A8C8 28BE4070 */  paddub     $23, $2, $0
/* 12A9CC 0022A8CC 4C00E01A */  blez       $23, .L0022AA00
/* 12A9D0 0022A8D0 00000000 */   nop
/* 12A9D4 0022A8D4 288E0070 */  paddub     $17, $0, $0
/* 12A9D8 0022A8D8 46000010 */  b          .L0022A9F4
/* 12A9DC 0022A8DC 00000000 */   nop
.L0022A8E0:
/* 12A9E0 0022A8E0 40911100 */  sll        $18, $17, 5
/* 12A9E4 0022A8E4 21105402 */  addu       $2, $18, $20
/* 12A9E8 0022A8E8 28005084 */  lh         $16, 0x28($2)
/* 12A9EC 0022A8EC 5100022A */  slti       $2, $16, 0x51
/* 12A9F0 0022A8F0 35004014 */  bnez       $2, .L0022A9C8
/* 12A9F4 0022A8F4 00000000 */   nop
/* 12A9F8 0022A8F8 3C241000 */  dsll32     $4, $16, 16
/* 12A9FC 0022A8FC 3F240400 */  dsra32     $4, $4, 16
/* 12AA00 0022A900 C800A527 */  addiu      $5, $sp, 0xC8
/* 12AA04 0022A904 CC00A627 */  addiu      $6, $sp, 0xCC
/* 12AA08 0022A908 64B7080C */  jal        RetCTex__FsRiRi
/* 12AA0C 0022A90C 00000000 */   nop
/* 12AA10 0022A910 28F64070 */  paddub     $fp, $2, $0
/* 12AA14 0022A914 CC00A38F */  lw         $3, 0xCC($sp)
/* 12AA18 0022A918 C800A28F */  lw         $2, 0xC8($sp)
/* 12AA1C 0022A91C A000A2AF */  sw         $2, 0xA0($sp)
/* 12AA20 0022A920 A400A3AF */  sw         $3, 0xA4($sp)
/* 12AA24 0022A924 20000224 */  addiu      $2, $0, 0x20
/* 12AA28 0022A928 A800A2AF */  sw         $2, 0xA8($sp)
/* 12AA2C 0022A92C AC00A2AF */  sw         $2, 0xAC($sp)
/* 12AA30 0022A930 B000B6AF */  sw         $22, 0xB0($sp)
/* 12AA34 0022A934 B400B5AF */  sw         $21, 0xB4($sp)
/* 12AA38 0022A938 0042023C */  lui        $2, (0x42000000 >> 16)
/* 12AA3C 0022A93C 00608244 */  mtc1       $2, $f12
/* 12AA40 0022A940 2C44040C */  jal        fptosi
/* 12AA44 0022A944 00000000 */   nop
/* 12AA48 0022A948 B800A2AF */  sw         $2, 0xB8($sp)
/* 12AA4C 0022A94C 0042023C */  lui        $2, (0x42000000 >> 16)
/* 12AA50 0022A950 00608244 */  mtc1       $2, $f12
/* 12AA54 0022A954 2C44040C */  jal        fptosi
/* 12AA58 0022A958 00000000 */   nop
/* 12AA5C 0022A95C BC00A2AF */  sw         $2, 0xBC($sp)
/* 12AA60 0022A960 2826C073 */  paddub     $4, $fp, $0
/* 12AA64 0022A964 B000A527 */  addiu      $5, $sp, 0xB0
/* 12AA68 0022A968 A000A627 */  addiu      $6, $sp, 0xA0
/* 12AA6C 0022A96C 283E6072 */  paddub     $7, $19, $0
/* 12AA70 0022A970 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 12AA74 0022A974 00000000 */   nop
/* 12AA78 0022A978 21109202 */  addu       $2, $20, $18
/* 12AA7C 0022A97C 28004424 */  addiu      $4, $2, 0x28
/* 12AA80 0022A980 2C98080C */  jal        GetAttachVolumeForMsg__FP11ATTACH_LIST
/* 12AA84 0022A984 00000000 */   nop
/* 12AA88 0022A988 5A000324 */  addiu      $3, $0, 0x5A
/* 12AA8C 0022A98C 04000316 */  bne        $16, $3, .L0022A9A0
/* 12AA90 0022A990 00000000 */   nop
/* 12AA94 0022A994 21105402 */  addu       $2, $18, $20
/* 12AA98 0022A998 2A004284 */  lh         $2, 0x2A($2)
/* 12AA9C 0022A99C 00000000 */  nop
.L0022A9A0:
/* 12AAA0 0022A9A0 2826C072 */  paddub     $4, $22, $0
/* 12AAA4 0022A9A4 282EA072 */  paddub     $5, $21, $0
/* 12AAA8 0022A9A8 28360070 */  paddub     $6, $0, $0
/* 12AAAC 0022A9AC 80020724 */  addiu      $7, $0, 0x280
/* 12AAB0 0022A9B0 28460072 */  paddub     $8, $16, $0
/* 12AAB4 0022A9B4 284E4070 */  paddub     $9, $2, $0
/* 12AAB8 0022A9B8 28566072 */  paddub     $10, $19, $0
/* 12AABC 0022A9BC 285E0070 */  paddub     $11, $0, $0
/* 12AAC0 0022A9C0 E0B5080C */  jal        DrawAttachNumberOrWeapon__Fiiiiiiii
/* 12AAC4 0022A9C4 00000000 */   nop
.L0022A9C8:
/* 12AAC8 0022A9C8 00009644 */  mtc1       $22, $f0
/* 12AACC 0022A9CC 00000000 */  nop
/* 12AAD0 0022A9D0 60008046 */  cvt.s.w    $f1, $f0
/* 12AAD4 0022A9D4 2842023C */  lui        $2, (0x42280000 >> 16)
/* 12AAD8 0022A9D8 00008244 */  mtc1       $2, $f0
/* 12AADC 0022A9DC 00000000 */  nop
/* 12AAE0 0022A9E0 000B0046 */  add.s      $f12, $f1, $f0
/* 12AAE4 0022A9E4 2C44040C */  jal        fptosi
/* 12AAE8 0022A9E8 00000000 */   nop
/* 12AAEC 0022A9EC 28B64070 */  paddub     $22, $2, $0
/* 12AAF0 0022A9F0 01003126 */  addiu      $17, $17, 0x1
.L0022A9F4:
/* 12AAF4 0022A9F4 2A183702 */  slt        $3, $17, $23
/* 12AAF8 0022A9F8 B9FF6014 */  bnez       $3, .L0022A8E0
/* 12AAFC 0022A9FC 00000000 */   nop
.L0022AA00:
/* 12AB00 0022AA00 9000BF7B */  lq         $31, 0x90($sp)
/* 12AB04 0022AA04 8000BE7B */  lq         $fp, 0x80($sp)
/* 12AB08 0022AA08 7000B77B */  lq         $23, 0x70($sp)
/* 12AB0C 0022AA0C 6000B67B */  lq         $22, 0x60($sp)
/* 12AB10 0022AA10 5000B57B */  lq         $21, 0x50($sp)
/* 12AB14 0022AA14 4000B47B */  lq         $20, 0x40($sp)
/* 12AB18 0022AA18 3000B37B */  lq         $19, 0x30($sp)
/* 12AB1C 0022AA1C 2000B27B */  lq         $18, 0x20($sp)
/* 12AB20 0022AA20 1000B17B */  lq         $17, 0x10($sp)
/* 12AB24 0022AA24 0000B07B */  lq         $16, 0x0($sp)
/* 12AB28 0022AA28 D000BD27 */  addiu      $sp, $sp, 0xD0
/* 12AB2C 0022AA2C 0800E003 */  jr         $31
/* 12AB30 0022AA30 00000000 */   nop
/* 12AB34 0022AA34 00000000 */  nop
/* 12AB38 0022AA38 00000000 */  nop
/* 12AB3C 0022AA3C 00000000 */  nop
