.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_obj_pos__FP10OBJ_HANDLEPf
/* 8AA30 0018A930 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8AA34 0018A934 0000BF7F */  sq         $31, 0x0($sp)
/* 8AA38 0018A938 0000838C */  lw         $3, 0x0($4)
/* 8AA3C 0018A93C 06006010 */  beqz       $3, .L0018A958
/* 8AA40 0018A940 00000000 */   nop
/* 8AA44 0018A944 28266070 */  paddub     $4, $3, $0
/* 8AA48 0018A948 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* 8AA4C 0018A94C 00000000 */   nop
/* 8AA50 0018A950 1D000010 */  b          .L0018A9C8
/* 8AA54 0018A954 00000000 */   nop
.L0018A958:
/* 8AA58 0018A958 0400838C */  lw         $3, 0x4($4)
/* 8AA5C 0018A95C 08006010 */  beqz       $3, .L0018A980
/* 8AA60 0018A960 00000000 */   nop
/* 8AA64 0018A964 28266070 */  paddub     $4, $3, $0
/* 8AA68 0018A968 A000798C */  lw         $25, 0xA0($3)
/* 8AA6C 0018A96C A000398F */  lw         $25, 0xA0($25)
/* 8AA70 0018A970 09F82003 */  jalr       $25
/* 8AA74 0018A974 00000000 */   nop
/* 8AA78 0018A978 13000010 */  b          .L0018A9C8
/* 8AA7C 0018A97C 00000000 */   nop
.L0018A980:
/* 8AA80 0018A980 28360070 */  paddub     $6, $0, $0
/* 8AA84 0018A984 0D000010 */  b          .L0018A9BC
/* 8AA88 0018A988 00000000 */   nop
.L0018A98C:
/* 8AA8C 0018A98C 80180600 */  sll        $3, $6, 2
/* 8AA90 0018A990 21186400 */  addu       $3, $3, $4
/* 8AA94 0018A994 0800638C */  lw         $3, 0x8($3)
/* 8AA98 0018A998 07006010 */  beqz       $3, .L0018A9B8
/* 8AA9C 0018A99C 00000000 */   nop
/* 8AAA0 0018A9A0 2826A070 */  paddub     $4, $5, $0
/* 8AAA4 0018A9A4 20026524 */  addiu      $5, $3, 0x220
/* 8AAA8 0018A9A8 0C86040C */  jal        sceVu0CopyVector
/* 8AAAC 0018A9AC 00000000 */   nop
/* 8AAB0 0018A9B0 05000010 */  b          .L0018A9C8
/* 8AAB4 0018A9B4 00000000 */   nop
.L0018A9B8:
/* 8AAB8 0018A9B8 0100C624 */  addiu      $6, $6, 0x1
.L0018A9BC:
/* 8AABC 0018A9BC 0C00C328 */  slti       $3, $6, 0xC
/* 8AAC0 0018A9C0 F2FF6014 */  bnez       $3, .L0018A98C
/* 8AAC4 0018A9C4 00000000 */   nop
.L0018A9C8:
/* 8AAC8 0018A9C8 0000BF7B */  lq         $31, 0x0($sp)
/* 8AACC 0018A9CC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8AAD0 0018A9D0 0800E003 */  jr         $31
/* 8AAD4 0018A9D4 00000000 */   nop
/* 8AAD8 0018A9D8 00000000 */  nop
/* 8AADC 0018A9DC 00000000 */  nop
