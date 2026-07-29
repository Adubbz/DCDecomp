.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EquipWeaponFrame__FP10CCharacterii
/* 00D960 01DB9660 E0FFBD27 */  addiu       $29, $29, -0x20
/* 00D964 01DB9664 1000BF7F */  sq          $31, 0x10($29)
/* 00D968 01DB9668 0000B07F */  sq          $16, 0x0($29)
/* 00D96C 01DB966C 009D84AF */  sw          $4, -0x6300($28)
/* 00D970 01DB9670 0D00C010 */  beqz        $6, .L01DB96A8_2F4CA8
/* 00D974 01DB9674 00000000 */   nop
/* 00D978 01DB9678 01000224 */  addiu       $2, $0, 0x1
/* 00D97C 01DB967C 0A00A214 */  bne         $5, $2, .L01DB96A8_2F4CA8
/* 00D980 01DB9680 00000000 */   nop
/* 00D984 01DB9684 EA01013C */  lui         $1, %hi(CharaHand + 0xBC)
/* 00D988 01DB9688 8C2F248C */  lw          $4, %lo(CharaHand + 0xBC)($1)
/* 00D98C 01DB968C DC01023C */  lui         $2, %hi(LIT_4979)
/* 00D990 01DB9690 D8304524 */  addiu       $5, $2, %lo(LIT_4979)
/* 00D994 01DB9694 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00D998 01DB9698 00000000 */   nop
/* 00D99C 01DB969C 28864070 */  paddub      $16, $2, $0
/* 00D9A0 01DB96A0 08000010 */  b           .L01DB96C4_2F4CC4
/* 00D9A4 01DB96A4 00000000 */   nop
.L01DB96A8_2F4CA8:
/* 00D9A8 01DB96A8 EA01013C */  lui         $1, %hi(CharaMain + 0xBC)
/* 00D9AC 01DB96AC DC1D248C */  lw          $4, %lo(CharaMain + 0xBC)($1)
/* 00D9B0 01DB96B0 DC01023C */  lui         $2, %hi(LIT_4980)
/* 00D9B4 01DB96B4 E0304524 */  addiu       $5, $2, %lo(LIT_4980)
/* 00D9B8 01DB96B8 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 00D9BC 01DB96BC 00000000 */   nop
/* 00D9C0 01DB96C0 28864070 */  paddub      $16, $2, $0
.L01DB96C4_2F4CC4:
/* 00D9C4 01DB96C4 07000016 */  bnez        $16, .L01DB96E4_2F4CE4
/* 00D9C8 01DB96C8 00000000 */   nop
/* 00D9CC 01DB96CC DC01023C */  lui         $2, %hi(LIT_4997)
/* 00D9D0 01DB96D0 F0304424 */  addiu       $4, $2, %lo(LIT_4997)
/* 00D9D4 01DB96D4 A611040C */  jal         printf
/* 00D9D8 01DB96D8 00000000 */   nop
/* 00D9DC 01DB96DC 53000010 */  b           .L01DB982C_2F4E2C
/* 00D9E0 01DB96E0 00000000 */   nop
.L01DB96E4_2F4CE4:
/* 00D9E4 01DB96E4 00608044 */  mtc1        $0, $f12
/* 00D9E8 01DB96E8 00000000 */  nop
/* 00D9EC 01DB96EC 46630046 */  mov.s       $f13, $f12
/* 00D9F0 01DB96F0 86630046 */  mov.s       $f14, $f12
/* 00D9F4 01DB96F4 009D848F */  lw          $4, -0x6300($28)
/* 00D9F8 01DB96F8 A000998C */  lw          $25, 0xA0($4)
/* 00D9FC 01DB96FC 1800398F */  lw          $25, 0x18($25)
/* 00DA00 01DB9700 09F82003 */  jalr        $25
/* 00DA04 01DB9704 00000000 */   nop
/* 00DA08 01DB9708 00608044 */  mtc1        $0, $f12
/* 00DA0C 01DB970C 00000000 */  nop
/* 00DA10 01DB9710 46630046 */  mov.s       $f13, $f12
/* 00DA14 01DB9714 86630046 */  mov.s       $f14, $f12
/* 00DA18 01DB9718 009D848F */  lw          $4, -0x6300($28)
/* 00DA1C 01DB971C A000998C */  lw          $25, 0xA0($4)
/* 00DA20 01DB9720 3000398F */  lw          $25, 0x30($25)
/* 00DA24 01DB9724 09F82003 */  jalr        $25
/* 00DA28 01DB9728 00000000 */   nop
/* 00DA2C 01DB972C 009D828F */  lw          $2, -0x6300($28)
/* 00DA30 01DB9730 BC00448C */  lw          $4, 0xBC($2)
/* 00DA34 01DB9734 282E0072 */  paddub      $5, $16, $0
/* 00DA38 01DB9738 60A0040C */  jal         SetReference__6CFrameFP6CFrame
/* 00DA3C 01DB973C 00000000 */   nop
/* 00DA40 01DB9740 009D848F */  lw          $4, -0x6300($28)
/* 00DA44 01DB9744 A000998C */  lw          $25, 0xA0($4)
/* 00DA48 01DB9748 0800398F */  lw          $25, 0x8($25)
/* 00DA4C 01DB974C 09F82003 */  jalr        $25
/* 00DA50 01DB9750 00000000 */   nop
/* 00DA54 01DB9754 28260070 */  paddub      $4, $0, $0
/* 00DA58 01DB9758 07000010 */  b           .L01DB9778_2F4D78
/* 00DA5C 01DB975C 00000000 */   nop
.L01DB9760_2F4D60:
/* 00DA60 01DB9760 80180400 */  sll         $3, $4, 2
/* 00DA64 01DB9764 E601023C */  lui         $2, %hi(CWeaponFx + 0x490)
/* 00DA68 01DB9768 D0934224 */  addiu       $2, $2, %lo(CWeaponFx + 0x490)
/* 00DA6C 01DB976C 21104300 */  addu        $2, $2, $3
/* 00DA70 01DB9770 000040AC */  sw          $0, 0x0($2)
/* 00DA74 01DB9774 01008424 */  addiu       $4, $4, 0x1
.L01DB9778_2F4D78:
/* 00DA78 01DB9778 20008228 */  slti        $2, $4, 0x20
/* 00DA7C 01DB977C F8FF4014 */  bnez        $2, .L01DB9760_2F4D60
/* 00DA80 01DB9780 00000000 */   nop
/* 00DA84 01DB9784 40000224 */  addiu       $2, $0, 0x40
/* 00DA88 01DB9788 E601013C */  lui         $1, %hi(CWeaponFx + 0x518)
/* 00DA8C 01DB978C 589422A0 */  sb          $2, %lo(CWeaponFx + 0x518)($1)
/* 00DA90 01DB9790 E601013C */  lui         $1, %hi(CWeaponFx + 0x510)
/* 00DA94 01DB9794 509422A0 */  sb          $2, %lo(CWeaponFx + 0x510)($1)
/* 00DA98 01DB9798 E601013C */  lui         $1, %hi(CWeaponFx + 0x519)
/* 00DA9C 01DB979C 599422A0 */  sb          $2, %lo(CWeaponFx + 0x519)($1)
/* 00DAA0 01DB97A0 E601013C */  lui         $1, %hi(CWeaponFx + 0x511)
/* 00DAA4 01DB97A4 519422A0 */  sb          $2, %lo(CWeaponFx + 0x511)($1)
/* 00DAA8 01DB97A8 E601013C */  lui         $1, %hi(CWeaponFx + 0x51A)
/* 00DAAC 01DB97AC 5A9422A0 */  sb          $2, %lo(CWeaponFx + 0x51A)($1)
/* 00DAB0 01DB97B0 E601013C */  lui         $1, %hi(CWeaponFx + 0x512)
/* 00DAB4 01DB97B4 529422A0 */  sb          $2, %lo(CWeaponFx + 0x512)($1)
/* 00DAB8 01DB97B8 06000224 */  addiu       $2, $0, 0x6
/* 00DABC 01DB97BC E601013C */  lui         $1, %hi(CWeaponFx + 0x51C)
/* 00DAC0 01DB97C0 5C9422A0 */  sb          $2, %lo(CWeaponFx + 0x51C)($1)
/* 00DAC4 01DB97C4 E601013C */  lui         $1, %hi(CWeaponFx + 0x514)
/* 00DAC8 01DB97C8 549422A0 */  sb          $2, %lo(CWeaponFx + 0x514)($1)
/* 00DACC 01DB97CC E601013C */  lui         $1, %hi(CWeaponFx + 0x51D)
/* 00DAD0 01DB97D0 5D9422A0 */  sb          $2, %lo(CWeaponFx + 0x51D)($1)
/* 00DAD4 01DB97D4 E601013C */  lui         $1, %hi(CWeaponFx + 0x515)
/* 00DAD8 01DB97D8 559422A0 */  sb          $2, %lo(CWeaponFx + 0x515)($1)
/* 00DADC 01DB97DC E601013C */  lui         $1, %hi(CWeaponFx + 0x51E)
/* 00DAE0 01DB97E0 5E9422A0 */  sb          $2, %lo(CWeaponFx + 0x51E)($1)
/* 00DAE4 01DB97E4 E601013C */  lui         $1, %hi(CWeaponFx + 0x516)
/* 00DAE8 01DB97E8 569422A0 */  sb          $2, %lo(CWeaponFx + 0x516)($1)
/* 00DAEC 01DB97EC E601013C */  lui         $1, %hi(CWeaponFx + 0x520)
/* 00DAF0 01DB97F0 609420AC */  sw          $0, %lo(CWeaponFx + 0x520)($1)
/* 00DAF4 01DB97F4 E601013C */  lui         $1, %hi(CWeaponFx + 0x524)
/* 00DAF8 01DB97F8 649420AC */  sw          $0, %lo(CWeaponFx + 0x524)($1)
/* 00DAFC 01DB97FC 009D838F */  lw          $3, -0x6300($28)
/* 00DB00 01DB9800 E601023C */  lui         $2, %hi(CWeaponFx)
/* 00DB04 01DB9804 408F4424 */  addiu       $4, $2, %lo(CWeaponFx)
/* 00DB08 01DB9808 BC00658C */  lw          $5, 0xBC($3)
/* 00DB0C 01DB980C DC01023C */  lui         $2, %hi(LIT_4408)
/* 00DB10 01DB9810 982F4624 */  addiu       $6, $2, %lo(LIT_4408)
/* 00DB14 01DB9814 DC01023C */  lui         $2, %hi(LIT_4409)
/* 00DB18 01DB9818 A02F4724 */  addiu       $7, $2, %lo(LIT_4409)
/* 00DB1C 01DB981C 7059070C */  jal         InitSet__13CWeaponEffectFP6CFramePcPc
/* 00DB20 01DB9820 00000000 */   nop
/* 00DB24 01DB9824 80E7760C */  jal         SetWeaponColor__Fv
/* 00DB28 01DB9828 00000000 */   nop
.L01DB982C_2F4E2C:
/* 00DB2C 01DB982C 1000BF7B */  lq          $31, 0x10($29)
/* 00DB30 01DB9830 0000B07B */  lq          $16, 0x0($29)
/* 00DB34 01DB9834 2000BD27 */  addiu       $29, $29, 0x20
/* 00DB38 01DB9838 0800E003 */  jr          $31
/* 00DB3C 01DB983C 00000000 */   nop
