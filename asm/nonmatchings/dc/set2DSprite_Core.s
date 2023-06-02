.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 4C4C0 0014C3C0 4700A010 */  beqz       $5, .L0014C4E0
/* 4C4C4 0014C3C4 00000000 */   nop
/* 4C4C8 0014C3C8 C08D858F */  lw         $5, -0x7240($gp)
/* 4C4CC 0014C3CC FF000431 */  andi       $4, $8, 0xFF
/* 4C4D0 0014C3D0 FF002331 */  andi       $3, $9, 0xFF
/* 4C4D4 0014C3D4 381A0300 */  dsll       $3, $3, 8
/* 4C4D8 0014C3D8 25208300 */  or         $4, $4, $3
/* 4C4DC 0014C3DC FF004331 */  andi       $3, $10, 0xFF
/* 4C4E0 0014C3E0 381C0300 */  dsll       $3, $3, 16
/* 4C4E4 0014C3E4 25206400 */  or         $4, $3, $4
/* 4C4E8 0014C3E8 FF006331 */  andi       $3, $11, 0xFF
/* 4C4EC 0014C3EC 381E0300 */  dsll       $3, $3, 24
/* 4C4F0 0014C3F0 25186400 */  or         $3, $3, $4
/* 4C4F4 0014C3F4 0000A3FC */  sd         $3, 0x0($5)
/* 4C4F8 0014C3F8 01000324 */  addiu      $3, $0, 0x1
/* 4C4FC 0014C3FC 0800A3FC */  sd         $3, 0x8($5)
/* 4C500 0014C400 0400E38C */  lw         $3, 0x4($7)
/* 4C504 0014C404 00190300 */  sll        $3, $3, 4
/* 4C508 0014C408 38240300 */  dsll       $4, $3, 16
/* 4C50C 0014C40C 0000E38C */  lw         $3, 0x0($7)
/* 4C510 0014C410 00190300 */  sll        $3, $3, 4
/* 4C514 0014C414 25186400 */  or         $3, $3, $4
/* 4C518 0014C418 1000A3FC */  sd         $3, 0x10($5)
/* 4C51C 0014C41C 03000424 */  addiu      $4, $0, 0x3
/* 4C520 0014C420 1800A4FC */  sd         $4, 0x18($5)
/* 4C524 0014C424 0400C38C */  lw         $3, 0x4($6)
/* 4C528 0014C428 C0180300 */  sll        $3, $3, 3
/* 4C52C 0014C42C 00796324 */  addiu      $3, $3, 0x7900
/* 4C530 0014C430 3C180300 */  dsll32     $3, $3, 0
/* 4C534 0014C434 3F180300 */  dsra32     $3, $3, 0
/* 4C538 0014C438 38440300 */  dsll       $8, $3, 16
/* 4C53C 0014C43C 0000C38C */  lw         $3, 0x0($6)
/* 4C540 0014C440 00190300 */  sll        $3, $3, 4
/* 4C544 0014C444 006C6324 */  addiu      $3, $3, 0x6C00
/* 4C548 0014C448 3C180300 */  dsll32     $3, $3, 0
/* 4C54C 0014C44C 3F180300 */  dsra32     $3, $3, 0
/* 4C550 0014C450 25186800 */  or         $3, $3, $8
/* 4C554 0014C454 2000A3FC */  sd         $3, 0x20($5)
/* 4C558 0014C458 04000324 */  addiu      $3, $0, 0x4
/* 4C55C 0014C45C 2800A3FC */  sd         $3, 0x28($5)
/* 4C560 0014C460 0400E98C */  lw         $9, 0x4($7)
/* 4C564 0014C464 0C00E88C */  lw         $8, 0xC($7)
/* 4C568 0014C468 21402801 */  addu       $8, $9, $8
/* 4C56C 0014C46C 00410800 */  sll        $8, $8, 4
/* 4C570 0014C470 384C0800 */  dsll       $9, $8, 16
/* 4C574 0014C474 0000E88C */  lw         $8, 0x0($7)
/* 4C578 0014C478 0800E78C */  lw         $7, 0x8($7)
/* 4C57C 0014C47C 21380701 */  addu       $7, $8, $7
/* 4C580 0014C480 00390700 */  sll        $7, $7, 4
/* 4C584 0014C484 2538E900 */  or         $7, $7, $9
/* 4C588 0014C488 3000A7FC */  sd         $7, 0x30($5)
/* 4C58C 0014C48C 3800A4FC */  sd         $4, 0x38($5)
/* 4C590 0014C490 0400C78C */  lw         $7, 0x4($6)
/* 4C594 0014C494 0C00C48C */  lw         $4, 0xC($6)
/* 4C598 0014C498 2120E400 */  addu       $4, $7, $4
/* 4C59C 0014C49C C0200400 */  sll        $4, $4, 3
/* 4C5A0 0014C4A0 00798424 */  addiu      $4, $4, 0x7900
/* 4C5A4 0014C4A4 3C200400 */  dsll32     $4, $4, 0
/* 4C5A8 0014C4A8 3F200400 */  dsra32     $4, $4, 0
/* 4C5AC 0014C4AC 38440400 */  dsll       $8, $4, 16
/* 4C5B0 0014C4B0 0000C78C */  lw         $7, 0x0($6)
/* 4C5B4 0014C4B4 0800C48C */  lw         $4, 0x8($6)
/* 4C5B8 0014C4B8 2120E400 */  addu       $4, $7, $4
/* 4C5BC 0014C4BC 00210400 */  sll        $4, $4, 4
/* 4C5C0 0014C4C0 FF6B8424 */  addiu      $4, $4, 0x6BFF
/* 4C5C4 0014C4C4 3C200400 */  dsll32     $4, $4, 0
/* 4C5C8 0014C4C8 3F200400 */  dsra32     $4, $4, 0
/* 4C5CC 0014C4CC 25208800 */  or         $4, $4, $8
/* 4C5D0 0014C4D0 4000A4FC */  sd         $4, 0x40($5)
/* 4C5D4 0014C4D4 4800A3FC */  sd         $3, 0x48($5)
/* 4C5D8 0014C4D8 5000A324 */  addiu      $3, $5, 0x50
/* 4C5DC 0014C4DC C08D83AF */  sw         $3, -0x7240($gp)
.L0014C4E0:
/* 4C5E0 0014C4E0 0800E003 */  jr         $31
/* 4C5E4 0014C4E4 00000000 */   nop
/* 4C5E8 0014C4E8 00000000 */  nop
/* 4C5EC 0014C4EC 00000000 */  nop
