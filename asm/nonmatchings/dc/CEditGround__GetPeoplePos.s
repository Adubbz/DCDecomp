.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPeoplePos__11CEditGroundFiPf
/* A2E10 001A2D10 90FFBD27 */  addiu      $sp, $sp, -0x70
/* A2E14 001A2D14 4000BF7F */  sq         $31, 0x40($sp)
/* A2E18 001A2D18 3000B37F */  sq         $19, 0x30($sp)
/* A2E1C 001A2D1C 2000B27F */  sq         $18, 0x20($sp)
/* A2E20 001A2D20 1000B17F */  sq         $17, 0x10($sp)
/* A2E24 001A2D24 0000B07F */  sq         $16, 0x0($sp)
/* A2E28 001A2D28 2886C070 */  paddub     $16, $6, $0
/* A2E2C 001A2D2C 28360070 */  paddub     $6, $0, $0
/* A2E30 001A2D30 4C000010 */  b          .L001A2E64
/* A2E34 001A2D34 00000000 */   nop
.L001A2D38:
/* A2E38 001A2D38 80100600 */  sll        $2, $6, 2
/* A2E3C 001A2D3C 21104400 */  addu       $2, $2, $4
/* A2E40 001A2D40 0200013C */  lui        $at, (0x20758 >> 16)
/* A2E44 001A2D44 21084100 */  addu       $at, $2, $at
/* A2E48 001A2D48 5807318C */  lw         $17, (0x20758 & 0xFFFF)($at)
/* A2E4C 001A2D4C 1000238E */  lw         $3, 0x10($17)
/* A2E50 001A2D50 01000224 */  addiu      $2, $0, 0x1
/* A2E54 001A2D54 42006214 */  bne        $3, $2, .L001A2E60
/* A2E58 001A2D58 00000000 */   nop
/* A2E5C 001A2D5C 2000228E */  lw         $2, 0x20($17)
/* A2E60 001A2D60 3F004514 */  bne        $2, $5, .L001A2E60
/* A2E64 001A2D64 00000000 */   nop
/* A2E68 001A2D68 1400328E */  lw         $18, 0x14($17)
/* A2E6C 001A2D6C F000458E */  lw         $5, 0xF0($18)
/* A2E70 001A2D70 0400A004 */  bltz       $5, .L001A2D84
/* A2E74 001A2D74 00000000 */   nop
/* A2E78 001A2D78 2086060C */  jal        GetPartsObject__11CEditGroundFi
/* A2E7C 001A2D7C 00000000 */   nop
/* A2E80 001A2D80 28964070 */  paddub     $18, $2, $0
.L001A2D84:
/* A2E84 001A2D84 04004016 */  bnez       $18, .L001A2D98
/* A2E88 001A2D88 00000000 */   nop
/* A2E8C 001A2D8C 28160070 */  paddub     $2, $0, $0
/* A2E90 001A2D90 3B000010 */  b          .L001A2E80
/* A2E94 001A2D94 00000000 */   nop
.L001A2D98:
/* A2E98 001A2D98 28260072 */  paddub     $4, $16, $0
/* A2E9C 001A2D9C 40002526 */  addiu      $5, $17, 0x40
/* A2EA0 001A2DA0 0C86040C */  jal        sceVu0CopyVector
/* A2EA4 001A2DA4 00000000 */   nop
/* A2EA8 001A2DA8 B000538E */  lw         $19, 0xB0($18)
/* A2EAC 001A2DAC 04006016 */  bnez       $19, .L001A2DC0
/* A2EB0 001A2DB0 00000000 */   nop
/* A2EB4 001A2DB4 28160070 */  paddub     $2, $0, $0
/* A2EB8 001A2DB8 31000010 */  b          .L001A2E80
/* A2EBC 001A2DBC 00000000 */   nop
.L001A2DC0:
/* A2EC0 001A2DC0 28264072 */  paddub     $4, $18, $0
/* A2EC4 001A2DC4 5000A527 */  addiu      $5, $sp, 0x50
/* A2EC8 001A2DC8 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A2ECC 001A2DCC 00000000 */   nop
/* A2ED0 001A2DD0 28266072 */  paddub     $4, $19, $0
/* A2ED4 001A2DD4 5000A527 */  addiu      $5, $sp, 0x50
/* A2ED8 001A2DD8 B89F040C */  jal        SetPosition__6CFrameFPf
/* A2EDC 001A2DDC 00000000 */   nop
/* A2EE0 001A2DE0 28264072 */  paddub     $4, $18, $0
/* A2EE4 001A2DE4 5000A527 */  addiu      $5, $sp, 0x50
/* A2EE8 001A2DE8 A000598E */  lw         $25, 0xA0($18)
/* A2EEC 001A2DEC 5800398F */  lw         $25, 0x58($25)
/* A2EF0 001A2DF0 09F82003 */  jalr       $25
/* A2EF4 001A2DF4 00000000 */   nop
/* A2EF8 001A2DF8 28266072 */  paddub     $4, $19, $0
/* A2EFC 001A2DFC 5000ACC7 */  lwc1       $f12, 0x50($sp)
/* A2F00 001A2E00 5400ADC7 */  lwc1       $f13, 0x54($sp)
/* A2F04 001A2E04 5800AEC7 */  lwc1       $f14, 0x58($sp)
/* A2F08 001A2E08 70A3040C */  jal        SetRotation__6CFrameFfff
/* A2F0C 001A2E0C 00000000 */   nop
/* A2F10 001A2E10 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A2F14 001A2E14 0C0002AE */  sw         $2, 0xC($16)
/* A2F18 001A2E18 28266072 */  paddub     $4, $19, $0
/* A2F1C 001A2E1C 282E0072 */  paddub     $5, $16, $0
/* A2F20 001A2E20 28360072 */  paddub     $6, $16, $0
/* A2F24 001A2E24 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* A2F28 001A2E28 00000000 */   nop
/* A2F2C 001A2E2C 28266072 */  paddub     $4, $19, $0
/* A2F30 001A2E30 6000A527 */  addiu      $5, $sp, 0x60
/* A2F34 001A2E34 8CA3040C */  jal        GetRotation__6CFrameFPf
/* A2F38 001A2E38 00000000 */   nop
/* A2F3C 001A2E3C 540021C6 */  lwc1       $f1, 0x54($17)
/* A2F40 001A2E40 6400A0C7 */  lwc1       $f0, 0x64($sp)
/* A2F44 001A2E44 00030146 */  add.s      $f12, $f0, $f1
/* A2F48 001A2E48 F88E040C */  jal        AngleLimit__Ff
/* A2F4C 001A2E4C 00000000 */   nop
/* A2F50 001A2E50 0C0000E6 */  swc1       $f0, 0xC($16)
/* A2F54 001A2E54 28162072 */  paddub     $2, $17, $0
/* A2F58 001A2E58 09000010 */  b          .L001A2E80
/* A2F5C 001A2E5C 00000000 */   nop
.L001A2E60:
/* A2F60 001A2E60 0100C624 */  addiu      $6, $6, 0x1
.L001A2E64:
/* A2F64 001A2E64 0200013C */  lui        $at, (0x20958 >> 16)
/* A2F68 001A2E68 21088100 */  addu       $at, $4, $at
/* A2F6C 001A2E6C 5809228C */  lw         $2, (0x20958 & 0xFFFF)($at)
/* A2F70 001A2E70 2A10C200 */  slt        $2, $6, $2
/* A2F74 001A2E74 B0FF4014 */  bnez       $2, .L001A2D38
/* A2F78 001A2E78 00000000 */   nop
/* A2F7C 001A2E7C 28160070 */  paddub     $2, $0, $0
.L001A2E80:
/* A2F80 001A2E80 4000BF7B */  lq         $31, 0x40($sp)
/* A2F84 001A2E84 3000B37B */  lq         $19, 0x30($sp)
/* A2F88 001A2E88 2000B27B */  lq         $18, 0x20($sp)
/* A2F8C 001A2E8C 1000B17B */  lq         $17, 0x10($sp)
/* A2F90 001A2E90 0000B07B */  lq         $16, 0x0($sp)
/* A2F94 001A2E94 7000BD27 */  addiu      $sp, $sp, 0x70
/* A2F98 001A2E98 0800E003 */  jr         $31
/* A2F9C 001A2E9C 00000000 */   nop
