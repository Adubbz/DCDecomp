.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MoveCamera__FP13CCameraFollow_2
/* 9E180 0019E080 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9E184 0019E084 2000BF7F */  sq         $31, 0x20($sp)
/* 9E188 0019E088 1000B07F */  sq         $16, 0x10($sp)
/* 9E18C 0019E08C 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 9E190 0019E090 28868070 */  paddub     $16, $4, $0
/* 9E194 0019E094 CC01023C */  lui        $2, %hi(GamePad)
/* 9E198 0019E098 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9E19C 0019E09C A4AD040C */  jal        GetRXf__8CGamePadFv
/* 9E1A0 0019E0A0 00000000 */   nop
/* 9E1A4 0019E0A4 06050046 */  mov.s      $f20, $f0
/* 9E1A8 0019E0A8 CC01023C */  lui        $2, %hi(GamePad)
/* 9E1AC 0019E0AC 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9E1B0 0019E0B0 B4AD040C */  jal        GetRYf__8CGamePadFv
/* 9E1B4 0019E0B4 00000000 */   nop
/* 9E1B8 0019E0B8 07030046 */  neg.s      $f12, $f0
/* 9E1BC 0019E0BC 28260072 */  paddub     $4, $16, $0
/* 9E1C0 0019E0C0 F492040C */  jal        AddHeight__13CCameraFollowFf
/* 9E1C4 0019E0C4 00000000 */   nop
/* 9E1C8 0019E0C8 28260072 */  paddub     $4, $16, $0
/* 9E1CC 0019E0CC F092040C */  jal        GetHeight__13CCameraFollowFv
/* 9E1D0 0019E0D0 00000000 */   nop
/* 9E1D4 0019E0D4 F041023C */  lui        $2, (0x41F00000 >> 16)
/* 9E1D8 0019E0D8 00608244 */  mtc1       $2, $f12
/* 9E1DC 0019E0DC 00000000 */  nop
/* 9E1E0 0019E0E0 36000C46 */  c.le.s     $f0, $f12
/* 9E1E4 0019E0E4 00000000 */  nop
/* 9E1E8 0019E0E8 04000145 */  bc1t       .L0019E0FC
/* 9E1EC 0019E0EC 00000000 */   nop
/* 9E1F0 0019E0F0 28260072 */  paddub     $4, $16, $0
/* 9E1F4 0019E0F4 EC92040C */  jal        SetHeight__13CCameraFollowFf
/* 9E1F8 0019E0F8 00000000 */   nop
.L0019E0FC:
/* 9E1FC 0019E0FC 47A00046 */  neg.s      $f1, $f20
/* 9E200 0019E100 048280C7 */  lwc1       $f0, -0x7DFC($gp)
/* 9E204 0019E104 02030146 */  mul.s      $f12, $f0, $f1
/* 9E208 0019E108 28260072 */  paddub     $4, $16, $0
/* 9E20C 0019E10C D492040C */  jal        AddAngle__13CCameraFollowFf
/* 9E210 0019E110 00000000 */   nop
/* 9E214 0019E114 CC01023C */  lui        $2, %hi(GamePad)
/* 9E218 0019E118 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9E21C 0019E11C 08000524 */  addiu      $5, $0, 0x8
/* 9E220 0019E120 04AE040C */  jal        On__8CGamePadFi
/* 9E224 0019E124 00000000 */   nop
/* 9E228 0019E128 05004010 */  beqz       $2, .L0019E140
/* 9E22C 0019E12C 00000000 */   nop
/* 9E230 0019E130 28260072 */  paddub     $4, $16, $0
/* 9E234 0019E134 38828CC7 */  lwc1       $f12, -0x7DC8($gp)
/* 9E238 0019E138 D492040C */  jal        AddAngle__13CCameraFollowFf
/* 9E23C 0019E13C 00000000 */   nop
.L0019E140:
/* 9E240 0019E140 CC01023C */  lui        $2, %hi(GamePad)
/* 9E244 0019E144 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9E248 0019E148 04000524 */  addiu      $5, $0, 0x4
/* 9E24C 0019E14C 04AE040C */  jal        On__8CGamePadFi
/* 9E250 0019E150 00000000 */   nop
/* 9E254 0019E154 05004010 */  beqz       $2, .L0019E16C
/* 9E258 0019E158 00000000 */   nop
/* 9E25C 0019E15C 28260072 */  paddub     $4, $16, $0
/* 9E260 0019E160 78818CC7 */  lwc1       $f12, -0x7E88($gp)
/* 9E264 0019E164 D492040C */  jal        AddAngle__13CCameraFollowFf
/* 9E268 0019E168 00000000 */   nop
.L0019E16C:
/* 9E26C 0019E16C A487828F */  lw         $2, -0x785C($gp)
/* 9E270 0019E170 80180200 */  sll        $3, $2, 2
/* 9E274 0019E174 2700023C */  lui        $2, %hi(camera_distance$1155)
/* 9E278 0019E178 90A64224 */  addiu      $2, $2, %lo(camera_distance$1155)
/* 9E27C 0019E17C 21104300 */  addu       $2, $2, $3
/* 9E280 0019E180 28260072 */  paddub     $4, $16, $0
/* 9E284 0019E184 00004CC4 */  lwc1       $f12, 0x0($2)
/* 9E288 0019E188 DC92040C */  jal        SetDistance__13CCameraFollowFf
/* 9E28C 0019E18C 00000000 */   nop
/* 9E290 0019E190 CC01023C */  lui        $2, %hi(GamePad)
/* 9E294 0019E194 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* 9E298 0019E198 10000524 */  addiu      $5, $0, 0x10
/* 9E29C 0019E19C 1CAE040C */  jal        Down__8CGamePadFi
/* 9E2A0 0019E1A0 00000000 */   nop
/* 9E2A4 0019E1A4 04004010 */  beqz       $2, .L0019E1B8
/* 9E2A8 0019E1A8 00000000 */   nop
/* 9E2AC 0019E1AC A487838F */  lw         $3, -0x785C($gp)
/* 9E2B0 0019E1B0 01006324 */  addiu      $3, $3, 0x1
/* 9E2B4 0019E1B4 A48783AF */  sw         $3, -0x785C($gp)
.L0019E1B8:
/* 9E2B8 0019E1B8 A487838F */  lw         $3, -0x785C($gp)
/* 9E2BC 0019E1BC 03006328 */  slti       $3, $3, 0x3
/* 9E2C0 0019E1C0 02006014 */  bnez       $3, .L0019E1CC
/* 9E2C4 0019E1C4 00000000 */   nop
/* 9E2C8 0019E1C8 A48780AF */  sw         $0, -0x785C($gp)
.L0019E1CC:
/* 9E2CC 0019E1CC 2000BF7B */  lq         $31, 0x20($sp)
/* 9E2D0 0019E1D0 1000B07B */  lq         $16, 0x10($sp)
/* 9E2D4 0019E1D4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 9E2D8 0019E1D8 3000BD27 */  addiu      $sp, $sp, 0x30
/* 9E2DC 0019E1DC 0800E003 */  jr         $31
/* 9E2E0 0019E1E0 00000000 */   nop
/* 9E2E4 0019E1E4 00000000 */  nop
/* 9E2E8 0019E1E8 00000000 */  nop
/* 9E2EC 0019E1EC 00000000 */  nop
