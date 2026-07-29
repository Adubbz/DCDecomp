.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawMess__Fv
/* 004DE0 01DB0AE0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 004DE4 01DB0AE4 0000BF7F */  sq          $31, 0x0($29)
/* 004DE8 01DB0AE8 DE01013C */  lui         $1, %hi(CScript__2 + 0x18)
/* 004DEC 01DB0AEC 181B238C */  lw          $3, %lo(CScript__2 + 0x18)($1)
/* 004DF0 01DB0AF0 07006128 */  slti        $1, $3, 0x7
/* 004DF4 01DB0AF4 03002014 */  bnez        $1, .L01DB0B04_2B6304
/* 004DF8 01DB0AF8 00000000 */   nop
/* 004DFC 01DB0AFC E101013C */  lui         $1, %hi(Mes1 + 0xB0)
/* 004E00 01DB0B00 A0CE20AC */  sw          $0, %lo(Mes1 + 0xB0)($1)
.L01DB0B04_2B6304:
/* 004E04 01DB0B04 DE01013C */  lui         $1, %hi(CScript__2 + 0x4EC)
/* 004E08 01DB0B08 EC1F238C */  lw          $3, %lo(CScript__2 + 0x4EC)($1)
/* 004E0C 01DB0B0C E3006010 */  beqz        $3, .L01DB0E9C_2B669C
/* 004E10 01DB0B10 00000000 */   nop
/* 004E14 01DB0B14 C701023C */  lui         $2, %hi(TexManager)
/* 004E18 01DB0B18 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 004E1C 01DB0B1C D48B858F */  lw          $5, -0x742C($28)
/* 004E20 01DB0B20 E101013C */  lui         $1, %hi(Mes1 + 0x174C)
/* 004E24 01DB0B24 3CE5268C */  lw          $6, %lo(Mes1 + 0x174C)($1)
/* 004E28 01DB0B28 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 004E2C 01DB0B2C 00000000 */   nop
/* 004E30 01DB0B30 54988283 */  lb          $2, -0x67AC($28)
/* 004E34 01DB0B34 04004014 */  bnez        $2, .L01DB0B48_2B6348
/* 004E38 01DB0B38 00000000 */   nop
/* 004E3C 01DB0B3C 509880AF */  sw          $0, -0x67B0($28)
/* 004E40 01DB0B40 01000224 */  addiu       $2, $0, 0x1
/* 004E44 01DB0B44 549882A3 */  sb          $2, -0x67AC($28)
.L01DB0B48_2B6348:
/* 004E48 01DB0B48 DE01013C */  lui         $1, %hi(CScript__2 + 0x4EC)
/* 004E4C 01DB0B4C EC1F238C */  lw          $3, %lo(CScript__2 + 0x4EC)($1)
/* 004E50 01DB0B50 5098828F */  lw          $2, -0x67B0($28)
/* 004E54 01DB0B54 06006210 */  beq         $3, $2, .L01DB0B70_2B6370
/* 004E58 01DB0B58 00000000 */   nop
/* 004E5C 01DB0B5C 509883AF */  sw          $3, -0x67B0($28)
/* 004E60 01DB0B60 01000224 */  addiu       $2, $0, 0x1
/* 004E64 01DB0B64 C88682AF */  sw          $2, -0x7938($28)
/* 004E68 01DB0B68 4F000010 */  b           .L01DB0CA8_2B64A8
/* 004E6C 01DB0B6C 00000000 */   nop
.L01DB0B70_2B6370:
/* 004E70 01DB0B70 0898828F */  lw          $2, -0x67F8($28)
/* 004E74 01DB0B74 10004014 */  bnez        $2, .L01DB0BB8_2B63B8
/* 004E78 01DB0B78 00000000 */   nop
/* 004E7C 01DB0B7C DE01013C */  lui         $1, %hi(CScript__2 + 0x4F0)
/* 004E80 01DB0B80 F01F20C4 */  lwc1        $f0, %lo(CScript__2 + 0x4F0)($1)
/* 004E84 01DB0B84 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 004E88 01DB0B88 E41F21C4 */  lwc1        $f1, %lo(CScript__2 + 0x4E4)($1)
/* 004E8C 01DB0B8C 36000146 */  c.le.s      $f0, $f1
/* 004E90 01DB0B90 00000000 */  nop
/* 004E94 01DB0B94 06000145 */  bc1t        .L01DB0BB0_2B63B0
/* 004E98 01DB0B98 00000000 */   nop
/* 004E9C 01DB0B9C 01000146 */  sub.s       $f0, $f0, $f1
/* 004EA0 01DB0BA0 DE01013C */  lui         $1, %hi(CScript__2 + 0x4F0)
/* 004EA4 01DB0BA4 F01F20E4 */  swc1        $f0, %lo(CScript__2 + 0x4F0)($1)
/* 004EA8 01DB0BA8 03000010 */  b           .L01DB0BB8_2B63B8
/* 004EAC 01DB0BAC 00000000 */   nop
.L01DB0BB0_2B63B0:
/* 004EB0 01DB0BB0 DE01013C */  lui         $1, %hi(CScript__2 + 0x4EC)
/* 004EB4 01DB0BB4 EC1F20AC */  sw          $0, %lo(CScript__2 + 0x4EC)($1)
.L01DB0BB8_2B63B8:
/* 004EB8 01DB0BB8 E101013C */  lui         $1, %hi(Mes1 + 0x16C8)
/* 004EBC 01DB0BBC B8E420AC */  sw          $0, %lo(Mes1 + 0x16C8)($1)
/* 004EC0 01DB0BC0 DE01013C */  lui         $1, %hi(CScript__2 + 0x24)
/* 004EC4 01DB0BC4 241B228C */  lw          $2, %lo(CScript__2 + 0x24)($1)
/* 004EC8 01DB0BC8 37004010 */  beqz        $2, .L01DB0CA8_2B64A8
/* 004ECC 01DB0BCC 00000000 */   nop
/* 004ED0 01DB0BD0 0040023C */  lui         $2, (0x40000000 >> 16)
/* 004ED4 01DB0BD4 00088244 */  mtc1        $2, $f1
/* 004ED8 01DB0BD8 DE01013C */  lui         $1, %hi(CScript__2 + 0x4E4)
/* 004EDC 01DB0BDC E41F20C4 */  lwc1        $f0, %lo(CScript__2 + 0x4E4)($1)
/* 004EE0 01DB0BE0 02080046 */  mul.s       $f0, $f1, $f0
/* 004EE4 01DB0BE4 DE01013C */  lui         $1, %hi(CScript__2 + 0x4F0)
/* 004EE8 01DB0BE8 F01F20E4 */  swc1        $f0, %lo(CScript__2 + 0x4F0)($1)
/* 004EEC 01DB0BEC E101023C */  lui         $2, %hi(Mes1)
/* 004EF0 01DB0BF0 F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 004EF4 01DB0BF4 2038050C */  jal         State__6ClsMesFv
/* 004EF8 01DB0BF8 00000000 */   nop
/* 004EFC 01DB0BFC 03000324 */  addiu       $3, $0, 0x3
/* 004F00 01DB0C00 0C004310 */  beq         $2, $3, .L01DB0C34_2B6434
/* 004F04 01DB0C04 00000000 */   nop
/* 004F08 01DB0C08 E101013C */  lui         $1, %hi(Mes1 + 0xB0)
/* 004F0C 01DB0C0C A0CE228C */  lw          $2, %lo(Mes1 + 0xB0)($1)
/* 004F10 01DB0C10 23004014 */  bnez        $2, .L01DB0CA0_2B64A0
/* 004F14 01DB0C14 00000000 */   nop
/* 004F18 01DB0C18 E101023C */  lui         $2, %hi(Mes1)
/* 004F1C 01DB0C1C F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 004F20 01DB0C20 2038050C */  jal         State__6ClsMesFv
/* 004F24 01DB0C24 00000000 */   nop
/* 004F28 01DB0C28 05000324 */  addiu       $3, $0, 0x5
/* 004F2C 01DB0C2C 1C004314 */  bne         $2, $3, .L01DB0CA0_2B64A0
/* 004F30 01DB0C30 00000000 */   nop
.L01DB0C34_2B6434:
/* 004F34 01DB0C34 5C988283 */  lb          $2, -0x67A4($28)
/* 004F38 01DB0C38 04004014 */  bnez        $2, .L01DB0C4C_2B644C
/* 004F3C 01DB0C3C 00000000 */   nop
/* 004F40 01DB0C40 589880AF */  sw          $0, -0x67A8($28)
/* 004F44 01DB0C44 01000224 */  addiu       $2, $0, 0x1
/* 004F48 01DB0C48 5C9882A3 */  sb          $2, -0x67A4($28)
.L01DB0C4C_2B644C:
/* 004F4C 01DB0C4C 5898828F */  lw          $2, -0x67A8($28)
/* 004F50 01DB0C50 10004128 */  slti        $1, $2, 0x10
/* 004F54 01DB0C54 06002010 */  beqz        $1, .L01DB0C70_2B6470
/* 004F58 01DB0C58 00000000 */   nop
/* 004F5C 01DB0C5C 01000224 */  addiu       $2, $0, 0x1
/* 004F60 01DB0C60 E101013C */  lui         $1, %hi(Mes1 + 0x16C8)
/* 004F64 01DB0C64 B8E422AC */  sw          $2, %lo(Mes1 + 0x16C8)($1)
/* 004F68 01DB0C68 03000010 */  b           .L01DB0C78_2B6478
/* 004F6C 01DB0C6C 00000000 */   nop
.L01DB0C70_2B6470:
/* 004F70 01DB0C70 E101013C */  lui         $1, %hi(Mes1 + 0x16C8)
/* 004F74 01DB0C74 B8E420AC */  sw          $0, %lo(Mes1 + 0x16C8)($1)
.L01DB0C78_2B6478:
/* 004F78 01DB0C78 5898828F */  lw          $2, -0x67A8($28)
/* 004F7C 01DB0C7C 01004224 */  addiu       $2, $2, 0x1
/* 004F80 01DB0C80 589882AF */  sw          $2, -0x67A8($28)
/* 004F84 01DB0C84 5898828F */  lw          $2, -0x67A8($28)
/* 004F88 01DB0C88 20004128 */  slti        $1, $2, 0x20
/* 004F8C 01DB0C8C 06002014 */  bnez        $1, .L01DB0CA8_2B64A8
/* 004F90 01DB0C90 00000000 */   nop
/* 004F94 01DB0C94 589880AF */  sw          $0, -0x67A8($28)
/* 004F98 01DB0C98 03000010 */  b           .L01DB0CA8_2B64A8
/* 004F9C 01DB0C9C 00000000 */   nop
.L01DB0CA0_2B64A0:
/* 004FA0 01DB0CA0 E101013C */  lui         $1, %hi(Mes1 + 0x16C8)
/* 004FA4 01DB0CA4 B8E420AC */  sw          $0, %lo(Mes1 + 0x16C8)($1)
.L01DB0CA8_2B64A8:
/* 004FA8 01DB0CA8 DE01013C */  lui         $1, %hi(CScript__2 + 0x508)
/* 004FAC 01DB0CAC 0820228C */  lw          $2, %lo(CScript__2 + 0x508)($1)
/* 004FB0 01DB0CB0 E101013C */  lui         $1, %hi(Mes1 + 0x16B8)
/* 004FB4 01DB0CB4 A8E422AC */  sw          $2, %lo(Mes1 + 0x16B8)($1)
/* 004FB8 01DB0CB8 DE01013C */  lui         $1, %hi(CScript__2 + 0x4F4)
/* 004FBC 01DB0CBC F41F238C */  lw          $3, %lo(CScript__2 + 0x4F4)($1)
/* 004FC0 01DB0CC0 E101013C */  lui         $1, %hi(Mes1)
/* 004FC4 01DB0CC4 F0CD23AC */  sw          $3, %lo(Mes1)($1)
/* 004FC8 01DB0CC8 DE01013C */  lui         $1, %hi(CScript__2 + 0x4F8)
/* 004FCC 01DB0CCC F81F248C */  lw          $4, %lo(CScript__2 + 0x4F8)($1)
/* 004FD0 01DB0CD0 E101013C */  lui         $1, %hi(Mes1 + 0x4)
/* 004FD4 01DB0CD4 F4CD24AC */  sw          $4, %lo(Mes1 + 0x4)($1)
/* 004FD8 01DB0CD8 DE01013C */  lui         $1, %hi(CScript__2 + 0x500)
/* 004FDC 01DB0CDC 0020258C */  lw          $5, %lo(CScript__2 + 0x500)($1)
/* 004FE0 01DB0CE0 0900A014 */  bnez        $5, .L01DB0D08_2B6508
/* 004FE4 01DB0CE4 00000000 */   nop
/* 004FE8 01DB0CE8 E101013C */  lui         $1, %hi(Mes1 + 0x70)
/* 004FEC 01DB0CEC 60CE20AC */  sw          $0, %lo(Mes1 + 0x70)($1)
/* 004FF0 01DB0CF0 E101013C */  lui         $1, %hi(Mes1 + 0x3C)
/* 004FF4 01DB0CF4 2CCE23AC */  sw          $3, %lo(Mes1 + 0x3C)($1)
/* 004FF8 01DB0CF8 E101013C */  lui         $1, %hi(Mes1 + 0x40)
/* 004FFC 01DB0CFC 30CE24AC */  sw          $4, %lo(Mes1 + 0x40)($1)
/* 005000 01DB0D00 0E000010 */  b           .L01DB0D3C_2B653C
/* 005004 01DB0D04 00000000 */   nop
.L01DB0D08_2B6508:
/* 005008 01DB0D08 40000224 */  addiu       $2, $0, 0x40
/* 00500C 01DB0D0C E101013C */  lui         $1, %hi(Mes1 + 0x70)
/* 005010 01DB0D10 60CE22AC */  sw          $2, %lo(Mes1 + 0x70)($1)
/* 005014 01DB0D14 E101013C */  lui         $1, %hi(Mes1 + 0x5C)
/* 005018 01DB0D18 4CCE25AC */  sw          $5, %lo(Mes1 + 0x5C)($1)
/* 00501C 01DB0D1C DE01013C */  lui         $1, %hi(CScript__2 + 0x504)
/* 005020 01DB0D20 0420228C */  lw          $2, %lo(CScript__2 + 0x504)($1)
/* 005024 01DB0D24 E101013C */  lui         $1, %hi(Mes1 + 0x60)
/* 005028 01DB0D28 50CE22AC */  sw          $2, %lo(Mes1 + 0x60)($1)
/* 00502C 01DB0D2C E101013C */  lui         $1, %hi(Mes1 + 0x3C)
/* 005030 01DB0D30 2CCE23AC */  sw          $3, %lo(Mes1 + 0x3C)($1)
/* 005034 01DB0D34 E101013C */  lui         $1, %hi(Mes1 + 0x40)
/* 005038 01DB0D38 30CE24AC */  sw          $4, %lo(Mes1 + 0x40)($1)
.L01DB0D3C_2B653C:
/* 00503C 01DB0D3C E101013C */  lui         $1, %hi(Mes1 + 0x4C)
/* 005040 01DB0D40 3CCE228C */  lw          $2, %lo(Mes1 + 0x4C)($1)
/* 005044 01DB0D44 43180200 */  sra         $3, $2, 1
/* 005048 01DB0D48 E101013C */  lui         $1, %hi(Mes1 + 0x44)
/* 00504C 01DB0D4C 34CE228C */  lw          $2, %lo(Mes1 + 0x44)($1)
/* 005050 01DB0D50 21204300 */  addu        $4, $2, $3
/* 005054 01DB0D54 E101013C */  lui         $1, %hi(Mes1 + 0x5C)
/* 005058 01DB0D58 4CCE228C */  lw          $2, %lo(Mes1 + 0x5C)($1)
/* 00505C 01DB0D5C 23108200 */  subu        $2, $4, $2
/* 005060 01DB0D60 83180200 */  sra         $3, $2, 2
/* 005064 01DB0D64 23108300 */  subu        $2, $4, $3
/* 005068 01DB0D68 E101013C */  lui         $1, %hi(Mes1 + 0x64)
/* 00506C 01DB0D6C 54CE22AC */  sw          $2, %lo(Mes1 + 0x64)($1)
/* 005070 01DB0D70 1B00A010 */  beqz        $5, .L01DB0DE0_2B65E0
/* 005074 01DB0D74 00000000 */   nop
/* 005078 01DB0D78 0E006018 */  blez        $3, .L01DB0DB4_2B65B4
/* 00507C 01DB0D7C 00000000 */   nop
/* 005080 01DB0D80 03000224 */  addiu       $2, $0, 0x3
/* 005084 01DB0D84 1A006200 */  div         $0, $3, $2
/* 005088 01DB0D88 02004014 */  bnez        $2, .L01DB0D94_2B6594
/* 00508C 01DB0D8C 00000000 */   nop
/* 005090 01DB0D90 CD010000 */  break       0, 7
.L01DB0D94_2B6594:
/* 005094 01DB0D94 12180000 */  mflo        $3
/* 005098 01DB0D98 E101013C */  lui         $1, %hi(Mes1 + 0x70)
/* 00509C 01DB0D9C 60CE228C */  lw          $2, %lo(Mes1 + 0x70)($1)
/* 0050A0 01DB0DA0 21104300 */  addu        $2, $2, $3
/* 0050A4 01DB0DA4 E101013C */  lui         $1, %hi(Mes1 + 0x70)
/* 0050A8 01DB0DA8 60CE22AC */  sw          $2, %lo(Mes1 + 0x70)($1)
/* 0050AC 01DB0DAC 0C000010 */  b           .L01DB0DE0_2B65E0
/* 0050B0 01DB0DB0 00000000 */   nop
.L01DB0DB4_2B65B4:
/* 0050B4 01DB0DB4 03000224 */  addiu       $2, $0, 0x3
/* 0050B8 01DB0DB8 1A006200 */  div         $0, $3, $2
/* 0050BC 01DB0DBC 02004014 */  bnez        $2, .L01DB0DC8_2B65C8
/* 0050C0 01DB0DC0 00000000 */   nop
/* 0050C4 01DB0DC4 CD010000 */  break       0, 7
.L01DB0DC8_2B65C8:
/* 0050C8 01DB0DC8 12180000 */  mflo        $3
/* 0050CC 01DB0DCC E101013C */  lui         $1, %hi(Mes1 + 0x70)
/* 0050D0 01DB0DD0 60CE228C */  lw          $2, %lo(Mes1 + 0x70)($1)
/* 0050D4 01DB0DD4 23104300 */  subu        $2, $2, $3
/* 0050D8 01DB0DD8 E101013C */  lui         $1, %hi(Mes1 + 0x70)
/* 0050DC 01DB0DDC 60CE22AC */  sw          $2, %lo(Mes1 + 0x70)($1)
.L01DB0DE0_2B65E0:
/* 0050E0 01DB0DE0 E101013C */  lui         $1, %hi(Mes1 + 0x40)
/* 0050E4 01DB0DE4 30CE238C */  lw          $3, %lo(Mes1 + 0x40)($1)
/* 0050E8 01DB0DE8 E101013C */  lui         $1, %hi(Mes1 + 0x60)
/* 0050EC 01DB0DEC 50CE228C */  lw          $2, %lo(Mes1 + 0x60)($1)
/* 0050F0 01DB0DF0 2A084300 */  slt         $1, $2, $3
/* 0050F4 01DB0DF4 08002010 */  beqz        $1, .L01DB0E18_2B6618
/* 0050F8 01DB0DF8 00000000 */   nop
/* 0050FC 01DB0DFC E101013C */  lui         $1, %hi(Mes1 + 0x48)
/* 005100 01DB0E00 38CE228C */  lw          $2, %lo(Mes1 + 0x48)($1)
/* 005104 01DB0E04 14004224 */  addiu       $2, $2, 0x14
/* 005108 01DB0E08 E101013C */  lui         $1, %hi(Mes1 + 0x68)
/* 00510C 01DB0E0C 58CE22AC */  sw          $2, %lo(Mes1 + 0x68)($1)
/* 005110 01DB0E10 09000010 */  b           .L01DB0E38_2B6638
/* 005114 01DB0E14 00000000 */   nop
.L01DB0E18_2B6618:
/* 005118 01DB0E18 E101013C */  lui         $1, %hi(Mes1 + 0x48)
/* 00511C 01DB0E1C 38CE238C */  lw          $3, %lo(Mes1 + 0x48)($1)
/* 005120 01DB0E20 E101013C */  lui         $1, %hi(Mes1 + 0x50)
/* 005124 01DB0E24 40CE228C */  lw          $2, %lo(Mes1 + 0x50)($1)
/* 005128 01DB0E28 21106200 */  addu        $2, $3, $2
/* 00512C 01DB0E2C ECFF4224 */  addiu       $2, $2, -0x14
/* 005130 01DB0E30 E101013C */  lui         $1, %hi(Mes1 + 0x68)
/* 005134 01DB0E34 58CE22AC */  sw          $2, %lo(Mes1 + 0x68)($1)
.L01DB0E38_2B6638:
/* 005138 01DB0E38 808080C7 */  lwc1        $f0, -0x7F80($28)
/* 00513C 01DB0E3C E101013C */  lui         $1, %hi(Mes1 + 0x8C)
/* 005140 01DB0E40 7CCE20E4 */  swc1        $f0, %lo(Mes1 + 0x8C)($1)
/* 005144 01DB0E44 C886828F */  lw          $2, -0x7938($28)
/* 005148 01DB0E48 08004010 */  beqz        $2, .L01DB0E6C_2B666C
/* 00514C 01DB0E4C 00000000 */   nop
/* 005150 01DB0E50 E101023C */  lui         $2, %hi(Mes1)
/* 005154 01DB0E54 F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 005158 01DB0E58 DE01013C */  lui         $1, %hi(CScript__2 + 0x4EC)
/* 00515C 01DB0E5C EC1F258C */  lw          $5, %lo(CScript__2 + 0x4EC)($1)
/* 005160 01DB0E60 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 005164 01DB0E64 00000000 */   nop
/* 005168 01DB0E68 C88682AF */  sw          $2, -0x7938($28)
.L01DB0E6C_2B666C:
/* 00516C 01DB0E6C E101023C */  lui         $2, %hi(Mes1)
/* 005170 01DB0E70 F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 005174 01DB0E74 6437050C */  jal         Step__6ClsMesFv
/* 005178 01DB0E78 00000000 */   nop
/* 00517C 01DB0E7C E101023C */  lui         $2, %hi(Mes1)
/* 005180 01DB0E80 F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 005184 01DB0E84 9835050C */  jal         AbsFukidashiIn__6ClsMesFv
/* 005188 01DB0E88 00000000 */   nop
/* 00518C 01DB0E8C E101023C */  lui         $2, %hi(Mes1)
/* 005190 01DB0E90 F0CD4424 */  addiu       $4, $2, %lo(Mes1)
/* 005194 01DB0E94 C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 005198 01DB0E98 00000000 */   nop
.L01DB0E9C_2B669C:
/* 00519C 01DB0E9C 0000BF7B */  lq          $31, 0x0($29)
/* 0051A0 01DB0EA0 1000BD27 */  addiu       $29, $29, 0x10
/* 0051A4 01DB0EA4 0800E003 */  jr          $31
/* 0051A8 01DB0EA8 00000000 */   nop
/* 0051AC 01DB0EAC 00000000 */  nop
