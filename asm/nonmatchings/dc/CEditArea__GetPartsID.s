.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPartsID__9CEditAreaFii
/* 6DC50 0016DB50 0500A004 */  bltz       $5, .L0016DB68
/* 6DC54 0016DB54 00000000 */   nop
/* 6DC58 0016DB58 0800828C */  lw         $2, 0x8($4)
/* 6DC5C 0016DB5C 2A10A200 */  slt        $2, $5, $2
/* 6DC60 0016DB60 04004014 */  bnez       $2, .L0016DB74
/* 6DC64 0016DB64 00000000 */   nop
.L0016DB68:
/* 6DC68 0016DB68 FFFF0224 */  addiu      $2, $0, -0x1
/* 6DC6C 0016DB6C 14000010 */  b          .L0016DBC0
/* 6DC70 0016DB70 00000000 */   nop
.L0016DB74:
/* 6DC74 0016DB74 0500C004 */  bltz       $6, .L0016DB8C
/* 6DC78 0016DB78 00000000 */   nop
/* 6DC7C 0016DB7C 0C00828C */  lw         $2, 0xC($4)
/* 6DC80 0016DB80 2A10C200 */  slt        $2, $6, $2
/* 6DC84 0016DB84 04004014 */  bnez       $2, .L0016DB98
/* 6DC88 0016DB88 00000000 */   nop
.L0016DB8C:
/* 6DC8C 0016DB8C FFFF0224 */  addiu      $2, $0, -0x1
/* 6DC90 0016DB90 0B000010 */  b          .L0016DBC0
/* 6DC94 0016DB94 00000000 */   nop
.L0016DB98:
/* 6DC98 0016DB98 C0100500 */  sll        $2, $5, 3
/* 6DC9C 0016DB9C 23104500 */  subu       $2, $2, $5
/* 6DCA0 0016DBA0 80110200 */  sll        $2, $2, 6
/* 6DCA4 0016DBA4 21184400 */  addu       $3, $2, $4
/* 6DCA8 0016DBA8 C0100600 */  sll        $2, $6, 3
/* 6DCAC 0016DBAC 23104600 */  subu       $2, $2, $6
/* 6DCB0 0016DBB0 80100200 */  sll        $2, $2, 2
/* 6DCB4 0016DBB4 21104300 */  addu       $2, $2, $3
/* 6DCB8 0016DBB8 3400428C */  lw         $2, 0x34($2)
/* 6DCBC 0016DBBC 00000000 */  nop
.L0016DBC0:
/* 6DCC0 0016DBC0 0800E003 */  jr         $31
/* 6DCC4 0016DBC4 00000000 */   nop
/* 6DCC8 0016DBC8 00000000 */  nop
/* 6DCCC 0016DBCC 00000000 */  nop
