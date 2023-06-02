.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAlt__9CEditAreaFiii
/* 6DD50 0016DC50 0500A004 */  bltz       $5, .L0016DC68
/* 6DD54 0016DC54 00000000 */   nop
/* 6DD58 0016DC58 0800838C */  lw         $3, 0x8($4)
/* 6DD5C 0016DC5C 2A18A300 */  slt        $3, $5, $3
/* 6DD60 0016DC60 03006014 */  bnez       $3, .L0016DC70
/* 6DD64 0016DC64 00000000 */   nop
.L0016DC68:
/* 6DD68 0016DC68 19000010 */  b          .L0016DCD0
/* 6DD6C 0016DC6C 00000000 */   nop
.L0016DC70:
/* 6DD70 0016DC70 0500C004 */  bltz       $6, .L0016DC88
/* 6DD74 0016DC74 00000000 */   nop
/* 6DD78 0016DC78 0C00838C */  lw         $3, 0xC($4)
/* 6DD7C 0016DC7C 2A18C300 */  slt        $3, $6, $3
/* 6DD80 0016DC80 03006014 */  bnez       $3, .L0016DC90
/* 6DD84 0016DC84 00000000 */   nop
.L0016DC88:
/* 6DD88 0016DC88 11000010 */  b          .L0016DCD0
/* 6DD8C 0016DC8C 00000000 */   nop
.L0016DC90:
/* 6DD90 0016DC90 0200E104 */  bgez       $7, .L0016DC9C
/* 6DD94 0016DC94 00000000 */   nop
/* 6DD98 0016DC98 283E0070 */  paddub     $7, $0, $0
.L0016DC9C:
/* 6DD9C 0016DC9C 8000E328 */  slti       $3, $7, 0x80
/* 6DDA0 0016DCA0 02006014 */  bnez       $3, .L0016DCAC
/* 6DDA4 0016DCA4 00000000 */   nop
/* 6DDA8 0016DCA8 7F000724 */  addiu      $7, $0, 0x7F
.L0016DCAC:
/* 6DDAC 0016DCAC C0180500 */  sll        $3, $5, 3
/* 6DDB0 0016DCB0 23186500 */  subu       $3, $3, $5
/* 6DDB4 0016DCB4 80190300 */  sll        $3, $3, 6
/* 6DDB8 0016DCB8 21206400 */  addu       $4, $3, $4
/* 6DDBC 0016DCBC C0180600 */  sll        $3, $6, 3
/* 6DDC0 0016DCC0 23186600 */  subu       $3, $3, $6
/* 6DDC4 0016DCC4 80180300 */  sll        $3, $3, 2
/* 6DDC8 0016DCC8 21186400 */  addu       $3, $3, $4
/* 6DDCC 0016DCCC 2C0067AC */  sw         $7, 0x2C($3)
.L0016DCD0:
/* 6DDD0 0016DCD0 0800E003 */  jr         $31
/* 6DDD4 0016DCD4 00000000 */   nop
/* 6DDD8 0016DCD8 00000000 */  nop
/* 6DDDC 0016DCDC 00000000 */  nop
