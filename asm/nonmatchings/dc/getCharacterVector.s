.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel getCharacterVector__FPff
/* D42A0 001D41A0 F0FEBD27 */  addiu      $sp, $sp, -0x110
/* D42A4 001D41A4 2000BF7F */  sq         $31, 0x20($sp)
/* D42A8 001D41A8 1000B07F */  sq         $16, 0x10($sp)
/* D42AC 001D41AC 0000B4E7 */  swc1       $f20, 0x0($sp)
/* D42B0 001D41B0 28868070 */  paddub     $16, $4, $0
/* D42B4 001D41B4 06650046 */  mov.s      $f20, $f12
/* D42B8 001D41B8 2800023C */  lui        $2, %hi(_792_2)
/* D42BC 001D41BC D0EA4224 */  addiu      $2, $2, %lo(_792_2)
/* D42C0 001D41C0 3000A327 */  addiu      $3, $sp, 0x30
/* D42C4 001D41C4 00004278 */  lq         $2, 0x0($2)
/* D42C8 001D41C8 0000627C */  sq         $2, 0x0($3)
/* D42CC 001D41CC EA01013C */  lui        $at, (0x1EA1DDC >> 16)
/* D42D0 001D41D0 DC1D248C */  lw         $4, (0x1EA1DDC & 0xFFFF)($at)
/* D42D4 001D41D4 4000A527 */  addiu      $5, $sp, 0x40
/* D42D8 001D41D8 8CA3040C */  jal        GetRotation__6CFrameFPf
/* D42DC 001D41DC 00000000 */   nop
/* D42E0 001D41E0 9000A427 */  addiu      $4, $sp, 0x90
/* D42E4 001D41E4 2A86040C */  jal        sceVu0UnitMatrix
/* D42E8 001D41E8 00000000 */   nop
/* D42EC 001D41EC 9000A427 */  addiu      $4, $sp, 0x90
/* D42F0 001D41F0 282E8070 */  paddub     $5, $4, $0
/* D42F4 001D41F4 4400ACC7 */  lwc1       $f12, 0x44($sp)
/* D42F8 001D41F8 A686040C */  jal        sceVu0RotMatrixY
/* D42FC 001D41FC 00000000 */   nop
/* D4300 001D4200 D000A427 */  addiu      $4, $sp, 0xD0
/* D4304 001D4204 2A86040C */  jal        sceVu0UnitMatrix
/* D4308 001D4208 00000000 */   nop
/* D430C 001D420C D000A427 */  addiu      $4, $sp, 0xD0
/* D4310 001D4210 282E8070 */  paddub     $5, $4, $0
/* D4314 001D4214 06A30046 */  mov.s      $f12, $f20
/* D4318 001D4218 7C86040C */  jal        sceVu0RotMatrixX
/* D431C 001D421C 00000000 */   nop
/* D4320 001D4220 5000A427 */  addiu      $4, $sp, 0x50
/* D4324 001D4224 9000A527 */  addiu      $5, $sp, 0x90
/* D4328 001D4228 D000A627 */  addiu      $6, $sp, 0xD0
/* D432C 001D422C 6E85040C */  jal        sceVu0MulMatrix
/* D4330 001D4230 00000000 */   nop
/* D4334 001D4234 28260072 */  paddub     $4, $16, $0
/* D4338 001D4238 5000A527 */  addiu      $5, $sp, 0x50
/* D433C 001D423C 3000A627 */  addiu      $6, $sp, 0x30
/* D4340 001D4240 6285040C */  jal        sceVu0ApplyMatrix
/* D4344 001D4244 00000000 */   nop
/* D4348 001D4248 2000BF7B */  lq         $31, 0x20($sp)
/* D434C 001D424C 1000B07B */  lq         $16, 0x10($sp)
/* D4350 001D4250 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* D4354 001D4254 1001BD27 */  addiu      $sp, $sp, 0x110
/* D4358 001D4258 0800E003 */  jr         $31
/* D435C 001D425C 00000000 */   nop
