.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__5CFishFv
/* 141240 00241140 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 141244 00241144 1000BF7F */  sq         $31, 0x10($sp)
/* 141248 00241148 0000B07F */  sq         $16, 0x0($sp)
/* 14124C 0024114C 28868070 */  paddub     $16, $4, $0
/* 141250 00241150 FFFF0224 */  addiu      $2, $0, -0x1
/* 141254 00241154 000082AC */  sw         $2, 0x0($4)
/* 141258 00241158 500082AC */  sw         $2, 0x50($4)
/* 14125C 0024115C 4C0082AC */  sw         $2, 0x4C($4)
/* 141260 00241160 540080AC */  sw         $0, 0x54($4)
/* 141264 00241164 580080AC */  sw         $0, 0x58($4)
/* 141268 00241168 5C0080AC */  sw         $0, 0x5C($4)
/* 14126C 0024116C 803F033C */  lui        $3, (0x3F800000 >> 16)
/* 141270 00241170 640083AC */  sw         $3, 0x64($4)
/* 141274 00241174 2041023C */  lui        $2, (0x41200000 >> 16)
/* 141278 00241178 600082AC */  sw         $2, 0x60($4)
/* 14127C 0024117C 680083AC */  sw         $3, 0x68($4)
/* 141280 00241180 A0000426 */  addiu      $4, $16, 0xA0
/* 141284 00241184 4001198E */  lw         $25, 0x140($16)
/* 141288 00241188 C400398F */  lw         $25, 0xC4($25)
/* 14128C 0024118C 09F82003 */  jalr       $25
/* 141290 00241190 00000000 */   nop
/* 141294 00241194 50120426 */  addiu      $4, $16, 0x1250
/* 141298 00241198 F012198E */  lw         $25, 0x12F0($16)
/* 14129C 0024119C C400398F */  lw         $25, 0xC4($25)
/* 1412A0 002411A0 09F82003 */  jalr       $25
/* 1412A4 002411A4 00000000 */   nop
/* 1412A8 002411A8 002400AE */  sw         $0, 0x2400($16)
/* 1412AC 002411AC 042400AE */  sw         $0, 0x2404($16)
/* 1412B0 002411B0 780000AE */  sw         $0, 0x78($16)
/* 1412B4 002411B4 740000AE */  sw         $0, 0x74($16)
/* 1412B8 002411B8 700000AE */  sw         $0, 0x70($16)
/* 1412BC 002411BC 800000AE */  sw         $0, 0x80($16)
/* 1412C0 002411C0 840000AE */  sw         $0, 0x84($16)
/* 1412C4 002411C4 80BF033C */  lui        $3, (0xBF800000 >> 16)
/* 1412C8 002411C8 8C0003AE */  sw         $3, 0x8C($16)
/* 1412CC 002411CC 1000BF7B */  lq         $31, 0x10($sp)
/* 1412D0 002411D0 0000B07B */  lq         $16, 0x0($sp)
/* 1412D4 002411D4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 1412D8 002411D8 0800E003 */  jr         $31
/* 1412DC 002411DC 00000000 */   nop