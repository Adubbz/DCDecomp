.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel draw__5CSHOTFv
/* ABD40 001ABC40 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* ABD44 001ABC44 2000BF7F */  sq         $31, 0x20($sp)
/* ABD48 001ABC48 1000B17F */  sq         $17, 0x10($sp)
/* ABD4C 001ABC4C 0000B07F */  sq         $16, 0x0($sp)
/* ABD50 001ABC50 288E8070 */  paddub     $17, $4, $0
/* ABD54 001ABC54 28860070 */  paddub     $16, $0, $0
/* ABD58 001ABC58 23000010 */  b          .L001ABCE8
/* ABD5C 001ABC5C 00000000 */   nop
.L001ABC60:
/* ABD60 001ABC60 80201000 */  sll        $4, $16, 2
/* ABD64 001ABC64 21189100 */  addu       $3, $4, $17
/* ABD68 001ABC68 D003638C */  lw         $3, 0x3D0($3)
/* ABD6C 001ABC6C 1D006010 */  beqz       $3, .L001ABCE4
/* ABD70 001ABC70 00000000 */   nop
/* ABD74 001ABC74 049D828F */  lw         $2, -0x62FC($gp)
/* ABD78 001ABC78 00004284 */  lh         $2, 0x0($2)
/* ABD7C 001ABC7C D5FE4324 */  addiu      $3, $2, -0x12B
/* ABD80 001ABC80 FFFF6324 */  addiu      $3, $3, -0x1
/* ABD84 001ABC84 0200601C */  bgtz       $3, .L001ABC90
/* ABD88 001ABC88 00000000 */   nop
/* ABD8C 001ABC8C 281E0070 */  paddub     $3, $0, $0
.L001ABC90:
/* ABD90 001ABC90 03006230 */  andi       $2, $3, 0x3
/* ABD94 001ABC94 04006104 */  bgez       $3, .L001ABCA8
/* ABD98 001ABC98 00000000 */   nop
/* ABD9C 001ABC9C 02004010 */  beqz       $2, .L001ABCA8
/* ABDA0 001ABCA0 00000000 */   nop
/* ABDA4 001ABCA4 FCFF4224 */  addiu      $2, $2, -0x4
.L001ABCA8:
/* ABDA8 001ABCA8 40310200 */  sll        $6, $2, 5
/* ABDAC 001ABCAC 83100300 */  sra        $2, $3, 2
/* ABDB0 001ABCB0 40390200 */  sll        $7, $2, 5
/* ABDB4 001ABCB4 00111000 */  sll        $2, $16, 4
/* ABDB8 001ABCB8 21102202 */  addu       $2, $17, $2
/* ABDBC 001ABCBC 21189100 */  addu       $3, $4, $17
/* ABDC0 001ABCC0 40004424 */  addiu      $4, $2, 0x40
/* ABDC4 001ABCC4 2A00023C */  lui        $2, %hi(_625_2)
/* ABDC8 001ABCC8 C8B44524 */  addiu      $5, $2, %lo(_625_2)
/* ABDCC 001ABCCC 10036CC4 */  lwc1       $f12, 0x310($3)
/* ABDD0 001ABCD0 20000824 */  addiu      $8, $0, 0x20
/* ABDD4 001ABCD4 284E0071 */  paddub     $9, $8, $0
/* ABDD8 001ABCD8 80000A24 */  addiu      $10, $0, 0x80
/* ABDDC 001ABCDC C0AE060C */  jal        set3DCellModel__FPfPcfiiiiUc
/* ABDE0 001ABCE0 00000000 */   nop
.L001ABCE4:
/* ABDE4 001ABCE4 01001026 */  addiu      $16, $16, 0x1
.L001ABCE8:
/* ABDE8 001ABCE8 0C00032A */  slti       $3, $16, 0xC
/* ABDEC 001ABCEC DCFF6014 */  bnez       $3, .L001ABC60
/* ABDF0 001ABCF0 00000000 */   nop
/* ABDF4 001ABCF4 2000BF7B */  lq         $31, 0x20($sp)
/* ABDF8 001ABCF8 1000B17B */  lq         $17, 0x10($sp)
/* ABDFC 001ABCFC 0000B07B */  lq         $16, 0x0($sp)
/* ABE00 001ABD00 3000BD27 */  addiu      $sp, $sp, 0x30
/* ABE04 001ABD04 0800E003 */  jr         $31
/* ABE08 001ABD08 00000000 */   nop
/* ABE0C 001ABD0C 00000000 */  nop
