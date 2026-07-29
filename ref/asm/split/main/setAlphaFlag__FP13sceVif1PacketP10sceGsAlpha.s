.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha
/* 05BD20 0015BC20 C0FFBD27 */  addiu       $29, $29, -0x40
/* 05BD24 0015BC24 2000BF7F */  sq          $31, 0x20($29)
/* 05BD28 0015BC28 1000B17F */  sq          $17, 0x10($29)
/* 05BD2C 0015BC2C 0000B07F */  sq          $16, 0x0($29)
/* 05BD30 0015BC30 288E8070 */  paddub      $17, $4, $0
/* 05BD34 0015BC34 2886A070 */  paddub      $16, $5, $0
/* 05BD38 0015BC38 3000A227 */  addiu       $2, $29, 0x30
/* 05BD3C 0015BC3C 0000407C */  sq          $0, 0x0($2)
/* 05BD40 0015BC40 3100A593 */  lbu         $5, 0x31($29)
/* 05BD44 0015BC44 80000364 */  daddiu      $3, $0, 0x80
/* 05BD48 0015BC48 7FFF0224 */  addiu       $2, $0, -0x81
/* 05BD4C 0015BC4C 2410A200 */  and         $2, $5, $2
/* 05BD50 0015BC50 25104300 */  or          $2, $2, $3
/* 05BD54 0015BC54 3100A2A3 */  sb          $2, 0x31($29)
/* 05BD58 0015BC58 3700A593 */  lbu         $5, 0x37($29)
/* 05BD5C 0015BC5C 10000364 */  daddiu      $3, $0, 0x10
/* 05BD60 0015BC60 0FFF0224 */  addiu       $2, $0, -0xF1
/* 05BD64 0015BC64 2410A200 */  and         $2, $5, $2
/* 05BD68 0015BC68 25104300 */  or          $2, $2, $3
/* 05BD6C 0015BC6C 3700A2A3 */  sb          $2, 0x37($29)
/* 05BD70 0015BC70 3800A593 */  lbu         $5, 0x38($29)
/* 05BD74 0015BC74 0E000364 */  daddiu      $3, $0, 0xE
/* 05BD78 0015BC78 F0FF0224 */  addiu       $2, $0, -0x10
/* 05BD7C 0015BC7C 2410A200 */  and         $2, $5, $2
/* 05BD80 0015BC80 25104300 */  or          $2, $2, $3
/* 05BD84 0015BC84 3800A2A3 */  sb          $2, 0x38($29)
/* 05BD88 0015BC88 282E0070 */  paddub      $5, $0, $0
/* 05BD8C 0015BC8C 2083040C */  jal         sceVif1PkCnt
/* 05BD90 0015BC90 00000000 */   nop
/* 05BD94 0015BC94 28262072 */  paddub      $4, $17, $0
/* 05BD98 0015BC98 282E0070 */  paddub      $5, $0, $0
/* 05BD9C 0015BC9C 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 05BDA0 0015BCA0 00000000 */   nop
/* 05BDA4 0015BCA4 3000A227 */  addiu       $2, $29, 0x30
/* 05BDA8 0015BCA8 28262072 */  paddub      $4, $17, $0
/* 05BDAC 0015BCAC 00004578 */  lq          $5, 0x0($2)
/* 05BDB0 0015BCB0 B083040C */  jal         sceVif1PkOpenGifTag
/* 05BDB4 0015BCB4 00000000 */   nop
/* 05BDB8 0015BCB8 28262072 */  paddub      $4, $17, $0
/* 05BDBC 0015BCBC 42000524 */  addiu       $5, $0, 0x42
/* 05BDC0 0015BCC0 000006DE */  ld          $6, 0x0($16)
/* 05BDC4 0015BCC4 0A84040C */  jal         sceVif1PkAddGsAD
/* 05BDC8 0015BCC8 00000000 */   nop
/* 05BDCC 0015BCCC 28262072 */  paddub      $4, $17, $0
/* 05BDD0 0015BCD0 B683040C */  jal         sceVif1PkCloseGifTag
/* 05BDD4 0015BCD4 00000000 */   nop
/* 05BDD8 0015BCD8 28262072 */  paddub      $4, $17, $0
/* 05BDDC 0015BCDC A483040C */  jal         sceVif1PkCloseDirectCode
/* 05BDE0 0015BCE0 00000000 */   nop
/* 05BDE4 0015BCE4 2000BF7B */  lq          $31, 0x20($29)
/* 05BDE8 0015BCE8 1000B17B */  lq          $17, 0x10($29)
/* 05BDEC 0015BCEC 0000B07B */  lq          $16, 0x0($29)
/* 05BDF0 0015BCF0 4000BD27 */  addiu       $29, $29, 0x40
/* 05BDF4 0015BCF4 0800E003 */  jr          $31
/* 05BDF8 0015BCF8 00000000 */   nop
/* 05BDFC 0015BCFC 00000000 */  nop
