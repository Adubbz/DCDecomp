.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitWorkBuffer__Fv_2
/* 9BEA0 0019BDA0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BEA4 0019BDA4 58B3258C */  lw         $5, -0x4CA8($at)
/* 9BEA8 0019BDA8 00210500 */  sll        $4, $5, 4
/* 9BEAC 0019BDAC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BEB0 0019BDB0 50B3238C */  lw         $3, -0x4CB0($at)
/* 9BEB4 0019BDB4 21206400 */  addu       $4, $3, $4
/* 9BEB8 0019BDB8 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BEBC 0019BDBC 5CB3238C */  lw         $3, -0x4CA4($at)
/* 9BEC0 0019BDC0 23286500 */  subu       $5, $3, $5
/* 9BEC4 0019BDC4 83190400 */  sra        $3, $4, 6
/* 9BEC8 0019BDC8 01006324 */  addiu      $3, $3, 0x1
/* 9BECC 0019BDCC 80210300 */  sll        $4, $3, 6
/* 9BED0 0019BDD0 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BED4 0019BDD4 C0B324AC */  sw         $4, -0x4C40($at)
/* 9BED8 0019BDD8 FCFFA324 */  addiu      $3, $5, -0x4
/* 9BEDC 0019BDDC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BEE0 0019BDE0 CCB323AC */  sw         $3, -0x4C34($at)
/* 9BEE4 0019BDE4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BEE8 0019BDE8 C8B320AC */  sw         $0, -0x4C38($at)
/* 9BEEC 0019BDEC D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BEF0 0019BDF0 68B3238C */  lw         $3, -0x4C98($at)
/* 9BEF4 0019BDF4 01006018 */  blez       $3, .L0019BDFC
/* 9BEF8 0019BDF8 00000000 */   nop
.L0019BDFC:
/* 9BEFC 0019BDFC 948B848F */  lw         $4, -0x746C($gp)
/* 9BF00 0019BE00 E8FF013C */  lui        $at, (0xFFE80000 >> 16)
/* 9BF04 0019BE04 21188100 */  addu       $3, $4, $at
/* 9BF08 0019BE08 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BF0C 0019BE0C D0B323AC */  sw         $3, -0x4C30($at)
/* 9BF10 0019BE10 0300033C */  lui        $3, (0x3A2E0 >> 16)
/* 9BF14 0019BE14 E0A26334 */  ori        $3, $3, (0x3A2E0 & 0xFFFF)
/* 9BF18 0019BE18 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BF1C 0019BE1C DCB323AC */  sw         $3, -0x4C24($at)
/* 9BF20 0019BE20 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 9BF24 0019BE24 D8B320AC */  sw         $0, -0x4C28($at)
/* 9BF28 0019BE28 0800E003 */  jr         $31
/* 9BF2C 0019BE2C 00000000 */   nop
