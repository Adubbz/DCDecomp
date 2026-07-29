.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _GET_OBJHDL_POS__FP12RS_STACKDATAi
/* 0BC200 001BC100 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0BC204 001BC104 2000BF7F */  sq          $31, 0x20($29)
/* 0BC208 001BC108 1000B17F */  sq          $17, 0x10($29)
/* 0BC20C 001BC10C 0000B07F */  sq          $16, 0x0($29)
/* 0BC210 001BC110 2700023C */  lui         $2, %hi(LIT_738__2)
/* 0BC214 001BC114 E0B24224 */  addiu       $2, $2, %lo(LIT_738__2)
/* 0BC218 001BC118 3000A327 */  addiu       $3, $29, 0x30
/* 0BC21C 001BC11C 00004278 */  lq          $2, 0x0($2)
/* 0BC220 001BC120 0000627C */  sq          $2, 0x0($3)
/* 0BC224 001BC124 08009124 */  addiu       $17, $4, 0x8
/* 0BC228 001BC128 4CEE060C */  jal         GetStackInt__FP12RS_STACKDATA__2
/* 0BC22C 001BC12C 00000000 */   nop
/* 0BC230 001BC130 28264070 */  paddub      $4, $2, $0
/* 0BC234 001BC134 80EC060C */  jal         GetObjHDL__Fi
/* 0BC238 001BC138 00000000 */   nop
/* 0BC23C 001BC13C 28864070 */  paddub      $16, $2, $0
/* 0BC240 001BC140 0800428C */  lw          $2, 0x8($2)
/* 0BC244 001BC144 08004014 */  bnez        $2, .L001BC168
/* 0BC248 001BC148 00000000 */   nop
/* 0BC24C 001BC14C 0000048E */  lw          $4, 0x0($16)
/* 0BC250 001BC150 05008010 */  beqz        $4, .L001BC168
/* 0BC254 001BC154 00000000 */   nop
/* 0BC258 001BC158 4000A527 */  addiu       $5, $29, 0x40
/* 0BC25C 001BC15C 3000A627 */  addiu       $6, $29, 0x30
/* 0BC260 001BC160 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 0BC264 001BC164 00000000 */   nop
.L001BC168:
/* 0BC268 001BC168 0800038E */  lw          $3, 0x8($16)
/* 0BC26C 001BC16C 01000224 */  addiu       $2, $0, 0x1
/* 0BC270 001BC170 09006214 */  bne         $3, $2, .L001BC198
/* 0BC274 001BC174 00000000 */   nop
/* 0BC278 001BC178 0400048E */  lw          $4, 0x4($16)
/* 0BC27C 001BC17C 06008010 */  beqz        $4, .L001BC198
/* 0BC280 001BC180 00000000 */   nop
/* 0BC284 001BC184 4000A527 */  addiu       $5, $29, 0x40
/* 0BC288 001BC188 A000998C */  lw          $25, 0xA0($4)
/* 0BC28C 001BC18C A000398F */  lw          $25, 0xA0($25)
/* 0BC290 001BC190 09F82003 */  jalr        $25
/* 0BC294 001BC194 00000000 */   nop
.L001BC198:
/* 0BC298 001BC198 28262072 */  paddub      $4, $17, $0
/* 0BC29C 001BC19C 08009124 */  addiu       $17, $4, 0x8
/* 0BC2A0 001BC1A0 4000ACC7 */  lwc1        $f12, 0x40($29)
/* 0BC2A4 001BC1A4 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC2A8 001BC1A8 00000000 */   nop
/* 0BC2AC 001BC1AC 28262072 */  paddub      $4, $17, $0
/* 0BC2B0 001BC1B0 08009124 */  addiu       $17, $4, 0x8
/* 0BC2B4 001BC1B4 4400ACC7 */  lwc1        $f12, 0x44($29)
/* 0BC2B8 001BC1B8 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC2BC 001BC1BC 00000000 */   nop
/* 0BC2C0 001BC1C0 28262072 */  paddub      $4, $17, $0
/* 0BC2C4 001BC1C4 4800ACC7 */  lwc1        $f12, 0x48($29)
/* 0BC2C8 001BC1C8 78EE060C */  jal         SetStack__FP12RS_STACKDATAf__2
/* 0BC2CC 001BC1CC 00000000 */   nop
/* 0BC2D0 001BC1D0 01000224 */  addiu       $2, $0, 0x1
/* 0BC2D4 001BC1D4 2000BF7B */  lq          $31, 0x20($29)
/* 0BC2D8 001BC1D8 1000B17B */  lq          $17, 0x10($29)
/* 0BC2DC 001BC1DC 0000B07B */  lq          $16, 0x0($29)
/* 0BC2E0 001BC1E0 5000BD27 */  addiu       $29, $29, 0x50
/* 0BC2E4 001BC1E4 0800E003 */  jr          $31
/* 0BC2E8 001BC1E8 00000000 */   nop
/* 0BC2EC 001BC1EC 00000000 */  nop
