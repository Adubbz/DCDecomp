.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtlMenuMekeIconInfo__FPii
/* F4260 001F4160 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* F4264 001F4164 2000BF7F */  sq         $31, 0x20($sp)
/* F4268 001F4168 1000B17F */  sq         $17, 0x10($sp)
/* F426C 001F416C 0000B07F */  sq         $16, 0x0($sp)
/* F4270 001F4170 288E8070 */  paddub     $17, $4, $0
/* F4274 001F4174 28D0070C */  jal        GetMenuModeMax__Fv
/* F4278 001F4178 00000000 */   nop
/* F427C 001F417C 282E0070 */  paddub     $5, $0, $0
/* F4280 001F4180 0D000010 */  b          .L001F41B8
/* F4284 001F4184 00000000 */   nop
.L001F4188:
/* F4288 001F4188 D894838F */  lw         $3, -0x6B28($gp)
/* F428C 001F418C 00210300 */  sll        $4, $3, 4
/* F4290 001F4190 2900033C */  lui        $3, %hi(BtlDrawTbl)
/* F4294 001F4194 302B6324 */  addiu      $3, $3, %lo(BtlDrawTbl)
/* F4298 001F4198 21206400 */  addu       $4, $3, $4
/* F429C 001F419C 40180500 */  sll        $3, $5, 1
/* F42A0 001F41A0 21186400 */  addu       $3, $3, $4
/* F42A4 001F41A4 00006484 */  lh         $4, 0x0($3)
/* F42A8 001F41A8 80180500 */  sll        $3, $5, 2
/* F42AC 001F41AC 21182302 */  addu       $3, $17, $3
/* F42B0 001F41B0 000064AC */  sw         $4, 0x0($3)
/* F42B4 001F41B4 0100A524 */  addiu      $5, $5, 0x1
.L001F41B8:
/* F42B8 001F41B8 2A18A200 */  slt        $3, $5, $2
/* F42BC 001F41BC F2FF6014 */  bnez       $3, .L001F4188
/* F42C0 001F41C0 00000000 */   nop
/* F42C4 001F41C4 D894848F */  lw         $4, -0x6B28($gp)
/* F42C8 001F41C8 19008010 */  beqz       $4, .L001F4230
/* F42CC 001F41CC 00000000 */   nop
/* F42D0 001F41D0 B02F080C */  jal        NowGetGameFlagForBtlMenu__Fi
/* F42D4 001F41D4 00000000 */   nop
/* F42D8 001F41D8 02000324 */  addiu      $3, $0, 0x2
/* F42DC 001F41DC 12004310 */  beq        $2, $3, .L001F4228
/* F42E0 001F41E0 00000000 */   nop
/* F42E4 001F41E4 01000324 */  addiu      $3, $0, 0x1
/* F42E8 001F41E8 0C004310 */  beq        $2, $3, .L001F421C
/* F42EC 001F41EC 00000000 */   nop
/* F42F0 001F41F0 0A000324 */  addiu      $3, $0, 0xA
/* F42F4 001F41F4 06004310 */  beq        $2, $3, .L001F4210
/* F42F8 001F41F8 00000000 */   nop
/* F42FC 001F41FC 0B000324 */  addiu      $3, $0, 0xB
/* F4300 001F4200 03004310 */  beq        $2, $3, .L001F4210
/* F4304 001F4204 00000000 */   nop
/* F4308 001F4208 08000010 */  b          .L001F422C
/* F430C 001F420C 00000000 */   nop
.L001F4210:
/* F4310 001F4210 09001024 */  addiu      $16, $0, 0x9
/* F4314 001F4214 05000010 */  b          .L001F422C
/* F4318 001F4218 00000000 */   nop
.L001F421C:
/* F431C 001F421C 08001024 */  addiu      $16, $0, 0x8
/* F4320 001F4220 02000010 */  b          .L001F422C
/* F4324 001F4224 00000000 */   nop
.L001F4228:
/* F4328 001F4228 0C001024 */  addiu      $16, $0, 0xC
.L001F422C:
/* F432C 001F422C 100030AE */  sw         $16, 0x10($17)
.L001F4230:
/* F4330 001F4230 2000BF7B */  lq         $31, 0x20($sp)
/* F4334 001F4234 1000B17B */  lq         $17, 0x10($sp)
/* F4338 001F4238 0000B07B */  lq         $16, 0x0($sp)
/* F433C 001F423C 3000BD27 */  addiu      $sp, $sp, 0x30
/* F4340 001F4240 0800E003 */  jr         $31
/* F4344 001F4244 00000000 */   nop
/* F4348 001F4248 00000000 */  nop
/* F434C 001F424C 00000000 */  nop
