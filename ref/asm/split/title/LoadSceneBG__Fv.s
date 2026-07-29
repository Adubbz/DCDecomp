.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadSceneBG__Fv
/* 003AE0 01DAF7E0 00FCBD27 */  addiu       $29, $29, -0x400
/* 003AE4 01DAF7E4 0000BF7F */  sq          $31, 0x0($29)
/* 003AE8 01DAF7E8 DD01033C */  lui         $3, %hi(LIT_636__3)
/* 003AEC 01DAF7EC 20586624 */  addiu       $6, $3, %lo(LIT_636__3)
/* 003AF0 01DAF7F0 1000A527 */  addiu       $5, $29, 0x10
/* 003AF4 01DAF7F4 3F000424 */  addiu       $4, $0, 0x3F
.L01DAF7F8_2B4FF8:
/* 003AF8 01DAF7F8 0000C378 */  lq          $3, 0x0($6)
/* 003AFC 01DAF7FC 1000C624 */  addiu       $6, $6, 0x10
/* 003B00 01DAF800 FFFF8424 */  addiu       $4, $4, -0x1
/* 003B04 01DAF804 0000A37C */  sq          $3, 0x0($5)
/* 003B08 01DAF808 1000A524 */  addiu       $5, $5, 0x10
/* 003B0C 01DAF80C FAFF801C */  bgtz        $4, .L01DAF7F8_2B4FF8
/* 003B10 01DAF810 00000000 */   nop
/* 003B14 01DAF814 1498838F */  lw          $3, -0x67EC($28)
/* 003B18 01DAF818 C0180300 */  sll         $3, $3, 3
/* 003B1C 01DAF81C 21187D00 */  addu        $3, $3, $29
/* 003B20 01DAF820 1000648C */  lw          $4, 0x10($3)
/* 003B24 01DAF824 DE01033C */  lui         $3, %hi(LIT_635__4)
/* 003B28 01DAF828 38D76324 */  addiu       $3, $3, %lo(LIT_635__4)
/* 003B2C 01DAF82C 4A008310 */  beq         $4, $3, .L01DAF958_2B5158
/* 003B30 01DAF830 00000000 */   nop
/* 003B34 01DAF834 1898848F */  lw          $4, -0x67E8($28)
/* 003B38 01DAF838 02000324 */  addiu       $3, $0, 0x2
/* 003B3C 01DAF83C 46008310 */  beq         $4, $3, .L01DAF958_2B5158
/* 003B40 01DAF840 00000000 */   nop
/* 003B44 01DAF844 01000324 */  addiu       $3, $0, 0x1
/* 003B48 01DAF848 1F008310 */  beq         $4, $3, .L01DAF8C8_2B50C8
/* 003B4C 01DAF84C 00000000 */   nop
/* 003B50 01DAF850 03008010 */  beqz        $4, .L01DAF860_2B5060
/* 003B54 01DAF854 00000000 */   nop
/* 003B58 01DAF858 3F000010 */  b           .L01DAF958_2B5158
/* 003B5C 01DAF85C 00000000 */   nop
.L01DAF860_2B5060:
/* 003B60 01DAF860 8CFB040C */  jal         ReadBGSync__Fv
/* 003B64 01DAF864 00000000 */   nop
/* 003B68 01DAF868 FDFF4014 */  bnez        $2, .L01DAF860_2B5060
/* 003B6C 01DAF86C 00000000 */   nop
/* 003B70 01DAF870 1498838F */  lw          $3, -0x67EC($28)
/* 003B74 01DAF874 05000224 */  addiu       $2, $0, 0x5
/* 003B78 01DAF878 1A006200 */  div         $0, $3, $2
/* 003B7C 01DAF87C 00000000 */  nop
/* 003B80 01DAF880 00000000 */  nop
/* 003B84 01DAF884 10100000 */  mfhi        $2
/* 003B88 01DAF888 03004014 */  bnez        $2, .L01DAF898_2B5098
/* 003B8C 01DAF88C 00000000 */   nop
/* 003B90 01DAF890 30FB040C */  jal         StartReadBG__Fv
/* 003B94 01DAF894 00000000 */   nop
.L01DAF898_2B5098:
/* 003B98 01DAF898 1498828F */  lw          $2, -0x67EC($28)
/* 003B9C 01DAF89C C0100200 */  sll         $2, $2, 3
/* 003BA0 01DAF8A0 21105D00 */  addu        $2, $2, $29
/* 003BA4 01DAF8A4 F497858F */  lw          $5, -0x680C($28)
/* 003BA8 01DAF8A8 1000448C */  lw          $4, 0x10($2)
/* 003BAC 01DAF8AC 28360070 */  paddub      $6, $0, $0
/* 003BB0 01DAF8B0 ACFA040C */  jal         LoadFileBG__FPcP1Pi
/* 003BB4 01DAF8B4 00000000 */   nop
/* 003BB8 01DAF8B8 01000324 */  addiu       $3, $0, 0x1
/* 003BBC 01DAF8BC 189883AF */  sw          $3, -0x67E8($28)
/* 003BC0 01DAF8C0 25000010 */  b           .L01DAF958_2B5158
/* 003BC4 01DAF8C4 00000000 */   nop
.L01DAF8C8_2B50C8:
/* 003BC8 01DAF8C8 8CFB040C */  jal         ReadBGSync__Fv
/* 003BCC 01DAF8CC 00000000 */   nop
/* 003BD0 01DAF8D0 21004014 */  bnez        $2, .L01DAF958_2B5158
/* 003BD4 01DAF8D4 00000000 */   nop
/* 003BD8 01DAF8D8 1098848F */  lw          $4, -0x67F0($28)
/* 003BDC 01DAF8DC 00190400 */  sll         $3, $4, 4
/* 003BE0 01DAF8E0 DF01023C */  lui         $2, %hi(PassDataBuffer)
/* 003BE4 01DAF8E4 80FE4224 */  addiu       $2, $2, %lo(PassDataBuffer)
/* 003BE8 01DAF8E8 21384300 */  addu        $7, $2, $3
/* 003BEC 01DAF8EC 0800E0AC */  sw          $0, 0x8($7)
/* 003BF0 01DAF8F0 B0110224 */  addiu       $2, $0, 0x11B0
/* 003BF4 01DAF8F4 18188200 */  mult        $3, $4, $2
/* 003BF8 01DAF8F8 E101023C */  lui         $2, %hi(Cam__2)
/* 003BFC 01DAF8FC D0984224 */  addiu       $2, $2, %lo(Cam__2)
/* 003C00 01DAF900 21204300 */  addu        $4, $2, $3
/* 003C04 01DAF904 F497858F */  lw          $5, -0x680C($28)
/* 003C08 01DAF908 1498828F */  lw          $2, -0x67EC($28)
/* 003C0C 01DAF90C C0100200 */  sll         $2, $2, 3
/* 003C10 01DAF910 21105D00 */  addu        $2, $2, $29
/* 003C14 01DAF914 1400468C */  lw          $6, 0x14($2)
/* 003C18 01DAF918 28460070 */  paddub      $8, $0, $0
/* 003C1C 01DAF91C FCE5040C */  jal         LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
/* 003C20 01DAF920 00000000 */   nop
/* 003C24 01DAF924 1498838F */  lw          $3, -0x67EC($28)
/* 003C28 01DAF928 01006324 */  addiu       $3, $3, 0x1
/* 003C2C 01DAF92C 149883AF */  sw          $3, -0x67EC($28)
/* 003C30 01DAF930 1098838F */  lw          $3, -0x67F0($28)
/* 003C34 01DAF934 01006324 */  addiu       $3, $3, 0x1
/* 003C38 01DAF938 109883AF */  sw          $3, -0x67F0($28)
/* 003C3C 01DAF93C 1098838F */  lw          $3, -0x67F0($28)
/* 003C40 01DAF940 03006128 */  slti        $1, $3, 0x3
/* 003C44 01DAF944 02002014 */  bnez        $1, .L01DAF950_2B5150
/* 003C48 01DAF948 00000000 */   nop
/* 003C4C 01DAF94C 109880AF */  sw          $0, -0x67F0($28)
.L01DAF950_2B5150:
/* 003C50 01DAF950 02000324 */  addiu       $3, $0, 0x2
/* 003C54 01DAF954 189883AF */  sw          $3, -0x67E8($28)
.L01DAF958_2B5158:
/* 003C58 01DAF958 0000BF7B */  lq          $31, 0x0($29)
/* 003C5C 01DAF95C 0004BD27 */  addiu       $29, $29, 0x400
/* 003C60 01DAF960 0800E003 */  jr          $31
/* 003C64 01DAF964 00000000 */   nop
/* 003C68 01DAF968 00000000 */  nop
/* 003C6C 01DAF96C 00000000 */  nop
