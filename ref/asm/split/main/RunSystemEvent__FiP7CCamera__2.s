.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel RunSystemEvent__FiP7CCamera__2
/* 09BE00 0019BD00 B0FFBD27 */  addiu       $29, $29, -0x50
/* 09BE04 0019BD04 2000BF7F */  sq          $31, 0x20($29)
/* 09BE08 0019BD08 1000B17F */  sq          $17, 0x10($29)
/* 09BE0C 0019BD0C 0000B07F */  sq          $16, 0x0($29)
/* 09BE10 0019BD10 288E8070 */  paddub      $17, $4, $0
/* 09BE14 0019BD14 2886A070 */  paddub      $16, $5, $0
/* 09BE18 0019BD18 CC92838F */  lw          $3, -0x6D34($28)
/* 09BE1C 0019BD1C 1A00601C */  bgtz        $3, .L0019BD88
/* 09BE20 0019BD20 00000000 */   nop
/* 09BE24 0019BD24 17000012 */  beqz        $16, .L0019BD84
/* 09BE28 0019BD28 00000000 */   nop
/* 09BE2C 0019BD2C 28260072 */  paddub      $4, $16, $0
/* 09BE30 0019BD30 3000A527 */  addiu       $5, $29, 0x30
/* 09BE34 0019BD34 9C91040C */  jal         GetPos__7CCameraFPf
/* 09BE38 0019BD38 00000000 */   nop
/* 09BE3C 0019BD3C 28260072 */  paddub      $4, $16, $0
/* 09BE40 0019BD40 4000A527 */  addiu       $5, $29, 0x40
/* 09BE44 0019BD44 A891040C */  jal         GetRef__7CCameraFPf
/* 09BE48 0019BD48 00000000 */   nop
/* 09BE4C 0019BD4C D501023C */  lui         $2, %hi(EventCamera__2)
/* 09BE50 0019BD50 B0404424 */  addiu       $4, $2, %lo(EventCamera__2)
/* 09BE54 0019BD54 3000A527 */  addiu       $5, $29, 0x30
/* 09BE58 0019BD58 A490040C */  jal         SetPos__7CCameraFPf
/* 09BE5C 0019BD5C 00000000 */   nop
/* 09BE60 0019BD60 D501023C */  lui         $2, %hi(EventCamera__2)
/* 09BE64 0019BD64 B0404424 */  addiu       $4, $2, %lo(EventCamera__2)
/* 09BE68 0019BD68 4000A527 */  addiu       $5, $29, 0x40
/* 09BE6C 0019BD6C C490040C */  jal         SetRef__7CCameraFPf
/* 09BE70 0019BD70 00000000 */   nop
/* 09BE74 0019BD74 D501023C */  lui         $2, %hi(EventCamera__2)
/* 09BE78 0019BD78 B0404424 */  addiu       $4, $2, %lo(EventCamera__2)
/* 09BE7C 0019BD7C C492040C */  jal         FollowOff__13CCameraFollowFv
/* 09BE80 0019BD80 00000000 */   nop
.L0019BD84:
/* 09BE84 0019BD84 CC9291AF */  sw          $17, -0x6D34($28)
.L0019BD88:
/* 09BE88 0019BD88 2000BF7B */  lq          $31, 0x20($29)
/* 09BE8C 0019BD8C 1000B17B */  lq          $17, 0x10($29)
/* 09BE90 0019BD90 0000B07B */  lq          $16, 0x0($29)
/* 09BE94 0019BD94 5000BD27 */  addiu       $29, $29, 0x50
/* 09BE98 0019BD98 0800E003 */  jr          $31
/* 09BE9C 0019BD9C 00000000 */   nop
