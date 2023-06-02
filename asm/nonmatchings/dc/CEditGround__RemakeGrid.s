.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RemakeGrid__11CEditGroundFv
/* A5AB0 001A59B0 282E0070 */  paddub     $5, $0, $0
/* A5AB4 001A59B4 09000010 */  b          .L001A59DC
/* A5AB8 001A59B8 00000000 */   nop
.L001A59BC:
/* A5ABC 001A59BC 80180500 */  sll        $3, $5, 2
/* A5AC0 001A59C0 21186400 */  addu       $3, $3, $4
/* A5AC4 001A59C4 0400668C */  lw         $6, 0x4($3)
/* A5AC8 001A59C8 0300C010 */  beqz       $6, .L001A59D8
/* A5ACC 001A59CC 00000000 */   nop
/* A5AD0 001A59D0 01000324 */  addiu      $3, $0, 0x1
/* A5AD4 001A59D4 5020C3AC */  sw         $3, 0x2050($6)
.L001A59D8:
/* A5AD8 001A59D8 0100A524 */  addiu      $5, $5, 0x1
.L001A59DC:
/* A5ADC 001A59DC 0400A328 */  slti       $3, $5, 0x4
/* A5AE0 001A59E0 F6FF6014 */  bnez       $3, .L001A59BC
/* A5AE4 001A59E4 00000000 */   nop
/* A5AE8 001A59E8 0800E003 */  jr         $31
/* A5AEC 001A59EC 00000000 */   nop
