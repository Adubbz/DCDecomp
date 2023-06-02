.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_obj_world_pos__FP10OBJ_HANDLEPf
/* 8AAE0 0018A9E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8AAE4 0018A9E4 0000BF7F */  sq         $31, 0x0($sp)
/* 8AAE8 0018A9E8 0000838C */  lw         $3, 0x0($4)
/* 8AAEC 0018A9EC 06006010 */  beqz       $3, .L0018AA08
/* 8AAF0 0018A9F0 00000000 */   nop
/* 8AAF4 0018A9F4 28266070 */  paddub     $4, $3, $0
/* 8AAF8 0018A9F8 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* 8AAFC 0018A9FC 00000000 */   nop
/* 8AB00 0018AA00 22000010 */  b          .L0018AA8C
/* 8AB04 0018AA04 00000000 */   nop
.L0018AA08:
/* 8AB08 0018AA08 0400838C */  lw         $3, 0x4($4)
/* 8AB0C 0018AA0C 08006010 */  beqz       $3, .L0018AA30
/* 8AB10 0018AA10 00000000 */   nop
/* 8AB14 0018AA14 28266070 */  paddub     $4, $3, $0
/* 8AB18 0018AA18 A000798C */  lw         $25, 0xA0($3)
/* 8AB1C 0018AA1C A000398F */  lw         $25, 0xA0($25)
/* 8AB20 0018AA20 09F82003 */  jalr       $25
/* 8AB24 0018AA24 00000000 */   nop
/* 8AB28 0018AA28 18000010 */  b          .L0018AA8C
/* 8AB2C 0018AA2C 00000000 */   nop
.L0018AA30:
/* 8AB30 0018AA30 2700033C */  lui        $3, %hi(_554)
/* 8AB34 0018AA34 D09A6324 */  addiu      $3, $3, %lo(_554)
/* 8AB38 0018AA38 1000A627 */  addiu      $6, $sp, 0x10
/* 8AB3C 0018AA3C 00006378 */  lq         $3, 0x0($3)
/* 8AB40 0018AA40 0000C37C */  sq         $3, 0x0($6)
/* 8AB44 0018AA44 28360070 */  paddub     $6, $0, $0
/* 8AB48 0018AA48 0D000010 */  b          .L0018AA80
/* 8AB4C 0018AA4C 00000000 */   nop
.L0018AA50:
/* 8AB50 0018AA50 80180600 */  sll        $3, $6, 2
/* 8AB54 0018AA54 21186400 */  addu       $3, $3, $4
/* 8AB58 0018AA58 0800638C */  lw         $3, 0x8($3)
/* 8AB5C 0018AA5C 07006010 */  beqz       $3, .L0018AA7C
/* 8AB60 0018AA60 00000000 */   nop
/* 8AB64 0018AA64 28266070 */  paddub     $4, $3, $0
/* 8AB68 0018AA68 1000A627 */  addiu      $6, $sp, 0x10
/* 8AB6C 0018AA6C 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* 8AB70 0018AA70 00000000 */   nop
/* 8AB74 0018AA74 05000010 */  b          .L0018AA8C
/* 8AB78 0018AA78 00000000 */   nop
.L0018AA7C:
/* 8AB7C 0018AA7C 0100C624 */  addiu      $6, $6, 0x1
.L0018AA80:
/* 8AB80 0018AA80 0C00C328 */  slti       $3, $6, 0xC
/* 8AB84 0018AA84 F2FF6014 */  bnez       $3, .L0018AA50
/* 8AB88 0018AA88 00000000 */   nop
.L0018AA8C:
/* 8AB8C 0018AA8C 0000BF7B */  lq         $31, 0x0($sp)
/* 8AB90 0018AA90 2000BD27 */  addiu      $sp, $sp, 0x20
/* 8AB94 0018AA94 0800E003 */  jr         $31
/* 8AB98 0018AA98 00000000 */   nop
/* 8AB9C 0018AA9C 00000000 */  nop
