.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawFireFreeStyle__11CDungeonMapFP9CFrameVu1P13CCameraFollow
/* C3DC0 001C3CC0 00FFBD27 */  addiu      $sp, $sp, -0x100
/* C3DC4 001C3CC4 9000BF7F */  sq         $31, 0x90($sp)
/* C3DC8 001C3CC8 8000B77F */  sq         $23, 0x80($sp)
/* C3DCC 001C3CCC 7000B67F */  sq         $22, 0x70($sp)
/* C3DD0 001C3CD0 6000B57F */  sq         $21, 0x60($sp)
/* C3DD4 001C3CD4 5000B47F */  sq         $20, 0x50($sp)
/* C3DD8 001C3CD8 4000B37F */  sq         $19, 0x40($sp)
/* C3DDC 001C3CDC 3000B27F */  sq         $18, 0x30($sp)
/* C3DE0 001C3CE0 2000B17F */  sq         $17, 0x20($sp)
/* C3DE4 001C3CE4 1000B07F */  sq         $16, 0x10($sp)
/* C3DE8 001C3CE8 0C00B7E7 */  swc1       $f23, 0xC($sp)
/* C3DEC 001C3CEC 0800B6E7 */  swc1       $f22, 0x8($sp)
/* C3DF0 001C3CF0 0400B5E7 */  swc1       $f21, 0x4($sp)
/* C3DF4 001C3CF4 0000B4E7 */  swc1       $f20, 0x0($sp)
/* C3DF8 001C3CF8 28AE8070 */  paddub     $21, $4, $0
/* C3DFC 001C3CFC 28A6C070 */  paddub     $20, $6, $0
/* C3E00 001C3D00 E000A427 */  addiu      $4, $sp, 0xE0
/* C3E04 001C3D04 2002A524 */  addiu      $5, $5, 0x220
/* C3E08 001C3D08 0C86040C */  jal        sceVu0CopyVector
/* C3E0C 001C3D0C 00000000 */   nop
/* C3E10 001C3D10 28268072 */  paddub     $4, $20, $0
/* C3E14 001C3D14 C000A527 */  addiu      $5, $sp, 0xC0
/* C3E18 001C3D18 9C91040C */  jal        GetPos__7CCameraFPf
/* C3E1C 001C3D1C 00000000 */   nop
/* C3E20 001C3D20 C000A427 */  addiu      $4, $sp, 0xC0
/* C3E24 001C3D24 282E8070 */  paddub     $5, $4, $0
/* C3E28 001C3D28 80808CC7 */  lwc1       $f12, -0x7F80($gp)
/* C3E2C 001C3D2C 4688040C */  jal        sceVu0ScaleVectorXYZ
/* C3E30 001C3D30 00000000 */   nop
/* C3E34 001C3D34 C701023C */  lui        $2, %hi(TexManager)
/* C3E38 001C3D38 70584424 */  addiu      $4, $2, %lo(TexManager)
/* C3E3C 001C3D3C 2A00023C */  lui        $2, %hi(_1559)
/* C3E40 001C3D40 48BE4524 */  addiu      $5, $2, %lo(_1559)
/* C3E44 001C3D44 FFFF0624 */  addiu      $6, $0, -0x1
/* C3E48 001C3D48 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* C3E4C 001C3D4C 00000000 */   nop
/* C3E50 001C3D50 28864070 */  paddub     $16, $2, $0
/* C3E54 001C3D54 C701023C */  lui        $2, %hi(TexManager)
/* C3E58 001C3D58 70584424 */  addiu      $4, $2, %lo(TexManager)
/* C3E5C 001C3D5C 2A00023C */  lui        $2, %hi(_1560)
/* C3E60 001C3D60 58BE4524 */  addiu      $5, $2, %lo(_1560)
/* C3E64 001C3D64 FFFF0624 */  addiu      $6, $0, -0x1
/* C3E68 001C3D68 B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* C3E6C 001C3D6C 00000000 */   nop
/* C3E70 001C3D70 5000A426 */  addiu      $4, $21, 0x50
/* C3E74 001C3D74 282E0072 */  paddub     $5, $16, $0
/* C3E78 001C3D78 28364070 */  paddub     $6, $2, $0
/* C3E7C 001C3D7C A886050C */  jal        SetTexture__9CFireOmniFP8CTextureP8CTexture
/* C3E80 001C3D80 00000000 */   nop
/* C3E84 001C3D84 5000A426 */  addiu      $4, $21, 0x50
/* C3E88 001C3D88 F085050C */  jal        FireCreate__9CFireOmniFv
/* C3E8C 001C3D8C 00000000 */   nop
/* C3E90 001C3D90 7A46023C */  lui        $2, (0x467A0000 >> 16)
/* C3E94 001C3D94 00A08244 */  mtc1       $2, $f20
/* C3E98 001C3D98 288E0070 */  paddub     $17, $0, $0
/* C3E9C 001C3D9C 8B000010 */  b          .L001C3FCC
/* C3EA0 001C3DA0 00000000 */   nop
.L001C3DA4:
/* C3EA4 001C3DA4 2110B202 */  addu       $2, $21, $18
/* C3EA8 001C3DA8 B000A427 */  addiu      $4, $sp, 0xB0
/* C3EAC 001C3DAC A0054524 */  addiu      $5, $2, 0x5A0
/* C3EB0 001C3DB0 0C86040C */  jal        sceVu0CopyVector
/* C3EB4 001C3DB4 00000000 */   nop
/* C3EB8 001C3DB8 28860070 */  paddub     $16, $0, $0
/* C3EBC 001C3DBC 7D000010 */  b          .L001C3FB4
/* C3EC0 001C3DC0 00000000 */   nop
.L001C3DC4:
/* C3EC4 001C3DC4 21185502 */  addu       $3, $18, $21
/* C3EC8 001C3DC8 00111000 */  sll        $2, $16, 4
/* C3ECC 001C3DCC 21104300 */  addu       $2, $2, $3
/* C3ED0 001C3DD0 B00440C4 */  lwc1       $f0, 0x4B0($2)
/* C3ED4 001C3DD4 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* C3ED8 001C3DD8 B40440C4 */  lwc1       $f0, 0x4B4($2)
/* C3EDC 001C3DDC A400B627 */  addiu      $22, $sp, 0xA4
/* C3EE0 001C3DE0 0000C0E6 */  swc1       $f0, 0x0($22)
/* C3EE4 001C3DE4 B80440C4 */  lwc1       $f0, 0x4B8($2)
/* C3EE8 001C3DE8 A800B327 */  addiu      $19, $sp, 0xA8
/* C3EEC 001C3DEC 000060E6 */  swc1       $f0, 0x0($19)
/* C3EF0 001C3DF0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C3EF4 001C3DF4 AC00A2AF */  sw         $2, 0xAC($sp)
/* C3EF8 001C3DF8 21100302 */  addu       $2, $16, $3
/* C3EFC 001C3DFC 10055780 */  lb         $23, 0x510($2)
/* C3F00 001C3E00 000675C4 */  lwc1       $f21, 0x600($3)
/* C3F04 001C3E04 00008044 */  mtc1       $0, $f0
/* C3F08 001C3E08 00000000 */  nop
/* C3F0C 001C3E0C 32001546 */  c.eq.s     $f0, $f21
/* C3F10 001C3E10 00000000 */  nop
/* C3F14 001C3E14 2C000145 */  bc1t       .L001C3EC8
/* C3F18 001C3E18 00000000 */   nop
/* C3F1C 001C3E1C B442023C */  lui        $2, (0x42B40000 >> 16)
/* C3F20 001C3E20 00088244 */  mtc1       $2, $f1
/* C3F24 001C3E24 8040023C */  lui        $2, (0x40800000 >> 16)
/* C3F28 001C3E28 00008244 */  mtc1       $2, $f0
/* C3F2C 001C3E2C 00000000 */  nop
/* C3F30 001C3E30 01001546 */  sub.s      $f0, $f0, $f21
/* C3F34 001C3E34 42080046 */  mul.s      $f1, $f1, $f0
/* C3F38 001C3E38 B08080C7 */  lwc1       $f0, -0x7F50($gp)
/* C3F3C 001C3E3C 42000146 */  mul.s      $f1, $f0, $f1
/* C3F40 001C3E40 3443023C */  lui        $2, (0x43340000 >> 16)
/* C3F44 001C3E44 00008244 */  mtc1       $2, $f0
/* C3F48 001C3E48 00000000 */  nop
/* C3F4C 001C3E4C 430D0046 */  div.s      $f21, $f1, $f0
/* C3F50 001C3E50 06AB0046 */  mov.s      $f12, $f21
/* C3F54 001C3E54 2876040C */  jal        sinf
/* C3F58 001C3E58 00000000 */   nop
/* C3F5C 001C3E5C 000061C6 */  lwc1       $f1, 0x0($19)
/* C3F60 001C3E60 47080046 */  neg.s      $f1, $f1
/* C3F64 001C3E64 820D0046 */  mul.s      $f22, $f1, $f0
/* C3F68 001C3E68 06AB0046 */  mov.s      $f12, $f21
/* C3F6C 001C3E6C AC75040C */  jal        cosf
/* C3F70 001C3E70 00000000 */   nop
/* C3F74 001C3E74 A000A1C7 */  lwc1       $f1, 0xA0($sp)
/* C3F78 001C3E78 02080046 */  mul.s      $f0, $f1, $f0
/* C3F7C 001C3E7C C1B50046 */  sub.s      $f23, $f22, $f0
/* C3F80 001C3E80 06AB0046 */  mov.s      $f12, $f21
/* C3F84 001C3E84 2876040C */  jal        sinf
/* C3F88 001C3E88 00000000 */   nop
/* C3F8C 001C3E8C A000A1C7 */  lwc1       $f1, 0xA0($sp)
/* C3F90 001C3E90 47080046 */  neg.s      $f1, $f1
/* C3F94 001C3E94 820D0046 */  mul.s      $f22, $f1, $f0
/* C3F98 001C3E98 06AB0046 */  mov.s      $f12, $f21
/* C3F9C 001C3E9C AC75040C */  jal        cosf
/* C3FA0 001C3EA0 00000000 */   nop
/* C3FA4 001C3EA4 000061C6 */  lwc1       $f1, 0x0($19)
/* C3FA8 001C3EA8 02080046 */  mul.s      $f0, $f1, $f0
/* C3FAC 001C3EAC C0B00046 */  add.s      $f3, $f22, $f0
/* C3FB0 001C3EB0 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* C3FB4 001C3EB4 00008244 */  mtc1       $2, $f0
/* C3FB8 001C3EB8 00000000 */  nop
/* C3FBC 001C3EBC C2BD0046 */  mul.s      $f23, $f23, $f0
/* C3FC0 001C3EC0 04000010 */  b          .L001C3ED4
/* C3FC4 001C3EC4 00000000 */   nop
.L001C3EC8:
/* C3FC8 001C3EC8 A000B7C7 */  lwc1       $f23, 0xA0($sp)
/* C3FCC 001C3ECC 000063C6 */  lwc1       $f3, 0x0($19)
/* C3FD0 001C3ED0 00000000 */  nop
.L001C3ED4:
/* C3FD4 001C3ED4 2041023C */  lui        $2, (0x41200000 >> 16)
/* C3FD8 001C3ED8 00108244 */  mtc1       $2, $f2
/* C3FDC 001C3EDC B000A0C7 */  lwc1       $f0, 0xB0($sp)
/* C3FE0 001C3EE0 03000246 */  div.s      $f0, $f0, $f2
/* C3FE4 001C3EE4 00001746 */  add.s      $f0, $f0, $f23
/* C3FE8 001C3EE8 A000A0E7 */  swc1       $f0, 0xA0($sp)
/* C3FEC 001C3EEC 0000C1C6 */  lwc1       $f1, 0x0($22)
/* C3FF0 001C3EF0 B400A0C7 */  lwc1       $f0, 0xB4($sp)
/* C3FF4 001C3EF4 03000246 */  div.s      $f0, $f0, $f2
/* C3FF8 001C3EF8 00080046 */  add.s      $f0, $f1, $f0
/* C3FFC 001C3EFC 0000C0E6 */  swc1       $f0, 0x0($22)
/* C4000 001C3F00 B800A0C7 */  lwc1       $f0, 0xB8($sp)
/* C4004 001C3F04 03000246 */  div.s      $f0, $f0, $f2
/* C4008 001C3F08 40000346 */  add.s      $f1, $f0, $f3
/* C400C 001C3F0C 000061E6 */  swc1       $f1, 0x0($19)
/* C4010 001C3F10 0000C3C6 */  lwc1       $f3, 0x0($22)
/* C4014 001C3F14 A000A0C7 */  lwc1       $f0, 0xA0($sp)
/* C4018 001C3F18 02100046 */  mul.s      $f0, $f2, $f0
/* C401C 001C3F1C 7000A0E6 */  swc1       $f0, 0x70($21)
/* C4020 001C3F20 02100346 */  mul.s      $f0, $f2, $f3
/* C4024 001C3F24 7400A0E6 */  swc1       $f0, 0x74($21)
/* C4028 001C3F28 02100146 */  mul.s      $f0, $f2, $f1
/* C402C 001C3F2C 7800A0E6 */  swc1       $f0, 0x78($21)
/* C4030 001C3F30 803F023C */  lui        $2, (0x3F800000 >> 16)
/* C4034 001C3F34 7C00A2AE */  sw         $2, 0x7C($21)
/* C4038 001C3F38 00608244 */  mtc1       $2, $f12
/* C403C 001C3F3C 7041023C */  lui        $2, (0x41700000 >> 16)
/* C4040 001C3F40 00688244 */  mtc1       $2, $f13
/* C4044 001C3F44 5000A426 */  addiu      $4, $21, 0x50
/* C4048 001C3F48 01000524 */  addiu      $5, $0, 0x1
/* C404C 001C3F4C 2836A070 */  paddub     $6, $5, $0
/* C4050 001C3F50 283E8072 */  paddub     $7, $20, $0
/* C4054 001C3F54 E000A827 */  addiu      $8, $sp, 0xE0
/* C4058 001C3F58 284EE072 */  paddub     $9, $23, $0
/* C405C 001C3F5C B086050C */  jal        DrawFire__9CFireOmniFiiP7CCameraPffif
/* C4060 001C3F60 00000000 */   nop
/* C4064 001C3F64 C000A427 */  addiu      $4, $sp, 0xC0
/* C4068 001C3F68 A000A527 */  addiu      $5, $sp, 0xA0
/* C406C 001C3F6C 648D040C */  jal        DistVector__FPfPf
/* C4070 001C3F70 00000000 */   nop
/* C4074 001C3F74 34A00046 */  c.lt.s     $f20, $f0
/* C4078 001C3F78 00000000 */  nop
/* C407C 001C3F7C 0C000145 */  bc1t       .L001C3FB0
/* C4080 001C3F80 00000000 */   nop
/* C4084 001C3F84 06050046 */  mov.s      $f20, $f0
/* C4088 001C3F88 D000A427 */  addiu      $4, $sp, 0xD0
/* C408C 001C3F8C A000A527 */  addiu      $5, $sp, 0xA0
/* C4090 001C3F90 0C86040C */  jal        sceVu0CopyVector
/* C4094 001C3F94 00000000 */   nop
/* C4098 001C3F98 2041023C */  lui        $2, (0x41200000 >> 16)
/* C409C 001C3F9C 00608244 */  mtc1       $2, $f12
/* C40A0 001C3FA0 D000A427 */  addiu      $4, $sp, 0xD0
/* C40A4 001C3FA4 282E8070 */  paddub     $5, $4, $0
/* C40A8 001C3FA8 4688040C */  jal        sceVu0ScaleVectorXYZ
/* C40AC 001C3FAC 00000000 */   nop
.L001C3FB0:
/* C40B0 001C3FB0 01001026 */  addiu      $16, $16, 0x1
.L001C3FB4:
/* C40B4 001C3FB4 21105502 */  addu       $2, $18, $21
/* C40B8 001C3FB8 A2044284 */  lh         $2, 0x4A2($2)
/* C40BC 001C3FBC 2A100202 */  slt        $2, $16, $2
/* C40C0 001C3FC0 80FF4014 */  bnez       $2, .L001C3DC4
/* C40C4 001C3FC4 00000000 */   nop
/* C40C8 001C3FC8 01003126 */  addiu      $17, $17, 0x1
.L001C3FCC:
/* C40CC 001C3FCC C0101100 */  sll        $2, $17, 3
/* C40D0 001C3FD0 23105100 */  subu       $2, $2, $17
/* C40D4 001C3FD4 80100200 */  sll        $2, $2, 2
/* C40D8 001C3FD8 21105100 */  addu       $2, $2, $17
/* C40DC 001C3FDC 00910200 */  sll        $18, $2, 4
/* C40E0 001C3FE0 21105502 */  addu       $2, $18, $21
/* C40E4 001C3FE4 4006428C */  lw         $2, 0x640($2)
/* C40E8 001C3FE8 6EFF4014 */  bnez       $2, .L001C3DA4
/* C40EC 001C3FEC 00000000 */   nop
/* C40F0 001C3FF0 F041023C */  lui        $2, (0x41F00000 >> 16)
/* C40F4 001C3FF4 00008244 */  mtc1       $2, $f0
/* C40F8 001C3FF8 00000000 */  nop
/* C40FC 001C3FFC 36A00046 */  c.le.s     $f20, $f0
/* C4100 001C4000 00000000 */  nop
/* C4104 001C4004 16000045 */  bc1f       .L001C4060
/* C4108 001C4008 00000000 */   nop
/* C410C 001C400C 2041023C */  lui        $2, (0x41200000 >> 16)
/* C4110 001C4010 00608244 */  mtc1       $2, $f12
/* C4114 001C4014 FA43023C */  lui        $2, (0x43FA0000 >> 16)
/* C4118 001C4018 00688244 */  mtc1       $2, $f13
/* C411C 001C401C F800A427 */  addiu      $4, $sp, 0xF8
/* C4120 001C4020 FC00A527 */  addiu      $5, $sp, 0xFC
/* C4124 001C4024 D000A627 */  addiu      $6, $sp, 0xD0
/* C4128 001C4028 006B050C */  jal        SndGetVolPan__FPfPfPfff
/* C412C 001C402C 00000000 */   nop
/* C4130 001C4030 35000424 */  addiu      $4, $0, 0x35
/* C4134 001C4034 F800ACC7 */  lwc1       $f12, 0xF8($sp)
/* C4138 001C4038 282E0070 */  paddub     $5, $0, $0
/* C413C 001C403C AC6A050C */  jal        SndSetSeVolf__Fifi
/* C4140 001C4040 00000000 */   nop
/* C4144 001C4044 35000424 */  addiu      $4, $0, 0x35
/* C4148 001C4048 FC00ACC7 */  lwc1       $f12, 0xFC($sp)
/* C414C 001C404C 282E0070 */  paddub     $5, $0, $0
/* C4150 001C4050 C46A050C */  jal        SndSetSePanf__Fifi
/* C4154 001C4054 00000000 */   nop
/* C4158 001C4058 06000010 */  b          .L001C4074
/* C415C 001C405C 00000000 */   nop
.L001C4060:
/* C4160 001C4060 35000424 */  addiu      $4, $0, 0x35
/* C4164 001C4064 282E0070 */  paddub     $5, $0, $0
/* C4168 001C4068 28360070 */  paddub     $6, $0, $0
/* C416C 001C406C 406A050C */  jal        SndSetSeVol__Fiii
/* C4170 001C4070 00000000 */   nop
.L001C4074:
/* C4174 001C4074 9000BF7B */  lq         $31, 0x90($sp)
/* C4178 001C4078 8000B77B */  lq         $23, 0x80($sp)
/* C417C 001C407C 7000B67B */  lq         $22, 0x70($sp)
/* C4180 001C4080 6000B57B */  lq         $21, 0x60($sp)
/* C4184 001C4084 5000B47B */  lq         $20, 0x50($sp)
/* C4188 001C4088 4000B37B */  lq         $19, 0x40($sp)
/* C418C 001C408C 3000B27B */  lq         $18, 0x30($sp)
/* C4190 001C4090 2000B17B */  lq         $17, 0x20($sp)
/* C4194 001C4094 1000B07B */  lq         $16, 0x10($sp)
/* C4198 001C4098 0C00B7C7 */  lwc1       $f23, 0xC($sp)
/* C419C 001C409C 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* C41A0 001C40A0 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* C41A4 001C40A4 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* C41A8 001C40A8 0001BD27 */  addiu      $sp, $sp, 0x100
/* C41AC 001C40AC 0800E003 */  jr         $31
/* C41B0 001C40B0 00000000 */   nop
/* C41B4 001C40B4 00000000 */  nop
/* C41B8 001C40B8 00000000 */  nop
/* C41BC 001C40BC 00000000 */  nop
