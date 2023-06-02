.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDistLine__FPfPfPfPf
/* 71C70 00171B70 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 71C74 00171B74 5000BF7F */  sq         $31, 0x50($sp)
/* 71C78 00171B78 4000B37F */  sq         $19, 0x40($sp)
/* 71C7C 00171B7C 3000B27F */  sq         $18, 0x30($sp)
/* 71C80 00171B80 2000B17F */  sq         $17, 0x20($sp)
/* 71C84 00171B84 1000B07F */  sq         $16, 0x10($sp)
/* 71C88 00171B88 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 71C8C 00171B8C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 71C90 00171B90 289E8070 */  paddub     $19, $4, $0
/* 71C94 00171B94 2896A070 */  paddub     $18, $5, $0
/* 71C98 00171B98 288EC070 */  paddub     $17, $6, $0
/* 71C9C 00171B9C 2886E070 */  paddub     $16, $7, $0
/* 71CA0 00171BA0 6000A427 */  addiu      $4, $sp, 0x60
/* 71CA4 00171BA4 28366072 */  paddub     $6, $19, $0
/* 71CA8 00171BA8 EE85040C */  jal        sceVu0SubVector
/* 71CAC 00171BAC 00000000 */   nop
/* 71CB0 00171BB0 7000A427 */  addiu      $4, $sp, 0x70
/* 71CB4 00171BB4 282E2072 */  paddub     $5, $17, $0
/* 71CB8 00171BB8 28366072 */  paddub     $6, $19, $0
/* 71CBC 00171BBC EE85040C */  jal        sceVu0SubVector
/* 71CC0 00171BC0 00000000 */   nop
/* 71CC4 00171BC4 9000A427 */  addiu      $4, $sp, 0x90
/* 71CC8 00171BC8 7000A527 */  addiu      $5, $sp, 0x70
/* 71CCC 00171BCC 6000A627 */  addiu      $6, $sp, 0x60
/* 71CD0 00171BD0 EE85040C */  jal        sceVu0SubVector
/* 71CD4 00171BD4 00000000 */   nop
/* 71CD8 00171BD8 9000A427 */  addiu      $4, $sp, 0x90
/* 71CDC 00171BDC 588D040C */  jal        DistVector__FPf
/* 71CE0 00171BE0 00000000 */   nop
/* 71CE4 00171BE4 06050046 */  mov.s      $f20, $f0
/* 71CE8 00171BE8 02A51446 */  mul.s      $f20, $f20, $f20
/* 71CEC 00171BEC 6000A427 */  addiu      $4, $sp, 0x60
/* 71CF0 00171BF0 9000A527 */  addiu      $5, $sp, 0x90
/* 71CF4 00171BF4 8885040C */  jal        sceVu0InnerProduct
/* 71CF8 00171BF8 00000000 */   nop
/* 71CFC 00171BFC 07000046 */  neg.s      $f0, $f0
/* 71D00 00171C00 03031446 */  div.s      $f12, $f0, $f20
/* 71D04 00171C04 00008044 */  mtc1       $0, $f0
/* 71D08 00171C08 00000000 */  nop
/* 71D0C 00171C0C 34600046 */  c.lt.s     $f12, $f0
/* 71D10 00171C10 00000000 */  nop
/* 71D14 00171C14 08000145 */  bc1t       .L00171C38
/* 71D18 00171C18 00000000 */   nop
/* 71D1C 00171C1C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 71D20 00171C20 00008244 */  mtc1       $2, $f0
/* 71D24 00171C24 00000000 */  nop
/* 71D28 00171C28 36600046 */  c.le.s     $f12, $f0
/* 71D2C 00171C2C 00000000 */  nop
/* 71D30 00171C30 1D000145 */  bc1t       .L00171CA8
/* 71D34 00171C34 00000000 */   nop
.L00171C38:
/* 71D38 00171C38 28266072 */  paddub     $4, $19, $0
/* 71D3C 00171C3C 282E4072 */  paddub     $5, $18, $0
/* 71D40 00171C40 648D040C */  jal        DistVector__FPfPf
/* 71D44 00171C44 00000000 */   nop
/* 71D48 00171C48 06050046 */  mov.s      $f20, $f0
/* 71D4C 00171C4C 28266072 */  paddub     $4, $19, $0
/* 71D50 00171C50 282E2072 */  paddub     $5, $17, $0
/* 71D54 00171C54 648D040C */  jal        DistVector__FPfPf
/* 71D58 00171C58 00000000 */   nop
/* 71D5C 00171C5C 46050046 */  mov.s      $f21, $f0
/* 71D60 00171C60 34A01546 */  c.lt.s     $f20, $f21
/* 71D64 00171C64 00000000 */  nop
/* 71D68 00171C68 08000045 */  bc1f       .L00171C8C
/* 71D6C 00171C6C 00000000 */   nop
/* 71D70 00171C70 28260072 */  paddub     $4, $16, $0
/* 71D74 00171C74 282E4072 */  paddub     $5, $18, $0
/* 71D78 00171C78 0C86040C */  jal        sceVu0CopyVector
/* 71D7C 00171C7C 00000000 */   nop
/* 71D80 00171C80 06A00046 */  mov.s      $f0, $f20
/* 71D84 00171C84 19000010 */  b          .L00171CEC
/* 71D88 00171C88 00000000 */   nop
.L00171C8C:
/* 71D8C 00171C8C 28260072 */  paddub     $4, $16, $0
/* 71D90 00171C90 282E2072 */  paddub     $5, $17, $0
/* 71D94 00171C94 0C86040C */  jal        sceVu0CopyVector
/* 71D98 00171C98 00000000 */   nop
/* 71D9C 00171C9C 06A80046 */  mov.s      $f0, $f21
/* 71DA0 00171CA0 12000010 */  b          .L00171CEC
/* 71DA4 00171CA4 00000000 */   nop
.L00171CA8:
/* 71DA8 00171CA8 8000A427 */  addiu      $4, $sp, 0x80
/* 71DAC 00171CAC 9000A527 */  addiu      $5, $sp, 0x90
/* 71DB0 00171CB0 FA85040C */  jal        sceVu0ScaleVector
/* 71DB4 00171CB4 00000000 */   nop
/* 71DB8 00171CB8 8000A427 */  addiu      $4, $sp, 0x80
/* 71DBC 00171CBC 6000A527 */  addiu      $5, $sp, 0x60
/* 71DC0 00171CC0 28368070 */  paddub     $6, $4, $0
/* 71DC4 00171CC4 E885040C */  jal        sceVu0AddVector
/* 71DC8 00171CC8 00000000 */   nop
/* 71DCC 00171CCC 28260072 */  paddub     $4, $16, $0
/* 71DD0 00171CD0 8000A527 */  addiu      $5, $sp, 0x80
/* 71DD4 00171CD4 28366072 */  paddub     $6, $19, $0
/* 71DD8 00171CD8 E885040C */  jal        sceVu0AddVector
/* 71DDC 00171CDC 00000000 */   nop
/* 71DE0 00171CE0 8000A427 */  addiu      $4, $sp, 0x80
/* 71DE4 00171CE4 588D040C */  jal        DistVector__FPf
/* 71DE8 00171CE8 00000000 */   nop
.L00171CEC:
/* 71DEC 00171CEC 5000BF7B */  lq         $31, 0x50($sp)
/* 71DF0 00171CF0 4000B37B */  lq         $19, 0x40($sp)
/* 71DF4 00171CF4 3000B27B */  lq         $18, 0x30($sp)
/* 71DF8 00171CF8 2000B17B */  lq         $17, 0x20($sp)
/* 71DFC 00171CFC 1000B07B */  lq         $16, 0x10($sp)
/* 71E00 00171D00 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 71E04 00171D04 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 71E08 00171D08 A000BD27 */  addiu      $sp, $sp, 0xA0
/* 71E0C 00171D0C 0800E003 */  jr         $31
/* 71E10 00171D10 00000000 */   nop
/* 71E14 00171D14 00000000 */  nop
/* 71E18 00171D18 00000000 */  nop
/* 71E1C 00171D1C 00000000 */  nop
