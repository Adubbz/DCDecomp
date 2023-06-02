.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel release_obj_obj__FP10OBJ_HANDLE
/* 8B060 0018AF60 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8B064 0018AF64 2000BF7F */  sq         $31, 0x20($sp)
/* 8B068 0018AF68 1000B17F */  sq         $17, 0x10($sp)
/* 8B06C 0018AF6C 0000B07F */  sq         $16, 0x0($sp)
/* 8B070 0018AF70 288E8070 */  paddub     $17, $4, $0
/* 8B074 0018AF74 28860070 */  paddub     $16, $0, $0
/* 8B078 0018AF78 09000010 */  b          .L0018AFA0
/* 8B07C 0018AF7C 00000000 */   nop
.L0018AF80:
/* 8B080 0018AF80 80181000 */  sll        $3, $16, 2
/* 8B084 0018AF84 21187100 */  addu       $3, $3, $17
/* 8B088 0018AF88 0800648C */  lw         $4, 0x8($3)
/* 8B08C 0018AF8C 03008010 */  beqz       $4, .L0018AF9C
/* 8B090 0018AF90 00000000 */   nop
/* 8B094 0018AF94 68A0040C */  jal        DeleteReference__6CFrameFv
/* 8B098 0018AF98 00000000 */   nop
.L0018AF9C:
/* 8B09C 0018AF9C 01001026 */  addiu      $16, $16, 0x1
.L0018AFA0:
/* 8B0A0 0018AFA0 0C00032A */  slti       $3, $16, 0xC
/* 8B0A4 0018AFA4 F6FF6014 */  bnez       $3, .L0018AF80
/* 8B0A8 0018AFA8 00000000 */   nop
/* 8B0AC 0018AFAC 2000BF7B */  lq         $31, 0x20($sp)
/* 8B0B0 0018AFB0 1000B17B */  lq         $17, 0x10($sp)
/* 8B0B4 0018AFB4 0000B07B */  lq         $16, 0x0($sp)
/* 8B0B8 0018AFB8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 8B0BC 0018AFBC 0800E003 */  jr         $31
/* 8B0C0 0018AFC0 00000000 */   nop
/* 8B0C4 0018AFC4 00000000 */  nop
/* 8B0C8 0018AFC8 00000000 */  nop
/* 8B0CC 0018AFCC 00000000 */  nop
