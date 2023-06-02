.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
/* 35100 00135000 D0FDBD27 */  addiu      $sp, $sp, -0x230
/* 35104 00135004 A000BF7F */  sq         $31, 0xA0($sp)
/* 35108 00135008 9000BE7F */  sq         $fp, 0x90($sp)
/* 3510C 0013500C 8000B77F */  sq         $23, 0x80($sp)
/* 35110 00135010 7000B67F */  sq         $22, 0x70($sp)
/* 35114 00135014 6000B57F */  sq         $21, 0x60($sp)
/* 35118 00135018 5000B47F */  sq         $20, 0x50($sp)
/* 3511C 0013501C 4000B37F */  sq         $19, 0x40($sp)
/* 35120 00135020 3000B27F */  sq         $18, 0x30($sp)
/* 35124 00135024 2000B17F */  sq         $17, 0x20($sp)
/* 35128 00135028 1000B07F */  sq         $16, 0x10($sp)
/* 3512C 0013502C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 35130 00135030 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 35134 00135034 28B68070 */  paddub     $22, $4, $0
/* 35138 00135038 28AEA070 */  paddub     $21, $5, $0
/* 3513C 0013503C 28A6C070 */  paddub     $20, $6, $0
/* 35140 00135040 289EE070 */  paddub     $19, $7, $0
/* 35144 00135044 28960071 */  paddub     $18, $8, $0
/* 35148 00135048 288E6071 */  paddub     $17, $11, $0
/* 3514C 0013504C 1800828C */  lw         $2, 0x18($4)
/* 35150 00135050 04004010 */  beqz       $2, .L00135064
/* 35154 00135054 00000000 */   nop
/* 35158 00135058 1C00C28E */  lw         $2, 0x1C($22)
/* 3515C 0013505C 04004014 */  bnez       $2, .L00135070
/* 35160 00135060 00000000 */   nop
.L00135064:
/* 35164 00135064 28160070 */  paddub     $2, $0, $0
/* 35168 00135068 2F020010 */  b          .L00135928
/* 3516C 0013506C 00000000 */   nop
.L00135070:
/* 35170 00135070 C000A427 */  addiu      $4, $sp, 0xC0
/* 35174 00135074 B0026526 */  addiu      $5, $19, 0x2B0
/* 35178 00135078 0C86040C */  jal        sceVu0CopyVector
/* 3517C 0013507C 00000000 */   nop
/* 35180 00135080 D000A427 */  addiu      $4, $sp, 0xD0
/* 35184 00135084 C0026526 */  addiu      $5, $19, 0x2C0
/* 35188 00135088 0C86040C */  jal        sceVu0CopyVector
/* 3518C 0013508C 00000000 */   nop
/* 35190 00135090 06000224 */  addiu      $2, $0, 0x6
/* 35194 00135094 06004212 */  beq        $18, $2, .L001350B0
/* 35198 00135098 00000000 */   nop
/* 3519C 0013509C 04000224 */  addiu      $2, $0, 0x4
/* 351A0 001350A0 03004212 */  beq        $18, $2, .L001350B0
/* 351A4 001350A4 00000000 */   nop
/* 351A8 001350A8 08004016 */  bnez       $18, .L001350CC
/* 351AC 001350AC 00000000 */   nop
.L001350B0:
/* 351B0 001350B0 2001A427 */  addiu      $4, $sp, 0x120
/* 351B4 001350B4 D0006526 */  addiu      $5, $19, 0xD0
/* 351B8 001350B8 28368072 */  paddub     $6, $20, $0
/* 351BC 001350BC 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 351C0 001350C0 00000000 */   nop
/* 351C4 001350C4 06000010 */  b          .L001350E0
/* 351C8 001350C8 00000000 */   nop
.L001350CC:
/* 351CC 001350CC 2001A427 */  addiu      $4, $sp, 0x120
/* 351D0 001350D0 10006526 */  addiu      $5, $19, 0x10
/* 351D4 001350D4 28368072 */  paddub     $6, $20, $0
/* 351D8 001350D8 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 351DC 001350DC 00000000 */   nop
.L001350E0:
/* 351E0 001350E0 B800B5AF */  sw         $21, 0xB8($sp)
/* 351E4 001350E4 2886A072 */  paddub     $16, $21, $0
/* 351E8 001350E8 0010033C */  lui        $3, (0x10000000 >> 16)
/* 351EC 001350EC 0000A3AE */  sw         $3, 0x0($21)
/* 351F0 001350F0 0400B526 */  addiu      $21, $21, 0x4
/* 351F4 001350F4 0000A0AE */  sw         $0, 0x0($21)
/* 351F8 001350F8 0400B526 */  addiu      $21, $21, 0x4
/* 351FC 001350FC 0000A0AE */  sw         $0, 0x0($21)
/* 35200 00135100 0400B526 */  addiu      $21, $21, 0x4
/* 35204 00135104 0000A0AE */  sw         $0, 0x0($21)
/* 35208 00135108 0400B526 */  addiu      $21, $21, 0x4
/* 3520C 0013510C BC00B5AF */  sw         $21, 0xBC($sp)
/* 35210 00135110 0000A0AE */  sw         $0, 0x0($21)
/* 35214 00135114 0400B526 */  addiu      $21, $21, 0x4
/* 35218 00135118 0000A0AE */  sw         $0, 0x0($21)
/* 3521C 0013511C 0400B526 */  addiu      $21, $21, 0x4
/* 35220 00135120 0000A0AE */  sw         $0, 0x0($21)
/* 35224 00135124 0400B526 */  addiu      $21, $21, 0x4
/* 35228 00135128 0050023C */  lui        $2, (0x50000004 >> 16)
/* 3522C 0013512C 04004234 */  ori        $2, $2, (0x50000004 & 0xFFFF)
/* 35230 00135130 0000A2AE */  sw         $2, 0x0($21)
/* 35234 00135134 0400B526 */  addiu      $21, $21, 0x4
/* 35238 00135138 03800234 */  ori        $2, $0, 0x8003
/* 3523C 0013513C 0000A2AE */  sw         $2, 0x0($21)
/* 35240 00135140 0400B526 */  addiu      $21, $21, 0x4
/* 35244 00135144 0000A3AE */  sw         $3, 0x0($21)
/* 35248 00135148 0400B526 */  addiu      $21, $21, 0x4
/* 3524C 0013514C 0E000224 */  addiu      $2, $0, 0xE
/* 35250 00135150 0000A2AE */  sw         $2, 0x0($21)
/* 35254 00135154 0400B526 */  addiu      $21, $21, 0x4
/* 35258 00135158 0000A0AE */  sw         $0, 0x0($21)
/* 3525C 0013515C 0400B526 */  addiu      $21, $21, 0x4
/* 35260 00135160 0000A0AE */  sw         $0, 0x0($21)
/* 35264 00135164 0400B526 */  addiu      $21, $21, 0x4
/* 35268 00135168 0000A0AE */  sw         $0, 0x0($21)
/* 3526C 0013516C 0400B526 */  addiu      $21, $21, 0x4
/* 35270 00135170 1A000224 */  addiu      $2, $0, 0x1A
/* 35274 00135174 0000A2AE */  sw         $2, 0x0($21)
/* 35278 00135178 0400B526 */  addiu      $21, $21, 0x4
/* 3527C 0013517C 0000A0AE */  sw         $0, 0x0($21)
/* 35280 00135180 0400B526 */  addiu      $21, $21, 0x4
/* 35284 00135184 28260070 */  paddub     $4, $0, $0
/* 35288 00135188 2003628E */  lw         $2, 0x320($19)
/* 3528C 0013518C 2B100200 */  sltu       $2, $0, $2
/* 35290 00135190 01004238 */  xori       $2, $2, 0x1
/* 35294 00135194 07004010 */  beqz       $2, .L001351B4
/* 35298 00135198 00000000 */   nop
/* 3529C 0013519C 4003628E */  lw         $2, 0x340($19)
/* 352A0 001351A0 2B100200 */  sltu       $2, $0, $2
/* 352A4 001351A4 01004238 */  xori       $2, $2, 0x1
/* 352A8 001351A8 02004010 */  beqz       $2, .L001351B4
/* 352AC 001351AC 00000000 */   nop
/* 352B0 001351B0 01000464 */  daddiu     $4, $0, 0x1
.L001351B4:
/* 352B4 001351B4 2403628E */  lw         $2, 0x324($19)
/* 352B8 001351B8 2B100200 */  sltu       $2, $0, $2
/* 352BC 001351BC 04004010 */  beqz       $2, .L001351D0
/* 352C0 001351C0 00000000 */   nop
/* 352C4 001351C4 2003628E */  lw         $2, 0x320($19)
/* 352C8 001351C8 2B100200 */  sltu       $2, $0, $2
/* 352CC 001351CC 01004238 */  xori       $2, $2, 0x1
.L001351D0:
/* 352D0 001351D0 FF004230 */  andi       $2, $2, 0xFF
/* 352D4 001351D4 40110200 */  sll        $2, $2, 5
/* 352D8 001351D8 40004334 */  ori        $3, $2, 0x40
/* 352DC 001351DC FF008230 */  andi       $2, $4, 0xFF
/* 352E0 001351E0 00110200 */  sll        $2, $2, 4
/* 352E4 001351E4 25186200 */  or         $3, $3, $2
/* 352E8 001351E8 2003628E */  lw         $2, 0x320($19)
/* 352EC 001351EC 2B100200 */  sltu       $2, $0, $2
/* 352F0 001351F0 01004238 */  xori       $2, $2, 0x1
/* 352F4 001351F4 FF004230 */  andi       $2, $2, 0xFF
/* 352F8 001351F8 C0100200 */  sll        $2, $2, 3
/* 352FC 001351FC 25184300 */  or         $3, $2, $3
/* 35300 00135200 0F00423A */  xori       $2, $18, 0xF
/* 35304 00135204 0100422C */  sltiu      $2, $2, 0x1
/* 35308 00135208 00120200 */  sll        $2, $2, 8
/* 3530C 0013520C 25104300 */  or         $2, $2, $3
/* 35310 00135210 0000A2AE */  sw         $2, 0x0($21)
/* 35314 00135214 0400B526 */  addiu      $21, $21, 0x4
/* 35318 00135218 0000A0AE */  sw         $0, 0x0($21)
/* 3531C 0013521C 0400B526 */  addiu      $21, $21, 0x4
/* 35320 00135220 1B000224 */  addiu      $2, $0, 0x1B
/* 35324 00135224 0000A2AE */  sw         $2, 0x0($21)
/* 35328 00135228 0400B526 */  addiu      $21, $21, 0x4
/* 3532C 0013522C 0000A0AE */  sw         $0, 0x0($21)
/* 35330 00135230 0400B526 */  addiu      $21, $21, 0x4
/* 35334 00135234 38036392 */  lbu        $3, 0x338($19)
/* 35338 00135238 39036292 */  lbu        $2, 0x339($19)
/* 3533C 0013523C 00120200 */  sll        $2, $2, 8
/* 35340 00135240 25186200 */  or         $3, $3, $2
/* 35344 00135244 3A036292 */  lbu        $2, 0x33A($19)
/* 35348 00135248 00140200 */  sll        $2, $2, 16
/* 3534C 0013524C 25186200 */  or         $3, $3, $2
/* 35350 00135250 0000A3AE */  sw         $3, 0x0($21)
/* 35354 00135254 0400B526 */  addiu      $21, $21, 0x4
/* 35358 00135258 0000A0AE */  sw         $0, 0x0($21)
/* 3535C 0013525C 0400B526 */  addiu      $21, $21, 0x4
/* 35360 00135260 3D000224 */  addiu      $2, $0, 0x3D
/* 35364 00135264 0000A2AE */  sw         $2, 0x0($21)
/* 35368 00135268 0400B526 */  addiu      $21, $21, 0x4
/* 3536C 0013526C 0000A0AE */  sw         $0, 0x0($21)
/* 35370 00135270 0400B526 */  addiu      $21, $21, 0x4
/* 35374 00135274 0000A0AE */  sw         $0, 0x0($21)
/* 35378 00135278 0400B526 */  addiu      $21, $21, 0x4
/* 3537C 0013527C 0003023C */  lui        $2, (0x300003C >> 16)
/* 35380 00135280 3C004234 */  ori        $2, $2, (0x300003C & 0xFFFF)
/* 35384 00135284 0000A2AE */  sw         $2, 0x0($21)
/* 35388 00135288 0400B526 */  addiu      $21, $21, 0x4
/* 3538C 0013528C 0002023C */  lui        $2, (0x20000AA >> 16)
/* 35390 00135290 AA004234 */  ori        $2, $2, (0x20000AA & 0xFFFF)
/* 35394 00135294 0000A2AE */  sw         $2, 0x0($21)
/* 35398 00135298 0400B526 */  addiu      $21, $21, 0x4
/* 3539C 0013529C 28F6A072 */  paddub     $fp, $21, $0
/* 353A0 001352A0 0400B526 */  addiu      $21, $21, 0x4
/* 353A4 001352A4 28BEA072 */  paddub     $23, $21, $0
/* 353A8 001352A8 40101200 */  sll        $2, $18, 1
/* 353AC 001352AC 0000A2AE */  sw         $2, 0x0($21)
/* 353B0 001352B0 0400B526 */  addiu      $21, $21, 0x4
/* 353B4 001352B4 3C03628E */  lw         $2, 0x33C($19)
/* 353B8 001352B8 0000A2AE */  sw         $2, 0x0($21)
/* 353BC 001352BC 0400B526 */  addiu      $21, $21, 0x4
/* 353C0 001352C0 1003628E */  lw         $2, 0x310($19)
/* 353C4 001352C4 0000A2AE */  sw         $2, 0x0($21)
/* 353C8 001352C8 0400B526 */  addiu      $21, $21, 0x4
/* 353CC 001352CC 0000A0AE */  sw         $0, 0x0($21)
/* 353D0 001352D0 0400B526 */  addiu      $21, $21, 0x4
/* 353D4 001352D4 2001A227 */  addiu      $2, $sp, 0x120
/* 353D8 001352D8 00004278 */  lq         $2, 0x0($2)
/* 353DC 001352DC 0000A27E */  sq         $2, 0x0($21)
/* 353E0 001352E0 1000B526 */  addiu      $21, $21, 0x10
/* 353E4 001352E4 3001A227 */  addiu      $2, $sp, 0x130
/* 353E8 001352E8 00004278 */  lq         $2, 0x0($2)
/* 353EC 001352EC 0000A27E */  sq         $2, 0x0($21)
/* 353F0 001352F0 1000B526 */  addiu      $21, $21, 0x10
/* 353F4 001352F4 4001A227 */  addiu      $2, $sp, 0x140
/* 353F8 001352F8 00004278 */  lq         $2, 0x0($2)
/* 353FC 001352FC 0000A27E */  sq         $2, 0x0($21)
/* 35400 00135300 1000B526 */  addiu      $21, $21, 0x10
/* 35404 00135304 5001A227 */  addiu      $2, $sp, 0x150
/* 35408 00135308 00004278 */  lq         $2, 0x0($2)
/* 3540C 0013530C 0000A27E */  sq         $2, 0x0($21)
/* 35410 00135310 1000B526 */  addiu      $21, $21, 0x10
/* 35414 00135314 000084DA */  lqc2       $vf4, 0x0($20)
/* 35418 00135318 2A21C44B */  vmul.xyz   $vf4, $vf4, $vf4
/* 3541C 0013531C FF02004A */  vnop
/* 35420 00135320 FF02004A */  vnop
/* 35424 00135324 FF02004A */  vnop
/* 35428 00135328 3D23854B */  vmr32.xy   $vf5, $vf4
/* 3542C 0013532C FF02004A */  vnop
/* 35430 00135330 FF02004A */  vnop
/* 35434 00135334 FF02004A */  vnop
/* 35438 00135338 3D2B064B */  vmr32.x    $vf6, $vf5
/* 3543C 0013533C FF02004A */  vnop
/* 35440 00135340 FF02004A */  vnop
/* 35444 00135344 FF02004A */  vnop
/* 35448 00135348 E821054B */  vadd.x     $vf7, $vf4, $vf5
/* 3544C 0013534C FF02004A */  vnop
/* 35450 00135350 FF02004A */  vnop
/* 35454 00135354 FF02004A */  vnop
/* 35458 00135358 6831074B */  vadd.x     $vf5, $vf6, $vf7
/* 3545C 0013535C BE03654A */  vrsqrt     Q, $vf0w, $vf5x
/* 35460 00135360 BF03004A */  vwaitq
/* 35464 00135364 00B04248 */  cfc2       $2, $vi22
/* 35468 00135368 00608244 */  mtc1       $2, $f12
/* 3546C 0013536C 10008226 */  addiu      $2, $20, 0x10
/* 35470 00135370 000044D8 */  lqc2       $vf4, 0x0($2)
/* 35474 00135374 2A21C44B */  vmul.xyz   $vf4, $vf4, $vf4
/* 35478 00135378 FF02004A */  vnop
/* 3547C 0013537C FF02004A */  vnop
/* 35480 00135380 FF02004A */  vnop
/* 35484 00135384 3D23854B */  vmr32.xy   $vf5, $vf4
/* 35488 00135388 FF02004A */  vnop
/* 3548C 0013538C FF02004A */  vnop
/* 35490 00135390 FF02004A */  vnop
/* 35494 00135394 3D2B064B */  vmr32.x    $vf6, $vf5
/* 35498 00135398 FF02004A */  vnop
/* 3549C 0013539C FF02004A */  vnop
/* 354A0 001353A0 FF02004A */  vnop
/* 354A4 001353A4 E821054B */  vadd.x     $vf7, $vf4, $vf5
/* 354A8 001353A8 FF02004A */  vnop
/* 354AC 001353AC FF02004A */  vnop
/* 354B0 001353B0 FF02004A */  vnop
/* 354B4 001353B4 6831074B */  vadd.x     $vf5, $vf6, $vf7
/* 354B8 001353B8 BE03654A */  vrsqrt     Q, $vf0w, $vf5x
/* 354BC 001353BC BF03004A */  vwaitq
/* 354C0 001353C0 00B04248 */  cfc2       $2, $vi22
/* 354C4 001353C4 00A08244 */  mtc1       $2, $f20
/* 354C8 001353C8 20008226 */  addiu      $2, $20, 0x20
/* 354CC 001353CC 000044D8 */  lqc2       $vf4, 0x0($2)
/* 354D0 001353D0 2A21C44B */  vmul.xyz   $vf4, $vf4, $vf4
/* 354D4 001353D4 FF02004A */  vnop
/* 354D8 001353D8 FF02004A */  vnop
/* 354DC 001353DC FF02004A */  vnop
/* 354E0 001353E0 3D23854B */  vmr32.xy   $vf5, $vf4
/* 354E4 001353E4 FF02004A */  vnop
/* 354E8 001353E8 FF02004A */  vnop
/* 354EC 001353EC FF02004A */  vnop
/* 354F0 001353F0 3D2B064B */  vmr32.x    $vf6, $vf5
/* 354F4 001353F4 FF02004A */  vnop
/* 354F8 001353F8 FF02004A */  vnop
/* 354FC 001353FC FF02004A */  vnop
/* 35500 00135400 E821054B */  vadd.x     $vf7, $vf4, $vf5
/* 35504 00135404 FF02004A */  vnop
/* 35508 00135408 FF02004A */  vnop
/* 3550C 0013540C FF02004A */  vnop
/* 35510 00135410 6831074B */  vadd.x     $vf5, $vf6, $vf7
/* 35514 00135414 BE03654A */  vrsqrt     Q, $vf0w, $vf5x
/* 35518 00135418 BF03004A */  vwaitq
/* 3551C 0013541C 00B04248 */  cfc2       $2, $vi22
/* 35520 00135420 00A88244 */  mtc1       $2, $f21
/* 35524 00135424 2003628E */  lw         $2, 0x320($19)
/* 35528 00135428 12004010 */  beqz       $2, .L00135474
/* 3552C 0013542C 00000000 */   nop
/* 35530 00135430 02630C46 */  mul.s      $f12, $f12, $f12
/* 35534 00135434 6001A427 */  addiu      $4, $sp, 0x160
/* 35538 00135438 282E8072 */  paddub     $5, $20, $0
/* 3553C 0013543C FA85040C */  jal        sceVu0ScaleVector
/* 35540 00135440 00000000 */   nop
/* 35544 00135444 02A31446 */  mul.s      $f12, $f20, $f20
/* 35548 00135448 7001A427 */  addiu      $4, $sp, 0x170
/* 3554C 0013544C 10008526 */  addiu      $5, $20, 0x10
/* 35550 00135450 FA85040C */  jal        sceVu0ScaleVector
/* 35554 00135454 00000000 */   nop
/* 35558 00135458 02AB1546 */  mul.s      $f12, $f21, $f21
/* 3555C 0013545C 8001A427 */  addiu      $4, $sp, 0x180
/* 35560 00135460 20008526 */  addiu      $5, $20, 0x20
/* 35564 00135464 FA85040C */  jal        sceVu0ScaleVector
/* 35568 00135468 00000000 */   nop
/* 3556C 0013546C 0F000010 */  b          .L001354AC
/* 35570 00135470 00000000 */   nop
.L00135474:
/* 35574 00135474 6001A427 */  addiu      $4, $sp, 0x160
/* 35578 00135478 282E8072 */  paddub     $5, $20, $0
/* 3557C 0013547C FA85040C */  jal        sceVu0ScaleVector
/* 35580 00135480 00000000 */   nop
/* 35584 00135484 7001A427 */  addiu      $4, $sp, 0x170
/* 35588 00135488 10008526 */  addiu      $5, $20, 0x10
/* 3558C 0013548C 06A30046 */  mov.s      $f12, $f20
/* 35590 00135490 FA85040C */  jal        sceVu0ScaleVector
/* 35594 00135494 00000000 */   nop
/* 35598 00135498 8001A427 */  addiu      $4, $sp, 0x180
/* 3559C 0013549C 20008526 */  addiu      $5, $20, 0x20
/* 355A0 001354A0 06AB0046 */  mov.s      $f12, $f21
/* 355A4 001354A4 FA85040C */  jal        sceVu0ScaleVector
/* 355A8 001354A8 00000000 */   nop
.L001354AC:
/* 355AC 001354AC 6C01A0AF */  sw         $0, 0x16C($sp)
/* 355B0 001354B0 7C01A0AF */  sw         $0, 0x17C($sp)
/* 355B4 001354B4 8C01A0AF */  sw         $0, 0x18C($sp)
/* 355B8 001354B8 6001A227 */  addiu      $2, $sp, 0x160
/* 355BC 001354BC 00004278 */  lq         $2, 0x0($2)
/* 355C0 001354C0 0000A27E */  sq         $2, 0x0($21)
/* 355C4 001354C4 1000B526 */  addiu      $21, $21, 0x10
/* 355C8 001354C8 7001A227 */  addiu      $2, $sp, 0x170
/* 355CC 001354CC 00004278 */  lq         $2, 0x0($2)
/* 355D0 001354D0 0000A27E */  sq         $2, 0x0($21)
/* 355D4 001354D4 1000B526 */  addiu      $21, $21, 0x10
/* 355D8 001354D8 8001A227 */  addiu      $2, $sp, 0x180
/* 355DC 001354DC 00004278 */  lq         $2, 0x0($2)
/* 355E0 001354E0 0000A27E */  sq         $2, 0x0($21)
/* 355E4 001354E4 1000B526 */  addiu      $21, $21, 0x10
/* 355E8 001354E8 9001A227 */  addiu      $2, $sp, 0x190
/* 355EC 001354EC 00004278 */  lq         $2, 0x0($2)
/* 355F0 001354F0 0000A27E */  sq         $2, 0x0($21)
/* 355F4 001354F4 1000B526 */  addiu      $21, $21, 0x10
/* 355F8 001354F8 BD002016 */  bnez       $17, .L001357F0
/* 355FC 001354FC 00000000 */   nop
/* 35600 00135500 1001627A */  lq         $2, 0x110($19)
/* 35604 00135504 0000A27E */  sq         $2, 0x0($21)
/* 35608 00135508 1000B526 */  addiu      $21, $21, 0x10
/* 3560C 0013550C 2001627A */  lq         $2, 0x120($19)
/* 35610 00135510 0000A27E */  sq         $2, 0x0($21)
/* 35614 00135514 1000B526 */  addiu      $21, $21, 0x10
/* 35618 00135518 3001627A */  lq         $2, 0x130($19)
/* 3561C 0013551C 0000A27E */  sq         $2, 0x0($21)
/* 35620 00135520 1000B526 */  addiu      $21, $21, 0x10
/* 35624 00135524 4001627A */  lq         $2, 0x140($19)
/* 35628 00135528 0000A27E */  sq         $2, 0x0($21)
/* 3562C 0013552C 1000B526 */  addiu      $21, $21, 0x10
/* 35630 00135530 5001627A */  lq         $2, 0x150($19)
/* 35634 00135534 0000A27E */  sq         $2, 0x0($21)
/* 35638 00135538 1000B526 */  addiu      $21, $21, 0x10
/* 3563C 0013553C 6001627A */  lq         $2, 0x160($19)
/* 35640 00135540 0000A27E */  sq         $2, 0x0($21)
/* 35644 00135544 1000B526 */  addiu      $21, $21, 0x10
/* 35648 00135548 7001627A */  lq         $2, 0x170($19)
/* 3564C 0013554C 0000A27E */  sq         $2, 0x0($21)
/* 35650 00135550 1000B526 */  addiu      $21, $21, 0x10
/* 35654 00135554 8001627A */  lq         $2, 0x180($19)
/* 35658 00135558 0000A27E */  sq         $2, 0x0($21)
/* 3565C 0013555C 1000B526 */  addiu      $21, $21, 0x10
/* 35660 00135560 9001627A */  lq         $2, 0x190($19)
/* 35664 00135564 0000A27E */  sq         $2, 0x0($21)
/* 35668 00135568 1000B526 */  addiu      $21, $21, 0x10
/* 3566C 0013556C A001627A */  lq         $2, 0x1A0($19)
/* 35670 00135570 0000A27E */  sq         $2, 0x0($21)
/* 35674 00135574 1000B526 */  addiu      $21, $21, 0x10
/* 35678 00135578 B001627A */  lq         $2, 0x1B0($19)
/* 3567C 0013557C 0000A27E */  sq         $2, 0x0($21)
/* 35680 00135580 1000B526 */  addiu      $21, $21, 0x10
/* 35684 00135584 1002627A */  lq         $2, 0x210($19)
/* 35688 00135588 0000A27E */  sq         $2, 0x0($21)
/* 3568C 0013558C 1000B526 */  addiu      $21, $21, 0x10
/* 35690 00135590 2002627A */  lq         $2, 0x220($19)
/* 35694 00135594 0000A27E */  sq         $2, 0x0($21)
/* 35698 00135598 1000B526 */  addiu      $21, $21, 0x10
/* 3569C 0013559C 2803628E */  lw         $2, 0x328($19)
/* 356A0 001355A0 0000A2AE */  sw         $2, 0x0($21)
/* 356A4 001355A4 0400B526 */  addiu      $21, $21, 0x4
/* 356A8 001355A8 3403628E */  lw         $2, 0x334($19)
/* 356AC 001355AC 0000A2AE */  sw         $2, 0x0($21)
/* 356B0 001355B0 0400B526 */  addiu      $21, $21, 0x4
/* 356B4 001355B4 3003628E */  lw         $2, 0x330($19)
/* 356B8 001355B8 0000A2AE */  sw         $2, 0x0($21)
/* 356BC 001355BC 0400B526 */  addiu      $21, $21, 0x4
/* 356C0 001355C0 2C03628E */  lw         $2, 0x32C($19)
/* 356C4 001355C4 0000A2AE */  sw         $2, 0x0($21)
/* 356C8 001355C8 0400B526 */  addiu      $21, $21, 0x4
/* 356CC 001355CC 3C03628E */  lw         $2, 0x33C($19)
/* 356D0 001355D0 1C004010 */  beqz       $2, .L00135644
/* 356D4 001355D4 00000000 */   nop
/* 356D8 001355D8 E00160C6 */  lwc1       $f0, 0x1E0($19)
/* 356DC 001355DC A001A0E7 */  swc1       $f0, 0x1A0($sp)
/* 356E0 001355E0 E40160C6 */  lwc1       $f0, 0x1E4($19)
/* 356E4 001355E4 A401A0E7 */  swc1       $f0, 0x1A4($sp)
/* 356E8 001355E8 E80160C6 */  lwc1       $f0, 0x1E8($19)
/* 356EC 001355EC A801A0E7 */  swc1       $f0, 0x1A8($sp)
/* 356F0 001355F0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 356F4 001355F4 AC01A2AF */  sw         $2, 0x1AC($sp)
/* 356F8 001355F8 B001A427 */  addiu      $4, $sp, 0x1B0
/* 356FC 001355FC 282E8072 */  paddub     $5, $20, $0
/* 35700 00135600 1086040C */  jal        sceVu0CopyMatrix
/* 35704 00135604 00000000 */   nop
/* 35708 00135608 B001A427 */  addiu      $4, $sp, 0x1B0
/* 3570C 0013560C 282E8070 */  paddub     $5, $4, $0
/* 35710 00135610 B285040C */  jal        sceVu0InversMatrix
/* 35714 00135614 00000000 */   nop
/* 35718 00135618 A001A427 */  addiu      $4, $sp, 0x1A0
/* 3571C 0013561C B001A527 */  addiu      $5, $sp, 0x1B0
/* 35720 00135620 28368070 */  paddub     $6, $4, $0
/* 35724 00135624 6285040C */  jal        sceVu0ApplyMatrix
/* 35728 00135628 00000000 */   nop
/* 3572C 0013562C A001A227 */  addiu      $2, $sp, 0x1A0
/* 35730 00135630 00004278 */  lq         $2, 0x0($2)
/* 35734 00135634 0000A27E */  sq         $2, 0x0($21)
/* 35738 00135638 1000B526 */  addiu      $21, $21, 0x10
/* 3573C 0013563C 02000010 */  b          .L00135648
/* 35740 00135640 00000000 */   nop
.L00135644:
/* 35744 00135644 1000B526 */  addiu      $21, $21, 0x10
.L00135648:
/* 35748 00135648 F001A427 */  addiu      $4, $sp, 0x1F0
/* 3574C 0013564C 30026526 */  addiu      $5, $19, 0x230
/* 35750 00135650 10006626 */  addiu      $6, $19, 0x10
/* 35754 00135654 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 35758 00135658 00000000 */   nop
/* 3575C 0013565C F001A427 */  addiu      $4, $sp, 0x1F0
/* 35760 00135660 282E8070 */  paddub     $5, $4, $0
/* 35764 00135664 28368072 */  paddub     $6, $20, $0
/* 35768 00135668 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 3576C 0013566C 00000000 */   nop
/* 35770 00135670 F001A227 */  addiu      $2, $sp, 0x1F0
/* 35774 00135674 00004278 */  lq         $2, 0x0($2)
/* 35778 00135678 0000A27E */  sq         $2, 0x0($21)
/* 3577C 0013567C 1000B526 */  addiu      $21, $21, 0x10
/* 35780 00135680 0002A227 */  addiu      $2, $sp, 0x200
/* 35784 00135684 00004278 */  lq         $2, 0x0($2)
/* 35788 00135688 0000A27E */  sq         $2, 0x0($21)
/* 3578C 0013568C 1000B526 */  addiu      $21, $21, 0x10
/* 35790 00135690 1002A227 */  addiu      $2, $sp, 0x210
/* 35794 00135694 00004278 */  lq         $2, 0x0($2)
/* 35798 00135698 0000A27E */  sq         $2, 0x0($21)
/* 3579C 0013569C 1000B526 */  addiu      $21, $21, 0x10
/* 357A0 001356A0 2002A227 */  addiu      $2, $sp, 0x220
/* 357A4 001356A4 00004278 */  lq         $2, 0x0($2)
/* 357A8 001356A8 0000A27E */  sq         $2, 0x0($21)
/* 357AC 001356AC 1000B526 */  addiu      $21, $21, 0x10
/* 357B0 001356B0 7002627A */  lq         $2, 0x270($19)
/* 357B4 001356B4 0000A27E */  sq         $2, 0x0($21)
/* 357B8 001356B8 1000B526 */  addiu      $21, $21, 0x10
/* 357BC 001356BC 8002627A */  lq         $2, 0x280($19)
/* 357C0 001356C0 0000A27E */  sq         $2, 0x0($21)
/* 357C4 001356C4 1000B526 */  addiu      $21, $21, 0x10
/* 357C8 001356C8 9002627A */  lq         $2, 0x290($19)
/* 357CC 001356CC 0000A27E */  sq         $2, 0x0($21)
/* 357D0 001356D0 1000B526 */  addiu      $21, $21, 0x10
/* 357D4 001356D4 A002627A */  lq         $2, 0x2A0($19)
/* 357D8 001356D8 0000A27E */  sq         $2, 0x0($21)
/* 357DC 001356DC 1000B526 */  addiu      $21, $21, 0x10
/* 357E0 001356E0 2003628E */  lw         $2, 0x320($19)
/* 357E4 001356E4 10004010 */  beqz       $2, .L00135728
/* 357E8 001356E8 00000000 */   nop
/* 357EC 001356EC E000A427 */  addiu      $4, $sp, 0xE0
/* 357F0 001356F0 D0026526 */  addiu      $5, $19, 0x2D0
/* 357F4 001356F4 28368072 */  paddub     $6, $20, $0
/* 357F8 001356F8 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 357FC 001356FC 00000000 */   nop
/* 35800 00135700 E000A427 */  addiu      $4, $sp, 0xE0
/* 35804 00135704 10006526 */  addiu      $5, $19, 0x10
/* 35808 00135708 28368070 */  paddub     $6, $4, $0
/* 3580C 0013570C 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 35810 00135710 00000000 */   nop
/* 35814 00135714 E000A427 */  addiu      $4, $sp, 0xE0
/* 35818 00135718 30026526 */  addiu      $5, $19, 0x230
/* 3581C 0013571C 28368070 */  paddub     $6, $4, $0
/* 35820 00135720 748D040C */  jal        MulMatrix__FPA4_fPA4_fPA4_f
/* 35824 00135724 00000000 */   nop
.L00135728:
/* 35828 00135728 2003628E */  lw         $2, 0x320($19)
/* 3582C 0013572C 0F004014 */  bnez       $2, .L0013576C
/* 35830 00135730 00000000 */   nop
/* 35834 00135734 00800234 */  ori        $2, $0, 0x8000
/* 35838 00135738 0000A2AE */  sw         $2, 0x0($21)
/* 3583C 0013573C 0400B526 */  addiu      $21, $21, 0x4
/* 35840 00135740 2E30023C */  lui        $2, (0x302EC000 >> 16)
/* 35844 00135744 00C04234 */  ori        $2, $2, (0x302EC000 & 0xFFFF)
/* 35848 00135748 0000A2AE */  sw         $2, 0x0($21)
/* 3584C 0013574C 0400B526 */  addiu      $21, $21, 0x4
/* 35850 00135750 12040224 */  addiu      $2, $0, 0x412
/* 35854 00135754 0000A2AE */  sw         $2, 0x0($21)
/* 35858 00135758 0400B526 */  addiu      $21, $21, 0x4
/* 3585C 0013575C 0000A0AE */  sw         $0, 0x0($21)
/* 35860 00135760 0400B526 */  addiu      $21, $21, 0x4
/* 35864 00135764 0D000010 */  b          .L0013579C
/* 35868 00135768 00000000 */   nop
.L0013576C:
/* 3586C 0013576C 00800234 */  ori        $2, $0, 0x8000
/* 35870 00135770 0000A2AE */  sw         $2, 0x0($21)
/* 35874 00135774 0400B526 */  addiu      $21, $21, 0x4
/* 35878 00135778 2230023C */  lui        $2, (0x3022C000 >> 16)
/* 3587C 0013577C 00C04234 */  ori        $2, $2, (0x3022C000 & 0xFFFF)
/* 35880 00135780 0000A2AE */  sw         $2, 0x0($21)
/* 35884 00135784 0400B526 */  addiu      $21, $21, 0x4
/* 35888 00135788 12040224 */  addiu      $2, $0, 0x412
/* 3588C 0013578C 0000A2AE */  sw         $2, 0x0($21)
/* 35890 00135790 0400B526 */  addiu      $21, $21, 0x4
/* 35894 00135794 0000A0AE */  sw         $0, 0x0($21)
/* 35898 00135798 0400B526 */  addiu      $21, $21, 0x4
.L0013579C:
/* 3589C 0013579C 01800234 */  ori        $2, $0, 0x8001
/* 358A0 001357A0 0000A2AE */  sw         $2, 0x0($21)
/* 358A4 001357A4 0400B526 */  addiu      $21, $21, 0x4
/* 358A8 001357A8 2E10023C */  lui        $2, (0x102E8000 >> 16)
/* 358AC 001357AC 00804234 */  ori        $2, $2, (0x102E8000 & 0xFFFF)
/* 358B0 001357B0 0000A2AE */  sw         $2, 0x0($21)
/* 358B4 001357B4 0400B526 */  addiu      $21, $21, 0x4
/* 358B8 001357B8 0E000224 */  addiu      $2, $0, 0xE
/* 358BC 001357BC 0000A2AE */  sw         $2, 0x0($21)
/* 358C0 001357C0 0400B526 */  addiu      $21, $21, 0x4
/* 358C4 001357C4 0000A0AE */  sw         $0, 0x0($21)
/* 358C8 001357C8 0400B526 */  addiu      $21, $21, 0x4
/* 358CC 001357CC 0000A0AE */  sw         $0, 0x0($21)
/* 358D0 001357D0 0400B526 */  addiu      $21, $21, 0x4
/* 358D4 001357D4 0000A0AE */  sw         $0, 0x0($21)
/* 358D8 001357D8 0400B526 */  addiu      $21, $21, 0x4
/* 358DC 001357DC 3F000224 */  addiu      $2, $0, 0x3F
/* 358E0 001357E0 0000A2AE */  sw         $2, 0x0($21)
/* 358E4 001357E4 0400B526 */  addiu      $21, $21, 0x4
/* 358E8 001357E8 0000A0AE */  sw         $0, 0x0($21)
/* 358EC 001357EC 0400B526 */  addiu      $21, $21, 0x4
.L001357F0:
/* 358F0 001357F0 2310B702 */  subu       $2, $21, $23
/* 358F4 001357F4 83100200 */  sra        $2, $2, 2
/* 358F8 001357F8 83100200 */  sra        $2, $2, 2
/* 358FC 001357FC 001C0200 */  sll        $3, $2, 16
/* 35900 00135800 006C023C */  lui        $2, (0x6C000000 >> 16)
/* 35904 00135804 25106200 */  or         $2, $3, $2
/* 35908 00135808 0000C2AF */  sw         $2, 0x0($fp)
/* 3590C 0013580C 2003628E */  lw         $2, 0x320($19)
/* 35910 00135810 07004010 */  beqz       $2, .L00135830
/* 35914 00135814 00000000 */   nop
/* 35918 00135818 2826A072 */  paddub     $4, $21, $0
/* 3591C 0013581C E000A527 */  addiu      $5, $sp, 0xE0
/* 35920 00135820 24D3040C */  jal        SetShadowData__FPUiPA4_f
/* 35924 00135824 00000000 */   nop
/* 35928 00135828 80100200 */  sll        $2, $2, 2
/* 3592C 0013582C 21A8A202 */  addu       $21, $21, $2
.L00135830:
/* 35930 00135830 BC00A28F */  lw         $2, 0xBC($sp)
/* 35934 00135834 2310A202 */  subu       $2, $21, $2
/* 35938 00135838 83100200 */  sra        $2, $2, 2
/* 3593C 0013583C 83180200 */  sra        $3, $2, 2
/* 35940 00135840 0000028E */  lw         $2, 0x0($16)
/* 35944 00135844 25104300 */  or         $2, $2, $3
/* 35948 00135848 000002AE */  sw         $2, 0x0($16)
/* 3594C 0013584C 1C00C38E */  lw         $3, 0x1C($22)
/* 35950 00135850 0030023C */  lui        $2, (0x30000000 >> 16)
/* 35954 00135854 25106200 */  or         $2, $3, $2
/* 35958 00135858 0000A2AE */  sw         $2, 0x0($21)
/* 3595C 0013585C 0400B526 */  addiu      $21, $21, 0x4
/* 35960 00135860 1800C28E */  lw         $2, 0x18($22)
/* 35964 00135864 0000A2AE */  sw         $2, 0x0($21)
/* 35968 00135868 0400B526 */  addiu      $21, $21, 0x4
/* 3596C 0013586C 0000A0AE */  sw         $0, 0x0($21)
/* 35970 00135870 0400B526 */  addiu      $21, $21, 0x4
/* 35974 00135874 0000A0AE */  sw         $0, 0x0($21)
/* 35978 00135878 0400B526 */  addiu      $21, $21, 0x4
/* 3597C 0013587C 0010033C */  lui        $3, (0x10000003 >> 16)
/* 35980 00135880 03006234 */  ori        $2, $3, (0x10000003 & 0xFFFF)
/* 35984 00135884 0000A2AE */  sw         $2, 0x0($21)
/* 35988 00135888 0400B526 */  addiu      $21, $21, 0x4
/* 3598C 0013588C 0000A0AE */  sw         $0, 0x0($21)
/* 35990 00135890 0400B526 */  addiu      $21, $21, 0x4
/* 35994 00135894 0000A0AE */  sw         $0, 0x0($21)
/* 35998 00135898 0400B526 */  addiu      $21, $21, 0x4
/* 3599C 0013589C 0000A0AE */  sw         $0, 0x0($21)
/* 359A0 001358A0 0400B526 */  addiu      $21, $21, 0x4
/* 359A4 001358A4 0000A0AE */  sw         $0, 0x0($21)
/* 359A8 001358A8 0400B526 */  addiu      $21, $21, 0x4
/* 359AC 001358AC 0000A0AE */  sw         $0, 0x0($21)
/* 359B0 001358B0 0400B526 */  addiu      $21, $21, 0x4
/* 359B4 001358B4 0000A0AE */  sw         $0, 0x0($21)
/* 359B8 001358B8 0400B526 */  addiu      $21, $21, 0x4
/* 359BC 001358BC 0050023C */  lui        $2, (0x50000002 >> 16)
/* 359C0 001358C0 02004234 */  ori        $2, $2, (0x50000002 & 0xFFFF)
/* 359C4 001358C4 0000A2AE */  sw         $2, 0x0($21)
/* 359C8 001358C8 0400B526 */  addiu      $21, $21, 0x4
/* 359CC 001358CC 01800234 */  ori        $2, $0, 0x8001
/* 359D0 001358D0 0000A2AE */  sw         $2, 0x0($21)
/* 359D4 001358D4 0400B526 */  addiu      $21, $21, 0x4
/* 359D8 001358D8 0000A3AE */  sw         $3, 0x0($21)
/* 359DC 001358DC 0400B526 */  addiu      $21, $21, 0x4
/* 359E0 001358E0 0E000224 */  addiu      $2, $0, 0xE
/* 359E4 001358E4 0000A2AE */  sw         $2, 0x0($21)
/* 359E8 001358E8 0400B526 */  addiu      $21, $21, 0x4
/* 359EC 001358EC 0000A0AE */  sw         $0, 0x0($21)
/* 359F0 001358F0 0400B526 */  addiu      $21, $21, 0x4
/* 359F4 001358F4 01000224 */  addiu      $2, $0, 0x1
/* 359F8 001358F8 0000A2AE */  sw         $2, 0x0($21)
/* 359FC 001358FC 0400B526 */  addiu      $21, $21, 0x4
/* 35A00 00135900 0000A0AE */  sw         $0, 0x0($21)
/* 35A04 00135904 0400B526 */  addiu      $21, $21, 0x4
/* 35A08 00135908 1A000224 */  addiu      $2, $0, 0x1A
/* 35A0C 0013590C 0000A2AE */  sw         $2, 0x0($21)
/* 35A10 00135910 0400B526 */  addiu      $21, $21, 0x4
/* 35A14 00135914 0000A0AE */  sw         $0, 0x0($21)
/* 35A18 00135918 0400B526 */  addiu      $21, $21, 0x4
/* 35A1C 0013591C B800A28F */  lw         $2, 0xB8($sp)
/* 35A20 00135920 2310A202 */  subu       $2, $21, $2
/* 35A24 00135924 83100200 */  sra        $2, $2, 2
.L00135928:
/* 35A28 00135928 A000BF7B */  lq         $31, 0xA0($sp)
/* 35A2C 0013592C 9000BE7B */  lq         $fp, 0x90($sp)
/* 35A30 00135930 8000B77B */  lq         $23, 0x80($sp)
/* 35A34 00135934 7000B67B */  lq         $22, 0x70($sp)
/* 35A38 00135938 6000B57B */  lq         $21, 0x60($sp)
/* 35A3C 0013593C 5000B47B */  lq         $20, 0x50($sp)
/* 35A40 00135940 4000B37B */  lq         $19, 0x40($sp)
/* 35A44 00135944 3000B27B */  lq         $18, 0x30($sp)
/* 35A48 00135948 2000B17B */  lq         $17, 0x20($sp)
/* 35A4C 0013594C 1000B07B */  lq         $16, 0x10($sp)
/* 35A50 00135950 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 35A54 00135954 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 35A58 00135958 3002BD27 */  addiu      $sp, $sp, 0x230
/* 35A5C 0013595C 0800E003 */  jr         $31
/* 35A60 00135960 00000000 */   nop
/* 35A64 00135964 00000000 */  nop
/* 35A68 00135968 00000000 */  nop
/* 35A6C 0013596C 00000000 */  nop
