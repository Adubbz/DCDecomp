.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingExit__Fv
/* A91F0 001A90F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A91F4 001A90F4 1000BF7F */  sq         $31, 0x10($sp)
/* A91F8 001A90F8 0000B07F */  sq         $16, 0x0($sp)
/* A91FC 001A90FC 5093828F */  lw         $2, -0x6CB0($gp)
/* A9200 001A9100 0A004004 */  bltz       $2, .L001A912C
/* A9204 001A9104 00000000 */   nop
/* A9208 001A9108 C0180200 */  sll        $3, $2, 3
/* A920C 001A910C 2700023C */  lui        $2, %hi(esa_info)
/* A9210 001A9110 90AE4224 */  addiu      $2, $2, %lo(esa_info)
/* A9214 001A9114 21104300 */  addu       $2, $2, $3
/* A9218 001A9118 0000448C */  lw         $4, 0x0($2)
/* A921C 001A911C 01000524 */  addiu      $5, $0, 0x1
/* A9220 001A9120 FFFF0624 */  addiu      $6, $0, -0x1
/* A9224 001A9124 28CC050C */  jal        EdGetItem__Fiii
/* A9228 001A9128 00000000 */   nop
.L001A912C:
/* A922C 001A912C 28860070 */  paddub     $16, $0, $0
/* A9230 001A9130 0B000010 */  b          .L001A9160
/* A9234 001A9134 00000000 */   nop
.L001A9138:
/* A9238 001A9138 C0101000 */  sll        $2, $16, 3
/* A923C 001A913C 21105000 */  addu       $2, $2, $16
/* A9240 001A9140 80110200 */  sll        $2, $2, 6
/* A9244 001A9144 21105000 */  addu       $2, $2, $16
/* A9248 001A9148 00190200 */  sll        $3, $2, 4
/* A924C 001A914C 6893828F */  lw         $2, -0x6C98($gp)
/* A9250 001A9150 21204300 */  addu       $4, $2, $3
/* A9254 001A9154 5004090C */  jal        Initialize__5CFishFv
/* A9258 001A9158 00000000 */   nop
/* A925C 001A915C 01001026 */  addiu      $16, $16, 0x1
.L001A9160:
/* A9260 001A9160 0600022A */  slti       $2, $16, 0x6
/* A9264 001A9164 F4FF4014 */  bnez       $2, .L001A9138
/* A9268 001A9168 00000000 */   nop
/* A926C 001A916C 1CA4060C */  jal        FishingInit__Fv
/* A9270 001A9170 00000000 */   nop
/* A9274 001A9174 1000BF7B */  lq         $31, 0x10($sp)
/* A9278 001A9178 0000B07B */  lq         $16, 0x0($sp)
/* A927C 001A917C 2000BD27 */  addiu      $sp, $sp, 0x20
/* A9280 001A9180 0800E003 */  jr         $31
/* A9284 001A9184 00000000 */   nop
/* A9288 001A9188 00000000 */  nop
/* A928C 001A918C 00000000 */  nop
