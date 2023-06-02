.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawEscapeItem__Fiii
/* 109DC0 00209CC0 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 109DC4 00209CC4 5000BF7F */  sq         $31, 0x50($sp)
/* 109DC8 00209CC8 4000B47F */  sq         $20, 0x40($sp)
/* 109DCC 00209CCC 3000B37F */  sq         $19, 0x30($sp)
/* 109DD0 00209CD0 2000B27F */  sq         $18, 0x20($sp)
/* 109DD4 00209CD4 1000B17F */  sq         $17, 0x10($sp)
/* 109DD8 00209CD8 0000B07F */  sq         $16, 0x0($sp)
/* 109DDC 00209CDC 28A68070 */  paddub     $20, $4, $0
/* 109DE0 00209CE0 288EA070 */  paddub     $17, $5, $0
/* 109DE4 00209CE4 289EC070 */  paddub     $19, $6, $0
/* 109DE8 00209CE8 2900023C */  lui        $2, %hi(_6185)
/* 109DEC 00209CEC 90374224 */  addiu      $2, $2, %lo(_6185)
/* 109DF0 00209CF0 6000A827 */  addiu      $8, $sp, 0x60
/* 109DF4 00209CF4 00004778 */  lq         $7, 0x0($2)
/* 109DF8 00209CF8 100043DC */  ld         $3, 0x10($2)
/* 109DFC 00209CFC 180042C4 */  lwc1       $f2, 0x18($2)
/* 109E00 00209D00 0000077D */  sq         $7, 0x0($8)
/* 109E04 00209D04 100003FD */  sd         $3, 0x10($8)
/* 109E08 00209D08 180002E5 */  swc1       $f2, 0x18($8)
/* 109E0C 00209D0C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 109E10 00209D10 00688244 */  mtc1       $2, $f13
/* 109E14 00209D14 1C88828F */  lw         $2, -0x77E4($gp)
/* 109E18 00209D18 80100200 */  sll        $2, $2, 2
/* 109E1C 00209D1C 21105D00 */  addu       $2, $2, $sp
/* 109E20 00209D20 60004CC4 */  lwc1       $f12, 0x60($2)
/* 109E24 00209D24 985E080C */  jal        MenuHelpWinDraw__Fiiffi
/* 109E28 00209D28 00000000 */   nop
/* 109E2C 00209D2C 10003026 */  addiu      $16, $17, 0x10
/* 109E30 00209D30 E094848F */  lw         $4, -0x6B20($gp)
/* 109E34 00209D34 38B4080C */  jal        MenuTextureReload__Fi
/* 109E38 00209D38 00000000 */   nop
/* 109E3C 00209D3C A497828F */  lw         $2, -0x685C($gp)
/* 109E40 00209D40 09004014 */  bnez       $2, .L00209D68
/* 109E44 00209D44 00000000 */   nop
/* 109E48 00209D48 C701023C */  lui        $2, %hi(TexManager)
/* 109E4C 00209D4C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* 109E50 00209D50 2A00023C */  lui        $2, %hi(_930_3)
/* 109E54 00209D54 30D54524 */  addiu      $5, $2, %lo(_930_3)
/* 109E58 00209D58 FFFF0624 */  addiu      $6, $0, -0x1
/* 109E5C 00209D5C B4C4040C */  jal        GetTexture__15CTextureManagerFPci
/* 109E60 00209D60 00000000 */   nop
/* 109E64 00209D64 A49782AF */  sw         $2, -0x685C($gp)
.L00209D68:
/* 109E68 00209D68 D494828F */  lw         $2, -0x6B2C($gp)
/* 109E6C 00209D6C 46434694 */  lhu        $6, 0x4346($2)
/* 109E70 00209D70 E2FF2526 */  addiu      $5, $17, -0x1E
/* 109E74 00209D74 28268072 */  paddub     $4, $20, $0
/* 109E78 00209D78 283E6072 */  paddub     $7, $19, $0
/* 109E7C 00209D7C D8C4080C */  jal        CommonMoneyBoardDraw__Fiiii
/* 109E80 00209D80 00000000 */   nop
/* 109E84 00209D84 AF000424 */  addiu      $4, $0, 0xAF
/* 109E88 00209D88 6095858F */  lw         $5, -0x6AA0($gp)
/* 109E8C 00209D8C 4CC8080C */  jal        GetNowItemNum__FsP9ITEM_PACK
/* 109E90 00209D90 00000000 */   nop
/* 109E94 00209D94 288E4070 */  paddub     $17, $2, $0
/* 109E98 00209D98 AF000424 */  addiu      $4, $0, 0xAF
/* 109E9C 00209D9C D800A527 */  addiu      $5, $sp, 0xD8
/* 109EA0 00209DA0 DC00A627 */  addiu      $6, $sp, 0xDC
/* 109EA4 00209DA4 64B7080C */  jal        RetCTex__FsRiRi
/* 109EA8 00209DA8 00000000 */   nop
/* 109EAC 00209DAC DC00A48F */  lw         $4, 0xDC($sp)
/* 109EB0 00209DB0 D800A38F */  lw         $3, 0xD8($sp)
/* 109EB4 00209DB4 9000A3AF */  sw         $3, 0x90($sp)
/* 109EB8 00209DB8 9400A4AF */  sw         $4, 0x94($sp)
/* 109EBC 00209DBC 20000424 */  addiu      $4, $0, 0x20
/* 109EC0 00209DC0 9800A4AF */  sw         $4, 0x98($sp)
/* 109EC4 00209DC4 9C00A4AF */  sw         $4, 0x9C($sp)
/* 109EC8 00209DC8 14008326 */  addiu      $3, $20, 0x14
/* 109ECC 00209DCC 8000A3AF */  sw         $3, 0x80($sp)
/* 109ED0 00209DD0 8400B0AF */  sw         $16, 0x84($sp)
/* 109ED4 00209DD4 8800A4AF */  sw         $4, 0x88($sp)
/* 109ED8 00209DD8 8C00A4AF */  sw         $4, 0x8C($sp)
/* 109EDC 00209DDC 28264070 */  paddub     $4, $2, $0
/* 109EE0 00209DE0 8000A527 */  addiu      $5, $sp, 0x80
/* 109EE4 00209DE4 9000A627 */  addiu      $6, $sp, 0x90
/* 109EE8 00209DE8 283E6072 */  paddub     $7, $19, $0
/* 109EEC 00209DEC C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 109EF0 00209DF0 00000000 */   nop
/* 109EF4 00209DF4 60000224 */  addiu      $2, $0, 0x60
/* 109EF8 00209DF8 B000A2AF */  sw         $2, 0xB0($sp)
/* 109EFC 00209DFC 58000224 */  addiu      $2, $0, 0x58
/* 109F00 00209E00 B400A2AF */  sw         $2, 0xB4($sp)
/* 109F04 00209E04 10000324 */  addiu      $3, $0, 0x10
/* 109F08 00209E08 B800A3AF */  sw         $3, 0xB8($sp)
/* 109F0C 00209E0C BC00A3AF */  sw         $3, 0xBC($sp)
/* 109F10 00209E10 86008226 */  addiu      $2, $20, 0x86
/* 109F14 00209E14 A000A2AF */  sw         $2, 0xA0($sp)
/* 109F18 00209E18 08000226 */  addiu      $2, $16, 0x8
/* 109F1C 00209E1C A400A2AF */  sw         $2, 0xA4($sp)
/* 109F20 00209E20 A800A3AF */  sw         $3, 0xA8($sp)
/* 109F24 00209E24 AC00A3AF */  sw         $3, 0xAC($sp)
/* 109F28 00209E28 2895848F */  lw         $4, -0x6AD8($gp)
/* 109F2C 00209E2C A000A527 */  addiu      $5, $sp, 0xA0
/* 109F30 00209E30 B000A627 */  addiu      $6, $sp, 0xB0
/* 109F34 00209E34 283E6072 */  paddub     $7, $19, $0
/* 109F38 00209E38 C8B3080C */  jal        DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
/* 109F3C 00209E3C 00000000 */   nop
/* 109F40 00209E40 A2009226 */  addiu      $18, $20, 0xA2
/* 109F44 00209E44 28262072 */  paddub     $4, $17, $0
/* 109F48 00209E48 C0B7080C */  jal        GetNumberKeta__Fi
/* 109F4C 00209E4C 00000000 */   nop
/* 109F50 00209E50 40180200 */  sll        $3, $2, 1
/* 109F54 00209E54 21106200 */  addu       $2, $3, $2
/* 109F58 00209E58 40100200 */  sll        $2, $2, 1
/* 109F5C 00209E5C 21904202 */  addu       $18, $18, $2
/* 109F60 00209E60 08000626 */  addiu      $6, $16, 0x8
/* 109F64 00209E64 28262072 */  paddub     $4, $17, $0
/* 109F68 00209E68 282E4072 */  paddub     $5, $18, $0
/* 109F6C 00209E6C A096878F */  lw         $7, -0x6960($gp)
/* 109F70 00209E70 2900023C */  lui        $2, %hi(NumberSprite + 0x10)
/* 109F74 00209E74 202B4824 */  addiu      $8, $2, %lo(NumberSprite + 0x10)
/* 109F78 00209E78 02000924 */  addiu      $9, $0, 0x2
/* 109F7C 00209E7C 28566072 */  paddub     $10, $19, $0
/* 109F80 00209E80 705F080C */  jal        DrawMenuNumber__FiiiP8CTexture4RECTii
/* 109F84 00209E84 00000000 */   nop
/* 109F88 00209E88 2900023C */  lui        $2, %hi(_6188)
/* 109F8C 00209E8C B0374224 */  addiu      $2, $2, %lo(_6188)
/* 109F90 00209E90 C800A427 */  addiu      $4, $sp, 0xC8
/* 109F94 00209E94 000043DC */  ld         $3, 0x0($2)
/* 109F98 00209E98 080040C4 */  lwc1       $f0, 0x8($2)
/* 109F9C 00209E9C 0C004284 */  lh         $2, 0xC($2)
/* 109FA0 00209EA0 000083FC */  sd         $3, 0x0($4)
/* 109FA4 00209EA4 080080E4 */  swc1       $f0, 0x8($4)
/* 109FA8 00209EA8 0C0082A4 */  sh         $2, 0xC($4)
/* 109FAC 00209EAC DA01013C */  lui        $at, (0x1DA224C >> 16)
/* 109FB0 00209EB0 4C22238C */  lw         $3, (0x1DA224C & 0xFFFF)($at)
/* 109FB4 00209EB4 1C88828F */  lw         $2, -0x77E4($gp)
/* 109FB8 00209EB8 40100200 */  sll        $2, $2, 1
/* 109FBC 00209EBC 21105D00 */  addu       $2, $2, $sp
/* 109FC0 00209EC0 C8004584 */  lh         $5, 0xC8($2)
/* 109FC4 00209EC4 08006510 */  beq        $3, $5, .L00209EE8
/* 109FC8 00209EC8 00000000 */   nop
/* 109FCC 00209ECC 13010224 */  addiu      $2, $0, 0x113
/* 109FD0 00209ED0 DA01013C */  lui        $at, (0x1DA2270 >> 16)
/* 109FD4 00209ED4 702222AC */  sw         $2, (0x1DA2270 & 0xFFFF)($at)
/* 109FD8 00209ED8 DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 109FDC 00209EDC 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 109FE0 00209EE0 5441050C */  jal        MakeMesWin__6ClsMesFi
/* 109FE4 00209EE4 00000000 */   nop
.L00209EE8:
/* 109FE8 00209EE8 1C88828F */  lw         $2, -0x77E4($gp)
/* 109FEC 00209EEC 0D004018 */  blez       $2, .L00209F24
/* 109FF0 00209EF0 00000000 */   nop
/* 109FF4 00209EF4 10001026 */  addiu      $16, $16, 0x10
/* 109FF8 00209EF8 38008226 */  addiu      $2, $20, 0x38
/* 109FFC 00209EFC DA01013C */  lui        $at, (0x1DA22E0 >> 16)
/* 10A000 00209F00 E02222AC */  sw         $2, (0x1DA22E0 & 0xFFFF)($at)
/* 10A004 00209F04 ECFF0226 */  addiu      $2, $16, -0x14
/* 10A008 00209F08 DA01013C */  lui        $at, (0x1DA22E4 >> 16)
/* 10A00C 00209F0C E42222AC */  sw         $2, (0x1DA22E4 & 0xFFFF)($at)
/* 10A010 00209F10 3C008226 */  addiu      $2, $20, 0x3C
/* 10A014 00209F14 DA01013C */  lui        $at, (0x1DA22E8 >> 16)
/* 10A018 00209F18 E82222AC */  sw         $2, (0x1DA22E8 & 0xFFFF)($at)
/* 10A01C 00209F1C DA01013C */  lui        $at, (0x1DA22EC >> 16)
/* 10A020 00209F20 EC2230AC */  sw         $16, (0x1DA22EC & 0xFFFF)($at)
.L00209F24:
/* 10A024 00209F24 DA01013C */  lui        $at, (0x1DA22DC >> 16)
/* 10A028 00209F28 DC22248C */  lw         $4, (0x1DA22DC & 0xFFFF)($at)
/* 10A02C 00209F2C 38B4080C */  jal        MenuTextureReload__Fi
/* 10A030 00209F30 00000000 */   nop
/* 10A034 00209F34 DA01013C */  lui        $at, (0x1DA2264 >> 16)
/* 10A038 00209F38 642233AC */  sw         $19, (0x1DA2264 & 0xFFFF)($at)
/* 10A03C 00209F3C DA01013C */  lui        $at, (0x1DA0C28 >> 16)
/* 10A040 00209F40 280C20AC */  sw         $0, (0x1DA0C28 & 0xFFFF)($at)
/* 10A044 00209F44 38008526 */  addiu      $5, $20, 0x38
/* 10A048 00209F48 F0FF0626 */  addiu      $6, $16, -0x10
/* 10A04C 00209F4C DA01023C */  lui        $2, %hi(CommonMenuMes1)
/* 10A050 00209F50 900B4424 */  addiu      $4, $2, %lo(CommonMenuMes1)
/* 10A054 00209F54 A8B3080C */  jal        DrawMenuClsMes__FP6ClsMesii
/* 10A058 00209F58 00000000 */   nop
/* 10A05C 00209F5C 5000BF7B */  lq         $31, 0x50($sp)
/* 10A060 00209F60 4000B47B */  lq         $20, 0x40($sp)
/* 10A064 00209F64 3000B37B */  lq         $19, 0x30($sp)
/* 10A068 00209F68 2000B27B */  lq         $18, 0x20($sp)
/* 10A06C 00209F6C 1000B17B */  lq         $17, 0x10($sp)
/* 10A070 00209F70 0000B07B */  lq         $16, 0x0($sp)
/* 10A074 00209F74 E000BD27 */  addiu      $sp, $sp, 0xE0
/* 10A078 00209F78 0800E003 */  jr         $31
/* 10A07C 00209F7C 00000000 */   nop
