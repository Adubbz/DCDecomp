.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel NornRequest__11CEditGroundFPA64_P9CMapParts
/* 0A6AC0 001A69C0 60FBBD27 */  addiu       $29, $29, -0x4A0
/* 0A6AC4 001A69C4 2000BF7F */  sq          $31, 0x20($29)
/* 0A6AC8 001A69C8 1000B17F */  sq          $17, 0x10($29)
/* 0A6ACC 001A69CC 0000B07F */  sq          $16, 0x0($29)
/* 0A6AD0 001A69D0 288E8070 */  paddub      $17, $4, $0
/* 0A6AD4 001A69D4 2886A070 */  paddub      $16, $5, $0
/* 0A6AD8 001A69D8 08000524 */  addiu       $5, $0, 0x8
/* 0A6ADC 001A69DC 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6AE0 001A69E0 21088100 */  addu        $1, $4, $1
/* 0A6AE4 001A69E4 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6AE8 001A69E8 000065AC */  sw          $5, 0x0($3)
/* 0A6AEC 001A69EC 0400838C */  lw          $3, 0x4($4)
/* 0A6AF0 001A69F0 DE006010 */  beqz        $3, .L001A6D6C
/* 0A6AF4 001A69F4 00000000 */   nop
/* 0A6AF8 001A69F8 0000048E */  lw          $4, 0x0($16)
/* 0A6AFC 001A69FC 0A008010 */  beqz        $4, .L001A6A28
/* 0A6B00 001A6A00 00000000 */   nop
/* 0A6B04 001A6A04 2C6A060C */  jal         GetRotY__9CMapPartsFv
/* 0A6B08 001A6A08 00000000 */   nop
/* 0A6B0C 001A6A0C 01000424 */  addiu       $4, $0, 0x1
/* 0A6B10 001A6A10 05004414 */  bne         $2, $4, .L001A6A28
/* 0A6B14 001A6A14 00000000 */   nop
/* 0A6B18 001A6A18 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6B1C 001A6A1C 21082102 */  addu        $1, $17, $1
/* 0A6B20 001A6A20 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6B24 001A6A24 040064AC */  sw          $4, 0x4($3)
.L001A6A28:
/* 0A6B28 001A6A28 0001038E */  lw          $3, 0x100($16)
/* 0A6B2C 001A6A2C 15006010 */  beqz        $3, .L001A6A84
/* 0A6B30 001A6A30 00000000 */   nop
/* 0A6B34 001A6A34 0A000224 */  addiu       $2, $0, 0xA
/* 0A6B38 001A6A38 8004A2AF */  sw          $2, 0x480($29)
/* 0A6B3C 001A6A3C 8404A0AF */  sw          $0, 0x484($29)
/* 0A6B40 001A6A40 04000224 */  addiu       $2, $0, 0x4
/* 0A6B44 001A6A44 8804A2AF */  sw          $2, 0x488($29)
/* 0A6B48 001A6A48 05000224 */  addiu       $2, $0, 0x5
/* 0A6B4C 001A6A4C 8C04A2AF */  sw          $2, 0x48C($29)
/* 0A6B50 001A6A50 28262072 */  paddub      $4, $17, $0
/* 0A6B54 001A6A54 01000524 */  addiu       $5, $0, 0x1
/* 0A6B58 001A6A58 28360070 */  paddub      $6, $0, $0
/* 0A6B5C 001A6A5C 8004A727 */  addiu       $7, $29, 0x480
/* 0A6B60 001A6A60 7898060C */  jal         CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* 0A6B64 001A6A64 00000000 */   nop
/* 0A6B68 001A6A68 06004010 */  beqz        $2, .L001A6A84
/* 0A6B6C 001A6A6C 00000000 */   nop
/* 0A6B70 001A6A70 01000424 */  addiu       $4, $0, 0x1
/* 0A6B74 001A6A74 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6B78 001A6A78 21082102 */  addu        $1, $17, $1
/* 0A6B7C 001A6A7C 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6B80 001A6A80 080064AC */  sw          $4, 0x8($3)
.L001A6A84:
/* 0A6B84 001A6A84 0002038E */  lw          $3, 0x200($16)
/* 0A6B88 001A6A88 15006010 */  beqz        $3, .L001A6AE0
/* 0A6B8C 001A6A8C 00000000 */   nop
/* 0A6B90 001A6A90 02000524 */  addiu       $5, $0, 0x2
/* 0A6B94 001A6A94 9004A5AF */  sw          $5, 0x490($29)
/* 0A6B98 001A6A98 08000224 */  addiu       $2, $0, 0x8
/* 0A6B9C 001A6A9C 9404A2AF */  sw          $2, 0x494($29)
/* 0A6BA0 001A6AA0 09000224 */  addiu       $2, $0, 0x9
/* 0A6BA4 001A6AA4 9804A2AF */  sw          $2, 0x498($29)
/* 0A6BA8 001A6AA8 04000224 */  addiu       $2, $0, 0x4
/* 0A6BAC 001A6AAC 9C04A2AF */  sw          $2, 0x49C($29)
/* 0A6BB0 001A6AB0 28262072 */  paddub      $4, $17, $0
/* 0A6BB4 001A6AB4 28360070 */  paddub      $6, $0, $0
/* 0A6BB8 001A6AB8 9004A727 */  addiu       $7, $29, 0x490
/* 0A6BBC 001A6ABC 7898060C */  jal         CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* 0A6BC0 001A6AC0 00000000 */   nop
/* 0A6BC4 001A6AC4 06004014 */  bnez        $2, .L001A6AE0
/* 0A6BC8 001A6AC8 00000000 */   nop
/* 0A6BCC 001A6ACC 01000424 */  addiu       $4, $0, 0x1
/* 0A6BD0 001A6AD0 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6BD4 001A6AD4 21082102 */  addu        $1, $17, $1
/* 0A6BD8 001A6AD8 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6BDC 001A6ADC 0C0064AC */  sw          $4, 0xC($3)
.L001A6AE0:
/* 0A6BE0 001A6AE0 0003038E */  lw          $3, 0x300($16)
/* 0A6BE4 001A6AE4 18006010 */  beqz        $3, .L001A6B48
/* 0A6BE8 001A6AE8 00000000 */   nop
/* 0A6BEC 001A6AEC 3C00A0AF */  sw          $0, 0x3C($29)
/* 0A6BF0 001A6AF0 3800A0AF */  sw          $0, 0x38($29)
/* 0A6BF4 001A6AF4 3400A0AF */  sw          $0, 0x34($29)
/* 0A6BF8 001A6AF8 3000A0AF */  sw          $0, 0x30($29)
/* 0A6BFC 001A6AFC 28262072 */  paddub      $4, $17, $0
/* 0A6C00 001A6B00 3000A527 */  addiu       $5, $29, 0x30
/* 0A6C04 001A6B04 000C068E */  lw          $6, 0xC00($16)
/* 0A6C08 001A6B08 02000724 */  addiu       $7, $0, 0x2
/* 0A6C0C 001A6B0C B098060C */  jal         GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* 0A6C10 001A6B10 00000000 */   nop
/* 0A6C14 001A6B14 28262072 */  paddub      $4, $17, $0
/* 0A6C18 001A6B18 03000524 */  addiu       $5, $0, 0x3
/* 0A6C1C 001A6B1C 28360070 */  paddub      $6, $0, $0
/* 0A6C20 001A6B20 3000A727 */  addiu       $7, $29, 0x30
/* 0A6C24 001A6B24 7898060C */  jal         CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* 0A6C28 001A6B28 00000000 */   nop
/* 0A6C2C 001A6B2C 06004010 */  beqz        $2, .L001A6B48
/* 0A6C30 001A6B30 00000000 */   nop
/* 0A6C34 001A6B34 01000424 */  addiu       $4, $0, 0x1
/* 0A6C38 001A6B38 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6C3C 001A6B3C 21082102 */  addu        $1, $17, $1
/* 0A6C40 001A6B40 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6C44 001A6B44 100064AC */  sw          $4, 0x10($3)
.L001A6B48:
/* 0A6C48 001A6B48 0004038E */  lw          $3, 0x400($16)
/* 0A6C4C 001A6B4C 18006010 */  beqz        $3, .L001A6BB0
/* 0A6C50 001A6B50 00000000 */   nop
/* 0A6C54 001A6B54 4C00A0AF */  sw          $0, 0x4C($29)
/* 0A6C58 001A6B58 4800A0AF */  sw          $0, 0x48($29)
/* 0A6C5C 001A6B5C 4400A0AF */  sw          $0, 0x44($29)
/* 0A6C60 001A6B60 4000A0AF */  sw          $0, 0x40($29)
/* 0A6C64 001A6B64 28262072 */  paddub      $4, $17, $0
/* 0A6C68 001A6B68 4000A527 */  addiu       $5, $29, 0x40
/* 0A6C6C 001A6B6C 0006068E */  lw          $6, 0x600($16)
/* 0A6C70 001A6B70 04000724 */  addiu       $7, $0, 0x4
/* 0A6C74 001A6B74 B098060C */  jal         GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* 0A6C78 001A6B78 00000000 */   nop
/* 0A6C7C 001A6B7C 28262072 */  paddub      $4, $17, $0
/* 0A6C80 001A6B80 04000524 */  addiu       $5, $0, 0x4
/* 0A6C84 001A6B84 28360070 */  paddub      $6, $0, $0
/* 0A6C88 001A6B88 4000A727 */  addiu       $7, $29, 0x40
/* 0A6C8C 001A6B8C 7898060C */  jal         CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* 0A6C90 001A6B90 00000000 */   nop
/* 0A6C94 001A6B94 06004010 */  beqz        $2, .L001A6BB0
/* 0A6C98 001A6B98 00000000 */   nop
/* 0A6C9C 001A6B9C 01000424 */  addiu       $4, $0, 0x1
/* 0A6CA0 001A6BA0 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6CA4 001A6BA4 21082102 */  addu        $1, $17, $1
/* 0A6CA8 001A6BA8 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6CAC 001A6BAC 140064AC */  sw          $4, 0x14($3)
.L001A6BB0:
/* 0A6CB0 001A6BB0 0005038E */  lw          $3, 0x500($16)
/* 0A6CB4 001A6BB4 20006010 */  beqz        $3, .L001A6C38
/* 0A6CB8 001A6BB8 00000000 */   nop
/* 0A6CBC 001A6BBC 5C00A0AF */  sw          $0, 0x5C($29)
/* 0A6CC0 001A6BC0 5800A0AF */  sw          $0, 0x58($29)
/* 0A6CC4 001A6BC4 5400A0AF */  sw          $0, 0x54($29)
/* 0A6CC8 001A6BC8 5000A0AF */  sw          $0, 0x50($29)
/* 0A6CCC 001A6BCC 28262072 */  paddub      $4, $17, $0
/* 0A6CD0 001A6BD0 5000A527 */  addiu       $5, $29, 0x50
/* 0A6CD4 001A6BD4 0008068E */  lw          $6, 0x800($16)
/* 0A6CD8 001A6BD8 02000724 */  addiu       $7, $0, 0x2
/* 0A6CDC 001A6BDC 04000824 */  addiu       $8, $0, 0x4
/* 0A6CE0 001A6BE0 D499060C */  jal         GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* 0A6CE4 001A6BE4 00000000 */   nop
/* 0A6CE8 001A6BE8 28262072 */  paddub      $4, $17, $0
/* 0A6CEC 001A6BEC 05000524 */  addiu       $5, $0, 0x5
/* 0A6CF0 001A6BF0 28360070 */  paddub      $6, $0, $0
/* 0A6CF4 001A6BF4 5000A727 */  addiu       $7, $29, 0x50
/* 0A6CF8 001A6BF8 7898060C */  jal         CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* 0A6CFC 001A6BFC 00000000 */   nop
/* 0A6D00 001A6C00 0D004010 */  beqz        $2, .L001A6C38
/* 0A6D04 001A6C04 00000000 */   nop
/* 0A6D08 001A6C08 1C8D848F */  lw          $4, -0x72E4($28)
/* 0A6D0C 001A6C0C 282E0070 */  paddub      $5, $0, $0
/* 0A6D10 001A6C10 C860050C */  jal         GetGameIntFlag__9CSaveDataFi
/* 0A6D14 001A6C14 00000000 */   nop
/* 0A6D18 001A6C18 64004328 */  slti        $3, $2, 0x64
/* 0A6D1C 001A6C1C 06006014 */  bnez        $3, .L001A6C38
/* 0A6D20 001A6C20 00000000 */   nop
/* 0A6D24 001A6C24 01000424 */  addiu       $4, $0, 0x1
/* 0A6D28 001A6C28 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6D2C 001A6C2C 21082102 */  addu        $1, $17, $1
/* 0A6D30 001A6C30 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6D34 001A6C34 180064AC */  sw          $4, 0x18($3)
.L001A6C38:
/* 0A6D38 001A6C38 0006038E */  lw          $3, 0x600($16)
/* 0A6D3C 001A6C3C 18006010 */  beqz        $3, .L001A6CA0
/* 0A6D40 001A6C40 00000000 */   nop
/* 0A6D44 001A6C44 6C00A0AF */  sw          $0, 0x6C($29)
/* 0A6D48 001A6C48 6800A0AF */  sw          $0, 0x68($29)
/* 0A6D4C 001A6C4C 6400A0AF */  sw          $0, 0x64($29)
/* 0A6D50 001A6C50 6000A0AF */  sw          $0, 0x60($29)
/* 0A6D54 001A6C54 28262072 */  paddub      $4, $17, $0
/* 0A6D58 001A6C58 6000A527 */  addiu       $5, $29, 0x60
/* 0A6D5C 001A6C5C 0001068E */  lw          $6, 0x100($16)
/* 0A6D60 001A6C60 04000724 */  addiu       $7, $0, 0x4
/* 0A6D64 001A6C64 B098060C */  jal         GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* 0A6D68 001A6C68 00000000 */   nop
/* 0A6D6C 001A6C6C 28262072 */  paddub      $4, $17, $0
/* 0A6D70 001A6C70 06000524 */  addiu       $5, $0, 0x6
/* 0A6D74 001A6C74 28360070 */  paddub      $6, $0, $0
/* 0A6D78 001A6C78 6000A727 */  addiu       $7, $29, 0x60
/* 0A6D7C 001A6C7C 7898060C */  jal         CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* 0A6D80 001A6C80 00000000 */   nop
/* 0A6D84 001A6C84 06004014 */  bnez        $2, .L001A6CA0
/* 0A6D88 001A6C88 00000000 */   nop
/* 0A6D8C 001A6C8C 01000424 */  addiu       $4, $0, 0x1
/* 0A6D90 001A6C90 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6D94 001A6C94 21082102 */  addu        $1, $17, $1
/* 0A6D98 001A6C98 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6D9C 001A6C9C 1C0064AC */  sw          $4, 0x1C($3)
.L001A6CA0:
/* 0A6DA0 001A6CA0 0007038E */  lw          $3, 0x700($16)
/* 0A6DA4 001A6CA4 31006010 */  beqz        $3, .L001A6D6C
/* 0A6DA8 001A6CA8 00000000 */   nop
/* 0A6DAC 001A6CAC 7C04A0AF */  sw          $0, 0x47C($29)
/* 0A6DB0 001A6CB0 7804A0AF */  sw          $0, 0x478($29)
/* 0A6DB4 001A6CB4 7404A0AF */  sw          $0, 0x474($29)
/* 0A6DB8 001A6CB8 7004A0AF */  sw          $0, 0x470($29)
/* 0A6DBC 001A6CBC 28262072 */  paddub      $4, $17, $0
/* 0A6DC0 001A6CC0 7004A527 */  addiu       $5, $29, 0x470
/* 0A6DC4 001A6CC4 0007068E */  lw          $6, 0x700($16)
/* 0A6DC8 001A6CC8 04000724 */  addiu       $7, $0, 0x4
/* 0A6DCC 001A6CCC B098060C */  jal         GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* 0A6DD0 001A6CD0 00000000 */   nop
/* 0A6DD4 001A6CD4 0400248E */  lw          $4, 0x4($17)
/* 0A6DD8 001A6CD8 7004A527 */  addiu       $5, $29, 0x470
/* 0A6DDC 001A6CDC 7000A627 */  addiu       $6, $29, 0x70
/* 0A6DE0 001A6CE0 00010724 */  addiu       $7, $0, 0x100
/* 0A6DE4 001A6CE4 D4BE050C */  jal         GetPartsRect__9CEditAreaFR8CRect_i_Pii
/* 0A6DE8 001A6CE8 00000000 */   nop
/* 0A6DEC 001A6CEC 282E0070 */  paddub      $5, $0, $0
/* 0A6DF0 001A6CF0 28360070 */  paddub      $6, $0, $0
/* 0A6DF4 001A6CF4 1A000010 */  b           .L001A6D60
/* 0A6DF8 001A6CF8 00000000 */   nop
.L001A6CFC:
/* 0A6DFC 001A6CFC 80180600 */  sll         $3, $6, 2
/* 0A6E00 001A6D00 21187D00 */  addu        $3, $3, $29
/* 0A6E04 001A6D04 7000648C */  lw          $4, 0x70($3)
/* 0A6E08 001A6D08 C0180400 */  sll         $3, $4, 3
/* 0A6E0C 001A6D0C 23206400 */  subu        $4, $3, $4
/* 0A6E10 001A6D10 80180400 */  sll         $3, $4, 2
/* 0A6E14 001A6D14 23186400 */  subu        $3, $3, $4
/* 0A6E18 001A6D18 40190300 */  sll         $3, $3, 5
/* 0A6E1C 001A6D1C 21187100 */  addu        $3, $3, $17
/* 0A6E20 001A6D20 2001638C */  lw          $3, 0x120($3)
/* 0A6E24 001A6D24 07006128 */  slti        $1, $3, 0x7
/* 0A6E28 001A6D28 02002010 */  beqz        $1, .L001A6D34
/* 0A6E2C 001A6D2C 00000000 */   nop
/* 0A6E30 001A6D30 0100A524 */  addiu       $5, $5, 0x1
.L001A6D34:
/* 0A6E34 001A6D34 0200A328 */  slti        $3, $5, 0x2
/* 0A6E38 001A6D38 08006014 */  bnez        $3, .L001A6D5C
/* 0A6E3C 001A6D3C 00000000 */   nop
/* 0A6E40 001A6D40 01000424 */  addiu       $4, $0, 0x1
/* 0A6E44 001A6D44 0100013C */  lui         $1, (0x15030 >> 16)
/* 0A6E48 001A6D48 21082102 */  addu        $1, $17, $1
/* 0A6E4C 001A6D4C 3050238C */  lw          $3, (0x15030 & 0xFFFF)($1)
/* 0A6E50 001A6D50 200064AC */  sw          $4, 0x20($3)
/* 0A6E54 001A6D54 05000010 */  b           .L001A6D6C
/* 0A6E58 001A6D58 00000000 */   nop
.L001A6D5C:
/* 0A6E5C 001A6D5C 0100C624 */  addiu       $6, $6, 0x1
.L001A6D60:
/* 0A6E60 001A6D60 2A18C200 */  slt         $3, $6, $2
/* 0A6E64 001A6D64 E5FF6014 */  bnez        $3, .L001A6CFC
/* 0A6E68 001A6D68 00000000 */   nop
.L001A6D6C:
/* 0A6E6C 001A6D6C 2000BF7B */  lq          $31, 0x20($29)
/* 0A6E70 001A6D70 1000B17B */  lq          $17, 0x10($29)
/* 0A6E74 001A6D74 0000B07B */  lq          $16, 0x0($29)
/* 0A6E78 001A6D78 A004BD27 */  addiu       $29, $29, 0x4A0
/* 0A6E7C 001A6D7C 0800E003 */  jr          $31
/* 0A6E80 001A6D80 00000000 */   nop
/* 0A6E84 001A6D84 00000000 */  nop
/* 0A6E88 001A6D88 00000000 */  nop
/* 0A6E8C 001A6D8C 00000000 */  nop
