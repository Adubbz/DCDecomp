.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingGetAngleFishSize__FPiPi
/* A9930 001A9830 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A9934 001A9834 2000BF7F */  sq         $31, 0x20($sp)
/* A9938 001A9838 1000B17F */  sq         $17, 0x10($sp)
/* A993C 001A983C 0000B07F */  sq         $16, 0x0($sp)
/* A9940 001A9840 288E8070 */  paddub     $17, $4, $0
/* A9944 001A9844 2886A070 */  paddub     $16, $5, $0
/* A9948 001A9848 6C93828F */  lw         $2, -0x6C94($gp)
/* A994C 001A984C 04004014 */  bnez       $2, .L001A9860
/* A9950 001A9850 00000000 */   nop
/* A9954 001A9854 FFFF0224 */  addiu      $2, $0, -0x1
/* A9958 001A9858 10000010 */  b          .L001A989C
/* A995C 001A985C 00000000 */   nop
.L001A9860:
/* A9960 001A9860 600041C4 */  lwc1       $f1, 0x60($2)
/* A9964 001A9864 2041023C */  lui        $2, (0x41200000 >> 16)
/* A9968 001A9868 00008244 */  mtc1       $2, $f0
/* A996C 001A986C 00000000 */  nop
/* A9970 001A9870 02030146 */  mul.s      $f12, $f0, $f1
/* A9974 001A9874 2C44040C */  jal        fptosi
/* A9978 001A9878 00000000 */   nop
/* A997C 001A987C 000022AE */  sw         $2, 0x0($17)
/* A9980 001A9880 6C93848F */  lw         $4, -0x6C94($gp)
/* A9984 001A9884 A003090C */  jal        GetFP__5CFishFv
/* A9988 001A9888 00000000 */   nop
/* A998C 001A988C 000002AE */  sw         $2, 0x0($16)
/* A9990 001A9890 6C93828F */  lw         $2, -0x6C94($gp)
/* A9994 001A9894 0000428C */  lw         $2, 0x0($2)
/* A9998 001A9898 00000000 */  nop
.L001A989C:
/* A999C 001A989C 2000BF7B */  lq         $31, 0x20($sp)
/* A99A0 001A98A0 1000B17B */  lq         $17, 0x10($sp)
/* A99A4 001A98A4 0000B07B */  lq         $16, 0x0($sp)
/* A99A8 001A98A8 3000BD27 */  addiu      $sp, $sp, 0x30
/* A99AC 001A98AC 0800E003 */  jr         $31
/* A99B0 001A98B0 00000000 */   nop
/* A99B4 001A98B4 00000000 */  nop
/* A99B8 001A98B8 00000000 */  nop
/* A99BC 001A98BC 00000000 */  nop
