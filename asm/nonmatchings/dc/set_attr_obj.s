.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set_attr_obj__FP10OBJ_HANDLER10CFrameAttrii
/* 8B0D0 0018AFD0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 8B0D4 0018AFD4 5000BF7F */  sq         $31, 0x50($sp)
/* 8B0D8 0018AFD8 4000B47F */  sq         $20, 0x40($sp)
/* 8B0DC 0018AFDC 3000B37F */  sq         $19, 0x30($sp)
/* 8B0E0 0018AFE0 2000B27F */  sq         $18, 0x20($sp)
/* 8B0E4 0018AFE4 1000B17F */  sq         $17, 0x10($sp)
/* 8B0E8 0018AFE8 0000B07F */  sq         $16, 0x0($sp)
/* 8B0EC 0018AFEC 289E8070 */  paddub     $19, $4, $0
/* 8B0F0 0018AFF0 2896A070 */  paddub     $18, $5, $0
/* 8B0F4 0018AFF4 288EC070 */  paddub     $17, $6, $0
/* 8B0F8 0018AFF8 2886E070 */  paddub     $16, $7, $0
/* 8B0FC 0018AFFC 0400838C */  lw         $3, 0x4($4)
/* 8B100 0018B000 08006010 */  beqz       $3, .L0018B024
/* 8B104 0018B004 00000000 */   nop
/* 8B108 0018B008 BC00648C */  lw         $4, 0xBC($3)
/* 8B10C 0018B00C 16008010 */  beqz       $4, .L0018B068
/* 8B110 0018B010 00000000 */   nop
/* 8B114 0018B014 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* 8B118 0018B018 00000000 */   nop
/* 8B11C 0018B01C 12000010 */  b          .L0018B068
/* 8B120 0018B020 00000000 */   nop
.L0018B024:
/* 8B124 0018B024 28A60070 */  paddub     $20, $0, $0
/* 8B128 0018B028 0C000010 */  b          .L0018B05C
/* 8B12C 0018B02C 00000000 */   nop
.L0018B030:
/* 8B130 0018B030 80181400 */  sll        $3, $20, 2
/* 8B134 0018B034 21187300 */  addu       $3, $3, $19
/* 8B138 0018B038 0800648C */  lw         $4, 0x8($3)
/* 8B13C 0018B03C 06008010 */  beqz       $4, .L0018B058
/* 8B140 0018B040 00000000 */   nop
/* 8B144 0018B044 282E4072 */  paddub     $5, $18, $0
/* 8B148 0018B048 28362072 */  paddub     $6, $17, $0
/* 8B14C 0018B04C 283E0072 */  paddub     $7, $16, $0
/* 8B150 0018B050 D4A2040C */  jal        SetAttr__6CFrameFR10CFrameAttrii
/* 8B154 0018B054 00000000 */   nop
.L0018B058:
/* 8B158 0018B058 01009426 */  addiu      $20, $20, 0x1
.L0018B05C:
/* 8B15C 0018B05C 0C00832A */  slti       $3, $20, 0xC
/* 8B160 0018B060 F3FF6014 */  bnez       $3, .L0018B030
/* 8B164 0018B064 00000000 */   nop
.L0018B068:
/* 8B168 0018B068 5000BF7B */  lq         $31, 0x50($sp)
/* 8B16C 0018B06C 4000B47B */  lq         $20, 0x40($sp)
/* 8B170 0018B070 3000B37B */  lq         $19, 0x30($sp)
/* 8B174 0018B074 2000B27B */  lq         $18, 0x20($sp)
/* 8B178 0018B078 1000B17B */  lq         $17, 0x10($sp)
/* 8B17C 0018B07C 0000B07B */  lq         $16, 0x0($sp)
/* 8B180 0018B080 6000BD27 */  addiu      $sp, $sp, 0x60
/* 8B184 0018B084 0800E003 */  jr         $31
/* 8B188 0018B088 00000000 */   nop
/* 8B18C 0018B08C 00000000 */  nop
