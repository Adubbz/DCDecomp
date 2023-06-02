.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawWepDamageDraw__F4RECTP11WEAPON_HAVEi
/* F8E30 001F8D30 80FEBD27 */  addiu      $sp, $sp, -0x180
/* F8E34 001F8D34 9000BF7F */  sq         $31, 0x90($sp)
/* F8E38 001F8D38 8000BE7F */  sq         $fp, 0x80($sp)
/* F8E3C 001F8D3C 7000B77F */  sq         $23, 0x70($sp)
/* F8E40 001F8D40 6000B67F */  sq         $22, 0x60($sp)
/* F8E44 001F8D44 5000B57F */  sq         $21, 0x50($sp)
/* F8E48 001F8D48 4000B47F */  sq         $20, 0x40($sp)
/* F8E4C 001F8D4C 3000B37F */  sq         $19, 0x30($sp)
/* F8E50 001F8D50 2000B27F */  sq         $18, 0x20($sp)
/* F8E54 001F8D54 1000B17F */  sq         $17, 0x10($sp)
/* F8E58 001F8D58 0000B07F */  sq         $16, 0x0($sp)
/* F8E5C 001F8D5C 28AEA070 */  paddub     $21, $5, $0
/* F8E60 001F8D60 28A6C070 */  paddub     $20, $6, $0
/* F8E64 001F8D64 B000A227 */  addiu      $2, $sp, 0xB0
/* F8E68 001F8D68 000083C4 */  lwc1       $f3, 0x0($4)
/* F8E6C 001F8D6C 040082C4 */  lwc1       $f2, 0x4($4)
/* F8E70 001F8D70 080081C4 */  lwc1       $f1, 0x8($4)
/* F8E74 001F8D74 0C0080C4 */  lwc1       $f0, 0xC($4)
/* F8E78 001F8D78 000043E4 */  swc1       $f3, 0x0($2)
/* F8E7C 001F8D7C 040042E4 */  swc1       $f2, 0x4($2)
/* F8E80 001F8D80 080041E4 */  swc1       $f1, 0x8($2)
/* F8E84 001F8D84 0C0040E4 */  swc1       $f0, 0xC($2)
/* F8E88 001F8D88 B000B08F */  lw         $16, 0xB0($sp)
/* F8E8C 001F8D8C B400B727 */  addiu      $23, $sp, 0xB4
/* F8E90 001F8D90 0000F38E */  lw         $19, 0x0($23)
/* F8E94 001F8D94 0C00B684 */  lh         $22, 0xC($5)
/* F8E98 001F8D98 1000ACC4 */  lwc1       $f12, 0x10($5)
/* F8E9C 001F8D9C F0AA080C */  jal        GetDispVolumeForFloat__Ff
/* F8EA0 001F8DA0 00000000 */   nop
/* F8EA4 001F8DA4 28F64070 */  paddub     $fp, $2, $0
/* F8EA8 001F8DA8 2826A072 */  paddub     $4, $21, $0
/* F8EAC 001F8DAC 20C8080C */  jal        GetWeaponMaxExp__FP11WEAPON_HAVE
/* F8EB0 001F8DB0 00000000 */   nop
/* F8EB4 001F8DB4 288E4070 */  paddub     $17, $2, $0
/* F8EB8 001F8DB8 1400B286 */  lh         $18, 0x14($21)
/* F8EBC 001F8DBC 2A083202 */  slt        $at, $17, $18
/* F8EC0 001F8DC0 02002010 */  beqz       $at, .L001F8DCC
/* F8EC4 001F8DC4 00000000 */   nop
/* F8EC8 001F8DC8 28962072 */  paddub     $18, $17, $0
.L001F8DCC:
/* F8ECC 001F8DCC 02004106 */  bgez       $18, .L001F8DD8
/* F8ED0 001F8DD0 00000000 */   nop
/* F8ED4 001F8DD4 28960070 */  paddub     $18, $0, $0
.L001F8DD8:
/* F8ED8 001F8DD8 0200201E */  bgtz       $17, .L001F8DE4
/* F8EDC 001F8DDC 00000000 */   nop
/* F8EE0 001F8DE0 63001124 */  addiu      $17, $0, 0x63
.L001F8DE4:
/* F8EE4 001F8DE4 40111200 */  sll        $2, $18, 5
/* F8EE8 001F8DE8 21185200 */  addu       $3, $2, $18
/* F8EEC 001F8DEC 80100300 */  sll        $2, $3, 2
/* F8EF0 001F8DF0 23104300 */  subu       $2, $2, $3
/* F8EF4 001F8DF4 1A005100 */  div        $0, $2, $17
/* F8EF8 001F8DF8 02002016 */  bnez       $17, .L001F8E04
/* F8EFC 001F8DFC 00000000 */   nop
/* F8F00 001F8E00 CD010000 */  break      0, 7
.L001F8E04:
/* F8F04 001F8E04 12100000 */  mflo       $2
/* F8F08 001F8E08 A000A2AF */  sw         $2, 0xA0($sp)
/* F8F0C 001F8E0C 00010224 */  addiu      $2, $0, 0x100
/* F8F10 001F8E10 F000A2AF */  sw         $2, 0xF0($sp)
/* F8F14 001F8E14 70000224 */  addiu      $2, $0, 0x70
/* F8F18 001F8E18 F400A2AF */  sw         $2, 0xF4($sp)
/* F8F1C 001F8E1C 08000324 */  addiu      $3, $0, 0x8
/* F8F20 001F8E20 F800A3AF */  sw         $3, 0xF8($sp)
/* F8F24 001F8E24 FC00A3AF */  sw         $3, 0xFC($sp)
/* F8F28 001F8E28 B000A28F */  lw         $2, 0xB0($sp)
/* F8F2C 001F8E2C E000A2AF */  sw         $2, 0xE0($sp)
/* F8F30 001F8E30 E400B3AF */  sw         $19, 0xE4($sp)
/* F8F34 001F8E34 E800B6AF */  sw         $22, 0xE8($sp)
/* F8F38 001F8E38 EC00A3AF */  sw         $3, 0xEC($sp)
/* F8F3C 001F8E3C 2C95848F */  lw         $4, -0x6AD4($gp)
/* F8F40 001F8E40 E000A527 */  addiu      $5, $sp, 0xE0
/* F8F44 001F8E44 F000A627 */  addiu      $6, $sp, 0xF0
/* F8F48 001F8E48 283E8072 */  paddub     $7, $20, $0
/* F8F4C 001F8E4C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F8F50 001F8E50 00000000 */   nop
/* F8F54 001F8E54 94958283 */  lb         $2, -0x6A6C($gp)
/* F8F58 001F8E58 04004014 */  bnez       $2, .L001F8E6C
/* F8F5C 001F8E5C 00000000 */   nop
/* F8F60 001F8E60 909580AF */  sw         $0, -0x6A70($gp)
/* F8F64 001F8E64 01000224 */  addiu      $2, $0, 0x1
/* F8F68 001F8E68 949582A3 */  sb         $2, -0x6A6C($gp)
.L001F8E6C:
/* F8F6C 001F8E6C 9095828F */  lw         $2, -0x6A70($gp)
/* F8F70 001F8E70 01004224 */  addiu      $2, $2, 0x1
/* F8F74 001F8E74 909582AF */  sw         $2, -0x6A70($gp)
/* F8F78 001F8E78 0C00A286 */  lh         $2, 0xC($21)
/* F8F7C 001F8E7C 00008244 */  mtc1       $2, $f0
/* F8F80 001F8E80 00000000 */  nop
/* F8F84 001F8E84 60008046 */  cvt.s.w    $f1, $f0
/* F8F88 001F8E88 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* F8F8C 001F8E8C 42000146 */  mul.s      $f1, $f0, $f1
/* F8F90 001F8E90 1000A0C6 */  lwc1       $f0, 0x10($21)
/* F8F94 001F8E94 36000146 */  c.le.s     $f0, $f1
/* F8F98 001F8E98 00000000 */  nop
/* F8F9C 001F8E9C 03000145 */  bc1t       .L001F8EAC
/* F8FA0 001F8EA0 00000000 */   nop
/* F8FA4 001F8EA4 1C003216 */  bne        $17, $18, .L001F8F18
/* F8FA8 001F8EA8 00000000 */   nop
.L001F8EAC:
/* F8FAC 001F8EAC 909580C7 */  lwc1       $f0, -0x6A70($gp)
/* F8FB0 001F8EB0 60008046 */  cvt.s.w    $f1, $f0
/* F8FB4 001F8EB4 9041023C */  lui        $2, (0x41900000 >> 16)
/* F8FB8 001F8EB8 00008244 */  mtc1       $2, $f0
/* F8FBC 001F8EBC 00000000 */  nop
/* F8FC0 001F8EC0 030B0046 */  div.s      $f12, $f1, $f0
/* F8FC4 001F8EC4 2876040C */  jal        sinf
/* F8FC8 001F8EC8 00000000 */   nop
/* F8FCC 001F8ECC 7042023C */  lui        $2, (0x42700000 >> 16)
/* F8FD0 001F8ED0 00088244 */  mtc1       $2, $f1
/* F8FD4 001F8ED4 00000000 */  nop
/* F8FD8 001F8ED8 020B0046 */  mul.s      $f12, $f1, $f0
/* F8FDC 001F8EDC 2C44040C */  jal        fptosi
/* F8FE0 001F8EE0 00000000 */   nop
/* F8FE4 001F8EE4 28264070 */  paddub     $4, $2, $0
/* F8FE8 001F8EE8 7200040C */  jal        abs
/* F8FEC 001F8EEC 00000000 */   nop
/* F8FF0 001F8EF0 9095828F */  lw         $2, -0x6A70($gp)
/* F8FF4 001F8EF4 01004224 */  addiu      $2, $2, 0x1
/* F8FF8 001F8EF8 909582AF */  sw         $2, -0x6A70($gp)
/* F8FFC 001F8EFC 9095828F */  lw         $2, -0x6A70($gp)
/* F9000 001F8F00 0F00013C */  lui        $at, (0xF4241 >> 16)
/* F9004 001F8F04 41422134 */  ori        $at, $at, (0xF4241 & 0xFFFF)
/* F9008 001F8F08 2A084100 */  slt        $at, $2, $at
/* F900C 001F8F0C 02002014 */  bnez       $at, .L001F8F18
/* F9010 001F8F10 00000000 */   nop
/* F9014 001F8F14 909580AF */  sw         $0, -0x6A70($gp)
.L001F8F18:
/* F9018 001F8F18 B000A28F */  lw         $2, 0xB0($sp)
/* F901C 001F8F1C 00110200 */  sll        $2, $2, 4
/* F9020 001F8F20 0001A2AF */  sw         $2, 0x100($sp)
/* F9024 001F8F24 FFFF6226 */  addiu      $2, $19, -0x1
/* F9028 001F8F28 43100200 */  sra        $2, $2, 1
/* F902C 001F8F2C 00110200 */  sll        $2, $2, 4
/* F9030 001F8F30 0401A2AF */  sw         $2, 0x104($sp)
/* F9034 001F8F34 0100C226 */  addiu      $2, $22, 0x1
/* F9038 001F8F38 00110200 */  sll        $2, $2, 4
/* F903C 001F8F3C 0801A2AF */  sw         $2, 0x108($sp)
/* F9040 001F8F40 50000224 */  addiu      $2, $0, 0x50
/* F9044 001F8F44 0C01A2AF */  sw         $2, 0x10C($sp)
/* F9048 001F8F48 FF008832 */  andi       $8, $20, 0xFF
/* F904C 001F8F4C 0001A427 */  addiu      $4, $sp, 0x100
/* F9050 001F8F50 4F000524 */  addiu      $5, $0, 0x4F
/* F9054 001F8F54 2836A070 */  paddub     $6, $5, $0
/* F9058 001F8F58 283EA070 */  paddub     $7, $5, $0
/* F905C 001F8F5C 9CBE040C */  jal        MGFillBox__FRC8CRect_i_UcUcUcUc
/* F9060 001F8F60 00000000 */   nop
/* F9064 001F8F64 19000424 */  addiu      $4, $0, 0x19
/* F9068 001F8F68 B8CF070C */  jal        GetGradationColorInfo2__Fi
/* F906C 001F8F6C 00000000 */   nop
/* F9070 001F8F70 C000A427 */  addiu      $4, $sp, 0xC0
/* F9074 001F8F74 282E4070 */  paddub     $5, $2, $0
/* F9078 001F8F78 10000624 */  addiu      $6, $0, 0x10
/* F907C 001F8F7C EC0C040C */  jal        memcpy
/* F9080 001F8F80 00000000 */   nop
/* F9084 001F8F84 CF00B4A3 */  sb         $20, 0xCF($sp)
/* F9088 001F8F88 CB00B4A3 */  sb         $20, 0xCB($sp)
/* F908C 001F8F8C C700B4A3 */  sb         $20, 0xC7($sp)
/* F9090 001F8F90 C300B4A3 */  sb         $20, 0xC3($sp)
/* F9094 001F8F94 B000A28F */  lw         $2, 0xB0($sp)
/* F9098 001F8F98 1001A2AF */  sw         $2, 0x110($sp)
/* F909C 001F8F9C 1401B3AF */  sw         $19, 0x114($sp)
/* F90A0 001F8FA0 1801BEAF */  sw         $fp, 0x118($sp)
/* F90A4 001F8FA4 08000224 */  addiu      $2, $0, 0x8
/* F90A8 001F8FA8 1C01A2AF */  sw         $2, 0x11C($sp)
/* F90AC 001F8FAC 1001A427 */  addiu      $4, $sp, 0x110
/* F90B0 001F8FB0 C000A527 */  addiu      $5, $sp, 0xC0
/* F90B4 001F8FB4 C400A627 */  addiu      $6, $sp, 0xC4
/* F90B8 001F8FB8 C800A727 */  addiu      $7, $sp, 0xC8
/* F90BC 001F8FBC CC00A827 */  addiu      $8, $sp, 0xCC
/* F90C0 001F8FC0 F4B4080C */  jal        DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* F90C4 001F8FC4 00000000 */   nop
/* F90C8 001F8FC8 BC00A227 */  addiu      $2, $sp, 0xBC
/* F90CC 001F8FCC 0000428C */  lw         $2, 0x0($2)
/* F90D0 001F8FD0 21986202 */  addu       $19, $19, $2
/* F90D4 001F8FD4 2900023C */  lui        $2, %hi(_1684_2)
/* F90D8 001F8FD8 20304224 */  addiu      $2, $2, %lo(_1684_2)
/* F90DC 001F8FDC D000A827 */  addiu      $8, $sp, 0xD0
/* F90E0 001F8FE0 00004278 */  lq         $2, 0x0($2)
/* F90E4 001F8FE4 0000027D */  sq         $2, 0x0($8)
/* F90E8 001F8FE8 B800A28F */  lw         $2, 0xB8($sp)
/* F90EC 001F8FEC 21800202 */  addu       $16, $16, $2
/* F90F0 001F8FF0 2826C072 */  paddub     $4, $22, $0
/* F90F4 001F8FF4 282E0072 */  paddub     $5, $16, $0
/* F90F8 001F8FF8 28366072 */  paddub     $6, $19, $0
/* F90FC 001F8FFC 2C95878F */  lw         $7, -0x6AD4($gp)
/* F9100 001F9000 01000924 */  addiu      $9, $0, 0x1
/* F9104 001F9004 28568072 */  paddub     $10, $20, $0
/* F9108 001F9008 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* F910C 001F900C 00000000 */   nop
/* F9110 001F9010 D400B627 */  addiu      $22, $sp, 0xD4
/* F9114 001F9014 0000C38E */  lw         $3, 0x0($22)
/* F9118 001F9018 D000A28F */  lw         $2, 0xD0($sp)
/* F911C 001F901C 78004224 */  addiu      $2, $2, 0x78
/* F9120 001F9020 3001A2AF */  sw         $2, 0x130($sp)
/* F9124 001F9024 3401A3AF */  sw         $3, 0x134($sp)
/* F9128 001F9028 0C000324 */  addiu      $3, $0, 0xC
/* F912C 001F902C 3801A3AF */  sw         $3, 0x138($sp)
/* F9130 001F9030 3C01A3AF */  sw         $3, 0x13C($sp)
/* F9134 001F9034 E0FF0226 */  addiu      $2, $16, -0x20
/* F9138 001F9038 2001A2AF */  sw         $2, 0x120($sp)
/* F913C 001F903C 2401B3AF */  sw         $19, 0x124($sp)
/* F9140 001F9040 2801A3AF */  sw         $3, 0x128($sp)
/* F9144 001F9044 0B000224 */  addiu      $2, $0, 0xB
/* F9148 001F9048 2C01A2AF */  sw         $2, 0x12C($sp)
/* F914C 001F904C 2C95848F */  lw         $4, -0x6AD4($gp)
/* F9150 001F9050 2001A527 */  addiu      $5, $sp, 0x120
/* F9154 001F9054 3001A627 */  addiu      $6, $sp, 0x130
/* F9158 001F9058 283E8072 */  paddub     $7, $20, $0
/* F915C 001F905C C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F9160 001F9060 00000000 */   nop
/* F9164 001F9064 E0FF0526 */  addiu      $5, $16, -0x20
/* F9168 001F9068 2826C073 */  paddub     $4, $fp, $0
/* F916C 001F906C 28366072 */  paddub     $6, $19, $0
/* F9170 001F9070 2C95878F */  lw         $7, -0x6AD4($gp)
/* F9174 001F9074 D000A827 */  addiu      $8, $sp, 0xD0
/* F9178 001F9078 01000924 */  addiu      $9, $0, 0x1
/* F917C 001F907C 28568072 */  paddub     $10, $20, $0
/* F9180 001F9080 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* F9184 001F9084 00000000 */   nop
/* F9188 001F9088 0000E28E */  lw         $2, 0x0($23)
/* F918C 001F908C 14004224 */  addiu      $2, $2, 0x14
/* F9190 001F9090 0000E2AE */  sw         $2, 0x0($23)
/* F9194 001F9094 0000F38E */  lw         $19, 0x0($23)
/* F9198 001F9098 00010224 */  addiu      $2, $0, 0x100
/* F919C 001F909C 5001A2AF */  sw         $2, 0x150($sp)
/* F91A0 001F90A0 78000224 */  addiu      $2, $0, 0x78
/* F91A4 001F90A4 5401A2AF */  sw         $2, 0x154($sp)
/* F91A8 001F90A8 08000324 */  addiu      $3, $0, 0x8
/* F91AC 001F90AC 5801A3AF */  sw         $3, 0x158($sp)
/* F91B0 001F90B0 5C01A3AF */  sw         $3, 0x15C($sp)
/* F91B4 001F90B4 B000A28F */  lw         $2, 0xB0($sp)
/* F91B8 001F90B8 4001A2AF */  sw         $2, 0x140($sp)
/* F91BC 001F90BC 4401B3AF */  sw         $19, 0x144($sp)
/* F91C0 001F90C0 A000A28F */  lw         $2, 0xA0($sp)
/* F91C4 001F90C4 4801A2AF */  sw         $2, 0x148($sp)
/* F91C8 001F90C8 4C01A3AF */  sw         $3, 0x14C($sp)
/* F91CC 001F90CC 2C95848F */  lw         $4, -0x6AD4($gp)
/* F91D0 001F90D0 4001A527 */  addiu      $5, $sp, 0x140
/* F91D4 001F90D4 5001A627 */  addiu      $6, $sp, 0x150
/* F91D8 001F90D8 283E8072 */  paddub     $7, $20, $0
/* F91DC 001F90DC C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F91E0 001F90E0 00000000 */   nop
/* F91E4 001F90E4 28262072 */  paddub     $4, $17, $0
/* F91E8 001F90E8 C0B7080C */  jal        GetNumberKeta__Fi
/* F91EC 001F90EC 00000000 */   nop
/* F91F0 001F90F0 28AE4070 */  paddub     $21, $2, $0
/* F91F4 001F90F4 B000B08F */  lw         $16, 0xB0($sp)
/* F91F8 001F90F8 BC00A327 */  addiu      $3, $sp, 0xBC
/* F91FC 001F90FC 0000638C */  lw         $3, 0x0($3)
/* F9200 001F9100 21986302 */  addu       $19, $19, $3
/* F9204 001F9104 40180200 */  sll        $3, $2, 1
/* F9208 001F9108 21106200 */  addu       $2, $3, $2
/* F920C 001F910C C0100200 */  sll        $2, $2, 3
/* F9210 001F9110 21800202 */  addu       $16, $16, $2
/* F9214 001F9114 28262072 */  paddub     $4, $17, $0
/* F9218 001F9118 282E0072 */  paddub     $5, $16, $0
/* F921C 001F911C 28366072 */  paddub     $6, $19, $0
/* F9220 001F9120 2C95878F */  lw         $7, -0x6AD4($gp)
/* F9224 001F9124 D000A827 */  addiu      $8, $sp, 0xD0
/* F9228 001F9128 01000924 */  addiu      $9, $0, 0x1
/* F922C 001F912C 28568072 */  paddub     $10, $20, $0
/* F9230 001F9130 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* F9234 001F9134 00000000 */   nop
/* F9238 001F9138 00111500 */  sll        $2, $21, 4
/* F923C 001F913C 23800202 */  subu       $16, $16, $2
/* F9240 001F9140 0000C38E */  lw         $3, 0x0($22)
/* F9244 001F9144 D000A28F */  lw         $2, 0xD0($sp)
/* F9248 001F9148 78004224 */  addiu      $2, $2, 0x78
/* F924C 001F914C 7001A2AF */  sw         $2, 0x170($sp)
/* F9250 001F9150 7401A3AF */  sw         $3, 0x174($sp)
/* F9254 001F9154 0C000224 */  addiu      $2, $0, 0xC
/* F9258 001F9158 7801A2AF */  sw         $2, 0x178($sp)
/* F925C 001F915C 7C01A2AF */  sw         $2, 0x17C($sp)
/* F9260 001F9160 6001B0AF */  sw         $16, 0x160($sp)
/* F9264 001F9164 6401B3AF */  sw         $19, 0x164($sp)
/* F9268 001F9168 6801A2AF */  sw         $2, 0x168($sp)
/* F926C 001F916C 0B000224 */  addiu      $2, $0, 0xB
/* F9270 001F9170 6C01A2AF */  sw         $2, 0x16C($sp)
/* F9274 001F9174 2C95848F */  lw         $4, -0x6AD4($gp)
/* F9278 001F9178 6001A527 */  addiu      $5, $sp, 0x160
/* F927C 001F917C 7001A627 */  addiu      $6, $sp, 0x170
/* F9280 001F9180 283E8072 */  paddub     $7, $20, $0
/* F9284 001F9184 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* F9288 001F9188 00000000 */   nop
/* F928C 001F918C 28264072 */  paddub     $4, $18, $0
/* F9290 001F9190 282E0072 */  paddub     $5, $16, $0
/* F9294 001F9194 28366072 */  paddub     $6, $19, $0
/* F9298 001F9198 2C95878F */  lw         $7, -0x6AD4($gp)
/* F929C 001F919C D000A827 */  addiu      $8, $sp, 0xD0
/* F92A0 001F91A0 01000924 */  addiu      $9, $0, 0x1
/* F92A4 001F91A4 28568072 */  paddub     $10, $20, $0
/* F92A8 001F91A8 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* F92AC 001F91AC 00000000 */   nop
/* F92B0 001F91B0 9000BF7B */  lq         $31, 0x90($sp)
/* F92B4 001F91B4 8000BE7B */  lq         $fp, 0x80($sp)
/* F92B8 001F91B8 7000B77B */  lq         $23, 0x70($sp)
/* F92BC 001F91BC 6000B67B */  lq         $22, 0x60($sp)
/* F92C0 001F91C0 5000B57B */  lq         $21, 0x50($sp)
/* F92C4 001F91C4 4000B47B */  lq         $20, 0x40($sp)
/* F92C8 001F91C8 3000B37B */  lq         $19, 0x30($sp)
/* F92CC 001F91CC 2000B27B */  lq         $18, 0x20($sp)
/* F92D0 001F91D0 1000B17B */  lq         $17, 0x10($sp)
/* F92D4 001F91D4 0000B07B */  lq         $16, 0x0($sp)
/* F92D8 001F91D8 8001BD27 */  addiu      $sp, $sp, 0x180
/* F92DC 001F91DC 0800E003 */  jr         $31
/* F92E0 001F91E0 00000000 */   nop
/* F92E4 001F91E4 00000000 */  nop
/* F92E8 001F91E8 00000000 */  nop
/* F92EC 001F91EC 00000000 */  nop
