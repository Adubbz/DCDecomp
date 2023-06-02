.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei
/* 130820 00230720 10FFBD27 */  addiu      $sp, $sp, -0xF0
/* 130824 00230724 A000BF7F */  sq         $31, 0xA0($sp)
/* 130828 00230728 9000BE7F */  sq         $fp, 0x90($sp)
/* 13082C 0023072C 8000B77F */  sq         $23, 0x80($sp)
/* 130830 00230730 7000B67F */  sq         $22, 0x70($sp)
/* 130834 00230734 6000B57F */  sq         $21, 0x60($sp)
/* 130838 00230738 5000B47F */  sq         $20, 0x50($sp)
/* 13083C 0023073C 4000B37F */  sq         $19, 0x40($sp)
/* 130840 00230740 3000B27F */  sq         $18, 0x30($sp)
/* 130844 00230744 2000B17F */  sq         $17, 0x20($sp)
/* 130848 00230748 1000B07F */  sq         $16, 0x10($sp)
/* 13084C 0023074C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 130850 00230750 28F6C070 */  paddub     $fp, $6, $0
/* 130854 00230754 28BEE070 */  paddub     $23, $7, $0
/* 130858 00230758 28B60071 */  paddub     $22, $8, $0
/* 13085C 0023075C 28AE2071 */  paddub     $21, $9, $0
/* 130860 00230760 28A64071 */  paddub     $20, $10, $0
/* 130864 00230764 E800B024 */  addiu      $16, $5, 0xE8
/* 130868 00230768 05000224 */  addiu      $2, $0, 0x5
/* 13086C 0023076C 1A008200 */  div        $0, $4, $2
/* 130870 00230770 02004014 */  bnez       $2, .L0023077C
/* 130874 00230774 00000000 */   nop
/* 130878 00230778 CD010000 */  break      0, 7
.L0023077C:
/* 13087C 0023077C 12880000 */  mflo       $17
/* 130880 00230780 0200201E */  bgtz       $17, .L0023078C
/* 130884 00230784 00000000 */   nop
/* 130888 00230788 01001124 */  addiu      $17, $0, 0x1
.L0023078C:
/* 13088C 0023078C E443023C */  lui        $2, (0x43E40000 >> 16)
/* 130890 00230790 00088244 */  mtc1       $2, $f1
/* 130894 00230794 00009144 */  mtc1       $17, $f0
/* 130898 00230798 00000000 */  nop
/* 13089C 0023079C 20008046 */  cvt.s.w    $f0, $f0
/* 1308A0 002307A0 43080046 */  div.s      $f1, $f1, $f0
/* 1308A4 002307A4 0041023C */  lui        $2, (0x41000000 >> 16)
/* 1308A8 002307A8 00008244 */  mtc1       $2, $f0
/* 1308AC 002307AC 00000000 */  nop
/* 1308B0 002307B0 010B0046 */  sub.s      $f12, $f1, $f0
/* 1308B4 002307B4 2C44040C */  jal        fptosi
/* 1308B8 002307B8 00000000 */   nop
/* 1308BC 002307BC 28964070 */  paddub     $18, $2, $0
/* 1308C0 002307C0 E442033C */  lui        $3, (0x42E40000 >> 16)
/* 1308C4 002307C4 00088344 */  mtc1       $3, $f1
/* 1308C8 002307C8 00008244 */  mtc1       $2, $f0
/* 1308CC 002307CC 00000000 */  nop
/* 1308D0 002307D0 20008046 */  cvt.s.w    $f0, $f0
/* 1308D4 002307D4 34080046 */  c.lt.s     $f1, $f0
/* 1308D8 002307D8 00000000 */  nop
/* 1308DC 002307DC 02000045 */  bc1f       .L002307E8
/* 1308E0 002307E0 00000000 */   nop
/* 1308E4 002307E4 69001224 */  addiu      $18, $0, 0x69
.L002307E8:
/* 1308E8 002307E8 AE000224 */  addiu      $2, $0, 0xAE
/* 1308EC 002307EC B000A2AF */  sw         $2, 0xB0($sp)
/* 1308F0 002307F0 14000224 */  addiu      $2, $0, 0x14
/* 1308F4 002307F4 B400B327 */  addiu      $19, $sp, 0xB4
/* 1308F8 002307F8 000062AE */  sw         $2, 0x0($19)
/* 1308FC 002307FC 08000224 */  addiu      $2, $0, 0x8
/* 130900 00230800 B800A2AF */  sw         $2, 0xB8($sp)
/* 130904 00230804 04000224 */  addiu      $2, $0, 0x4
/* 130908 00230808 BC00A2AF */  sw         $2, 0xBC($sp)
/* 13090C 0023080C E442023C */  lui        $2, (0x42E40000 >> 16)
/* 130910 00230810 00088244 */  mtc1       $2, $f1
/* 130914 00230814 0600C006 */  bltz       $22, .L00230830
/* 130918 00230818 00000000 */   nop
/* 13091C 0023081C 00009644 */  mtc1       $22, $f0
/* 130920 00230820 00000000 */  nop
/* 130924 00230824 20008046 */  cvt.s.w    $f0, $f0
/* 130928 00230828 08000010 */  b          .L0023084C
/* 13092C 0023082C 00000000 */   nop
.L00230830:
/* 130930 00230830 42181600 */  srl        $3, $22, 1
/* 130934 00230834 0100C232 */  andi       $2, $22, 0x1
/* 130938 00230838 25186200 */  or         $3, $3, $2
/* 13093C 0023083C 00008344 */  mtc1       $3, $f0
/* 130940 00230840 00000000 */  nop
/* 130944 00230844 20008046 */  cvt.s.w    $f0, $f0
/* 130948 00230848 00000046 */  add.s      $f0, $f0, $f0
.L0023084C:
/* 13094C 0023084C 42080046 */  mul.s      $f1, $f1, $f0
/* 130950 00230850 00009144 */  mtc1       $17, $f0
/* 130954 00230854 00000000 */  nop
/* 130958 00230858 20008046 */  cvt.s.w    $f0, $f0
/* 13095C 0023085C 43080046 */  div.s      $f1, $f1, $f0
/* 130960 00230860 1600C227 */  addiu      $2, $fp, 0x16
/* 130964 00230864 00008244 */  mtc1       $2, $f0
/* 130968 00230868 00000000 */  nop
/* 13096C 0023086C 20008046 */  cvt.s.w    $f0, $f0
/* 130970 00230870 00050146 */  add.s      $f20, $f0, $f1
/* 130974 00230874 0000E2C6 */  lwc1       $f2, 0x0($23)
/* 130978 00230878 41A00246 */  sub.s      $f1, $f20, $f2
/* 13097C 0023087C 8040023C */  lui        $2, (0x40800000 >> 16)
/* 130980 00230880 00008244 */  mtc1       $2, $f0
/* 130984 00230884 00000000 */  nop
/* 130988 00230888 03080046 */  div.s      $f0, $f1, $f0
/* 13098C 0023088C 00150046 */  add.s      $f20, $f2, $f0
/* 130990 00230890 0000F4E6 */  swc1       $f20, 0x0($23)
/* 130994 00230894 C000B0AF */  sw         $16, 0xC0($sp)
/* 130998 00230898 06A30046 */  mov.s      $f12, $f20
/* 13099C 0023089C 2C44040C */  jal        fptosi
/* 1309A0 002308A0 00000000 */   nop
/* 1309A4 002308A4 C400A2AF */  sw         $2, 0xC4($sp)
/* 1309A8 002308A8 08000224 */  addiu      $2, $0, 0x8
/* 1309AC 002308AC C800A2AF */  sw         $2, 0xC8($sp)
/* 1309B0 002308B0 04000224 */  addiu      $2, $0, 0x4
/* 1309B4 002308B4 CC00A2AF */  sw         $2, 0xCC($sp)
/* 1309B8 002308B8 2826A072 */  paddub     $4, $21, $0
/* 1309BC 002308BC C000A527 */  addiu      $5, $sp, 0xC0
/* 1309C0 002308C0 B000A627 */  addiu      $6, $sp, 0xB0
/* 1309C4 002308C4 283E8072 */  paddub     $7, $20, $0
/* 1309C8 002308C8 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 1309CC 002308CC 00000000 */   nop
/* 1309D0 002308D0 0000628E */  lw         $2, 0x0($19)
/* 1309D4 002308D4 04004224 */  addiu      $2, $2, 0x4
/* 1309D8 002308D8 000062AE */  sw         $2, 0x0($19)
/* 1309DC 002308DC D000B0AF */  sw         $16, 0xD0($sp)
/* 1309E0 002308E0 8040023C */  lui        $2, (0x40800000 >> 16)
/* 1309E4 002308E4 00008244 */  mtc1       $2, $f0
/* 1309E8 002308E8 00000000 */  nop
/* 1309EC 002308EC 00051446 */  add.s      $f20, $f0, $f20
/* 1309F0 002308F0 06A30046 */  mov.s      $f12, $f20
/* 1309F4 002308F4 2C44040C */  jal        fptosi
/* 1309F8 002308F8 00000000 */   nop
/* 1309FC 002308FC D400A2AF */  sw         $2, 0xD4($sp)
/* 130A00 00230900 08000224 */  addiu      $2, $0, 0x8
/* 130A04 00230904 D800A2AF */  sw         $2, 0xD8($sp)
/* 130A08 00230908 01004226 */  addiu      $2, $18, 0x1
/* 130A0C 0023090C DC00A2AF */  sw         $2, 0xDC($sp)
/* 130A10 00230910 2826A072 */  paddub     $4, $21, $0
/* 130A14 00230914 D000A527 */  addiu      $5, $sp, 0xD0
/* 130A18 00230918 B000A627 */  addiu      $6, $sp, 0xB0
/* 130A1C 0023091C 283E8072 */  paddub     $7, $20, $0
/* 130A20 00230920 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 130A24 00230924 00000000 */   nop
/* 130A28 00230928 0000628E */  lw         $2, 0x0($19)
/* 130A2C 0023092C 04004224 */  addiu      $2, $2, 0x4
/* 130A30 00230930 000062AE */  sw         $2, 0x0($19)
/* 130A34 00230934 E000B0AF */  sw         $16, 0xE0($sp)
/* 130A38 00230938 00009244 */  mtc1       $18, $f0
/* 130A3C 0023093C 00000000 */  nop
/* 130A40 00230940 20008046 */  cvt.s.w    $f0, $f0
/* 130A44 00230944 00A30046 */  add.s      $f12, $f20, $f0
/* 130A48 00230948 2C44040C */  jal        fptosi
/* 130A4C 0023094C 00000000 */   nop
/* 130A50 00230950 E400A2AF */  sw         $2, 0xE4($sp)
/* 130A54 00230954 08000224 */  addiu      $2, $0, 0x8
/* 130A58 00230958 E800A2AF */  sw         $2, 0xE8($sp)
/* 130A5C 0023095C 04000224 */  addiu      $2, $0, 0x4
/* 130A60 00230960 EC00A2AF */  sw         $2, 0xEC($sp)
/* 130A64 00230964 2826A072 */  paddub     $4, $21, $0
/* 130A68 00230968 E000A527 */  addiu      $5, $sp, 0xE0
/* 130A6C 0023096C B000A627 */  addiu      $6, $sp, 0xB0
/* 130A70 00230970 283E8072 */  paddub     $7, $20, $0
/* 130A74 00230974 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 130A78 00230978 00000000 */   nop
/* 130A7C 0023097C A000BF7B */  lq         $31, 0xA0($sp)
/* 130A80 00230980 9000BE7B */  lq         $fp, 0x90($sp)
/* 130A84 00230984 8000B77B */  lq         $23, 0x80($sp)
/* 130A88 00230988 7000B67B */  lq         $22, 0x70($sp)
/* 130A8C 0023098C 6000B57B */  lq         $21, 0x60($sp)
/* 130A90 00230990 5000B47B */  lq         $20, 0x50($sp)
/* 130A94 00230994 4000B37B */  lq         $19, 0x40($sp)
/* 130A98 00230998 3000B27B */  lq         $18, 0x30($sp)
/* 130A9C 0023099C 2000B17B */  lq         $17, 0x20($sp)
/* 130AA0 002309A0 1000B07B */  lq         $16, 0x10($sp)
/* 130AA4 002309A4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 130AA8 002309A8 F000BD27 */  addiu      $sp, $sp, 0xF0
/* 130AAC 002309AC 0800E003 */  jr         $31
/* 130AB0 002309B0 00000000 */   nop
/* 130AB4 002309B4 00000000 */  nop
/* 130AB8 002309B8 00000000 */  nop
/* 130ABC 002309BC 00000000 */  nop
