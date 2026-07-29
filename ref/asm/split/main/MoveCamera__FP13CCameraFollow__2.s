.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel MoveCamera__FP13CCameraFollow__2
/* 09E180 0019E080 D0FFBD27 */  addiu       $29, $29, -0x30
/* 09E184 0019E084 2000BF7F */  sq          $31, 0x20($29)
/* 09E188 0019E088 1000B07F */  sq          $16, 0x10($29)
/* 09E18C 0019E08C 0000B4E7 */  swc1        $f20, 0x0($29)
/* 09E190 0019E090 28868070 */  paddub      $16, $4, $0
/* 09E194 0019E094 CC01023C */  lui         $2, %hi(GamePad)
/* 09E198 0019E098 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09E19C 0019E09C A4AD040C */  jal         GetRXf__8CGamePadFv
/* 09E1A0 0019E0A0 00000000 */   nop
/* 09E1A4 0019E0A4 06050046 */  mov.s       $f20, $f0
/* 09E1A8 0019E0A8 CC01023C */  lui         $2, %hi(GamePad)
/* 09E1AC 0019E0AC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09E1B0 0019E0B0 B4AD040C */  jal         GetRYf__8CGamePadFv
/* 09E1B4 0019E0B4 00000000 */   nop
/* 09E1B8 0019E0B8 07030046 */  neg.s       $f12, $f0
/* 09E1BC 0019E0BC 28260072 */  paddub      $4, $16, $0
/* 09E1C0 0019E0C0 F492040C */  jal         AddHeight__13CCameraFollowFf
/* 09E1C4 0019E0C4 00000000 */   nop
/* 09E1C8 0019E0C8 28260072 */  paddub      $4, $16, $0
/* 09E1CC 0019E0CC F092040C */  jal         GetHeight__13CCameraFollowFv
/* 09E1D0 0019E0D0 00000000 */   nop
/* 09E1D4 0019E0D4 F041023C */  lui         $2, (0x41F00000 >> 16)
/* 09E1D8 0019E0D8 00608244 */  mtc1        $2, $f12
/* 09E1DC 0019E0DC 00000000 */  nop
/* 09E1E0 0019E0E0 36000C46 */  c.le.s      $f0, $f12
/* 09E1E4 0019E0E4 00000000 */  nop
/* 09E1E8 0019E0E8 04000145 */  bc1t        .L0019E0FC
/* 09E1EC 0019E0EC 00000000 */   nop
/* 09E1F0 0019E0F0 28260072 */  paddub      $4, $16, $0
/* 09E1F4 0019E0F4 EC92040C */  jal         SetHeight__13CCameraFollowFf
/* 09E1F8 0019E0F8 00000000 */   nop
.L0019E0FC:
/* 09E1FC 0019E0FC 47A00046 */  neg.s       $f1, $f20
/* 09E200 0019E100 048280C7 */  lwc1        $f0, -0x7DFC($28)
/* 09E204 0019E104 02030146 */  mul.s       $f12, $f0, $f1
/* 09E208 0019E108 28260072 */  paddub      $4, $16, $0
/* 09E20C 0019E10C D492040C */  jal         AddAngle__13CCameraFollowFf
/* 09E210 0019E110 00000000 */   nop
/* 09E214 0019E114 CC01023C */  lui         $2, %hi(GamePad)
/* 09E218 0019E118 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09E21C 0019E11C 08000524 */  addiu       $5, $0, 0x8
/* 09E220 0019E120 04AE040C */  jal         On__8CGamePadFi
/* 09E224 0019E124 00000000 */   nop
/* 09E228 0019E128 05004010 */  beqz        $2, .L0019E140
/* 09E22C 0019E12C 00000000 */   nop
/* 09E230 0019E130 28260072 */  paddub      $4, $16, $0
/* 09E234 0019E134 38828CC7 */  lwc1        $f12, -0x7DC8($28)
/* 09E238 0019E138 D492040C */  jal         AddAngle__13CCameraFollowFf
/* 09E23C 0019E13C 00000000 */   nop
.L0019E140:
/* 09E240 0019E140 CC01023C */  lui         $2, %hi(GamePad)
/* 09E244 0019E144 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09E248 0019E148 04000524 */  addiu       $5, $0, 0x4
/* 09E24C 0019E14C 04AE040C */  jal         On__8CGamePadFi
/* 09E250 0019E150 00000000 */   nop
/* 09E254 0019E154 05004010 */  beqz        $2, .L0019E16C
/* 09E258 0019E158 00000000 */   nop
/* 09E25C 0019E15C 28260072 */  paddub      $4, $16, $0
/* 09E260 0019E160 78818CC7 */  lwc1        $f12, -0x7E88($28)
/* 09E264 0019E164 D492040C */  jal         AddAngle__13CCameraFollowFf
/* 09E268 0019E168 00000000 */   nop
.L0019E16C:
/* 09E26C 0019E16C A487828F */  lw          $2, -0x785C($28)
/* 09E270 0019E170 80180200 */  sll         $3, $2, 2
/* 09E274 0019E174 2700023C */  lui         $2, %hi(camera_distance$1155)
/* 09E278 0019E178 90A64224 */  addiu       $2, $2, %lo(camera_distance$1155)
/* 09E27C 0019E17C 21104300 */  addu        $2, $2, $3
/* 09E280 0019E180 28260072 */  paddub      $4, $16, $0
/* 09E284 0019E184 00004CC4 */  lwc1        $f12, 0x0($2)
/* 09E288 0019E188 DC92040C */  jal         SetDistance__13CCameraFollowFf
/* 09E28C 0019E18C 00000000 */   nop
/* 09E290 0019E190 CC01023C */  lui         $2, %hi(GamePad)
/* 09E294 0019E194 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 09E298 0019E198 10000524 */  addiu       $5, $0, 0x10
/* 09E29C 0019E19C 1CAE040C */  jal         Down__8CGamePadFi
/* 09E2A0 0019E1A0 00000000 */   nop
/* 09E2A4 0019E1A4 04004010 */  beqz        $2, .L0019E1B8
/* 09E2A8 0019E1A8 00000000 */   nop
/* 09E2AC 0019E1AC A487838F */  lw          $3, -0x785C($28)
/* 09E2B0 0019E1B0 01006324 */  addiu       $3, $3, 0x1
/* 09E2B4 0019E1B4 A48783AF */  sw          $3, -0x785C($28)
.L0019E1B8:
/* 09E2B8 0019E1B8 A487838F */  lw          $3, -0x785C($28)
/* 09E2BC 0019E1BC 03006328 */  slti        $3, $3, 0x3
/* 09E2C0 0019E1C0 02006014 */  bnez        $3, .L0019E1CC
/* 09E2C4 0019E1C4 00000000 */   nop
/* 09E2C8 0019E1C8 A48780AF */  sw          $0, -0x785C($28)
.L0019E1CC:
/* 09E2CC 0019E1CC 2000BF7B */  lq          $31, 0x20($29)
/* 09E2D0 0019E1D0 1000B07B */  lq          $16, 0x10($29)
/* 09E2D4 0019E1D4 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 09E2D8 0019E1D8 3000BD27 */  addiu       $29, $29, 0x30
/* 09E2DC 0019E1DC 0800E003 */  jr          $31
/* 09E2E0 0019E1E0 00000000 */   nop
/* 09E2E4 0019E1E4 00000000 */  nop
/* 09E2E8 0019E1E8 00000000 */  nop
/* 09E2EC 0019E1EC 00000000 */  nop
