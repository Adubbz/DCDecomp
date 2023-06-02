.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_OBJHDL_POS__FP12RS_STACKDATAi
/* BC200 001BC100 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* BC204 001BC104 2000BF7F */  sq         $31, 0x20($sp)
/* BC208 001BC108 1000B17F */  sq         $17, 0x10($sp)
/* BC20C 001BC10C 0000B07F */  sq         $16, 0x0($sp)
/* BC210 001BC110 2700023C */  lui        $2, %hi(_738_2)
/* BC214 001BC114 E0B24224 */  addiu      $2, $2, %lo(_738_2)
/* BC218 001BC118 3000A327 */  addiu      $3, $sp, 0x30
/* BC21C 001BC11C 00004278 */  lq         $2, 0x0($2)
/* BC220 001BC120 0000627C */  sq         $2, 0x0($3)
/* BC224 001BC124 08009124 */  addiu      $17, $4, 0x8
/* BC228 001BC128 4CEE060C */  jal        GetStackInt__FP12RS_STACKDATA_2
/* BC22C 001BC12C 00000000 */   nop
/* BC230 001BC130 28264070 */  paddub     $4, $2, $0
/* BC234 001BC134 80EC060C */  jal        GetObjHDL__Fi
/* BC238 001BC138 00000000 */   nop
/* BC23C 001BC13C 28864070 */  paddub     $16, $2, $0
/* BC240 001BC140 0800428C */  lw         $2, 0x8($2)
/* BC244 001BC144 08004014 */  bnez       $2, .L001BC168
/* BC248 001BC148 00000000 */   nop
/* BC24C 001BC14C 0000048E */  lw         $4, 0x0($16)
/* BC250 001BC150 05008010 */  beqz       $4, .L001BC168
/* BC254 001BC154 00000000 */   nop
/* BC258 001BC158 4000A527 */  addiu      $5, $sp, 0x40
/* BC25C 001BC15C 3000A627 */  addiu      $6, $sp, 0x30
/* BC260 001BC160 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* BC264 001BC164 00000000 */   nop
.L001BC168:
/* BC268 001BC168 0800038E */  lw         $3, 0x8($16)
/* BC26C 001BC16C 01000224 */  addiu      $2, $0, 0x1
/* BC270 001BC170 09006214 */  bne        $3, $2, .L001BC198
/* BC274 001BC174 00000000 */   nop
/* BC278 001BC178 0400048E */  lw         $4, 0x4($16)
/* BC27C 001BC17C 06008010 */  beqz       $4, .L001BC198
/* BC280 001BC180 00000000 */   nop
/* BC284 001BC184 4000A527 */  addiu      $5, $sp, 0x40
/* BC288 001BC188 A000998C */  lw         $25, 0xA0($4)
/* BC28C 001BC18C A000398F */  lw         $25, 0xA0($25)
/* BC290 001BC190 09F82003 */  jalr       $25
/* BC294 001BC194 00000000 */   nop
.L001BC198:
/* BC298 001BC198 28262072 */  paddub     $4, $17, $0
/* BC29C 001BC19C 08009124 */  addiu      $17, $4, 0x8
/* BC2A0 001BC1A0 4000ACC7 */  lwc1       $f12, 0x40($sp)
/* BC2A4 001BC1A4 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC2A8 001BC1A8 00000000 */   nop
/* BC2AC 001BC1AC 28262072 */  paddub     $4, $17, $0
/* BC2B0 001BC1B0 08009124 */  addiu      $17, $4, 0x8
/* BC2B4 001BC1B4 4400ACC7 */  lwc1       $f12, 0x44($sp)
/* BC2B8 001BC1B8 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC2BC 001BC1BC 00000000 */   nop
/* BC2C0 001BC1C0 28262072 */  paddub     $4, $17, $0
/* BC2C4 001BC1C4 4800ACC7 */  lwc1       $f12, 0x48($sp)
/* BC2C8 001BC1C8 78EE060C */  jal        SetStack__FP12RS_STACKDATAf_2
/* BC2CC 001BC1CC 00000000 */   nop
/* BC2D0 001BC1D0 01000224 */  addiu      $2, $0, 0x1
/* BC2D4 001BC1D4 2000BF7B */  lq         $31, 0x20($sp)
/* BC2D8 001BC1D8 1000B17B */  lq         $17, 0x10($sp)
/* BC2DC 001BC1DC 0000B07B */  lq         $16, 0x0($sp)
/* BC2E0 001BC1E0 5000BD27 */  addiu      $sp, $sp, 0x50
/* BC2E4 001BC1E4 0800E003 */  jr         $31
/* BC2E8 001BC1E8 00000000 */   nop
/* BC2EC 001BC1EC 00000000 */  nop
