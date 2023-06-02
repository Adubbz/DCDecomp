.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawPartsCursor__11CEditGroundFiPfPfiPfi
/* A4030 001A3F30 50FEBD27 */  addiu      $sp, $sp, -0x1B0
/* A4034 001A3F34 9000BF7F */  sq         $31, 0x90($sp)
/* A4038 001A3F38 8000BE7F */  sq         $fp, 0x80($sp)
/* A403C 001A3F3C 7000B77F */  sq         $23, 0x70($sp)
/* A4040 001A3F40 6000B67F */  sq         $22, 0x60($sp)
/* A4044 001A3F44 5000B57F */  sq         $21, 0x50($sp)
/* A4048 001A3F48 4000B47F */  sq         $20, 0x40($sp)
/* A404C 001A3F4C 3000B37F */  sq         $19, 0x30($sp)
/* A4050 001A3F50 2000B27F */  sq         $18, 0x20($sp)
/* A4054 001A3F54 1000B17F */  sq         $17, 0x10($sp)
/* A4058 001A3F58 0000B07F */  sq         $16, 0x0($sp)
/* A405C 001A3F5C 28968070 */  paddub     $18, $4, $0
/* A4060 001A3F60 28B6A070 */  paddub     $22, $5, $0
/* A4064 001A3F64 288EC070 */  paddub     $17, $6, $0
/* A4068 001A3F68 2886E070 */  paddub     $16, $7, $0
/* A406C 001A3F6C 28AE0071 */  paddub     $21, $8, $0
/* A4070 001A3F70 D000A9AF */  sw         $9, 0xD0($sp)
/* A4074 001A3F74 CC00AAAF */  sw         $10, 0xCC($sp)
/* A4078 001A3F78 34938283 */  lb         $2, -0x6CCC($gp)
/* A407C 001A3F7C 05004014 */  bnez       $2, .L001A3F94
/* A4080 001A3F80 00000000 */   nop
/* A4084 001A3F84 FFFF0224 */  addiu      $2, $0, -0x1
/* A4088 001A3F88 309382AF */  sw         $2, -0x6CD0($gp)
/* A408C 001A3F8C 01000224 */  addiu      $2, $0, 0x1
/* A4090 001A3F90 349382A3 */  sb         $2, -0x6CCC($gp)
.L001A3F94:
/* A4094 001A3F94 0400C006 */  bltz       $22, .L001A3FA8
/* A4098 001A3F98 00000000 */   nop
/* A409C 001A3F9C 1800C22A */  slti       $2, $22, 0x18
/* A40A0 001A3FA0 07004014 */  bnez       $2, .L001A3FC0
/* A40A4 001A3FA4 00000000 */   nop
.L001A3FA8:
/* A40A8 001A3FA8 28260072 */  paddub     $4, $16, $0
/* A40AC 001A3FAC 282E2072 */  paddub     $5, $17, $0
/* A40B0 001A3FB0 0C86040C */  jal        sceVu0CopyVector
/* A40B4 001A3FB4 00000000 */   nop
/* A40B8 001A3FB8 86010010 */  b          .L001A45D4
/* A40BC 001A3FBC 00000000 */   nop
.L001A3FC0:
/* A40C0 001A3FC0 28264072 */  paddub     $4, $18, $0
/* A40C4 001A3FC4 00002CC6 */  lwc1       $f12, 0x0($17)
/* A40C8 001A3FC8 04002DC6 */  lwc1       $f13, 0x4($17)
/* A40CC 001A3FCC 08002EC6 */  lwc1       $f14, 0x8($17)
/* A40D0 001A3FD0 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A40D4 001A3FD4 00000000 */   nop
/* A40D8 001A3FD8 07004104 */  bgez       $2, .L001A3FF8
/* A40DC 001A3FDC 00000000 */   nop
/* A40E0 001A3FE0 28260072 */  paddub     $4, $16, $0
/* A40E4 001A3FE4 282E2072 */  paddub     $5, $17, $0
/* A40E8 001A3FE8 0C86040C */  jal        sceVu0CopyVector
/* A40EC 001A3FEC 00000000 */   nop
/* A40F0 001A3FF0 78010010 */  b          .L001A45D4
/* A40F4 001A3FF4 00000000 */   nop
.L001A3FF8:
/* A40F8 001A3FF8 80100200 */  sll        $2, $2, 2
/* A40FC 001A3FFC 21105200 */  addu       $2, $2, $18
/* A4100 001A4000 0400538C */  lw         $19, 0x4($2)
/* A4104 001A4004 C0101600 */  sll        $2, $22, 3
/* A4108 001A4008 23185600 */  subu       $3, $2, $22
/* A410C 001A400C 80100300 */  sll        $2, $3, 2
/* A4110 001A4010 23104300 */  subu       $2, $2, $3
/* A4114 001A4014 40190200 */  sll        $3, $2, 5
/* A4118 001A4018 0100013C */  lui        $at, (0x15F30 >> 16)
/* A411C 001A401C 21084102 */  addu       $at, $18, $at
/* A4120 001A4020 305F228C */  lw         $2, (0x15F30 & 0xFFFF)($at)
/* A4124 001A4024 21A04300 */  addu       $20, $2, $3
/* A4128 001A4028 28268072 */  paddub     $4, $20, $0
/* A412C 001A402C 886A060C */  jal        GetWidth__9CMapPartsFv
/* A4130 001A4030 00000000 */   nop
/* A4134 001A4034 AC00A2AF */  sw         $2, 0xAC($sp)
/* A4138 001A4038 28268072 */  paddub     $4, $20, $0
/* A413C 001A403C A06A060C */  jal        GetHeight__9CMapPartsFv
/* A4140 001A4040 00000000 */   nop
/* A4144 001A4044 28F64070 */  paddub     $fp, $2, $0
/* A4148 001A4048 28266072 */  paddub     $4, $19, $0
/* A414C 001A404C 00002CC6 */  lwc1       $f12, 0x0($17)
/* A4150 001A4050 04002DC6 */  lwc1       $f13, 0x4($17)
/* A4154 001A4054 08002EC6 */  lwc1       $f14, 0x8($17)
/* A4158 001A4058 AC00A58F */  lw         $5, 0xAC($sp)
/* A415C 001A405C 2836C073 */  paddub     $6, $fp, $0
/* A4160 001A4060 50BC050C */  jal        CheckAreaRect__9CEditAreaFfffii
/* A4164 001A4064 00000000 */   nop
/* A4168 001A4068 07004014 */  bnez       $2, .L001A4088
/* A416C 001A406C 00000000 */   nop
/* A4170 001A4070 28260072 */  paddub     $4, $16, $0
/* A4174 001A4074 282E2072 */  paddub     $5, $17, $0
/* A4178 001A4078 0C86040C */  jal        sceVu0CopyVector
/* A417C 001A407C 00000000 */   nop
/* A4180 001A4080 54010010 */  b          .L001A45D4
/* A4184 001A4084 00000000 */   nop
.L001A4088:
/* A4188 001A4088 28266072 */  paddub     $4, $19, $0
/* A418C 001A408C F000A527 */  addiu      $5, $sp, 0xF0
/* A4190 001A4090 00002CC6 */  lwc1       $f12, 0x0($17)
/* A4194 001A4094 04002DC6 */  lwc1       $f13, 0x4($17)
/* A4198 001A4098 08002EC6 */  lwc1       $f14, 0x8($17)
/* A419C 001A409C 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* A41A0 001A40A0 00000000 */   nop
/* A41A4 001A40A4 28266072 */  paddub     $4, $19, $0
/* A41A8 001A40A8 282E8072 */  paddub     $5, $20, $0
/* A41AC 001A40AC 00002CC6 */  lwc1       $f12, 0x0($17)
/* A41B0 001A40B0 04002DC6 */  lwc1       $f13, 0x4($17)
/* A41B4 001A40B4 08002EC6 */  lwc1       $f14, 0x8($17)
/* A41B8 001A40B8 2836A072 */  paddub     $6, $21, $0
/* A41BC 001A40BC 80BC050C */  jal        CheckParts__9CEditAreaFP9CMapPartsfffi
/* A41C0 001A40C0 00000000 */   nop
/* A41C4 001A40C4 28AE4070 */  paddub     $21, $2, $0
/* A41C8 001A40C8 28266072 */  paddub     $4, $19, $0
/* A41CC 001A40CC 00002CC6 */  lwc1       $f12, 0x0($17)
/* A41D0 001A40D0 04002DC6 */  lwc1       $f13, 0x4($17)
/* A41D4 001A40D4 08002EC6 */  lwc1       $f14, 0x8($17)
/* A41D8 001A40D8 F8BA050C */  jal        SearchPartsID__9CEditAreaFfff
/* A41DC 001A40DC 00000000 */   nop
/* A41E0 001A40E0 28BE4070 */  paddub     $23, $2, $0
/* A41E4 001A40E4 1801838E */  lw         $3, 0x118($20)
/* A41E8 001A40E8 05000224 */  addiu      $2, $0, 0x5
/* A41EC 001A40EC 18006214 */  bne        $3, $2, .L001A4150
/* A41F0 001A40F0 00000000 */   nop
/* A41F4 001A40F4 28266072 */  paddub     $4, $19, $0
/* A41F8 001A40F8 282E8072 */  paddub     $5, $20, $0
/* A41FC 001A40FC 00002CC6 */  lwc1       $f12, 0x0($17)
/* A4200 001A4100 04002DC6 */  lwc1       $f13, 0x4($17)
/* A4204 001A4104 08002EC6 */  lwc1       $f14, 0x8($17)
/* A4208 001A4108 C896060C */  jal        CheckDelete__FP9CEditAreaP9CMapPartsfff
/* A420C 001A410C 00000000 */   nop
/* A4210 001A4110 02004010 */  beqz       $2, .L001A411C
/* A4214 001A4114 00000000 */   nop
/* A4218 001A4118 28AE0070 */  paddub     $21, $0, $0
.L001A411C:
/* A421C 001A411C 0C00E006 */  bltz       $23, .L001A4150
/* A4220 001A4120 00000000 */   nop
/* A4224 001A4124 C0101700 */  sll        $2, $23, 3
/* A4228 001A4128 23185700 */  subu       $3, $2, $23
/* A422C 001A412C 80100300 */  sll        $2, $3, 2
/* A4230 001A4130 23104300 */  subu       $2, $2, $3
/* A4234 001A4134 40110200 */  sll        $2, $2, 5
/* A4238 001A4138 21105200 */  addu       $2, $2, $18
/* A423C 001A413C 1801438C */  lw         $3, 0x118($2)
/* A4240 001A4140 01000224 */  addiu      $2, $0, 0x1
/* A4244 001A4144 02006210 */  beq        $3, $2, .L001A4150
/* A4248 001A4148 00000000 */   nop
/* A424C 001A414C 28AE0070 */  paddub     $21, $0, $0
.L001A4150:
/* A4250 001A4150 0100013C */  lui        $at, (0x15030 >> 16)
/* A4254 001A4154 21084102 */  addu       $at, $18, $at
/* A4258 001A4158 3050248C */  lw         $4, (0x15030 & 0xFFFF)($at)
/* A425C 001A415C 0A008010 */  beqz       $4, .L001A4188
/* A4260 001A4160 00000000 */   nop
/* A4264 001A4164 282EC072 */  paddub     $5, $22, $0
/* A4268 001A4168 F467060C */  jal        GetPartsInfo__14CEditPartsInfoFi
/* A426C 001A416C 00000000 */   nop
/* A4270 001A4170 05004010 */  beqz       $2, .L001A4188
/* A4274 001A4174 00000000 */   nop
/* A4278 001A4178 0C00438C */  lw         $3, 0xC($2)
/* A427C 001A417C 1800428C */  lw         $2, 0x18($2)
/* A4280 001A4180 2A106200 */  slt        $2, $3, $2
/* A4284 001A4184 24A8A202 */  and        $21, $21, $2
.L001A4188:
/* A4288 001A4188 28266072 */  paddub     $4, $19, $0
/* A428C 001A418C E000A527 */  addiu      $5, $sp, 0xE0
/* A4290 001A4190 F000A68F */  lw         $6, 0xF0($sp)
/* A4294 001A4194 F400A78F */  lw         $7, 0xF4($sp)
/* A4298 001A4198 F800A88F */  lw         $8, 0xF8($sp)
/* A429C 001A419C 48B6050C */  jal        GetPos__9CEditAreaFP11CVector3_f_iii
/* A42A0 001A41A0 00000000 */   nop
/* A42A4 001A41A4 E000A0C7 */  lwc1       $f0, 0xE0($sp)
/* A42A8 001A41A8 000020E6 */  swc1       $f0, 0x0($17)
/* A42AC 001A41AC A040023C */  lui        $2, (0x40A00000 >> 16)
/* A42B0 001A41B0 00088244 */  mtc1       $2, $f1
/* A42B4 001A41B4 E400A0C7 */  lwc1       $f0, 0xE4($sp)
/* A42B8 001A41B8 00080046 */  add.s      $f0, $f1, $f0
/* A42BC 001A41BC 040020E6 */  swc1       $f0, 0x4($17)
/* A42C0 001A41C0 E800A0C7 */  lwc1       $f0, 0xE8($sp)
/* A42C4 001A41C4 080020E6 */  swc1       $f0, 0x8($17)
/* A42C8 001A41C8 0C0020AE */  sw         $0, 0xC($17)
/* A42CC 001A41CC 0400A012 */  beqz       $21, .L001A41E0
/* A42D0 001A41D0 00000000 */   nop
/* A42D4 001A41D4 FC00968E */  lw         $22, 0xFC($20)
/* A42D8 001A41D8 03000010 */  b          .L001A41E8
/* A42DC 001A41DC 00000000 */   nop
.L001A41E0:
/* A42E0 001A41E0 0001968E */  lw         $22, 0x100($20)
/* A42E4 001A41E4 00000000 */  nop
.L001A41E8:
/* A42E8 001A41E8 AC00A28F */  lw         $2, 0xAC($sp)
/* A42EC 001A41EC 01004330 */  andi       $3, $2, 0x1
/* A42F0 001A41F0 04004104 */  bgez       $2, .L001A4204
/* A42F4 001A41F4 00000000 */   nop
/* A42F8 001A41F8 02006010 */  beqz       $3, .L001A4204
/* A42FC 001A41FC 00000000 */   nop
/* A4300 001A4200 FEFF6324 */  addiu      $3, $3, -0x2
.L001A4204:
/* A4304 001A4204 01000224 */  addiu      $2, $0, 0x1
/* A4308 001A4208 0B006214 */  bne        $3, $2, .L001A4238
/* A430C 001A420C 00000000 */   nop
/* A4310 001A4210 28266072 */  paddub     $4, $19, $0
/* A4314 001A4214 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A4318 001A4218 00000000 */   nop
/* A431C 001A421C 003F023C */  lui        $2, (0x3F000000 >> 16)
/* A4320 001A4220 00088244 */  mtc1       $2, $f1
/* A4324 001A4224 00000000 */  nop
/* A4328 001A4228 42080046 */  mul.s      $f1, $f1, $f0
/* A432C 001A422C 000020C6 */  lwc1       $f0, 0x0($17)
/* A4330 001A4230 00000146 */  add.s      $f0, $f0, $f1
/* A4334 001A4234 000020E6 */  swc1       $f0, 0x0($17)
.L001A4238:
/* A4338 001A4238 0100C333 */  andi       $3, $fp, 0x1
/* A433C 001A423C 0400C107 */  bgez       $fp, .L001A4250
/* A4340 001A4240 00000000 */   nop
/* A4344 001A4244 02006010 */  beqz       $3, .L001A4250
/* A4348 001A4248 00000000 */   nop
/* A434C 001A424C FEFF6324 */  addiu      $3, $3, -0x2
.L001A4250:
/* A4350 001A4250 01000224 */  addiu      $2, $0, 0x1
/* A4354 001A4254 0B006214 */  bne        $3, $2, .L001A4284
/* A4358 001A4258 00000000 */   nop
/* A435C 001A425C 28266072 */  paddub     $4, $19, $0
/* A4360 001A4260 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A4364 001A4264 00000000 */   nop
/* A4368 001A4268 003F023C */  lui        $2, (0x3F000000 >> 16)
/* A436C 001A426C 00088244 */  mtc1       $2, $f1
/* A4370 001A4270 00000000 */  nop
/* A4374 001A4274 42080046 */  mul.s      $f1, $f1, $f0
/* A4378 001A4278 080020C6 */  lwc1       $f0, 0x8($17)
/* A437C 001A427C 00000146 */  add.s      $f0, $f0, $f1
/* A4380 001A4280 080020E6 */  swc1       $f0, 0x8($17)
.L001A4284:
/* A4384 001A4284 1500A016 */  bnez       $21, .L001A42DC
/* A4388 001A4288 00000000 */   nop
/* A438C 001A428C 8001A427 */  addiu      $4, $sp, 0x180
/* A4390 001A4290 4CB7040C */  jal        MGGetAmbient__FPf
/* A4394 001A4294 00000000 */   nop
/* A4398 001A4298 0001A427 */  addiu      $4, $sp, 0x100
/* A439C 001A429C 4001A527 */  addiu      $5, $sp, 0x140
/* A43A0 001A42A0 2CB7040C */  jal        MGGetPLight__FPA4_fPA4_f
/* A43A4 001A42A4 00000000 */   nop
/* A43A8 001A42A8 2700023C */  lui        $2, %hi(_1159)
/* A43AC 001A42AC 80AE4224 */  addiu      $2, $2, %lo(_1159)
/* A43B0 001A42B0 9001A427 */  addiu      $4, $sp, 0x190
/* A43B4 001A42B4 00004278 */  lq         $2, 0x0($2)
/* A43B8 001A42B8 0000827C */  sq         $2, 0x0($4)
/* A43BC 001A42BC 40B7040C */  jal        MGSetAmbient__FPf
/* A43C0 001A42C0 00000000 */   nop
/* A43C4 001A42C4 C801023C */  lui        $2, %hi(mgZeroMatrix)
/* A43C8 001A42C8 40A74424 */  addiu      $4, $2, %lo(mgZeroMatrix)
/* A43CC 001A42CC C801023C */  lui        $2, %hi(mgZeroMatrix)
/* A43D0 001A42D0 40A74524 */  addiu      $5, $2, %lo(mgZeroMatrix)
/* A43D4 001A42D4 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* A43D8 001A42D8 00000000 */   nop
.L001A42DC:
/* A43DC 001A42DC 28266072 */  paddub     $4, $19, $0
/* A43E0 001A42E0 80C0050C */  jal        GetUnitSize__9CEditAreaFv
/* A43E4 001A42E4 00000000 */   nop
/* A43E8 001A42E8 0200013C */  lui        $at, (0x20748 >> 16)
/* A43EC 001A42EC 21084102 */  addu       $at, $18, $at
/* A43F0 001A42F0 480720E4 */  swc1       $f0, (0x20748 & 0xFFFF)($at)
/* A43F4 001A42F4 0200013C */  lui        $at, (0x20744 >> 16)
/* A43F8 001A42F8 21084102 */  addu       $at, $18, $at
/* A43FC 001A42FC 4407238C */  lw         $3, (0x20744 & 0xFFFF)($at)
/* A4400 001A4300 CC00A28F */  lw         $2, 0xCC($sp)
/* A4404 001A4304 09006214 */  bne        $3, $2, .L001A432C
/* A4408 001A4308 00000000 */   nop
/* A440C 001A430C 0200013C */  lui        $at, (0x20744 >> 16)
/* A4410 001A4310 44072134 */  ori        $at, $at, (0x20744 & 0xFFFF)
/* A4414 001A4314 21204102 */  addu       $4, $18, $at
/* A4418 001A4318 282E2072 */  paddub     $5, $17, $0
/* A441C 001A431C AC00A68F */  lw         $6, 0xAC($sp)
/* A4420 001A4320 283EC073 */  paddub     $7, $fp, $0
/* A4424 001A4324 2C97060C */  jal        Draw__12CPartsCursorFPfii
/* A4428 001A4328 00000000 */   nop
.L001A432C:
/* A442C 001A432C 0800A016 */  bnez       $21, .L001A4350
/* A4430 001A4330 00000000 */   nop
/* A4434 001A4334 8001A427 */  addiu      $4, $sp, 0x180
/* A4438 001A4338 40B7040C */  jal        MGSetAmbient__FPf
/* A443C 001A433C 00000000 */   nop
/* A4440 001A4340 0001A427 */  addiu      $4, $sp, 0x100
/* A4444 001A4344 4001A527 */  addiu      $5, $sp, 0x140
/* A4448 001A4348 08B7040C */  jal        MGSetPLight__FPA4_fPA4_f
/* A444C 001A434C 00000000 */   nop
.L001A4350:
/* A4450 001A4350 040021C6 */  lwc1       $f1, 0x4($17)
/* A4454 001A4354 4842023C */  lui        $2, (0x42480000 >> 16)
/* A4458 001A4358 00008244 */  mtc1       $2, $f0
/* A445C 001A435C 00000000 */  nop
/* A4460 001A4360 00080046 */  add.s      $f0, $f1, $f0
/* A4464 001A4364 040020E6 */  swc1       $f0, 0x4($17)
/* A4468 001A4368 A001A427 */  addiu      $4, $sp, 0x1A0
/* A446C 001A436C 282E2072 */  paddub     $5, $17, $0
/* A4470 001A4370 0C86040C */  jal        sceVu0CopyVector
/* A4474 001A4374 00000000 */   nop
/* A4478 001A4378 A001A3C7 */  lwc1       $f3, 0x1A0($sp)
/* A447C 001A437C 000000C6 */  lwc1       $f0, 0x0($16)
/* A4480 001A4380 81180046 */  sub.s      $f2, $f3, $f0
/* A4484 001A4384 00008044 */  mtc1       $0, $f0
/* A4488 001A4388 00000000 */  nop
/* A448C 001A438C 34100046 */  c.lt.s     $f2, $f0
/* A4490 001A4390 00000000 */  nop
/* A4494 001A4394 04000045 */  bc1f       .L001A43A8
/* A4498 001A4398 00000000 */   nop
/* A449C 001A439C 47100046 */  neg.s      $f1, $f2
/* A44A0 001A43A0 02000010 */  b          .L001A43AC
/* A44A4 001A43A4 00000000 */   nop
.L001A43A8:
/* A44A8 001A43A8 46100046 */  mov.s      $f1, $f2
.L001A43AC:
/* A44AC 001A43AC 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A44B0 001A43B0 00008344 */  mtc1       $3, $f0
/* A44B4 001A43B4 00000000 */  nop
/* A44B8 001A43B8 34080046 */  c.lt.s     $f1, $f0
/* A44BC 001A43BC 00000000 */  nop
/* A44C0 001A43C0 04000045 */  bc1f       .L001A43D4
/* A44C4 001A43C4 00000000 */   nop
/* A44C8 001A43C8 000003E6 */  swc1       $f3, 0x0($16)
/* A44CC 001A43CC 08000010 */  b          .L001A43F0
/* A44D0 001A43D0 00000000 */   nop
.L001A43D4:
/* A44D4 001A43D4 000001C6 */  lwc1       $f1, 0x0($16)
/* A44D8 001A43D8 0041033C */  lui        $3, (0x41000000 >> 16)
/* A44DC 001A43DC 00008344 */  mtc1       $3, $f0
/* A44E0 001A43E0 00000000 */  nop
/* A44E4 001A43E4 03100046 */  div.s      $f0, $f2, $f0
/* A44E8 001A43E8 00080046 */  add.s      $f0, $f1, $f0
/* A44EC 001A43EC 000000E6 */  swc1       $f0, 0x0($16)
.L001A43F0:
/* A44F0 001A43F0 A401A3C7 */  lwc1       $f3, 0x1A4($sp)
/* A44F4 001A43F4 040000C6 */  lwc1       $f0, 0x4($16)
/* A44F8 001A43F8 81180046 */  sub.s      $f2, $f3, $f0
/* A44FC 001A43FC 00008044 */  mtc1       $0, $f0
/* A4500 001A4400 00000000 */  nop
/* A4504 001A4404 34100046 */  c.lt.s     $f2, $f0
/* A4508 001A4408 00000000 */  nop
/* A450C 001A440C 04000045 */  bc1f       .L001A4420
/* A4510 001A4410 00000000 */   nop
/* A4514 001A4414 47100046 */  neg.s      $f1, $f2
/* A4518 001A4418 02000010 */  b          .L001A4424
/* A451C 001A441C 00000000 */   nop
.L001A4420:
/* A4520 001A4420 46100046 */  mov.s      $f1, $f2
.L001A4424:
/* A4524 001A4424 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A4528 001A4428 00008344 */  mtc1       $3, $f0
/* A452C 001A442C 00000000 */  nop
/* A4530 001A4430 34080046 */  c.lt.s     $f1, $f0
/* A4534 001A4434 00000000 */  nop
/* A4538 001A4438 04000045 */  bc1f       .L001A444C
/* A453C 001A443C 00000000 */   nop
/* A4540 001A4440 040003E6 */  swc1       $f3, 0x4($16)
/* A4544 001A4444 08000010 */  b          .L001A4468
/* A4548 001A4448 00000000 */   nop
.L001A444C:
/* A454C 001A444C 040001C6 */  lwc1       $f1, 0x4($16)
/* A4550 001A4450 0041033C */  lui        $3, (0x41000000 >> 16)
/* A4554 001A4454 00008344 */  mtc1       $3, $f0
/* A4558 001A4458 00000000 */  nop
/* A455C 001A445C 03100046 */  div.s      $f0, $f2, $f0
/* A4560 001A4460 00080046 */  add.s      $f0, $f1, $f0
/* A4564 001A4464 040000E6 */  swc1       $f0, 0x4($16)
.L001A4468:
/* A4568 001A4468 A801A3C7 */  lwc1       $f3, 0x1A8($sp)
/* A456C 001A446C 080000C6 */  lwc1       $f0, 0x8($16)
/* A4570 001A4470 81180046 */  sub.s      $f2, $f3, $f0
/* A4574 001A4474 00008044 */  mtc1       $0, $f0
/* A4578 001A4478 00000000 */  nop
/* A457C 001A447C 34100046 */  c.lt.s     $f2, $f0
/* A4580 001A4480 00000000 */  nop
/* A4584 001A4484 04000045 */  bc1f       .L001A4498
/* A4588 001A4488 00000000 */   nop
/* A458C 001A448C 47100046 */  neg.s      $f1, $f2
/* A4590 001A4490 02000010 */  b          .L001A449C
/* A4594 001A4494 00000000 */   nop
.L001A4498:
/* A4598 001A4498 46100046 */  mov.s      $f1, $f2
.L001A449C:
/* A459C 001A449C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A45A0 001A44A0 00008344 */  mtc1       $3, $f0
/* A45A4 001A44A4 00000000 */  nop
/* A45A8 001A44A8 34080046 */  c.lt.s     $f1, $f0
/* A45AC 001A44AC 00000000 */  nop
/* A45B0 001A44B0 04000045 */  bc1f       .L001A44C4
/* A45B4 001A44B4 00000000 */   nop
/* A45B8 001A44B8 080003E6 */  swc1       $f3, 0x8($16)
/* A45BC 001A44BC 08000010 */  b          .L001A44E0
/* A45C0 001A44C0 00000000 */   nop
.L001A44C4:
/* A45C4 001A44C4 080001C6 */  lwc1       $f1, 0x8($16)
/* A45C8 001A44C8 0041033C */  lui        $3, (0x41000000 >> 16)
/* A45CC 001A44CC 00008344 */  mtc1       $3, $f0
/* A45D0 001A44D0 00000000 */  nop
/* A45D4 001A44D4 03100046 */  div.s      $f0, $f2, $f0
/* A45D8 001A44D8 00080046 */  add.s      $f0, $f1, $f0
/* A45DC 001A44DC 080000E6 */  swc1       $f0, 0x8($16)
.L001A44E0:
/* A45E0 001A44E0 E400848E */  lw         $4, 0xE4($20)
/* A45E4 001A44E4 CC00A38F */  lw         $3, 0xCC($sp)
/* A45E8 001A44E8 3A008314 */  bne        $4, $3, .L001A45D4
/* A45EC 001A44EC 00000000 */   nop
/* A45F0 001A44F0 1801848E */  lw         $4, 0x118($20)
/* A45F4 001A44F4 3700C012 */  beqz       $22, .L001A45D4
/* A45F8 001A44F8 00000000 */   nop
/* A45FC 001A44FC 02000324 */  addiu      $3, $0, 0x2
/* A4600 001A4500 34008310 */  beq        $4, $3, .L001A45D4
/* A4604 001A4504 00000000 */   nop
/* A4608 001A4508 03000324 */  addiu      $3, $0, 0x3
/* A460C 001A450C 31008310 */  beq        $4, $3, .L001A45D4
/* A4610 001A4510 00000000 */   nop
/* A4614 001A4514 288E0070 */  paddub     $17, $0, $0
/* A4618 001A4518 05000224 */  addiu      $2, $0, 0x5
/* A461C 001A451C 1B008214 */  bne        $4, $2, .L001A458C
/* A4620 001A4520 00000000 */   nop
/* A4624 001A4524 2826C072 */  paddub     $4, $22, $0
/* A4628 001A4528 2A00023C */  lui        $2, %hi(_1207)
/* A462C 001A452C 28B44524 */  addiu      $5, $2, %lo(_1207)
/* A4630 001A4530 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* A4634 001A4534 00000000 */   nop
/* A4638 001A4538 288E4070 */  paddub     $17, $2, $0
/* A463C 001A453C 05002012 */  beqz       $17, .L001A4554
/* A4640 001A4540 00000000 */   nop
/* A4644 001A4544 B0002286 */  lh         $2, 0xB0($17)
/* A4648 001A4548 B000A2AF */  sw         $2, 0xB0($sp)
/* A464C 001A454C 02000224 */  addiu      $2, $0, 0x2
/* A4650 001A4550 B00022A6 */  sh         $2, 0xB0($17)
.L001A4554:
/* A4654 001A4554 0D00E006 */  bltz       $23, .L001A458C
/* A4658 001A4558 00000000 */   nop
/* A465C 001A455C C0101700 */  sll        $2, $23, 3
/* A4660 001A4560 23185700 */  subu       $3, $2, $23
/* A4664 001A4564 80100300 */  sll        $2, $3, 2
/* A4668 001A4568 23104300 */  subu       $2, $2, $3
/* A466C 001A456C 40110200 */  sll        $2, $2, 5
/* A4670 001A4570 21104202 */  addu       $2, $18, $2
/* A4674 001A4574 30004424 */  addiu      $4, $2, 0x30
/* A4678 001A4578 D000A58F */  lw         $5, 0xD0($sp)
/* A467C 001A457C D000598C */  lw         $25, 0xD0($2)
/* A4680 001A4580 5800398F */  lw         $25, 0x58($25)
/* A4684 001A4584 09F82003 */  jalr       $25
/* A4688 001A4588 00000000 */   nop
.L001A458C:
/* A468C 001A458C 2826C072 */  paddub     $4, $22, $0
/* A4690 001A4590 282E0072 */  paddub     $5, $16, $0
/* A4694 001A4594 B89F040C */  jal        SetPosition__6CFrameFPf
/* A4698 001A4598 00000000 */   nop
/* A469C 001A459C 2826C072 */  paddub     $4, $22, $0
/* A46A0 001A45A0 D000A28F */  lw         $2, 0xD0($sp)
/* A46A4 001A45A4 00004CC4 */  lwc1       $f12, 0x0($2)
/* A46A8 001A45A8 04004DC4 */  lwc1       $f13, 0x4($2)
/* A46AC 001A45AC 08004EC4 */  lwc1       $f14, 0x8($2)
/* A46B0 001A45B0 70A3040C */  jal        SetRotation__6CFrameFfff
/* A46B4 001A45B4 00000000 */   nop
/* A46B8 001A45B8 2826C072 */  paddub     $4, $22, $0
/* A46BC 001A45BC 60BB040C */  jal        MGDraw__FP6CFrame
/* A46C0 001A45C0 00000000 */   nop
/* A46C4 001A45C4 03002012 */  beqz       $17, .L001A45D4
/* A46C8 001A45C8 00000000 */   nop
/* A46CC 001A45CC B000A38F */  lw         $3, 0xB0($sp)
/* A46D0 001A45D0 B00023A6 */  sh         $3, 0xB0($17)
.L001A45D4:
/* A46D4 001A45D4 9000BF7B */  lq         $31, 0x90($sp)
/* A46D8 001A45D8 8000BE7B */  lq         $fp, 0x80($sp)
/* A46DC 001A45DC 7000B77B */  lq         $23, 0x70($sp)
/* A46E0 001A45E0 6000B67B */  lq         $22, 0x60($sp)
/* A46E4 001A45E4 5000B57B */  lq         $21, 0x50($sp)
/* A46E8 001A45E8 4000B47B */  lq         $20, 0x40($sp)
/* A46EC 001A45EC 3000B37B */  lq         $19, 0x30($sp)
/* A46F0 001A45F0 2000B27B */  lq         $18, 0x20($sp)
/* A46F4 001A45F4 1000B17B */  lq         $17, 0x10($sp)
/* A46F8 001A45F8 0000B07B */  lq         $16, 0x0($sp)
/* A46FC 001A45FC B001BD27 */  addiu      $sp, $sp, 0x1B0
/* A4700 001A4600 0800E003 */  jr         $31
/* A4704 001A4604 00000000 */   nop
/* A4708 001A4608 00000000 */  nop
/* A470C 001A460C 00000000 */  nop
