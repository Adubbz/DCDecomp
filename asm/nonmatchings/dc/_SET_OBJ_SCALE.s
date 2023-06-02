.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_OBJ_SCALE__FP12RS_STACKDATAi
/* 912A0 001911A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 912A4 001911A4 1000BF7F */  sq         $31, 0x10($sp)
/* 912A8 001911A8 0000B07F */  sq         $16, 0x0($sp)
/* 912AC 001911AC 08009024 */  addiu      $16, $4, 0x8
/* 912B0 001911B0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 912B4 001911B4 00000000 */   nop
/* 912B8 001911B8 28264070 */  paddub     $4, $2, $0
/* 912BC 001911BC 0C29060C */  jal        GetObjHandle__Fi
/* 912C0 001911C0 00000000 */   nop
/* 912C4 001911C4 281E4070 */  paddub     $3, $2, $0
/* 912C8 001911C8 04006014 */  bnez       $3, .L001911DC
/* 912CC 001911CC 00000000 */   nop
/* 912D0 001911D0 28160070 */  paddub     $2, $0, $0
/* 912D4 001911D4 15000010 */  b          .L0019122C
/* 912D8 001911D8 00000000 */   nop
.L001911DC:
/* 912DC 001911DC 28260072 */  paddub     $4, $16, $0
/* 912E0 001911E0 08009024 */  addiu      $16, $4, 0x8
/* 912E4 001911E4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 912E8 001911E8 00000000 */   nop
/* 912EC 001911EC 2000A0E7 */  swc1       $f0, 0x20($sp)
/* 912F0 001911F0 28260072 */  paddub     $4, $16, $0
/* 912F4 001911F4 08009024 */  addiu      $16, $4, 0x8
/* 912F8 001911F8 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 912FC 001911FC 00000000 */   nop
/* 91300 00191200 2400A0E7 */  swc1       $f0, 0x24($sp)
/* 91304 00191204 28260072 */  paddub     $4, $16, $0
/* 91308 00191208 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 9130C 0019120C 00000000 */   nop
/* 91310 00191210 2800A0E7 */  swc1       $f0, 0x28($sp)
/* 91314 00191214 2C00A0AF */  sw         $0, 0x2C($sp)
/* 91318 00191218 28266070 */  paddub     $4, $3, $0
/* 9131C 0019121C 2000A527 */  addiu      $5, $sp, 0x20
/* 91320 00191220 142B060C */  jal        set_obj_scale__FP10OBJ_HANDLEPf
/* 91324 00191224 00000000 */   nop
/* 91328 00191228 01000224 */  addiu      $2, $0, 0x1
.L0019122C:
/* 9132C 0019122C 1000BF7B */  lq         $31, 0x10($sp)
/* 91330 00191230 0000B07B */  lq         $16, 0x0($sp)
/* 91334 00191234 3000BD27 */  addiu      $sp, $sp, 0x30
/* 91338 00191238 0800E003 */  jr         $31
/* 9133C 0019123C 00000000 */   nop
