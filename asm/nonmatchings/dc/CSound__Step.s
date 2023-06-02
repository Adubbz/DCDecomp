.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__6CSoundFv
/* 46020 00145F20 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 46024 00145F24 2000BF7F */  sq         $31, 0x20($sp)
/* 46028 00145F28 1000B17F */  sq         $17, 0x10($sp)
/* 4602C 00145F2C 0000B07F */  sq         $16, 0x0($sp)
/* 46030 00145F30 28868070 */  paddub     $16, $4, $0
/* 46034 00145F34 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46038 00145F38 9C82238C */  lw         $3, -0x7D64($at)
/* 4603C 00145F3C 3F006010 */  beqz       $3, .L0014603C
/* 46040 00145F40 00000000 */   nop
/* 46044 00145F44 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46048 00145F48 A48221C4 */  lwc1       $f1, -0x7D5C($at)
/* 4604C 00145F4C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46050 00145F50 A88220C4 */  lwc1       $f0, -0x7D58($at)
/* 46054 00145F54 00080046 */  add.s      $f0, $f1, $f0
/* 46058 00145F58 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4605C 00145F5C A48220E4 */  swc1       $f0, -0x7D5C($at)
/* 46060 00145F60 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46064 00145F64 A88221C4 */  lwc1       $f1, -0x7D58($at)
/* 46068 00145F68 00008044 */  mtc1       $0, $f0
/* 4606C 00145F6C 00000000 */  nop
/* 46070 00145F70 36080046 */  c.le.s     $f1, $f0
/* 46074 00145F74 00000000 */  nop
/* 46078 00145F78 10000145 */  bc1t       .L00145FBC
/* 4607C 00145F7C 00000000 */   nop
/* 46080 00145F80 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46084 00145F84 A48221C4 */  lwc1       $f1, -0x7D5C($at)
/* 46088 00145F88 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4608C 00145F8C A082228C */  lw         $2, -0x7D60($at)
/* 46090 00145F90 00008244 */  mtc1       $2, $f0
/* 46094 00145F94 00000000 */  nop
/* 46098 00145F98 20008046 */  cvt.s.w    $f0, $f0
/* 4609C 00145F9C 36080046 */  c.le.s     $f1, $f0
/* 460A0 00145FA0 00000000 */  nop
/* 460A4 00145FA4 05000145 */  bc1t       .L00145FBC
/* 460A8 00145FA8 00000000 */   nop
/* 460AC 00145FAC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 460B0 00145FB0 A48220E4 */  swc1       $f0, -0x7D5C($at)
/* 460B4 00145FB4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 460B8 00145FB8 9C8220AC */  sw         $0, -0x7D64($at)
.L00145FBC:
/* 460BC 00145FBC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 460C0 00145FC0 A88221C4 */  lwc1       $f1, -0x7D58($at)
/* 460C4 00145FC4 00008044 */  mtc1       $0, $f0
/* 460C8 00145FC8 00000000 */  nop
/* 460CC 00145FCC 34080046 */  c.lt.s     $f1, $f0
/* 460D0 00145FD0 00000000 */  nop
/* 460D4 00145FD4 10000045 */  bc1f       .L00146018
/* 460D8 00145FD8 00000000 */   nop
/* 460DC 00145FDC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 460E0 00145FE0 A48221C4 */  lwc1       $f1, -0x7D5C($at)
/* 460E4 00145FE4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 460E8 00145FE8 A082228C */  lw         $2, -0x7D60($at)
/* 460EC 00145FEC 00008244 */  mtc1       $2, $f0
/* 460F0 00145FF0 00000000 */  nop
/* 460F4 00145FF4 20008046 */  cvt.s.w    $f0, $f0
/* 460F8 00145FF8 34080046 */  c.lt.s     $f1, $f0
/* 460FC 00145FFC 00000000 */  nop
/* 46100 00146000 05000045 */  bc1f       .L00146018
/* 46104 00146004 00000000 */   nop
/* 46108 00146008 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4610C 0014600C A48220E4 */  swc1       $f0, -0x7D5C($at)
/* 46110 00146010 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46114 00146014 9C8220AC */  sw         $0, -0x7D64($at)
.L00146018:
/* 46118 00146018 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4611C 0014601C A4822CC4 */  lwc1       $f12, -0x7D5C($at)
/* 46120 00146020 2C44040C */  jal        fptosi
/* 46124 00146024 00000000 */   nop
/* 46128 00146028 28260072 */  paddub     $4, $16, $0
/* 4612C 0014602C 282E0070 */  paddub     $5, $0, $0
/* 46130 00146030 28364070 */  paddub     $6, $2, $0
/* 46134 00146034 581A050C */  jal        SetVol__6CSoundFii
/* 46138 00146038 00000000 */   nop
.L0014603C:
/* 4613C 0014603C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46140 00146040 9C83238C */  lw         $3, -0x7C64($at)
/* 46144 00146044 3F006010 */  beqz       $3, .L00146144
/* 46148 00146048 00000000 */   nop
/* 4614C 0014604C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46150 00146050 A48321C4 */  lwc1       $f1, -0x7C5C($at)
/* 46154 00146054 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46158 00146058 A88320C4 */  lwc1       $f0, -0x7C58($at)
/* 4615C 0014605C 00080046 */  add.s      $f0, $f1, $f0
/* 46160 00146060 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46164 00146064 A48320E4 */  swc1       $f0, -0x7C5C($at)
/* 46168 00146068 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4616C 0014606C A88321C4 */  lwc1       $f1, -0x7C58($at)
/* 46170 00146070 00008044 */  mtc1       $0, $f0
/* 46174 00146074 00000000 */  nop
/* 46178 00146078 36080046 */  c.le.s     $f1, $f0
/* 4617C 0014607C 00000000 */  nop
/* 46180 00146080 10000145 */  bc1t       .L001460C4
/* 46184 00146084 00000000 */   nop
/* 46188 00146088 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4618C 0014608C A48321C4 */  lwc1       $f1, -0x7C5C($at)
/* 46190 00146090 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46194 00146094 A083228C */  lw         $2, -0x7C60($at)
/* 46198 00146098 00008244 */  mtc1       $2, $f0
/* 4619C 0014609C 00000000 */  nop
/* 461A0 001460A0 20008046 */  cvt.s.w    $f0, $f0
/* 461A4 001460A4 36080046 */  c.le.s     $f1, $f0
/* 461A8 001460A8 00000000 */  nop
/* 461AC 001460AC 05000145 */  bc1t       .L001460C4
/* 461B0 001460B0 00000000 */   nop
/* 461B4 001460B4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 461B8 001460B8 A48320E4 */  swc1       $f0, -0x7C5C($at)
/* 461BC 001460BC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 461C0 001460C0 9C8320AC */  sw         $0, -0x7C64($at)
.L001460C4:
/* 461C4 001460C4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 461C8 001460C8 A88321C4 */  lwc1       $f1, -0x7C58($at)
/* 461CC 001460CC 00008044 */  mtc1       $0, $f0
/* 461D0 001460D0 00000000 */  nop
/* 461D4 001460D4 34080046 */  c.lt.s     $f1, $f0
/* 461D8 001460D8 00000000 */  nop
/* 461DC 001460DC 10000045 */  bc1f       .L00146120
/* 461E0 001460E0 00000000 */   nop
/* 461E4 001460E4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 461E8 001460E8 A48321C4 */  lwc1       $f1, -0x7C5C($at)
/* 461EC 001460EC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 461F0 001460F0 A083228C */  lw         $2, -0x7C60($at)
/* 461F4 001460F4 00008244 */  mtc1       $2, $f0
/* 461F8 001460F8 00000000 */  nop
/* 461FC 001460FC 20008046 */  cvt.s.w    $f0, $f0
/* 46200 00146100 34080046 */  c.lt.s     $f1, $f0
/* 46204 00146104 00000000 */  nop
/* 46208 00146108 05000045 */  bc1f       .L00146120
/* 4620C 0014610C 00000000 */   nop
/* 46210 00146110 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46214 00146114 A48320E4 */  swc1       $f0, -0x7C5C($at)
/* 46218 00146118 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4621C 0014611C 9C8320AC */  sw         $0, -0x7C64($at)
.L00146120:
/* 46220 00146120 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46224 00146124 A4832CC4 */  lwc1       $f12, -0x7C5C($at)
/* 46228 00146128 2C44040C */  jal        fptosi
/* 4622C 0014612C 00000000 */   nop
/* 46230 00146130 28260072 */  paddub     $4, $16, $0
/* 46234 00146134 01000524 */  addiu      $5, $0, 0x1
/* 46238 00146138 28364070 */  paddub     $6, $2, $0
/* 4623C 0014613C 581A050C */  jal        SetVol__6CSoundFii
/* 46240 00146140 00000000 */   nop
.L00146144:
/* 46244 00146144 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46248 00146148 9C84238C */  lw         $3, -0x7B64($at)
/* 4624C 0014614C 3F006010 */  beqz       $3, .L0014624C
/* 46250 00146150 00000000 */   nop
/* 46254 00146154 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46258 00146158 A48421C4 */  lwc1       $f1, -0x7B5C($at)
/* 4625C 0014615C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46260 00146160 A88420C4 */  lwc1       $f0, -0x7B58($at)
/* 46264 00146164 00080046 */  add.s      $f0, $f1, $f0
/* 46268 00146168 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4626C 0014616C A48420E4 */  swc1       $f0, -0x7B5C($at)
/* 46270 00146170 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46274 00146174 A88421C4 */  lwc1       $f1, -0x7B58($at)
/* 46278 00146178 00008044 */  mtc1       $0, $f0
/* 4627C 0014617C 00000000 */  nop
/* 46280 00146180 36080046 */  c.le.s     $f1, $f0
/* 46284 00146184 00000000 */  nop
/* 46288 00146188 10000145 */  bc1t       .L001461CC
/* 4628C 0014618C 00000000 */   nop
/* 46290 00146190 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46294 00146194 A48421C4 */  lwc1       $f1, -0x7B5C($at)
/* 46298 00146198 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4629C 0014619C A084228C */  lw         $2, -0x7B60($at)
/* 462A0 001461A0 00008244 */  mtc1       $2, $f0
/* 462A4 001461A4 00000000 */  nop
/* 462A8 001461A8 20008046 */  cvt.s.w    $f0, $f0
/* 462AC 001461AC 36080046 */  c.le.s     $f1, $f0
/* 462B0 001461B0 00000000 */  nop
/* 462B4 001461B4 05000145 */  bc1t       .L001461CC
/* 462B8 001461B8 00000000 */   nop
/* 462BC 001461BC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 462C0 001461C0 A48420E4 */  swc1       $f0, -0x7B5C($at)
/* 462C4 001461C4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 462C8 001461C8 9C8420AC */  sw         $0, -0x7B64($at)
.L001461CC:
/* 462CC 001461CC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 462D0 001461D0 A88421C4 */  lwc1       $f1, -0x7B58($at)
/* 462D4 001461D4 00008044 */  mtc1       $0, $f0
/* 462D8 001461D8 00000000 */  nop
/* 462DC 001461DC 34080046 */  c.lt.s     $f1, $f0
/* 462E0 001461E0 00000000 */  nop
/* 462E4 001461E4 10000045 */  bc1f       .L00146228
/* 462E8 001461E8 00000000 */   nop
/* 462EC 001461EC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 462F0 001461F0 A48421C4 */  lwc1       $f1, -0x7B5C($at)
/* 462F4 001461F4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 462F8 001461F8 A084228C */  lw         $2, -0x7B60($at)
/* 462FC 001461FC 00008244 */  mtc1       $2, $f0
/* 46300 00146200 00000000 */  nop
/* 46304 00146204 20008046 */  cvt.s.w    $f0, $f0
/* 46308 00146208 34080046 */  c.lt.s     $f1, $f0
/* 4630C 0014620C 00000000 */  nop
/* 46310 00146210 05000045 */  bc1f       .L00146228
/* 46314 00146214 00000000 */   nop
/* 46318 00146218 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4631C 0014621C A48420E4 */  swc1       $f0, -0x7B5C($at)
/* 46320 00146220 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46324 00146224 9C8420AC */  sw         $0, -0x7B64($at)
.L00146228:
/* 46328 00146228 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4632C 0014622C A4842CC4 */  lwc1       $f12, -0x7B5C($at)
/* 46330 00146230 2C44040C */  jal        fptosi
/* 46334 00146234 00000000 */   nop
/* 46338 00146238 28260072 */  paddub     $4, $16, $0
/* 4633C 0014623C 02000524 */  addiu      $5, $0, 0x2
/* 46340 00146240 28364070 */  paddub     $6, $2, $0
/* 46344 00146244 581A050C */  jal        SetVol__6CSoundFii
/* 46348 00146248 00000000 */   nop
.L0014624C:
/* 4634C 0014624C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46350 00146250 2C83238C */  lw         $3, -0x7CD4($at)
/* 46354 00146254 3F006010 */  beqz       $3, .L00146354
/* 46358 00146258 00000000 */   nop
/* 4635C 0014625C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46360 00146260 348321C4 */  lwc1       $f1, -0x7CCC($at)
/* 46364 00146264 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46368 00146268 388320C4 */  lwc1       $f0, -0x7CC8($at)
/* 4636C 0014626C 00080046 */  add.s      $f0, $f1, $f0
/* 46370 00146270 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46374 00146274 348320E4 */  swc1       $f0, -0x7CCC($at)
/* 46378 00146278 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4637C 0014627C 388321C4 */  lwc1       $f1, -0x7CC8($at)
/* 46380 00146280 00008044 */  mtc1       $0, $f0
/* 46384 00146284 00000000 */  nop
/* 46388 00146288 36080046 */  c.le.s     $f1, $f0
/* 4638C 0014628C 00000000 */  nop
/* 46390 00146290 10000145 */  bc1t       .L001462D4
/* 46394 00146294 00000000 */   nop
/* 46398 00146298 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4639C 0014629C 348321C4 */  lwc1       $f1, -0x7CCC($at)
/* 463A0 001462A0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 463A4 001462A4 3083228C */  lw         $2, -0x7CD0($at)
/* 463A8 001462A8 00008244 */  mtc1       $2, $f0
/* 463AC 001462AC 00000000 */  nop
/* 463B0 001462B0 20008046 */  cvt.s.w    $f0, $f0
/* 463B4 001462B4 36080046 */  c.le.s     $f1, $f0
/* 463B8 001462B8 00000000 */  nop
/* 463BC 001462BC 05000145 */  bc1t       .L001462D4
/* 463C0 001462C0 00000000 */   nop
/* 463C4 001462C4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 463C8 001462C8 348320E4 */  swc1       $f0, -0x7CCC($at)
/* 463CC 001462CC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 463D0 001462D0 2C8320AC */  sw         $0, -0x7CD4($at)
.L001462D4:
/* 463D4 001462D4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 463D8 001462D8 388321C4 */  lwc1       $f1, -0x7CC8($at)
/* 463DC 001462DC 00008044 */  mtc1       $0, $f0
/* 463E0 001462E0 00000000 */  nop
/* 463E4 001462E4 34080046 */  c.lt.s     $f1, $f0
/* 463E8 001462E8 00000000 */  nop
/* 463EC 001462EC 10000045 */  bc1f       .L00146330
/* 463F0 001462F0 00000000 */   nop
/* 463F4 001462F4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 463F8 001462F8 348321C4 */  lwc1       $f1, -0x7CCC($at)
/* 463FC 001462FC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46400 00146300 3083228C */  lw         $2, -0x7CD0($at)
/* 46404 00146304 00008244 */  mtc1       $2, $f0
/* 46408 00146308 00000000 */  nop
/* 4640C 0014630C 20008046 */  cvt.s.w    $f0, $f0
/* 46410 00146310 34080046 */  c.lt.s     $f1, $f0
/* 46414 00146314 00000000 */  nop
/* 46418 00146318 05000045 */  bc1f       .L00146330
/* 4641C 0014631C 00000000 */   nop
/* 46420 00146320 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46424 00146324 348320E4 */  swc1       $f0, -0x7CCC($at)
/* 46428 00146328 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4642C 0014632C 2C8320AC */  sw         $0, -0x7CD4($at)
.L00146330:
/* 46430 00146330 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46434 00146334 34832CC4 */  lwc1       $f12, -0x7CCC($at)
/* 46438 00146338 2C44040C */  jal        fptosi
/* 4643C 0014633C 00000000 */   nop
/* 46440 00146340 28260072 */  paddub     $4, $16, $0
/* 46444 00146344 0F000524 */  addiu      $5, $0, 0xF
/* 46448 00146348 28364070 */  paddub     $6, $2, $0
/* 4644C 0014634C 581A050C */  jal        SetVol__6CSoundFii
/* 46450 00146350 00000000 */   nop
.L00146354:
/* 46454 00146354 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46458 00146358 AC84238C */  lw         $3, -0x7B54($at)
/* 4645C 0014635C 3F006010 */  beqz       $3, .L0014645C
/* 46460 00146360 00000000 */   nop
/* 46464 00146364 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46468 00146368 B48421C4 */  lwc1       $f1, -0x7B4C($at)
/* 4646C 0014636C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46470 00146370 B88420C4 */  lwc1       $f0, -0x7B48($at)
/* 46474 00146374 00080046 */  add.s      $f0, $f1, $f0
/* 46478 00146378 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4647C 0014637C B48420E4 */  swc1       $f0, -0x7B4C($at)
/* 46480 00146380 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46484 00146384 B88421C4 */  lwc1       $f1, -0x7B48($at)
/* 46488 00146388 00008044 */  mtc1       $0, $f0
/* 4648C 0014638C 00000000 */  nop
/* 46490 00146390 36080046 */  c.le.s     $f1, $f0
/* 46494 00146394 00000000 */  nop
/* 46498 00146398 10000145 */  bc1t       .L001463DC
/* 4649C 0014639C 00000000 */   nop
/* 464A0 001463A0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 464A4 001463A4 B48421C4 */  lwc1       $f1, -0x7B4C($at)
/* 464A8 001463A8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 464AC 001463AC B084228C */  lw         $2, -0x7B50($at)
/* 464B0 001463B0 00008244 */  mtc1       $2, $f0
/* 464B4 001463B4 00000000 */  nop
/* 464B8 001463B8 20008046 */  cvt.s.w    $f0, $f0
/* 464BC 001463BC 36080046 */  c.le.s     $f1, $f0
/* 464C0 001463C0 00000000 */  nop
/* 464C4 001463C4 05000145 */  bc1t       .L001463DC
/* 464C8 001463C8 00000000 */   nop
/* 464CC 001463CC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 464D0 001463D0 B48420E4 */  swc1       $f0, -0x7B4C($at)
/* 464D4 001463D4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 464D8 001463D8 AC8420AC */  sw         $0, -0x7B54($at)
.L001463DC:
/* 464DC 001463DC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 464E0 001463E0 B88421C4 */  lwc1       $f1, -0x7B48($at)
/* 464E4 001463E4 00008044 */  mtc1       $0, $f0
/* 464E8 001463E8 00000000 */  nop
/* 464EC 001463EC 34080046 */  c.lt.s     $f1, $f0
/* 464F0 001463F0 00000000 */  nop
/* 464F4 001463F4 10000045 */  bc1f       .L00146438
/* 464F8 001463F8 00000000 */   nop
/* 464FC 001463FC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46500 00146400 B48421C4 */  lwc1       $f1, -0x7B4C($at)
/* 46504 00146404 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46508 00146408 B084228C */  lw         $2, -0x7B50($at)
/* 4650C 0014640C 00008244 */  mtc1       $2, $f0
/* 46510 00146410 00000000 */  nop
/* 46514 00146414 20008046 */  cvt.s.w    $f0, $f0
/* 46518 00146418 34080046 */  c.lt.s     $f1, $f0
/* 4651C 0014641C 00000000 */  nop
/* 46520 00146420 05000045 */  bc1f       .L00146438
/* 46524 00146424 00000000 */   nop
/* 46528 00146428 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4652C 0014642C B48420E4 */  swc1       $f0, -0x7B4C($at)
/* 46530 00146430 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46534 00146434 AC8420AC */  sw         $0, -0x7B54($at)
.L00146438:
/* 46538 00146438 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4653C 0014643C B4842CC4 */  lwc1       $f12, -0x7B4C($at)
/* 46540 00146440 2C44040C */  jal        fptosi
/* 46544 00146444 00000000 */   nop
/* 46548 00146448 28260072 */  paddub     $4, $16, $0
/* 4654C 0014644C 0E000524 */  addiu      $5, $0, 0xE
/* 46550 00146450 28364070 */  paddub     $6, $2, $0
/* 46554 00146454 581A050C */  jal        SetVol__6CSoundFii
/* 46558 00146458 00000000 */   nop
.L0014645C:
/* 4655C 0014645C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46560 00146460 2C84238C */  lw         $3, -0x7BD4($at)
/* 46564 00146464 3F006010 */  beqz       $3, .L00146564
/* 46568 00146468 00000000 */   nop
/* 4656C 0014646C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46570 00146470 348421C4 */  lwc1       $f1, -0x7BCC($at)
/* 46574 00146474 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46578 00146478 388420C4 */  lwc1       $f0, -0x7BC8($at)
/* 4657C 0014647C 00080046 */  add.s      $f0, $f1, $f0
/* 46580 00146480 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46584 00146484 348420E4 */  swc1       $f0, -0x7BCC($at)
/* 46588 00146488 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4658C 0014648C 388421C4 */  lwc1       $f1, -0x7BC8($at)
/* 46590 00146490 00008044 */  mtc1       $0, $f0
/* 46594 00146494 00000000 */  nop
/* 46598 00146498 36080046 */  c.le.s     $f1, $f0
/* 4659C 0014649C 00000000 */  nop
/* 465A0 001464A0 10000145 */  bc1t       .L001464E4
/* 465A4 001464A4 00000000 */   nop
/* 465A8 001464A8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 465AC 001464AC 348421C4 */  lwc1       $f1, -0x7BCC($at)
/* 465B0 001464B0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 465B4 001464B4 3084228C */  lw         $2, -0x7BD0($at)
/* 465B8 001464B8 00008244 */  mtc1       $2, $f0
/* 465BC 001464BC 00000000 */  nop
/* 465C0 001464C0 20008046 */  cvt.s.w    $f0, $f0
/* 465C4 001464C4 36080046 */  c.le.s     $f1, $f0
/* 465C8 001464C8 00000000 */  nop
/* 465CC 001464CC 05000145 */  bc1t       .L001464E4
/* 465D0 001464D0 00000000 */   nop
/* 465D4 001464D4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 465D8 001464D8 348420E4 */  swc1       $f0, -0x7BCC($at)
/* 465DC 001464DC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 465E0 001464E0 2C8420AC */  sw         $0, -0x7BD4($at)
.L001464E4:
/* 465E4 001464E4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 465E8 001464E8 388421C4 */  lwc1       $f1, -0x7BC8($at)
/* 465EC 001464EC 00008044 */  mtc1       $0, $f0
/* 465F0 001464F0 00000000 */  nop
/* 465F4 001464F4 34080046 */  c.lt.s     $f1, $f0
/* 465F8 001464F8 00000000 */  nop
/* 465FC 001464FC 10000045 */  bc1f       .L00146540
/* 46600 00146500 00000000 */   nop
/* 46604 00146504 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46608 00146508 348421C4 */  lwc1       $f1, -0x7BCC($at)
/* 4660C 0014650C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46610 00146510 3084228C */  lw         $2, -0x7BD0($at)
/* 46614 00146514 00008244 */  mtc1       $2, $f0
/* 46618 00146518 00000000 */  nop
/* 4661C 0014651C 20008046 */  cvt.s.w    $f0, $f0
/* 46620 00146520 34080046 */  c.lt.s     $f1, $f0
/* 46624 00146524 00000000 */  nop
/* 46628 00146528 05000045 */  bc1f       .L00146540
/* 4662C 0014652C 00000000 */   nop
/* 46630 00146530 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46634 00146534 348420E4 */  swc1       $f0, -0x7BCC($at)
/* 46638 00146538 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4663C 0014653C 2C8420AC */  sw         $0, -0x7BD4($at)
.L00146540:
/* 46640 00146540 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46644 00146544 34842CC4 */  lwc1       $f12, -0x7BCC($at)
/* 46648 00146548 2C44040C */  jal        fptosi
/* 4664C 0014654C 00000000 */   nop
/* 46650 00146550 28260072 */  paddub     $4, $16, $0
/* 46654 00146554 0A000524 */  addiu      $5, $0, 0xA
/* 46658 00146558 28364070 */  paddub     $6, $2, $0
/* 4665C 0014655C 581A050C */  jal        SetVol__6CSoundFii
/* 46660 00146560 00000000 */   nop
.L00146564:
/* 46664 00146564 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46668 00146568 2C85238C */  lw         $3, -0x7AD4($at)
/* 4666C 0014656C 3F006010 */  beqz       $3, .L0014666C
/* 46670 00146570 00000000 */   nop
/* 46674 00146574 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46678 00146578 348521C4 */  lwc1       $f1, -0x7ACC($at)
/* 4667C 0014657C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46680 00146580 388520C4 */  lwc1       $f0, -0x7AC8($at)
/* 46684 00146584 00080046 */  add.s      $f0, $f1, $f0
/* 46688 00146588 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4668C 0014658C 348520E4 */  swc1       $f0, -0x7ACC($at)
/* 46690 00146590 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46694 00146594 388521C4 */  lwc1       $f1, -0x7AC8($at)
/* 46698 00146598 00008044 */  mtc1       $0, $f0
/* 4669C 0014659C 00000000 */  nop
/* 466A0 001465A0 36080046 */  c.le.s     $f1, $f0
/* 466A4 001465A4 00000000 */  nop
/* 466A8 001465A8 10000145 */  bc1t       .L001465EC
/* 466AC 001465AC 00000000 */   nop
/* 466B0 001465B0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 466B4 001465B4 348521C4 */  lwc1       $f1, -0x7ACC($at)
/* 466B8 001465B8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 466BC 001465BC 3085228C */  lw         $2, -0x7AD0($at)
/* 466C0 001465C0 00008244 */  mtc1       $2, $f0
/* 466C4 001465C4 00000000 */  nop
/* 466C8 001465C8 20008046 */  cvt.s.w    $f0, $f0
/* 466CC 001465CC 36080046 */  c.le.s     $f1, $f0
/* 466D0 001465D0 00000000 */  nop
/* 466D4 001465D4 05000145 */  bc1t       .L001465EC
/* 466D8 001465D8 00000000 */   nop
/* 466DC 001465DC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 466E0 001465E0 348520E4 */  swc1       $f0, -0x7ACC($at)
/* 466E4 001465E4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 466E8 001465E8 2C8520AC */  sw         $0, -0x7AD4($at)
.L001465EC:
/* 466EC 001465EC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 466F0 001465F0 388521C4 */  lwc1       $f1, -0x7AC8($at)
/* 466F4 001465F4 00008044 */  mtc1       $0, $f0
/* 466F8 001465F8 00000000 */  nop
/* 466FC 001465FC 34080046 */  c.lt.s     $f1, $f0
/* 46700 00146600 00000000 */  nop
/* 46704 00146604 10000045 */  bc1f       .L00146648
/* 46708 00146608 00000000 */   nop
/* 4670C 0014660C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46710 00146610 348521C4 */  lwc1       $f1, -0x7ACC($at)
/* 46714 00146614 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46718 00146618 3085228C */  lw         $2, -0x7AD0($at)
/* 4671C 0014661C 00008244 */  mtc1       $2, $f0
/* 46720 00146620 00000000 */  nop
/* 46724 00146624 20008046 */  cvt.s.w    $f0, $f0
/* 46728 00146628 34080046 */  c.lt.s     $f1, $f0
/* 4672C 0014662C 00000000 */  nop
/* 46730 00146630 05000045 */  bc1f       .L00146648
/* 46734 00146634 00000000 */   nop
/* 46738 00146638 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4673C 0014663C 348520E4 */  swc1       $f0, -0x7ACC($at)
/* 46740 00146640 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46744 00146644 2C8520AC */  sw         $0, -0x7AD4($at)
.L00146648:
/* 46748 00146648 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4674C 0014664C 34852CC4 */  lwc1       $f12, -0x7ACC($at)
/* 46750 00146650 2C44040C */  jal        fptosi
/* 46754 00146654 00000000 */   nop
/* 46758 00146658 28260072 */  paddub     $4, $16, $0
/* 4675C 0014665C 0D000524 */  addiu      $5, $0, 0xD
/* 46760 00146660 28364070 */  paddub     $6, $2, $0
/* 46764 00146664 581A050C */  jal        SetVol__6CSoundFii
/* 46768 00146668 00000000 */   nop
.L0014666C:
/* 4676C 0014666C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46770 00146670 AC85238C */  lw         $3, -0x7A54($at)
/* 46774 00146674 3F006010 */  beqz       $3, .L00146774
/* 46778 00146678 00000000 */   nop
/* 4677C 0014667C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46780 00146680 B48521C4 */  lwc1       $f1, -0x7A4C($at)
/* 46784 00146684 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46788 00146688 B88520C4 */  lwc1       $f0, -0x7A48($at)
/* 4678C 0014668C 00080046 */  add.s      $f0, $f1, $f0
/* 46790 00146690 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46794 00146694 B48520E4 */  swc1       $f0, -0x7A4C($at)
/* 46798 00146698 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4679C 0014669C B88521C4 */  lwc1       $f1, -0x7A48($at)
/* 467A0 001466A0 00008044 */  mtc1       $0, $f0
/* 467A4 001466A4 00000000 */  nop
/* 467A8 001466A8 36080046 */  c.le.s     $f1, $f0
/* 467AC 001466AC 00000000 */  nop
/* 467B0 001466B0 10000145 */  bc1t       .L001466F4
/* 467B4 001466B4 00000000 */   nop
/* 467B8 001466B8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 467BC 001466BC B48521C4 */  lwc1       $f1, -0x7A4C($at)
/* 467C0 001466C0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 467C4 001466C4 B085228C */  lw         $2, -0x7A50($at)
/* 467C8 001466C8 00008244 */  mtc1       $2, $f0
/* 467CC 001466CC 00000000 */  nop
/* 467D0 001466D0 20008046 */  cvt.s.w    $f0, $f0
/* 467D4 001466D4 36080046 */  c.le.s     $f1, $f0
/* 467D8 001466D8 00000000 */  nop
/* 467DC 001466DC 05000145 */  bc1t       .L001466F4
/* 467E0 001466E0 00000000 */   nop
/* 467E4 001466E4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 467E8 001466E8 B48520E4 */  swc1       $f0, -0x7A4C($at)
/* 467EC 001466EC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 467F0 001466F0 AC8520AC */  sw         $0, -0x7A54($at)
.L001466F4:
/* 467F4 001466F4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 467F8 001466F8 B88521C4 */  lwc1       $f1, -0x7A48($at)
/* 467FC 001466FC 00008044 */  mtc1       $0, $f0
/* 46800 00146700 00000000 */  nop
/* 46804 00146704 34080046 */  c.lt.s     $f1, $f0
/* 46808 00146708 00000000 */  nop
/* 4680C 0014670C 10000045 */  bc1f       .L00146750
/* 46810 00146710 00000000 */   nop
/* 46814 00146714 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46818 00146718 B48521C4 */  lwc1       $f1, -0x7A4C($at)
/* 4681C 0014671C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46820 00146720 B085228C */  lw         $2, -0x7A50($at)
/* 46824 00146724 00008244 */  mtc1       $2, $f0
/* 46828 00146728 00000000 */  nop
/* 4682C 0014672C 20008046 */  cvt.s.w    $f0, $f0
/* 46830 00146730 34080046 */  c.lt.s     $f1, $f0
/* 46834 00146734 00000000 */  nop
/* 46838 00146738 05000045 */  bc1f       .L00146750
/* 4683C 0014673C 00000000 */   nop
/* 46840 00146740 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46844 00146744 B48520E4 */  swc1       $f0, -0x7A4C($at)
/* 46848 00146748 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4684C 0014674C AC8520AC */  sw         $0, -0x7A54($at)
.L00146750:
/* 46850 00146750 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46854 00146754 B4852CC4 */  lwc1       $f12, -0x7A4C($at)
/* 46858 00146758 2C44040C */  jal        fptosi
/* 4685C 0014675C 00000000 */   nop
/* 46860 00146760 28260072 */  paddub     $4, $16, $0
/* 46864 00146764 0C000524 */  addiu      $5, $0, 0xC
/* 46868 00146768 28364070 */  paddub     $6, $2, $0
/* 4686C 0014676C 581A050C */  jal        SetVol__6CSoundFii
/* 46870 00146770 00000000 */   nop
.L00146774:
/* 46874 00146774 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46878 00146778 2C86238C */  lw         $3, -0x79D4($at)
/* 4687C 0014677C 3F006010 */  beqz       $3, .L0014687C
/* 46880 00146780 00000000 */   nop
/* 46884 00146784 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46888 00146788 348621C4 */  lwc1       $f1, -0x79CC($at)
/* 4688C 0014678C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46890 00146790 388620C4 */  lwc1       $f0, -0x79C8($at)
/* 46894 00146794 00080046 */  add.s      $f0, $f1, $f0
/* 46898 00146798 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4689C 0014679C 348620E4 */  swc1       $f0, -0x79CC($at)
/* 468A0 001467A0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 468A4 001467A4 388621C4 */  lwc1       $f1, -0x79C8($at)
/* 468A8 001467A8 00008044 */  mtc1       $0, $f0
/* 468AC 001467AC 00000000 */  nop
/* 468B0 001467B0 36080046 */  c.le.s     $f1, $f0
/* 468B4 001467B4 00000000 */  nop
/* 468B8 001467B8 10000145 */  bc1t       .L001467FC
/* 468BC 001467BC 00000000 */   nop
/* 468C0 001467C0 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 468C4 001467C4 348621C4 */  lwc1       $f1, -0x79CC($at)
/* 468C8 001467C8 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 468CC 001467CC 3086228C */  lw         $2, -0x79D0($at)
/* 468D0 001467D0 00008244 */  mtc1       $2, $f0
/* 468D4 001467D4 00000000 */  nop
/* 468D8 001467D8 20008046 */  cvt.s.w    $f0, $f0
/* 468DC 001467DC 36080046 */  c.le.s     $f1, $f0
/* 468E0 001467E0 00000000 */  nop
/* 468E4 001467E4 05000145 */  bc1t       .L001467FC
/* 468E8 001467E8 00000000 */   nop
/* 468EC 001467EC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 468F0 001467F0 348620E4 */  swc1       $f0, -0x79CC($at)
/* 468F4 001467F4 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 468F8 001467F8 2C8620AC */  sw         $0, -0x79D4($at)
.L001467FC:
/* 468FC 001467FC CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46900 00146800 388621C4 */  lwc1       $f1, -0x79C8($at)
/* 46904 00146804 00008044 */  mtc1       $0, $f0
/* 46908 00146808 00000000 */  nop
/* 4690C 0014680C 34080046 */  c.lt.s     $f1, $f0
/* 46910 00146810 00000000 */  nop
/* 46914 00146814 10000045 */  bc1f       .L00146858
/* 46918 00146818 00000000 */   nop
/* 4691C 0014681C CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46920 00146820 348621C4 */  lwc1       $f1, -0x79CC($at)
/* 46924 00146824 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46928 00146828 3086228C */  lw         $2, -0x79D0($at)
/* 4692C 0014682C 00008244 */  mtc1       $2, $f0
/* 46930 00146830 00000000 */  nop
/* 46934 00146834 20008046 */  cvt.s.w    $f0, $f0
/* 46938 00146838 34080046 */  c.lt.s     $f1, $f0
/* 4693C 0014683C 00000000 */  nop
/* 46940 00146840 05000045 */  bc1f       .L00146858
/* 46944 00146844 00000000 */   nop
/* 46948 00146848 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4694C 0014684C 348620E4 */  swc1       $f0, -0x79CC($at)
/* 46950 00146850 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 46954 00146854 2C8620AC */  sw         $0, -0x79D4($at)
.L00146858:
/* 46958 00146858 CF01013C */  lui        $at, (0x1CF0000 >> 16)
/* 4695C 0014685C 34862CC4 */  lwc1       $f12, -0x79CC($at)
/* 46960 00146860 2C44040C */  jal        fptosi
/* 46964 00146864 00000000 */   nop
/* 46968 00146868 28260072 */  paddub     $4, $16, $0
/* 4696C 0014686C 0B000524 */  addiu      $5, $0, 0xB
/* 46970 00146870 28364070 */  paddub     $6, $2, $0
/* 46974 00146874 581A050C */  jal        SetVol__6CSoundFii
/* 46978 00146878 00000000 */   nop
.L0014687C:
/* 4697C 0014687C 28860070 */  paddub     $16, $0, $0
/* 46980 00146880 1A000010 */  b          .L001468EC
/* 46984 00146884 00000000 */   nop
.L00146888:
/* 46988 00146888 40221000 */  sll        $4, $16, 9
/* 4698C 0014688C CE01033C */  lui        $3, %hi(msinBf)
/* 46990 00146890 00766324 */  addiu      $3, $3, %lo(msinBf)
/* 46994 00146894 21286400 */  addu       $5, $3, $4
/* 46998 00146898 0400B124 */  addiu      $17, $5, 0x4
/* 4699C 0014689C 0400A38C */  lw         $3, 0x4($5)
/* 469A0 001468A0 10006010 */  beqz       $3, .L001468E4
/* 469A4 001468A4 00000000 */   nop
/* 469A8 001468A8 988D828F */  lw         $2, -0x7268($gp)
/* 469AC 001468AC 21204400 */  addu       $4, $2, $4
/* 469B0 001468B0 00020624 */  addiu      $6, $0, 0x200
/* 469B4 001468B4 B81E050C */  jal        ezTransToIOP__FPvPvi
/* 469B8 001468B8 00000000 */   nop
/* 469BC 001468BC 06004010 */  beqz       $2, .L001468D8
/* 469C0 001468C0 00000000 */   nop
/* 469C4 001468C4 2A00023C */  lui        $2, %hi(_977)
/* 469C8 001468C8 F0994424 */  addiu      $4, $2, %lo(_977)
/* 469CC 001468CC 0000258E */  lw         $5, 0x0($17)
/* 469D0 001468D0 A611040C */  jal        printf
/* 469D4 001468D4 00000000 */   nop
.L001468D8:
/* 469D8 001468D8 000020AE */  sw         $0, 0x0($17)
/* 469DC 001468DC 02000010 */  b          .L001468E8
/* 469E0 001468E0 00000000 */   nop
.L001468E4:
/* 469E4 001468E4 000020AE */  sw         $0, 0x0($17)
.L001468E8:
/* 469E8 001468E8 01001026 */  addiu      $16, $16, 0x1
.L001468EC:
/* 469EC 001468EC 0600032A */  slti       $3, $16, 0x6
/* 469F0 001468F0 E5FF6014 */  bnez       $3, .L00146888
/* 469F4 001468F4 00000000 */   nop
/* 469F8 001468F8 2000BF7B */  lq         $31, 0x20($sp)
/* 469FC 001468FC 1000B17B */  lq         $17, 0x10($sp)
/* 46A00 00146900 0000B07B */  lq         $16, 0x0($sp)
/* 46A04 00146904 3000BD27 */  addiu      $sp, $sp, 0x30
/* 46A08 00146908 0800E003 */  jr         $31
/* 46A0C 0014690C 00000000 */   nop