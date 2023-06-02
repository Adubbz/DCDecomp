.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __rethrow
/* E408 0010E308 00F9BD27 */  addiu      $sp, $sp, -0x700
/* E40C 0010E30C 2500033C */  lui        $3, (0x250384 >> 16)
/* E410 0010E310 8006BEFF */  sd         $fp, 0x680($sp)
/* E414 0010E314 2DF0A003 */  daddu      $fp, $sp, $0
/* E418 0010E318 9006BFFF */  sd         $31, 0x690($sp)
/* E41C 0010E31C 7006B7FF */  sd         $23, 0x670($sp)
/* E420 0010E320 6006B6FF */  sd         $22, 0x660($sp)
/* E424 0010E324 5006B5FF */  sd         $21, 0x650($sp)
/* E428 0010E328 4006B4FF */  sd         $20, 0x640($sp)
/* E42C 0010E32C 3006B3FF */  sd         $19, 0x630($sp)
/* E430 0010E330 2006B2FF */  sd         $18, 0x620($sp)
/* E434 0010E334 1006B1FF */  sd         $17, 0x610($sp)
/* E438 0010E338 0006B0FF */  sd         $16, 0x600($sp)
/* E43C 0010E33C F806BFE7 */  swc1       $f31, 0x6F8($sp)
/* E440 0010E340 F006BEE7 */  swc1       $f30, 0x6F0($sp)
/* E444 0010E344 E806BDE7 */  swc1       $f29, 0x6E8($sp)
/* E448 0010E348 E006BCE7 */  swc1       $f28, 0x6E0($sp)
/* E44C 0010E34C D806BBE7 */  swc1       $f27, 0x6D8($sp)
/* E450 0010E350 D006BAE7 */  swc1       $f26, 0x6D0($sp)
/* E454 0010E354 C806B9E7 */  swc1       $f25, 0x6C8($sp)
/* E458 0010E358 C006B8E7 */  swc1       $f24, 0x6C0($sp)
/* E45C 0010E35C B806B7E7 */  swc1       $f23, 0x6B8($sp)
/* E460 0010E360 B006B6E7 */  swc1       $f22, 0x6B0($sp)
/* E464 0010E364 A806B5E7 */  swc1       $f21, 0x6A8($sp)
/* E468 0010E368 A006B4E7 */  swc1       $f20, 0x6A0($sp)
/* E46C 0010E36C E405C4AF */  sw         $4, 0x5E4($fp)
/* E470 0010E370 8403628C */  lw         $2, (0x250384 & 0xFFFF)($3)
/* E474 0010E374 09F84000 */  jalr       $2
/* E478 0010E378 00000000 */   nop
/* E47C 0010E37C E805C2AF */  sw         $2, 0x5E8($fp)
/* E480 0010E380 F002C227 */  addiu      $2, $fp, 0x2F0
/* E484 0010E384 E805C38F */  lw         $3, 0x5E8($fp)
/* E488 0010E388 EC05C2AF */  sw         $2, 0x5EC($fp)
/* E48C 0010E38C 0800628C */  lw         $2, 0x8($3)
/* E490 0010E390 03004014 */  bnez       $2, .L0010E3A0
/* E494 0010E394 E005DEAF */   sw        $fp, 0x5E0($fp)
/* E498 0010E398 6435040C */  jal        __terminate
/* E49C 0010E39C 00000000 */   nop
.L0010E3A0:
/* E4A0 0010E3A0 E405C68F */  lw         $6, 0x5E4($fp)
/* E4A4 0010E3A4 E005C727 */  addiu      $7, $fp, 0x5E0
/* E4A8 0010E3A8 E805C58F */  lw         $5, 0x5E8($fp)
/* E4AC 0010E3AC 0C00A6AC */  sw         $6, 0xC($5)
/* E4B0 0010E3B0 F005C7AF */  sw         $7, 0x5F0($fp)
D_0010E3B4:
/* E4B4 0010E3B4 1100083C */  lui        $8, %hi(D_0010E3B4)
/* E4B8 0010E3B8 E005C58F */  lw         $5, 0x5E0($fp)
/* E4BC 0010E3BC D847040C */  jal        __frame_state_for
/* E4C0 0010E3C0 B4E30425 */   addiu     $4, $8, %lo(D_0010E3B4)
/* E4C4 0010E3C4 2D184000 */  daddu      $3, $2, $0
/* E4C8 0010E3C8 04006014 */  bnez       $3, .L0010E3DC
/* E4CC 0010E3CC E005C2AF */   sw        $2, 0x5E0($fp)
/* E4D0 0010E3D0 6435040C */  jal        __terminate
/* E4D4 0010E3D4 00000000 */   nop
/* E4D8 0010E3D8 E005C38F */  lw         $3, 0x5E0($fp)
.L0010E3DC:
/* E4DC 0010E3DC 0007C227 */  addiu      $2, $fp, 0x700
/* E4E0 0010E3E0 2D206000 */  daddu      $4, $3, $0
/* E4E4 0010E3E4 000062AC */  sw         $2, 0x0($3)
/* E4E8 0010E3E8 EC05C28F */  lw         $2, 0x5EC($fp)
/* E4EC 0010E3EC E0028324 */  addiu      $3, $4, 0x2E0
.L0010E3F0:
/* E4F0 0010E3F0 000085DC */  ld         $5, 0x0($4)
/* E4F4 0010E3F4 080086DC */  ld         $6, 0x8($4)
/* E4F8 0010E3F8 100087DC */  ld         $7, 0x10($4)
/* E4FC 0010E3FC 180088DC */  ld         $8, 0x18($4)
/* E500 0010E400 000045FC */  sd         $5, 0x0($2)
/* E504 0010E404 080046FC */  sd         $6, 0x8($2)
/* E508 0010E408 100047FC */  sd         $7, 0x10($2)
/* E50C 0010E40C 180048FC */  sd         $8, 0x18($2)
/* E510 0010E410 20008424 */  addiu      $4, $4, 0x20
/* E514 0010E414 20004224 */  addiu      $2, $2, 0x20
/* E518 0010E418 00000000 */  nop
/* E51C 0010E41C F4FF8314 */  bne        $4, $3, .L0010E3F0
/* E520 0010E420 00000000 */   nop
/* E524 0010E424 000083DC */  ld         $3, 0x0($4)
/* E528 0010E428 080085DC */  ld         $5, 0x8($4)
/* E52C 0010E42C 000043FC */  sd         $3, 0x0($2)
/* E530 0010E430 080045FC */  sd         $5, 0x8($2)
/* E534 0010E434 9006C227 */  addiu      $2, $fp, 0x690
/* E538 0010E438 E805C48F */  lw         $4, 0x5E8($fp)
/* E53C 0010E43C 0000458C */  lw         $5, 0x0($2)
/* E540 0010E440 EC05C68F */  lw         $6, 0x5EC($fp)
/* E544 0010E444 F005C78F */  lw         $7, 0x5F0($fp)
/* E548 0010E448 7E37040C */  jal        throw_helper
/* E54C 0010E44C FFFFA524 */   addiu     $5, $5, -0x1
/* E550 0010E450 E005C68F */  lw         $6, 0x5E0($fp)
/* E554 0010E454 1100033C */  lui        $3, %hi(D_0010E480)
/* E558 0010E458 EC05C88F */  lw         $8, 0x5EC($fp)
/* E55C 0010E45C 80E46524 */  addiu      $5, $3, %lo(D_0010E480)
/* E560 0010E460 0000C38C */  lw         $3, 0x0($6)
/* E564 0010E464 9006C427 */  addiu      $4, $fp, 0x690
/* E568 0010E468 0000078D */  lw         $7, 0x0($8)
/* E56C 0010E46C 000085AC */  sw         $5, 0x0($4)
/* E570 0010E470 2D204000 */  daddu      $4, $2, $0
/* E574 0010E474 23186700 */  subu       $3, $3, $7
/* E578 0010E478 03000010 */  b          .L0010E488
/* E57C 0010E47C E805C28F */   lw        $2, 0x5E8($fp)
D_0010E480:
/* E580 0010E480 08008000 */  jr         $4
/* E584 0010E484 21E8A303 */   addu      $sp, $sp, $3
.L0010E488:
/* E588 0010E488 2DE8C003 */  daddu      $sp, $fp, $0
/* E58C 0010E48C 9006BFDF */  ld         $31, 0x690($sp)
/* E590 0010E490 8006BEDF */  ld         $fp, 0x680($sp)
/* E594 0010E494 7006B7DF */  ld         $23, 0x670($sp)
/* E598 0010E498 6006B6DF */  ld         $22, 0x660($sp)
/* E59C 0010E49C 5006B5DF */  ld         $21, 0x650($sp)
/* E5A0 0010E4A0 4006B4DF */  ld         $20, 0x640($sp)
/* E5A4 0010E4A4 3006B3DF */  ld         $19, 0x630($sp)
/* E5A8 0010E4A8 2006B2DF */  ld         $18, 0x620($sp)
/* E5AC 0010E4AC 1006B1DF */  ld         $17, 0x610($sp)
/* E5B0 0010E4B0 0006B0DF */  ld         $16, 0x600($sp)
/* E5B4 0010E4B4 F806BFC7 */  lwc1       $f31, 0x6F8($sp)
/* E5B8 0010E4B8 F006BEC7 */  lwc1       $f30, 0x6F0($sp)
/* E5BC 0010E4BC E806BDC7 */  lwc1       $f29, 0x6E8($sp)
/* E5C0 0010E4C0 E006BCC7 */  lwc1       $f28, 0x6E0($sp)
/* E5C4 0010E4C4 D806BBC7 */  lwc1       $f27, 0x6D8($sp)
/* E5C8 0010E4C8 D006BAC7 */  lwc1       $f26, 0x6D0($sp)
/* E5CC 0010E4CC C806B9C7 */  lwc1       $f25, 0x6C8($sp)
/* E5D0 0010E4D0 C006B8C7 */  lwc1       $f24, 0x6C0($sp)
/* E5D4 0010E4D4 B806B7C7 */  lwc1       $f23, 0x6B8($sp)
/* E5D8 0010E4D8 B006B6C7 */  lwc1       $f22, 0x6B0($sp)
/* E5DC 0010E4DC A806B5C7 */  lwc1       $f21, 0x6A8($sp)
/* E5E0 0010E4E0 A006B4C7 */  lwc1       $f20, 0x6A0($sp)
/* E5E4 0010E4E4 0800E003 */  jr         $31
/* E5E8 0010E4E8 0007BD27 */   addiu     $sp, $sp, 0x700
/* E5EC 0010E4EC 00000000 */  nop
