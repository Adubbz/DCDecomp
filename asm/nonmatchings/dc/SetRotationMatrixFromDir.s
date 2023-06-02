.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotationMatrixFromDir__FPA4_fPff
/* 49890 00149790 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 49894 00149794 3000BF7F */  sq         $31, 0x30($sp)
/* 49898 00149798 2000B17F */  sq         $17, 0x20($sp)
/* 4989C 0014979C 1000B07F */  sq         $16, 0x10($sp)
/* 498A0 001497A0 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 498A4 001497A4 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 498A8 001497A8 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 498AC 001497AC 288E8070 */  paddub     $17, $4, $0
/* 498B0 001497B0 2886A070 */  paddub     $16, $5, $0
/* 498B4 001497B4 46650046 */  mov.s      $f21, $f12
/* 498B8 001497B8 AC75040C */  jal        cosf
/* 498BC 001497BC 00000000 */   nop
/* 498C0 001497C0 06050046 */  mov.s      $f20, $f0
/* 498C4 001497C4 06AB0046 */  mov.s      $f12, $f21
/* 498C8 001497C8 2876040C */  jal        sinf
/* 498CC 001497CC 00000000 */   nop
/* 498D0 001497D0 46050046 */  mov.s      $f21, $f0
/* 498D4 001497D4 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 498D8 001497D8 00008244 */  mtc1       $2, $f0
/* 498DC 001497DC 00000000 */  nop
/* 498E0 001497E0 81051446 */  sub.s      $f22, $f0, $f20
/* 498E4 001497E4 28262072 */  paddub     $4, $17, $0
/* 498E8 001497E8 2A86040C */  jal        sceVu0UnitMatrix
/* 498EC 001497EC 00000000 */   nop
/* 498F0 001497F0 4000A427 */  addiu      $4, $sp, 0x40
/* 498F4 001497F4 282E0072 */  paddub     $5, $16, $0
/* 498F8 001497F8 9285040C */  jal        sceVu0Normalize
/* 498FC 001497FC 00000000 */   nop
/* 49900 00149800 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* 49904 00149804 02000046 */  mul.s      $f0, $f0, $f0
/* 49908 00149808 02B00046 */  mul.s      $f0, $f22, $f0
/* 4990C 0014980C 00A00046 */  add.s      $f0, $f20, $f0
/* 49910 00149810 000020E6 */  swc1       $f0, 0x0($17)
/* 49914 00149814 4400A327 */  addiu      $3, $sp, 0x44
/* 49918 00149818 4000A1C7 */  lwc1       $f1, 0x40($sp)
/* 4991C 0014981C 000060C4 */  lwc1       $f0, 0x0($3)
/* 49920 00149820 02080046 */  mul.s      $f0, $f1, $f0
/* 49924 00149824 1AB00046 */  mula.s     $f22, $f0
/* 49928 00149828 4800A427 */  addiu      $4, $sp, 0x48
/* 4992C 0014982C 000080C4 */  lwc1       $f0, 0x0($4)
/* 49930 00149830 1D001546 */  msub.s     $f0, $f0, $f21
/* 49934 00149834 040020E6 */  swc1       $f0, 0x4($17)
/* 49938 00149838 4000A1C7 */  lwc1       $f1, 0x40($sp)
/* 4993C 0014983C 000080C4 */  lwc1       $f0, 0x0($4)
/* 49940 00149840 02080046 */  mul.s      $f0, $f1, $f0
/* 49944 00149844 1AB00046 */  mula.s     $f22, $f0
/* 49948 00149848 000060C4 */  lwc1       $f0, 0x0($3)
/* 4994C 0014984C 1C001546 */  madd.s     $f0, $f0, $f21
/* 49950 00149850 080020E6 */  swc1       $f0, 0x8($17)
/* 49954 00149854 000061C4 */  lwc1       $f1, 0x0($3)
/* 49958 00149858 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* 4995C 0014985C 02080046 */  mul.s      $f0, $f1, $f0
/* 49960 00149860 1AB00046 */  mula.s     $f22, $f0
/* 49964 00149864 000080C4 */  lwc1       $f0, 0x0($4)
/* 49968 00149868 1C001546 */  madd.s     $f0, $f0, $f21
/* 4996C 0014986C 100020E6 */  swc1       $f0, 0x10($17)
/* 49970 00149870 000060C4 */  lwc1       $f0, 0x0($3)
/* 49974 00149874 02000046 */  mul.s      $f0, $f0, $f0
/* 49978 00149878 02B00046 */  mul.s      $f0, $f22, $f0
/* 4997C 0014987C 00A00046 */  add.s      $f0, $f20, $f0
/* 49980 00149880 140020E6 */  swc1       $f0, 0x14($17)
/* 49984 00149884 000061C4 */  lwc1       $f1, 0x0($3)
/* 49988 00149888 000080C4 */  lwc1       $f0, 0x0($4)
/* 4998C 0014988C 02080046 */  mul.s      $f0, $f1, $f0
/* 49990 00149890 1AB00046 */  mula.s     $f22, $f0
/* 49994 00149894 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* 49998 00149898 1D001546 */  msub.s     $f0, $f0, $f21
/* 4999C 0014989C 180020E6 */  swc1       $f0, 0x18($17)
/* 499A0 001498A0 000081C4 */  lwc1       $f1, 0x0($4)
/* 499A4 001498A4 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* 499A8 001498A8 02080046 */  mul.s      $f0, $f1, $f0
/* 499AC 001498AC 1AB00046 */  mula.s     $f22, $f0
/* 499B0 001498B0 000060C4 */  lwc1       $f0, 0x0($3)
/* 499B4 001498B4 1D001546 */  msub.s     $f0, $f0, $f21
/* 499B8 001498B8 200020E6 */  swc1       $f0, 0x20($17)
/* 499BC 001498BC 000081C4 */  lwc1       $f1, 0x0($4)
/* 499C0 001498C0 000060C4 */  lwc1       $f0, 0x0($3)
/* 499C4 001498C4 02080046 */  mul.s      $f0, $f1, $f0
/* 499C8 001498C8 1AB00046 */  mula.s     $f22, $f0
/* 499CC 001498CC 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* 499D0 001498D0 1C001546 */  madd.s     $f0, $f0, $f21
/* 499D4 001498D4 240020E6 */  swc1       $f0, 0x24($17)
/* 499D8 001498D8 000080C4 */  lwc1       $f0, 0x0($4)
/* 499DC 001498DC 02000046 */  mul.s      $f0, $f0, $f0
/* 499E0 001498E0 02B00046 */  mul.s      $f0, $f22, $f0
/* 499E4 001498E4 00A00046 */  add.s      $f0, $f20, $f0
/* 499E8 001498E8 280020E6 */  swc1       $f0, 0x28($17)
/* 499EC 001498EC 3000BF7B */  lq         $31, 0x30($sp)
/* 499F0 001498F0 2000B17B */  lq         $17, 0x20($sp)
/* 499F4 001498F4 1000B07B */  lq         $16, 0x10($sp)
/* 499F8 001498F8 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 499FC 001498FC 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 49A00 00149900 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 49A04 00149904 5000BD27 */  addiu      $sp, $sp, 0x50
/* 49A08 00149908 0800E003 */  jr         $31
/* 49A0C 0014990C 00000000 */   nop