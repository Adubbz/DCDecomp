.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set3DCellModel__FPfPcfiiii
/* D93F0 001D92F0 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* D93F4 001D92F4 7000BF7F */  sq         $31, 0x70($sp)
/* D93F8 001D92F8 6000B57F */  sq         $21, 0x60($sp)
/* D93FC 001D92FC 5000B47F */  sq         $20, 0x50($sp)
/* D9400 001D9300 4000B37F */  sq         $19, 0x40($sp)
/* D9404 001D9304 3000B27F */  sq         $18, 0x30($sp)
/* D9408 001D9308 2000B17F */  sq         $17, 0x20($sp)
/* D940C 001D930C 1000B07F */  sq         $16, 0x10($sp)
/* D9410 001D9310 0000B4E7 */  swc1       $f20, 0x0($sp)
/* D9414 001D9314 28AE8070 */  paddub     $21, $4, $0
/* D9418 001D9318 06650046 */  mov.s      $f20, $f12
/* D941C 001D931C 28A6C070 */  paddub     $20, $6, $0
/* D9420 001D9320 289EE070 */  paddub     $19, $7, $0
/* D9424 001D9324 28960071 */  paddub     $18, $8, $0
/* D9428 001D9328 288E2071 */  paddub     $17, $9, $0
/* D942C 001D932C C701023C */  lui        $2, %hi(TexManager)
/* D9430 001D9330 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D9434 001D9334 FFFF0624 */  addiu      $6, $0, -0x1
/* D9438 001D9338 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* D943C 001D933C 00000000 */   nop
/* D9440 001D9340 28864070 */  paddub     $16, $2, $0
/* D9444 001D9344 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D9448 001D9348 0C00A2AE */  sw         $2, 0xC($21)
/* D944C 001D934C 0040023C */  lui        $2, (0x40000000 >> 16)
/* D9450 001D9350 00008244 */  mtc1       $2, $f0
/* D9454 001D9354 00000000 */  nop
/* D9458 001D9358 43A30046 */  div.s      $f13, $f20, $f0
/* D945C 001D935C 8000A427 */  addiu      $4, $sp, 0x80
/* D9460 001D9360 B000A527 */  addiu      $5, $sp, 0xB0
/* D9464 001D9364 2836A072 */  paddub     $6, $21, $0
/* D9468 001D9368 06A30046 */  mov.s      $f12, $f20
/* D946C 001D936C 283E0070 */  paddub     $7, $0, $0
/* D9470 001D9370 D0B9040C */  jal        MGRotTransPers3DSprite__FPiPiPfffi
/* D9474 001D9374 00000000 */   nop
/* D9478 001D9378 01000324 */  addiu      $3, $0, 0x1
/* D947C 001D937C 1B004314 */  bne        $2, $3, .L001D93EC
/* D9480 001D9380 00000000 */   nop
/* D9484 001D9384 B000A28F */  lw         $2, 0xB0($sp)
/* D9488 001D9388 9000A2AF */  sw         $2, 0x90($sp)
/* D948C 001D938C 8400A28F */  lw         $2, 0x84($sp)
/* D9490 001D9390 9400A2AF */  sw         $2, 0x94($sp)
/* D9494 001D9394 8800A28F */  lw         $2, 0x88($sp)
/* D9498 001D9398 9800A2AF */  sw         $2, 0x98($sp)
/* D949C 001D939C 8000A28F */  lw         $2, 0x80($sp)
/* D94A0 001D93A0 A000A2AF */  sw         $2, 0xA0($sp)
/* D94A4 001D93A4 B400A28F */  lw         $2, 0xB4($sp)
/* D94A8 001D93A8 A400A2AF */  sw         $2, 0xA4($sp)
/* D94AC 001D93AC B800A28F */  lw         $2, 0xB8($sp)
/* D94B0 001D93B0 A800A2AF */  sw         $2, 0xA8($sp)
/* D94B4 001D93B4 C000B4AF */  sw         $20, 0xC0($sp)
/* D94B8 001D93B8 C400B3AF */  sw         $19, 0xC4($sp)
/* D94BC 001D93BC C800B2AF */  sw         $18, 0xC8($sp)
/* D94C0 001D93C0 CC00B1AF */  sw         $17, 0xCC($sp)
/* D94C4 001D93C4 D48B848F */  lw         $4, -0x742C($gp)
/* D94C8 001D93C8 282E0072 */  paddub     $5, $16, $0
/* D94CC 001D93CC C000A627 */  addiu      $6, $sp, 0xC0
/* D94D0 001D93D0 8000A727 */  addiu      $7, $sp, 0x80
/* D94D4 001D93D4 9000A827 */  addiu      $8, $sp, 0x90
/* D94D8 001D93D8 A000A927 */  addiu      $9, $sp, 0xA0
/* D94DC 001D93DC B000AA27 */  addiu      $10, $sp, 0xB0
/* D94E0 001D93E0 80000B24 */  addiu      $11, $0, 0x80
/* D94E4 001D93E4 1C75050C */  jal        set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
/* D94E8 001D93E8 00000000 */   nop
.L001D93EC:
/* D94EC 001D93EC 7000BF7B */  lq         $31, 0x70($sp)
/* D94F0 001D93F0 6000B57B */  lq         $21, 0x60($sp)
/* D94F4 001D93F4 5000B47B */  lq         $20, 0x50($sp)
/* D94F8 001D93F8 4000B37B */  lq         $19, 0x40($sp)
/* D94FC 001D93FC 3000B27B */  lq         $18, 0x30($sp)
/* D9500 001D9400 2000B17B */  lq         $17, 0x20($sp)
/* D9504 001D9404 1000B07B */  lq         $16, 0x10($sp)
/* D9508 001D9408 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* D950C 001D940C D000BD27 */  addiu      $sp, $sp, 0xD0
/* D9510 001D9410 0800E003 */  jr         $31
/* D9514 001D9414 00000000 */   nop
/* D9518 001D9418 00000000 */  nop
/* D951C 001D941C 00000000 */  nop
