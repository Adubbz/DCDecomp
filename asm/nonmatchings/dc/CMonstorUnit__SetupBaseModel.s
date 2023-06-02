.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetupBaseModel__12CMonstorUnitFiiiP14CDataAlloc2_1_
/* DFF90 001DFE90 B0FEBD27 */  addiu      $sp, $sp, -0x150
/* DFF94 001DFE94 9000BF7F */  sq         $31, 0x90($sp)
/* DFF98 001DFE98 8000BE7F */  sq         $fp, 0x80($sp)
/* DFF9C 001DFE9C 7000B77F */  sq         $23, 0x70($sp)
/* DFFA0 001DFEA0 6000B67F */  sq         $22, 0x60($sp)
/* DFFA4 001DFEA4 5000B57F */  sq         $21, 0x50($sp)
/* DFFA8 001DFEA8 4000B47F */  sq         $20, 0x40($sp)
/* DFFAC 001DFEAC 3000B37F */  sq         $19, 0x30($sp)
/* DFFB0 001DFEB0 2000B27F */  sq         $18, 0x20($sp)
/* DFFB4 001DFEB4 1000B17F */  sq         $17, 0x10($sp)
/* DFFB8 001DFEB8 0000B07F */  sq         $16, 0x0($sp)
/* DFFBC 001DFEBC 289E8070 */  paddub     $19, $4, $0
/* DFFC0 001DFEC0 2896A070 */  paddub     $18, $5, $0
/* DFFC4 001DFEC4 28B6E070 */  paddub     $22, $7, $0
/* DFFC8 001DFEC8 288E0071 */  paddub     $17, $8, $0
/* DFFCC 001DFECC 80100600 */  sll        $2, $6, 2
/* DFFD0 001DFED0 21104600 */  addu       $2, $2, $6
/* DFFD4 001DFED4 C0100200 */  sll        $2, $2, 3
/* DFFD8 001DFED8 23104600 */  subu       $2, $2, $6
/* DFFDC 001DFEDC 80180200 */  sll        $3, $2, 2
/* DFFE0 001DFEE0 2800023C */  lui        $2, %hi(MonstorTable)
/* DFFE4 001DFEE4 00FB4224 */  addiu      $2, $2, %lo(MonstorTable)
/* DFFE8 001DFEE8 21A04300 */  addu       $20, $2, $3
/* DFFEC 001DFEEC E000A427 */  addiu      $4, $sp, 0xE0
/* DFFF0 001DFEF0 509F040C */  jal        __ct__10CFrameAttrFv
/* DFFF4 001DFEF4 00000000 */   nop
/* DFFF8 001DFEF8 01000224 */  addiu      $2, $0, 0x1
/* DFFFC 001DFEFC EC00A2A3 */  sb         $2, 0xEC($sp)
/* E0000 001DFF00 A000A427 */  addiu      $4, $sp, 0xA0
/* E0004 001DFF04 2A00023C */  lui        $2, %hi(_2328)
/* E0008 001DFF08 C0CF4524 */  addiu      $5, $2, %lo(_2328)
/* E000C 001DFF0C 28368072 */  paddub     $6, $20, $0
/* E0010 001DFF10 1614040C */  jal        sprintf
/* E0014 001DFF14 00000000 */   nop
/* E0018 001DFF18 A000A427 */  addiu      $4, $sp, 0xA0
/* E001C 001DFF1C 948B858F */  lw         $5, -0x746C($gp)
/* E0020 001DFF20 28360070 */  paddub     $6, $0, $0
/* E0024 001DFF24 D8FC040C */  jal        LoadFile__FPcPvPi
/* E0028 001DFF28 00000000 */   nop
/* E002C 001DFF2C DC4F050C */  jal        wait_now_loading_vsync__Fv
/* E0030 001DFF30 00000000 */   nop
/* E0034 001DFF34 10350224 */  addiu      $2, $0, 0x3510
/* E0038 001DFF38 18804202 */  mult       $16, $18, $2
/* E003C 001DFF3C 21B87002 */  addu       $23, $19, $16
/* E0040 001DFF40 A000F526 */  addiu      $21, $23, 0xA0
/* E0044 001DFF44 2826A072 */  paddub     $4, $21, $0
/* E0048 001DFF48 D901023C */  lui        $2, %hi(MonsterTexAnim)
/* E004C 001DFF4C 808C4524 */  addiu      $5, $2, %lo(MonsterTexAnim)
/* E0050 001DFF50 40010624 */  addiu      $6, $0, 0x140
/* E0054 001DFF54 FCDF040C */  jal        InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
/* E0058 001DFF58 00000000 */   nop
/* E005C 001DFF5C 2826A072 */  paddub     $4, $21, $0
/* E0060 001DFF60 948B858F */  lw         $5, -0x746C($gp)
/* E0064 001DFF64 2A00023C */  lui        $2, %hi(_2329)
/* E0068 001DFF68 D8CF4624 */  addiu      $6, $2, %lo(_2329)
/* E006C 001DFF6C 283E2072 */  paddub     $7, $17, $0
/* E0070 001DFF70 2A000824 */  addiu      $8, $0, 0x2A
/* E0074 001DFF74 284E2072 */  paddub     $9, $17, $0
/* E0078 001DFF78 01000A24 */  addiu      $10, $0, 0x1
/* E007C 001DFF7C 285E0070 */  paddub     $11, $0, $0
/* E0080 001DFF80 A000B98E */  lw         $25, 0xA0($21)
/* E0084 001DFF84 C000398F */  lw         $25, 0xC0($25)
/* E0088 001DFF88 09F82003 */  jalr       $25
/* E008C 001DFF8C 00000000 */   nop
/* E0090 001DFF90 2816E072 */  paddub     $2, $23, $0
/* E0094 001DFF94 5C015524 */  addiu      $21, $2, 0x15C
/* E0098 001DFF98 5C01448C */  lw         $4, 0x15C($2)
/* E009C 001DFF9C E000A527 */  addiu      $5, $sp, 0xE0
/* E00A0 001DFFA0 01000624 */  addiu      $6, $0, 0x1
/* E00A4 001DFFA4 40000724 */  addiu      $7, $0, 0x40
/* E00A8 001DFFA8 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* E00AC 001DFFAC 00000000 */   nop
/* E00B0 001DFFB0 0000A48E */  lw         $4, 0x0($21)
/* E00B4 001DFFB4 01000524 */  addiu      $5, $0, 0x1
/* E00B8 001DFFB8 BC97040C */  jal        SetFrameAttr__FP6CFramei
/* E00BC 001DFFBC 00000000 */   nop
/* E00C0 001DFFC0 28AE0070 */  paddub     $21, $0, $0
/* E00C4 001DFFC4 33000010 */  b          .L001E0094
/* E00C8 001DFFC8 00000000 */   nop
.L001DFFCC:
/* E00CC 001DFFCC 00111500 */  sll        $2, $21, 4
/* E00D0 001DFFD0 21105400 */  addu       $2, $2, $20
/* E00D4 001DFFD4 10004280 */  lb         $2, 0x10($2)
/* E00D8 001DFFD8 2D004010 */  beqz       $2, .L001E0090
/* E00DC 001DFFDC 00000000 */   nop
/* E00E0 001DFFE0 0100A226 */  addiu      $2, $21, 0x1
/* E00E4 001DFFE4 00110200 */  sll        $2, $2, 4
/* E00E8 001DFFE8 21308202 */  addu       $6, $20, $2
/* E00EC 001DFFEC A000A427 */  addiu      $4, $sp, 0xA0
/* E00F0 001DFFF0 2A00023C */  lui        $2, %hi(_2328)
/* E00F4 001DFFF4 C0CF4524 */  addiu      $5, $2, %lo(_2328)
/* E00F8 001DFFF8 1614040C */  jal        sprintf
/* E00FC 001DFFFC 00000000 */   nop
/* E0100 001E0000 A000A427 */  addiu      $4, $sp, 0xA0
/* E0104 001E0004 948B858F */  lw         $5, -0x746C($gp)
/* E0108 001E0008 28360070 */  paddub     $6, $0, $0
/* E010C 001E000C D8FC040C */  jal        LoadFile__FPcPvPi
/* E0110 001E0010 00000000 */   nop
/* E0114 001E0014 DC4F050C */  jal        wait_now_loading_vsync__Fv
/* E0118 001E0018 00000000 */   nop
/* E011C 001E001C 0100A326 */  addiu      $3, $21, 0x1
/* E0120 001E0020 B0110224 */  addiu      $2, $0, 0x11B0
/* E0124 001E0024 18106200 */  mult       $2, $3, $2
/* E0128 001E0028 2118E202 */  addu       $3, $23, $2
/* E012C 001E002C A0006424 */  addiu      $4, $3, 0xA0
/* E0130 001E0030 948B858F */  lw         $5, -0x746C($gp)
/* E0134 001E0034 2A00023C */  lui        $2, %hi(_2329)
/* E0138 001E0038 D8CF4624 */  addiu      $6, $2, %lo(_2329)
/* E013C 001E003C 283E2072 */  paddub     $7, $17, $0
/* E0140 001E0040 28462072 */  paddub     $8, $17, $0
/* E0144 001E0044 4001798C */  lw         $25, 0x140($3)
/* E0148 001E0048 B400398F */  lw         $25, 0xB4($25)
/* E014C 001E004C 09F82003 */  jalr       $25
/* E0150 001E0050 00000000 */   nop
/* E0154 001E0054 21181302 */  addu       $3, $16, $19
/* E0158 001E0058 B0110224 */  addiu      $2, $0, 0x11B0
/* E015C 001E005C 1810A202 */  mult       $2, $21, $2
/* E0160 001E0060 21104300 */  addu       $2, $2, $3
/* E0164 001E0064 0C135E24 */  addiu      $fp, $2, 0x130C
/* E0168 001E0068 0C13448C */  lw         $4, 0x130C($2)
/* E016C 001E006C E000A527 */  addiu      $5, $sp, 0xE0
/* E0170 001E0070 01000624 */  addiu      $6, $0, 0x1
/* E0174 001E0074 40000724 */  addiu      $7, $0, 0x40
/* E0178 001E0078 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* E017C 001E007C 00000000 */   nop
/* E0180 001E0080 0000C48F */  lw         $4, 0x0($fp)
/* E0184 001E0084 01000524 */  addiu      $5, $0, 0x1
/* E0188 001E0088 BC97040C */  jal        SetFrameAttr__FP6CFramei
/* E018C 001E008C 00000000 */   nop
.L001E0090:
/* E0190 001E0090 0100B526 */  addiu      $21, $21, 0x1
.L001E0094:
/* E0194 001E0094 0300A22A */  slti       $2, $21, 0x3
/* E0198 001E0098 CCFF4014 */  bnez       $2, .L001DFFCC
/* E019C 001E009C 00000000 */   nop
/* E01A0 001E00A0 A000A427 */  addiu      $4, $sp, 0xA0
/* E01A4 001E00A4 2A00023C */  lui        $2, %hi(_2330)
/* E01A8 001E00A8 F0CF4524 */  addiu      $5, $2, %lo(_2330)
/* E01AC 001E00AC 40008626 */  addiu      $6, $20, 0x40
/* E01B0 001E00B0 1614040C */  jal        sprintf
/* E01B4 001E00B4 00000000 */   nop
/* E01B8 001E00B8 A000A427 */  addiu      $4, $sp, 0xA0
/* E01BC 001E00BC 948B858F */  lw         $5, -0x746C($gp)
/* E01C0 001E00C0 4C01A627 */  addiu      $6, $sp, 0x14C
/* E01C4 001E00C4 D8FC040C */  jal        LoadFile__FPcPvPi
/* E01C8 001E00C8 00000000 */   nop
/* E01CC 001E00CC DC4F050C */  jal        wait_now_loading_vsync__Fv
/* E01D0 001E00D0 00000000 */   nop
/* E01D4 001E00D4 0800228E */  lw         $2, 0x8($17)
/* E01D8 001E00D8 00190200 */  sll        $3, $2, 4
/* E01DC 001E00DC 0000228E */  lw         $2, 0x0($17)
/* E01E0 001E00E0 21184300 */  addu       $3, $2, $3
/* E01E4 001E00E4 80101200 */  sll        $2, $18, 2
/* E01E8 001E00E8 21105300 */  addu       $2, $2, $19
/* E01EC 001E00EC 0100013C */  lui        $at, (0x1E3AC >> 16)
/* E01F0 001E00F0 ACE32134 */  ori        $at, $at, (0x1E3AC & 0xFFFF)
/* E01F4 001E00F4 21804100 */  addu       $16, $2, $at
/* E01F8 001E00F8 000003AE */  sw         $3, 0x0($16)
/* E01FC 001E00FC 4C01A28F */  lw         $2, 0x14C($sp)
/* E0200 001E0100 83110200 */  sra        $2, $2, 6
/* E0204 001E0104 01004224 */  addiu      $2, $2, 0x1
/* E0208 001E0108 80110200 */  sll        $2, $2, 6
/* E020C 001E010C 03290200 */  sra        $5, $2, 4
/* E0210 001E0110 28262072 */  paddub     $4, $17, $0
/* E0214 001E0114 289E040C */  jal        Alloc__14CDataAlloc2_1_Fi
/* E0218 001E0118 00000000 */   nop
/* E021C 001E011C 4C01A68F */  lw         $6, 0x14C($sp)
/* E0220 001E0120 0000048E */  lw         $4, 0x0($16)
/* E0224 001E0124 948B858F */  lw         $5, -0x746C($gp)
/* E0228 001E0128 EC0C040C */  jal        memcpy
/* E022C 001E012C 00000000 */   nop
/* E0230 001E0130 80101200 */  sll        $2, $18, 2
/* E0234 001E0134 21105200 */  addu       $2, $2, $18
/* E0238 001E0138 C0100200 */  sll        $2, $2, 3
/* E023C 001E013C 23105200 */  subu       $2, $2, $18
/* E0240 001E0140 80900200 */  sll        $18, $2, 2
/* E0244 001E0144 21107202 */  addu       $2, $19, $18
/* E0248 001E0148 0100013C */  lui        $at, (0x1DE30 >> 16)
/* E024C 001E014C 30DE2134 */  ori        $at, $at, (0x1DE30 & 0xFFFF)
/* E0250 001E0150 21204100 */  addu       $4, $2, $at
/* E0254 001E0154 282E8072 */  paddub     $5, $20, $0
/* E0258 001E0158 9C000624 */  addiu      $6, $0, 0x9C
/* E025C 001E015C EC0C040C */  jal        memcpy
/* E0260 001E0160 00000000 */   nop
/* E0264 001E0164 02001024 */  addiu      $16, $0, 0x2
/* E0268 001E0168 78008286 */  lh         $2, 0x78($20)
/* E026C 001E016C 02005014 */  bne        $2, $16, .L001E0178
/* E0270 001E0170 00000000 */   nop
/* E0274 001E0174 06001024 */  addiu      $16, $0, 0x6
.L001E0178:
/* E0278 001E0178 68008386 */  lh         $3, 0x68($20)
/* E027C 001E017C FFFF0224 */  addiu      $2, $0, -0x1
/* E0280 001E0180 1A006210 */  beq        $3, $2, .L001E01EC
/* E0284 001E0184 00000000 */   nop
/* E0288 001E0188 80180300 */  sll        $3, $3, 2
/* E028C 001E018C 2800023C */  lui        $2, %hi(BtEntryEffectTbl)
/* E0290 001E0190 70FA4224 */  addiu      $2, $2, %lo(BtEntryEffectTbl)
/* E0294 001E0194 21104300 */  addu       $2, $2, $3
/* E0298 001E0198 E89D848F */  lw         $4, -0x6218($gp)
/* E029C 001E019C 0000458C */  lw         $5, 0x0($2)
/* E02A0 001E01A0 948B868F */  lw         $6, -0x746C($gp)
/* E02A4 001E01A4 283EC072 */  paddub     $7, $22, $0
/* E02A8 001E01A8 28462072 */  paddub     $8, $17, $0
/* E02AC 001E01AC 284E0072 */  paddub     $9, $16, $0
/* E02B0 001E01B0 30B9060C */  jal        Entry__17CSHOT_EFFECT_PACKFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* E02B4 001E01B4 00000000 */   nop
/* E02B8 001E01B8 FFFF0324 */  addiu      $3, $0, -0x1
/* E02BC 001E01BC 07004314 */  bne        $2, $3, .L001E01DC
/* E02C0 001E01C0 00000000 */   nop
/* E02C4 001E01C4 2A00023C */  lui        $2, %hi(_2331)
/* E02C8 001E01C8 10D04424 */  addiu      $4, $2, %lo(_2331)
/* E02CC 001E01CC A611040C */  jal        printf
/* E02D0 001E01D0 00000000 */   nop
/* E02D4 001E01D4 05000010 */  b          .L001E01EC
/* E02D8 001E01D8 00000000 */   nop
.L001E01DC:
/* E02DC 001E01DC 21185302 */  addu       $3, $18, $19
/* E02E0 001E01E0 0200013C */  lui        $at, (0x20000 >> 16)
/* E02E4 001E01E4 21086100 */  addu       $at, $3, $at
/* E02E8 001E01E8 98DE22A4 */  sh         $2, -0x2168($at)
.L001E01EC:
/* E02EC 001E01EC 6A008386 */  lh         $3, 0x6A($20)
/* E02F0 001E01F0 FFFF0224 */  addiu      $2, $0, -0x1
/* E02F4 001E01F4 1A006210 */  beq        $3, $2, .L001E0260
/* E02F8 001E01F8 00000000 */   nop
/* E02FC 001E01FC 80180300 */  sll        $3, $3, 2
/* E0300 001E0200 2800023C */  lui        $2, %hi(BtEntryEffectTbl)
/* E0304 001E0204 70FA4224 */  addiu      $2, $2, %lo(BtEntryEffectTbl)
/* E0308 001E0208 21104300 */  addu       $2, $2, $3
/* E030C 001E020C E89D848F */  lw         $4, -0x6218($gp)
/* E0310 001E0210 0000458C */  lw         $5, 0x0($2)
/* E0314 001E0214 948B868F */  lw         $6, -0x746C($gp)
/* E0318 001E0218 283EC072 */  paddub     $7, $22, $0
/* E031C 001E021C 28462072 */  paddub     $8, $17, $0
/* E0320 001E0220 284E0072 */  paddub     $9, $16, $0
/* E0324 001E0224 30B9060C */  jal        Entry__17CSHOT_EFFECT_PACKFP14BT_SHOT_EFFECTPUiiP14CDataAlloc2_1_i
/* E0328 001E0228 00000000 */   nop
/* E032C 001E022C FFFF0324 */  addiu      $3, $0, -0x1
/* E0330 001E0230 07004314 */  bne        $2, $3, .L001E0250
/* E0334 001E0234 00000000 */   nop
/* E0338 001E0238 2A00023C */  lui        $2, %hi(_2331)
/* E033C 001E023C 10D04424 */  addiu      $4, $2, %lo(_2331)
/* E0340 001E0240 A611040C */  jal        printf
/* E0344 001E0244 00000000 */   nop
/* E0348 001E0248 05000010 */  b          .L001E0260
/* E034C 001E024C 00000000 */   nop
.L001E0250:
/* E0350 001E0250 21185302 */  addu       $3, $18, $19
/* E0354 001E0254 0200013C */  lui        $at, (0x20000 >> 16)
/* E0358 001E0258 21086100 */  addu       $at, $3, $at
/* E035C 001E025C 9ADE22A4 */  sh         $2, -0x2166($at)
.L001E0260:
/* E0360 001E0260 4800628E */  lw         $2, 0x48($19)
/* E0364 001E0264 01004224 */  addiu      $2, $2, 0x1
/* E0368 001E0268 480062AE */  sw         $2, 0x48($19)
/* E036C 001E026C 01000224 */  addiu      $2, $0, 0x1
/* E0370 001E0270 9000BF7B */  lq         $31, 0x90($sp)
/* E0374 001E0274 8000BE7B */  lq         $fp, 0x80($sp)
/* E0378 001E0278 7000B77B */  lq         $23, 0x70($sp)
/* E037C 001E027C 6000B67B */  lq         $22, 0x60($sp)
/* E0380 001E0280 5000B57B */  lq         $21, 0x50($sp)
/* E0384 001E0284 4000B47B */  lq         $20, 0x40($sp)
/* E0388 001E0288 3000B37B */  lq         $19, 0x30($sp)
/* E038C 001E028C 2000B27B */  lq         $18, 0x20($sp)
/* E0390 001E0290 1000B17B */  lq         $17, 0x10($sp)
/* E0394 001E0294 0000B07B */  lq         $16, 0x0($sp)
/* E0398 001E0298 5001BD27 */  addiu      $sp, $sp, 0x150
/* E039C 001E029C 0800E003 */  jr         $31
/* E03A0 001E02A0 00000000 */   nop
/* E03A4 001E02A4 00000000 */  nop
/* E03A8 001E02A8 00000000 */  nop
/* E03AC 001E02AC 00000000 */  nop
