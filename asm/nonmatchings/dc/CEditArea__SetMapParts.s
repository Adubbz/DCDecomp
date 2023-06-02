.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMapParts__9CEditAreaFiP9CMapPartsfffi
/* 6E110 0016E010 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* 6E114 0016E014 A000BF7F */  sq         $31, 0xA0($sp)
/* 6E118 0016E018 9000BE7F */  sq         $fp, 0x90($sp)
/* 6E11C 0016E01C 8000B77F */  sq         $23, 0x80($sp)
/* 6E120 0016E020 7000B67F */  sq         $22, 0x70($sp)
/* 6E124 0016E024 6000B57F */  sq         $21, 0x60($sp)
/* 6E128 0016E028 5000B47F */  sq         $20, 0x50($sp)
/* 6E12C 0016E02C 4000B37F */  sq         $19, 0x40($sp)
/* 6E130 0016E030 3000B27F */  sq         $18, 0x30($sp)
/* 6E134 0016E034 2000B17F */  sq         $17, 0x20($sp)
/* 6E138 0016E038 1000B07F */  sq         $16, 0x10($sp)
/* 6E13C 0016E03C 0800B6E7 */  swc1       $f22, 0x8($sp)
/* 6E140 0016E040 0400B5E7 */  swc1       $f21, 0x4($sp)
/* 6E144 0016E044 0000B4E7 */  swc1       $f20, 0x0($sp)
/* 6E148 0016E048 28B68070 */  paddub     $22, $4, $0
/* 6E14C 0016E04C 28BEA070 */  paddub     $23, $5, $0
/* 6E150 0016E050 86650046 */  mov.s      $f22, $f12
/* 6E154 0016E054 466D0046 */  mov.s      $f21, $f13
/* 6E158 0016E058 06750046 */  mov.s      $f20, $f14
/* 6E15C 0016E05C C0100500 */  sll        $2, $5, 3
/* 6E160 0016E060 23185700 */  subu       $3, $2, $23
/* 6E164 0016E064 80100300 */  sll        $2, $3, 2
/* 6E168 0016E068 23104300 */  subu       $2, $2, $3
/* 6E16C 0016E06C 40110200 */  sll        $2, $2, 5
/* 6E170 0016E070 2190C200 */  addu       $18, $6, $2
/* 6E174 0016E074 200080C4 */  lwc1       $f0, 0x20($4)
/* 6E178 0016E078 D00140E6 */  swc1       $f0, 0x1D0($18)
/* 6E17C 0016E07C 28264072 */  paddub     $4, $18, $0
/* 6E180 0016E080 886A060C */  jal        GetWidth__9CMapPartsFv
/* 6E184 0016E084 00000000 */   nop
/* 6E188 0016E088 BC00A2AF */  sw         $2, 0xBC($sp)
/* 6E18C 0016E08C 28264072 */  paddub     $4, $18, $0
/* 6E190 0016E090 A06A060C */  jal        GetHeight__9CMapPartsFv
/* 6E194 0016E094 00000000 */   nop
/* 6E198 0016E098 28F64070 */  paddub     $fp, $2, $0
/* 6E19C 0016E09C 2826C072 */  paddub     $4, $22, $0
/* 6E1A0 0016E0A0 C000A527 */  addiu      $5, $sp, 0xC0
/* 6E1A4 0016E0A4 06B30046 */  mov.s      $f12, $f22
/* 6E1A8 0016E0A8 46AB0046 */  mov.s      $f13, $f21
/* 6E1AC 0016E0AC 86A30046 */  mov.s      $f14, $f20
/* 6E1B0 0016E0B0 20B6050C */  jal        GetPos__9CEditAreaFP11CVector3_i_fff
/* 6E1B4 0016E0B4 00000000 */   nop
/* 6E1B8 0016E0B8 28860070 */  paddub     $16, $0, $0
/* 6E1BC 0016E0BC 3D000010 */  b          .L0016E1B4
/* 6E1C0 0016E0C0 00000000 */   nop
.L0016E0C4:
/* 6E1C4 0016E0C4 288E0070 */  paddub     $17, $0, $0
/* 6E1C8 0016E0C8 36000010 */  b          .L0016E1A4
/* 6E1CC 0016E0CC 00000000 */   nop
.L0016E0D0:
/* 6E1D0 0016E0D0 BC00A28F */  lw         $2, 0xBC($sp)
/* 6E1D4 0016E0D4 43180200 */  sra        $3, $2, 1
/* 6E1D8 0016E0D8 C000A28F */  lw         $2, 0xC0($sp)
/* 6E1DC 0016E0DC 23104300 */  subu       $2, $2, $3
/* 6E1E0 0016E0E0 21980202 */  addu       $19, $16, $2
/* 6E1E4 0016E0E4 43181E00 */  sra        $3, $fp, 1
/* 6E1E8 0016E0E8 C800A28F */  lw         $2, 0xC8($sp)
/* 6E1EC 0016E0EC 23104300 */  subu       $2, $2, $3
/* 6E1F0 0016E0F0 21A02202 */  addu       $20, $17, $2
/* 6E1F4 0016E0F4 28264072 */  paddub     $4, $18, $0
/* 6E1F8 0016E0F8 282E0072 */  paddub     $5, $16, $0
/* 6E1FC 0016E0FC 28362072 */  paddub     $6, $17, $0
/* 6E200 0016E100 B86A060C */  jal        GetInfoData__9CMapPartsFii
/* 6E204 0016E104 00000000 */   nop
/* 6E208 0016E108 28AE4070 */  paddub     $21, $2, $0
/* 6E20C 0016E10C 2400A012 */  beqz       $21, .L0016E1A0
/* 6E210 0016E110 00000000 */   nop
/* 6E214 0016E114 2826C072 */  paddub     $4, $22, $0
/* 6E218 0016E118 282E6072 */  paddub     $5, $19, $0
/* 6E21C 0016E11C 28368072 */  paddub     $6, $20, $0
/* 6E220 0016E120 283EA072 */  paddub     $7, $21, $0
/* 6E224 0016E124 B8B6050C */  jal        SetCode__9CEditAreaFiii
/* 6E228 0016E128 00000000 */   nop
/* 6E22C 0016E12C 8000A12A */  slti       $at, $21, 0x80
/* 6E230 0016E130 09002010 */  beqz       $at, .L0016E158
/* 6E234 0016E134 00000000 */   nop
/* 6E238 0016E138 2826C072 */  paddub     $4, $22, $0
/* 6E23C 0016E13C 282E6072 */  paddub     $5, $19, $0
/* 6E240 0016E140 28368072 */  paddub     $6, $20, $0
/* 6E244 0016E144 283EA072 */  paddub     $7, $21, $0
/* 6E248 0016E148 64C0050C */  jal        AddAlt__9CEditAreaFiii
/* 6E24C 0016E14C 00000000 */   nop
/* 6E250 0016E150 13000010 */  b          .L0016E1A0
/* 6E254 0016E154 00000000 */   nop
.L0016E158:
/* 6E258 0016E158 2826C072 */  paddub     $4, $22, $0
/* 6E25C 0016E15C 282E6072 */  paddub     $5, $19, $0
/* 6E260 0016E160 28368072 */  paddub     $6, $20, $0
/* 6E264 0016E164 E800478E */  lw         $7, 0xE8($18)
/* 6E268 0016E168 64B6050C */  jal        SetPartsNo__9CEditAreaFiii
/* 6E26C 0016E16C 00000000 */   nop
/* 6E270 0016E170 2826C072 */  paddub     $4, $22, $0
/* 6E274 0016E174 282E6072 */  paddub     $5, $19, $0
/* 6E278 0016E178 28368072 */  paddub     $6, $20, $0
/* 6E27C 0016E17C 283EE072 */  paddub     $7, $23, $0
/* 6E280 0016E180 80B6050C */  jal        SetPartsID__9CEditAreaFiii
/* 6E284 0016E184 00000000 */   nop
/* 6E288 0016E188 2826C072 */  paddub     $4, $22, $0
/* 6E28C 0016E18C 282E6072 */  paddub     $5, $19, $0
/* 6E290 0016E190 28368072 */  paddub     $6, $20, $0
/* 6E294 0016E194 1801478E */  lw         $7, 0x118($18)
/* 6E298 0016E198 9CB6050C */  jal        SetPartsExtra__9CEditAreaFiii
/* 6E29C 0016E19C 00000000 */   nop
.L0016E1A0:
/* 6E2A0 0016E1A0 01003126 */  addiu      $17, $17, 0x1
.L0016E1A4:
/* 6E2A4 0016E1A4 2A103E02 */  slt        $2, $17, $fp
/* 6E2A8 0016E1A8 C9FF4014 */  bnez       $2, .L0016E0D0
/* 6E2AC 0016E1AC 00000000 */   nop
/* 6E2B0 0016E1B0 01001026 */  addiu      $16, $16, 0x1
.L0016E1B4:
/* 6E2B4 0016E1B4 BC00A28F */  lw         $2, 0xBC($sp)
/* 6E2B8 0016E1B8 2A100202 */  slt        $2, $16, $2
/* 6E2BC 0016E1BC C1FF4014 */  bnez       $2, .L0016E0C4
/* 6E2C0 0016E1C0 00000000 */   nop
/* 6E2C4 0016E1C4 01000224 */  addiu      $2, $0, 0x1
/* 6E2C8 0016E1C8 5020C2AE */  sw         $2, 0x2050($22)
/* 6E2CC 0016E1CC A000BF7B */  lq         $31, 0xA0($sp)
/* 6E2D0 0016E1D0 9000BE7B */  lq         $fp, 0x90($sp)
/* 6E2D4 0016E1D4 8000B77B */  lq         $23, 0x80($sp)
/* 6E2D8 0016E1D8 7000B67B */  lq         $22, 0x70($sp)
/* 6E2DC 0016E1DC 6000B57B */  lq         $21, 0x60($sp)
/* 6E2E0 0016E1E0 5000B47B */  lq         $20, 0x50($sp)
/* 6E2E4 0016E1E4 4000B37B */  lq         $19, 0x40($sp)
/* 6E2E8 0016E1E8 3000B27B */  lq         $18, 0x30($sp)
/* 6E2EC 0016E1EC 2000B17B */  lq         $17, 0x20($sp)
/* 6E2F0 0016E1F0 1000B07B */  lq         $16, 0x10($sp)
/* 6E2F4 0016E1F4 0800B6C7 */  lwc1       $f22, 0x8($sp)
/* 6E2F8 0016E1F8 0400B5C7 */  lwc1       $f21, 0x4($sp)
/* 6E2FC 0016E1FC 0000B4C7 */  lwc1       $f20, 0x0($sp)
/* 6E300 0016E200 D000BD27 */  addiu      $sp, $sp, 0xD0
/* 6E304 0016E204 0800E003 */  jr         $31
/* 6E308 0016E208 00000000 */   nop
/* 6E30C 0016E20C 00000000 */  nop
