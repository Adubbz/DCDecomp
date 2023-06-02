.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_reg_addr
/* DD58 0010DC58 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* DD5C 0010DC5C 2D308000 */  daddu      $6, $4, $0
/* DD60 0010DC60 0000BFFF */  sd         $31, 0x0($sp)
/* DD64 0010DC64 9C02A824 */  addiu      $8, $5, 0x29C
/* DD68 0010DC68 21180601 */  addu       $3, $8, $6
/* DD6C 0010DC6C 02000224 */  addiu      $2, $0, 0x2
/* DD70 0010DC70 00006480 */  lb         $4, 0x0($3)
/* DD74 0010DC74 0C008214 */  bne        $4, $2, .L0010DCA8
/* DD78 0010DC78 21100601 */   addu      $2, $8, $6
/* DD7C 0010DC7C 1800A724 */  addiu      $7, $5, 0x18
/* DD80 0010DC80 C0100600 */  sll        $2, $6, 3
/* DD84 0010DC84 02000424 */  addiu      $4, $0, 0x2
.L0010DC88:
/* DD88 0010DC88 2110E200 */  addu       $2, $7, $2
/* DD8C 0010DC8C 000043DC */  ld         $3, 0x0($2)
/* DD90 0010DC90 3C300300 */  dsll32     $6, $3, 0
/* DD94 0010DC94 3F300600 */  dsra32     $6, $6, 0
/* DD98 0010DC98 21100601 */  addu       $2, $8, $6
/* DD9C 0010DC9C 00004380 */  lb         $3, 0x0($2)
/* DDA0 0010DCA0 F9FF6450 */  beql       $3, $4, .L0010DC88
/* DDA4 0010DCA4 C0100600 */   sll       $2, $6, 3
.L0010DCA8:
/* DDA8 0010DCA8 01000424 */  addiu      $4, $0, 0x1
/* DDAC 0010DCAC 00004380 */  lb         $3, 0x0($2)
/* DDB0 0010DCB0 06006414 */  bne        $3, $4, .L0010DCCC
/* DDB4 0010DCB4 C0180600 */   sll       $3, $6, 3
/* DDB8 0010DCB8 0000A48C */  lw         $4, 0x0($5)
/* DDBC 0010DCBC 2118A300 */  addu       $3, $5, $3
/* DDC0 0010DCC0 1800628C */  lw         $2, 0x18($3)
/* DDC4 0010DCC4 03000010 */  b          .L0010DCD4
/* DDC8 0010DCC8 21108200 */   addu      $2, $4, $2
.L0010DCCC:
/* DDCC 0010DCCC 6A00040C */  jal        abort
/* DDD0 0010DCD0 00000000 */   nop
.L0010DCD4:
/* DDD4 0010DCD4 0000BFDF */  ld         $31, 0x0($sp)
/* DDD8 0010DCD8 0800E003 */  jr         $31
/* DDDC 0010DCDC 1000BD27 */   addiu     $sp, $sp, 0x10
