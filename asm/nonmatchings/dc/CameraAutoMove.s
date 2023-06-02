.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CameraAutoMove__FP13CCameraFollowP6CCPolyPfff
/* 69C70 00169B70 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 69C74 00169B74 3000BF7F */  sq         $31, 0x30($sp)
/* 69C78 00169B78 2000B17F */  sq         $17, 0x20($sp)
/* 69C7C 00169B7C 1000B07F */  sq         $16, 0x10($sp)
/* 69C80 00169B80 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 69C84 00169B84 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 69C88 00169B88 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 69C8C 00169B8C 28868070 */  paddub     $16, $4, $0
/* 69C90 00169B90 288EC070 */  paddub     $17, $6, $0
/* 69C94 00169B94 46650046 */  mov.s      $f21, $f12
/* 69C98 00169B98 066D0046 */  mov.s      $f20, $f13
/* 69C9C 00169B9C 4000A527 */  addiu      $5, $sp, 0x40
/* 69CA0 00169BA0 A891040C */  jal        GetRef__7CCameraFPf
/* 69CA4 00169BA4 00000000 */   nop
/* 69CA8 00169BA8 000021C6 */  lwc1       $f1, 0x0($17)
/* 69CAC 00169BAC 4000A0C7 */  lwc1       $f0, 0x40($sp)
/* 69CB0 00169BB0 01080046 */  sub.s      $f0, $f1, $f0
/* 69CB4 00169BB4 5000A0E7 */  swc1       $f0, 0x50($sp)
/* 69CB8 00169BB8 080021C6 */  lwc1       $f1, 0x8($17)
/* 69CBC 00169BBC 4800A0C7 */  lwc1       $f0, 0x48($sp)
/* 69CC0 00169BC0 01080046 */  sub.s      $f0, $f1, $f0
/* 69CC4 00169BC4 5800B127 */  addiu      $17, $sp, 0x58
/* 69CC8 00169BC8 000020E6 */  swc1       $f0, 0x0($17)
/* 69CCC 00169BCC 5400A0AF */  sw         $0, 0x54($sp)
/* 69CD0 00169BD0 5000A427 */  addiu      $4, $sp, 0x50
/* 69CD4 00169BD4 588D040C */  jal        DistVector__FPf
/* 69CD8 00169BD8 00000000 */   nop
/* 69CDC 00169BDC 808081C7 */  lwc1       $f1, -0x7F80($gp)
/* 69CE0 00169BE0 000B0046 */  add.s      $f12, $f1, $f0
/* 69CE4 00169BE4 28260072 */  paddub     $4, $16, $0
/* 69CE8 00169BE8 DC92040C */  jal        SetDistance__13CCameraFollowFf
/* 69CEC 00169BEC 00000000 */   nop
/* 69CF0 00169BF0 00B08044 */  mtc1       $0, $f22
/* 69CF4 00169BF4 28260072 */  paddub     $4, $16, $0
/* 69CF8 00169BF8 E092040C */  jal        GetDistance__13CCameraFollowFv
/* 69CFC 00169BFC 00000000 */   nop
/* 69D00 00169C00 288781C7 */  lwc1       $f1, -0x78D8($gp)
/* 69D04 00169C04 81000146 */  sub.s      $f2, $f0, $f1
/* 69D08 00169C08 06B00046 */  mov.s      $f0, $f22
/* 69D0C 00169C0C 34100046 */  c.lt.s     $f2, $f0
/* 69D10 00169C10 00000000 */  nop
/* 69D14 00169C14 06000045 */  bc1f       .L00169C30
/* 69D18 00169C18 00000000 */   nop
/* 69D1C 00169C1C 47100046 */  neg.s      $f1, $f2
/* 69D20 00169C20 2041023C */  lui        $2, (0x41200000 >> 16)
/* 69D24 00169C24 00008244 */  mtc1       $2, $f0
/* 69D28 00169C28 00000000 */  nop
/* 69D2C 00169C2C 830D0046 */  div.s      $f22, $f1, $f0
.L00169C30:
/* 69D30 00169C30 00008044 */  mtc1       $0, $f0
/* 69D34 00169C34 00000000 */  nop
/* 69D38 00169C38 36100046 */  c.le.s     $f2, $f0
/* 69D3C 00169C3C 00000000 */  nop
/* 69D40 00169C40 05000145 */  bc1t       .L00169C58
/* 69D44 00169C44 00000000 */   nop
/* 69D48 00169C48 7041023C */  lui        $2, (0x41700000 >> 16)
/* 69D4C 00169C4C 00008244 */  mtc1       $2, $f0
/* 69D50 00169C50 00000000 */  nop
/* 69D54 00169C54 83150046 */  div.s      $f22, $f2, $f0
.L00169C58:
/* 69D58 00169C58 0040023C */  lui        $2, (0x40000000 >> 16)
/* 69D5C 00169C5C 00008244 */  mtc1       $2, $f0
/* 69D60 00169C60 00000000 */  nop
/* 69D64 00169C64 36B00046 */  c.le.s     $f22, $f0
/* 69D68 00169C68 00000000 */  nop
/* 69D6C 00169C6C 02000145 */  bc1t       .L00169C78
/* 69D70 00169C70 00000000 */   nop
/* 69D74 00169C74 86050046 */  mov.s      $f22, $f0
.L00169C78:
/* 69D78 00169C78 308280C7 */  lwc1       $f0, -0x7DD0($gp)
/* 69D7C 00169C7C 34B00046 */  c.lt.s     $f22, $f0
/* 69D80 00169C80 00000000 */  nop
/* 69D84 00169C84 02000045 */  bc1f       .L00169C90
/* 69D88 00169C88 00000000 */   nop
/* 69D8C 00169C8C 86050046 */  mov.s      $f22, $f0
.L00169C90:
/* 69D90 00169C90 00008044 */  mtc1       $0, $f0
/* 69D94 00169C94 00000000 */  nop
/* 69D98 00169C98 34100046 */  c.lt.s     $f2, $f0
/* 69D9C 00169C9C 00000000 */  nop
/* 69DA0 00169CA0 05000045 */  bc1f       .L00169CB8
/* 69DA4 00169CA4 00000000 */   nop
/* 69DA8 00169CA8 0040023C */  lui        $2, (0x40000000 >> 16)
/* 69DAC 00169CAC 00008244 */  mtc1       $2, $f0
/* 69DB0 00169CB0 00000000 */  nop
/* 69DB4 00169CB4 82B50046 */  mul.s      $f22, $f22, $f0
.L00169CB8:
/* 69DB8 00169CB8 5000ACC7 */  lwc1       $f12, 0x50($sp)
/* 69DBC 00169CBC 00002DC6 */  lwc1       $f13, 0x0($17)
/* 69DC0 00169CC0 5077040C */  jal        atan2f
/* 69DC4 00169CC4 00000000 */   nop
/* 69DC8 00169CC8 28260072 */  paddub     $4, $16, $0
/* 69DCC 00169CCC 06030046 */  mov.s      $f12, $f0
/* 69DD0 00169CD0 C892040C */  jal        SetAngle__13CCameraFollowFf
/* 69DD4 00169CD4 00000000 */   nop
/* 69DD8 00169CD8 34A81446 */  c.lt.s     $f21, $f20
/* 69DDC 00169CDC 00000000 */  nop
/* 69DE0 00169CE0 09000045 */  bc1f       .L00169D08
/* 69DE4 00169CE4 00000000 */   nop
/* 69DE8 00169CE8 47B00046 */  neg.s      $f1, $f22
/* 69DEC 00169CEC 9C8080C7 */  lwc1       $f0, -0x7F64($gp)
/* 69DF0 00169CF0 02030146 */  mul.s      $f12, $f0, $f1
/* 69DF4 00169CF4 28260072 */  paddub     $4, $16, $0
/* 69DF8 00169CF8 D492040C */  jal        AddAngle__13CCameraFollowFf
/* 69DFC 00169CFC 00000000 */   nop
/* 69E00 00169D00 06000010 */  b          .L00169D1C
/* 69E04 00169D04 00000000 */   nop
.L00169D08:
/* 69E08 00169D08 9C8080C7 */  lwc1       $f0, -0x7F64($gp)
/* 69E0C 00169D0C 02031646 */  mul.s      $f12, $f0, $f22
/* 69E10 00169D10 28260072 */  paddub     $4, $16, $0
/* 69E14 00169D14 D492040C */  jal        AddAngle__13CCameraFollowFf
/* 69E18 00169D18 00000000 */   nop
.L00169D1C:
/* 69E1C 00169D1C 28260072 */  paddub     $4, $16, $0
/* 69E20 00169D20 E092040C */  jal        GetDistance__13CCameraFollowFv
/* 69E24 00169D24 00000000 */   nop
/* 69E28 00169D28 008282C7 */  lwc1       $f2, -0x7E00($gp)
/* 69E2C 00169D2C 288781C7 */  lwc1       $f1, -0x78D8($gp)
/* 69E30 00169D30 42100146 */  mul.s      $f1, $f2, $f1
/* 69E34 00169D34 34000146 */  c.lt.s     $f0, $f1
/* 69E38 00169D38 00000000 */  nop
/* 69E3C 00169D3C 06000045 */  bc1f       .L00169D58
/* 69E40 00169D40 00000000 */   nop
/* 69E44 00169D44 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 69E48 00169D48 00608244 */  mtc1       $2, $f12
/* 69E4C 00169D4C 28260072 */  paddub     $4, $16, $0
/* 69E50 00169D50 F492040C */  jal        AddHeight__13CCameraFollowFf
/* 69E54 00169D54 00000000 */   nop
.L00169D58:
/* 69E58 00169D58 3000BF7B */  lq         $31, 0x30($sp)
/* 69E5C 00169D5C 2000B17B */  lq         $17, 0x20($sp)
/* 69E60 00169D60 1000B07B */  lq         $16, 0x10($sp)
/* 69E64 00169D64 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 69E68 00169D68 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 69E6C 00169D6C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 69E70 00169D70 6000BD27 */  addiu      $sp, $sp, 0x60
/* 69E74 00169D74 0800E003 */  jr         $31
/* 69E78 00169D78 00000000 */   nop
/* 69E7C 00169D7C 00000000 */  nop