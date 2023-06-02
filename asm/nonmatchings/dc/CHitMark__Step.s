.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__8CHitMarkFv
/* B3590 001B3490 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B3594 001B3494 1000BF7F */  sq         $31, 0x10($sp)
/* B3598 001B3498 0000B07F */  sq         $16, 0x0($sp)
/* B359C 001B349C 28868070 */  paddub     $16, $4, $0
/* B35A0 001B34A0 2000A427 */  addiu      $4, $sp, 0x20
/* B35A4 001B34A4 10000526 */  addiu      $5, $16, 0x10
/* B35A8 001B34A8 0C86040C */  jal        sceVu0CopyVector
/* B35AC 001B34AC 00000000 */   nop
/* B35B0 001B34B0 5406038E */  lw         $3, 0x654($16)
/* B35B4 001B34B4 40006010 */  beqz       $3, .L001B35B8
/* B35B8 001B34B8 00000000 */   nop
/* B35BC 001B34BC 28260070 */  paddub     $4, $0, $0
/* B35C0 001B34C0 35000010 */  b          .L001B3598
/* B35C4 001B34C4 00000000 */   nop
.L001B34C8:
/* B35C8 001B34C8 80300400 */  sll        $6, $4, 2
/* B35CC 001B34CC 2118D000 */  addu       $3, $6, $16
/* B35D0 001B34D0 D4056724 */  addiu      $7, $3, 0x5D4
/* B35D4 001B34D4 D405638C */  lw         $3, 0x5D4($3)
/* B35D8 001B34D8 2E006010 */  beqz       $3, .L001B3594
/* B35DC 001B34DC 00000000 */   nop
/* B35E0 001B34E0 00190400 */  sll        $3, $4, 4
/* B35E4 001B34E4 21187000 */  addu       $3, $3, $16
/* B35E8 001B34E8 B00261C4 */  lwc1       $f1, 0x2B0($3)
/* B35EC 001B34EC B00060C4 */  lwc1       $f0, 0xB0($3)
/* B35F0 001B34F0 00000146 */  add.s      $f0, $f0, $f1
/* B35F4 001B34F4 B00060E4 */  swc1       $f0, 0xB0($3)
/* B35F8 001B34F8 B4026524 */  addiu      $5, $3, 0x2B4
/* B35FC 001B34FC B40261C4 */  lwc1       $f1, 0x2B4($3)
/* B3600 001B3500 B40060C4 */  lwc1       $f0, 0xB4($3)
/* B3604 001B3504 00000146 */  add.s      $f0, $f0, $f1
/* B3608 001B3508 B40060E4 */  swc1       $f0, 0xB4($3)
/* B360C 001B350C B80261C4 */  lwc1       $f1, 0x2B8($3)
/* B3610 001B3510 B80060C4 */  lwc1       $f0, 0xB8($3)
/* B3614 001B3514 00000146 */  add.s      $f0, $f0, $f1
/* B3618 001B3518 B80060E4 */  swc1       $f0, 0xB8($3)
/* B361C 001B351C C80501C6 */  lwc1       $f1, 0x5C8($16)
/* B3620 001B3520 B40260C4 */  lwc1       $f0, 0x2B4($3)
/* B3624 001B3524 01000146 */  sub.s      $f0, $f0, $f1
/* B3628 001B3528 B40260E4 */  swc1       $f0, 0x2B4($3)
/* B362C 001B352C 2400A1C7 */  lwc1       $f1, 0x24($sp)
/* B3630 001B3530 B40060C4 */  lwc1       $f0, 0xB4($3)
/* B3634 001B3534 40080046 */  add.s      $f1, $f1, $f0
/* B3638 001B3538 5C0600C6 */  lwc1       $f0, 0x65C($16)
/* B363C 001B353C 36080046 */  c.le.s     $f1, $f0
/* B3640 001B3540 00000000 */  nop
/* B3644 001B3544 05000045 */  bc1f       .L001B355C
/* B3648 001B3548 00000000 */   nop
/* B364C 001B354C 0000A1C4 */  lwc1       $f1, 0x0($5)
/* B3650 001B3550 FC8080C7 */  lwc1       $f0, -0x7F04($gp)
/* B3654 001B3554 02080046 */  mul.s      $f0, $f1, $f0
/* B3658 001B3558 0000A0E4 */  swc1       $f0, 0x0($5)
.L001B355C:
/* B365C 001B355C C00501C6 */  lwc1       $f1, 0x5C0($16)
/* B3660 001B3560 2118D000 */  addu       $3, $6, $16
/* B3664 001B3564 B00460C4 */  lwc1       $f0, 0x4B0($3)
/* B3668 001B3568 41000146 */  sub.s      $f1, $f0, $f1
/* B366C 001B356C B00461E4 */  swc1       $f1, 0x4B0($3)
/* B3670 001B3570 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* B3674 001B3574 36080046 */  c.le.s     $f1, $f0
/* B3678 001B3578 00000000 */  nop
/* B367C 001B357C 05000045 */  bc1f       .L001B3594
/* B3680 001B3580 00000000 */   nop
/* B3684 001B3584 0000E0AC */  sw         $0, 0x0($7)
/* B3688 001B3588 5406038E */  lw         $3, 0x654($16)
/* B368C 001B358C FFFF6324 */  addiu      $3, $3, -0x1
/* B3690 001B3590 540603AE */  sw         $3, 0x654($16)
.L001B3594:
/* B3694 001B3594 01008424 */  addiu      $4, $4, 0x1
.L001B3598:
/* B3698 001B3598 5406038E */  lw         $3, 0x654($16)
/* B369C 001B359C 2A188300 */  slt        $3, $4, $3
/* B36A0 001B35A0 C9FF6014 */  bnez       $3, .L001B34C8
/* B36A4 001B35A4 00000000 */   nop
/* B36A8 001B35A8 C40501C6 */  lwc1       $f1, 0x5C4($16)
/* B36AC 001B35AC 008180C7 */  lwc1       $f0, -0x7F00($gp)
/* B36B0 001B35B0 01080046 */  sub.s      $f0, $f1, $f0
/* B36B4 001B35B4 C40500E6 */  swc1       $f0, 0x5C4($16)
.L001B35B8:
/* B36B8 001B35B8 1000BF7B */  lq         $31, 0x10($sp)
/* B36BC 001B35BC 0000B07B */  lq         $16, 0x0($sp)
/* B36C0 001B35C0 3000BD27 */  addiu      $sp, $sp, 0x30
/* B36C4 001B35C4 0800E003 */  jr         $31
/* B36C8 001B35C8 00000000 */   nop
/* B36CC 001B35CC 00000000 */  nop
