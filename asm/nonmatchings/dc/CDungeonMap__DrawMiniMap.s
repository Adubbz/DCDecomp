.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawMiniMap__11CDungeonMapFPff
/* C3280 001C3180 70FEBD27 */  addiu      $sp, $sp, -0x190
/* C3284 001C3184 A000BF7F */  sq         $31, 0xA0($sp)
/* C3288 001C3188 9000BE7F */  sq         $fp, 0x90($sp)
/* C328C 001C318C 8000B77F */  sq         $23, 0x80($sp)
/* C3290 001C3190 7000B67F */  sq         $22, 0x70($sp)
/* C3294 001C3194 6000B57F */  sq         $21, 0x60($sp)
/* C3298 001C3198 5000B47F */  sq         $20, 0x50($sp)
/* C329C 001C319C 4000B37F */  sq         $19, 0x40($sp)
/* C32A0 001C31A0 3000B27F */  sq         $18, 0x30($sp)
/* C32A4 001C31A4 2000B17F */  sq         $17, 0x20($sp)
/* C32A8 001C31A8 1000B07F */  sq         $16, 0x10($sp)
/* C32AC 001C31AC 0400B5E7 */  swc1       $f21, 0x4($sp)
/* C32B0 001C31B0 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C32B4 001C31B4 28868070 */  paddub     $16, $4, $0
/* C32B8 001C31B8 2896A070 */  paddub     $18, $5, $0
/* C32BC 001C31BC 06650046 */  mov.s      $f20, $f12
/* C32C0 001C31C0 789C838F */  lw         $3, -0x6388($gp)
/* C32C4 001C31C4 3C43658C */  lw         $5, 0x433C($3)
/* C32C8 001C31C8 03000324 */  addiu      $3, $0, 0x3
/* C32CC 001C31CC ED01A310 */  beq        $5, $3, .L001C3984
/* C32D0 001C31D0 00000000 */   nop
/* C32D4 001C31D4 8401A427 */  addiu      $4, $sp, 0x184
/* C32D8 001C31D8 D0878387 */  lh         $3, -0x7830($gp)
/* C32DC 001C31DC D2878293 */  lbu        $2, -0x782E($gp)
/* C32E0 001C31E0 000083A4 */  sh         $3, 0x0($4)
/* C32E4 001C31E4 020082A0 */  sb         $2, 0x2($4)
/* C32E8 001C31E8 8801A427 */  addiu      $4, $sp, 0x188
/* C32EC 001C31EC D4878387 */  lh         $3, -0x782C($gp)
/* C32F0 001C31F0 D6878293 */  lbu        $2, -0x782A($gp)
/* C32F4 001C31F4 000083A4 */  sh         $3, 0x0($4)
/* C32F8 001C31F8 020082A0 */  sb         $2, 0x2($4)
/* C32FC 001C31FC 8C01A427 */  addiu      $4, $sp, 0x18C
/* C3300 001C3200 D8878387 */  lh         $3, -0x7828($gp)
/* C3304 001C3204 DA878293 */  lbu        $2, -0x7826($gp)
/* C3308 001C3208 000083A4 */  sh         $3, 0x0($4)
/* C330C 001C320C 020082A0 */  sb         $2, 0x2($4)
/* C3310 001C3210 2118BD00 */  addu       $3, $5, $sp
/* C3314 001C3214 84016290 */  lbu        $2, 0x184($3)
/* C3318 001C3218 B000A2A3 */  sb         $2, 0xB0($sp)
/* C331C 001C321C 88017E90 */  lbu        $fp, 0x188($3)
/* C3320 001C3220 8C017690 */  lbu        $22, 0x18C($3)
/* C3324 001C3224 AC9D828F */  lw         $2, -0x6254($gp)
/* C3328 001C3228 C000A2AF */  sw         $2, 0xC0($sp)
/* C332C 001C322C B09D828F */  lw         $2, -0x6250($gp)
/* C3330 001C3230 D000A2AF */  sw         $2, 0xD0($sp)
/* C3334 001C3234 D501013C */  lui        $at, (0x1D5646C >> 16)
/* C3338 001C3238 6C64228C */  lw         $2, (0x1D5646C & 0xFFFF)($at)
/* C333C 001C323C 04004010 */  beqz       $2, .L001C3250
/* C3340 001C3240 00000000 */   nop
/* C3344 001C3244 01000224 */  addiu      $2, $0, 0x1
/* C3348 001C3248 AC9D82AF */  sw         $2, -0x6254($gp)
/* C334C 001C324C B09D82AF */  sw         $2, -0x6250($gp)
.L001C3250:
/* C3350 001C3250 AC9D838F */  lw         $3, -0x6254($gp)
/* C3354 001C3254 28AE0070 */  paddub     $21, $0, $0
/* C3358 001C3258 01000224 */  addiu      $2, $0, 0x1
/* C335C 001C325C 0AA84300 */  movz       $21, $2, $3
/* C3360 001C3260 C701023C */  lui        $2, %hi(TexManager)
/* C3364 001C3264 70584424 */  addiu      $4, $2, %lo(TexManager)
/* C3368 001C3268 2A00023C */  lui        $2, %hi(_1470)
/* C336C 001C326C 28BE4524 */  addiu      $5, $2, %lo(_1470)
/* C3370 001C3270 FFFF0624 */  addiu      $6, $0, -0x1
/* C3374 001C3274 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* C3378 001C3278 00000000 */   nop
/* C337C 001C327C 28BE4070 */  paddub     $23, $2, $0
/* C3380 001C3280 C701023C */  lui        $2, %hi(TexManager)
/* C3384 001C3284 70584424 */  addiu      $4, $2, %lo(TexManager)
/* C3388 001C3288 2A00023C */  lui        $2, %hi(_1471)
/* C338C 001C328C 38BE4524 */  addiu      $5, $2, %lo(_1471)
/* C3390 001C3290 FFFF0624 */  addiu      $6, $0, -0x1
/* C3394 001C3294 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* C3398 001C3298 00000000 */   nop
/* C339C 001C329C 28A64070 */  paddub     $20, $2, $0
/* C33A0 001C32A0 288E0070 */  paddub     $17, $0, $0
/* C33A4 001C32A4 51000010 */  b          .L001C33EC
/* C33A8 001C32A8 00000000 */   nop
.L001C32AC:
/* C33AC 001C32AC 289E0070 */  paddub     $19, $0, $0
/* C33B0 001C32B0 4A000010 */  b          .L001C33DC
/* C33B4 001C32B4 00000000 */   nop
.L001C32B8:
/* C33B8 001C32B8 80101100 */  sll        $2, $17, 2
/* C33BC 001C32BC 21105100 */  addu       $2, $2, $17
/* C33C0 001C32C0 80100200 */  sll        $2, $2, 2
/* C33C4 001C32C4 21306202 */  addu       $6, $19, $2
/* C33C8 001C32C8 80100600 */  sll        $2, $6, 2
/* C33CC 001C32CC 21105000 */  addu       $2, $2, $16
/* C33D0 001C32D0 0100013C */  lui        $at, (0x10000 >> 16)
/* C33D4 001C32D4 21084100 */  addu       $at, $2, $at
/* C33D8 001C32D8 1087238C */  lw         $3, -0x78F0($at)
/* C33DC 001C32DC 0800A016 */  bnez       $21, .L001C3300
/* C33E0 001C32E0 00000000 */   nop
/* C33E4 001C32E4 06006014 */  bnez       $3, .L001C3300
/* C33E8 001C32E8 00000000 */   nop
/* C33EC 001C32EC 01000324 */  addiu      $3, $0, 0x1
/* C33F0 001C32F0 B000A293 */  lbu        $2, 0xB0($sp)
/* C33F4 001C32F4 28464070 */  paddub     $8, $2, $0
/* C33F8 001C32F8 02000010 */  b          .L001C3304
/* C33FC 001C32FC 00000000 */   nop
.L001C3300:
/* C3400 001C3300 FF00C833 */  andi       $8, $fp, 0xFF
.L001C3304:
/* C3404 001C3304 00110600 */  sll        $2, $6, 4
/* C3408 001C3308 21305000 */  addu       $6, $2, $16
/* C340C 001C330C 0100013C */  lui        $at, (0x10000 >> 16)
/* C3410 001C3310 2108C100 */  addu       $at, $6, $at
/* C3414 001C3314 509C278C */  lw         $7, -0x63B0($at)
/* C3418 001C3318 FFFF0224 */  addiu      $2, $0, -0x1
/* C341C 001C331C 2E00E210 */  beq        $7, $2, .L001C33D8
/* C3420 001C3320 00000000 */   nop
/* C3424 001C3324 01000224 */  addiu      $2, $0, 0x1
/* C3428 001C3328 2B006214 */  bne        $3, $2, .L001C33D8
/* C342C 001C332C 00000000 */   nop
/* C3430 001C3330 C0100700 */  sll        $2, $7, 3
/* C3434 001C3334 23104700 */  subu       $2, $2, $7
/* C3438 001C3338 80100200 */  sll        $2, $2, 2
/* C343C 001C333C 21104700 */  addu       $2, $2, $7
/* C3440 001C3340 00110200 */  sll        $2, $2, 4
/* C3444 001C3344 21105000 */  addu       $2, $2, $16
/* C3448 001C3348 90044384 */  lh         $3, 0x490($2)
/* C344C 001C334C 0100013C */  lui        $at, (0x10000 >> 16)
/* C3450 001C3350 2108C100 */  addu       $at, $6, $at
/* C3454 001C3354 549C228C */  lw         $2, -0x63AC($at)
/* C3458 001C3358 21184300 */  addu       $3, $2, $3
/* C345C 001C335C 07006230 */  andi       $2, $3, 0x7
/* C3460 001C3360 04006104 */  bgez       $3, .L001C3374
/* C3464 001C3364 00000000 */   nop
/* C3468 001C3368 02004010 */  beqz       $2, .L001C3374
/* C346C 001C336C 00000000 */   nop
/* C3470 001C3370 F8FF4224 */  addiu      $2, $2, -0x8
.L001C3374:
/* C3474 001C3374 00110200 */  sll        $2, $2, 4
/* C3478 001C3378 F000A2AF */  sw         $2, 0xF0($sp)
/* C347C 001C337C C3100300 */  sra        $2, $3, 3
/* C3480 001C3380 00110200 */  sll        $2, $2, 4
/* C3484 001C3384 F400A2AF */  sw         $2, 0xF4($sp)
/* C3488 001C3388 10000324 */  addiu      $3, $0, 0x10
/* C348C 001C338C F800A3AF */  sw         $3, 0xF8($sp)
/* C3490 001C3390 FC00A3AF */  sw         $3, 0xFC($sp)
/* C3494 001C3394 00111300 */  sll        $2, $19, 4
/* C3498 001C3398 7C014224 */  addiu      $2, $2, 0x17C
/* C349C 001C339C E000A2AF */  sw         $2, 0xE0($sp)
/* C34A0 001C33A0 00111100 */  sll        $2, $17, 4
/* C34A4 001C33A4 40004224 */  addiu      $2, $2, 0x40
/* C34A8 001C33A8 E400A2AF */  sw         $2, 0xE4($sp)
/* C34AC 001C33AC E800A3AF */  sw         $3, 0xE8($sp)
/* C34B0 001C33B0 EC00A3AF */  sw         $3, 0xEC($sp)
/* C34B4 001C33B4 D48B848F */  lw         $4, -0x742C($gp)
/* C34B8 001C33B8 282EE072 */  paddub     $5, $23, $0
/* C34BC 001C33BC E000A627 */  addiu      $6, $sp, 0xE0
/* C34C0 001C33C0 F000A727 */  addiu      $7, $sp, 0xF0
/* C34C4 001C33C4 284E0071 */  paddub     $9, $8, $0
/* C34C8 001C33C8 28560071 */  paddub     $10, $8, $0
/* C34CC 001C33CC 285EC072 */  paddub     $11, $22, $0
/* C34D0 001C33D0 8C71050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* C34D4 001C33D4 00000000 */   nop
.L001C33D8:
/* C34D8 001C33D8 01007326 */  addiu      $19, $19, 0x1
.L001C33DC:
/* C34DC 001C33DC 1400622A */  slti       $2, $19, 0x14
/* C34E0 001C33E0 B5FF4014 */  bnez       $2, .L001C32B8
/* C34E4 001C33E4 00000000 */   nop
/* C34E8 001C33E8 01003126 */  addiu      $17, $17, 0x1
.L001C33EC:
/* C34EC 001C33EC 1400222A */  slti       $2, $17, 0x14
/* C34F0 001C33F0 AEFF4014 */  bnez       $2, .L001C32AC
/* C34F4 001C33F4 00000000 */   nop
/* C34F8 001C33F8 000041C6 */  lwc1       $f1, 0x0($18)
/* C34FC 001C33FC 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* C3500 001C3400 02080046 */  mul.s      $f0, $f1, $f0
/* C3504 001C3404 000040E6 */  swc1       $f0, 0x0($18)
/* C3508 001C3408 080041C6 */  lwc1       $f1, 0x8($18)
/* C350C 001C340C 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* C3510 001C3410 02080046 */  mul.s      $f0, $f1, $f0
/* C3514 001C3414 080040E6 */  swc1       $f0, 0x8($18)
/* C3518 001C3418 58000224 */  addiu      $2, $0, 0x58
/* C351C 001C341C 1001A2AF */  sw         $2, 0x110($sp)
/* C3520 001C3420 60000224 */  addiu      $2, $0, 0x60
/* C3524 001C3424 1401A2AF */  sw         $2, 0x114($sp)
/* C3528 001C3428 0C000224 */  addiu      $2, $0, 0xC
/* C352C 001C342C 1801A2AF */  sw         $2, 0x118($sp)
/* C3530 001C3430 1C01A2AF */  sw         $2, 0x11C($sp)
/* C3534 001C3434 080041C6 */  lwc1       $f1, 0x8($18)
/* C3538 001C3438 8042023C */  lui        $2, (0x42800000 >> 16)
/* C353C 001C343C 00008244 */  mtc1       $2, $f0
/* C3540 001C3440 00000000 */  nop
/* C3544 001C3444 40000146 */  add.s      $f1, $f0, $f1
/* C3548 001C3448 0041023C */  lui        $2, (0x41000000 >> 16)
/* C354C 001C344C 00008244 */  mtc1       $2, $f0
/* C3550 001C3450 00000000 */  nop
/* C3554 001C3454 00030146 */  add.s      $f12, $f0, $f1
/* C3558 001C3458 2C44040C */  jal        fptosi
/* C355C 001C345C 00000000 */   nop
/* C3560 001C3460 288E4070 */  paddub     $17, $2, $0
/* C3564 001C3464 BE43023C */  lui        $2, (0x43BE0000 >> 16)
/* C3568 001C3468 00088244 */  mtc1       $2, $f1
/* C356C 001C346C 000040C6 */  lwc1       $f0, 0x0($18)
/* C3570 001C3470 40080046 */  add.s      $f1, $f1, $f0
/* C3574 001C3474 0041023C */  lui        $2, (0x41000000 >> 16)
/* C3578 001C3478 00008244 */  mtc1       $2, $f0
/* C357C 001C347C 00000000 */  nop
/* C3580 001C3480 40050146 */  add.s      $f21, $f0, $f1
/* C3584 001C3484 06AB0046 */  mov.s      $f12, $f21
/* C3588 001C3488 2C44040C */  jal        fptosi
/* C358C 001C348C 00000000 */   nop
/* C3590 001C3490 06AB0046 */  mov.s      $f12, $f21
/* C3594 001C3494 2C44040C */  jal        fptosi
/* C3598 001C3498 00000000 */   nop
/* C359C 001C349C 0001A2AF */  sw         $2, 0x100($sp)
/* C35A0 001C34A0 0401B1AF */  sw         $17, 0x104($sp)
/* C35A4 001C34A4 0C000224 */  addiu      $2, $0, 0xC
/* C35A8 001C34A8 0801A2AF */  sw         $2, 0x108($sp)
/* C35AC 001C34AC 0C01A2AF */  sw         $2, 0x10C($sp)
/* C35B0 001C34B0 D48B848F */  lw         $4, -0x742C($gp)
/* C35B4 001C34B4 282E8072 */  paddub     $5, $20, $0
/* C35B8 001C34B8 0001A627 */  addiu      $6, $sp, 0x100
/* C35BC 001C34BC 1001A727 */  addiu      $7, $sp, 0x110
/* C35C0 001C34C0 07000824 */  addiu      $8, $0, 0x7
/* C35C4 001C34C4 284E0071 */  paddub     $9, $8, $0
/* C35C8 001C34C8 06A30046 */  mov.s      $f12, $f20
/* C35CC 001C34CC 5079050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iif
/* C35D0 001C34D0 00000000 */   nop
/* C35D4 001C34D4 28AE0070 */  paddub     $21, $0, $0
/* C35D8 001C34D8 5C000010 */  b          .L001C364C
/* C35DC 001C34DC 00000000 */   nop
.L001C34E0:
/* C35E0 001C34E0 40911500 */  sll        $18, $21, 5
/* C35E4 001C34E4 21305002 */  addu       $6, $18, $16
/* C35E8 001C34E8 0100013C */  lui        $at, (0x10AC0 >> 16)
/* C35EC 001C34EC 2108C100 */  addu       $at, $6, $at
/* C35F0 001C34F0 C00A238C */  lw         $3, (0x10AC0 & 0xFFFF)($at)
/* C35F4 001C34F4 54006010 */  beqz       $3, .L001C3648
/* C35F8 001C34F8 00000000 */   nop
/* C35FC 001C34FC 0100013C */  lui        $at, (0x10AB0 >> 16)
/* C3600 001C3500 2108C100 */  addu       $at, $6, $at
/* C3604 001C3504 B00A34C4 */  lwc1       $f20, (0x10AB0 & 0xFFFF)($at)
/* C3608 001C3508 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* C360C 001C350C 02031446 */  mul.s      $f12, $f0, $f20
/* C3610 001C3510 2C44040C */  jal        fptosi
/* C3614 001C3514 00000000 */   nop
/* C3618 001C3518 288E4070 */  paddub     $17, $2, $0
/* C361C 001C351C 21105002 */  addu       $2, $18, $16
/* C3620 001C3520 0100013C */  lui        $at, (0x10AB8 >> 16)
/* C3624 001C3524 21084100 */  addu       $at, $2, $at
/* C3628 001C3528 B80A35C4 */  lwc1       $f21, (0x10AB8 & 0xFFFF)($at)
/* C362C 001C352C 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* C3630 001C3530 02031546 */  mul.s      $f12, $f0, $f21
/* C3634 001C3534 2C44040C */  jal        fptosi
/* C3638 001C3538 00000000 */   nop
/* C363C 001C353C 28964070 */  paddub     $18, $2, $0
/* C3640 001C3540 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C3644 001C3544 00008244 */  mtc1       $2, $f0
/* C3648 001C3548 00000000 */  nop
/* C364C 001C354C 40001446 */  add.s      $f1, $f0, $f20
/* C3650 001C3550 2043023C */  lui        $2, (0x43200000 >> 16)
/* C3654 001C3554 00008244 */  mtc1       $2, $f0
/* C3658 001C3558 00000000 */  nop
/* C365C 001C355C 030B0046 */  div.s      $f12, $f1, $f0
/* C3660 001C3560 2C44040C */  jal        fptosi
/* C3664 001C3564 00000000 */   nop
/* C3668 001C3568 289E4070 */  paddub     $19, $2, $0
/* C366C 001C356C A042023C */  lui        $2, (0x42A00000 >> 16)
/* C3670 001C3570 00008244 */  mtc1       $2, $f0
/* C3674 001C3574 00000000 */  nop
/* C3678 001C3578 40001546 */  add.s      $f1, $f0, $f21
/* C367C 001C357C 2043023C */  lui        $2, (0x43200000 >> 16)
/* C3680 001C3580 00008244 */  mtc1       $2, $f0
/* C3684 001C3584 00000000 */  nop
/* C3688 001C3588 030B0046 */  div.s      $f12, $f1, $f0
/* C368C 001C358C 2C44040C */  jal        fptosi
/* C3690 001C3590 00000000 */   nop
/* C3694 001C3594 80180200 */  sll        $3, $2, 2
/* C3698 001C3598 21186200 */  addu       $3, $3, $2
/* C369C 001C359C 80180300 */  sll        $3, $3, 2
/* C36A0 001C35A0 21406302 */  addu       $8, $19, $3
/* C36A4 001C35A4 80180800 */  sll        $3, $8, 2
/* C36A8 001C35A8 21187000 */  addu       $3, $3, $16
/* C36AC 001C35AC 0100013C */  lui        $at, (0x10000 >> 16)
/* C36B0 001C35B0 21086100 */  addu       $at, $3, $at
/* C36B4 001C35B4 1087238C */  lw         $3, -0x78F0($at)
/* C36B8 001C35B8 B09D878F */  lw         $7, -0x6250($gp)
/* C36BC 001C35BC 01000624 */  addiu      $6, $0, 0x1
/* C36C0 001C35C0 0200E614 */  bne        $7, $6, .L001C35CC
/* C36C4 001C35C4 00000000 */   nop
/* C36C8 001C35C8 281EC070 */  paddub     $3, $6, $0
.L001C35CC:
/* C36CC 001C35CC 00310800 */  sll        $6, $8, 4
/* C36D0 001C35D0 2130D000 */  addu       $6, $6, $16
/* C36D4 001C35D4 0100013C */  lui        $at, (0x10000 >> 16)
/* C36D8 001C35D8 2108C100 */  addu       $at, $6, $at
/* C36DC 001C35DC 509C278C */  lw         $7, -0x63B0($at)
/* C36E0 001C35E0 FFFF0624 */  addiu      $6, $0, -0x1
/* C36E4 001C35E4 1800E610 */  beq        $7, $6, .L001C3648
/* C36E8 001C35E8 00000000 */   nop
/* C36EC 001C35EC 01000624 */  addiu      $6, $0, 0x1
/* C36F0 001C35F0 15006614 */  bne        $3, $6, .L001C3648
/* C36F4 001C35F4 00000000 */   nop
/* C36F8 001C35F8 58000224 */  addiu      $2, $0, 0x58
/* C36FC 001C35FC 3001A2AF */  sw         $2, 0x130($sp)
/* C3700 001C3600 70000224 */  addiu      $2, $0, 0x70
/* C3704 001C3604 3401A2AF */  sw         $2, 0x134($sp)
/* C3708 001C3608 08000324 */  addiu      $3, $0, 0x8
/* C370C 001C360C 3801A3AF */  sw         $3, 0x138($sp)
/* C3710 001C3610 3C01A3AF */  sw         $3, 0x13C($sp)
/* C3714 001C3614 80012226 */  addiu      $2, $17, 0x180
/* C3718 001C3618 2001A2AF */  sw         $2, 0x120($sp)
/* C371C 001C361C 44004226 */  addiu      $2, $18, 0x44
/* C3720 001C3620 2401A2AF */  sw         $2, 0x124($sp)
/* C3724 001C3624 2801A3AF */  sw         $3, 0x128($sp)
/* C3728 001C3628 2C01A3AF */  sw         $3, 0x12C($sp)
/* C372C 001C362C D48B848F */  lw         $4, -0x742C($gp)
/* C3730 001C3630 282E8072 */  paddub     $5, $20, $0
/* C3734 001C3634 2001A627 */  addiu      $6, $sp, 0x120
/* C3738 001C3638 3001A727 */  addiu      $7, $sp, 0x130
/* C373C 001C363C 2846C072 */  paddub     $8, $22, $0
/* C3740 001C3640 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* C3744 001C3644 00000000 */   nop
.L001C3648:
/* C3748 001C3648 0100B526 */  addiu      $21, $21, 0x1
.L001C364C:
/* C374C 001C364C 0300A32A */  slti       $3, $21, 0x3
/* C3750 001C3650 A3FF6014 */  bnez       $3, .L001C34E0
/* C3754 001C3654 00000000 */   nop
/* C3758 001C3658 28AE0070 */  paddub     $21, $0, $0
/* C375C 001C365C 61000010 */  b          .L001C37E4
/* C3760 001C3660 00000000 */   nop
.L001C3664:
/* C3764 001C3664 80911500 */  sll        $18, $21, 6
/* C3768 001C3668 21305002 */  addu       $6, $18, $16
/* C376C 001C366C 0100013C */  lui        $at, (0x10000 >> 16)
/* C3770 001C3670 2108C100 */  addu       $at, $6, $at
/* C3774 001C3674 60B6238C */  lw         $3, -0x49A0($at)
/* C3778 001C3678 59006010 */  beqz       $3, .L001C37E0
/* C377C 001C367C 00000000 */   nop
/* C3780 001C3680 0100013C */  lui        $at, (0x10000 >> 16)
/* C3784 001C3684 2108C100 */  addu       $at, $6, $at
/* C3788 001C3688 84B6238C */  lw         $3, -0x497C($at)
/* C378C 001C368C 54006010 */  beqz       $3, .L001C37E0
/* C3790 001C3690 00000000 */   nop
/* C3794 001C3694 0100013C */  lui        $at, (0x10000 >> 16)
/* C3798 001C3698 2108C100 */  addu       $at, $6, $at
/* C379C 001C369C 70B634C4 */  lwc1       $f20, -0x4990($at)
/* C37A0 001C36A0 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* C37A4 001C36A4 02031446 */  mul.s      $f12, $f0, $f20
/* C37A8 001C36A8 2C44040C */  jal        fptosi
/* C37AC 001C36AC 00000000 */   nop
/* C37B0 001C36B0 288E4070 */  paddub     $17, $2, $0
/* C37B4 001C36B4 21105002 */  addu       $2, $18, $16
/* C37B8 001C36B8 0100013C */  lui        $at, (0x10000 >> 16)
/* C37BC 001C36BC 21084100 */  addu       $at, $2, $at
/* C37C0 001C36C0 78B635C4 */  lwc1       $f21, -0x4988($at)
/* C37C4 001C36C4 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* C37C8 001C36C8 02031546 */  mul.s      $f12, $f0, $f21
/* C37CC 001C36CC 2C44040C */  jal        fptosi
/* C37D0 001C36D0 00000000 */   nop
/* C37D4 001C36D4 28964070 */  paddub     $18, $2, $0
/* C37D8 001C36D8 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C37DC 001C36DC 00008244 */  mtc1       $2, $f0
/* C37E0 001C36E0 00000000 */  nop
/* C37E4 001C36E4 40001446 */  add.s      $f1, $f0, $f20
/* C37E8 001C36E8 2043023C */  lui        $2, (0x43200000 >> 16)
/* C37EC 001C36EC 00008244 */  mtc1       $2, $f0
/* C37F0 001C36F0 00000000 */  nop
/* C37F4 001C36F4 030B0046 */  div.s      $f12, $f1, $f0
/* C37F8 001C36F8 2C44040C */  jal        fptosi
/* C37FC 001C36FC 00000000 */   nop
/* C3800 001C3700 289E4070 */  paddub     $19, $2, $0
/* C3804 001C3704 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C3808 001C3708 00008244 */  mtc1       $2, $f0
/* C380C 001C370C 00000000 */  nop
/* C3810 001C3710 40001546 */  add.s      $f1, $f0, $f21
/* C3814 001C3714 2043023C */  lui        $2, (0x43200000 >> 16)
/* C3818 001C3718 00008244 */  mtc1       $2, $f0
/* C381C 001C371C 00000000 */  nop
/* C3820 001C3720 030B0046 */  div.s      $f12, $f1, $f0
/* C3824 001C3724 2C44040C */  jal        fptosi
/* C3828 001C3728 00000000 */   nop
/* C382C 001C372C 80180200 */  sll        $3, $2, 2
/* C3830 001C3730 21186200 */  addu       $3, $3, $2
/* C3834 001C3734 80180300 */  sll        $3, $3, 2
/* C3838 001C3738 21406302 */  addu       $8, $19, $3
/* C383C 001C373C 80180800 */  sll        $3, $8, 2
/* C3840 001C3740 21187000 */  addu       $3, $3, $16
/* C3844 001C3744 0100013C */  lui        $at, (0x10000 >> 16)
/* C3848 001C3748 21086100 */  addu       $at, $3, $at
/* C384C 001C374C 1087238C */  lw         $3, -0x78F0($at)
/* C3850 001C3750 B09D878F */  lw         $7, -0x6250($gp)
/* C3854 001C3754 01000624 */  addiu      $6, $0, 0x1
/* C3858 001C3758 0200E614 */  bne        $7, $6, .L001C3764
/* C385C 001C375C 00000000 */   nop
/* C3860 001C3760 281EC070 */  paddub     $3, $6, $0
.L001C3764:
/* C3864 001C3764 00310800 */  sll        $6, $8, 4
/* C3868 001C3768 2130D000 */  addu       $6, $6, $16
/* C386C 001C376C 0100013C */  lui        $at, (0x10000 >> 16)
/* C3870 001C3770 2108C100 */  addu       $at, $6, $at
/* C3874 001C3774 509C278C */  lw         $7, -0x63B0($at)
/* C3878 001C3778 FFFF0624 */  addiu      $6, $0, -0x1
/* C387C 001C377C 1800E610 */  beq        $7, $6, .L001C37E0
/* C3880 001C3780 00000000 */   nop
/* C3884 001C3784 01000624 */  addiu      $6, $0, 0x1
/* C3888 001C3788 15006614 */  bne        $3, $6, .L001C37E0
/* C388C 001C378C 00000000 */   nop
/* C3890 001C3790 50000224 */  addiu      $2, $0, 0x50
/* C3894 001C3794 5001A2AF */  sw         $2, 0x150($sp)
/* C3898 001C3798 60000224 */  addiu      $2, $0, 0x60
/* C389C 001C379C 5401A2AF */  sw         $2, 0x154($sp)
/* C38A0 001C37A0 08000324 */  addiu      $3, $0, 0x8
/* C38A4 001C37A4 5801A3AF */  sw         $3, 0x158($sp)
/* C38A8 001C37A8 5C01A3AF */  sw         $3, 0x15C($sp)
/* C38AC 001C37AC 80012226 */  addiu      $2, $17, 0x180
/* C38B0 001C37B0 4001A2AF */  sw         $2, 0x140($sp)
/* C38B4 001C37B4 44004226 */  addiu      $2, $18, 0x44
/* C38B8 001C37B8 4401A2AF */  sw         $2, 0x144($sp)
/* C38BC 001C37BC 4801A3AF */  sw         $3, 0x148($sp)
/* C38C0 001C37C0 4C01A3AF */  sw         $3, 0x14C($sp)
/* C38C4 001C37C4 D48B848F */  lw         $4, -0x742C($gp)
/* C38C8 001C37C8 282E8072 */  paddub     $5, $20, $0
/* C38CC 001C37CC 4001A627 */  addiu      $6, $sp, 0x140
/* C38D0 001C37D0 5001A727 */  addiu      $7, $sp, 0x150
/* C38D4 001C37D4 2846C072 */  paddub     $8, $22, $0
/* C38D8 001C37D8 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* C38DC 001C37DC 00000000 */   nop
.L001C37E0:
/* C38E0 001C37E0 0100B526 */  addiu      $21, $21, 0x1
.L001C37E4:
/* C38E4 001C37E4 1800A32A */  slti       $3, $21, 0x18
/* C38E8 001C37E8 9EFF6014 */  bnez       $3, .L001C3664
/* C38EC 001C37EC 00000000 */   nop
/* C38F0 001C37F0 28AE0070 */  paddub     $21, $0, $0
/* C38F4 001C37F4 5C000010 */  b          .L001C3968
/* C38F8 001C37F8 00000000 */   nop
.L001C37FC:
/* C38FC 001C37FC 40911500 */  sll        $18, $21, 5
/* C3900 001C3800 21305002 */  addu       $6, $18, $16
/* C3904 001C3804 0100013C */  lui        $at, (0x10000 >> 16)
/* C3908 001C3808 2108C100 */  addu       $at, $6, $at
/* C390C 001C380C 94BC238C */  lw         $3, -0x436C($at)
/* C3910 001C3810 54006010 */  beqz       $3, .L001C3964
/* C3914 001C3814 00000000 */   nop
/* C3918 001C3818 0100013C */  lui        $at, (0x10000 >> 16)
/* C391C 001C381C 2108C100 */  addu       $at, $6, $at
/* C3920 001C3820 80BC34C4 */  lwc1       $f20, -0x4380($at)
/* C3924 001C3824 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* C3928 001C3828 02031446 */  mul.s      $f12, $f0, $f20
/* C392C 001C382C 2C44040C */  jal        fptosi
/* C3930 001C3830 00000000 */   nop
/* C3934 001C3834 288E4070 */  paddub     $17, $2, $0
/* C3938 001C3838 21105002 */  addu       $2, $18, $16
/* C393C 001C383C 0100013C */  lui        $at, (0x10000 >> 16)
/* C3940 001C3840 21084100 */  addu       $at, $2, $at
/* C3944 001C3844 88BC35C4 */  lwc1       $f21, -0x4378($at)
/* C3948 001C3848 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* C394C 001C384C 02031546 */  mul.s      $f12, $f0, $f21
/* C3950 001C3850 2C44040C */  jal        fptosi
/* C3954 001C3854 00000000 */   nop
/* C3958 001C3858 28964070 */  paddub     $18, $2, $0
/* C395C 001C385C A042023C */  lui        $2, (0x42A00000 >> 16)
/* C3960 001C3860 00008244 */  mtc1       $2, $f0
/* C3964 001C3864 00000000 */  nop
/* C3968 001C3868 40001446 */  add.s      $f1, $f0, $f20
/* C396C 001C386C 2043023C */  lui        $2, (0x43200000 >> 16)
/* C3970 001C3870 00008244 */  mtc1       $2, $f0
/* C3974 001C3874 00000000 */  nop
/* C3978 001C3878 030B0046 */  div.s      $f12, $f1, $f0
/* C397C 001C387C 2C44040C */  jal        fptosi
/* C3980 001C3880 00000000 */   nop
/* C3984 001C3884 289E4070 */  paddub     $19, $2, $0
/* C3988 001C3888 A042023C */  lui        $2, (0x42A00000 >> 16)
/* C398C 001C388C 00008244 */  mtc1       $2, $f0
/* C3990 001C3890 00000000 */  nop
/* C3994 001C3894 40001546 */  add.s      $f1, $f0, $f21
/* C3998 001C3898 2043023C */  lui        $2, (0x43200000 >> 16)
/* C399C 001C389C 00008244 */  mtc1       $2, $f0
/* C39A0 001C38A0 00000000 */  nop
/* C39A4 001C38A4 030B0046 */  div.s      $f12, $f1, $f0
/* C39A8 001C38A8 2C44040C */  jal        fptosi
/* C39AC 001C38AC 00000000 */   nop
/* C39B0 001C38B0 80180200 */  sll        $3, $2, 2
/* C39B4 001C38B4 21186200 */  addu       $3, $3, $2
/* C39B8 001C38B8 80180300 */  sll        $3, $3, 2
/* C39BC 001C38BC 21406302 */  addu       $8, $19, $3
/* C39C0 001C38C0 80180800 */  sll        $3, $8, 2
/* C39C4 001C38C4 21187000 */  addu       $3, $3, $16
/* C39C8 001C38C8 0100013C */  lui        $at, (0x10000 >> 16)
/* C39CC 001C38CC 21086100 */  addu       $at, $3, $at
/* C39D0 001C38D0 1087238C */  lw         $3, -0x78F0($at)
/* C39D4 001C38D4 B09D878F */  lw         $7, -0x6250($gp)
/* C39D8 001C38D8 01000624 */  addiu      $6, $0, 0x1
/* C39DC 001C38DC 0200E614 */  bne        $7, $6, .L001C38E8
/* C39E0 001C38E0 00000000 */   nop
/* C39E4 001C38E4 281EC070 */  paddub     $3, $6, $0
.L001C38E8:
/* C39E8 001C38E8 00310800 */  sll        $6, $8, 4
/* C39EC 001C38EC 2130D000 */  addu       $6, $6, $16
/* C39F0 001C38F0 0100013C */  lui        $at, (0x10000 >> 16)
/* C39F4 001C38F4 2108C100 */  addu       $at, $6, $at
/* C39F8 001C38F8 509C278C */  lw         $7, -0x63B0($at)
/* C39FC 001C38FC FFFF0624 */  addiu      $6, $0, -0x1
/* C3A00 001C3900 1800E610 */  beq        $7, $6, .L001C3964
/* C3A04 001C3904 00000000 */   nop
/* C3A08 001C3908 01000624 */  addiu      $6, $0, 0x1
/* C3A0C 001C390C 15006614 */  bne        $3, $6, .L001C3964
/* C3A10 001C3910 00000000 */   nop
/* C3A14 001C3914 48000224 */  addiu      $2, $0, 0x48
/* C3A18 001C3918 7001A2AF */  sw         $2, 0x170($sp)
/* C3A1C 001C391C 68000224 */  addiu      $2, $0, 0x68
/* C3A20 001C3920 7401A2AF */  sw         $2, 0x174($sp)
/* C3A24 001C3924 08000324 */  addiu      $3, $0, 0x8
/* C3A28 001C3928 7801A3AF */  sw         $3, 0x178($sp)
/* C3A2C 001C392C 7C01A3AF */  sw         $3, 0x17C($sp)
/* C3A30 001C3930 80012226 */  addiu      $2, $17, 0x180
/* C3A34 001C3934 6001A2AF */  sw         $2, 0x160($sp)
/* C3A38 001C3938 44004226 */  addiu      $2, $18, 0x44
/* C3A3C 001C393C 6401A2AF */  sw         $2, 0x164($sp)
/* C3A40 001C3940 6801A3AF */  sw         $3, 0x168($sp)
/* C3A44 001C3944 6C01A3AF */  sw         $3, 0x16C($sp)
/* C3A48 001C3948 D48B848F */  lw         $4, -0x742C($gp)
/* C3A4C 001C394C 282E8072 */  paddub     $5, $20, $0
/* C3A50 001C3950 6001A627 */  addiu      $6, $sp, 0x160
/* C3A54 001C3954 7001A727 */  addiu      $7, $sp, 0x170
/* C3A58 001C3958 2846C072 */  paddub     $8, $22, $0
/* C3A5C 001C395C C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* C3A60 001C3960 00000000 */   nop
.L001C3964:
/* C3A64 001C3964 0100B526 */  addiu      $21, $21, 0x1
.L001C3968:
/* C3A68 001C3968 0800A32A */  slti       $3, $21, 0x8
/* C3A6C 001C396C A3FF6014 */  bnez       $3, .L001C37FC
/* C3A70 001C3970 00000000 */   nop
/* C3A74 001C3974 C000A38F */  lw         $3, 0xC0($sp)
/* C3A78 001C3978 AC9D83AF */  sw         $3, -0x6254($gp)
/* C3A7C 001C397C D000A38F */  lw         $3, 0xD0($sp)
/* C3A80 001C3980 B09D83AF */  sw         $3, -0x6250($gp)
.L001C3984:
/* C3A84 001C3984 A000BF7B */  lq         $31, 0xA0($sp)
/* C3A88 001C3988 9000BE7B */  lq         $fp, 0x90($sp)
/* C3A8C 001C398C 8000B77B */  lq         $23, 0x80($sp)
/* C3A90 001C3990 7000B67B */  lq         $22, 0x70($sp)
/* C3A94 001C3994 6000B57B */  lq         $21, 0x60($sp)
/* C3A98 001C3998 5000B47B */  lq         $20, 0x50($sp)
/* C3A9C 001C399C 4000B37B */  lq         $19, 0x40($sp)
/* C3AA0 001C39A0 3000B27B */  lq         $18, 0x30($sp)
/* C3AA4 001C39A4 2000B17B */  lq         $17, 0x20($sp)
/* C3AA8 001C39A8 1000B07B */  lq         $16, 0x10($sp)
/* C3AAC 001C39AC 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* C3AB0 001C39B0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C3AB4 001C39B4 9001BD27 */  addiu      $sp, $sp, 0x190
/* C3AB8 001C39B8 0800E003 */  jr         $31
/* C3ABC 001C39BC 00000000 */   nop
