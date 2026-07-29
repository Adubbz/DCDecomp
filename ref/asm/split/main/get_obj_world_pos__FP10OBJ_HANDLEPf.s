.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel get_obj_world_pos__FP10OBJ_HANDLEPf
/* 08AAE0 0018A9E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 08AAE4 0018A9E4 0000BF7F */  sq          $31, 0x0($29)
/* 08AAE8 0018A9E8 0000838C */  lw          $3, 0x0($4)
/* 08AAEC 0018A9EC 06006010 */  beqz        $3, .L0018AA08
/* 08AAF0 0018A9F0 00000000 */   nop
/* 08AAF4 0018A9F4 28266070 */  paddub      $4, $3, $0
/* 08AAF8 0018A9F8 EC69060C */  jal         GetPosition__9CMapPartsFPf
/* 08AAFC 0018A9FC 00000000 */   nop
/* 08AB00 0018AA00 22000010 */  b           .L0018AA8C
/* 08AB04 0018AA04 00000000 */   nop
.L0018AA08:
/* 08AB08 0018AA08 0400838C */  lw          $3, 0x4($4)
/* 08AB0C 0018AA0C 08006010 */  beqz        $3, .L0018AA30
/* 08AB10 0018AA10 00000000 */   nop
/* 08AB14 0018AA14 28266070 */  paddub      $4, $3, $0
/* 08AB18 0018AA18 A000798C */  lw          $25, 0xA0($3)
/* 08AB1C 0018AA1C A000398F */  lw          $25, 0xA0($25)
/* 08AB20 0018AA20 09F82003 */  jalr        $25
/* 08AB24 0018AA24 00000000 */   nop
/* 08AB28 0018AA28 18000010 */  b           .L0018AA8C
/* 08AB2C 0018AA2C 00000000 */   nop
.L0018AA30:
/* 08AB30 0018AA30 2700033C */  lui         $3, %hi(LIT_554)
/* 08AB34 0018AA34 D09A6324 */  addiu       $3, $3, %lo(LIT_554)
/* 08AB38 0018AA38 1000A627 */  addiu       $6, $29, 0x10
/* 08AB3C 0018AA3C 00006378 */  lq          $3, 0x0($3)
/* 08AB40 0018AA40 0000C37C */  sq          $3, 0x0($6)
/* 08AB44 0018AA44 28360070 */  paddub      $6, $0, $0
/* 08AB48 0018AA48 0D000010 */  b           .L0018AA80
/* 08AB4C 0018AA4C 00000000 */   nop
.L0018AA50:
/* 08AB50 0018AA50 80180600 */  sll         $3, $6, 2
/* 08AB54 0018AA54 21186400 */  addu        $3, $3, $4
/* 08AB58 0018AA58 0800638C */  lw          $3, 0x8($3)
/* 08AB5C 0018AA5C 07006010 */  beqz        $3, .L0018AA7C
/* 08AB60 0018AA60 00000000 */   nop
/* 08AB64 0018AA64 28266070 */  paddub      $4, $3, $0
/* 08AB68 0018AA68 1000A627 */  addiu       $6, $29, 0x10
/* 08AB6C 0018AA6C 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 08AB70 0018AA70 00000000 */   nop
/* 08AB74 0018AA74 05000010 */  b           .L0018AA8C
/* 08AB78 0018AA78 00000000 */   nop
.L0018AA7C:
/* 08AB7C 0018AA7C 0100C624 */  addiu       $6, $6, 0x1
.L0018AA80:
/* 08AB80 0018AA80 0C00C328 */  slti        $3, $6, 0xC
/* 08AB84 0018AA84 F2FF6014 */  bnez        $3, .L0018AA50
/* 08AB88 0018AA88 00000000 */   nop
.L0018AA8C:
/* 08AB8C 0018AA8C 0000BF7B */  lq          $31, 0x0($29)
/* 08AB90 0018AA90 2000BD27 */  addiu       $29, $29, 0x20
/* 08AB94 0018AA94 0800E003 */  jr          $31
/* 08AB98 0018AA98 00000000 */   nop
/* 08AB9C 0018AA9C 00000000 */  nop
