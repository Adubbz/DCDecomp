.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingLoadEsa__FiP9CFrameVu1i
/* A9050 001A8F50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A9054 001A8F54 3000BF7F */  sq         $31, 0x30($sp)
/* A9058 001A8F58 2000B27F */  sq         $18, 0x20($sp)
/* A905C 001A8F5C 1000B17F */  sq         $17, 0x10($sp)
/* A9060 001A8F60 0000B07F */  sq         $16, 0x0($sp)
/* A9064 001A8F64 28968070 */  paddub     $18, $4, $0
/* A9068 001A8F68 288EA070 */  paddub     $17, $5, $0
/* A906C 001A8F6C 2886C070 */  paddub     $16, $6, $0
/* A9070 001A8F70 5093838F */  lw         $3, -0x6CB0($gp)
/* A9074 001A8F74 0A006004 */  bltz       $3, .L001A8FA0
/* A9078 001A8F78 00000000 */   nop
/* A907C 001A8F7C C0180300 */  sll        $3, $3, 3
/* A9080 001A8F80 2700023C */  lui        $2, %hi(esa_info)
/* A9084 001A8F84 90AE4224 */  addiu      $2, $2, %lo(esa_info)
/* A9088 001A8F88 21104300 */  addu       $2, $2, $3
/* A908C 001A8F8C 0000448C */  lw         $4, 0x0($2)
/* A9090 001A8F90 01000524 */  addiu      $5, $0, 0x1
/* A9094 001A8F94 FFFF0624 */  addiu      $6, $0, -0x1
/* A9098 001A8F98 28CC050C */  jal        EdGetItem__Fiii
/* A909C 001A8F9C 00000000 */   nop
.L001A8FA0:
/* A90A0 001A8FA0 4C9391AF */  sw         $17, -0x6CB4($gp)
/* A90A4 001A8FA4 649390AF */  sw         $16, -0x6C9C($gp)
/* A90A8 001A8FA8 509380AF */  sw         $0, -0x6CB0($gp)
/* A90AC 001A8FAC 282E0070 */  paddub     $5, $0, $0
/* A90B0 001A8FB0 0C000010 */  b          .L001A8FE4
/* A90B4 001A8FB4 00000000 */   nop
.L001A8FB8:
/* A90B8 001A8FB8 C0200500 */  sll        $4, $5, 3
/* A90BC 001A8FBC 2700033C */  lui        $3, %hi(esa_info)
/* A90C0 001A8FC0 90AE6324 */  addiu      $3, $3, %lo(esa_info)
/* A90C4 001A8FC4 21186400 */  addu       $3, $3, $4
/* A90C8 001A8FC8 0000638C */  lw         $3, 0x0($3)
/* A90CC 001A8FCC 04004316 */  bne        $18, $3, .L001A8FE0
/* A90D0 001A8FD0 00000000 */   nop
/* A90D4 001A8FD4 509385AF */  sw         $5, -0x6CB0($gp)
/* A90D8 001A8FD8 05000010 */  b          .L001A8FF0
/* A90DC 001A8FDC 00000000 */   nop
.L001A8FE0:
/* A90E0 001A8FE0 0100A524 */  addiu      $5, $5, 0x1
.L001A8FE4:
/* A90E4 001A8FE4 0D00A328 */  slti       $3, $5, 0xD
/* A90E8 001A8FE8 F3FF6014 */  bnez       $3, .L001A8FB8
/* A90EC 001A8FEC 00000000 */   nop
.L001A8FF0:
/* A90F0 001A8FF0 3000BF7B */  lq         $31, 0x30($sp)
/* A90F4 001A8FF4 2000B27B */  lq         $18, 0x20($sp)
/* A90F8 001A8FF8 1000B17B */  lq         $17, 0x10($sp)
/* A90FC 001A8FFC 0000B07B */  lq         $16, 0x0($sp)
/* A9100 001A9000 4000BD27 */  addiu      $sp, $sp, 0x40
/* A9104 001A9004 0800E003 */  jr         $31
/* A9108 001A9008 00000000 */   nop
/* A910C 001A900C 00000000 */  nop
