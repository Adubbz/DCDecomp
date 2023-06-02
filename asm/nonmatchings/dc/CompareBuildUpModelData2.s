.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CompareBuildUpModelData2__FP11WEAPON_HAVEP11WEAPON_HAVE
/* 1351C0 002350C0 E0FEBD27 */  addiu      $sp, $sp, -0x120
/* 1351C4 002350C4 1000BF7F */  sq         $31, 0x10($sp)
/* 1351C8 002350C8 0000B07F */  sq         $16, 0x0($sp)
/* 1351CC 002350CC 28868070 */  paddub     $16, $4, $0
/* 1351D0 002350D0 2826A070 */  paddub     $4, $5, $0
/* 1351D4 002350D4 2000A527 */  addiu      $5, $sp, 0x20
/* 1351D8 002350D8 01000624 */  addiu      $6, $0, 0x1
/* 1351DC 002350DC D896080C */  jal        WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* 1351E0 002350E0 00000000 */   nop
/* 1351E4 002350E4 1801A227 */  addiu      $2, $sp, 0x118
/* 1351E8 002350E8 D88980C7 */  lwc1       $f0, -0x7628($gp)
/* 1351EC 002350EC 000040E4 */  swc1       $f0, 0x0($2)
/* 1351F0 002350F0 2400A287 */  lh         $2, 0x24($sp)
/* 1351F4 002350F4 1801A2A7 */  sh         $2, 0x118($sp)
/* 1351F8 002350F8 2A00A287 */  lh         $2, 0x2A($sp)
/* 1351FC 002350FC 1A01A2A7 */  sh         $2, 0x11A($sp)
/* 135200 00235100 1C01A227 */  addiu      $2, $sp, 0x11C
/* 135204 00235104 DC8980C7 */  lwc1       $f0, -0x7624($gp)
/* 135208 00235108 000040E4 */  swc1       $f0, 0x0($2)
/* 13520C 0023510C 04000286 */  lh         $2, 0x4($16)
/* 135210 00235110 1C01A2A7 */  sh         $2, 0x11C($sp)
/* 135214 00235114 0A000286 */  lh         $2, 0xA($16)
/* 135218 00235118 1E01A2A7 */  sh         $2, 0x11E($sp)
/* 13521C 0023511C 28360070 */  paddub     $6, $0, $0
/* 135220 00235120 0D000010 */  b          .L00235158
/* 135224 00235124 00000000 */   nop
.L00235128:
/* 135228 00235128 40100600 */  sll        $2, $6, 1
/* 13522C 0023512C 21105D00 */  addu       $2, $2, $sp
/* 135230 00235130 1C014484 */  lh         $4, 0x11C($2)
/* 135234 00235134 18014584 */  lh         $5, 0x118($2)
/* 135238 00235138 14D4080C */  jal        BuildMenuCompVolume__Fss
/* 13523C 0023513C 00000000 */   nop
/* 135240 00235140 04004014 */  bnez       $2, .L00235154
/* 135244 00235144 00000000 */   nop
/* 135248 00235148 28160070 */  paddub     $2, $0, $0
/* 13524C 0023514C 2A000010 */  b          .L002351F8
/* 135250 00235150 00000000 */   nop
.L00235154:
/* 135254 00235154 0100C624 */  addiu      $6, $6, 0x1
.L00235158:
/* 135258 00235158 0200C228 */  slti       $2, $6, 0x2
/* 13525C 0023515C F2FF4014 */  bnez       $2, .L00235128
/* 135260 00235160 00000000 */   nop
/* 135264 00235164 28360070 */  paddub     $6, $0, $0
/* 135268 00235168 0D000010 */  b          .L002351A0
/* 13526C 0023516C 00000000 */   nop
.L00235170:
/* 135270 00235170 2110D000 */  addu       $2, $6, $16
/* 135274 00235174 17004480 */  lb         $4, 0x17($2)
/* 135278 00235178 2110DD00 */  addu       $2, $6, $sp
/* 13527C 0023517C 37004580 */  lb         $5, 0x37($2)
/* 135280 00235180 F8D3080C */  jal        BuildMenuCompVolume__Fcc
/* 135284 00235184 00000000 */   nop
/* 135288 00235188 04004014 */  bnez       $2, .L0023519C
/* 13528C 0023518C 00000000 */   nop
/* 135290 00235190 28160070 */  paddub     $2, $0, $0
/* 135294 00235194 18000010 */  b          .L002351F8
/* 135298 00235198 00000000 */   nop
.L0023519C:
/* 13529C 0023519C 0100C624 */  addiu      $6, $6, 0x1
.L002351A0:
/* 1352A0 002351A0 0500C228 */  slti       $2, $6, 0x5
/* 1352A4 002351A4 F2FF4014 */  bnez       $2, .L00235170
/* 1352A8 002351A8 00000000 */   nop
/* 1352AC 002351AC 28360070 */  paddub     $6, $0, $0
/* 1352B0 002351B0 0D000010 */  b          .L002351E8
/* 1352B4 002351B4 00000000 */   nop
.L002351B8:
/* 1352B8 002351B8 2110D000 */  addu       $2, $6, $16
/* 1352BC 002351BC 1C004480 */  lb         $4, 0x1C($2)
/* 1352C0 002351C0 2110DD00 */  addu       $2, $6, $sp
/* 1352C4 002351C4 3C004580 */  lb         $5, 0x3C($2)
/* 1352C8 002351C8 F8D3080C */  jal        BuildMenuCompVolume__Fcc
/* 1352CC 002351CC 00000000 */   nop
/* 1352D0 002351D0 04004014 */  bnez       $2, .L002351E4
/* 1352D4 002351D4 00000000 */   nop
/* 1352D8 002351D8 28160070 */  paddub     $2, $0, $0
/* 1352DC 002351DC 06000010 */  b          .L002351F8
/* 1352E0 002351E0 00000000 */   nop
.L002351E4:
/* 1352E4 002351E4 0100C624 */  addiu      $6, $6, 0x1
.L002351E8:
/* 1352E8 002351E8 0A00C228 */  slti       $2, $6, 0xA
/* 1352EC 002351EC F2FF4014 */  bnez       $2, .L002351B8
/* 1352F0 002351F0 00000000 */   nop
/* 1352F4 002351F4 01000224 */  addiu      $2, $0, 0x1
.L002351F8:
/* 1352F8 002351F8 1000BF7B */  lq         $31, 0x10($sp)
/* 1352FC 002351FC 0000B07B */  lq         $16, 0x0($sp)
/* 135300 00235200 2001BD27 */  addiu      $sp, $sp, 0x120
/* 135304 00235204 0800E003 */  jr         $31
/* 135308 00235208 00000000 */   nop
/* 13530C 0023520C 00000000 */  nop