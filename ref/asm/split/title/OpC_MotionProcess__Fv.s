.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpC_MotionProcess__Fv
/* 013600 01DBF300 C0FEBD27 */  addiu       $29, $29, -0x140
/* 013604 01DBF304 3000BF7F */  sq          $31, 0x30($29)
/* 013608 01DBF308 2000B17F */  sq          $17, 0x20($29)
/* 01360C 01DBF30C 1000B07F */  sq          $16, 0x10($29)
/* 013610 01DBF310 0000B4E7 */  swc1        $f20, 0x0($29)
/* 013614 01DBF314 28160070 */  paddub      $2, $0, $0
/* 013618 01DBF318 4E000010 */  b           .L01DBF454_2C4C54
/* 01361C 01DBF31C 00000000 */   nop
.L01DBF320_2C4B20:
/* 013620 01DBF320 40180200 */  sll         $3, $2, 1
/* 013624 01DBF324 21186200 */  addu        $3, $3, $2
/* 013628 01DBF328 80180300 */  sll         $3, $3, 2
/* 01362C 01DBF32C 21186200 */  addu        $3, $3, $2
/* 013630 01DBF330 80180300 */  sll         $3, $3, 2
/* 013634 01DBF334 DE01043C */  lui         $4, %hi(CScript__2 + 0x30)
/* 013638 01DBF338 301B8424 */  addiu       $4, $4, %lo(CScript__2 + 0x30)
/* 01363C 01DBF33C 21208300 */  addu        $4, $4, $3
/* 013640 01DBF340 00008490 */  lbu         $4, 0x0($4)
/* 013644 01DBF344 42008010 */  beqz        $4, .L01DBF450_2C4C50
/* 013648 01DBF348 00000000 */   nop
/* 01364C 01DBF34C DE01043C */  lui         $4, %hi(CScript__2 + 0x38)
/* 013650 01DBF350 381B8424 */  addiu       $4, $4, %lo(CScript__2 + 0x38)
/* 013654 01DBF354 21208300 */  addu        $4, $4, $3
/* 013658 01DBF358 0000888C */  lw          $8, 0x0($4)
/* 01365C 01DBF35C FFFF0524 */  addiu       $5, $0, -0x1
/* 013660 01DBF360 20000511 */  beq         $8, $5, .L01DBF3E4_2C4BE4
/* 013664 01DBF364 00000000 */   nop
/* 013668 01DBF368 B0110524 */  addiu       $5, $0, 0x11B0
/* 01366C 01DBF36C 18384500 */  mult        $7, $2, $5
/* 013670 01DBF370 DF01053C */  lui         $5, %hi(Chara__3 + 0x344)
/* 013674 01DBF374 2402A524 */  addiu       $5, $5, %lo(Chara__3 + 0x344)
/* 013678 01DBF378 2128A700 */  addu        $5, $5, $7
/* 01367C 01DBF37C 0000A68C */  lw          $6, 0x0($5)
/* 013680 01DBF380 DE01053C */  lui         $5, %hi(CScript__2 + 0x34)
/* 013684 01DBF384 341BA524 */  addiu       $5, $5, %lo(CScript__2 + 0x34)
/* 013688 01DBF388 2148A300 */  addu        $9, $5, $3
/* 01368C 01DBF38C 0000258D */  lw          $5, 0x0($9)
/* 013690 01DBF390 00290500 */  sll         $5, $5, 4
/* 013694 01DBF394 2128A600 */  addu        $5, $5, $6
/* 013698 01DBF398 0400A58C */  lw          $5, 0x4($5)
/* 01369C 01DBF39C FFFFA524 */  addiu       $5, $5, -0x1
/* 0136A0 01DBF3A0 00008544 */  mtc1        $5, $f0
/* 0136A4 01DBF3A4 00000000 */  nop
/* 0136A8 01DBF3A8 60008046 */  cvt.s.w     $f1, $f0
/* 0136AC 01DBF3AC DF01053C */  lui         $5, %hi(Chara__3 + 0x2F0)
/* 0136B0 01DBF3B0 D001A524 */  addiu       $5, $5, %lo(Chara__3 + 0x2F0)
/* 0136B4 01DBF3B4 2128A700 */  addu        $5, $5, $7
/* 0136B8 01DBF3B8 0000A0C4 */  lwc1        $f0, 0x0($5)
/* 0136BC 01DBF3BC 36000146 */  c.le.s      $f0, $f1
/* 0136C0 01DBF3C0 01000524 */  addiu       $5, $0, 0x1
/* 0136C4 01DBF3C4 02000045 */  bc1f        .L01DBF3D0_2C4BD0
/* 0136C8 01DBF3C8 00000000 */   nop
/* 0136CC 01DBF3CC 282E0070 */  paddub      $5, $0, $0
.L01DBF3D0_2C4BD0:
/* 0136D0 01DBF3D0 0400A010 */  beqz        $5, .L01DBF3E4_2C4BE4
/* 0136D4 01DBF3D4 00000000 */   nop
/* 0136D8 01DBF3D8 000028AD */  sw          $8, 0x0($9)
/* 0136DC 01DBF3DC FFFF0524 */  addiu       $5, $0, -0x1
/* 0136E0 01DBF3E0 000085AC */  sw          $5, 0x0($4)
.L01DBF3E4_2C4BE4:
/* 0136E4 01DBF3E4 DE01043C */  lui         $4, %hi(CScript__2 + 0x60)
/* 0136E8 01DBF3E8 601B8424 */  addiu       $4, $4, %lo(CScript__2 + 0x60)
/* 0136EC 01DBF3EC 21208300 */  addu        $4, $4, $3
/* 0136F0 01DBF3F0 000080C4 */  lwc1        $f0, 0x0($4)
/* 0136F4 01DBF3F4 B0110424 */  addiu       $4, $0, 0x11B0
/* 0136F8 01DBF3F8 18284400 */  mult        $5, $2, $4
/* 0136FC 01DBF3FC DF01043C */  lui         $4, %hi(Chara__3 + 0x2F8)
/* 013700 01DBF400 D8018424 */  addiu       $4, $4, %lo(Chara__3 + 0x2F8)
/* 013704 01DBF404 21208500 */  addu        $4, $4, $5
/* 013708 01DBF408 000080E4 */  swc1        $f0, 0x0($4)
/* 01370C 01DBF40C DE01043C */  lui         $4, %hi(CScript__2 + 0x34)
/* 013710 01DBF410 341B8424 */  addiu       $4, $4, %lo(CScript__2 + 0x34)
/* 013714 01DBF414 21188300 */  addu        $3, $4, $3
/* 013718 01DBF418 0000648C */  lw          $4, 0x0($3)
/* 01371C 01DBF41C DF01033C */  lui         $3, %hi(Chara__3 + 0xC68)
/* 013720 01DBF420 480B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC68)
/* 013724 01DBF424 21186500 */  addu        $3, $3, $5
/* 013728 01DBF428 000064AC */  sw          $4, 0x0($3)
/* 01372C 01DBF42C DF01033C */  lui         $3, %hi(Chara__3 + 0xC64)
/* 013730 01DBF430 440B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC64)
/* 013734 01DBF434 21186500 */  addu        $3, $3, $5
/* 013738 01DBF438 000060AC */  sw          $0, 0x0($3)
/* 01373C 01DBF43C 80BF043C */  lui         $4, (0xBF800000 >> 16)
/* 013740 01DBF440 DF01033C */  lui         $3, %hi(Chara__3 + 0xC60)
/* 013744 01DBF444 400B6324 */  addiu       $3, $3, %lo(Chara__3 + 0xC60)
/* 013748 01DBF448 21186500 */  addu        $3, $3, $5
/* 01374C 01DBF44C 000064AC */  sw          $4, 0x0($3)
.L01DBF450_2C4C50:
/* 013750 01DBF450 01004224 */  addiu       $2, $2, 0x1
.L01DBF454_2C4C54:
/* 013754 01DBF454 17004328 */  slti        $3, $2, 0x17
/* 013758 01DBF458 B1FF6014 */  bnez        $3, .L01DBF320_2C4B20
/* 01375C 01DBF45C 00000000 */   nop
/* 013760 01DBF460 DE01023C */  lui         $2, %hi(LIT_886__6)
/* 013764 01DBF464 B0A44524 */  addiu       $5, $2, %lo(LIT_886__6)
/* 013768 01DBF468 4000A427 */  addiu       $4, $29, 0x40
/* 01376C 01DBF46C 05000324 */  addiu       $3, $0, 0x5
.L01DBF470_2C4C70:
/* 013770 01DBF470 0000A278 */  lq          $2, 0x0($5)
/* 013774 01DBF474 1000A524 */  addiu       $5, $5, 0x10
/* 013778 01DBF478 FFFF6324 */  addiu       $3, $3, -0x1
/* 01377C 01DBF47C 0000827C */  sq          $2, 0x0($4)
/* 013780 01DBF480 10008424 */  addiu       $4, $4, 0x10
/* 013784 01DBF484 FAFF601C */  bgtz        $3, .L01DBF470_2C4C70
/* 013788 01DBF488 00000000 */   nop
/* 01378C 01DBF48C 0000A2C4 */  lwc1        $f2, 0x0($5)
/* 013790 01DBF490 000082E4 */  swc1        $f2, 0x0($4)
/* 013794 01DBF494 28860070 */  paddub      $16, $0, $0
/* 013798 01DBF498 35000010 */  b           .L01DBF570_2C4D70
/* 01379C 01DBF49C 00000000 */   nop
.L01DBF4A0_2C4CA0:
/* 0137A0 01DBF4A0 40101000 */  sll         $2, $16, 1
/* 0137A4 01DBF4A4 21105000 */  addu        $2, $2, $16
/* 0137A8 01DBF4A8 80100200 */  sll         $2, $2, 2
/* 0137AC 01DBF4AC 21105000 */  addu        $2, $2, $16
/* 0137B0 01DBF4B0 80180200 */  sll         $3, $2, 2
/* 0137B4 01DBF4B4 DE01023C */  lui         $2, %hi(CScript__2 + 0x30)
/* 0137B8 01DBF4B8 301B4224 */  addiu       $2, $2, %lo(CScript__2 + 0x30)
/* 0137BC 01DBF4BC 21104300 */  addu        $2, $2, $3
/* 0137C0 01DBF4C0 00004290 */  lbu         $2, 0x0($2)
/* 0137C4 01DBF4C4 29004010 */  beqz        $2, .L01DBF56C_2C4D6C
/* 0137C8 01DBF4C8 00000000 */   nop
/* 0137CC 01DBF4CC 0498838F */  lw          $3, -0x67FC($28)
/* 0137D0 01DBF4D0 B0110224 */  addiu       $2, $0, 0x11B0
/* 0137D4 01DBF4D4 18186200 */  mult        $3, $3, $2
/* 0137D8 01DBF4D8 E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 0137DC 01DBF4DC 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 0137E0 01DBF4E0 21184300 */  addu        $3, $2, $3
/* 0137E4 01DBF4E4 80101000 */  sll         $2, $16, 2
/* 0137E8 01DBF4E8 21105D00 */  addu        $2, $2, $29
/* 0137EC 01DBF4EC 0000648C */  lw          $4, 0x0($3)
/* 0137F0 01DBF4F0 4000458C */  lw          $5, 0x40($2)
/* 0137F4 01DBF4F4 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0137F8 01DBF4F8 00000000 */   nop
/* 0137FC 01DBF4FC 1B004010 */  beqz        $2, .L01DBF56C_2C4D6C
/* 013800 01DBF500 00000000 */   nop
/* 013804 01DBF504 28264070 */  paddub      $4, $2, $0
/* 013808 01DBF508 A000A527 */  addiu       $5, $29, 0xA0
/* 01380C 01DBF50C 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 013810 01DBF510 00000000 */   nop
/* 013814 01DBF514 00A08044 */  mtc1        $0, $f20
/* 013818 01DBF518 C000ACC7 */  lwc1        $f12, 0xC0($29)
/* 01381C 01DBF51C C800ADC7 */  lwc1        $f13, 0xC8($29)
/* 013820 01DBF520 5077040C */  jal         atan2f
/* 013824 01DBF524 00000000 */   nop
/* 013828 01DBF528 86A30046 */  mov.s       $f14, $f20
/* 01382C 01DBF52C B0110224 */  addiu       $2, $0, 0x11B0
/* 013830 01DBF530 18180202 */  mult        $3, $16, $2
/* 013834 01DBF534 DF01023C */  lui         $2, %hi(Chara__3)
/* 013838 01DBF538 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01383C 01DBF53C 21884300 */  addu        $17, $2, $3
/* 013840 01DBF540 28262072 */  paddub      $4, $17, $0
/* 013844 01DBF544 06A30046 */  mov.s       $f12, $f20
/* 013848 01DBF548 46030046 */  mov.s       $f13, $f0
/* 01384C 01DBF54C 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 013850 01DBF550 00000000 */   nop
/* 013854 01DBF554 D000ACC7 */  lwc1        $f12, 0xD0($29)
/* 013858 01DBF558 D400ADC7 */  lwc1        $f13, 0xD4($29)
/* 01385C 01DBF55C D800AEC7 */  lwc1        $f14, 0xD8($29)
/* 013860 01DBF560 28262072 */  paddub      $4, $17, $0
/* 013864 01DBF564 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 013868 01DBF568 00000000 */   nop
.L01DBF56C_2C4D6C:
/* 01386C 01DBF56C 01001026 */  addiu       $16, $16, 0x1
.L01DBF570_2C4D70:
/* 013870 01DBF570 1700022A */  slti        $2, $16, 0x17
/* 013874 01DBF574 CAFF4014 */  bnez        $2, .L01DBF4A0_2C4CA0
/* 013878 01DBF578 00000000 */   nop
/* 01387C 01DBF57C DE01013C */  lui         $1, %hi(CScript__2 + 0x64)
/* 013880 01DBF580 641B2290 */  lbu         $2, %lo(CScript__2 + 0x64)($1)
/* 013884 01DBF584 2E004010 */  beqz        $2, .L01DBF640_2C4E40
/* 013888 01DBF588 00000000 */   nop
/* 01388C 01DBF58C DF01013C */  lui         $1, %hi(Chara__3 + 0x126C)
/* 013890 01DBF590 4C11248C */  lw          $4, %lo(Chara__3 + 0x126C)($1)
/* 013894 01DBF594 DE01023C */  lui         $2, %hi(LIT_976)
/* 013898 01DBF598 00F94524 */  addiu       $5, $2, %lo(LIT_976)
/* 01389C 01DBF59C C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 0138A0 01DBF5A0 00000000 */   nop
/* 0138A4 01DBF5A4 26004010 */  beqz        $2, .L01DBF640_2C4E40
/* 0138A8 01DBF5A8 00000000 */   nop
/* 0138AC 01DBF5AC 28264070 */  paddub      $4, $2, $0
/* 0138B0 01DBF5B0 E000A527 */  addiu       $5, $29, 0xE0
/* 0138B4 01DBF5B4 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 0138B8 01DBF5B8 00000000 */   nop
/* 0138BC 01DBF5BC E000A427 */  addiu       $4, $29, 0xE0
/* 0138C0 01DBF5C0 282E8070 */  paddub      $5, $4, $0
/* 0138C4 01DBF5C4 9285040C */  jal         sceVu0Normalize
/* 0138C8 01DBF5C8 00000000 */   nop
/* 0138CC 01DBF5CC F000A427 */  addiu       $4, $29, 0xF0
/* 0138D0 01DBF5D0 282E8070 */  paddub      $5, $4, $0
/* 0138D4 01DBF5D4 9285040C */  jal         sceVu0Normalize
/* 0138D8 01DBF5D8 00000000 */   nop
/* 0138DC 01DBF5DC 0001A427 */  addiu       $4, $29, 0x100
/* 0138E0 01DBF5E0 282E8070 */  paddub      $5, $4, $0
/* 0138E4 01DBF5E4 9285040C */  jal         sceVu0Normalize
/* 0138E8 01DBF5E8 00000000 */   nop
/* 0138EC 01DBF5EC 00608044 */  mtc1        $0, $f12
/* 0138F0 01DBF5F0 00000000 */  nop
/* 0138F4 01DBF5F4 46630046 */  mov.s       $f13, $f12
/* 0138F8 01DBF5F8 86630046 */  mov.s       $f14, $f12
/* 0138FC 01DBF5FC DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 013900 01DBF600 F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 013904 01DBF604 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 013908 01DBF608 00000000 */   nop
/* 01390C 01DBF60C 00608044 */  mtc1        $0, $f12
/* 013910 01DBF610 00000000 */  nop
/* 013914 01DBF614 46630046 */  mov.s       $f13, $f12
/* 013918 01DBF618 86630046 */  mov.s       $f14, $f12
/* 01391C 01DBF61C DF01023C */  lui         $2, %hi(Chara__3 + 0x3510)
/* 013920 01DBF620 F0334424 */  addiu       $4, $2, %lo(Chara__3 + 0x3510)
/* 013924 01DBF624 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 013928 01DBF628 00000000 */   nop
/* 01392C 01DBF62C DF01013C */  lui         $1, %hi(Chara__3 + 0x35CC)
/* 013930 01DBF630 AC34248C */  lw          $4, %lo(Chara__3 + 0x35CC)($1)
/* 013934 01DBF634 E000A527 */  addiu       $5, $29, 0xE0
/* 013938 01DBF638 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 01393C 01DBF63C 00000000 */   nop
.L01DBF640_2C4E40:
/* 013940 01DBF640 CC8380C7 */  lwc1        $f0, -0x7C34($28)
/* 013944 01DBF644 2001A0E7 */  swc1        $f0, 0x120($29)
/* 013948 01DBF648 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 01394C 01DBF64C 2801A0E7 */  swc1        $f0, 0x128($29)
/* 013950 01DBF650 2401A0AF */  sw          $0, 0x124($29)
/* 013954 01DBF654 2C01A0AF */  sw          $0, 0x12C($29)
/* 013958 01DBF658 E301023C */  lui         $2, %hi(Wind__2)
/* 01395C 01DBF65C 90AC4424 */  addiu       $4, $2, %lo(Wind__2)
/* 013960 01DBF660 2001A527 */  addiu       $5, $29, 0x120
/* 013964 01DBF664 20ED040C */  jal         SetDir__5CWindFPf
/* 013968 01DBF668 00000000 */   nop
/* 01396C 01DBF66C E301023C */  lui         $2, %hi(Wind__2)
/* 013970 01DBF670 90AC4424 */  addiu       $4, $2, %lo(Wind__2)
/* 013974 01DBF674 9C828CC7 */  lwc1        $f12, -0x7D64($28)
/* 013978 01DBF678 2CED040C */  jal         SetVelocity__5CWindFf
/* 01397C 01DBF67C 00000000 */   nop
/* 013980 01DBF680 E301023C */  lui         $2, %hi(Wind__2)
/* 013984 01DBF684 90AC4224 */  addiu       $2, $2, %lo(Wind__2)
/* 013988 01DBF688 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x4638)
/* 01398C 01DBF68C 08CE22AC */  sw          $2, %lo(MainMonstorUnit + 0x4638)($1)
/* 013990 01DBF690 E301023C */  lui         $2, %hi(Wind__2)
/* 013994 01DBF694 90AC4424 */  addiu       $4, $2, %lo(Wind__2)
/* 013998 01DBF698 4CED040C */  jal         Step__5CWindFv
/* 01399C 01DBF69C 00000000 */   nop
/* 0139A0 01DBF6A0 0C9A8383 */  lb          $3, -0x65F4($28)
/* 0139A4 01DBF6A4 04006014 */  bnez        $3, .L01DBF6B8_2C4EB8
/* 0139A8 01DBF6A8 00000000 */   nop
/* 0139AC 01DBF6AC 089A80AF */  sw          $0, -0x65F8($28)
/* 0139B0 01DBF6B0 01000324 */  addiu       $3, $0, 0x1
/* 0139B4 01DBF6B4 0C9A83A3 */  sb          $3, -0x65F4($28)
.L01DBF6B8_2C4EB8:
/* 0139B8 01DBF6B8 089A838F */  lw          $3, -0x65F8($28)
/* 0139BC 01DBF6BC DE01013C */  lui         $1, %hi(CScript__2)
/* 0139C0 01DBF6C0 001B248C */  lw          $4, %lo(CScript__2)($1)
/* 0139C4 01DBF6C4 36006410 */  beq         $3, $4, .L01DBF7A0_2C4FA0
/* 0139C8 01DBF6C8 00000000 */   nop
/* 0139CC 01DBF6CC 089A84AF */  sw          $4, -0x65F8($28)
/* 0139D0 01DBF6D0 4D000324 */  addiu       $3, $0, 0x4D
/* 0139D4 01DBF6D4 2F008310 */  beq         $4, $3, .L01DBF794_2C4F94
/* 0139D8 01DBF6D8 00000000 */   nop
/* 0139DC 01DBF6DC 4C000324 */  addiu       $3, $0, 0x4C
/* 0139E0 01DBF6E0 24008310 */  beq         $4, $3, .L01DBF774_2C4F74
/* 0139E4 01DBF6E4 00000000 */   nop
/* 0139E8 01DBF6E8 4B000324 */  addiu       $3, $0, 0x4B
/* 0139EC 01DBF6EC 1C008310 */  beq         $4, $3, .L01DBF760_2C4F60
/* 0139F0 01DBF6F0 00000000 */   nop
/* 0139F4 01DBF6F4 5F000324 */  addiu       $3, $0, 0x5F
/* 0139F8 01DBF6F8 06008310 */  beq         $4, $3, .L01DBF714_2C4F14
/* 0139FC 01DBF6FC 00000000 */   nop
/* 013A00 01DBF700 3B000324 */  addiu       $3, $0, 0x3B
/* 013A04 01DBF704 03008310 */  beq         $4, $3, .L01DBF714_2C4F14
/* 013A08 01DBF708 00000000 */   nop
/* 013A0C 01DBF70C 24000010 */  b           .L01DBF7A0_2C4FA0
/* 013A10 01DBF710 00000000 */   nop
.L01DBF714_2C4F14:
/* 013A14 01DBF714 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x39A0)
/* 013A18 01DBF718 70C14424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x39A0)
/* 013A1C 01DBF71C FFFF0524 */  addiu       $5, $0, -0x1
/* 013A20 01DBF720 94E3040C */  jal         ClothStep__10CCharacterFi
/* 013A24 01DBF724 00000000 */   nop
/* 013A28 01DBF728 28860070 */  paddub      $16, $0, $0
/* 013A2C 01DBF72C 07000010 */  b           .L01DBF74C_2C4F4C
/* 013A30 01DBF730 00000000 */   nop
.L01DBF734_2C4F34:
/* 013A34 01DBF734 E001023C */  lui         $2, %hi(MainMonstorUnit + 0x39A0)
/* 013A38 01DBF738 70C14424 */  addiu       $4, $2, %lo(MainMonstorUnit + 0x39A0)
/* 013A3C 01DBF73C 282E0070 */  paddub      $5, $0, $0
/* 013A40 01DBF740 94E3040C */  jal         ClothStep__10CCharacterFi
/* 013A44 01DBF744 00000000 */   nop
/* 013A48 01DBF748 01001026 */  addiu       $16, $16, 0x1
.L01DBF74C_2C4F4C:
/* 013A4C 01DBF74C 0A00032A */  slti        $3, $16, 0xA
/* 013A50 01DBF750 F8FF6014 */  bnez        $3, .L01DBF734_2C4F34
/* 013A54 01DBF754 00000000 */   nop
/* 013A58 01DBF758 11000010 */  b           .L01DBF7A0_2C4FA0
/* 013A5C 01DBF75C 00000000 */   nop
.L01DBF760_2C4F60:
/* 013A60 01DBF760 A040033C */  lui         $3, (0x40A00000 >> 16)
/* 013A64 01DBF764 DF01013C */  lui         $1, %hi(DngEventMan + 0x11E0)
/* 013A68 01DBF768 904823AC */  sw          $3, %lo(DngEventMan + 0x11E0)($1)
/* 013A6C 01DBF76C 0C000010 */  b           .L01DBF7A0_2C4FA0
/* 013A70 01DBF770 00000000 */   nop
.L01DBF774_2C4F74:
/* 013A74 01DBF774 A040033C */  lui         $3, (0x40A00000 >> 16)
/* 013A78 01DBF778 DF01013C */  lui         $1, %hi(DngEventMan + 0x11E0)
/* 013A7C 01DBF77C 904823AC */  sw          $3, %lo(DngEventMan + 0x11E0)($1)
/* 013A80 01DBF780 0C42033C */  lui         $3, (0x420C0000 >> 16)
/* 013A84 01DBF784 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 013A88 01DBF788 801323AC */  sw          $3, %lo(Chara__3 + 0x14A0)($1)
/* 013A8C 01DBF78C 04000010 */  b           .L01DBF7A0_2C4FA0
/* 013A90 01DBF790 00000000 */   nop
.L01DBF794_2C4F94:
/* 013A94 01DBF794 0C42033C */  lui         $3, (0x420C0000 >> 16)
/* 013A98 01DBF798 DF01013C */  lui         $1, %hi(Chara__3 + 0x14A0)
/* 013A9C 01DBF79C 801323AC */  sw          $3, %lo(Chara__3 + 0x14A0)($1)
.L01DBF7A0_2C4FA0:
/* 013AA0 01DBF7A0 0898838F */  lw          $3, -0x67F8($28)
/* 013AA4 01DBF7A4 19006014 */  bnez        $3, .L01DBF80C_2C500C
/* 013AA8 01DBF7A8 00000000 */   nop
/* 013AAC 01DBF7AC E301023C */  lui         $2, %hi(Fuusya__2)
/* 013AB0 01DBF7B0 70AB4424 */  addiu       $4, $2, %lo(Fuusya__2)
/* 013AB4 01DBF7B4 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 013AB8 01DBF7B8 00000000 */   nop
/* 013ABC 01DBF7BC DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 013AC0 01DBF7C0 181B248C */  lw          $4, %lo(CScript__2 + 0x18)($1)
/* 013AC4 01DBF7C4 07000324 */  addiu       $3, $0, 0x7
/* 013AC8 01DBF7C8 07008310 */  beq         $4, $3, .L01DBF7E8_2C4FE8
/* 013ACC 01DBF7CC 00000000 */   nop
/* 013AD0 01DBF7D0 E301023C */  lui         $2, %hi(Fuusya__2 + 0x90)
/* 013AD4 01DBF7D4 00AC4424 */  addiu       $4, $2, %lo(Fuusya__2 + 0x90)
/* 013AD8 01DBF7D8 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 013ADC 01DBF7DC 00000000 */   nop
/* 013AE0 01DBF7E0 0A000010 */  b           .L01DBF80C_2C500C
/* 013AE4 01DBF7E4 00000000 */   nop
.L01DBF7E8_2C4FE8:
/* 013AE8 01DBF7E8 DE01013C */  lui         $1, %hi(CScript__2)
/* 013AEC 01DBF7EC 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 013AF0 01DBF7F0 23006128 */  slti        $1, $3, 0x23
/* 013AF4 01DBF7F4 05002014 */  bnez        $1, .L01DBF80C_2C500C
/* 013AF8 01DBF7F8 00000000 */   nop
/* 013AFC 01DBF7FC E301023C */  lui         $2, %hi(Fuusya__2 + 0x90)
/* 013B00 01DBF800 00AC4424 */  addiu       $4, $2, %lo(Fuusya__2 + 0x90)
/* 013B04 01DBF804 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 013B08 01DBF808 00000000 */   nop
.L01DBF80C_2C500C:
/* 013B0C 01DBF80C 0898838F */  lw          $3, -0x67F8($28)
/* 013B10 01DBF810 2A006014 */  bnez        $3, .L01DBF8BC_2C50BC
/* 013B14 01DBF814 00000000 */   nop
/* 013B18 01DBF818 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 013B1C 01DBF81C 181B248C */  lw          $4, %lo(CScript__2 + 0x18)($1)
/* 013B20 01DBF820 07000324 */  addiu       $3, $0, 0x7
/* 013B24 01DBF824 16008314 */  bne         $4, $3, .L01DBF880_2C5080
/* 013B28 01DBF828 00000000 */   nop
/* 013B2C 01DBF82C 28860070 */  paddub      $16, $0, $0
/* 013B30 01DBF830 0A000010 */  b           .L01DBF85C_2C505C
/* 013B34 01DBF834 00000000 */   nop
.L01DBF838_2C5038:
/* 013B38 01DBF838 C0101000 */  sll         $2, $16, 3
/* 013B3C 01DBF83C 21105000 */  addu        $2, $2, $16
/* 013B40 01DBF840 00190200 */  sll         $3, $2, 4
/* 013B44 01DBF844 E301023C */  lui         $2, %hi(Taimatsu__2)
/* 013B48 01DBF848 F0AC4224 */  addiu       $2, $2, %lo(Taimatsu__2)
/* 013B4C 01DBF84C 21204300 */  addu        $4, $2, $3
/* 013B50 01DBF850 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 013B54 01DBF854 00000000 */   nop
/* 013B58 01DBF858 01001026 */  addiu       $16, $16, 0x1
.L01DBF85C_2C505C:
/* 013B5C 01DBF85C 0500022A */  slti        $2, $16, 0x5
/* 013B60 01DBF860 F5FF4014 */  bnez        $2, .L01DBF838_2C5038
/* 013B64 01DBF864 00000000 */   nop
/* 013B68 01DBF868 E301023C */  lui         $2, %hi(Taimatsu__2 + 0x480)
/* 013B6C 01DBF86C 70B14424 */  addiu       $4, $2, %lo(Taimatsu__2 + 0x480)
/* 013B70 01DBF870 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 013B74 01DBF874 00000000 */   nop
/* 013B78 01DBF878 10000010 */  b           .L01DBF8BC_2C50BC
/* 013B7C 01DBF87C 00000000 */   nop
.L01DBF880_2C5080:
/* 013B80 01DBF880 28860070 */  paddub      $16, $0, $0
/* 013B84 01DBF884 0A000010 */  b           .L01DBF8B0_2C50B0
/* 013B88 01DBF888 00000000 */   nop
.L01DBF88C_2C508C:
/* 013B8C 01DBF88C C0101000 */  sll         $2, $16, 3
/* 013B90 01DBF890 21105000 */  addu        $2, $2, $16
/* 013B94 01DBF894 00190200 */  sll         $3, $2, 4
/* 013B98 01DBF898 E301023C */  lui         $2, %hi(Taimatsu__2)
/* 013B9C 01DBF89C F0AC4224 */  addiu       $2, $2, %lo(Taimatsu__2)
/* 013BA0 01DBF8A0 21204300 */  addu        $4, $2, $3
/* 013BA4 01DBF8A4 7898050C */  jal         ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* 013BA8 01DBF8A8 00000000 */   nop
/* 013BAC 01DBF8AC 01001026 */  addiu       $16, $16, 0x1
.L01DBF8B0_2C50B0:
/* 013BB0 01DBF8B0 0900032A */  slti        $3, $16, 0x9
/* 013BB4 01DBF8B4 F5FF6014 */  bnez        $3, .L01DBF88C_2C508C
/* 013BB8 01DBF8B8 00000000 */   nop
.L01DBF8BC_2C50BC:
/* 013BBC 01DBF8BC 149A8383 */  lb          $3, -0x65EC($28)
/* 013BC0 01DBF8C0 05006014 */  bnez        $3, .L01DBF8D8_2C50D8
/* 013BC4 01DBF8C4 00000000 */   nop
/* 013BC8 01DBF8C8 003F033C */  lui         $3, (0x3F000000 >> 16)
/* 013BCC 01DBF8CC 109A83AF */  sw          $3, -0x65F0($28)
/* 013BD0 01DBF8D0 01000324 */  addiu       $3, $0, 0x1
/* 013BD4 01DBF8D4 149A83A3 */  sb          $3, -0x65EC($28)
.L01DBF8D8_2C50D8:
/* 013BD8 01DBF8D8 1C9A8383 */  lb          $3, -0x65E4($28)
/* 013BDC 01DBF8DC 05006014 */  bnez        $3, .L01DBF8F4_2C50F4
/* 013BE0 01DBF8E0 00000000 */   nop
/* 013BE4 01DBF8E4 0040033C */  lui         $3, (0x40000000 >> 16)
/* 013BE8 01DBF8E8 189A83AF */  sw          $3, -0x65E8($28)
/* 013BEC 01DBF8EC 01000324 */  addiu       $3, $0, 0x1
/* 013BF0 01DBF8F0 1C9A83A3 */  sb          $3, -0x65E4($28)
.L01DBF8F4_2C50F4:
/* 013BF4 01DBF8F4 DE01013C */  lui         $1, %hi(CScript__2)
/* 013BF8 01DBF8F8 001B248C */  lw          $4, %lo(CScript__2)($1)
/* 013BFC 01DBF8FC 64000324 */  addiu       $3, $0, 0x64
/* 013C00 01DBF900 15008310 */  beq         $4, $3, .L01DBF958_2C5158
/* 013C04 01DBF904 00000000 */   nop
/* 013C08 01DBF908 61000324 */  addiu       $3, $0, 0x61
/* 013C0C 01DBF90C 0B008310 */  beq         $4, $3, .L01DBF93C_2C513C
/* 013C10 01DBF910 00000000 */   nop
/* 013C14 01DBF914 60000324 */  addiu       $3, $0, 0x60
/* 013C18 01DBF918 03008310 */  beq         $4, $3, .L01DBF928_2C5128
/* 013C1C 01DBF91C 00000000 */   nop
/* 013C20 01DBF920 6B000010 */  b           .L01DBFAD0_2C52D0
/* 013C24 01DBF924 00000000 */   nop
.L01DBF928_2C5128:
/* 013C28 01DBF928 D08380C7 */  lwc1        $f0, -0x7C30($28)
/* 013C2C 01DBF92C E301013C */  lui         $1, %hi(Fuusya__2 + 0xD8)
/* 013C30 01DBF930 48AC20E4 */  swc1        $f0, %lo(Fuusya__2 + 0xD8)($1)
/* 013C34 01DBF934 66000010 */  b           .L01DBFAD0_2C52D0
/* 013C38 01DBF938 00000000 */   nop
.L01DBF93C_2C513C:
/* 013C3C 01DBF93C 0040033C */  lui         $3, (0x40000000 >> 16)
/* 013C40 01DBF940 189A83AF */  sw          $3, -0x65E8($28)
/* 013C44 01DBF944 D48380C7 */  lwc1        $f0, -0x7C2C($28)
/* 013C48 01DBF948 E301013C */  lui         $1, %hi(Fuusya__2 + 0xD8)
/* 013C4C 01DBF94C 48AC20E4 */  swc1        $f0, %lo(Fuusya__2 + 0xD8)($1)
/* 013C50 01DBF950 5F000010 */  b           .L01DBFAD0_2C52D0
/* 013C54 01DBF954 00000000 */   nop
.L01DBF958_2C5158:
/* 013C58 01DBF958 0498848F */  lw          $4, -0x67FC($28)
/* 013C5C 01DBF95C B0110324 */  addiu       $3, $0, 0x11B0
/* 013C60 01DBF960 18208300 */  mult        $4, $4, $3
/* 013C64 01DBF964 E101033C */  lui         $3, %hi(Cam__2 + 0x2F0)
/* 013C68 01DBF968 C09B6324 */  addiu       $3, $3, %lo(Cam__2 + 0x2F0)
/* 013C6C 01DBF96C 21186400 */  addu        $3, $3, $4
/* 013C70 01DBF970 000061C4 */  lwc1        $f1, 0x0($3)
/* 013C74 01DBF974 8143033C */  lui         $3, (0x43810000 >> 16)
/* 013C78 01DBF978 00008344 */  mtc1        $3, $f0
/* 013C7C 01DBF97C 00000000 */  nop
/* 013C80 01DBF980 34080046 */  c.lt.s      $f1, $f0
/* 013C84 01DBF984 00000000 */  nop
/* 013C88 01DBF988 15000045 */  bc1f        .L01DBF9E0_2C51E0
/* 013C8C 01DBF98C 00000000 */   nop
/* 013C90 01DBF990 688280C7 */  lwc1        $f0, -0x7D98($28)
/* 013C94 01DBF994 109A80E7 */  swc1        $f0, -0x65F0($28)
/* 013C98 01DBF998 D88380C7 */  lwc1        $f0, -0x7C28($28)
/* 013C9C 01DBF99C E301013C */  lui         $1, %hi(Fuusya__2 + 0xD8)
/* 013CA0 01DBF9A0 48AC20E4 */  swc1        $f0, %lo(Fuusya__2 + 0xD8)($1)
/* 013CA4 01DBF9A4 F49981C7 */  lwc1        $f1, -0x660C($28)
/* 013CA8 01DBF9A8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 013CAC 01DBF9AC 00008344 */  mtc1        $3, $f0
/* 013CB0 01DBF9B0 00000000 */  nop
/* 013CB4 01DBF9B4 34080046 */  c.lt.s      $f1, $f0
/* 013CB8 01DBF9B8 00000000 */  nop
/* 013CBC 01DBF9BC 02000145 */  bc1t        .L01DBF9C8_2C51C8
/* 013CC0 01DBF9C0 00000000 */   nop
/* 013CC4 01DBF9C4 F49980AF */  sw          $0, -0x660C($28)
.L01DBF9C8_2C51C8:
/* 013CC8 01DBF9C8 F49981C7 */  lwc1        $f1, -0x660C($28)
/* 013CCC 01DBF9CC 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 013CD0 01DBF9D0 00080046 */  add.s       $f0, $f1, $f0
/* 013CD4 01DBF9D4 F49980E7 */  swc1        $f0, -0x660C($28)
/* 013CD8 01DBF9D8 35000010 */  b           .L01DBFAB0_2C52B0
/* 013CDC 01DBF9DC 00000000 */   nop
.L01DBF9E0_2C51E0:
/* 013CE0 01DBF9E0 8743033C */  lui         $3, (0x43870000 >> 16)
/* 013CE4 01DBF9E4 00008344 */  mtc1        $3, $f0
/* 013CE8 01DBF9E8 00000000 */  nop
/* 013CEC 01DBF9EC 34080046 */  c.lt.s      $f1, $f0
/* 013CF0 01DBF9F0 00000000 */  nop
/* 013CF4 01DBF9F4 27000045 */  bc1f        .L01DBFA94_2C5294
/* 013CF8 01DBF9F8 00000000 */   nop
/* 013CFC 01DBF9FC E101023C */  lui         $2, %hi(OP_MainCamera)
/* 013D00 01DBFA00 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 013D04 01DBFA04 3001A527 */  addiu       $5, $29, 0x130
/* 013D08 01DBFA08 A891040C */  jal         GetRef__7CCameraFPf
/* 013D0C 01DBFA0C 00000000 */   nop
/* 013D10 01DBFA10 189A81C7 */  lwc1        $f1, -0x65E8($28)
/* 013D14 01DBFA14 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 013D18 01DBFA18 00008244 */  mtc1        $2, $f0
/* 013D1C 01DBFA1C 00000000 */  nop
/* 013D20 01DBFA20 34080046 */  c.lt.s      $f1, $f0
/* 013D24 01DBFA24 00000000 */  nop
/* 013D28 01DBFA28 06000045 */  bc1f        .L01DBFA44_2C5244
/* 013D2C 01DBFA2C 00000000 */   nop
/* 013D30 01DBFA30 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 013D34 01DBFA34 00008244 */  mtc1        $2, $f0
/* 013D38 01DBFA38 00000000 */  nop
/* 013D3C 01DBFA3C 00080046 */  add.s       $f0, $f1, $f0
/* 013D40 01DBFA40 189A80E7 */  swc1        $f0, -0x65E8($28)
.L01DBFA44_2C5244:
/* 013D44 01DBFA44 BE11040C */  jal         rand
/* 013D48 01DBFA48 00000000 */   nop
/* 013D4C 01DBFA4C 0A000324 */  addiu       $3, $0, 0xA
/* 013D50 01DBFA50 1A004300 */  div         $0, $2, $3
/* 013D54 01DBFA54 00000000 */  nop
/* 013D58 01DBFA58 00000000 */  nop
/* 013D5C 01DBFA5C 10100000 */  mfhi        $2
/* 013D60 01DBFA60 00008244 */  mtc1        $2, $f0
/* 013D64 01DBFA64 00000000 */  nop
/* 013D68 01DBFA68 60008046 */  cvt.s.w     $f1, $f0
/* 013D6C 01DBFA6C 189A80C7 */  lwc1        $f0, -0x65E8($28)
/* 013D70 01DBFA70 43080046 */  div.s       $f1, $f1, $f0
/* 013D74 01DBFA74 3401A0C7 */  lwc1        $f0, 0x134($29)
/* 013D78 01DBFA78 00000146 */  add.s       $f0, $f0, $f1
/* 013D7C 01DBFA7C 3401A0E7 */  swc1        $f0, 0x134($29)
/* 013D80 01DBFA80 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 013D84 01DBFA84 E0954424 */  addiu       $4, $2, %lo(OP_MainCamera)
/* 013D88 01DBFA88 3001A527 */  addiu       $5, $29, 0x130
/* 013D8C 01DBFA8C C490040C */  jal         SetRef__7CCameraFPf
/* 013D90 01DBFA90 00000000 */   nop
.L01DBFA94_2C5294:
/* 013D94 01DBFA94 003F033C */  lui         $3, (0x3F000000 >> 16)
/* 013D98 01DBFA98 109A83AF */  sw          $3, -0x65F0($28)
/* 013D9C 01DBFA9C 20C1033C */  lui         $3, (0xC1200000 >> 16)
/* 013DA0 01DBFAA0 E301013C */  lui         $1, %hi(Fuusya__2 + 0xD8)
/* 013DA4 01DBFAA4 48AC23AC */  sw          $3, %lo(Fuusya__2 + 0xD8)($1)
/* 013DA8 01DBFAA8 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 013DAC 01DBFAAC F49983AF */  sw          $3, -0x660C($28)
.L01DBFAB0_2C52B0:
/* 013DB0 01DBFAB0 109A80C7 */  lwc1        $f0, -0x65F0($28)
/* 013DB4 01DBFAB4 E101013C */  lui         $1, %hi(Op_MotionInfo + 0x8)
/* 013DB8 01DBFAB8 E8CD20E4 */  swc1        $f0, %lo(Op_MotionInfo + 0x8)($1)
/* 013DBC 01DBFABC DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 013DC0 01DBFAC0 E41F20E4 */  swc1        $f0, %lo(CScript__2 + 0x4E4)($1)
/* 013DC4 01DBFAC4 E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3CE4)
/* 013DC8 01DBFAC8 B4C4238C */  lw          $3, %lo(MainMonstorUnit + 0x3CE4)($1)
/* 013DCC 01DBFACC 580060E4 */  swc1        $f0, 0x58($3)
.L01DBFAD0_2C52D0:
/* 013DD0 01DBFAD0 DE01013C */  lui         $1, %hi(CScript__2 + 0x128)
/* 013DD4 01DBFAD4 281C248C */  lw          $4, %lo(CScript__2 + 0x128)($1)
/* 013DD8 01DBFAD8 FFFF0324 */  addiu       $3, $0, -0x1
/* 013DDC 01DBFADC 03008310 */  beq         $4, $3, .L01DBFAEC_2C52EC
/* 013DE0 01DBFAE0 00000000 */   nop
/* 013DE4 01DBFAE4 C4FE760C */  jal         LoadCharaMajin__Fv
/* 013DE8 01DBFAE8 00000000 */   nop
.L01DBFAEC_2C52EC:
/* 013DEC 01DBFAEC 3000BF7B */  lq          $31, 0x30($29)
/* 013DF0 01DBFAF0 2000B17B */  lq          $17, 0x20($29)
/* 013DF4 01DBFAF4 1000B07B */  lq          $16, 0x10($29)
/* 013DF8 01DBFAF8 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 013DFC 01DBFAFC 4001BD27 */  addiu       $29, $29, 0x140
/* 013E00 01DBFB00 0800E003 */  jr          $31
/* 013E04 01DBFB04 00000000 */   nop
/* 013E08 01DBFB08 00000000 */  nop
/* 013E0C 01DBFB0C 00000000 */  nop
