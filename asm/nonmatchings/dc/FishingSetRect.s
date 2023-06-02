.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FishingSetRect__F7CBoxVu0
/* A9360 001A9260 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A9364 001A9264 0000BF7F */  sq         $31, 0x0($sp)
/* A9368 001A9268 1000A527 */  addiu      $5, $sp, 0x10
/* A936C 001A926C 00008378 */  lq         $3, 0x0($4)
/* A9370 001A9270 10008278 */  lq         $2, 0x10($4)
/* A9374 001A9274 0000A37C */  sq         $3, 0x0($5)
/* A9378 001A9278 1000A27C */  sq         $2, 0x10($5)
/* A937C 001A927C D501023C */  lui        $2, %hi(fishing_rect)
/* A9380 001A9280 D0494424 */  addiu      $4, $2, %lo(fishing_rect)
/* A9384 001A9284 20000624 */  addiu      $6, $0, 0x20
/* A9388 001A9288 EC0C040C */  jal        memcpy
/* A938C 001A928C 00000000 */   nop
/* A9390 001A9290 0000BF7B */  lq         $31, 0x0($sp)
/* A9394 001A9294 3000BD27 */  addiu      $sp, $sp, 0x30
/* A9398 001A9298 0800E003 */  jr         $31
/* A939C 001A929C 00000000 */   nop
