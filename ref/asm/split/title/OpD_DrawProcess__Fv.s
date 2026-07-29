.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel OpD_DrawProcess__Fv
/* 019E60 01DC5B60 20FFBD27 */  addiu       $29, $29, -0xE0
/* 019E64 01DC5B64 3000BF7F */  sq          $31, 0x30($29)
/* 019E68 01DC5B68 2000B17F */  sq          $17, 0x20($29)
/* 019E6C 01DC5B6C 1000B07F */  sq          $16, 0x10($29)
/* 019E70 01DC5B70 0498838F */  lw          $3, -0x67FC($28)
/* 019E74 01DC5B74 B0110224 */  addiu       $2, $0, 0x11B0
/* 019E78 01DC5B78 18186200 */  mult        $3, $3, $2
/* 019E7C 01DC5B7C E101023C */  lui         $2, %hi(Cam__2 + 0xBC)
/* 019E80 01DC5B80 8C994224 */  addiu       $2, $2, %lo(Cam__2 + 0xBC)
/* 019E84 01DC5B84 21104300 */  addu        $2, $2, $3
/* 019E88 01DC5B88 0000428C */  lw          $2, 0x0($2)
/* 019E8C 01DC5B8C C49882AF */  sw          $2, -0x673C($28)
/* 019E90 01DC5B90 DE01013C */  lui         $1, %hi(CScript__2)
/* 019E94 01DC5B94 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 019E98 01DC5B98 7E000224 */  addiu       $2, $0, 0x7E
/* 019E9C 01DC5B9C 2D006210 */  beq         $3, $2, .L01DC5C54_2CB454
/* 019EA0 01DC5BA0 00000000 */   nop
/* 019EA4 01DC5BA4 76000224 */  addiu       $2, $0, 0x76
/* 019EA8 01DC5BA8 2A006210 */  beq         $3, $2, .L01DC5C54_2CB454
/* 019EAC 01DC5BAC 00000000 */   nop
/* 019EB0 01DC5BB0 73000224 */  addiu       $2, $0, 0x73
/* 019EB4 01DC5BB4 27006210 */  beq         $3, $2, .L01DC5C54_2CB454
/* 019EB8 01DC5BB8 00000000 */   nop
/* 019EBC 01DC5BBC 7D000224 */  addiu       $2, $0, 0x7D
/* 019EC0 01DC5BC0 18006210 */  beq         $3, $2, .L01DC5C24_2CB424
/* 019EC4 01DC5BC4 00000000 */   nop
/* 019EC8 01DC5BC8 7B000224 */  addiu       $2, $0, 0x7B
/* 019ECC 01DC5BCC 15006210 */  beq         $3, $2, .L01DC5C24_2CB424
/* 019ED0 01DC5BD0 00000000 */   nop
/* 019ED4 01DC5BD4 79000224 */  addiu       $2, $0, 0x79
/* 019ED8 01DC5BD8 12006210 */  beq         $3, $2, .L01DC5C24_2CB424
/* 019EDC 01DC5BDC 00000000 */   nop
/* 019EE0 01DC5BE0 71000224 */  addiu       $2, $0, 0x71
/* 019EE4 01DC5BE4 0F006210 */  beq         $3, $2, .L01DC5C24_2CB424
/* 019EE8 01DC5BE8 00000000 */   nop
/* 019EEC 01DC5BEC 70000224 */  addiu       $2, $0, 0x70
/* 019EF0 01DC5BF0 0C006210 */  beq         $3, $2, .L01DC5C24_2CB424
/* 019EF4 01DC5BF4 00000000 */   nop
/* 019EF8 01DC5BF8 6C000224 */  addiu       $2, $0, 0x6C
/* 019EFC 01DC5BFC 09006210 */  beq         $3, $2, .L01DC5C24_2CB424
/* 019F00 01DC5C00 00000000 */   nop
/* 019F04 01DC5C04 6B000224 */  addiu       $2, $0, 0x6B
/* 019F08 01DC5C08 06006210 */  beq         $3, $2, .L01DC5C24_2CB424
/* 019F0C 01DC5C0C 00000000 */   nop
/* 019F10 01DC5C10 6A000224 */  addiu       $2, $0, 0x6A
/* 019F14 01DC5C14 03006210 */  beq         $3, $2, .L01DC5C24_2CB424
/* 019F18 01DC5C18 00000000 */   nop
/* 019F1C 01DC5C1C 19000010 */  b           .L01DC5C84_2CB484
/* 019F20 01DC5C20 00000000 */   nop
.L01DC5C24_2CB424:
/* 019F24 01DC5C24 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 019F28 01DC5C28 00688244 */  mtc1        $2, $f13
/* 019F2C 01DC5C2C FFFF0234 */  ori         $2, $0, 0xFFFF
/* 019F30 01DC5C30 00008244 */  mtc1        $2, $f0
/* 019F34 01DC5C34 00000000 */  nop
/* 019F38 01DC5C38 A0038046 */  cvt.s.w     $f14, $f0
/* 019F3C 01DC5C3C C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 019F40 01DC5C40 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 019F44 01DC5C44 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 019F48 01DC5C48 00000000 */   nop
/* 019F4C 01DC5C4C 17000010 */  b           .L01DC5CAC_2CB4AC
/* 019F50 01DC5C50 00000000 */   nop
.L01DC5C54_2CB454:
/* 019F54 01DC5C54 A041023C */  lui         $2, (0x41A00000 >> 16)
/* 019F58 01DC5C58 00688244 */  mtc1        $2, $f13
/* 019F5C 01DC5C5C FFFF0234 */  ori         $2, $0, 0xFFFF
/* 019F60 01DC5C60 00008244 */  mtc1        $2, $f0
/* 019F64 01DC5C64 00000000 */  nop
/* 019F68 01DC5C68 A0038046 */  cvt.s.w     $f14, $f0
/* 019F6C 01DC5C6C C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 019F70 01DC5C70 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 019F74 01DC5C74 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 019F78 01DC5C78 00000000 */   nop
/* 019F7C 01DC5C7C 0B000010 */  b           .L01DC5CAC_2CB4AC
/* 019F80 01DC5C80 00000000 */   nop
.L01DC5C84_2CB484:
/* 019F84 01DC5C84 0041023C */  lui         $2, (0x41000000 >> 16)
/* 019F88 01DC5C88 00688244 */  mtc1        $2, $f13
/* 019F8C 01DC5C8C FFFF0234 */  ori         $2, $0, 0xFFFF
/* 019F90 01DC5C90 00008244 */  mtc1        $2, $f0
/* 019F94 01DC5C94 00000000 */  nop
/* 019F98 01DC5C98 A0038046 */  cvt.s.w     $f14, $f0
/* 019F9C 01DC5C9C C701013C */  lui         $1, %hi(mgRenderInfo + 0x1A0)
/* 019FA0 01DC5CA0 C0562CC4 */  lwc1        $f12, %lo(mgRenderInfo + 0x1A0)($1)
/* 019FA4 01DC5CA4 B8B5040C */  jal         MGSetRenderInfo__Ffff
/* 019FA8 01DC5CA8 00000000 */   nop
.L01DC5CAC_2CB4AC:
/* 019FAC 01DC5CAC DE01013C */  lui         $1, %hi(CScript__2)
/* 019FB0 01DC5CB0 001B228C */  lw          $2, %lo(CScript__2)($1)
/* 019FB4 01DC5CB4 73004128 */  slti        $1, $2, 0x73
/* 019FB8 01DC5CB8 29002010 */  beqz        $1, .L01DC5D60_2CB560
/* 019FBC 01DC5CBC 00000000 */   nop
/* 019FC0 01DC5CC0 C701023C */  lui         $2, %hi(TexManager)
/* 019FC4 01DC5CC4 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 019FC8 01DC5CC8 D48B858F */  lw          $5, -0x742C($28)
/* 019FCC 01DC5CCC 0B000624 */  addiu       $6, $0, 0xB
/* 019FD0 01DC5CD0 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 019FD4 01DC5CD4 00000000 */   nop
/* 019FD8 01DC5CD8 DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 019FDC 01DC5CDC 141B238C */  lw          $3, %lo(CScript__2 + 0x14)($1)
/* 019FE0 01DC5CE0 01000224 */  addiu       $2, $0, 0x1
/* 019FE4 01DC5CE4 07006214 */  bne         $3, $2, .L01DC5D04_2CB504
/* 019FE8 01DC5CE8 00000000 */   nop
/* 019FEC 01DC5CEC 809A828F */  lw          $2, -0x6580($28)
/* 019FF0 01DC5CF0 7F004128 */  slti        $1, $2, 0x7F
/* 019FF4 01DC5CF4 03002010 */  beqz        $1, .L01DC5D04_2CB504
/* 019FF8 01DC5CF8 00000000 */   nop
/* 019FFC 01DC5CFC 01004224 */  addiu       $2, $2, 0x1
/* 01A000 01DC5D00 809A82AF */  sw          $2, -0x6580($28)
.L01DC5D04_2CB504:
/* 01A004 01DC5D04 4000A427 */  addiu       $4, $29, 0x40
/* 01A008 01DC5D08 2500023C */  lui         $2, %hi(ambientlight)
/* 01A00C 01DC5D0C 001C4524 */  addiu       $5, $2, %lo(ambientlight)
/* 01A010 01DC5D10 0C86040C */  jal         sceVu0CopyVector
/* 01A014 01DC5D14 00000000 */   nop
/* 01A018 01DC5D18 809A80C7 */  lwc1        $f0, -0x6580($28)
/* 01A01C 01DC5D1C 20008046 */  cvt.s.w     $f0, $f0
/* 01A020 01DC5D20 4C00A0E7 */  swc1        $f0, 0x4C($29)
/* 01A024 01DC5D24 4000A427 */  addiu       $4, $29, 0x40
/* 01A028 01DC5D28 40B7040C */  jal         MGSetAmbient__FPf
/* 01A02C 01DC5D2C 00000000 */   nop
/* 01A030 01DC5D30 E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 01A034 01DC5D34 B0F64424 */  addiu       $4, $2, %lo(OP_NornMapObj)
/* 01A038 01DC5D38 A000998C */  lw          $25, 0xA0($4)
/* 01A03C 01DC5D3C 9400398F */  lw          $25, 0x94($25)
/* 01A040 01DC5D40 09F82003 */  jalr        $25
/* 01A044 01DC5D44 00000000 */   nop
/* 01A048 01DC5D48 2500023C */  lui         $2, %hi(ambientlight)
/* 01A04C 01DC5D4C 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 01A050 01DC5D50 40B7040C */  jal         MGSetAmbient__FPf
/* 01A054 01DC5D54 00000000 */   nop
/* 01A058 01DC5D58 69000010 */  b           .L01DC5F00_2CB700
/* 01A05C 01DC5D5C 00000000 */   nop
.L01DC5D60_2CB560:
/* 01A060 01DC5D60 4842023C */  lui         $2, (0x42480000 >> 16)
/* 01A064 01DC5D64 00608244 */  mtc1        $2, $f12
/* 01A068 01DC5D68 7F43023C */  lui         $2, (0x437F0000 >> 16)
/* 01A06C 01DC5D6C 00708244 */  mtc1        $2, $f14
/* 01A070 01DC5D70 0043023C */  lui         $2, (0x43000000 >> 16)
/* 01A074 01DC5D74 00788244 */  mtc1        $2, $f15
/* 01A078 01DC5D78 C842023C */  lui         $2, (0x42C80000 >> 16)
/* 01A07C 01DC5D7C 00688244 */  mtc1        $2, $f13
/* 01A080 01DC5D80 24B8040C */  jal         MGSetBGColor__Fffff
/* 01A084 01DC5D84 00000000 */   nop
/* 01A088 01DC5D88 C701023C */  lui         $2, %hi(TexManager)
/* 01A08C 01DC5D8C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A090 01DC5D90 D48B858F */  lw          $5, -0x742C($28)
/* 01A094 01DC5D94 0A000624 */  addiu       $6, $0, 0xA
/* 01A098 01DC5D98 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A09C 01DC5D9C 00000000 */   nop
/* 01A0A0 01DC5DA0 01001024 */  addiu       $16, $0, 0x1
/* 01A0A4 01DC5DA4 19000010 */  b           .L01DC5E0C_2CB60C
/* 01A0A8 01DC5DA8 00000000 */   nop
.L01DC5DAC_2CB5AC:
/* 01A0AC 01DC5DAC 08000224 */  addiu       $2, $0, 0x8
/* 01A0B0 01DC5DB0 06000216 */  bne         $16, $2, .L01DC5DCC_2CB5CC
/* 01A0B4 01DC5DB4 00000000 */   nop
/* 01A0B8 01DC5DB8 01000224 */  addiu       $2, $0, 0x1
/* 01A0BC 01DC5DBC C701013C */  lui         $1, %hi(mgRenderInfo + 0x340)
/* 01A0C0 01DC5DC0 605822AC */  sw          $2, %lo(mgRenderInfo + 0x340)($1)
/* 01A0C4 01DC5DC4 03000010 */  b           .L01DC5DD4_2CB5D4
/* 01A0C8 01DC5DC8 00000000 */   nop
.L01DC5DCC_2CB5CC:
/* 01A0CC 01DC5DCC C701013C */  lui         $1, %hi(mgRenderInfo + 0x340)
/* 01A0D0 01DC5DD0 605820AC */  sw          $0, %lo(mgRenderInfo + 0x340)($1)
.L01DC5DD4_2CB5D4:
/* 01A0D4 01DC5DD4 07000224 */  addiu       $2, $0, 0x7
/* 01A0D8 01DC5DD8 0B000212 */  beq         $16, $2, .L01DC5E08_2CB608
/* 01A0DC 01DC5DDC 00000000 */   nop
/* 01A0E0 01DC5DE0 00111000 */  sll         $2, $16, 4
/* 01A0E4 01DC5DE4 23105000 */  subu        $2, $2, $16
/* 01A0E8 01DC5DE8 00190200 */  sll         $3, $2, 4
/* 01A0EC 01DC5DEC E201023C */  lui         $2, %hi(OP_NornMapObj)
/* 01A0F0 01DC5DF0 B0F64224 */  addiu       $2, $2, %lo(OP_NornMapObj)
/* 01A0F4 01DC5DF4 21204300 */  addu        $4, $2, $3
/* 01A0F8 01DC5DF8 A000998C */  lw          $25, 0xA0($4)
/* 01A0FC 01DC5DFC 9400398F */  lw          $25, 0x94($25)
/* 01A100 01DC5E00 09F82003 */  jalr        $25
/* 01A104 01DC5E04 00000000 */   nop
.L01DC5E08_2CB608:
/* 01A108 01DC5E08 01001026 */  addiu       $16, $16, 0x1
.L01DC5E0C_2CB60C:
/* 01A10C 01DC5E0C 0B00022A */  slti        $2, $16, 0xB
/* 01A110 01DC5E10 E6FF4014 */  bnez        $2, .L01DC5DAC_2CB5AC
/* 01A114 01DC5E14 00000000 */   nop
/* 01A118 01DC5E18 DE01013C */  lui         $1, %hi(CScript__2)
/* 01A11C 01DC5E1C 001B228C */  lw          $2, %lo(CScript__2)($1)
/* 01A120 01DC5E20 78004128 */  slti        $1, $2, 0x78
/* 01A124 01DC5E24 2F002014 */  bnez        $1, .L01DC5EE4_2CB6E4
/* 01A128 01DC5E28 00000000 */   nop
/* 01A12C 01DC5E2C E201023C */  lui         $2, %hi(OP_NornMapObj + 0x690)
/* 01A130 01DC5E30 40FD5024 */  addiu       $16, $2, %lo(OP_NornMapObj + 0x690)
/* 01A134 01DC5E34 28260072 */  paddub      $4, $16, $0
/* 01A138 01DC5E38 DE01023C */  lui         $2, %hi(LIT_503__5)
/* 01A13C 01DC5E3C 88FD4524 */  addiu       $5, $2, %lo(LIT_503__5)
/* 01A140 01DC5E40 28360070 */  paddub      $6, $0, $0
/* 01A144 01DC5E44 A000198E */  lw          $25, 0xA0($16)
/* 01A148 01DC5E48 9000398F */  lw          $25, 0x90($25)
/* 01A14C 01DC5E4C 09F82003 */  jalr        $25
/* 01A150 01DC5E50 00000000 */   nop
/* 01A154 01DC5E54 28260072 */  paddub      $4, $16, $0
/* 01A158 01DC5E58 A000198E */  lw          $25, 0xA0($16)
/* 01A15C 01DC5E5C 9400398F */  lw          $25, 0x94($25)
/* 01A160 01DC5E60 09F82003 */  jalr        $25
/* 01A164 01DC5E64 00000000 */   nop
/* 01A168 01DC5E68 28260072 */  paddub      $4, $16, $0
/* 01A16C 01DC5E6C DE01023C */  lui         $2, %hi(LIT_503__5)
/* 01A170 01DC5E70 88FD4524 */  addiu       $5, $2, %lo(LIT_503__5)
/* 01A174 01DC5E74 01000624 */  addiu       $6, $0, 0x1
/* 01A178 01DC5E78 A000198E */  lw          $25, 0xA0($16)
/* 01A17C 01DC5E7C 9000398F */  lw          $25, 0x90($25)
/* 01A180 01DC5E80 09F82003 */  jalr        $25
/* 01A184 01DC5E84 00000000 */   nop
/* 01A188 01DC5E88 B000048E */  lw          $4, 0xB0($16)
/* 01A18C 01DC5E8C DE01023C */  lui         $2, %hi(LIT_503__5)
/* 01A190 01DC5E90 88FD4524 */  addiu       $5, $2, %lo(LIT_503__5)
/* 01A194 01DC5E94 C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01A198 01DC5E98 00000000 */   nop
/* 01A19C 01DC5E9C 28864070 */  paddub      $16, $2, $0
/* 01A1A0 01DC5EA0 5000A427 */  addiu       $4, $29, 0x50
/* 01A1A4 01DC5EA4 2500023C */  lui         $2, %hi(ambientlight)
/* 01A1A8 01DC5EA8 001C4524 */  addiu       $5, $2, %lo(ambientlight)
/* 01A1AC 01DC5EAC 0C86040C */  jal         sceVu0CopyVector
/* 01A1B0 01DC5EB0 00000000 */   nop
/* 01A1B4 01DC5EB4 8C42023C */  lui         $2, (0x428C0000 >> 16)
/* 01A1B8 01DC5EB8 5C00A2AF */  sw          $2, 0x5C($29)
/* 01A1BC 01DC5EBC 5000A427 */  addiu       $4, $29, 0x50
/* 01A1C0 01DC5EC0 40B7040C */  jal         MGSetAmbient__FPf
/* 01A1C4 01DC5EC4 00000000 */   nop
/* 01A1C8 01DC5EC8 28260072 */  paddub      $4, $16, $0
/* 01A1CC 01DC5ECC 60BB040C */  jal         MGDraw__FP6CFrame
/* 01A1D0 01DC5ED0 00000000 */   nop
/* 01A1D4 01DC5ED4 2500023C */  lui         $2, %hi(ambientlight)
/* 01A1D8 01DC5ED8 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 01A1DC 01DC5EDC 40B7040C */  jal         MGSetAmbient__FPf
/* 01A1E0 01DC5EE0 00000000 */   nop
.L01DC5EE4_2CB6E4:
/* 01A1E4 01DC5EE4 DE01013C */  lui         $1, %hi(CScript__2)
/* 01A1E8 01DC5EE8 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 01A1EC 01DC5EEC 7C000224 */  addiu       $2, $0, 0x7C
/* 01A1F0 01DC5EF0 03006214 */  bne         $3, $2, .L01DC5F00_2CB700
/* 01A1F4 01DC5EF4 00000000 */   nop
/* 01A1F8 01DC5EF8 641B770C */  jal         LensFreaProcess__Fv
/* 01A1FC 01DC5EFC 00000000 */   nop
.L01DC5F00_2CB700:
/* 01A200 01DC5F00 DE01013C */  lui         $1, %hi(CScript__2)
/* 01A204 01DC5F04 001B228C */  lw          $2, %lo(CScript__2)($1)
/* 01A208 01DC5F08 6A004128 */  slti        $1, $2, 0x6A
/* 01A20C 01DC5F0C 03002010 */  beqz        $1, .L01DC5F1C_2CB71C
/* 01A210 01DC5F10 00000000 */   nop
/* 01A214 01DC5F14 8021770C */  jal         HamonProcess__Fv
/* 01A218 01DC5F18 00000000 */   nop
.L01DC5F1C_2CB71C:
/* 01A21C 01DC5F1C C701023C */  lui         $2, %hi(TexManager)
/* 01A220 01DC5F20 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A224 01DC5F24 D48B858F */  lw          $5, -0x742C($28)
/* 01A228 01DC5F28 16000624 */  addiu       $6, $0, 0x16
/* 01A22C 01DC5F2C 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A230 01DC5F30 00000000 */   nop
/* 01A234 01DC5F34 D800A427 */  addiu       $4, $29, 0xD8
/* 01A238 01DC5F38 888A82DF */  ld          $2, -0x7578($28)
/* 01A23C 01DC5F3C 000082FC */  sd          $2, 0x0($4)
/* 01A240 01DC5F40 02000524 */  addiu       $5, $0, 0x2
/* 01A244 01DC5F44 40000624 */  addiu       $6, $0, 0x40
/* 01A248 01DC5F48 283E0070 */  paddub      $7, $0, $0
/* 01A24C 01DC5F4C B094050C */  jal         DepthOfField__FPfiii
/* 01A250 01DC5F50 00000000 */   nop
/* 01A254 01DC5F54 28860070 */  paddub      $16, $0, $0
/* 01A258 01DC5F58 37000010 */  b           .L01DC6038_2CB838
/* 01A25C 01DC5F5C 00000000 */   nop
.L01DC5F60_2CB760:
/* 01A260 01DC5F60 16000324 */  addiu       $3, $0, 0x16
/* 01A264 01DC5F64 33000312 */  beq         $16, $3, .L01DC6034_2CB834
/* 01A268 01DC5F68 00000000 */   nop
/* 01A26C 01DC5F6C 05000324 */  addiu       $3, $0, 0x5
/* 01A270 01DC5F70 30000312 */  beq         $16, $3, .L01DC6034_2CB834
/* 01A274 01DC5F74 00000000 */   nop
/* 01A278 01DC5F78 40181000 */  sll         $3, $16, 1
/* 01A27C 01DC5F7C 21187000 */  addu        $3, $3, $16
/* 01A280 01DC5F80 80180300 */  sll         $3, $3, 2
/* 01A284 01DC5F84 21187000 */  addu        $3, $3, $16
/* 01A288 01DC5F88 80200300 */  sll         $4, $3, 2
/* 01A28C 01DC5F8C DE01033C */  lui         $3, %hi(CScript__2 + 0x30)
/* 01A290 01DC5F90 301B6324 */  addiu       $3, $3, %lo(CScript__2 + 0x30)
/* 01A294 01DC5F94 21186400 */  addu        $3, $3, $4
/* 01A298 01DC5F98 00006390 */  lbu         $3, 0x0($3)
/* 01A29C 01DC5F9C 25006010 */  beqz        $3, .L01DC6034_2CB834
/* 01A2A0 01DC5FA0 00000000 */   nop
/* 01A2A4 01DC5FA4 C701023C */  lui         $2, %hi(TexManager)
/* 01A2A8 01DC5FA8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A2AC 01DC5FAC D48B858F */  lw          $5, -0x742C($28)
/* 01A2B0 01DC5FB0 17000624 */  addiu       $6, $0, 0x17
/* 01A2B4 01DC5FB4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A2B8 01DC5FB8 00000000 */   nop
/* 01A2BC 01DC5FBC C701023C */  lui         $2, %hi(TexManager)
/* 01A2C0 01DC5FC0 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A2C4 01DC5FC4 DE01023C */  lui         $2, %hi(LIT_926__3)
/* 01A2C8 01DC5FC8 E8FD4524 */  addiu       $5, $2, %lo(LIT_926__3)
/* 01A2CC 01DC5FCC FFFF0624 */  addiu       $6, $0, -0x1
/* 01A2D0 01DC5FD0 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01A2D4 01DC5FD4 00000000 */   nop
/* 01A2D8 01DC5FD8 280044DC */  ld          $4, 0x28($2)
/* 01A2DC 01DC5FDC 28C2040C */  jal         MGBeginDrawShadow__F9sceGsTex0
/* 01A2E0 01DC5FE0 00000000 */   nop
/* 01A2E4 01DC5FE4 0898828F */  lw          $2, -0x67F8($28)
/* 01A2E8 01DC5FE8 08004014 */  bnez        $2, .L01DC600C_2CB80C
/* 01A2EC 01DC5FEC 00000000 */   nop
/* 01A2F0 01DC5FF0 B0110224 */  addiu       $2, $0, 0x11B0
/* 01A2F4 01DC5FF4 18180202 */  mult        $3, $16, $2
/* 01A2F8 01DC5FF8 DF01023C */  lui         $2, %hi(Chara__3)
/* 01A2FC 01DC5FFC E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01A300 01DC6000 21204300 */  addu        $4, $2, $3
/* 01A304 01DC6004 24E3040C */  jal         ShadowStep__10CCharacterFv
/* 01A308 01DC6008 00000000 */   nop
.L01DC600C_2CB80C:
/* 01A30C 01DC600C B0110224 */  addiu       $2, $0, 0x11B0
/* 01A310 01DC6010 18180202 */  mult        $3, $16, $2
/* 01A314 01DC6014 DF01023C */  lui         $2, %hi(Chara__3)
/* 01A318 01DC6018 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01A31C 01DC601C 21204300 */  addu        $4, $2, $3
/* 01A320 01DC6020 C0E5040C */  jal         DrawShadow__10CCharacterFv
/* 01A324 01DC6024 00000000 */   nop
/* 01A328 01DC6028 34000424 */  addiu       $4, $0, 0x34
/* 01A32C 01DC602C CCC2040C */  jal         MGEndDrawShadow__FUc
/* 01A330 01DC6030 00000000 */   nop
.L01DC6034_2CB834:
/* 01A334 01DC6034 01001026 */  addiu       $16, $16, 0x1
.L01DC6038_2CB838:
/* 01A338 01DC6038 1700032A */  slti        $3, $16, 0x17
/* 01A33C 01DC603C C8FF6014 */  bnez        $3, .L01DC5F60_2CB760
/* 01A340 01DC6040 00000000 */   nop
/* 01A344 01DC6044 28860070 */  paddub      $16, $0, $0
/* 01A348 01DC6048 50000010 */  b           .L01DC618C_2CB98C
/* 01A34C 01DC604C 00000000 */   nop
.L01DC6050_2CB850:
/* 01A350 01DC6050 40181000 */  sll         $3, $16, 1
/* 01A354 01DC6054 21187000 */  addu        $3, $3, $16
/* 01A358 01DC6058 80180300 */  sll         $3, $3, 2
/* 01A35C 01DC605C 21187000 */  addu        $3, $3, $16
/* 01A360 01DC6060 80200300 */  sll         $4, $3, 2
/* 01A364 01DC6064 DE01033C */  lui         $3, %hi(CScript__2 + 0x30)
/* 01A368 01DC6068 301B6324 */  addiu       $3, $3, %lo(CScript__2 + 0x30)
/* 01A36C 01DC606C 21186400 */  addu        $3, $3, $4
/* 01A370 01DC6070 00006390 */  lbu         $3, 0x0($3)
/* 01A374 01DC6074 44006010 */  beqz        $3, .L01DC6188_2CB988
/* 01A378 01DC6078 00000000 */   nop
/* 01A37C 01DC607C E101023C */  lui         $2, %hi(CharaTex__2)
/* 01A380 01DC6080 B0954224 */  addiu       $2, $2, %lo(CharaTex__2)
/* 01A384 01DC6084 21105000 */  addu        $2, $2, $16
/* 01A388 01DC6088 00004680 */  lb          $6, 0x0($2)
/* 01A38C 01DC608C C701023C */  lui         $2, %hi(TexManager)
/* 01A390 01DC6090 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A394 01DC6094 D48B858F */  lw          $5, -0x742C($28)
/* 01A398 01DC6098 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A39C 01DC609C 00000000 */   nop
/* 01A3A0 01DC60A0 0898828F */  lw          $2, -0x67F8($28)
/* 01A3A4 01DC60A4 0D004014 */  bnez        $2, .L01DC60DC_2CB8DC
/* 01A3A8 01DC60A8 00000000 */   nop
/* 01A3AC 01DC60AC B0110224 */  addiu       $2, $0, 0x11B0
/* 01A3B0 01DC60B0 18180202 */  mult        $3, $16, $2
/* 01A3B4 01DC60B4 DF01023C */  lui         $2, %hi(Chara__3)
/* 01A3B8 01DC60B8 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01A3BC 01DC60BC 21884300 */  addu        $17, $2, $3
/* 01A3C0 01DC60C0 28262072 */  paddub      $4, $17, $0
/* 01A3C4 01DC60C4 4CE1040C */  jal         Step__10CCharacterFv
/* 01A3C8 01DC60C8 00000000 */   nop
/* 01A3CC 01DC60CC 28262072 */  paddub      $4, $17, $0
/* 01A3D0 01DC60D0 282E0070 */  paddub      $5, $0, $0
/* 01A3D4 01DC60D4 94E3040C */  jal         ClothStep__10CCharacterFi
/* 01A3D8 01DC60D8 00000000 */   nop
.L01DC60DC_2CB8DC:
/* 01A3DC 01DC60DC 08000224 */  addiu       $2, $0, 0x8
/* 01A3E0 01DC60E0 04000212 */  beq         $16, $2, .L01DC60F4_2CB8F4
/* 01A3E4 01DC60E4 00000000 */   nop
/* 01A3E8 01DC60E8 0B000224 */  addiu       $2, $0, 0xB
/* 01A3EC 01DC60EC 04000216 */  bne         $16, $2, .L01DC6100_2CB900
/* 01A3F0 01DC60F0 00000000 */   nop
.L01DC60F4_2CB8F4:
/* 01A3F4 01DC60F4 28260072 */  paddub      $4, $16, $0
/* 01A3F8 01DC60F8 4C22770C */  jal         FaceChange__Fi__4
/* 01A3FC 01DC60FC 00000000 */   nop
.L01DC6100_2CB900:
/* 01A400 01DC6100 DE01013C */  lui         $1, %hi(CScript__2)
/* 01A404 01DC6104 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 01A408 01DC6108 6F006228 */  slti        $2, $3, 0x6F
/* 01A40C 01DC610C 11004014 */  bnez        $2, .L01DC6154_2CB954
/* 01A410 01DC6110 00000000 */   nop
/* 01A414 01DC6114 72006128 */  slti        $1, $3, 0x72
/* 01A418 01DC6118 0E002010 */  beqz        $1, .L01DC6154_2CB954
/* 01A41C 01DC611C 00000000 */   nop
/* 01A420 01DC6120 B0110224 */  addiu       $2, $0, 0x11B0
/* 01A424 01DC6124 18180202 */  mult        $3, $16, $2
/* 01A428 01DC6128 DF01023C */  lui         $2, %hi(Chara__3 + 0xBC)
/* 01A42C 01DC612C 9CFF4224 */  addiu       $2, $2, %lo(Chara__3 + 0xBC)
/* 01A430 01DC6130 21104300 */  addu        $2, $2, $3
/* 01A434 01DC6134 0000428C */  lw          $2, 0x0($2)
/* 01A438 01DC6138 6000A427 */  addiu       $4, $29, 0x60
/* 01A43C 01DC613C 20024524 */  addiu       $5, $2, 0x220
/* 01A440 01DC6140 0C86040C */  jal         sceVu0CopyVector
/* 01A444 01DC6144 00000000 */   nop
/* 01A448 01DC6148 6000A427 */  addiu       $4, $29, 0x60
/* 01A44C 01DC614C 3C1A770C */  jal         RollLight__FPf
/* 01A450 01DC6150 00000000 */   nop
.L01DC6154_2CB954:
/* 01A454 01DC6154 B0110224 */  addiu       $2, $0, 0x11B0
/* 01A458 01DC6158 18180202 */  mult        $3, $16, $2
/* 01A45C 01DC615C DF01023C */  lui         $2, %hi(Chara__3)
/* 01A460 01DC6160 E0FE4224 */  addiu       $2, $2, %lo(Chara__3)
/* 01A464 01DC6164 21204300 */  addu        $4, $2, $3
/* 01A468 01DC6168 C4E4040C */  jal         Draw__10CCharacterFv
/* 01A46C 01DC616C 00000000 */   nop
/* 01A470 01DC6170 2500023C */  lui         $2, %hi(light)
/* 01A474 01DC6174 801B4424 */  addiu       $4, $2, %lo(light)
/* 01A478 01DC6178 2500023C */  lui         $2, %hi(lightcolor)
/* 01A47C 01DC617C C01B4524 */  addiu       $5, $2, %lo(lightcolor)
/* 01A480 01DC6180 08B7040C */  jal         MGSetPLight__FPA4_fPA4_f
/* 01A484 01DC6184 00000000 */   nop
.L01DC6188_2CB988:
/* 01A488 01DC6188 01001026 */  addiu       $16, $16, 0x1
.L01DC618C_2CB98C:
/* 01A48C 01DC618C 1700032A */  slti        $3, $16, 0x17
/* 01A490 01DC6190 AFFF6014 */  bnez        $3, .L01DC6050_2CB850
/* 01A494 01DC6194 00000000 */   nop
/* 01A498 01DC6198 DE01013C */  lui         $1, %hi(CScript__2)
/* 01A49C 01DC619C 001B248C */  lw          $4, %lo(CScript__2)($1)
/* 01A4A0 01DC61A0 71000324 */  addiu       $3, $0, 0x71
/* 01A4A4 01DC61A4 1F008310 */  beq         $4, $3, .L01DC6224_2CBA24
/* 01A4A8 01DC61A8 00000000 */   nop
/* 01A4AC 01DC61AC 70000324 */  addiu       $3, $0, 0x70
/* 01A4B0 01DC61B0 1C008310 */  beq         $4, $3, .L01DC6224_2CBA24
/* 01A4B4 01DC61B4 00000000 */   nop
/* 01A4B8 01DC61B8 77000324 */  addiu       $3, $0, 0x77
/* 01A4BC 01DC61BC 0F008310 */  beq         $4, $3, .L01DC61FC_2CB9FC
/* 01A4C0 01DC61C0 00000000 */   nop
/* 01A4C4 01DC61C4 76000324 */  addiu       $3, $0, 0x76
/* 01A4C8 01DC61C8 0C008310 */  beq         $4, $3, .L01DC61FC_2CB9FC
/* 01A4CC 01DC61CC 00000000 */   nop
/* 01A4D0 01DC61D0 6F000324 */  addiu       $3, $0, 0x6F
/* 01A4D4 01DC61D4 03008310 */  beq         $4, $3, .L01DC61E4_2CB9E4
/* 01A4D8 01DC61D8 00000000 */   nop
/* 01A4DC 01DC61DC 13000010 */  b           .L01DC622C_2CBA2C
/* 01A4E0 01DC61E0 00000000 */   nop
.L01DC61E4_2CB9E4:
/* 01A4E4 01DC61E4 0040023C */  lui         $2, (0x40000000 >> 16)
/* 01A4E8 01DC61E8 00608244 */  mtc1        $2, $f12
/* 01A4EC 01DC61EC 1C1B770C */  jal         EffectSeireiKing__Ff
/* 01A4F0 01DC61F0 00000000 */   nop
/* 01A4F4 01DC61F4 0D000010 */  b           .L01DC622C_2CBA2C
/* 01A4F8 01DC61F8 00000000 */   nop
.L01DC61FC_2CB9FC:
/* 01A4FC 01DC61FC DE01013C */  lui         $1, %hi(CScript__2 + 0x24)
/* 01A500 01DC6200 241B238C */  lw          $3, %lo(CScript__2 + 0x24)($1)
/* 01A504 01DC6204 09006014 */  bnez        $3, .L01DC622C_2CBA2C
/* 01A508 01DC6208 00000000 */   nop
/* 01A50C 01DC620C 8040023C */  lui         $2, (0x40800000 >> 16)
/* 01A510 01DC6210 00608244 */  mtc1        $2, $f12
/* 01A514 01DC6214 1C1B770C */  jal         EffectSeireiKing__Ff
/* 01A518 01DC6218 00000000 */   nop
/* 01A51C 01DC621C 03000010 */  b           .L01DC622C_2CBA2C
/* 01A520 01DC6220 00000000 */   nop
.L01DC6224_2CBA24:
/* 01A524 01DC6224 5019770C */  jal         EffectAtraPrizum__Fv
/* 01A528 01DC6228 00000000 */   nop
.L01DC622C_2CBA2C:
/* 01A52C 01DC622C CC9A8383 */  lb          $3, -0x6534($28)
/* 01A530 01DC6230 04006014 */  bnez        $3, .L01DC6244_2CBA44
/* 01A534 01DC6234 00000000 */   nop
/* 01A538 01DC6238 C89A80AF */  sw          $0, -0x6538($28)
/* 01A53C 01DC623C 01000324 */  addiu       $3, $0, 0x1
/* 01A540 01DC6240 CC9A83A3 */  sb          $3, -0x6534($28)
.L01DC6244_2CBA44:
/* 01A544 01DC6244 D49A8383 */  lb          $3, -0x652C($28)
/* 01A548 01DC6248 04006014 */  bnez        $3, .L01DC625C_2CBA5C
/* 01A54C 01DC624C 00000000 */   nop
/* 01A550 01DC6250 D09A80AF */  sw          $0, -0x6530($28)
/* 01A554 01DC6254 01000324 */  addiu       $3, $0, 0x1
/* 01A558 01DC6258 D49A83A3 */  sb          $3, -0x652C($28)
.L01DC625C_2CBA5C:
/* 01A55C 01DC625C DC9A8383 */  lb          $3, -0x6524($28)
/* 01A560 01DC6260 04006014 */  bnez        $3, .L01DC6274_2CBA74
/* 01A564 01DC6264 00000000 */   nop
/* 01A568 01DC6268 D89A80AF */  sw          $0, -0x6528($28)
/* 01A56C 01DC626C 01000324 */  addiu       $3, $0, 0x1
/* 01A570 01DC6270 DC9A83A3 */  sb          $3, -0x6524($28)
.L01DC6274_2CBA74:
/* 01A574 01DC6274 DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 01A578 01DC6278 141B248C */  lw          $4, %lo(CScript__2 + 0x14)($1)
/* 01A57C 01DC627C 02000324 */  addiu       $3, $0, 0x2
/* 01A580 01DC6280 05008314 */  bne         $4, $3, .L01DC6298_2CBA98
/* 01A584 01DC6284 00000000 */   nop
/* 01A588 01DC6288 80000324 */  addiu       $3, $0, 0x80
/* 01A58C 01DC628C C89A83AF */  sw          $3, -0x6538($28)
/* 01A590 01DC6290 06000010 */  b           .L01DC62AC_2CBAAC
/* 01A594 01DC6294 00000000 */   nop
.L01DC6298_2CBA98:
/* 01A598 01DC6298 C89A838F */  lw          $3, -0x6538($28)
/* 01A59C 01DC629C 03006018 */  blez        $3, .L01DC62AC_2CBAAC
/* 01A5A0 01DC62A0 00000000 */   nop
/* 01A5A4 01DC62A4 FEFF6324 */  addiu       $3, $3, -0x2
/* 01A5A8 01DC62A8 C89A83AF */  sw          $3, -0x6538($28)
.L01DC62AC_2CBAAC:
/* 01A5AC 01DC62AC 03000324 */  addiu       $3, $0, 0x3
/* 01A5B0 01DC62B0 09008314 */  bne         $4, $3, .L01DC62D8_2CBAD8
/* 01A5B4 01DC62B4 00000000 */   nop
/* 01A5B8 01DC62B8 D09A838F */  lw          $3, -0x6530($28)
/* 01A5BC 01DC62BC 80006128 */  slti        $1, $3, 0x80
/* 01A5C0 01DC62C0 0A002010 */  beqz        $1, .L01DC62EC_2CBAEC
/* 01A5C4 01DC62C4 00000000 */   nop
/* 01A5C8 01DC62C8 02006324 */  addiu       $3, $3, 0x2
/* 01A5CC 01DC62CC D09A83AF */  sw          $3, -0x6530($28)
/* 01A5D0 01DC62D0 06000010 */  b           .L01DC62EC_2CBAEC
/* 01A5D4 01DC62D4 00000000 */   nop
.L01DC62D8_2CBAD8:
/* 01A5D8 01DC62D8 D09A838F */  lw          $3, -0x6530($28)
/* 01A5DC 01DC62DC 03006018 */  blez        $3, .L01DC62EC_2CBAEC
/* 01A5E0 01DC62E0 00000000 */   nop
/* 01A5E4 01DC62E4 FEFF6324 */  addiu       $3, $3, -0x2
/* 01A5E8 01DC62E8 D09A83AF */  sw          $3, -0x6530($28)
.L01DC62EC_2CBAEC:
/* 01A5EC 01DC62EC 04000324 */  addiu       $3, $0, 0x4
/* 01A5F0 01DC62F0 09008314 */  bne         $4, $3, .L01DC6318_2CBB18
/* 01A5F4 01DC62F4 00000000 */   nop
/* 01A5F8 01DC62F8 D89A838F */  lw          $3, -0x6528($28)
/* 01A5FC 01DC62FC 80006128 */  slti        $1, $3, 0x80
/* 01A600 01DC6300 0A002010 */  beqz        $1, .L01DC632C_2CBB2C
/* 01A604 01DC6304 00000000 */   nop
/* 01A608 01DC6308 02006324 */  addiu       $3, $3, 0x2
/* 01A60C 01DC630C D89A83AF */  sw          $3, -0x6528($28)
/* 01A610 01DC6310 06000010 */  b           .L01DC632C_2CBB2C
/* 01A614 01DC6314 00000000 */   nop
.L01DC6318_2CBB18:
/* 01A618 01DC6318 D89A838F */  lw          $3, -0x6528($28)
/* 01A61C 01DC631C 03006018 */  blez        $3, .L01DC632C_2CBB2C
/* 01A620 01DC6320 00000000 */   nop
/* 01A624 01DC6324 FFFF6324 */  addiu       $3, $3, -0x1
/* 01A628 01DC6328 D89A83AF */  sw          $3, -0x6528($28)
.L01DC632C_2CBB2C:
/* 01A62C 01DC632C C89A838F */  lw          $3, -0x6538($28)
/* 01A630 01DC6330 22006010 */  beqz        $3, .L01DC63BC_2CBBBC
/* 01A634 01DC6334 00000000 */   nop
/* 01A638 01DC6338 C701023C */  lui         $2, %hi(TexManager)
/* 01A63C 01DC633C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A640 01DC6340 D48B858F */  lw          $5, -0x742C($28)
/* 01A644 01DC6344 05000624 */  addiu       $6, $0, 0x5
/* 01A648 01DC6348 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A64C 01DC634C 00000000 */   nop
/* 01A650 01DC6350 8000A0AF */  sw          $0, 0x80($29)
/* 01A654 01DC6354 8400A0AF */  sw          $0, 0x84($29)
/* 01A658 01DC6358 80020324 */  addiu       $3, $0, 0x280
/* 01A65C 01DC635C 8800A3AF */  sw          $3, 0x88($29)
/* 01A660 01DC6360 C0010224 */  addiu       $2, $0, 0x1C0
/* 01A664 01DC6364 8C00A2AF */  sw          $2, 0x8C($29)
/* 01A668 01DC6368 7000A0AF */  sw          $0, 0x70($29)
/* 01A66C 01DC636C 7400A0AF */  sw          $0, 0x74($29)
/* 01A670 01DC6370 7800A3AF */  sw          $3, 0x78($29)
/* 01A674 01DC6374 7C00A2AF */  sw          $2, 0x7C($29)
/* 01A678 01DC6378 A0B8040C */  jal         GetVif1Packet__Fv
/* 01A67C 01DC637C 00000000 */   nop
/* 01A680 01DC6380 28864070 */  paddub      $16, $2, $0
/* 01A684 01DC6384 C701023C */  lui         $2, %hi(TexManager)
/* 01A688 01DC6388 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A68C 01DC638C DE01023C */  lui         $2, %hi(LIT_927__3)
/* 01A690 01DC6390 F8FD4524 */  addiu       $5, $2, %lo(LIT_927__3)
/* 01A694 01DC6394 FFFF0624 */  addiu       $6, $0, -0x1
/* 01A698 01DC6398 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01A69C 01DC639C 00000000 */   nop
/* 01A6A0 01DC63A0 C89A8893 */  lbu         $8, -0x6538($28)
/* 01A6A4 01DC63A4 28260072 */  paddub      $4, $16, $0
/* 01A6A8 01DC63A8 282E4070 */  paddub      $5, $2, $0
/* 01A6AC 01DC63AC 7000A627 */  addiu       $6, $29, 0x70
/* 01A6B0 01DC63B0 8000A727 */  addiu       $7, $29, 0x80
/* 01A6B4 01DC63B4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01A6B8 01DC63B8 00000000 */   nop
.L01DC63BC_2CBBBC:
/* 01A6BC 01DC63BC D09A838F */  lw          $3, -0x6530($28)
/* 01A6C0 01DC63C0 22006010 */  beqz        $3, .L01DC644C_2CBC4C
/* 01A6C4 01DC63C4 00000000 */   nop
/* 01A6C8 01DC63C8 C701023C */  lui         $2, %hi(TexManager)
/* 01A6CC 01DC63CC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A6D0 01DC63D0 D48B858F */  lw          $5, -0x742C($28)
/* 01A6D4 01DC63D4 05000624 */  addiu       $6, $0, 0x5
/* 01A6D8 01DC63D8 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A6DC 01DC63DC 00000000 */   nop
/* 01A6E0 01DC63E0 A000A0AF */  sw          $0, 0xA0($29)
/* 01A6E4 01DC63E4 A400A0AF */  sw          $0, 0xA4($29)
/* 01A6E8 01DC63E8 80020324 */  addiu       $3, $0, 0x280
/* 01A6EC 01DC63EC A800A3AF */  sw          $3, 0xA8($29)
/* 01A6F0 01DC63F0 C0010224 */  addiu       $2, $0, 0x1C0
/* 01A6F4 01DC63F4 AC00A2AF */  sw          $2, 0xAC($29)
/* 01A6F8 01DC63F8 9000A0AF */  sw          $0, 0x90($29)
/* 01A6FC 01DC63FC 9400A0AF */  sw          $0, 0x94($29)
/* 01A700 01DC6400 9800A3AF */  sw          $3, 0x98($29)
/* 01A704 01DC6404 9C00A2AF */  sw          $2, 0x9C($29)
/* 01A708 01DC6408 A0B8040C */  jal         GetVif1Packet__Fv
/* 01A70C 01DC640C 00000000 */   nop
/* 01A710 01DC6410 28864070 */  paddub      $16, $2, $0
/* 01A714 01DC6414 C701023C */  lui         $2, %hi(TexManager)
/* 01A718 01DC6418 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A71C 01DC641C DE01023C */  lui         $2, %hi(LIT_928__4)
/* 01A720 01DC6420 00FE4524 */  addiu       $5, $2, %lo(LIT_928__4)
/* 01A724 01DC6424 FFFF0624 */  addiu       $6, $0, -0x1
/* 01A728 01DC6428 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01A72C 01DC642C 00000000 */   nop
/* 01A730 01DC6430 D09A8893 */  lbu         $8, -0x6530($28)
/* 01A734 01DC6434 28260072 */  paddub      $4, $16, $0
/* 01A738 01DC6438 282E4070 */  paddub      $5, $2, $0
/* 01A73C 01DC643C 9000A627 */  addiu       $6, $29, 0x90
/* 01A740 01DC6440 A000A727 */  addiu       $7, $29, 0xA0
/* 01A744 01DC6444 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01A748 01DC6448 00000000 */   nop
.L01DC644C_2CBC4C:
/* 01A74C 01DC644C D89A838F */  lw          $3, -0x6528($28)
/* 01A750 01DC6450 22006010 */  beqz        $3, .L01DC64DC_2CBCDC
/* 01A754 01DC6454 00000000 */   nop
/* 01A758 01DC6458 C701023C */  lui         $2, %hi(TexManager)
/* 01A75C 01DC645C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A760 01DC6460 D48B858F */  lw          $5, -0x742C($28)
/* 01A764 01DC6464 06000624 */  addiu       $6, $0, 0x6
/* 01A768 01DC6468 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A76C 01DC646C 00000000 */   nop
/* 01A770 01DC6470 C000A0AF */  sw          $0, 0xC0($29)
/* 01A774 01DC6474 C400A0AF */  sw          $0, 0xC4($29)
/* 01A778 01DC6478 80020324 */  addiu       $3, $0, 0x280
/* 01A77C 01DC647C C800A3AF */  sw          $3, 0xC8($29)
/* 01A780 01DC6480 C0010224 */  addiu       $2, $0, 0x1C0
/* 01A784 01DC6484 CC00A2AF */  sw          $2, 0xCC($29)
/* 01A788 01DC6488 B000A0AF */  sw          $0, 0xB0($29)
/* 01A78C 01DC648C B400A0AF */  sw          $0, 0xB4($29)
/* 01A790 01DC6490 B800A3AF */  sw          $3, 0xB8($29)
/* 01A794 01DC6494 BC00A2AF */  sw          $2, 0xBC($29)
/* 01A798 01DC6498 A0B8040C */  jal         GetVif1Packet__Fv
/* 01A79C 01DC649C 00000000 */   nop
/* 01A7A0 01DC64A0 28864070 */  paddub      $16, $2, $0
/* 01A7A4 01DC64A4 C701023C */  lui         $2, %hi(TexManager)
/* 01A7A8 01DC64A8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A7AC 01DC64AC DE01023C */  lui         $2, %hi(LIT_929__4)
/* 01A7B0 01DC64B0 08FE4524 */  addiu       $5, $2, %lo(LIT_929__4)
/* 01A7B4 01DC64B4 FFFF0624 */  addiu       $6, $0, -0x1
/* 01A7B8 01DC64B8 B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 01A7BC 01DC64BC 00000000 */   nop
/* 01A7C0 01DC64C0 D89A8893 */  lbu         $8, -0x6528($28)
/* 01A7C4 01DC64C4 28260072 */  paddub      $4, $16, $0
/* 01A7C8 01DC64C8 282E4070 */  paddub      $5, $2, $0
/* 01A7CC 01DC64CC B000A627 */  addiu       $6, $29, 0xB0
/* 01A7D0 01DC64D0 C000A727 */  addiu       $7, $29, 0xC0
/* 01A7D4 01DC64D4 C470050C */  jal         set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 01A7D8 01DC64D8 00000000 */   nop
.L01DC64DC_2CBCDC:
/* 01A7DC 01DC64DC DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 01A7E0 01DC64E0 141B248C */  lw          $4, %lo(CScript__2 + 0x14)($1)
/* 01A7E4 01DC64E4 06000324 */  addiu       $3, $0, 0x6
/* 01A7E8 01DC64E8 06008310 */  beq         $4, $3, .L01DC6504_2CBD04
/* 01A7EC 01DC64EC 00000000 */   nop
/* 01A7F0 01DC64F0 05000324 */  addiu       $3, $0, 0x5
/* 01A7F4 01DC64F4 03008310 */  beq         $4, $3, .L01DC6504_2CBD04
/* 01A7F8 01DC64F8 00000000 */   nop
/* 01A7FC 01DC64FC 09000010 */  b           .L01DC6524_2CBD24
/* 01A800 01DC6500 00000000 */   nop
.L01DC6504_2CBD04:
/* 01A804 01DC6504 C701023C */  lui         $2, %hi(TexManager)
/* 01A808 01DC6508 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A80C 01DC650C D48B858F */  lw          $5, -0x742C($28)
/* 01A810 01DC6510 07000624 */  addiu       $6, $0, 0x7
/* 01A814 01DC6514 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A818 01DC6518 00000000 */   nop
/* 01A81C 01DC651C 9C1B770C */  jal         Setsumei__Fv
/* 01A820 01DC6520 00000000 */   nop
.L01DC6524_2CBD24:
/* 01A824 01DC6524 3000BF7B */  lq          $31, 0x30($29)
/* 01A828 01DC6528 2000B17B */  lq          $17, 0x20($29)
/* 01A82C 01DC652C 1000B07B */  lq          $16, 0x10($29)
/* 01A830 01DC6530 E000BD27 */  addiu       $29, $29, 0xE0
/* 01A834 01DC6534 0800E003 */  jr          $31
/* 01A838 01DC6538 00000000 */   nop
/* 01A83C 01DC653C 00000000 */  nop
