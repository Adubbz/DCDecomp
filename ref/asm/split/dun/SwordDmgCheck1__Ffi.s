.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SwordDmgCheck1__Ffi
/* 00DE30 01DB9B30 80FFBD27 */  addiu       $29, $29, -0x80
/* 00DE34 01DB9B34 3000BF7F */  sq          $31, 0x30($29)
/* 00DE38 01DB9B38 2000B17F */  sq          $17, 0x20($29)
/* 00DE3C 01DB9B3C 1000B07F */  sq          $16, 0x10($29)
/* 00DE40 01DB9B40 0800B6E7 */  swc1        $f22, 0x8($29)
/* 00DE44 01DB9B44 0400B5E7 */  swc1        $f21, 0x4($29)
/* 00DE48 01DB9B48 0000B4E7 */  swc1        $f20, 0x0($29)
/* 00DE4C 01DB9B4C 86650046 */  mov.s       $f22, $f12
/* 00DE50 01DB9B50 28868070 */  paddub      $16, $4, $0
/* 00DE54 01DB9B54 789C868F */  lw          $6, -0x6388($28)
/* 00DE58 01DB9B58 0400C480 */  lb          $4, 0x4($6)
/* 00DE5C 01DB9B5C 21108600 */  addu        $2, $4, $6
/* 00DE60 01DB9B60 40434380 */  lb          $3, 0x4340($2)
/* 00DE64 01DB9B64 40110300 */  sll         $2, $3, 5
/* 00DE68 01DB9B68 23104300 */  subu        $2, $2, $3
/* 00DE6C 01DB9B6C C0180200 */  sll         $3, $2, 3
/* 00DE70 01DB9B70 A80A0224 */  addiu       $2, $0, 0xAA8
/* 00DE74 01DB9B74 18108200 */  mult        $2, $4, $2
/* 00DE78 01DB9B78 2110C200 */  addu        $2, $6, $2
/* 00DE7C 01DB9B7C 21104300 */  addu        $2, $2, $3
/* 00DE80 01DB9B80 0C455124 */  addiu       $17, $2, 0x450C
/* 00DE84 01DB9B84 1C4554C4 */  lwc1        $f20, 0x451C($2)
/* 00DE88 01DB9B88 18454484 */  lh          $4, 0x4518($2)
/* 00DE8C 01DB9B8C FC40040C */  jal         litodp
/* 00DE90 01DB9B90 00000000 */   nop
/* 00DE94 01DB9B94 288084DF */  ld          $4, -0x7FD8($28)
/* 00DE98 01DB9B98 282E4070 */  paddub      $5, $2, $0
/* 00DE9C 01DB9B9C 9E3F040C */  jal         dpmul
/* 00DEA0 01DB9BA0 00000000 */   nop
/* 00DEA4 01DB9BA4 28264070 */  paddub      $4, $2, $0
/* 00DEA8 01DB9BA8 9241040C */  jal         dptofp
/* 00DEAC 01DB9BAC 00000000 */   nop
/* 00DEB0 01DB9BB0 46050046 */  mov.s       $f21, $f0
/* 00DEB4 01DB9BB4 06B30046 */  mov.s       $f12, $f22
/* 00DEB8 01DB9BB8 28260072 */  paddub      $4, $16, $0
/* 00DEBC 01DB9BBC 64D7060C */  jal         BattleSubWeaponDmg__Ffi
/* 00DEC0 01DB9BC0 00000000 */   nop
/* 00DEC4 01DB9BC4 28864070 */  paddub      $16, $2, $0
/* 00DEC8 01DB9BC8 00002486 */  lh          $4, 0x0($17)
/* 00DECC 01DB9BCC 10010324 */  addiu       $3, $0, 0x110
/* 00DED0 01DB9BD0 1E008314 */  bne         $4, $3, .L01DB9C4C_2F524C
/* 00DED4 01DB9BD4 00000000 */   nop
/* 00DED8 01DB9BD8 100020C6 */  lwc1        $f0, 0x10($17)
/* 00DEDC 01DB9BDC 36001546 */  c.le.s      $f0, $f21
/* 00DEE0 01DB9BE0 00000000 */  nop
/* 00DEE4 01DB9BE4 19000045 */  bc1f        .L01DB9C4C_2F524C
/* 00DEE8 01DB9BE8 00000000 */   nop
/* 00DEEC 01DB9BEC 34A01546 */  c.lt.s      $f20, $f21
/* 00DEF0 01DB9BF0 00000000 */  nop
/* 00DEF4 01DB9BF4 15000145 */  bc1t        .L01DB9C4C_2F524C
/* 00DEF8 01DB9BF8 00000000 */   nop
/* 00DEFC 01DB9BFC 049D848F */  lw          $4, -0x62FC($28)
/* 00DF00 01DB9C00 A896080C */  jal         SetWeaponAttachStatus__FP11WEAPON_HAVE
/* 00DF04 01DB9C04 00000000 */   nop
/* 00DF08 01DB9C08 B8000224 */  addiu       $2, $0, 0xB8
/* 00DF0C 01DB9C0C EA01013C */  lui         $1, %hi(DngMessMan + 0x24)
/* 00DF10 01DB9C10 B47622AC */  sw          $2, %lo(DngMessMan + 0x24)($1)
/* 00DF14 01DB9C14 F0000224 */  addiu       $2, $0, 0xF0
/* 00DF18 01DB9C18 EA01013C */  lui         $1, %hi(DngMessMan + 0x4)
/* 00DF1C 01DB9C1C 947622AC */  sw          $2, %lo(DngMessMan + 0x4)($1)
/* 00DF20 01DB9C20 EA01013C */  lui         $1, %hi(DngMessMan + 0x1C)
/* 00DF24 01DB9C24 AC7620AC */  sw          $0, %lo(DngMessMan + 0x1C)($1)
/* 00DF28 01DB9C28 6F000424 */  addiu       $4, $0, 0x6F
/* 00DF2C 01DB9C2C FFFF0524 */  addiu       $5, $0, -0x1
/* 00DF30 01DB9C30 28360070 */  paddub      $6, $0, $0
/* 00DF34 01DB9C34 AC69050C */  jal         SndSePlay__Fiii
/* 00DF38 01DB9C38 00000000 */   nop
/* 00DF3C 01DB9C3C 009D848F */  lw          $4, -0x6300($28)
/* 00DF40 01DB9C40 282E2072 */  paddub      $5, $17, $0
/* 00DF44 01DB9C44 CC33080C */  jal         MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE
/* 00DF48 01DB9C48 00000000 */   nop
.L01DB9C4C_2F524C:
/* 00DF4C 01DB9C4C 61000012 */  beqz        $16, .L01DB9DD4_2F53D4
/* 00DF50 01DB9C50 00000000 */   nop
/* 00DF54 01DB9C54 DC01023C */  lui         $2, %hi(LIT_5034)
/* 00DF58 01DB9C58 F0274224 */  addiu       $2, $2, %lo(LIT_5034)
/* 00DF5C 01DB9C5C 4000A327 */  addiu       $3, $29, 0x40
/* 00DF60 01DB9C60 00004278 */  lq          $2, 0x0($2)
/* 00DF64 01DB9C64 0000627C */  sq          $2, 0x0($3)
/* 00DF68 01DB9C68 DC01023C */  lui         $2, %hi(LIT_5035)
/* 00DF6C 01DB9C6C 00284224 */  addiu       $2, $2, %lo(LIT_5035)
/* 00DF70 01DB9C70 5000A327 */  addiu       $3, $29, 0x50
/* 00DF74 01DB9C74 00004278 */  lq          $2, 0x0($2)
/* 00DF78 01DB9C78 0000627C */  sq          $2, 0x0($3)
/* 00DF7C 01DB9C7C 7000A427 */  addiu       $4, $29, 0x70
/* 00DF80 01DB9C80 EA01023C */  lui         $2, %hi(CharaMain + 0x10)
/* 00DF84 01DB9C84 301D4524 */  addiu       $5, $2, %lo(CharaMain + 0x10)
/* 00DF88 01DB9C88 0C86040C */  jal         sceVu0CopyVector
/* 00DF8C 01DB9C8C 00000000 */   nop
/* 00DF90 01DB9C90 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00DF94 01DB9C94 DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 00DF98 01DB9C98 DC01023C */  lui         $2, %hi(LIT_4980)
/* 00DF9C 01DB9C9C E0304524 */  addiu       $5, $2, %lo(LIT_4980)
/* 00DFA0 01DB9CA0 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00DFA4 01DB9CA4 00000000 */   nop
/* 00DFA8 01DB9CA8 28264070 */  paddub      $4, $2, $0
/* 00DFAC 01DB9CAC 13008010 */  beqz        $4, .L01DB9CFC_2F52FC
/* 00DFB0 01DB9CB0 00000000 */   nop
/* 00DFB4 01DB9CB4 6000A527 */  addiu       $5, $29, 0x60
/* 00DFB8 01DB9CB8 5000A627 */  addiu       $6, $29, 0x50
/* 00DFBC 01DB9CBC 58A3040C */  jal         GetWorldPosition__6CFrameFPfPf
/* 00DFC0 01DB9CC0 00000000 */   nop
/* 00DFC4 01DB9CC4 C03F023C */  lui         $2, (0x3FC00000 >> 16)
/* 00DFC8 01DB9CC8 00608244 */  mtc1        $2, $f12
/* 00DFCC 01DB9CCC EC01023C */  lui         $2, %hi(WeaponCrashEffect)
/* 00DFD0 01DB9CD0 E0DA4424 */  addiu       $4, $2, %lo(WeaponCrashEffect)
/* 00DFD4 01DB9CD4 6000A527 */  addiu       $5, $29, 0x60
/* 00DFD8 01DB9CD8 4000A627 */  addiu       $6, $29, 0x40
/* 00DFDC 01DB9CDC 04000724 */  addiu       $7, $0, 0x4
/* 00DFE0 01DB9CE0 14848DC7 */  lwc1        $f13, -0x7BEC($28)
/* 00DFE4 01DB9CE4 866B0046 */  mov.s       $f14, $f13
/* 00DFE8 01DB9CE8 90828FC7 */  lwc1        $f15, -0x7D70($28)
/* 00DFEC 01DB9CEC 20000824 */  addiu       $8, $0, 0x20
/* 00DFF0 01DB9CF0 7400B0C7 */  lwc1        $f16, 0x74($29)
/* 00DFF4 01DB9CF4 A4CB060C */  jal         Set__8CHitMarkFPfPfiffffif
/* 00DFF8 01DB9CF8 00000000 */   nop
.L01DB9CFC_2F52FC:
/* 00DFFC 01DB9CFC 01000324 */  addiu       $3, $0, 0x1
/* 00E000 01DB9D00 19000316 */  bne         $16, $3, .L01DB9D68_2F5368
/* 00E004 01DB9D04 00000000 */   nop
/* 00E008 01DB9D08 789C828F */  lw          $2, -0x6388($28)
/* 00E00C 01DB9D0C 04004580 */  lb          $5, 0x4($2)
/* 00E010 01DB9D10 EA01023C */  lui         $2, %hi(CrashWeapon)
/* 00E014 01DB9D14 E0634424 */  addiu       $4, $2, %lo(CrashWeapon)
/* 00E018 01DB9D18 F49C868F */  lw          $6, -0x630C($28)
/* 00E01C 01DB9D1C 98E5760C */  jal         EquipWeaponFrame__FP10CCharacterii
/* 00E020 01DB9D20 00000000 */   nop
/* 00E024 01DB9D24 789C838F */  lw          $3, -0x6388($28)
/* 00E028 01DB9D28 04006480 */  lb          $4, 0x4($3)
/* 00E02C 01DB9D2C 05000324 */  addiu       $3, $0, 0x5
/* 00E030 01DB9D30 06008310 */  beq         $4, $3, .L01DB9D4C_2F534C
/* 00E034 01DB9D34 00000000 */   nop
/* 00E038 01DB9D38 3C260400 */  dsll32      $4, $4, 24
/* 00E03C 01DB9D3C 3F260400 */  dsra32      $4, $4, 24
/* 00E040 01DB9D40 03000324 */  addiu       $3, $0, 0x3
/* 00E044 01DB9D44 08008314 */  bne         $4, $3, .L01DB9D68_2F5368
/* 00E048 01DB9D48 00000000 */   nop
.L01DB9D4C_2F534C:
/* 00E04C 01DB9D4C E901033C */  lui         $3, %hi(CharaMainEffectCrash)
/* 00E050 01DB9D50 C07B6324 */  addiu       $3, $3, %lo(CharaMainEffectCrash)
/* 00E054 01DB9D54 FC9C83AF */  sw          $3, -0x6304($28)
/* 00E058 01DB9D58 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E05C 01DB9D5C 204520AC */  sw          $0, %lo(BtActStatus + 0xA0)($1)
/* 00E060 01DB9D60 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00E064 01DB9D64 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
.L01DB9D68_2F5368:
/* 00E068 01DB9D68 02000324 */  addiu       $3, $0, 0x2
/* 00E06C 01DB9D6C 19000316 */  bne         $16, $3, .L01DB9DD4_2F53D4
/* 00E070 01DB9D70 00000000 */   nop
/* 00E074 01DB9D74 789C828F */  lw          $2, -0x6388($28)
/* 00E078 01DB9D78 04004580 */  lb          $5, 0x4($2)
/* 00E07C 01DB9D7C EA01023C */  lui         $2, %hi(DefaultWeapon)
/* 00E080 01DB9D80 30524424 */  addiu       $4, $2, %lo(DefaultWeapon)
/* 00E084 01DB9D84 F49C868F */  lw          $6, -0x630C($28)
/* 00E088 01DB9D88 98E5760C */  jal         EquipWeaponFrame__FP10CCharacterii
/* 00E08C 01DB9D8C 00000000 */   nop
/* 00E090 01DB9D90 789C838F */  lw          $3, -0x6388($28)
/* 00E094 01DB9D94 04006480 */  lb          $4, 0x4($3)
/* 00E098 01DB9D98 05000324 */  addiu       $3, $0, 0x5
/* 00E09C 01DB9D9C 06008310 */  beq         $4, $3, .L01DB9DB8_2F53B8
/* 00E0A0 01DB9DA0 00000000 */   nop
/* 00E0A4 01DB9DA4 3C260400 */  dsll32      $4, $4, 24
/* 00E0A8 01DB9DA8 3F260400 */  dsra32      $4, $4, 24
/* 00E0AC 01DB9DAC 03000324 */  addiu       $3, $0, 0x3
/* 00E0B0 01DB9DB0 08008314 */  bne         $4, $3, .L01DB9DD4_2F53D4
/* 00E0B4 01DB9DB4 00000000 */   nop
.L01DB9DB8_2F53B8:
/* 00E0B8 01DB9DB8 E901033C */  lui         $3, %hi(CharaMainEffectCrash)
/* 00E0BC 01DB9DBC C07B6324 */  addiu       $3, $3, %lo(CharaMainEffectCrash)
/* 00E0C0 01DB9DC0 FC9C83AF */  sw          $3, -0x6304($28)
/* 00E0C4 01DB9DC4 DC01013C */  lui         $1, %hi(BtActStatus + 0xA0)
/* 00E0C8 01DB9DC8 204520AC */  sw          $0, %lo(BtActStatus + 0xA0)($1)
/* 00E0CC 01DB9DCC DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 00E0D0 01DB9DD0 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
.L01DB9DD4_2F53D4:
/* 00E0D4 01DB9DD4 3000BF7B */  lq          $31, 0x30($29)
/* 00E0D8 01DB9DD8 2000B17B */  lq          $17, 0x20($29)
/* 00E0DC 01DB9DDC 1000B07B */  lq          $16, 0x10($29)
/* 00E0E0 01DB9DE0 0800B6C7 */  lwc1        $f22, 0x8($29)
/* 00E0E4 01DB9DE4 0400B5C7 */  lwc1        $f21, 0x4($29)
/* 00E0E8 01DB9DE8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00E0EC 01DB9DEC 8000BD27 */  addiu       $29, $29, 0x80
/* 00E0F0 01DB9DF0 0800E003 */  jr          $31
/* 00E0F4 01DB9DF4 00000000 */   nop
/* 00E0F8 01DB9DF8 00000000 */  nop
/* 00E0FC 01DB9DFC 00000000 */  nop
