.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckTrapCircle__11CDungeonMapFPff
/* C7AF0 001C79F0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* C7AF4 001C79F4 5000BF7F */  sq         $31, 0x50($sp)
/* C7AF8 001C79F8 4000B37F */  sq         $19, 0x40($sp)
/* C7AFC 001C79FC 3000B27F */  sq         $18, 0x30($sp)
/* C7B00 001C7A00 2000B17F */  sq         $17, 0x20($sp)
/* C7B04 001C7A04 1000B07F */  sq         $16, 0x10($sp)
/* C7B08 001C7A08 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C7B0C 001C7A0C 289E8070 */  paddub     $19, $4, $0
/* C7B10 001C7A10 2896A070 */  paddub     $18, $5, $0
/* C7B14 001C7A14 06650046 */  mov.s      $f20, $f12
/* C7B18 001C7A18 28860070 */  paddub     $16, $0, $0
/* C7B1C 001C7A1C 17000010 */  b          .L001C7A7C
/* C7B20 001C7A20 00000000 */   nop
.L001C7A24:
/* C7B24 001C7A24 40111000 */  sll        $2, $16, 5
/* C7B28 001C7A28 21185300 */  addu       $3, $2, $19
/* C7B2C 001C7A2C 0100013C */  lui        $at, (0x10AC0 >> 16)
/* C7B30 001C7A30 21086100 */  addu       $at, $3, $at
/* C7B34 001C7A34 C00A228C */  lw         $2, (0x10AC0 & 0xFFFF)($at)
/* C7B38 001C7A38 0F004010 */  beqz       $2, .L001C7A78
/* C7B3C 001C7A3C 00000000 */   nop
/* C7B40 001C7A40 0100013C */  lui        $at, (0x10AB0 >> 16)
/* C7B44 001C7A44 B00A2134 */  ori        $at, $at, (0x10AB0 & 0xFFFF)
/* C7B48 001C7A48 21886100 */  addu       $17, $3, $at
/* C7B4C 001C7A4C 28262072 */  paddub     $4, $17, $0
/* C7B50 001C7A50 282E4072 */  paddub     $5, $18, $0
/* C7B54 001C7A54 648D040C */  jal        DistVector__FPfPf
/* C7B58 001C7A58 00000000 */   nop
/* C7B5C 001C7A5C 34001446 */  c.lt.s     $f0, $f20
/* C7B60 001C7A60 00000000 */  nop
/* C7B64 001C7A64 04000045 */  bc1f       .L001C7A78
/* C7B68 001C7A68 00000000 */   nop
/* C7B6C 001C7A6C 28162072 */  paddub     $2, $17, $0
/* C7B70 001C7A70 06000010 */  b          .L001C7A8C
/* C7B74 001C7A74 00000000 */   nop
.L001C7A78:
/* C7B78 001C7A78 01001026 */  addiu      $16, $16, 0x1
.L001C7A7C:
/* C7B7C 001C7A7C 0300022A */  slti       $2, $16, 0x3
/* C7B80 001C7A80 E8FF4014 */  bnez       $2, .L001C7A24
/* C7B84 001C7A84 00000000 */   nop
/* C7B88 001C7A88 28160070 */  paddub     $2, $0, $0
.L001C7A8C:
/* C7B8C 001C7A8C 5000BF7B */  lq         $31, 0x50($sp)
/* C7B90 001C7A90 4000B37B */  lq         $19, 0x40($sp)
/* C7B94 001C7A94 3000B27B */  lq         $18, 0x30($sp)
/* C7B98 001C7A98 2000B17B */  lq         $17, 0x20($sp)
/* C7B9C 001C7A9C 1000B07B */  lq         $16, 0x10($sp)
/* C7BA0 001C7AA0 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C7BA4 001C7AA4 6000BD27 */  addiu      $sp, $sp, 0x60
/* C7BA8 001C7AA8 0800E003 */  jr         $31
/* C7BAC 001C7AAC 00000000 */   nop
