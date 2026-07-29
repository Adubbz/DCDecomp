.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LoadSeInf__6CSoundFPcPUi
/* 044CC0 00144BC0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 044CC4 00144BC4 1000BF7F */  sq          $31, 0x10($29)
/* 044CC8 00144BC8 0000B07F */  sq          $16, 0x0($29)
/* 044CCC 00144BCC 2886C070 */  paddub      $16, $6, $0
/* 044CD0 00144BD0 2826A070 */  paddub      $4, $5, $0
/* 044CD4 00144BD4 282E0072 */  paddub      $5, $16, $0
/* 044CD8 00144BD8 2800A627 */  addiu       $6, $29, 0x28
/* 044CDC 00144BDC D8FC040C */  jal         LoadFile__FPcPvPi
/* 044CE0 00144BE0 00000000 */   nop
/* 044CE4 00144BE4 2800A28F */  lw          $2, 0x28($29)
/* 044CE8 00144BE8 21100202 */  addu        $2, $16, $2
/* 044CEC 00144BEC 000040A0 */  sb          $0, 0x0($2)
/* 044CF0 00144BF0 2000A427 */  addiu       $4, $29, 0x20
/* 044CF4 00144BF4 C08680C7 */  lwc1        $f0, -0x7940($28)
/* 044CF8 00144BF8 C4868387 */  lh          $3, -0x793C($28)
/* 044CFC 00144BFC C6868293 */  lbu         $2, -0x793A($28)
/* 044D00 00144C00 000080E4 */  swc1        $f0, 0x0($4)
/* 044D04 00144C04 040083A4 */  sh          $3, 0x4($4)
/* 044D08 00144C08 060082A0 */  sb          $2, 0x6($4)
/* 044D0C 00144C0C CF01013C */  lui         $1, %hi(se_inf_tbl + 0x2EE0)
/* 044D10 00144C10 30CE20AC */  sw          $0, %lo(se_inf_tbl + 0x2EE0)($1)
/* 044D14 00144C14 28260072 */  paddub      $4, $16, $0
/* 044D18 00144C18 2A00023C */  lui         $2, %hi(LIT_546)
/* 044D1C 00144C1C 88984524 */  addiu       $5, $2, %lo(LIT_546)
/* 044D20 00144C20 A21A040C */  jal         strtok
/* 044D24 00144C24 00000000 */   nop
/* 044D28 00144C28 28260070 */  paddub      $4, $0, $0
/* 044D2C 00144C2C 2000A527 */  addiu       $5, $29, 0x20
/* 044D30 00144C30 A21A040C */  jal         strtok
/* 044D34 00144C34 00000000 */   nop
/* 044D38 00144C38 3F000010 */  b           .L00144D38
/* 044D3C 00144C3C 00000000 */   nop
.L00144C40:
/* 044D40 00144C40 2C00A427 */  addiu       $4, $29, 0x2C
/* 044D44 00144C44 282E4070 */  paddub      $5, $2, $0
/* 044D48 00144C48 04000624 */  addiu       $6, $0, 0x4
/* 044D4C 00144C4C 5C16040C */  jal         strncpy
/* 044D50 00144C50 00000000 */   nop
/* 044D54 00144C54 2C00A427 */  addiu       $4, $29, 0x2C
/* 044D58 00144C58 8E00040C */  jal         atoi
/* 044D5C 00144C5C 00000000 */   nop
/* 044D60 00144C60 CF01013C */  lui         $1, %hi(se_inf_tbl + 0x2EE0)
/* 044D64 00144C64 30CE238C */  lw          $3, %lo(se_inf_tbl + 0x2EE0)($1)
/* 044D68 00144C68 80200300 */  sll         $4, $3, 2
/* 044D6C 00144C6C CF01033C */  lui         $3, %hi(se_inf_tbl)
/* 044D70 00144C70 509F6324 */  addiu       $3, $3, %lo(se_inf_tbl)
/* 044D74 00144C74 21186400 */  addu        $3, $3, $4
/* 044D78 00144C78 000062A0 */  sb          $2, 0x0($3)
/* 044D7C 00144C7C 28260070 */  paddub      $4, $0, $0
/* 044D80 00144C80 2000A527 */  addiu       $5, $29, 0x20
/* 044D84 00144C84 A21A040C */  jal         strtok
/* 044D88 00144C88 00000000 */   nop
/* 044D8C 00144C8C 2C00A427 */  addiu       $4, $29, 0x2C
/* 044D90 00144C90 282E4070 */  paddub      $5, $2, $0
/* 044D94 00144C94 04000624 */  addiu       $6, $0, 0x4
/* 044D98 00144C98 5C16040C */  jal         strncpy
/* 044D9C 00144C9C 00000000 */   nop
/* 044DA0 00144CA0 2C00A427 */  addiu       $4, $29, 0x2C
/* 044DA4 00144CA4 8E00040C */  jal         atoi
/* 044DA8 00144CA8 00000000 */   nop
/* 044DAC 00144CAC CF01013C */  lui         $1, %hi(se_inf_tbl + 0x2EE0)
/* 044DB0 00144CB0 30CE238C */  lw          $3, %lo(se_inf_tbl + 0x2EE0)($1)
/* 044DB4 00144CB4 80200300 */  sll         $4, $3, 2
/* 044DB8 00144CB8 CF01033C */  lui         $3, %hi(se_inf_tbl + 0x1)
/* 044DBC 00144CBC 519F6324 */  addiu       $3, $3, %lo(se_inf_tbl + 0x1)
/* 044DC0 00144CC0 21186400 */  addu        $3, $3, $4
/* 044DC4 00144CC4 000062A0 */  sb          $2, 0x0($3)
/* 044DC8 00144CC8 28260070 */  paddub      $4, $0, $0
/* 044DCC 00144CCC 2000A527 */  addiu       $5, $29, 0x20
/* 044DD0 00144CD0 A21A040C */  jal         strtok
/* 044DD4 00144CD4 00000000 */   nop
/* 044DD8 00144CD8 2C00A427 */  addiu       $4, $29, 0x2C
/* 044DDC 00144CDC 282E4070 */  paddub      $5, $2, $0
/* 044DE0 00144CE0 04000624 */  addiu       $6, $0, 0x4
/* 044DE4 00144CE4 5C16040C */  jal         strncpy
/* 044DE8 00144CE8 00000000 */   nop
/* 044DEC 00144CEC 2C00A427 */  addiu       $4, $29, 0x2C
/* 044DF0 00144CF0 8E00040C */  jal         atoi
/* 044DF4 00144CF4 00000000 */   nop
/* 044DF8 00144CF8 CF01013C */  lui         $1, %hi(se_inf_tbl + 0x2EE0)
/* 044DFC 00144CFC 30CE238C */  lw          $3, %lo(se_inf_tbl + 0x2EE0)($1)
/* 044E00 00144D00 80200300 */  sll         $4, $3, 2
/* 044E04 00144D04 CF01033C */  lui         $3, %hi(se_inf_tbl + 0x2)
/* 044E08 00144D08 529F6324 */  addiu       $3, $3, %lo(se_inf_tbl + 0x2)
/* 044E0C 00144D0C 21186400 */  addu        $3, $3, $4
/* 044E10 00144D10 000062A4 */  sh          $2, 0x0($3)
/* 044E14 00144D14 28260070 */  paddub      $4, $0, $0
/* 044E18 00144D18 2000A527 */  addiu       $5, $29, 0x20
/* 044E1C 00144D1C A21A040C */  jal         strtok
/* 044E20 00144D20 00000000 */   nop
/* 044E24 00144D24 CF01013C */  lui         $1, %hi(se_inf_tbl + 0x2EE0)
/* 044E28 00144D28 30CE238C */  lw          $3, %lo(se_inf_tbl + 0x2EE0)($1)
/* 044E2C 00144D2C 01006324 */  addiu       $3, $3, 0x1
/* 044E30 00144D30 CF01013C */  lui         $1, %hi(se_inf_tbl + 0x2EE0)
/* 044E34 00144D34 30CE23AC */  sw          $3, %lo(se_inf_tbl + 0x2EE0)($1)
.L00144D38:
/* 044E38 00144D38 C1FF4014 */  bnez        $2, .L00144C40
/* 044E3C 00144D3C 00000000 */   nop
/* 044E40 00144D40 2800A28F */  lw          $2, 0x28($29)
/* 044E44 00144D44 1000BF7B */  lq          $31, 0x10($29)
/* 044E48 00144D48 0000B07B */  lq          $16, 0x0($29)
/* 044E4C 00144D4C 3000BD27 */  addiu       $29, $29, 0x30
/* 044E50 00144D50 0800E003 */  jr          $31
/* 044E54 00144D54 00000000 */   nop
/* 044E58 00144D58 00000000 */  nop
/* 044E5C 00144D5C 00000000 */  nop
