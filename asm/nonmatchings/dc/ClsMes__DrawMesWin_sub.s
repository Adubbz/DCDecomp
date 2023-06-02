.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMesWin_sub__6ClsMesFP8CTextureiii
/* 52130 00152030 10FDBD27 */  addiu      $sp, $sp, -0x2F0
/* 52134 00152034 B000BF7F */  sq         $31, 0xB0($sp)
/* 52138 00152038 A000BE7F */  sq         $fp, 0xA0($sp)
/* 5213C 0015203C 9000B77F */  sq         $23, 0x90($sp)
/* 52140 00152040 8000B67F */  sq         $22, 0x80($sp)
/* 52144 00152044 7000B57F */  sq         $21, 0x70($sp)
/* 52148 00152048 6000B47F */  sq         $20, 0x60($sp)
/* 5214C 0015204C 5000B37F */  sq         $19, 0x50($sp)
/* 52150 00152050 4000B27F */  sq         $18, 0x40($sp)
/* 52154 00152054 3000B17F */  sq         $17, 0x30($sp)
/* 52158 00152058 2000B07F */  sq         $16, 0x20($sp)
/* 5215C 0015205C 1C00B7E7 */  swc1       $f23, 0x1C($sp)
/* 52160 00152060 1800B6E7 */  swc1       $f22, 0x18($sp)
/* 52164 00152064 1400B5E7 */  swc1       $f21, 0x14($sp)
/* 52168 00152068 1000B4E7 */  swc1       $f20, 0x10($sp)
/* 5216C 0015206C 289E8070 */  paddub     $19, $4, $0
/* 52170 00152070 28AEA070 */  paddub     $21, $5, $0
/* 52174 00152074 28BEC070 */  paddub     $23, $6, $0
/* 52178 00152078 28F6E070 */  paddub     $fp, $7, $0
/* 5217C 0015207C 6C01A8AF */  sw         $8, 0x16C($sp)
/* 52180 00152080 4400828C */  lw         $2, 0x44($4)
/* 52184 00152084 7001A2AF */  sw         $2, 0x170($sp)
/* 52188 00152088 4800828C */  lw         $2, 0x48($4)
/* 5218C 0015208C 7401B427 */  addiu      $20, $sp, 0x174
/* 52190 00152090 000082AE */  sw         $2, 0x0($20)
/* 52194 00152094 4400838C */  lw         $3, 0x44($4)
/* 52198 00152098 4C00828C */  lw         $2, 0x4C($4)
/* 5219C 0015209C 21106200 */  addu       $2, $3, $2
/* 521A0 001520A0 7801B227 */  addiu      $18, $sp, 0x178
/* 521A4 001520A4 000042AE */  sw         $2, 0x0($18)
/* 521A8 001520A8 4800838C */  lw         $3, 0x48($4)
/* 521AC 001520AC 5000828C */  lw         $2, 0x50($4)
/* 521B0 001520B0 21106200 */  addu       $2, $3, $2
/* 521B4 001520B4 7C01B127 */  addiu      $17, $sp, 0x17C
/* 521B8 001520B8 000022AE */  sw         $2, 0x0($17)
/* 521BC 001520BC 3C00828C */  lw         $2, 0x3C($4)
/* 521C0 001520C0 E002A2AF */  sw         $2, 0x2E0($sp)
/* 521C4 001520C4 4000828C */  lw         $2, 0x40($4)
/* 521C8 001520C8 E402B027 */  addiu      $16, $sp, 0x2E4
/* 521CC 001520CC 000002AE */  sw         $2, 0x0($16)
/* 521D0 001520D0 7001A427 */  addiu      $4, $sp, 0x170
/* 521D4 001520D4 E002A527 */  addiu      $5, $sp, 0x2E0
/* 521D8 001520D8 28368070 */  paddub     $6, $4, $0
/* 521DC 001520DC 8831050C */  jal        AreaAddPos__FPiPiPi
/* 521E0 001520E0 00000000 */   nop
/* 521E4 001520E4 5800628E */  lw         $2, 0x58($19)
/* 521E8 001520E8 36004010 */  beqz       $2, .L001521C4
/* 521EC 001520EC 00000000 */   nop
/* 521F0 001520F0 8400628E */  lw         $2, 0x84($19)
/* 521F4 001520F4 E002A2AF */  sw         $2, 0x2E0($sp)
/* 521F8 001520F8 8800628E */  lw         $2, 0x88($19)
/* 521FC 001520FC 000002AE */  sw         $2, 0x0($16)
/* 52200 00152100 7001A427 */  addiu      $4, $sp, 0x170
/* 52204 00152104 E002A527 */  addiu      $5, $sp, 0x2E0
/* 52208 00152108 28368070 */  paddub     $6, $4, $0
/* 5220C 0015210C 8831050C */  jal        AreaAddPos__FPiPiPi
/* 52210 00152110 00000000 */   nop
/* 52214 00152114 7400628E */  lw         $2, 0x74($19)
/* 52218 00152118 E002A2AF */  sw         $2, 0x2E0($sp)
/* 5221C 0015211C 7800628E */  lw         $2, 0x78($19)
/* 52220 00152120 000002AE */  sw         $2, 0x0($16)
/* 52224 00152124 7001A427 */  addiu      $4, $sp, 0x170
/* 52228 00152128 E002A527 */  addiu      $5, $sp, 0x2E0
/* 5222C 0015212C 28368070 */  paddub     $6, $4, $0
/* 52230 00152130 8831050C */  jal        AreaAddPos__FPiPiPi
/* 52234 00152134 00000000 */   nop
/* 52238 00152138 7C00628E */  lw         $2, 0x7C($19)
/* 5223C 0015213C E002A2AF */  sw         $2, 0x2E0($sp)
/* 52240 00152140 8000628E */  lw         $2, 0x80($19)
/* 52244 00152144 000002AE */  sw         $2, 0x0($16)
/* 52248 00152148 7001A427 */  addiu      $4, $sp, 0x170
/* 5224C 0015214C E002A527 */  addiu      $5, $sp, 0x2E0
/* 52250 00152150 28368070 */  paddub     $6, $4, $0
/* 52254 00152154 8831050C */  jal        AreaAddPos__FPiPiPi
/* 52258 00152158 00000000 */   nop
/* 5225C 0015215C 3800638E */  lw         $3, 0x38($19)
/* 52260 00152160 02000224 */  addiu      $2, $0, 0x2
/* 52264 00152164 17006214 */  bne        $3, $2, .L001521C4
/* 52268 00152168 00000000 */   nop
/* 5226C 0015216C 8400628E */  lw         $2, 0x84($19)
/* 52270 00152170 FBFF4224 */  addiu      $2, $2, -0x5
/* 52274 00152174 E002A2AF */  sw         $2, 0x2E0($sp)
/* 52278 00152178 8800628E */  lw         $2, 0x88($19)
/* 5227C 0015217C FBFF4224 */  addiu      $2, $2, -0x5
/* 52280 00152180 000002AE */  sw         $2, 0x0($16)
/* 52284 00152184 7001A427 */  addiu      $4, $sp, 0x170
/* 52288 00152188 E002A527 */  addiu      $5, $sp, 0x2E0
/* 5228C 0015218C 28368070 */  paddub     $6, $4, $0
/* 52290 00152190 8831050C */  jal        AreaAddPos__FPiPiPi
/* 52294 00152194 00000000 */   nop
/* 52298 00152198 8400628E */  lw         $2, 0x84($19)
/* 5229C 0015219C 05004224 */  addiu      $2, $2, 0x5
/* 522A0 001521A0 E002A2AF */  sw         $2, 0x2E0($sp)
/* 522A4 001521A4 8800628E */  lw         $2, 0x88($19)
/* 522A8 001521A8 05004224 */  addiu      $2, $2, 0x5
/* 522AC 001521AC 000002AE */  sw         $2, 0x0($16)
/* 522B0 001521B0 7001A427 */  addiu      $4, $sp, 0x170
/* 522B4 001521B4 E002A527 */  addiu      $5, $sp, 0x2E0
/* 522B8 001521B8 28368070 */  paddub     $6, $4, $0
/* 522BC 001521BC 8831050C */  jal        AreaAddPos__FPiPiPi
/* 522C0 001521C0 00000000 */   nop
.L001521C4:
/* 522C4 001521C4 7001A38F */  lw         $3, 0x170($sp)
/* 522C8 001521C8 0000828E */  lw         $2, 0x0($20)
/* 522CC 001521CC C000A2AF */  sw         $2, 0xC0($sp)
/* 522D0 001521D0 0000428E */  lw         $2, 0x0($18)
/* 522D4 001521D4 0000248E */  lw         $4, 0x0($17)
/* 522D8 001521D8 23904300 */  subu       $18, $2, $3
/* 522DC 001521DC C000A28F */  lw         $2, 0xC0($sp)
/* 522E0 001521E0 23888200 */  subu       $17, $4, $2
/* 522E4 001521E4 3C0060C6 */  lwc1       $f0, 0x3C($19)
/* 522E8 001521E8 20038046 */  cvt.s.w    $f12, $f0
/* 522EC 001521EC 00008344 */  mtc1       $3, $f0
/* 522F0 001521F0 00000000 */  nop
/* 522F4 001521F4 60038046 */  cvt.s.w    $f13, $f0
/* 522F8 001521F8 90006EC6 */  lwc1       $f14, 0x90($19)
/* 522FC 001521FC 8031050C */  jal        LinerInterpolation__Ffff
/* 52300 00152200 00000000 */   nop
/* 52304 00152204 06030046 */  mov.s      $f12, $f0
/* 52308 00152208 2C44040C */  jal        fptosi
/* 5230C 0015220C 00000000 */   nop
/* 52310 00152210 28B64070 */  paddub     $22, $2, $0
/* 52314 00152214 400060C6 */  lwc1       $f0, 0x40($19)
/* 52318 00152218 20038046 */  cvt.s.w    $f12, $f0
/* 5231C 0015221C C000A28F */  lw         $2, 0xC0($sp)
/* 52320 00152220 00008244 */  mtc1       $2, $f0
/* 52324 00152224 00000000 */  nop
/* 52328 00152228 60038046 */  cvt.s.w    $f13, $f0
/* 5232C 0015222C 90006EC6 */  lwc1       $f14, 0x90($19)
/* 52330 00152230 8031050C */  jal        LinerInterpolation__Ffff
/* 52334 00152234 00000000 */   nop
/* 52338 00152238 06030046 */  mov.s      $f12, $f0
/* 5233C 0015223C 2C44040C */  jal        fptosi
/* 52340 00152240 00000000 */   nop
/* 52344 00152244 28864070 */  paddub     $16, $2, $0
/* 52348 00152248 900074C6 */  lwc1       $f20, 0x90($19)
/* 5234C 0015224C 00009244 */  mtc1       $18, $f0
/* 52350 00152250 00000000 */  nop
/* 52354 00152254 20008046 */  cvt.s.w    $f0, $f0
/* 52358 00152258 02031446 */  mul.s      $f12, $f0, $f20
/* 5235C 0015225C 2C44040C */  jal        fptosi
/* 52360 00152260 00000000 */   nop
/* 52364 00152264 28964070 */  paddub     $18, $2, $0
/* 52368 00152268 00009144 */  mtc1       $17, $f0
/* 5236C 0015226C 00000000 */  nop
/* 52370 00152270 20008046 */  cvt.s.w    $f0, $f0
/* 52374 00152274 02031446 */  mul.s      $f12, $f0, $f20
/* 52378 00152278 2C44040C */  jal        fptosi
/* 5237C 0015227C 00000000 */   nop
/* 52380 00152280 28A64070 */  paddub     $20, $2, $0
/* 52384 00152284 288E0072 */  paddub     $17, $16, $0
/* 52388 00152288 C000A38F */  lw         $3, 0xC0($sp)
/* 5238C 0015228C 23800302 */  subu       $16, $16, $3
/* 52390 00152290 21B8D702 */  addu       $23, $22, $23
/* 52394 00152294 21883E02 */  addu       $17, $17, $fp
/* 52398 00152298 6C01A38F */  lw         $3, 0x16C($sp)
/* 5239C 0015229C 74016010 */  beqz       $3, .L00152870
/* 523A0 001522A0 00000000 */   nop
/* 523A4 001522A4 E802A427 */  addiu      $4, $sp, 0x2E8
/* 523A8 001522A8 80000524 */  addiu      $5, $0, 0x80
/* 523AC 001522AC 2836A070 */  paddub     $6, $5, $0
/* 523B0 001522B0 283EA070 */  paddub     $7, $5, $0
/* 523B4 001522B4 2846A070 */  paddub     $8, $5, $0
/* 523B8 001522B8 0448050C */  jal        SetspRGBA__FP6spRGBAiiii
/* 523BC 001522BC 00000000 */   nop
/* 523C0 001522C0 EC02A427 */  addiu      $4, $sp, 0x2EC
/* 523C4 001522C4 60000524 */  addiu      $5, $0, 0x60
/* 523C8 001522C8 2836A070 */  paddub     $6, $5, $0
/* 523CC 001522CC 283EA070 */  paddub     $7, $5, $0
/* 523D0 001522D0 80000824 */  addiu      $8, $0, 0x80
/* 523D4 001522D4 0448050C */  jal        SetspRGBA__FP6spRGBAiiii
/* 523D8 001522D8 00000000 */   nop
/* 523DC 001522DC B48D828F */  lw         $2, -0x724C($gp)
/* 523E0 001522E0 15004014 */  bnez       $2, .L00152338
/* 523E4 001522E4 00000000 */   nop
/* 523E8 001522E8 9001B6AF */  sw         $22, 0x190($sp)
/* 523EC 001522EC 9401B0AF */  sw         $16, 0x194($sp)
/* 523F0 001522F0 9801B2AF */  sw         $18, 0x198($sp)
/* 523F4 001522F4 9C01B4AF */  sw         $20, 0x19C($sp)
/* 523F8 001522F8 8001B7AF */  sw         $23, 0x180($sp)
/* 523FC 001522FC 8401B1AF */  sw         $17, 0x184($sp)
/* 52400 00152300 8801B2AF */  sw         $18, 0x188($sp)
/* 52404 00152304 8C01B4AF */  sw         $20, 0x18C($sp)
/* 52408 00152308 01000224 */  addiu      $2, $0, 0x1
/* 5240C 0015230C 0000A2FF */  sd         $2, 0x0($sp)
/* 52410 00152310 D48B848F */  lw         $4, -0x742C($gp)
/* 52414 00152314 282EA072 */  paddub     $5, $21, $0
/* 52418 00152318 8001A627 */  addiu      $6, $sp, 0x180
/* 5241C 0015231C 9001A727 */  addiu      $7, $sp, 0x190
/* 52420 00152320 EC02A827 */  addiu      $8, $sp, 0x2EC
/* 52424 00152324 284E0071 */  paddub     $9, $8, $0
/* 52428 00152328 28560071 */  paddub     $10, $8, $0
/* 5242C 0015232C 285E0071 */  paddub     $11, $8, $0
/* 52430 00152330 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 52434 00152334 00000000 */   nop
.L00152338:
/* 52438 00152338 440060C6 */  lwc1       $f0, 0x44($19)
/* 5243C 0015233C 480061C6 */  lwc1       $f1, 0x48($19)
/* 52440 00152340 200D8046 */  cvt.s.w    $f20, $f1
/* 52444 00152344 4C0061C6 */  lwc1       $f1, 0x4C($19)
/* 52448 00152348 600D8046 */  cvt.s.w    $f21, $f1
/* 5244C 0015234C 500061C6 */  lwc1       $f1, 0x50($19)
/* 52450 00152350 A00D8046 */  cvt.s.w    $f22, $f1
/* 52454 00152354 3C0061C6 */  lwc1       $f1, 0x3C($19)
/* 52458 00152358 200B8046 */  cvt.s.w    $f12, $f1
/* 5245C 0015235C 60038046 */  cvt.s.w    $f13, $f0
/* 52460 00152360 90006EC6 */  lwc1       $f14, 0x90($19)
/* 52464 00152364 8031050C */  jal        LinerInterpolation__Ffff
/* 52468 00152368 00000000 */   nop
/* 5246C 0015236C 06030046 */  mov.s      $f12, $f0
/* 52470 00152370 2C44040C */  jal        fptosi
/* 52474 00152374 00000000 */   nop
/* 52478 00152378 28B64070 */  paddub     $22, $2, $0
/* 5247C 0015237C 400060C6 */  lwc1       $f0, 0x40($19)
/* 52480 00152380 20038046 */  cvt.s.w    $f12, $f0
/* 52484 00152384 46A30046 */  mov.s      $f13, $f20
/* 52488 00152388 90006EC6 */  lwc1       $f14, 0x90($19)
/* 5248C 0015238C 8031050C */  jal        LinerInterpolation__Ffff
/* 52490 00152390 00000000 */   nop
/* 52494 00152394 06030046 */  mov.s      $f12, $f0
/* 52498 00152398 2C44040C */  jal        fptosi
/* 5249C 0015239C 00000000 */   nop
/* 524A0 001523A0 288E4070 */  paddub     $17, $2, $0
/* 524A4 001523A4 900074C6 */  lwc1       $f20, 0x90($19)
/* 524A8 001523A8 02AB1446 */  mul.s      $f12, $f21, $f20
/* 524AC 001523AC 2C44040C */  jal        fptosi
/* 524B0 001523B0 00000000 */   nop
/* 524B4 001523B4 28BE4070 */  paddub     $23, $2, $0
/* 524B8 001523B8 02B31446 */  mul.s      $f12, $f22, $f20
/* 524BC 001523BC 2C44040C */  jal        fptosi
/* 524C0 001523C0 00000000 */   nop
/* 524C4 001523C4 D800A2AF */  sw         $2, 0xD8($sp)
/* 524C8 001523C8 4C00628E */  lw         $2, 0x4C($19)
/* 524CC 001523CC 00008244 */  mtc1       $2, $f0
/* 524D0 001523D0 00000000 */  nop
/* 524D4 001523D4 20018046 */  cvt.s.w    $f4, $f0
/* 524D8 001523D8 C040023C */  lui        $2, (0x40C00000 >> 16)
/* 524DC 001523DC 00108244 */  mtc1       $2, $f2
/* 524E0 001523E0 00000000 */  nop
/* 524E4 001523E4 43200246 */  div.s      $f1, $f4, $f2
/* 524E8 001523E8 440060C6 */  lwc1       $f0, 0x44($19)
/* 524EC 001523EC 20008046 */  cvt.s.w    $f0, $f0
/* 524F0 001523F0 40030146 */  add.s      $f13, $f0, $f1
/* 524F4 001523F4 5000628E */  lw         $2, 0x50($19)
/* 524F8 001523F8 00008244 */  mtc1       $2, $f0
/* 524FC 001523FC 00000000 */  nop
/* 52500 00152400 E0008046 */  cvt.s.w    $f3, $f0
/* 52504 00152404 43180246 */  div.s      $f1, $f3, $f2
/* 52508 00152408 480060C6 */  lwc1       $f0, 0x48($19)
/* 5250C 0015240C 20008046 */  cvt.s.w    $f0, $f0
/* 52510 00152410 40050146 */  add.s      $f21, $f0, $f1
/* 52514 00152414 0040023C */  lui        $2, (0x40000000 >> 16)
/* 52518 00152418 00108244 */  mtc1       $2, $f2
/* 5251C 0015241C 00000000 */  nop
/* 52520 00152420 02100446 */  mul.s      $f0, $f2, $f4
/* 52524 00152424 4040023C */  lui        $2, (0x40400000 >> 16)
/* 52528 00152428 00088244 */  mtc1       $2, $f1
/* 5252C 0015242C 00000000 */  nop
/* 52530 00152430 83050146 */  div.s      $f22, $f0, $f1
/* 52534 00152434 02100346 */  mul.s      $f0, $f2, $f3
/* 52538 00152438 C3050146 */  div.s      $f23, $f0, $f1
/* 5253C 0015243C 3C0060C6 */  lwc1       $f0, 0x3C($19)
/* 52540 00152440 20038046 */  cvt.s.w    $f12, $f0
/* 52544 00152444 86A30046 */  mov.s      $f14, $f20
/* 52548 00152448 8031050C */  jal        LinerInterpolation__Ffff
/* 5254C 0015244C 00000000 */   nop
/* 52550 00152450 06030046 */  mov.s      $f12, $f0
/* 52554 00152454 2C44040C */  jal        fptosi
/* 52558 00152458 00000000 */   nop
/* 5255C 0015245C 28864070 */  paddub     $16, $2, $0
/* 52560 00152460 400060C6 */  lwc1       $f0, 0x40($19)
/* 52564 00152464 20038046 */  cvt.s.w    $f12, $f0
/* 52568 00152468 46AB0046 */  mov.s      $f13, $f21
/* 5256C 0015246C 90006EC6 */  lwc1       $f14, 0x90($19)
/* 52570 00152470 8031050C */  jal        LinerInterpolation__Ffff
/* 52574 00152474 00000000 */   nop
/* 52578 00152478 06030046 */  mov.s      $f12, $f0
/* 5257C 0015247C 2C44040C */  jal        fptosi
/* 52580 00152480 00000000 */   nop
/* 52584 00152484 28964070 */  paddub     $18, $2, $0
/* 52588 00152488 900074C6 */  lwc1       $f20, 0x90($19)
/* 5258C 0015248C 02B31446 */  mul.s      $f12, $f22, $f20
/* 52590 00152490 2C44040C */  jal        fptosi
/* 52594 00152494 00000000 */   nop
/* 52598 00152498 289E4070 */  paddub     $19, $2, $0
/* 5259C 0015249C 02BB1446 */  mul.s      $f12, $f23, $f20
/* 525A0 001524A0 2C44040C */  jal        fptosi
/* 525A4 001524A4 00000000 */   nop
/* 525A8 001524A8 28A64070 */  paddub     $20, $2, $0
/* 525AC 001524AC 21181302 */  addu       $3, $16, $19
/* 525B0 001524B0 5001A3AF */  sw         $3, 0x150($sp)
/* 525B4 001524B4 DC00B1AF */  sw         $17, 0xDC($sp)
/* 525B8 001524B8 E000B2AF */  sw         $18, 0xE0($sp)
/* 525BC 001524BC 21184202 */  addu       $3, $18, $2
/* 525C0 001524C0 F000A3AF */  sw         $3, 0xF0($sp)
/* 525C4 001524C4 23F01602 */  subu       $fp, $16, $22
/* 525C8 001524C8 2118D702 */  addu       $3, $22, $23
/* 525CC 001524CC 23187000 */  subu       $3, $3, $16
/* 525D0 001524D0 23B87300 */  subu       $23, $3, $19
/* 525D4 001524D4 23185102 */  subu       $3, $18, $17
/* 525D8 001524D8 0001A3AF */  sw         $3, 0x100($sp)
/* 525DC 001524DC D800A38F */  lw         $3, 0xD8($sp)
/* 525E0 001524E0 21182302 */  addu       $3, $17, $3
/* 525E4 001524E4 23187200 */  subu       $3, $3, $18
/* 525E8 001524E8 23187400 */  subu       $3, $3, $20
/* 525EC 001524EC 1001A3AF */  sw         $3, 0x110($sp)
/* 525F0 001524F0 C000A38F */  lw         $3, 0xC0($sp)
/* 525F4 001524F4 23882302 */  subu       $17, $17, $3
/* 525F8 001524F8 23904302 */  subu       $18, $18, $3
/* 525FC 001524FC 21184202 */  addu       $3, $18, $2
/* 52600 00152500 2001A3AF */  sw         $3, 0x120($sp)
/* 52604 00152504 23185102 */  subu       $3, $18, $17
/* 52608 00152508 3001A3AF */  sw         $3, 0x130($sp)
/* 5260C 0015250C D800A38F */  lw         $3, 0xD8($sp)
/* 52610 00152510 21182302 */  addu       $3, $17, $3
/* 52614 00152514 23187200 */  subu       $3, $3, $18
/* 52618 00152518 23187400 */  subu       $3, $3, $20
/* 5261C 0015251C 4001A3AF */  sw         $3, 0x140($sp)
/* 52620 00152520 B48D838F */  lw         $3, -0x724C($gp)
/* 52624 00152524 EE006014 */  bnez       $3, .L001528E0
/* 52628 00152528 00000000 */   nop
/* 5262C 0015252C B001B6AF */  sw         $22, 0x1B0($sp)
/* 52630 00152530 B401B1AF */  sw         $17, 0x1B4($sp)
/* 52634 00152534 B801BEAF */  sw         $fp, 0x1B8($sp)
/* 52638 00152538 3001A28F */  lw         $2, 0x130($sp)
/* 5263C 0015253C BC01A2AF */  sw         $2, 0x1BC($sp)
/* 52640 00152540 A001B6AF */  sw         $22, 0x1A0($sp)
/* 52644 00152544 DC00A28F */  lw         $2, 0xDC($sp)
/* 52648 00152548 A401A2AF */  sw         $2, 0x1A4($sp)
/* 5264C 0015254C A801BEAF */  sw         $fp, 0x1A8($sp)
/* 52650 00152550 0001A28F */  lw         $2, 0x100($sp)
/* 52654 00152554 AC01A2AF */  sw         $2, 0x1AC($sp)
/* 52658 00152558 01000224 */  addiu      $2, $0, 0x1
/* 5265C 0015255C 0000A2FF */  sd         $2, 0x0($sp)
/* 52660 00152560 D48B848F */  lw         $4, -0x742C($gp)
/* 52664 00152564 282EA072 */  paddub     $5, $21, $0
/* 52668 00152568 A001A627 */  addiu      $6, $sp, 0x1A0
/* 5266C 0015256C B001A727 */  addiu      $7, $sp, 0x1B0
/* 52670 00152570 EC02A827 */  addiu      $8, $sp, 0x2EC
/* 52674 00152574 284E0071 */  paddub     $9, $8, $0
/* 52678 00152578 28560071 */  paddub     $10, $8, $0
/* 5267C 0015257C E802AB27 */  addiu      $11, $sp, 0x2E8
/* 52680 00152580 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 52684 00152584 00000000 */   nop
/* 52688 00152588 D001B0AF */  sw         $16, 0x1D0($sp)
/* 5268C 0015258C D401B1AF */  sw         $17, 0x1D4($sp)
/* 52690 00152590 D801B3AF */  sw         $19, 0x1D8($sp)
/* 52694 00152594 3001A28F */  lw         $2, 0x130($sp)
/* 52698 00152598 DC01A2AF */  sw         $2, 0x1DC($sp)
/* 5269C 0015259C C001B0AF */  sw         $16, 0x1C0($sp)
/* 526A0 001525A0 DC00A28F */  lw         $2, 0xDC($sp)
/* 526A4 001525A4 C401A2AF */  sw         $2, 0x1C4($sp)
/* 526A8 001525A8 C801B3AF */  sw         $19, 0x1C8($sp)
/* 526AC 001525AC 0001A28F */  lw         $2, 0x100($sp)
/* 526B0 001525B0 CC01A2AF */  sw         $2, 0x1CC($sp)
/* 526B4 001525B4 01000224 */  addiu      $2, $0, 0x1
/* 526B8 001525B8 0000A2FF */  sd         $2, 0x0($sp)
/* 526BC 001525BC D48B848F */  lw         $4, -0x742C($gp)
/* 526C0 001525C0 282EA072 */  paddub     $5, $21, $0
/* 526C4 001525C4 C001A627 */  addiu      $6, $sp, 0x1C0
/* 526C8 001525C8 D001A727 */  addiu      $7, $sp, 0x1D0
/* 526CC 001525CC EC02A827 */  addiu      $8, $sp, 0x2EC
/* 526D0 001525D0 284E0071 */  paddub     $9, $8, $0
/* 526D4 001525D4 E802AA27 */  addiu      $10, $sp, 0x2E8
/* 526D8 001525D8 285E4071 */  paddub     $11, $10, $0
/* 526DC 001525DC 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 526E0 001525E0 00000000 */   nop
/* 526E4 001525E4 5001A28F */  lw         $2, 0x150($sp)
/* 526E8 001525E8 F001A2AF */  sw         $2, 0x1F0($sp)
/* 526EC 001525EC F401B1AF */  sw         $17, 0x1F4($sp)
/* 526F0 001525F0 F801B7AF */  sw         $23, 0x1F8($sp)
/* 526F4 001525F4 3001A28F */  lw         $2, 0x130($sp)
/* 526F8 001525F8 FC01A2AF */  sw         $2, 0x1FC($sp)
/* 526FC 001525FC 5001A28F */  lw         $2, 0x150($sp)
/* 52700 00152600 E001A2AF */  sw         $2, 0x1E0($sp)
/* 52704 00152604 DC00A28F */  lw         $2, 0xDC($sp)
/* 52708 00152608 E401A2AF */  sw         $2, 0x1E4($sp)
/* 5270C 0015260C E801B7AF */  sw         $23, 0x1E8($sp)
/* 52710 00152610 0001A28F */  lw         $2, 0x100($sp)
/* 52714 00152614 EC01A2AF */  sw         $2, 0x1EC($sp)
/* 52718 00152618 0000A0FF */  sd         $0, 0x0($sp)
/* 5271C 0015261C D48B848F */  lw         $4, -0x742C($gp)
/* 52720 00152620 282EA072 */  paddub     $5, $21, $0
/* 52724 00152624 E001A627 */  addiu      $6, $sp, 0x1E0
/* 52728 00152628 F001A727 */  addiu      $7, $sp, 0x1F0
/* 5272C 0015262C EC02A827 */  addiu      $8, $sp, 0x2EC
/* 52730 00152630 284E0071 */  paddub     $9, $8, $0
/* 52734 00152634 E802AA27 */  addiu      $10, $sp, 0x2E8
/* 52738 00152638 285E0071 */  paddub     $11, $8, $0
/* 5273C 0015263C 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 52740 00152640 00000000 */   nop
/* 52744 00152644 1002B6AF */  sw         $22, 0x210($sp)
/* 52748 00152648 1402B2AF */  sw         $18, 0x214($sp)
/* 5274C 0015264C 1802BEAF */  sw         $fp, 0x218($sp)
/* 52750 00152650 1C02B4AF */  sw         $20, 0x21C($sp)
/* 52754 00152654 0002B6AF */  sw         $22, 0x200($sp)
/* 52758 00152658 E000A28F */  lw         $2, 0xE0($sp)
/* 5275C 0015265C 0402A2AF */  sw         $2, 0x204($sp)
/* 52760 00152660 0802BEAF */  sw         $fp, 0x208($sp)
/* 52764 00152664 0C02B4AF */  sw         $20, 0x20C($sp)
/* 52768 00152668 01000224 */  addiu      $2, $0, 0x1
/* 5276C 0015266C 0000A2FF */  sd         $2, 0x0($sp)
/* 52770 00152670 D48B848F */  lw         $4, -0x742C($gp)
/* 52774 00152674 282EA072 */  paddub     $5, $21, $0
/* 52778 00152678 0002A627 */  addiu      $6, $sp, 0x200
/* 5277C 0015267C 1002A727 */  addiu      $7, $sp, 0x210
/* 52780 00152680 EC02A827 */  addiu      $8, $sp, 0x2EC
/* 52784 00152684 E802A927 */  addiu      $9, $sp, 0x2E8
/* 52788 00152688 28560071 */  paddub     $10, $8, $0
/* 5278C 0015268C 285E2071 */  paddub     $11, $9, $0
/* 52790 00152690 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 52794 00152694 00000000 */   nop
/* 52798 00152698 3002B0AF */  sw         $16, 0x230($sp)
/* 5279C 0015269C 3402B2AF */  sw         $18, 0x234($sp)
/* 527A0 001526A0 3802B3AF */  sw         $19, 0x238($sp)
/* 527A4 001526A4 3C02B4AF */  sw         $20, 0x23C($sp)
/* 527A8 001526A8 2002B0AF */  sw         $16, 0x220($sp)
/* 527AC 001526AC E000A28F */  lw         $2, 0xE0($sp)
/* 527B0 001526B0 2402A2AF */  sw         $2, 0x224($sp)
/* 527B4 001526B4 2802B3AF */  sw         $19, 0x228($sp)
/* 527B8 001526B8 2C02B4AF */  sw         $20, 0x22C($sp)
/* 527BC 001526BC 01000224 */  addiu      $2, $0, 0x1
/* 527C0 001526C0 0000A2FF */  sd         $2, 0x0($sp)
/* 527C4 001526C4 D48B848F */  lw         $4, -0x742C($gp)
/* 527C8 001526C8 282EA072 */  paddub     $5, $21, $0
/* 527CC 001526CC 2002A627 */  addiu      $6, $sp, 0x220
/* 527D0 001526D0 3002A727 */  addiu      $7, $sp, 0x230
/* 527D4 001526D4 E802A827 */  addiu      $8, $sp, 0x2E8
/* 527D8 001526D8 284E0071 */  paddub     $9, $8, $0
/* 527DC 001526DC 28560071 */  paddub     $10, $8, $0
/* 527E0 001526E0 285E0071 */  paddub     $11, $8, $0
/* 527E4 001526E4 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 527E8 001526E8 00000000 */   nop
/* 527EC 001526EC 5001A28F */  lw         $2, 0x150($sp)
/* 527F0 001526F0 5002A2AF */  sw         $2, 0x250($sp)
/* 527F4 001526F4 5402B2AF */  sw         $18, 0x254($sp)
/* 527F8 001526F8 5802B7AF */  sw         $23, 0x258($sp)
/* 527FC 001526FC 5C02B4AF */  sw         $20, 0x25C($sp)
/* 52800 00152700 4002A2AF */  sw         $2, 0x240($sp)
/* 52804 00152704 E000A28F */  lw         $2, 0xE0($sp)
/* 52808 00152708 4402A2AF */  sw         $2, 0x244($sp)
/* 5280C 0015270C 4802B7AF */  sw         $23, 0x248($sp)
/* 52810 00152710 4C02B4AF */  sw         $20, 0x24C($sp)
/* 52814 00152714 01000224 */  addiu      $2, $0, 0x1
/* 52818 00152718 0000A2FF */  sd         $2, 0x0($sp)
/* 5281C 0015271C D48B848F */  lw         $4, -0x742C($gp)
/* 52820 00152720 282EA072 */  paddub     $5, $21, $0
/* 52824 00152724 4002A627 */  addiu      $6, $sp, 0x240
/* 52828 00152728 5002A727 */  addiu      $7, $sp, 0x250
/* 5282C 0015272C E802A827 */  addiu      $8, $sp, 0x2E8
/* 52830 00152730 EC02A927 */  addiu      $9, $sp, 0x2EC
/* 52834 00152734 28560071 */  paddub     $10, $8, $0
/* 52838 00152738 285E2071 */  paddub     $11, $9, $0
/* 5283C 0015273C 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 52840 00152740 00000000 */   nop
/* 52844 00152744 7002B6AF */  sw         $22, 0x270($sp)
/* 52848 00152748 2001A28F */  lw         $2, 0x120($sp)
/* 5284C 0015274C 7402A2AF */  sw         $2, 0x274($sp)
/* 52850 00152750 7802BEAF */  sw         $fp, 0x278($sp)
/* 52854 00152754 4001A28F */  lw         $2, 0x140($sp)
/* 52858 00152758 7C02A2AF */  sw         $2, 0x27C($sp)
/* 5285C 0015275C 6002B6AF */  sw         $22, 0x260($sp)
/* 52860 00152760 F000A28F */  lw         $2, 0xF0($sp)
/* 52864 00152764 6402A2AF */  sw         $2, 0x264($sp)
/* 52868 00152768 6802BEAF */  sw         $fp, 0x268($sp)
/* 5286C 0015276C 1001A28F */  lw         $2, 0x110($sp)
/* 52870 00152770 6C02A2AF */  sw         $2, 0x26C($sp)
/* 52874 00152774 0000A0FF */  sd         $0, 0x0($sp)
/* 52878 00152778 D48B848F */  lw         $4, -0x742C($gp)
/* 5287C 0015277C 282EA072 */  paddub     $5, $21, $0
/* 52880 00152780 6002A627 */  addiu      $6, $sp, 0x260
/* 52884 00152784 7002A727 */  addiu      $7, $sp, 0x270
/* 52888 00152788 EC02A827 */  addiu      $8, $sp, 0x2EC
/* 5288C 0015278C E802A927 */  addiu      $9, $sp, 0x2E8
/* 52890 00152790 28560071 */  paddub     $10, $8, $0
/* 52894 00152794 285E0071 */  paddub     $11, $8, $0
/* 52898 00152798 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 5289C 0015279C 00000000 */   nop
/* 528A0 001527A0 9002B0AF */  sw         $16, 0x290($sp)
/* 528A4 001527A4 2001A28F */  lw         $2, 0x120($sp)
/* 528A8 001527A8 9402A2AF */  sw         $2, 0x294($sp)
/* 528AC 001527AC 9802B3AF */  sw         $19, 0x298($sp)
/* 528B0 001527B0 4001A28F */  lw         $2, 0x140($sp)
/* 528B4 001527B4 9C02A2AF */  sw         $2, 0x29C($sp)
/* 528B8 001527B8 8002B0AF */  sw         $16, 0x280($sp)
/* 528BC 001527BC F000A28F */  lw         $2, 0xF0($sp)
/* 528C0 001527C0 8402A2AF */  sw         $2, 0x284($sp)
/* 528C4 001527C4 8802B3AF */  sw         $19, 0x288($sp)
/* 528C8 001527C8 1001A28F */  lw         $2, 0x110($sp)
/* 528CC 001527CC 8C02A2AF */  sw         $2, 0x28C($sp)
/* 528D0 001527D0 01000224 */  addiu      $2, $0, 0x1
/* 528D4 001527D4 0000A2FF */  sd         $2, 0x0($sp)
/* 528D8 001527D8 D48B848F */  lw         $4, -0x742C($gp)
/* 528DC 001527DC 282EA072 */  paddub     $5, $21, $0
/* 528E0 001527E0 8002A627 */  addiu      $6, $sp, 0x280
/* 528E4 001527E4 9002A727 */  addiu      $7, $sp, 0x290
/* 528E8 001527E8 E802A827 */  addiu      $8, $sp, 0x2E8
/* 528EC 001527EC 284E0071 */  paddub     $9, $8, $0
/* 528F0 001527F0 EC02AA27 */  addiu      $10, $sp, 0x2EC
/* 528F4 001527F4 285E4071 */  paddub     $11, $10, $0
/* 528F8 001527F8 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 528FC 001527FC 00000000 */   nop
/* 52900 00152800 5001A28F */  lw         $2, 0x150($sp)
/* 52904 00152804 B002A2AF */  sw         $2, 0x2B0($sp)
/* 52908 00152808 2001A28F */  lw         $2, 0x120($sp)
/* 5290C 0015280C B402A2AF */  sw         $2, 0x2B4($sp)
/* 52910 00152810 B802B7AF */  sw         $23, 0x2B8($sp)
/* 52914 00152814 4001A28F */  lw         $2, 0x140($sp)
/* 52918 00152818 BC02A2AF */  sw         $2, 0x2BC($sp)
/* 5291C 0015281C 5001A28F */  lw         $2, 0x150($sp)
/* 52920 00152820 A002A2AF */  sw         $2, 0x2A0($sp)
/* 52924 00152824 F000A28F */  lw         $2, 0xF0($sp)
/* 52928 00152828 A402A2AF */  sw         $2, 0x2A4($sp)
/* 5292C 0015282C A802B7AF */  sw         $23, 0x2A8($sp)
/* 52930 00152830 1001A28F */  lw         $2, 0x110($sp)
/* 52934 00152834 AC02A2AF */  sw         $2, 0x2AC($sp)
/* 52938 00152838 01000224 */  addiu      $2, $0, 0x1
/* 5293C 0015283C 0000A2FF */  sd         $2, 0x0($sp)
/* 52940 00152840 D48B848F */  lw         $4, -0x742C($gp)
/* 52944 00152844 282EA072 */  paddub     $5, $21, $0
/* 52948 00152848 A002A627 */  addiu      $6, $sp, 0x2A0
/* 5294C 0015284C B002A727 */  addiu      $7, $sp, 0x2B0
/* 52950 00152850 E802A827 */  addiu      $8, $sp, 0x2E8
/* 52954 00152854 EC02A927 */  addiu      $9, $sp, 0x2EC
/* 52958 00152858 28562071 */  paddub     $10, $9, $0
/* 5295C 0015285C 285E2071 */  paddub     $11, $9, $0
/* 52960 00152860 6072050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi
/* 52964 00152864 00000000 */   nop
/* 52968 00152868 1D000010 */  b          .L001528E0
/* 5296C 0015286C 00000000 */   nop
.L00152870:
/* 52970 00152870 B48D838F */  lw         $3, -0x724C($gp)
/* 52974 00152874 1A006014 */  bnez       $3, .L001528E0
/* 52978 00152878 00000000 */   nop
/* 5297C 0015287C D416628E */  lw         $2, 0x16D4($19)
/* 52980 00152880 80004128 */  slti       $at, $2, 0x80
/* 52984 00152884 03002010 */  beqz       $at, .L00152894
/* 52988 00152888 00000000 */   nop
/* 5298C 0015288C 02000010 */  b          .L00152898
/* 52990 00152890 00000000 */   nop
.L00152894:
/* 52994 00152894 80000224 */  addiu      $2, $0, 0x80
.L00152898:
/* 52998 00152898 D002B6AF */  sw         $22, 0x2D0($sp)
/* 5299C 0015289C D402B0AF */  sw         $16, 0x2D4($sp)
/* 529A0 001528A0 D802B2AF */  sw         $18, 0x2D8($sp)
/* 529A4 001528A4 DC02B4AF */  sw         $20, 0x2DC($sp)
/* 529A8 001528A8 C002B7AF */  sw         $23, 0x2C0($sp)
/* 529AC 001528AC C402B1AF */  sw         $17, 0x2C4($sp)
/* 529B0 001528B0 C802B2AF */  sw         $18, 0x2C8($sp)
/* 529B4 001528B4 CC02B4AF */  sw         $20, 0x2CC($sp)
/* 529B8 001528B8 FF004B30 */  andi       $11, $2, 0xFF
/* 529BC 001528BC D48B848F */  lw         $4, -0x742C($gp)
/* 529C0 001528C0 282EA072 */  paddub     $5, $21, $0
/* 529C4 001528C4 C002A627 */  addiu      $6, $sp, 0x2C0
/* 529C8 001528C8 D002A727 */  addiu      $7, $sp, 0x2D0
/* 529CC 001528CC 28460070 */  paddub     $8, $0, $0
/* 529D0 001528D0 284E0070 */  paddub     $9, $0, $0
/* 529D4 001528D4 28560070 */  paddub     $10, $0, $0
/* 529D8 001528D8 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 529DC 001528DC 00000000 */   nop
.L001528E0:
/* 529E0 001528E0 B000BF7B */  lq         $31, 0xB0($sp)
/* 529E4 001528E4 A000BE7B */  lq         $fp, 0xA0($sp)
/* 529E8 001528E8 9000B77B */  lq         $23, 0x90($sp)
/* 529EC 001528EC 8000B67B */  lq         $22, 0x80($sp)
/* 529F0 001528F0 7000B57B */  lq         $21, 0x70($sp)
/* 529F4 001528F4 6000B47B */  lq         $20, 0x60($sp)
/* 529F8 001528F8 5000B37B */  lq         $19, 0x50($sp)
/* 529FC 001528FC 4000B27B */  lq         $18, 0x40($sp)
/* 52A00 00152900 3000B17B */  lq         $17, 0x30($sp)
/* 52A04 00152904 2000B07B */  lq         $16, 0x20($sp)
/* 52A08 00152908 1C00B7C7 */  lwc1       $f23, 0x1C($sp)
/* 52A0C 0015290C 1800B6C7 */  lwc1       $f22, 0x18($sp)
/* 52A10 00152910 1400B5C7 */  lwc1       $f21, 0x14($sp)
/* 52A14 00152914 1000B4C7 */  lwc1       $f20, 0x10($sp)
/* 52A18 00152918 F002BD27 */  addiu      $sp, $sp, 0x2F0
/* 52A1C 0015291C 0800E003 */  jr         $31
/* 52A20 00152920 00000000 */   nop
/* 52A24 00152924 00000000 */  nop
/* 52A28 00152928 00000000 */  nop
/* 52A2C 0015292C 00000000 */  nop