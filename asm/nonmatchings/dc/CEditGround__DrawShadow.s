.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawShadow__11CEditGroundFiff
/* A3CE0 001A3BE0 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* A3CE4 001A3BE4 6000BF7F */  sq         $31, 0x60($sp)
/* A3CE8 001A3BE8 5000B47F */  sq         $20, 0x50($sp)
/* A3CEC 001A3BEC 4000B37F */  sq         $19, 0x40($sp)
/* A3CF0 001A3BF0 3000B27F */  sq         $18, 0x30($sp)
/* A3CF4 001A3BF4 2000B17F */  sq         $17, 0x20($sp)
/* A3CF8 001A3BF8 1000B07F */  sq         $16, 0x10($sp)
/* A3CFC 001A3BFC 0400B5E7 */  swc1       $f21, 0x4($sp)
/* A3D00 001A3C00 0000B4E7 */  swc1       $f20, 0x0($sp)
/* A3D04 001A3C04 289E8070 */  paddub     $19, $4, $0
/* A3D08 001A3C08 2896A070 */  paddub     $18, $5, $0
/* A3D0C 001A3C0C 46650046 */  mov.s      $f21, $f12
/* A3D10 001A3C10 066D0046 */  mov.s      $f20, $f13
/* A3D14 001A3C14 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A3D18 001A3C18 00008344 */  mtc1       $3, $f0
/* A3D1C 001A3C1C 00000000 */  nop
/* A3D20 001A3C20 34A80046 */  c.lt.s     $f21, $f0
/* A3D24 001A3C24 00000000 */  nop
/* A3D28 001A3C28 06000045 */  bc1f       .L001A3C44
/* A3D2C 001A3C2C 00000000 */   nop
/* A3D30 001A3C30 67FF033C */  lui        $3, (0xFF676980 >> 16)
/* A3D34 001A3C34 80696334 */  ori        $3, $3, (0xFF676980 & 0xFFFF)
/* A3D38 001A3C38 00008344 */  mtc1       $3, $f0
/* A3D3C 001A3C3C 00000000 */  nop
/* A3D40 001A3C40 60058046 */  cvt.s.w    $f21, $f0
.L001A3C44:
/* A3D44 001A3C44 30007126 */  addiu      $17, $19, 0x30
/* A3D48 001A3C48 28860070 */  paddub     $16, $0, $0
/* A3D4C 001A3C4C 6A000010 */  b          .L001A3DF8
/* A3D50 001A3C50 00000000 */   nop
.L001A3C54:
/* A3D54 001A3C54 E400238E */  lw         $3, 0xE4($17)
/* A3D58 001A3C58 65006004 */  bltz       $3, .L001A3DF0
/* A3D5C 001A3C5C 00000000 */   nop
/* A3D60 001A3C60 E800238E */  lw         $3, 0xE8($17)
/* A3D64 001A3C64 62006004 */  bltz       $3, .L001A3DF0
/* A3D68 001A3C68 00000000 */   nop
/* A3D6C 001A3C6C F400238E */  lw         $3, 0xF4($17)
/* A3D70 001A3C70 06006004 */  bltz       $3, .L001A3C8C
/* A3D74 001A3C74 00000000 */   nop
/* A3D78 001A3C78 80180300 */  sll        $3, $3, 2
/* A3D7C 001A3C7C 21187300 */  addu       $3, $3, $19
/* A3D80 001A3C80 1400638C */  lw         $3, 0x14($3)
/* A3D84 001A3C84 5A006010 */  beqz       $3, .L001A3DF0
/* A3D88 001A3C88 00000000 */   nop
.L001A3C8C:
/* A3D8C 001A3C8C 0100013C */  lui        $at, (0x15F2C >> 16)
/* A3D90 001A3C90 21086102 */  addu       $at, $19, $at
/* A3D94 001A3C94 2C5F21C4 */  lwc1       $f1, (0x15F2C & 0xFFFF)($at)
/* A3D98 001A3C98 00008044 */  mtc1       $0, $f0
/* A3D9C 001A3C9C 00000000 */  nop
/* A3DA0 001A3CA0 36080046 */  c.le.s     $f1, $f0
/* A3DA4 001A3CA4 00000000 */  nop
/* A3DA8 001A3CA8 17000145 */  bc1t       .L001A3D08
/* A3DAC 001A3CAC 00000000 */   nop
/* A3DB0 001A3CB0 28262072 */  paddub     $4, $17, $0
/* A3DB4 001A3CB4 9000A527 */  addiu      $5, $sp, 0x90
/* A3DB8 001A3CB8 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A3DBC 001A3CBC 00000000 */   nop
/* A3DC0 001A3CC0 9000A427 */  addiu      $4, $sp, 0x90
/* A3DC4 001A3CC4 0100013C */  lui        $at, (0x15F20 >> 16)
/* A3DC8 001A3CC8 205F2134 */  ori        $at, $at, (0x15F20 & 0xFFFF)
/* A3DCC 001A3CCC 21286102 */  addu       $5, $19, $at
/* A3DD0 001A3CD0 648D040C */  jal        DistVector__FPfPf
/* A3DD4 001A3CD4 00000000 */   nop
/* A3DD8 001A3CD8 0100013C */  lui        $at, (0x15F2C >> 16)
/* A3DDC 001A3CDC 21086102 */  addu       $at, $19, $at
/* A3DE0 001A3CE0 2C5F21C4 */  lwc1       $f1, (0x15F2C & 0xFFFF)($at)
/* A3DE4 001A3CE4 36000146 */  c.le.s     $f0, $f1
/* A3DE8 001A3CE8 00000000 */  nop
/* A3DEC 001A3CEC 06000145 */  bc1t       .L001A3D08
/* A3DF0 001A3CF0 00000000 */   nop
/* A3DF4 001A3CF4 28262072 */  paddub     $4, $17, $0
/* A3DF8 001A3CF8 386B060C */  jal        ChangeDigData__9CMapPartsFv
/* A3DFC 001A3CFC 00000000 */   nop
/* A3E00 001A3D00 3B004010 */  beqz       $2, .L001A3DF0
/* A3E04 001A3D04 00000000 */   nop
.L001A3D08:
/* A3E08 001A3D08 28262072 */  paddub     $4, $17, $0
/* A3E0C 001A3D0C 7000A527 */  addiu      $5, $sp, 0x70
/* A3E10 001A3D10 EC69060C */  jal        GetPosition__9CMapPartsFPf
/* A3E14 001A3D14 00000000 */   nop
/* A3E18 001A3D18 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A3E1C 001A3D1C 7C00A2AF */  sw         $2, 0x7C($sp)
/* A3E20 001A3D20 8000A427 */  addiu      $4, $sp, 0x80
/* A3E24 001A3D24 C701023C */  lui        $2, %hi(D_1C75530)
/* A3E28 001A3D28 30554524 */  addiu      $5, $2, %lo(D_1C75530)
/* A3E2C 001A3D2C 7000A627 */  addiu      $6, $sp, 0x70
/* A3E30 001A3D30 6285040C */  jal        sceVu0ApplyMatrix
/* A3E34 001A3D34 00000000 */   nop
/* A3E38 001A3D38 200121C6 */  lwc1       $f1, 0x120($17)
/* A3E3C 001A3D3C 00008044 */  mtc1       $0, $f0
/* A3E40 001A3D40 00000000 */  nop
/* A3E44 001A3D44 36080046 */  c.le.s     $f1, $f0
/* A3E48 001A3D48 00000000 */  nop
/* A3E4C 001A3D4C 0B000145 */  bc1t       .L001A3D7C
/* A3E50 001A3D50 00000000 */   nop
/* A3E54 001A3D54 09004016 */  bnez       $18, .L001A3D7C
/* A3E58 001A3D58 00000000 */   nop
/* A3E5C 001A3D5C 8000A427 */  addiu      $4, $sp, 0x80
/* A3E60 001A3D60 588D040C */  jal        DistVector__FPf
/* A3E64 001A3D64 00000000 */   nop
/* A3E68 001A3D68 200121C6 */  lwc1       $f1, 0x120($17)
/* A3E6C 001A3D6C 34080046 */  c.lt.s     $f1, $f0
/* A3E70 001A3D70 00000000 */  nop
/* A3E74 001A3D74 1E000145 */  bc1t       .L001A3DF0
/* A3E78 001A3D78 00000000 */   nop
.L001A3D7C:
/* A3E7C 001A3D7C 8800B427 */  addiu      $20, $sp, 0x88
/* A3E80 001A3D80 000080C6 */  lwc1       $f0, 0x0($20)
/* A3E84 001A3D84 36001546 */  c.le.s     $f0, $f21
/* A3E88 001A3D88 00000000 */  nop
/* A3E8C 001A3D8C 18000145 */  bc1t       .L001A3DF0
/* A3E90 001A3D90 00000000 */   nop
/* A3E94 001A3D94 34001446 */  c.lt.s     $f0, $f20
/* A3E98 001A3D98 00000000 */  nop
/* A3E9C 001A3D9C 14000045 */  bc1f       .L001A3DF0
/* A3EA0 001A3DA0 00000000 */   nop
/* A3EA4 001A3DA4 28262072 */  paddub     $4, $17, $0
/* A3EA8 001A3DA8 1C5E050C */  jal        DrawShade__10CMapObjectFv
/* A3EAC 001A3DAC 00000000 */   nop
/* A3EB0 001A3DB0 D400238E */  lw         $3, 0xD4($17)
/* A3EB4 001A3DB4 0E006010 */  beqz       $3, .L001A3DF0
/* A3EB8 001A3DB8 00000000 */   nop
/* A3EBC 001A3DBC 2B281200 */  sltu       $5, $0, $18
/* A3EC0 001A3DC0 000081C6 */  lwc1       $f1, 0x0($20)
/* A3EC4 001A3DC4 9643023C */  lui        $2, (0x43960000 >> 16)
/* A3EC8 001A3DC8 00008244 */  mtc1       $2, $f0
/* A3ECC 001A3DCC 00000000 */  nop
/* A3ED0 001A3DD0 36080046 */  c.le.s     $f1, $f0
/* A3ED4 001A3DD4 00000000 */  nop
/* A3ED8 001A3DD8 02000145 */  bc1t       .L001A3DE4
/* A3EDC 001A3DDC 00000000 */   nop
/* A3EE0 001A3DE0 01000524 */  addiu      $5, $0, 0x1
.L001A3DE4:
/* A3EE4 001A3DE4 28262072 */  paddub     $4, $17, $0
/* A3EE8 001A3DE8 D85D050C */  jal        DrawShadow__10CMapObjectFi
/* A3EEC 001A3DEC 00000000 */   nop
.L001A3DF0:
/* A3EF0 001A3DF0 01001026 */  addiu      $16, $16, 0x1
/* A3EF4 001A3DF4 A0023126 */  addiu      $17, $17, 0x2A0
.L001A3DF8:
/* A3EF8 001A3DF8 8000032A */  slti       $3, $16, 0x80
/* A3EFC 001A3DFC 95FF6014 */  bnez       $3, .L001A3C54
/* A3F00 001A3E00 00000000 */   nop
/* A3F04 001A3E04 28860070 */  paddub     $16, $0, $0
/* A3F08 001A3E08 3A000010 */  b          .L001A3EF4
/* A3F0C 001A3E0C 00000000 */   nop
.L001A3E10:
/* A3F10 001A3E10 C0181000 */  sll        $3, $16, 3
/* A3F14 001A3E14 23207000 */  subu       $4, $3, $16
/* A3F18 001A3E18 80180400 */  sll        $3, $4, 2
/* A3F1C 001A3E1C 23186400 */  subu       $3, $3, $4
/* A3F20 001A3E20 40190300 */  sll        $3, $3, 5
/* A3F24 001A3E24 21186302 */  addu       $3, $19, $3
/* A3F28 001A3E28 0100013C */  lui        $at, (0x15F40 >> 16)
/* A3F2C 001A3E2C 405F2134 */  ori        $at, $at, (0x15F40 & 0xFFFF)
/* A3F30 001A3E30 21886100 */  addu       $17, $3, $at
/* A3F34 001A3E34 E400238E */  lw         $3, 0xE4($17)
/* A3F38 001A3E38 2D006004 */  bltz       $3, .L001A3EF0
/* A3F3C 001A3E3C 00000000 */   nop
/* A3F40 001A3E40 E800238E */  lw         $3, 0xE8($17)
/* A3F44 001A3E44 2A006004 */  bltz       $3, .L001A3EF0
/* A3F48 001A3E48 00000000 */   nop
/* A3F4C 001A3E4C 7000A427 */  addiu      $4, $sp, 0x70
/* A3F50 001A3E50 10002526 */  addiu      $5, $17, 0x10
/* A3F54 001A3E54 0C86040C */  jal        sceVu0CopyVector
/* A3F58 001A3E58 00000000 */   nop
/* A3F5C 001A3E5C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* A3F60 001A3E60 7C00A2AF */  sw         $2, 0x7C($sp)
/* A3F64 001A3E64 8000A427 */  addiu      $4, $sp, 0x80
/* A3F68 001A3E68 C701023C */  lui        $2, %hi(D_1C75530)
/* A3F6C 001A3E6C 30554524 */  addiu      $5, $2, %lo(D_1C75530)
/* A3F70 001A3E70 7000A627 */  addiu      $6, $sp, 0x70
/* A3F74 001A3E74 6285040C */  jal        sceVu0ApplyMatrix
/* A3F78 001A3E78 00000000 */   nop
/* A3F7C 001A3E7C 8800B427 */  addiu      $20, $sp, 0x88
/* A3F80 001A3E80 000080C6 */  lwc1       $f0, 0x0($20)
/* A3F84 001A3E84 36001546 */  c.le.s     $f0, $f21
/* A3F88 001A3E88 00000000 */  nop
/* A3F8C 001A3E8C 18000145 */  bc1t       .L001A3EF0
/* A3F90 001A3E90 00000000 */   nop
/* A3F94 001A3E94 34001446 */  c.lt.s     $f0, $f20
/* A3F98 001A3E98 00000000 */  nop
/* A3F9C 001A3E9C 14000045 */  bc1f       .L001A3EF0
/* A3FA0 001A3EA0 00000000 */   nop
/* A3FA4 001A3EA4 28262072 */  paddub     $4, $17, $0
/* A3FA8 001A3EA8 1C5E050C */  jal        DrawShade__10CMapObjectFv
/* A3FAC 001A3EAC 00000000 */   nop
/* A3FB0 001A3EB0 D400238E */  lw         $3, 0xD4($17)
/* A3FB4 001A3EB4 0E006010 */  beqz       $3, .L001A3EF0
/* A3FB8 001A3EB8 00000000 */   nop
/* A3FBC 001A3EBC 2B281200 */  sltu       $5, $0, $18
/* A3FC0 001A3EC0 000081C6 */  lwc1       $f1, 0x0($20)
/* A3FC4 001A3EC4 9643023C */  lui        $2, (0x43960000 >> 16)
/* A3FC8 001A3EC8 00008244 */  mtc1       $2, $f0
/* A3FCC 001A3ECC 00000000 */  nop
/* A3FD0 001A3ED0 36080046 */  c.le.s     $f1, $f0
/* A3FD4 001A3ED4 00000000 */  nop
/* A3FD8 001A3ED8 02000145 */  bc1t       .L001A3EE4
/* A3FDC 001A3EDC 00000000 */   nop
/* A3FE0 001A3EE0 01000524 */  addiu      $5, $0, 0x1
.L001A3EE4:
/* A3FE4 001A3EE4 28262072 */  paddub     $4, $17, $0
/* A3FE8 001A3EE8 D85D050C */  jal        DrawShadow__10CMapObjectFi
/* A3FEC 001A3EEC 00000000 */   nop
.L001A3EF0:
/* A3FF0 001A3EF0 01001026 */  addiu      $16, $16, 0x1
.L001A3EF4:
/* A3FF4 001A3EF4 4000032A */  slti       $3, $16, 0x40
/* A3FF8 001A3EF8 C5FF6014 */  bnez       $3, .L001A3E10
/* A3FFC 001A3EFC 00000000 */   nop
/* A4000 001A3F00 6000BF7B */  lq         $31, 0x60($sp)
/* A4004 001A3F04 5000B47B */  lq         $20, 0x50($sp)
/* A4008 001A3F08 4000B37B */  lq         $19, 0x40($sp)
/* A400C 001A3F0C 3000B27B */  lq         $18, 0x30($sp)
/* A4010 001A3F10 2000B17B */  lq         $17, 0x20($sp)
/* A4014 001A3F14 1000B07B */  lq         $16, 0x10($sp)
/* A4018 001A3F18 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* A401C 001A3F1C 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* A4020 001A3F20 A000BD27 */  addiu      $sp, $sp, 0xA0
/* A4024 001A3F24 0800E003 */  jr         $31
/* A4028 001A3F28 00000000 */   nop
/* A402C 001A3F2C 00000000 */  nop
