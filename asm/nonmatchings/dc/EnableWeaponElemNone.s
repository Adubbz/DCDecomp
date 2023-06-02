.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnableWeaponElemNone__Fi
/* FC0D0 001FBFD0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* FC0D4 001FBFD4 1000BF7F */  sq         $31, 0x10($sp)
/* FC0D8 001FBFD8 0000B07F */  sq         $16, 0x0($sp)
/* FC0DC 001FBFDC 28868070 */  paddub     $16, $4, $0
/* FC0E0 001FBFE0 A4C7080C */  jal        WhoIsWeaponEquip__Fi
/* FC0E4 001FBFE4 00000000 */   nop
/* FC0E8 001FBFE8 03000324 */  addiu      $3, $0, 0x3
/* FC0EC 001FBFEC 04004314 */  bne        $2, $3, .L001FC000
/* FC0F0 001FBFF0 00000000 */   nop
/* FC0F4 001FBFF4 01000224 */  addiu      $2, $0, 0x1
/* FC0F8 001FBFF8 0F000010 */  b          .L001FC038
/* FC0FC 001FBFFC 00000000 */   nop
.L001FC000:
/* FC100 001FC000 90FE0226 */  addiu      $2, $16, -0x170
/* FC104 001FC004 0200412C */  sltiu      $at, $2, 0x2
/* FC108 001FC008 07002014 */  bnez       $at, .L001FC028
/* FC10C 001FC00C 00000000 */   nop
/* FC110 001FC010 73010224 */  addiu      $2, $0, 0x173
/* FC114 001FC014 04000212 */  beq        $16, $2, .L001FC028
/* FC118 001FC018 00000000 */   nop
/* FC11C 001FC01C 75010224 */  addiu      $2, $0, 0x175
/* FC120 001FC020 04000216 */  bne        $16, $2, .L001FC034
/* FC124 001FC024 00000000 */   nop
.L001FC028:
/* FC128 001FC028 02000224 */  addiu      $2, $0, 0x2
/* FC12C 001FC02C 02000010 */  b          .L001FC038
/* FC130 001FC030 00000000 */   nop
.L001FC034:
/* FC134 001FC034 28160070 */  paddub     $2, $0, $0
.L001FC038:
/* FC138 001FC038 1000BF7B */  lq         $31, 0x10($sp)
/* FC13C 001FC03C 0000B07B */  lq         $16, 0x0($sp)
/* FC140 001FC040 2000BD27 */  addiu      $sp, $sp, 0x20
/* FC144 001FC044 0800E003 */  jr         $31
/* FC148 001FC048 00000000 */   nop
/* FC14C 001FC04C 00000000 */  nop
