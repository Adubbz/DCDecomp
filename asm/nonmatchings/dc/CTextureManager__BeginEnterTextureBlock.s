.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BeginEnterTextureBlock__15CTextureManagerFi
/* 33680 00133580 0400A004 */  bltz       $5, .L00133594
/* 33684 00133584 00000000 */   nop
/* 33688 00133588 4800A328 */  slti       $3, $5, 0x48
/* 3368C 0013358C 03006014 */  bnez       $3, .L0013359C
/* 33690 00133590 00000000 */   nop
.L00133594:
/* 33694 00133594 1E000010 */  b          .L00133610
/* 33698 00133598 00000000 */   nop
.L0013359C:
/* 3369C 0013359C 00190500 */  sll        $3, $5, 4
/* 336A0 001335A0 23186500 */  subu       $3, $3, $5
/* 336A4 001335A4 80300300 */  sll        $6, $3, 2
/* 336A8 001335A8 2118C400 */  addu       $3, $6, $4
/* 336AC 001335AC 38006524 */  addiu      $5, $3, 0x38
/* 336B0 001335B0 3800638C */  lw         $3, 0x38($3)
/* 336B4 001335B4 03006014 */  bnez       $3, .L001335C4
/* 336B8 001335B8 00000000 */   nop
/* 336BC 001335BC 401A0324 */  addiu      $3, $0, 0x1A40
/* 336C0 001335C0 0000A3AC */  sw         $3, 0x0($5)
.L001335C4:
/* 336C4 001335C4 2118C400 */  addu       $3, $6, $4
/* 336C8 001335C8 3C006524 */  addiu      $5, $3, 0x3C
/* 336CC 001335CC 3C00638C */  lw         $3, 0x3C($3)
/* 336D0 001335D0 03006014 */  bnez       $3, .L001335E0
/* 336D4 001335D4 00000000 */   nop
/* 336D8 001335D8 401A0324 */  addiu      $3, $0, 0x1A40
/* 336DC 001335DC 0000A3AC */  sw         $3, 0x0($5)
.L001335E0:
/* 336E0 001335E0 3C4E838C */  lw         $3, 0x4E3C($4)
/* 336E4 001335E4 00290300 */  sll        $5, $3, 4
/* 336E8 001335E8 384E838C */  lw         $3, 0x4E38($4)
/* 336EC 001335EC 21186500 */  addu       $3, $3, $5
/* 336F0 001335F0 2130C400 */  addu       $6, $6, $4
/* 336F4 001335F4 4C00C3AC */  sw         $3, 0x4C($6)
/* 336F8 001335F8 3C4E838C */  lw         $3, 0x4E3C($4)
/* 336FC 001335FC 00290300 */  sll        $5, $3, 4
/* 33700 00133600 384E838C */  lw         $3, 0x4E38($4)
/* 33704 00133604 21186500 */  addu       $3, $3, $5
/* 33708 00133608 5000C3AC */  sw         $3, 0x50($6)
/* 3370C 0013360C 4000C0AC */  sw         $0, 0x40($6)
.L00133610:
/* 33710 00133610 0800E003 */  jr         $31
/* 33714 00133614 00000000 */   nop
/* 33718 00133618 00000000 */  nop
/* 3371C 0013361C 00000000 */  nop