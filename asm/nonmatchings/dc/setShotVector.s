.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setShotVector__FPffff
/* D4200 001D4100 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* D4204 001D4104 2000BF7F */  sq         $31, 0x20($sp)
/* D4208 001D4108 1000B07F */  sq         $16, 0x10($sp)
/* D420C 001D410C 0400B5E7 */  swc1       $f21, 0x4($sp)
/* D4210 001D4110 0000B4E7 */  swc1       $f20, 0x0($sp)
/* D4214 001D4114 28868070 */  paddub     $16, $4, $0
/* D4218 001D4118 466D0046 */  mov.s      $f21, $f13
/* D421C 001D411C 06750046 */  mov.s      $f20, $f14
/* D4220 001D4120 000080AC */  sw         $0, 0x0($4)
/* D4224 001D4124 040080AC */  sw         $0, 0x4($4)
/* D4228 001D4128 08008CE4 */  swc1       $f12, 0x8($4)
/* D422C 001D412C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D4230 001D4130 0C0082AC */  sw         $2, 0xC($4)
/* D4234 001D4134 7000A427 */  addiu      $4, $sp, 0x70
/* D4238 001D4138 2A86040C */  jal        sceVu0UnitMatrix
/* D423C 001D413C 00000000 */   nop
/* D4240 001D4140 3000A427 */  addiu      $4, $sp, 0x30
/* D4244 001D4144 7000A527 */  addiu      $5, $sp, 0x70
/* D4248 001D4148 06A30046 */  mov.s      $f12, $f20
/* D424C 001D414C 7C86040C */  jal        sceVu0RotMatrixX
/* D4250 001D4150 00000000 */   nop
/* D4254 001D4154 3000A427 */  addiu      $4, $sp, 0x30
/* D4258 001D4158 282E8070 */  paddub     $5, $4, $0
/* D425C 001D415C 06AB0046 */  mov.s      $f12, $f21
/* D4260 001D4160 A686040C */  jal        sceVu0RotMatrixY
/* D4264 001D4164 00000000 */   nop
/* D4268 001D4168 28260072 */  paddub     $4, $16, $0
/* D426C 001D416C 3000A527 */  addiu      $5, $sp, 0x30
/* D4270 001D4170 28360072 */  paddub     $6, $16, $0
/* D4274 001D4174 6285040C */  jal        sceVu0ApplyMatrix
/* D4278 001D4178 00000000 */   nop
/* D427C 001D417C 2000BF7B */  lq         $31, 0x20($sp)
/* D4280 001D4180 1000B07B */  lq         $16, 0x10($sp)
/* D4284 001D4184 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* D4288 001D4188 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* D428C 001D418C B000BD27 */  addiu      $sp, $sp, 0xB0
/* D4290 001D4190 0800E003 */  jr         $31
/* D4294 001D4194 00000000 */   nop
/* D4298 001D4198 00000000 */  nop
/* D429C 001D419C 00000000 */  nop
