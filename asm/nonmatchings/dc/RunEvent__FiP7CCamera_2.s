.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RunEvent__FiP7CCamera_2
/* 9BD40 0019BC40 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 9BD44 0019BC44 2000BF7F */  sq         $31, 0x20($sp)
/* 9BD48 0019BC48 1000B17F */  sq         $17, 0x10($sp)
/* 9BD4C 0019BC4C 0000B07F */  sq         $16, 0x0($sp)
/* 9BD50 0019BC50 28868070 */  paddub     $16, $4, $0
/* 9BD54 0019BC54 288EA070 */  paddub     $17, $5, $0
/* 9BD58 0019BC58 C892838F */  lw         $3, -0x6D38($gp)
/* 9BD5C 0019BC5C 1F00601C */  bgtz       $3, .L0019BCDC
/* 9BD60 0019BC60 00000000 */   nop
/* 9BD64 0019BC64 1C002012 */  beqz       $17, .L0019BCD8
/* 9BD68 0019BC68 00000000 */   nop
/* 9BD6C 0019BC6C 28262072 */  paddub     $4, $17, $0
/* 9BD70 0019BC70 3000A527 */  addiu      $5, $sp, 0x30
/* 9BD74 0019BC74 9C91040C */  jal        GetPos__7CCameraFPf
/* 9BD78 0019BC78 00000000 */   nop
/* 9BD7C 0019BC7C 28262072 */  paddub     $4, $17, $0
/* 9BD80 0019BC80 4000A527 */  addiu      $5, $sp, 0x40
/* 9BD84 0019BC84 A891040C */  jal        GetRef__7CCameraFPf
/* 9BD88 0019BC88 00000000 */   nop
/* 9BD8C 0019BC8C D501023C */  lui        $2, %hi(EventCamera_2)
/* 9BD90 0019BC90 B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9BD94 0019BC94 3000A527 */  addiu      $5, $sp, 0x30
/* 9BD98 0019BC98 A490040C */  jal        SetPos__7CCameraFPf
/* 9BD9C 0019BC9C 00000000 */   nop
/* 9BDA0 0019BCA0 D501023C */  lui        $2, %hi(EventCamera_2)
/* 9BDA4 0019BCA4 B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9BDA8 0019BCA8 4000A527 */  addiu      $5, $sp, 0x40
/* 9BDAC 0019BCAC C490040C */  jal        SetRef__7CCameraFPf
/* 9BDB0 0019BCB0 00000000 */   nop
/* 9BDB4 0019BCB4 D501023C */  lui        $2, %hi(EventCamera_2)
/* 9BDB8 0019BCB8 B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9BDBC 0019BCBC C492040C */  jal        FollowOff__13CCameraFollowFv
/* 9BDC0 0019BCC0 00000000 */   nop
/* 9BDC4 0019BCC4 00608044 */  mtc1       $0, $f12
/* 9BDC8 0019BCC8 D501023C */  lui        $2, %hi(EventCamera_2)
/* 9BDCC 0019BCCC B0404424 */  addiu      $4, $2, %lo(EventCamera_2)
/* 9BDD0 0019BCD0 9891040C */  jal        SetRoll__7CCameraFf
/* 9BDD4 0019BCD4 00000000 */   nop
.L0019BCD8:
/* 9BDD8 0019BCD8 C89290AF */  sw         $16, -0x6D38($gp)
.L0019BCDC:
/* 9BDDC 0019BCDC 2000BF7B */  lq         $31, 0x20($sp)
/* 9BDE0 0019BCE0 1000B17B */  lq         $17, 0x10($sp)
/* 9BDE4 0019BCE4 0000B07B */  lq         $16, 0x0($sp)
/* 9BDE8 0019BCE8 5000BD27 */  addiu      $sp, $sp, 0x50
/* 9BDEC 0019BCEC 0800E003 */  jr         $31
/* 9BDF0 0019BCF0 00000000 */   nop
/* 9BDF4 0019BCF4 00000000 */  nop
/* 9BDF8 0019BCF8 00000000 */  nop
/* 9BDFC 0019BCFC 00000000 */  nop
