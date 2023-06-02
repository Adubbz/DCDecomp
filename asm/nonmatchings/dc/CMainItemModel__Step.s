.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Step__14CMainItemModelFv
/* D4F20 001D4E20 80FFBD27 */  addiu      $sp, $sp, -0x80
/* D4F24 001D4E24 5000BF7F */  sq         $31, 0x50($sp)
/* D4F28 001D4E28 4000B47F */  sq         $20, 0x40($sp)
/* D4F2C 001D4E2C 3000B37F */  sq         $19, 0x30($sp)
/* D4F30 001D4E30 2000B27F */  sq         $18, 0x20($sp)
/* D4F34 001D4E34 1000B17F */  sq         $17, 0x10($sp)
/* D4F38 001D4E38 0000B07F */  sq         $16, 0x0($sp)
/* D4F3C 001D4E3C 289E8070 */  paddub     $19, $4, $0
/* D4F40 001D4E40 2800033C */  lui        $3, %hi(_937)
/* D4F44 001D4E44 00EB6324 */  addiu      $3, $3, %lo(_937)
/* D4F48 001D4E48 7000A427 */  addiu      $4, $sp, 0x70
/* D4F4C 001D4E4C 00006378 */  lq         $3, 0x0($3)
/* D4F50 001D4E50 0000837C */  sq         $3, 0x0($4)
/* D4F54 001D4E54 28860070 */  paddub     $16, $0, $0
/* D4F58 001D4E58 2D010010 */  b          .L001D5310
/* D4F5C 001D4E5C 00000000 */   nop
.L001D4E60:
/* D4F60 001D4E60 80901000 */  sll        $18, $16, 2
/* D4F64 001D4E64 21185302 */  addu       $3, $18, $19
/* D4F68 001D4E68 4800648C */  lw         $4, 0x48($3)
/* D4F6C 001D4E6C 27018010 */  beqz       $4, .L001D530C
/* D4F70 001D4E70 00000000 */   nop
/* D4F74 001D4E74 FFFF0324 */  addiu      $3, $0, -0x1
/* D4F78 001D4E78 24018310 */  beq        $4, $3, .L001D530C
/* D4F7C 001D4E7C 00000000 */   nop
/* D4F80 001D4E80 03000324 */  addiu      $3, $0, 0x3
/* D4F84 001D4E84 21018310 */  beq        $4, $3, .L001D530C
/* D4F88 001D4E88 00000000 */   nop
/* D4F8C 001D4E8C 02000324 */  addiu      $3, $0, 0x2
/* D4F90 001D4E90 06008310 */  beq        $4, $3, .L001D4EAC
/* D4F94 001D4E94 00000000 */   nop
/* D4F98 001D4E98 01000324 */  addiu      $3, $0, 0x1
/* D4F9C 001D4E9C 1B018310 */  beq        $4, $3, .L001D530C
/* D4FA0 001D4EA0 00000000 */   nop
/* D4FA4 001D4EA4 19010010 */  b          .L001D530C
/* D4FA8 001D4EA8 00000000 */   nop
.L001D4EAC:
/* D4FAC 001D4EAC C0101000 */  sll        $2, $16, 3
/* D4FB0 001D4EB0 21105000 */  addu       $2, $2, $16
/* D4FB4 001D4EB4 40100200 */  sll        $2, $2, 1
/* D4FB8 001D4EB8 21105000 */  addu       $2, $2, $16
/* D4FBC 001D4EBC 40110200 */  sll        $2, $2, 5
/* D4FC0 001D4EC0 21106202 */  addu       $2, $19, $2
/* D4FC4 001D4EC4 D0005124 */  addiu      $17, $2, 0xD0
/* D4FC8 001D4EC8 6000A427 */  addiu      $4, $sp, 0x60
/* D4FCC 001D4ECC 20022526 */  addiu      $5, $17, 0x220
/* D4FD0 001D4ED0 0C86040C */  jal        sceVu0CopyVector
/* D4FD4 001D4ED4 00000000 */   nop
/* D4FD8 001D4ED8 00111000 */  sll        $2, $16, 4
/* D4FDC 001D4EDC 21106202 */  addu       $2, $19, $2
/* D4FE0 001D4EE0 6000A427 */  addiu      $4, $sp, 0x60
/* D4FE4 001D4EE4 D0264524 */  addiu      $5, $2, 0x26D0
/* D4FE8 001D4EE8 9850070C */  jal        ItemThrowStep__FPfPf
/* D4FEC 001D4EEC 00000000 */   nop
/* D4FF0 001D4EF0 28A64070 */  paddub     $20, $2, $0
/* D4FF4 001D4EF4 28262072 */  paddub     $4, $17, $0
/* D4FF8 001D4EF8 6000A527 */  addiu      $5, $sp, 0x60
/* D4FFC 001D4EFC B89F040C */  jal        SetPosition__6CFrameFPf
/* D5000 001D4F00 00000000 */   nop
/* D5004 001D4F04 02000324 */  addiu      $3, $0, 0x2
/* D5008 001D4F08 04008316 */  bne        $20, $3, .L001D4F1C
/* D500C 001D4F0C 00000000 */   nop
/* D5010 001D4F10 2D000424 */  addiu      $4, $0, 0x2D
/* D5014 001D4F14 21185302 */  addu       $3, $18, $19
/* D5018 001D4F18 D02764AC */  sw         $4, 0x27D0($3)
.L001D4F1C:
/* D501C 001D4F1C 21205302 */  addu       $4, $18, $19
/* D5020 001D4F20 D0278524 */  addiu      $5, $4, 0x27D0
/* D5024 001D4F24 D027838C */  lw         $3, 0x27D0($4)
/* D5028 001D4F28 01006324 */  addiu      $3, $3, 0x1
/* D502C 001D4F2C D02783AC */  sw         $3, 0x27D0($4)
/* D5030 001D4F30 D027838C */  lw         $3, 0x27D0($4)
/* D5034 001D4F34 2D006328 */  slti       $3, $3, 0x2D
/* D5038 001D4F38 F4006014 */  bnez       $3, .L001D530C
/* D503C 001D4F3C 00000000 */   nop
/* D5040 001D4F40 0000A0AC */  sw         $0, 0x0($5)
/* D5044 001D4F44 8800828C */  lw         $2, 0x88($4)
/* D5048 001D4F48 80100200 */  sll        $2, $2, 2
/* D504C 001D4F4C 21105300 */  addu       $2, $2, $19
/* D5050 001D4F50 1800518C */  lw         $17, 0x18($2)
/* D5054 001D4F54 A5000224 */  addiu      $2, $0, 0xA5
/* D5058 001D4F58 B7002212 */  beq        $17, $2, .L001D5238
/* D505C 001D4F5C 00000000 */   nop
/* D5060 001D4F60 A4000224 */  addiu      $2, $0, 0xA4
/* D5064 001D4F64 B4002212 */  beq        $17, $2, .L001D5238
/* D5068 001D4F68 00000000 */   nop
/* D506C 001D4F6C A3000224 */  addiu      $2, $0, 0xA3
/* D5070 001D4F70 B1002212 */  beq        $17, $2, .L001D5238
/* D5074 001D4F74 00000000 */   nop
/* D5078 001D4F78 A2000224 */  addiu      $2, $0, 0xA2
/* D507C 001D4F7C AE002212 */  beq        $17, $2, .L001D5238
/* D5080 001D4F80 00000000 */   nop
/* D5084 001D4F84 A1000224 */  addiu      $2, $0, 0xA1
/* D5088 001D4F88 AB002212 */  beq        $17, $2, .L001D5238
/* D508C 001D4F8C 00000000 */   nop
/* D5090 001D4F90 98000224 */  addiu      $2, $0, 0x98
/* D5094 001D4F94 73002212 */  beq        $17, $2, .L001D5164
/* D5098 001D4F98 00000000 */   nop
/* D509C 001D4F9C 9F000224 */  addiu      $2, $0, 0x9F
/* D50A0 001D4FA0 5F002212 */  beq        $17, $2, .L001D5120
/* D50A4 001D4FA4 00000000 */   nop
/* D50A8 001D4FA8 A9000224 */  addiu      $2, $0, 0xA9
/* D50AC 001D4FAC 48002212 */  beq        $17, $2, .L001D50D0
/* D50B0 001D4FB0 00000000 */   nop
/* D50B4 001D4FB4 A6000224 */  addiu      $2, $0, 0xA6
/* D50B8 001D4FB8 31002212 */  beq        $17, $2, .L001D5080
/* D50BC 001D4FBC 00000000 */   nop
/* D50C0 001D4FC0 A7000224 */  addiu      $2, $0, 0xA7
/* D50C4 001D4FC4 1A002212 */  beq        $17, $2, .L001D5030
/* D50C8 001D4FC8 00000000 */   nop
/* D50CC 001D4FCC A0000224 */  addiu      $2, $0, 0xA0
/* D50D0 001D4FD0 03002212 */  beq        $17, $2, .L001D4FE0
/* D50D4 001D4FD4 00000000 */   nop
/* D50D8 001D4FD8 51000010 */  b          .L001D5120
/* D50DC 001D4FDC 00000000 */   nop
.L001D4FE0:
/* D50E0 001D4FE0 0041023C */  lui        $2, (0x41000000 >> 16)
/* D50E4 001D4FE4 00608244 */  mtc1       $2, $f12
/* D50E8 001D4FE8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D50EC 001D4FEC 00688244 */  mtc1       $2, $f13
/* D50F0 001D4FF0 F09D848F */  lw         $4, -0x6210($gp)
/* D50F4 001D4FF4 6000A527 */  addiu      $5, $sp, 0x60
/* D50F8 001D4FF8 08000624 */  addiu      $6, $0, 0x8
/* D50FC 001D4FFC 05000724 */  addiu      $7, $0, 0x5
/* D5100 001D5000 02000824 */  addiu      $8, $0, 0x2
/* D5104 001D5004 284E0071 */  paddub     $9, $8, $0
/* D5108 001D5008 28560070 */  paddub     $10, $0, $0
/* D510C 001D500C 285E0070 */  paddub     $11, $0, $0
/* D5110 001D5010 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* D5114 001D5014 00000000 */   nop
/* D5118 001D5018 28266072 */  paddub     $4, $19, $0
/* D511C 001D501C 282E0072 */  paddub     $5, $16, $0
/* D5120 001D5020 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* D5124 001D5024 00000000 */   nop
/* D5128 001D5028 B8000010 */  b          .L001D530C
/* D512C 001D502C 00000000 */   nop
.L001D5030:
/* D5130 001D5030 0041023C */  lui        $2, (0x41000000 >> 16)
/* D5134 001D5034 00608244 */  mtc1       $2, $f12
/* D5138 001D5038 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D513C 001D503C 00688244 */  mtc1       $2, $f13
/* D5140 001D5040 F09D848F */  lw         $4, -0x6210($gp)
/* D5144 001D5044 6000A527 */  addiu      $5, $sp, 0x60
/* D5148 001D5048 08000624 */  addiu      $6, $0, 0x8
/* D514C 001D504C 05000724 */  addiu      $7, $0, 0x5
/* D5150 001D5050 02000824 */  addiu      $8, $0, 0x2
/* D5154 001D5054 284E0071 */  paddub     $9, $8, $0
/* D5158 001D5058 00080A24 */  addiu      $10, $0, 0x800
/* D515C 001D505C 285E0070 */  paddub     $11, $0, $0
/* D5160 001D5060 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* D5164 001D5064 00000000 */   nop
/* D5168 001D5068 28266072 */  paddub     $4, $19, $0
/* D516C 001D506C 282E0072 */  paddub     $5, $16, $0
/* D5170 001D5070 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* D5174 001D5074 00000000 */   nop
/* D5178 001D5078 A4000010 */  b          .L001D530C
/* D517C 001D507C 00000000 */   nop
.L001D5080:
/* D5180 001D5080 0041023C */  lui        $2, (0x41000000 >> 16)
/* D5184 001D5084 00608244 */  mtc1       $2, $f12
/* D5188 001D5088 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D518C 001D508C 00688244 */  mtc1       $2, $f13
/* D5190 001D5090 F09D848F */  lw         $4, -0x6210($gp)
/* D5194 001D5094 6000A527 */  addiu      $5, $sp, 0x60
/* D5198 001D5098 02000624 */  addiu      $6, $0, 0x2
/* D519C 001D509C 05000724 */  addiu      $7, $0, 0x5
/* D51A0 001D50A0 2846C070 */  paddub     $8, $6, $0
/* D51A4 001D50A4 284EC070 */  paddub     $9, $6, $0
/* D51A8 001D50A8 00010A24 */  addiu      $10, $0, 0x100
/* D51AC 001D50AC 285E0070 */  paddub     $11, $0, $0
/* D51B0 001D50B0 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* D51B4 001D50B4 00000000 */   nop
/* D51B8 001D50B8 28266072 */  paddub     $4, $19, $0
/* D51BC 001D50BC 282E0072 */  paddub     $5, $16, $0
/* D51C0 001D50C0 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* D51C4 001D50C4 00000000 */   nop
/* D51C8 001D50C8 90000010 */  b          .L001D530C
/* D51CC 001D50CC 00000000 */   nop
.L001D50D0:
/* D51D0 001D50D0 0041023C */  lui        $2, (0x41000000 >> 16)
/* D51D4 001D50D4 00608244 */  mtc1       $2, $f12
/* D51D8 001D50D8 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D51DC 001D50DC 00688244 */  mtc1       $2, $f13
/* D51E0 001D50E0 F09D848F */  lw         $4, -0x6210($gp)
/* D51E4 001D50E4 6000A527 */  addiu      $5, $sp, 0x60
/* D51E8 001D50E8 02000624 */  addiu      $6, $0, 0x2
/* D51EC 001D50EC 05000724 */  addiu      $7, $0, 0x5
/* D51F0 001D50F0 2846C070 */  paddub     $8, $6, $0
/* D51F4 001D50F4 284EC070 */  paddub     $9, $6, $0
/* D51F8 001D50F8 00020A24 */  addiu      $10, $0, 0x200
/* D51FC 001D50FC 285E0070 */  paddub     $11, $0, $0
/* D5200 001D5100 E8D5060C */  jal        Set__14CCollisionDataFPfiiffiiii
/* D5204 001D5104 00000000 */   nop
/* D5208 001D5108 28266072 */  paddub     $4, $19, $0
/* D520C 001D510C 282E0072 */  paddub     $5, $16, $0
/* D5210 001D5110 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* D5214 001D5114 00000000 */   nop
/* D5218 001D5118 7C000010 */  b          .L001D530C
/* D521C 001D511C 00000000 */   nop
.L001D5120:
/* D5220 001D5120 A49D828F */  lw         $2, -0x625C($gp)
/* D5224 001D5124 01004324 */  addiu      $3, $2, 0x1
/* D5228 001D5128 00110300 */  sll        $2, $3, 4
/* D522C 001D512C 23104300 */  subu       $2, $2, $3
/* D5230 001D5130 40300200 */  sll        $6, $2, 1
/* D5234 001D5134 803F023C */  lui        $2, (0x3F800000 >> 16)
/* D5238 001D5138 00608244 */  mtc1       $2, $f12
/* D523C 001D513C 6000A427 */  addiu      $4, $sp, 0x60
/* D5240 001D5140 03000524 */  addiu      $5, $0, 0x3
/* D5244 001D5144 5056070C */  jal        SetBombEffect__FPfiif
/* D5248 001D5148 00000000 */   nop
/* D524C 001D514C 28266072 */  paddub     $4, $19, $0
/* D5250 001D5150 282E0072 */  paddub     $5, $16, $0
/* D5254 001D5154 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* D5258 001D5158 00000000 */   nop
/* D525C 001D515C 6B000010 */  b          .L001D530C
/* D5260 001D5160 00000000 */   nop
.L001D5164:
/* D5264 001D5164 69000424 */  addiu      $4, $0, 0x69
/* D5268 001D5168 FFFF0524 */  addiu      $5, $0, -0x1
/* D526C 001D516C 28360070 */  paddub     $6, $0, $0
/* D5270 001D5170 AC69050C */  jal        SndSePlay__Fiii
/* D5274 001D5174 00000000 */   nop
/* D5278 001D5178 6C000424 */  addiu      $4, $0, 0x6C
/* D527C 001D517C FFFF0524 */  addiu      $5, $0, -0x1
/* D5280 001D5180 28360070 */  paddub     $6, $0, $0
/* D5284 001D5184 AC69050C */  jal        SndSePlay__Fiii
/* D5288 001D5188 00000000 */   nop
/* D528C 001D518C E801023C */  lui        $2, %hi(D_1E83900)
/* D5290 001D5190 00394424 */  addiu      $4, $2, %lo(D_1E83900)
/* D5294 001D5194 6000A527 */  addiu      $5, $sp, 0x60
/* D5298 001D5198 7000A627 */  addiu      $6, $sp, 0x70
/* D529C 001D519C FFFF0724 */  addiu      $7, $0, -0x1
/* D52A0 001D51A0 2846E070 */  paddub     $8, $7, $0
/* D52A4 001D51A4 284E0070 */  paddub     $9, $0, $0
/* D52A8 001D51A8 28560070 */  paddub     $10, $0, $0
/* D52AC 001D51AC 285EE070 */  paddub     $11, $7, $0
/* D52B0 001D51B0 58B7060C */  jal        Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* D52B4 001D51B4 00000000 */   nop
/* D52B8 001D51B8 A49D828F */  lw         $2, -0x625C($gp)
/* D52BC 001D51BC 01004224 */  addiu      $2, $2, 0x1
/* D52C0 001D51C0 00008244 */  mtc1       $2, $f0
/* D52C4 001D51C4 00000000 */  nop
/* D52C8 001D51C8 60008046 */  cvt.s.w    $f1, $f0
/* D52CC 001D51CC F041023C */  lui        $2, (0x41F00000 >> 16)
/* D52D0 001D51D0 00008244 */  mtc1       $2, $f0
/* D52D4 001D51D4 00000000 */  nop
/* D52D8 001D51D8 02030146 */  mul.s      $f12, $f0, $f1
/* D52DC 001D51DC 2C44040C */  jal        fptosi
/* D52E0 001D51E0 00000000 */   nop
/* D52E4 001D51E4 E801033C */  lui        $3, %hi(D_1E83900)
/* D52E8 001D51E8 00396424 */  addiu      $4, $3, %lo(D_1E83900)
/* D52EC 001D51EC 282E4070 */  paddub     $5, $2, $0
/* D52F0 001D51F0 C4B8060C */  jal        SetDmg__12CSHOT_EFFECTFi
/* D52F4 001D51F4 00000000 */   nop
/* D52F8 001D51F8 E801023C */  lui        $2, %hi(D_1E83900)
/* D52FC 001D51FC 00394424 */  addiu      $4, $2, %lo(D_1E83900)
/* D5300 001D5200 01000524 */  addiu      $5, $0, 0x1
/* D5304 001D5204 B4B8060C */  jal        SetEnemyAttr__12CSHOT_EFFECTFi
/* D5308 001D5208 00000000 */   nop
/* D530C 001D520C E801023C */  lui        $2, %hi(D_1E83900)
/* D5310 001D5210 00394424 */  addiu      $4, $2, %lo(D_1E83900)
/* D5314 001D5214 02000524 */  addiu      $5, $0, 0x2
/* D5318 001D5218 70B8060C */  jal        SetWait__12CSHOT_EFFECTFi
/* D531C 001D521C 00000000 */   nop
/* D5320 001D5220 28266072 */  paddub     $4, $19, $0
/* D5324 001D5224 282E0072 */  paddub     $5, $16, $0
/* D5328 001D5228 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* D532C 001D522C 00000000 */   nop
/* D5330 001D5230 36000010 */  b          .L001D530C
/* D5334 001D5234 00000000 */   nop
.L001D5238:
/* D5338 001D5238 C4FF2426 */  addiu      $4, $17, -0x3C
/* D533C 001D523C FFFF0524 */  addiu      $5, $0, -0x1
/* D5340 001D5240 28360070 */  paddub     $6, $0, $0
/* D5344 001D5244 AC69050C */  jal        SndSePlay__Fiii
/* D5348 001D5248 00000000 */   nop
/* D534C 001D524C 6C000424 */  addiu      $4, $0, 0x6C
/* D5350 001D5250 FFFF0524 */  addiu      $5, $0, -0x1
/* D5354 001D5254 28360070 */  paddub     $6, $0, $0
/* D5358 001D5258 AC69050C */  jal        SndSePlay__Fiii
/* D535C 001D525C 00000000 */   nop
/* D5360 001D5260 5FFF2326 */  addiu      $3, $17, -0xA1
/* D5364 001D5264 60A10234 */  ori        $2, $0, 0xA160
/* D5368 001D5268 18186200 */  mult       $3, $3, $2
/* D536C 001D526C E601023C */  lui        $2, %hi(D_1E5B380)
/* D5370 001D5270 80B34224 */  addiu      $2, $2, %lo(D_1E5B380)
/* D5374 001D5274 21884300 */  addu       $17, $2, $3
/* D5378 001D5278 28262072 */  paddub     $4, $17, $0
/* D537C 001D527C 6000A527 */  addiu      $5, $sp, 0x60
/* D5380 001D5280 7000A627 */  addiu      $6, $sp, 0x70
/* D5384 001D5284 FFFF0724 */  addiu      $7, $0, -0x1
/* D5388 001D5288 2846E070 */  paddub     $8, $7, $0
/* D538C 001D528C 284E0070 */  paddub     $9, $0, $0
/* D5390 001D5290 28560070 */  paddub     $10, $0, $0
/* D5394 001D5294 285EE070 */  paddub     $11, $7, $0
/* D5398 001D5298 58B7060C */  jal        Set__12CSHOT_EFFECTFPfPfiiiP6CFramei
/* D539C 001D529C 00000000 */   nop
/* D53A0 001D52A0 A49D828F */  lw         $2, -0x625C($gp)
/* D53A4 001D52A4 01004224 */  addiu      $2, $2, 0x1
/* D53A8 001D52A8 00008244 */  mtc1       $2, $f0
/* D53AC 001D52AC 00000000 */  nop
/* D53B0 001D52B0 60008046 */  cvt.s.w    $f1, $f0
/* D53B4 001D52B4 F041023C */  lui        $2, (0x41F00000 >> 16)
/* D53B8 001D52B8 00008244 */  mtc1       $2, $f0
/* D53BC 001D52BC 00000000 */  nop
/* D53C0 001D52C0 02030146 */  mul.s      $f12, $f0, $f1
/* D53C4 001D52C4 2C44040C */  jal        fptosi
/* D53C8 001D52C8 00000000 */   nop
/* D53CC 001D52CC 28262072 */  paddub     $4, $17, $0
/* D53D0 001D52D0 282E4070 */  paddub     $5, $2, $0
/* D53D4 001D52D4 C4B8060C */  jal        SetDmg__12CSHOT_EFFECTFi
/* D53D8 001D52D8 00000000 */   nop
/* D53DC 001D52DC 28262072 */  paddub     $4, $17, $0
/* D53E0 001D52E0 0A000524 */  addiu      $5, $0, 0xA
/* D53E4 001D52E4 A4B8060C */  jal        SetLifeTime__12CSHOT_EFFECTFi
/* D53E8 001D52E8 00000000 */   nop
/* D53EC 001D52EC 28262072 */  paddub     $4, $17, $0
/* D53F0 001D52F0 05000524 */  addiu      $5, $0, 0x5
/* D53F4 001D52F4 70B8060C */  jal        SetWait__12CSHOT_EFFECTFi
/* D53F8 001D52F8 00000000 */   nop
/* D53FC 001D52FC 28266072 */  paddub     $4, $19, $0
/* D5400 001D5300 282E0072 */  paddub     $5, $16, $0
/* D5404 001D5304 DC51070C */  jal        DeleteModel__14CMainItemModelFi
/* D5408 001D5308 00000000 */   nop
.L001D530C:
/* D540C 001D530C 01001026 */  addiu      $16, $16, 0x1
.L001D5310:
/* D5410 001D5310 1000032A */  slti       $3, $16, 0x10
/* D5414 001D5314 D2FE6014 */  bnez       $3, .L001D4E60
/* D5418 001D5318 00000000 */   nop
/* D541C 001D531C 5000BF7B */  lq         $31, 0x50($sp)
/* D5420 001D5320 4000B47B */  lq         $20, 0x40($sp)
/* D5424 001D5324 3000B37B */  lq         $19, 0x30($sp)
/* D5428 001D5328 2000B27B */  lq         $18, 0x20($sp)
/* D542C 001D532C 1000B17B */  lq         $17, 0x10($sp)
/* D5430 001D5330 0000B07B */  lq         $16, 0x0($sp)
/* D5434 001D5334 8000BD27 */  addiu      $sp, $sp, 0x80
/* D5438 001D5338 0800E003 */  jr         $31
/* D543C 001D533C 00000000 */   nop