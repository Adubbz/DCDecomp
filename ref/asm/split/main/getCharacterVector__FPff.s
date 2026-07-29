.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel getCharacterVector__FPff
/* 0D42A0 001D41A0 F0FEBD27 */  addiu       $29, $29, -0x110
/* 0D42A4 001D41A4 2000BF7F */  sq          $31, 0x20($29)
/* 0D42A8 001D41A8 1000B07F */  sq          $16, 0x10($29)
/* 0D42AC 001D41AC 0000B4E7 */  swc1        $f20, 0x0($29)
/* 0D42B0 001D41B0 28868070 */  paddub      $16, $4, $0
/* 0D42B4 001D41B4 06650046 */  mov.s       $f20, $f12
/* 0D42B8 001D41B8 2800023C */  lui         $2, %hi(LIT_792__2)
/* 0D42BC 001D41BC D0EA4224 */  addiu       $2, $2, %lo(LIT_792__2)
/* 0D42C0 001D41C0 3000A327 */  addiu       $3, $29, 0x30
/* 0D42C4 001D41C4 00004278 */  lq          $2, 0x0($2)
/* 0D42C8 001D41C8 0000627C */  sq          $2, 0x0($3)
/* 0D42CC 001D41CC EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 0D42D0 001D41D0 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 0D42D4 001D41D4 4000A527 */  addiu       $5, $29, 0x40
/* 0D42D8 001D41D8 8CA3040C */  jal         GetRotation__6CFrameFPf
/* 0D42DC 001D41DC 00000000 */   nop
/* 0D42E0 001D41E0 9000A427 */  addiu       $4, $29, 0x90
/* 0D42E4 001D41E4 2A86040C */  jal         sceVu0UnitMatrix
/* 0D42E8 001D41E8 00000000 */   nop
/* 0D42EC 001D41EC 9000A427 */  addiu       $4, $29, 0x90
/* 0D42F0 001D41F0 282E8070 */  paddub      $5, $4, $0
/* 0D42F4 001D41F4 4400ACC7 */  lwc1        $f12, 0x44($29)
/* 0D42F8 001D41F8 A686040C */  jal         sceVu0RotMatrixY
/* 0D42FC 001D41FC 00000000 */   nop
/* 0D4300 001D4200 D000A427 */  addiu       $4, $29, 0xD0
/* 0D4304 001D4204 2A86040C */  jal         sceVu0UnitMatrix
/* 0D4308 001D4208 00000000 */   nop
/* 0D430C 001D420C D000A427 */  addiu       $4, $29, 0xD0
/* 0D4310 001D4210 282E8070 */  paddub      $5, $4, $0
/* 0D4314 001D4214 06A30046 */  mov.s       $f12, $f20
/* 0D4318 001D4218 7C86040C */  jal         sceVu0RotMatrixX
/* 0D431C 001D421C 00000000 */   nop
/* 0D4320 001D4220 5000A427 */  addiu       $4, $29, 0x50
/* 0D4324 001D4224 9000A527 */  addiu       $5, $29, 0x90
/* 0D4328 001D4228 D000A627 */  addiu       $6, $29, 0xD0
/* 0D432C 001D422C 6E85040C */  jal         sceVu0MulMatrix
/* 0D4330 001D4230 00000000 */   nop
/* 0D4334 001D4234 28260072 */  paddub      $4, $16, $0
/* 0D4338 001D4238 5000A527 */  addiu       $5, $29, 0x50
/* 0D433C 001D423C 3000A627 */  addiu       $6, $29, 0x30
/* 0D4340 001D4240 6285040C */  jal         sceVu0ApplyMatrix
/* 0D4344 001D4244 00000000 */   nop
/* 0D4348 001D4248 2000BF7B */  lq          $31, 0x20($29)
/* 0D434C 001D424C 1000B07B */  lq          $16, 0x10($29)
/* 0D4350 001D4250 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 0D4354 001D4254 1001BD27 */  addiu       $29, $29, 0x110
/* 0D4358 001D4258 0800E003 */  jr          $31
/* 0D435C 001D425C 00000000 */   nop
