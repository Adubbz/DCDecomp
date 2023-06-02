.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Draw__14CMainItemModelFv
/* D4BD0 001D4AD0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* D4BD4 001D4AD4 5000BF7F */  sq         $31, 0x50($sp)
/* D4BD8 001D4AD8 4000B47F */  sq         $20, 0x40($sp)
/* D4BDC 001D4ADC 3000B37F */  sq         $19, 0x30($sp)
/* D4BE0 001D4AE0 2000B27F */  sq         $18, 0x20($sp)
/* D4BE4 001D4AE4 1000B17F */  sq         $17, 0x10($sp)
/* D4BE8 001D4AE8 0000B07F */  sq         $16, 0x0($sp)
/* D4BEC 001D4AEC 289E8070 */  paddub     $19, $4, $0
/* D4BF0 001D4AF0 EA01013C */  lui        $at, (0x1EA1DDC >> 16)
/* D4BF4 001D4AF4 DC1D248C */  lw         $4, (0x1EA1DDC & 0xFFFF)($at)
/* D4BF8 001D4AF8 2A00023C */  lui        $2, %hi(_796_2)
/* D4BFC 001D4AFC 80CE4524 */  addiu      $5, $2, %lo(_796_2)
/* D4C00 001D4B00 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* D4C04 001D4B04 00000000 */   nop
/* D4C08 001D4B08 28864070 */  paddub     $16, $2, $0
/* D4C0C 001D4B0C 288E0070 */  paddub     $17, $0, $0
/* D4C10 001D4B10 B7000010 */  b          .L001D4DF0
/* D4C14 001D4B14 00000000 */   nop
.L001D4B18:
/* D4C18 001D4B18 80181100 */  sll        $3, $17, 2
/* D4C1C 001D4B1C 21287300 */  addu       $5, $3, $19
/* D4C20 001D4B20 4800A48C */  lw         $4, 0x48($5)
/* D4C24 001D4B24 B1008010 */  beqz       $4, .L001D4DEC
/* D4C28 001D4B28 00000000 */   nop
/* D4C2C 001D4B2C FFFF0324 */  addiu      $3, $0, -0x1
/* D4C30 001D4B30 AE008310 */  beq        $4, $3, .L001D4DEC
/* D4C34 001D4B34 00000000 */   nop
/* D4C38 001D4B38 03000324 */  addiu      $3, $0, 0x3
/* D4C3C 001D4B3C 78008310 */  beq        $4, $3, .L001D4D20
/* D4C40 001D4B40 00000000 */   nop
/* D4C44 001D4B44 02000324 */  addiu      $3, $0, 0x2
/* D4C48 001D4B48 3C008310 */  beq        $4, $3, .L001D4C3C
/* D4C4C 001D4B4C 00000000 */   nop
/* D4C50 001D4B50 01000324 */  addiu      $3, $0, 0x1
/* D4C54 001D4B54 03008310 */  beq        $4, $3, .L001D4B64
/* D4C58 001D4B58 00000000 */   nop
/* D4C5C 001D4B5C A3000010 */  b          .L001D4DEC
/* D4C60 001D4B60 00000000 */   nop
.L001D4B64:
/* D4C64 001D4B64 8800B224 */  addiu      $18, $5, 0x88
/* D4C68 001D4B68 8800A28C */  lw         $2, 0x88($5)
/* D4C6C 001D4B6C 38004624 */  addiu      $6, $2, 0x38
/* D4C70 001D4B70 C701023C */  lui        $2, %hi(TexManager)
/* D4C74 001D4B74 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D4C78 001D4B78 D48B858F */  lw         $5, -0x742C($gp)
/* D4C7C 001D4B7C 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* D4C80 001D4B80 00000000 */   nop
/* D4C84 001D4B84 C0101100 */  sll        $2, $17, 3
/* D4C88 001D4B88 21105100 */  addu       $2, $2, $17
/* D4C8C 001D4B8C 40100200 */  sll        $2, $2, 1
/* D4C90 001D4B90 21105100 */  addu       $2, $2, $17
/* D4C94 001D4B94 40110200 */  sll        $2, $2, 5
/* D4C98 001D4B98 21106202 */  addu       $2, $19, $2
/* D4C9C 001D4B9C D0005424 */  addiu      $20, $2, 0xD0
/* D4CA0 001D4BA0 6000A427 */  addiu      $4, $sp, 0x60
/* D4CA4 001D4BA4 20028526 */  addiu      $5, $20, 0x220
/* D4CA8 001D4BA8 0C86040C */  jal        sceVu0CopyVector
/* D4CAC 001D4BAC 00000000 */   nop
/* D4CB0 001D4BB0 28268072 */  paddub     $4, $20, $0
/* D4CB4 001D4BB4 7000A527 */  addiu      $5, $sp, 0x70
/* D4CB8 001D4BB8 8CA3040C */  jal        GetRotation__6CFrameFPf
/* D4CBC 001D4BBC 00000000 */   nop
/* D4CC0 001D4BC0 0000428E */  lw         $2, 0x0($18)
/* D4CC4 001D4BC4 80100200 */  sll        $2, $2, 2
/* D4CC8 001D4BC8 21106202 */  addu       $2, $19, $2
/* D4CCC 001D4BCC 0000448C */  lw         $4, 0x0($2)
/* D4CD0 001D4BD0 6000A527 */  addiu      $5, $sp, 0x60
/* D4CD4 001D4BD4 B89F040C */  jal        SetPosition__6CFrameFPf
/* D4CD8 001D4BD8 00000000 */   nop
/* D4CDC 001D4BDC 0000428E */  lw         $2, 0x0($18)
/* D4CE0 001D4BE0 80100200 */  sll        $2, $2, 2
/* D4CE4 001D4BE4 21106202 */  addu       $2, $19, $2
/* D4CE8 001D4BE8 0000448C */  lw         $4, 0x0($2)
/* D4CEC 001D4BEC 7000ACC7 */  lwc1       $f12, 0x70($sp)
/* D4CF0 001D4BF0 7400ADC7 */  lwc1       $f13, 0x74($sp)
/* D4CF4 001D4BF4 7800AEC7 */  lwc1       $f14, 0x78($sp)
/* D4CF8 001D4BF8 70A3040C */  jal        SetRotation__6CFrameFfff
/* D4CFC 001D4BFC 00000000 */   nop
/* D4D00 001D4C00 0000428E */  lw         $2, 0x0($18)
/* D4D04 001D4C04 80100200 */  sll        $2, $2, 2
/* D4D08 001D4C08 21106202 */  addu       $2, $19, $2
/* D4D0C 001D4C0C 0000448C */  lw         $4, 0x0($2)
/* D4D10 001D4C10 282E0072 */  paddub     $5, $16, $0
/* D4D14 001D4C14 60A0040C */  jal        SetReference__6CFrameFP6CFrame
/* D4D18 001D4C18 00000000 */   nop
/* D4D1C 001D4C1C 0000428E */  lw         $2, 0x0($18)
/* D4D20 001D4C20 80100200 */  sll        $2, $2, 2
/* D4D24 001D4C24 21106202 */  addu       $2, $19, $2
/* D4D28 001D4C28 0000448C */  lw         $4, 0x0($2)
/* D4D2C 001D4C2C 60BB040C */  jal        MGDraw__FP6CFrame
/* D4D30 001D4C30 00000000 */   nop
/* D4D34 001D4C34 6D000010 */  b          .L001D4DEC
/* D4D38 001D4C38 00000000 */   nop
.L001D4C3C:
/* D4D3C 001D4C3C 8800B224 */  addiu      $18, $5, 0x88
/* D4D40 001D4C40 8800A28C */  lw         $2, 0x88($5)
/* D4D44 001D4C44 38004624 */  addiu      $6, $2, 0x38
/* D4D48 001D4C48 C701023C */  lui        $2, %hi(TexManager)
/* D4D4C 001D4C4C 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D4D50 001D4C50 D48B858F */  lw         $5, -0x742C($gp)
/* D4D54 001D4C54 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* D4D58 001D4C58 00000000 */   nop
/* D4D5C 001D4C5C C0101100 */  sll        $2, $17, 3
/* D4D60 001D4C60 21105100 */  addu       $2, $2, $17
/* D4D64 001D4C64 40100200 */  sll        $2, $2, 1
/* D4D68 001D4C68 21105100 */  addu       $2, $2, $17
/* D4D6C 001D4C6C 40110200 */  sll        $2, $2, 5
/* D4D70 001D4C70 21106202 */  addu       $2, $19, $2
/* D4D74 001D4C74 D0005424 */  addiu      $20, $2, 0xD0
/* D4D78 001D4C78 6000A427 */  addiu      $4, $sp, 0x60
/* D4D7C 001D4C7C 20028526 */  addiu      $5, $20, 0x220
/* D4D80 001D4C80 0C86040C */  jal        sceVu0CopyVector
/* D4D84 001D4C84 00000000 */   nop
/* D4D88 001D4C88 28268072 */  paddub     $4, $20, $0
/* D4D8C 001D4C8C 7000A527 */  addiu      $5, $sp, 0x70
/* D4D90 001D4C90 8CA3040C */  jal        GetRotation__6CFrameFPf
/* D4D94 001D4C94 00000000 */   nop
/* D4D98 001D4C98 28268072 */  paddub     $4, $20, $0
/* D4D9C 001D4C9C 6000A527 */  addiu      $5, $sp, 0x60
/* D4DA0 001D4CA0 B89F040C */  jal        SetPosition__6CFrameFPf
/* D4DA4 001D4CA4 00000000 */   nop
/* D4DA8 001D4CA8 0000428E */  lw         $2, 0x0($18)
/* D4DAC 001D4CAC 80100200 */  sll        $2, $2, 2
/* D4DB0 001D4CB0 21106202 */  addu       $2, $19, $2
/* D4DB4 001D4CB4 0000448C */  lw         $4, 0x0($2)
/* D4DB8 001D4CB8 6000A527 */  addiu      $5, $sp, 0x60
/* D4DBC 001D4CBC B89F040C */  jal        SetPosition__6CFrameFPf
/* D4DC0 001D4CC0 00000000 */   nop
/* D4DC4 001D4CC4 0000428E */  lw         $2, 0x0($18)
/* D4DC8 001D4CC8 80100200 */  sll        $2, $2, 2
/* D4DCC 001D4CCC 21106202 */  addu       $2, $19, $2
/* D4DD0 001D4CD0 0000448C */  lw         $4, 0x0($2)
/* D4DD4 001D4CD4 7000ACC7 */  lwc1       $f12, 0x70($sp)
/* D4DD8 001D4CD8 7400ADC7 */  lwc1       $f13, 0x74($sp)
/* D4DDC 001D4CDC 7800AEC7 */  lwc1       $f14, 0x78($sp)
/* D4DE0 001D4CE0 70A3040C */  jal        SetRotation__6CFrameFfff
/* D4DE4 001D4CE4 00000000 */   nop
/* D4DE8 001D4CE8 0000428E */  lw         $2, 0x0($18)
/* D4DEC 001D4CEC 80100200 */  sll        $2, $2, 2
/* D4DF0 001D4CF0 21106202 */  addu       $2, $19, $2
/* D4DF4 001D4CF4 0000448C */  lw         $4, 0x0($2)
/* D4DF8 001D4CF8 68A0040C */  jal        DeleteReference__6CFrameFv
/* D4DFC 001D4CFC 00000000 */   nop
/* D4E00 001D4D00 0000428E */  lw         $2, 0x0($18)
/* D4E04 001D4D04 80100200 */  sll        $2, $2, 2
/* D4E08 001D4D08 21106202 */  addu       $2, $19, $2
/* D4E0C 001D4D0C 0000448C */  lw         $4, 0x0($2)
/* D4E10 001D4D10 60BB040C */  jal        MGDraw__FP6CFrame
/* D4E14 001D4D14 00000000 */   nop
/* D4E18 001D4D18 34000010 */  b          .L001D4DEC
/* D4E1C 001D4D1C 00000000 */   nop
.L001D4D20:
/* D4E20 001D4D20 8800B224 */  addiu      $18, $5, 0x88
/* D4E24 001D4D24 8800A28C */  lw         $2, 0x88($5)
/* D4E28 001D4D28 38004624 */  addiu      $6, $2, 0x38
/* D4E2C 001D4D2C C701023C */  lui        $2, %hi(TexManager)
/* D4E30 001D4D30 70584424 */  addiu      $4, $2, %lo(TexManager)
/* D4E34 001D4D34 D48B858F */  lw         $5, -0x742C($gp)
/* D4E38 001D4D38 1CCC040C */  jal        ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* D4E3C 001D4D3C 00000000 */   nop
/* D4E40 001D4D40 0000428E */  lw         $2, 0x0($18)
/* D4E44 001D4D44 80100200 */  sll        $2, $2, 2
/* D4E48 001D4D48 21106202 */  addu       $2, $19, $2
/* D4E4C 001D4D4C 0000448C */  lw         $4, 0x0($2)
/* D4E50 001D4D50 68A0040C */  jal        DeleteReference__6CFrameFv
/* D4E54 001D4D54 00000000 */   nop
/* D4E58 001D4D58 C0101100 */  sll        $2, $17, 3
/* D4E5C 001D4D5C 21105100 */  addu       $2, $2, $17
/* D4E60 001D4D60 40100200 */  sll        $2, $2, 1
/* D4E64 001D4D64 21105100 */  addu       $2, $2, $17
/* D4E68 001D4D68 40110200 */  sll        $2, $2, 5
/* D4E6C 001D4D6C 21106202 */  addu       $2, $19, $2
/* D4E70 001D4D70 D0005424 */  addiu      $20, $2, 0xD0
/* D4E74 001D4D74 6000A427 */  addiu      $4, $sp, 0x60
/* D4E78 001D4D78 20028526 */  addiu      $5, $20, 0x220
/* D4E7C 001D4D7C 0C86040C */  jal        sceVu0CopyVector
/* D4E80 001D4D80 00000000 */   nop
/* D4E84 001D4D84 28268072 */  paddub     $4, $20, $0
/* D4E88 001D4D88 7000A527 */  addiu      $5, $sp, 0x70
/* D4E8C 001D4D8C 8CA3040C */  jal        GetRotation__6CFrameFPf
/* D4E90 001D4D90 00000000 */   nop
/* D4E94 001D4D94 0000428E */  lw         $2, 0x0($18)
/* D4E98 001D4D98 80100200 */  sll        $2, $2, 2
/* D4E9C 001D4D9C 21106202 */  addu       $2, $19, $2
/* D4EA0 001D4DA0 0000448C */  lw         $4, 0x0($2)
/* D4EA4 001D4DA4 6000A527 */  addiu      $5, $sp, 0x60
/* D4EA8 001D4DA8 B89F040C */  jal        SetPosition__6CFrameFPf
/* D4EAC 001D4DAC 00000000 */   nop
/* D4EB0 001D4DB0 0000428E */  lw         $2, 0x0($18)
/* D4EB4 001D4DB4 80100200 */  sll        $2, $2, 2
/* D4EB8 001D4DB8 21106202 */  addu       $2, $19, $2
/* D4EBC 001D4DBC 0000448C */  lw         $4, 0x0($2)
/* D4EC0 001D4DC0 7000ACC7 */  lwc1       $f12, 0x70($sp)
/* D4EC4 001D4DC4 7400ADC7 */  lwc1       $f13, 0x74($sp)
/* D4EC8 001D4DC8 7800AEC7 */  lwc1       $f14, 0x78($sp)
/* D4ECC 001D4DCC 70A3040C */  jal        SetRotation__6CFrameFfff
/* D4ED0 001D4DD0 00000000 */   nop
/* D4ED4 001D4DD4 0000428E */  lw         $2, 0x0($18)
/* D4ED8 001D4DD8 80100200 */  sll        $2, $2, 2
/* D4EDC 001D4DDC 21106202 */  addu       $2, $19, $2
/* D4EE0 001D4DE0 0000448C */  lw         $4, 0x0($2)
/* D4EE4 001D4DE4 60BB040C */  jal        MGDraw__FP6CFrame
/* D4EE8 001D4DE8 00000000 */   nop
.L001D4DEC:
/* D4EEC 001D4DEC 01003126 */  addiu      $17, $17, 0x1
.L001D4DF0:
/* D4EF0 001D4DF0 1000232A */  slti       $3, $17, 0x10
/* D4EF4 001D4DF4 48FF6014 */  bnez       $3, .L001D4B18
/* D4EF8 001D4DF8 00000000 */   nop
/* D4EFC 001D4DFC 5000BF7B */  lq         $31, 0x50($sp)
/* D4F00 001D4E00 4000B47B */  lq         $20, 0x40($sp)
/* D4F04 001D4E04 3000B37B */  lq         $19, 0x30($sp)
/* D4F08 001D4E08 2000B27B */  lq         $18, 0x20($sp)
/* D4F0C 001D4E0C 1000B17B */  lq         $17, 0x10($sp)
/* D4F10 001D4E10 0000B07B */  lq         $16, 0x0($sp)
/* D4F14 001D4E14 8000BD27 */  addiu      $sp, $sp, 0x80
/* D4F18 001D4E18 0800E003 */  jr         $31
/* D4F1C 001D4E1C 00000000 */   nop
