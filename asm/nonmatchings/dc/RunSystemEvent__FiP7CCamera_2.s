.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RunSystemEvent__FiP7CCamera_2
/* 9BE00 0019BD00 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 9BE04 0019BD04 2000BF7F */  sq         $31, 0x20($sp)
/* 9BE08 0019BD08 1000B17F */  sq         $17, 0x10($sp)
/* 9BE0C 0019BD0C 0000B07F */  sq         $16, 0x0($sp)
/* 9BE10 0019BD10 288E8070 */  paddub     $17, $4, $0
/* 9BE14 0019BD14 2886A070 */  paddub     $16, $5, $0
/* 9BE18 0019BD18 CC92838F */  lw         $3, -0x6D34($gp)
/* 9BE1C 0019BD1C 1A00601C */  bgtz       $3, .L0019BD88
/* 9BE20 0019BD20 00000000 */   nop
/* 9BE24 0019BD24 17000012 */  beqz       $16, .L0019BD84
/* 9BE28 0019BD28 00000000 */   nop
/* 9BE2C 0019BD2C 28260072 */  paddub     $4, $16, $0
/* 9BE30 0019BD30 3000A527 */  addiu      $5, $sp, 0x30
/* 9BE34 0019BD34 9C91040C */  jal        GetPos__7CCameraFPf
/* 9BE38 0019BD38 00000000 */   nop
/* 9BE3C 0019BD3C 28260072 */  paddub     $4, $16, $0
/* 9BE40 0019BD40 4000A527 */  addiu      $5, $sp, 0x40
/* 9BE44 0019BD44 A891040C */  jal        GetRef__7CCameraFPf
/* 9BE48 0019BD48 00000000 */   nop
/* 9BE4C 0019BD4C D501023C */  lui        $2, %hi(EventCamera_2)
/* 9BE50 0019BD50 B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9BE54 0019BD54 3000A527 */  addiu      $5, $sp, 0x30
/* 9BE58 0019BD58 A490040C */  jal        SetPos__7CCameraFPf
/* 9BE5C 0019BD5C 00000000 */   nop
/* 9BE60 0019BD60 D501023C */  lui        $2, %hi(EventCamera_2)
/* 9BE64 0019BD64 B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9BE68 0019BD68 4000A527 */  addiu      $5, $sp, 0x40
/* 9BE6C 0019BD6C C490040C */  jal        SetRef__7CCameraFPf
/* 9BE70 0019BD70 00000000 */   nop
/* 9BE74 0019BD74 D501023C */  lui        $2, %hi(EventCamera_2)
/* 9BE78 0019BD78 B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9BE7C 0019BD7C C492040C */  jal        FollowOff__13CCameraFollowFv
/* 9BE80 0019BD80 00000000 */   nop
.L0019BD84:
/* 9BE84 0019BD84 CC9291AF */  sw         $17, -0x6D34($gp)
.L0019BD88:
/* 9BE88 0019BD88 2000BF7B */  lq         $31, 0x20($sp)
/* 9BE8C 0019BD8C 1000B17B */  lq         $17, 0x10($sp)
/* 9BE90 0019BD90 0000B07B */  lq         $16, 0x0($sp)
/* 9BE94 0019BD94 5000BD27 */  addiu      $sp, $sp, 0x50
/* 9BE98 0019BD98 0800E003 */  jr         $31
/* 9BE9C 0019BD9C 00000000 */   nop
