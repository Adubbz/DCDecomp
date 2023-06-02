.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishLineInit__FPf
/* A9CF0 001A9BF0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* A9CF4 001A9BF4 2000BF7F */  sq         $31, 0x20($sp)
/* A9CF8 001A9BF8 1000B17F */  sq         $17, 0x10($sp)
/* A9CFC 001A9BFC 0000B07F */  sq         $16, 0x0($sp)
/* A9D00 001A9C00 28868070 */  paddub     $16, $4, $0
/* A9D04 001A9C04 849380AF */  sw         $0, -0x6C7C($gp)
/* A9D08 001A9C08 809380AF */  sw         $0, -0x6C80($gp)
/* A9D0C 001A9C0C 889380AF */  sw         $0, -0x6C78($gp)
/* A9D10 001A9C10 2700023C */  lui        $2, %hi(_656_3)
/* A9D14 001A9C14 D0AF4224 */  addiu      $2, $2, %lo(_656_3)
/* A9D18 001A9C18 4000A327 */  addiu      $3, $sp, 0x40
/* A9D1C 001A9C1C 00004278 */  lq         $2, 0x0($2)
/* A9D20 001A9C20 0000627C */  sq         $2, 0x0($3)
/* A9D24 001A9C24 D501023C */  lui        $2, %hi(rod_top)
/* A9D28 001A9C28 30644424 */  addiu      $4, $2, %lo(rod_top)
/* A9D2C 001A9C2C 282E0072 */  paddub     $5, $16, $0
/* A9D30 001A9C30 0C86040C */  jal        sceVu0CopyVector
/* A9D34 001A9C34 00000000 */   nop
/* A9D38 001A9C38 3000A427 */  addiu      $4, $sp, 0x30
/* A9D3C 001A9C3C 282E0072 */  paddub     $5, $16, $0
/* A9D40 001A9C40 0C86040C */  jal        sceVu0CopyVector
/* A9D44 001A9C44 00000000 */   nop
/* A9D48 001A9C48 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A9D4C 001A9C4C 3C00A3AF */  sw         $3, 0x3C($sp)
/* A9D50 001A9C50 28860070 */  paddub     $16, $0, $0
/* A9D54 001A9C54 19000010 */  b          .L001A9CBC
/* A9D58 001A9C58 00000000 */   nop
.L001A9C5C:
/* A9D5C 001A9C5C 00891000 */  sll        $17, $16, 4
/* A9D60 001A9C60 D501023C */  lui        $2, %hi(point)
/* A9D64 001A9C64 305E4224 */  addiu      $2, $2, %lo(point)
/* A9D68 001A9C68 21205100 */  addu       $4, $2, $17
/* A9D6C 001A9C6C 3000A527 */  addiu      $5, $sp, 0x30
/* A9D70 001A9C70 0C86040C */  jal        sceVu0CopyVector
/* A9D74 001A9C74 00000000 */   nop
/* A9D78 001A9C78 D501023C */  lui        $2, %hi(old_p)
/* A9D7C 001A9C7C B05F4224 */  addiu      $2, $2, %lo(old_p)
/* A9D80 001A9C80 21205100 */  addu       $4, $2, $17
/* A9D84 001A9C84 3000A527 */  addiu      $5, $sp, 0x30
/* A9D88 001A9C88 0C86040C */  jal        sceVu0CopyVector
/* A9D8C 001A9C8C 00000000 */   nop
/* A9D90 001A9C90 D501023C */  lui        $2, %hi(velo)
/* A9D94 001A9C94 30614224 */  addiu      $2, $2, %lo(velo)
/* A9D98 001A9C98 21205100 */  addu       $4, $2, $17
/* A9D9C 001A9C9C 4000A527 */  addiu      $5, $sp, 0x40
/* A9DA0 001A9CA0 0C86040C */  jal        sceVu0CopyVector
/* A9DA4 001A9CA4 00000000 */   nop
/* A9DA8 001A9CA8 3400A1C7 */  lwc1       $f1, 0x34($sp)
/* A9DAC 001A9CAC B48780C7 */  lwc1       $f0, -0x784C($gp)
/* A9DB0 001A9CB0 01080046 */  sub.s      $f0, $f1, $f0
/* A9DB4 001A9CB4 3400A0E7 */  swc1       $f0, 0x34($sp)
/* A9DB8 001A9CB8 01001026 */  addiu      $16, $16, 0x1
.L001A9CBC:
/* A9DBC 001A9CBC 1800032A */  slti       $3, $16, 0x18
/* A9DC0 001A9CC0 E6FF6014 */  bnez       $3, .L001A9C5C
/* A9DC4 001A9CC4 00000000 */   nop
/* A9DC8 001A9CC8 28860070 */  paddub     $16, $0, $0
/* A9DCC 001A9CCC 0A000010 */  b          .L001A9CF8
/* A9DD0 001A9CD0 00000000 */   nop
.L001A9CD4:
/* A9DD4 001A9CD4 00191000 */  sll        $3, $16, 4
/* A9DD8 001A9CD8 D501023C */  lui        $2, %hi(hookp)
/* A9DDC 001A9CDC B0624224 */  addiu      $2, $2, %lo(hookp)
/* A9DE0 001A9CE0 21204300 */  addu       $4, $2, $3
/* A9DE4 001A9CE4 D501023C */  lui        $2, %hi(D_1D55FA0)
/* A9DE8 001A9CE8 A05F4524 */  addiu      $5, $2, %lo(D_1D55FA0)
/* A9DEC 001A9CEC 0C86040C */  jal        sceVu0CopyVector
/* A9DF0 001A9CF0 00000000 */   nop
/* A9DF4 001A9CF4 01001026 */  addiu      $16, $16, 0x1
.L001A9CF8:
/* A9DF8 001A9CF8 0300032A */  slti       $3, $16, 0x3
/* A9DFC 001A9CFC F5FF6014 */  bnez       $3, .L001A9CD4
/* A9E00 001A9D00 00000000 */   nop
/* A9E04 001A9D04 01001024 */  addiu      $16, $0, 0x1
/* A9E08 001A9D08 0C000010 */  b          .L001A9D3C
/* A9E0C 001A9D0C 00000000 */   nop
.L001A9D10:
/* A9E10 001A9D10 00211000 */  sll        $4, $16, 4
/* A9E14 001A9D14 D501033C */  lui        $3, %hi(D_1D562B4)
/* A9E18 001A9D18 B4626324 */  addiu      $3, $3, %lo(D_1D562B4)
/* A9E1C 001A9D1C 21206400 */  addu       $4, $3, $4
/* A9E20 001A9D20 000081C4 */  lwc1       $f1, 0x0($4)
/* A9E24 001A9D24 0040033C */  lui        $3, (0x40000000 >> 16)
/* A9E28 001A9D28 00008344 */  mtc1       $3, $f0
/* A9E2C 001A9D2C 00000000 */  nop
/* A9E30 001A9D30 01080046 */  sub.s      $f0, $f1, $f0
/* A9E34 001A9D34 000080E4 */  swc1       $f0, 0x0($4)
/* A9E38 001A9D38 01001026 */  addiu      $16, $16, 0x1
.L001A9D3C:
/* A9E3C 001A9D3C 0300032A */  slti       $3, $16, 0x3
/* A9E40 001A9D40 F3FF6014 */  bnez       $3, .L001A9D10
/* A9E44 001A9D44 00000000 */   nop
/* A9E48 001A9D48 D501013C */  lui        $at, (0x1D562C0 >> 16)
/* A9E4C 001A9D4C C06220C4 */  lwc1       $f0, (0x1D562C0 & 0xFFFF)($at)
/* A9E50 001A9D50 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A9E54 001A9D54 00088344 */  mtc1       $3, $f1
/* A9E58 001A9D58 00000000 */  nop
/* A9E5C 001A9D5C 01000146 */  sub.s      $f0, $f0, $f1
/* A9E60 001A9D60 D501013C */  lui        $at, (0x1D562C0 >> 16)
/* A9E64 001A9D64 C06220E4 */  swc1       $f0, (0x1D562C0 & 0xFFFF)($at)
/* A9E68 001A9D68 D501013C */  lui        $at, (0x1D562D0 >> 16)
/* A9E6C 001A9D6C D06220C4 */  lwc1       $f0, (0x1D562D0 & 0xFFFF)($at)
/* A9E70 001A9D70 00000146 */  add.s      $f0, $f0, $f1
/* A9E74 001A9D74 D501013C */  lui        $at, (0x1D562D0 >> 16)
/* A9E78 001A9D78 D06220E4 */  swc1       $f0, (0x1D562D0 & 0xFFFF)($at)
/* A9E7C 001A9D7C 28860070 */  paddub     $16, $0, $0
/* A9E80 001A9D80 11000010 */  b          .L001A9DC8
/* A9E84 001A9D84 00000000 */   nop
.L001A9D88:
/* A9E88 001A9D88 00891000 */  sll        $17, $16, 4
/* A9E8C 001A9D8C D501023C */  lui        $2, %hi(hookop)
/* A9E90 001A9D90 E0624224 */  addiu      $2, $2, %lo(hookop)
/* A9E94 001A9D94 21205100 */  addu       $4, $2, $17
/* A9E98 001A9D98 D501023C */  lui        $2, %hi(hookp)
/* A9E9C 001A9D9C B0624224 */  addiu      $2, $2, %lo(hookp)
/* A9EA0 001A9DA0 21285100 */  addu       $5, $2, $17
/* A9EA4 001A9DA4 0C86040C */  jal        sceVu0CopyVector
/* A9EA8 001A9DA8 00000000 */   nop
/* A9EAC 001A9DAC D501023C */  lui        $2, %hi(hookv)
/* A9EB0 001A9DB0 10634224 */  addiu      $2, $2, %lo(hookv)
/* A9EB4 001A9DB4 21205100 */  addu       $4, $2, $17
/* A9EB8 001A9DB8 4000A527 */  addiu      $5, $sp, 0x40
/* A9EBC 001A9DBC 0C86040C */  jal        sceVu0CopyVector
/* A9EC0 001A9DC0 00000000 */   nop
/* A9EC4 001A9DC4 01001026 */  addiu      $16, $16, 0x1
.L001A9DC8:
/* A9EC8 001A9DC8 0300032A */  slti       $3, $16, 0x3
/* A9ECC 001A9DCC EEFF6014 */  bnez       $3, .L001A9D88
/* A9ED0 001A9DD0 00000000 */   nop
/* A9ED4 001A9DD4 28860070 */  paddub     $16, $0, $0
/* A9ED8 001A9DD8 1A000010 */  b          .L001A9E44
/* A9EDC 001A9DDC 00000000 */   nop
.L001A9DE0:
/* A9EE0 001A9DE0 C0281000 */  sll        $5, $16, 3
/* A9EE4 001A9DE4 2700023C */  lui        $2, %hi(hook_link)
/* A9EE8 001A9DE8 80AF4224 */  addiu      $2, $2, %lo(hook_link)
/* A9EEC 001A9DEC 21104500 */  addu       $2, $2, $5
/* A9EF0 001A9DF0 0000428C */  lw         $2, 0x0($2)
/* A9EF4 001A9DF4 00190200 */  sll        $3, $2, 4
/* A9EF8 001A9DF8 D501023C */  lui        $2, %hi(hookp)
/* A9EFC 001A9DFC B0624224 */  addiu      $2, $2, %lo(hookp)
/* A9F00 001A9E00 21204300 */  addu       $4, $2, $3
/* A9F04 001A9E04 2700023C */  lui        $2, %hi(hook_link + 0x4)
/* A9F08 001A9E08 84AF4224 */  addiu      $2, $2, %lo(hook_link + 0x4)
/* A9F0C 001A9E0C 21104500 */  addu       $2, $2, $5
/* A9F10 001A9E10 0000428C */  lw         $2, 0x0($2)
/* A9F14 001A9E14 00190200 */  sll        $3, $2, 4
/* A9F18 001A9E18 D501023C */  lui        $2, %hi(hookp)
/* A9F1C 001A9E1C B0624224 */  addiu      $2, $2, %lo(hookp)
/* A9F20 001A9E20 21284300 */  addu       $5, $2, $3
/* A9F24 001A9E24 648D040C */  jal        DistVector__FPfPf
/* A9F28 001A9E28 00000000 */   nop
/* A9F2C 001A9E2C 80201000 */  sll        $4, $16, 2
/* A9F30 001A9E30 D501033C */  lui        $3, %hi(hook_dist)
/* A9F34 001A9E34 40636324 */  addiu      $3, $3, %lo(hook_dist)
/* A9F38 001A9E38 21186400 */  addu       $3, $3, $4
/* A9F3C 001A9E3C 000060E4 */  swc1       $f0, 0x0($3)
/* A9F40 001A9E40 01001026 */  addiu      $16, $16, 0x1
.L001A9E44:
/* A9F44 001A9E44 0300032A */  slti       $3, $16, 0x3
/* A9F48 001A9E48 E5FF6014 */  bnez       $3, .L001A9DE0
/* A9F4C 001A9E4C 00000000 */   nop
/* A9F50 001A9E50 28860070 */  paddub     $16, $0, $0
/* A9F54 001A9E54 0A000010 */  b          .L001A9E80
/* A9F58 001A9E58 00000000 */   nop
.L001A9E5C:
/* A9F5C 001A9E5C 00191000 */  sll        $3, $16, 4
/* A9F60 001A9E60 D501023C */  lui        $2, %hi(ukip)
/* A9F64 001A9E64 50634224 */  addiu      $2, $2, %lo(ukip)
/* A9F68 001A9E68 21204300 */  addu       $4, $2, $3
/* A9F6C 001A9E6C D501023C */  lui        $2, %hi(D_1D55F50)
/* A9F70 001A9E70 505F4524 */  addiu      $5, $2, %lo(D_1D55F50)
/* A9F74 001A9E74 0C86040C */  jal        sceVu0CopyVector
/* A9F78 001A9E78 00000000 */   nop
/* A9F7C 001A9E7C 01001026 */  addiu      $16, $16, 0x1
.L001A9E80:
/* A9F80 001A9E80 0400032A */  slti       $3, $16, 0x4
/* A9F84 001A9E84 F5FF6014 */  bnez       $3, .L001A9E5C
/* A9F88 001A9E88 00000000 */   nop
/* A9F8C 001A9E8C 01001024 */  addiu      $16, $0, 0x1
/* A9F90 001A9E90 0A000010 */  b          .L001A9EBC
/* A9F94 001A9E94 00000000 */   nop
.L001A9E98:
/* A9F98 001A9E98 00211000 */  sll        $4, $16, 4
/* A9F9C 001A9E9C D501033C */  lui        $3, %hi(D_1D56354)
/* A9FA0 001A9EA0 54636324 */  addiu      $3, $3, %lo(D_1D56354)
/* A9FA4 001A9EA4 21186400 */  addu       $3, $3, $4
/* A9FA8 001A9EA8 000061C4 */  lwc1       $f1, 0x0($3)
/* A9FAC 001A9EAC 1C8180C7 */  lwc1       $f0, -0x7EE4($gp)
/* A9FB0 001A9EB0 01080046 */  sub.s      $f0, $f1, $f0
/* A9FB4 001A9EB4 000060E4 */  swc1       $f0, 0x0($3)
/* A9FB8 001A9EB8 01001026 */  addiu      $16, $16, 0x1
.L001A9EBC:
/* A9FBC 001A9EBC 0400032A */  slti       $3, $16, 0x4
/* A9FC0 001A9EC0 F5FF6014 */  bnez       $3, .L001A9E98
/* A9FC4 001A9EC4 00000000 */   nop
/* A9FC8 001A9EC8 D501013C */  lui        $at, (0x1D56368 >> 16)
/* A9FCC 001A9ECC 686321C4 */  lwc1       $f1, (0x1D56368 & 0xFFFF)($at)
/* A9FD0 001A9ED0 208180C7 */  lwc1       $f0, -0x7EE0($gp)
/* A9FD4 001A9ED4 00080046 */  add.s      $f0, $f1, $f0
/* A9FD8 001A9ED8 D501013C */  lui        $at, (0x1D56368 >> 16)
/* A9FDC 001A9EDC 686320E4 */  swc1       $f0, (0x1D56368 & 0xFFFF)($at)
/* A9FE0 001A9EE0 D501013C */  lui        $at, (0x1D56370 >> 16)
/* A9FE4 001A9EE4 706320C4 */  lwc1       $f0, (0x1D56370 & 0xFFFF)($at)
/* A9FE8 001A9EE8 1C8182C7 */  lwc1       $f2, -0x7EE4($gp)
/* A9FEC 001A9EEC 00000246 */  add.s      $f0, $f0, $f2
/* A9FF0 001A9EF0 D501013C */  lui        $at, (0x1D56370 >> 16)
/* A9FF4 001A9EF4 706320E4 */  swc1       $f0, (0x1D56370 & 0xFFFF)($at)
/* A9FF8 001A9EF8 D501013C */  lui        $at, (0x1D56378 >> 16)
/* A9FFC 001A9EFC 786320C4 */  lwc1       $f0, (0x1D56378 & 0xFFFF)($at)
/* AA000 001A9F00 003F033C */  lui        $3, (0x3F000000 >> 16)
/* AA004 001A9F04 00088344 */  mtc1       $3, $f1
/* AA008 001A9F08 00000000 */  nop
/* AA00C 001A9F0C 01000146 */  sub.s      $f0, $f0, $f1
/* AA010 001A9F10 D501013C */  lui        $at, (0x1D56378 >> 16)
/* AA014 001A9F14 786320E4 */  swc1       $f0, (0x1D56378 & 0xFFFF)($at)
/* AA018 001A9F18 D501013C */  lui        $at, (0x1D56380 >> 16)
/* AA01C 001A9F1C 806320C4 */  lwc1       $f0, (0x1D56380 & 0xFFFF)($at)
/* AA020 001A9F20 01000246 */  sub.s      $f0, $f0, $f2
/* AA024 001A9F24 D501013C */  lui        $at, (0x1D56380 >> 16)
/* AA028 001A9F28 806320E4 */  swc1       $f0, (0x1D56380 & 0xFFFF)($at)
/* AA02C 001A9F2C D501013C */  lui        $at, (0x1D56388 >> 16)
/* AA030 001A9F30 886320C4 */  lwc1       $f0, (0x1D56388 & 0xFFFF)($at)
/* AA034 001A9F34 01000146 */  sub.s      $f0, $f0, $f1
/* AA038 001A9F38 D501013C */  lui        $at, (0x1D56388 >> 16)
/* AA03C 001A9F3C 886320E4 */  swc1       $f0, (0x1D56388 & 0xFFFF)($at)
/* AA040 001A9F40 28860070 */  paddub     $16, $0, $0
/* AA044 001A9F44 11000010 */  b          .L001A9F8C
/* AA048 001A9F48 00000000 */   nop
.L001A9F4C:
/* AA04C 001A9F4C 00891000 */  sll        $17, $16, 4
/* AA050 001A9F50 D501023C */  lui        $2, %hi(ukiop)
/* AA054 001A9F54 90634224 */  addiu      $2, $2, %lo(ukiop)
/* AA058 001A9F58 21205100 */  addu       $4, $2, $17
/* AA05C 001A9F5C D501023C */  lui        $2, %hi(ukip)
/* AA060 001A9F60 50634224 */  addiu      $2, $2, %lo(ukip)
/* AA064 001A9F64 21285100 */  addu       $5, $2, $17
/* AA068 001A9F68 0C86040C */  jal        sceVu0CopyVector
/* AA06C 001A9F6C 00000000 */   nop
/* AA070 001A9F70 D501023C */  lui        $2, %hi(ukiv)
/* AA074 001A9F74 D0634224 */  addiu      $2, $2, %lo(ukiv)
/* AA078 001A9F78 21205100 */  addu       $4, $2, $17
/* AA07C 001A9F7C 4000A527 */  addiu      $5, $sp, 0x40
/* AA080 001A9F80 0C86040C */  jal        sceVu0CopyVector
/* AA084 001A9F84 00000000 */   nop
/* AA088 001A9F88 01001026 */  addiu      $16, $16, 0x1
.L001A9F8C:
/* AA08C 001A9F8C 0400032A */  slti       $3, $16, 0x4
/* AA090 001A9F90 EEFF6014 */  bnez       $3, .L001A9F4C
/* AA094 001A9F94 00000000 */   nop
/* AA098 001A9F98 28860070 */  paddub     $16, $0, $0
/* AA09C 001A9F9C 1A000010 */  b          .L001AA008
/* AA0A0 001A9FA0 00000000 */   nop
.L001A9FA4:
/* AA0A4 001A9FA4 C0281000 */  sll        $5, $16, 3
/* AA0A8 001A9FA8 2700023C */  lui        $2, %hi(uki_link)
/* AA0AC 001A9FAC A0AF4224 */  addiu      $2, $2, %lo(uki_link)
/* AA0B0 001A9FB0 21104500 */  addu       $2, $2, $5
/* AA0B4 001A9FB4 0000428C */  lw         $2, 0x0($2)
/* AA0B8 001A9FB8 00190200 */  sll        $3, $2, 4
/* AA0BC 001A9FBC D501023C */  lui        $2, %hi(ukip)
/* AA0C0 001A9FC0 50634224 */  addiu      $2, $2, %lo(ukip)
/* AA0C4 001A9FC4 21204300 */  addu       $4, $2, $3
/* AA0C8 001A9FC8 2700023C */  lui        $2, %hi(uki_link + 0x4)
/* AA0CC 001A9FCC A4AF4224 */  addiu      $2, $2, %lo(uki_link + 0x4)
/* AA0D0 001A9FD0 21104500 */  addu       $2, $2, $5
/* AA0D4 001A9FD4 0000428C */  lw         $2, 0x0($2)
/* AA0D8 001A9FD8 00190200 */  sll        $3, $2, 4
/* AA0DC 001A9FDC D501023C */  lui        $2, %hi(ukip)
/* AA0E0 001A9FE0 50634224 */  addiu      $2, $2, %lo(ukip)
/* AA0E4 001A9FE4 21284300 */  addu       $5, $2, $3
/* AA0E8 001A9FE8 648D040C */  jal        DistVector__FPfPf
/* AA0EC 001A9FEC 00000000 */   nop
/* AA0F0 001A9FF0 80201000 */  sll        $4, $16, 2
/* AA0F4 001A9FF4 D501033C */  lui        $3, %hi(uki_dist)
/* AA0F8 001A9FF8 10646324 */  addiu      $3, $3, %lo(uki_dist)
/* AA0FC 001A9FFC 21186400 */  addu       $3, $3, $4
/* AA100 001AA000 000060E4 */  swc1       $f0, 0x0($3)
/* AA104 001AA004 01001026 */  addiu      $16, $16, 0x1
.L001AA008:
/* AA108 001AA008 0600032A */  slti       $3, $16, 0x6
/* AA10C 001AA00C E5FF6014 */  bnez       $3, .L001A9FA4
/* AA110 001AA010 00000000 */   nop
/* AA114 001AA014 2000BF7B */  lq         $31, 0x20($sp)
/* AA118 001AA018 1000B17B */  lq         $17, 0x10($sp)
/* AA11C 001AA01C 0000B07B */  lq         $16, 0x0($sp)
/* AA120 001AA020 5000BD27 */  addiu      $sp, $sp, 0x50
/* AA124 001AA024 0800E003 */  jr         $31
/* AA128 001AA028 00000000 */   nop
/* AA12C 001AA02C 00000000 */  nop
