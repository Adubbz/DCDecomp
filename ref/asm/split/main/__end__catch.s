.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __end__catch
/* 022C00 00122B00 F0FFBD27 */  addiu       $29, $29, -0x10
/* 022C04 00122B04 0000BF7F */  sq          $31, 0x0($29)
/* 022C08 00122B08 0000838C */  lw          $3, 0x0($4)
/* 022C0C 00122B0C 07006010 */  beqz        $3, .L00122B2C
/* 022C10 00122B10 00000000 */   nop
/* 022C14 00122B14 0800868C */  lw          $6, 0x8($4)
/* 022C18 00122B18 0400C010 */  beqz        $6, .L00122B2C
/* 022C1C 00122B1C 00000000 */   nop
/* 022C20 00122B20 FFFF0524 */  addiu       $5, $0, -0x1
/* 022C24 00122B24 09F8C000 */  jalr        $6
/* 022C28 00122B28 28266070 */   paddub     $4, $3, $0
.L00122B2C:
/* 022C2C 00122B2C 0000BF7B */  lq          $31, 0x0($29)
/* 022C30 00122B30 0800E003 */  jr          $31
/* 022C34 00122B34 1000BD27 */   addiu      $29, $29, 0x10
/* 022C38 00122B38 00000000 */  nop
/* 022C3C 00122B3C 00000000 */  nop
