.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel __throw
/* E228 0010E128 10F9BD27 */  addiu      $sp, $sp, -0x6F0
/* E22C 0010E12C 2500033C */  lui        $3, (0x250384 >> 16)
/* E230 0010E130 7006BEFF */  sd         $fp, 0x670($sp)
/* E234 0010E134 8006BFFF */  sd         $31, 0x680($sp)
/* E238 0010E138 6006B7FF */  sd         $23, 0x660($sp)
/* E23C 0010E13C 5006B6FF */  sd         $22, 0x650($sp)
/* E240 0010E140 4006B5FF */  sd         $21, 0x640($sp)
/* E244 0010E144 3006B4FF */  sd         $20, 0x630($sp)
/* E248 0010E148 2006B3FF */  sd         $19, 0x620($sp)
/* E24C 0010E14C 1006B2FF */  sd         $18, 0x610($sp)
/* E250 0010E150 0006B1FF */  sd         $17, 0x600($sp)
/* E254 0010E154 F005B0FF */  sd         $16, 0x5F0($sp)
/* E258 0010E158 E806BFE7 */  swc1       $f31, 0x6E8($sp)
/* E25C 0010E15C E006BEE7 */  swc1       $f30, 0x6E0($sp)
/* E260 0010E160 D806BDE7 */  swc1       $f29, 0x6D8($sp)
/* E264 0010E164 D006BCE7 */  swc1       $f28, 0x6D0($sp)
/* E268 0010E168 C806BBE7 */  swc1       $f27, 0x6C8($sp)
/* E26C 0010E16C C006BAE7 */  swc1       $f26, 0x6C0($sp)
/* E270 0010E170 B806B9E7 */  swc1       $f25, 0x6B8($sp)
/* E274 0010E174 B006B8E7 */  swc1       $f24, 0x6B0($sp)
/* E278 0010E178 A806B7E7 */  swc1       $f23, 0x6A8($sp)
/* E27C 0010E17C A006B6E7 */  swc1       $f22, 0x6A0($sp)
/* E280 0010E180 9806B5E7 */  swc1       $f21, 0x698($sp)
/* E284 0010E184 9006B4E7 */  swc1       $f20, 0x690($sp)
/* E288 0010E188 8403628C */  lw         $2, (0x250384 & 0xFFFF)($3)
/* E28C 0010E18C 09F84000 */  jalr       $2
/* E290 0010E190 2DF0A003 */   daddu     $fp, $sp, $0
/* E294 0010E194 E405C2AF */  sw         $2, 0x5E4($fp)
/* E298 0010E198 F002C227 */  addiu      $2, $fp, 0x2F0
/* E29C 0010E19C E405C38F */  lw         $3, 0x5E4($fp)
/* E2A0 0010E1A0 E805C2AF */  sw         $2, 0x5E8($fp)
/* E2A4 0010E1A4 0800628C */  lw         $2, 0x8($3)
/* E2A8 0010E1A8 06004014 */  bnez       $2, .L0010E1C4
/* E2AC 0010E1AC E005DEAF */   sw        $fp, 0x5E0($fp)
/* E2B0 0010E1B0 6435040C */  jal        __terminate
/* E2B4 0010E1B4 00000000 */   nop
/* E2B8 0010E1B8 E005C527 */  addiu      $5, $fp, 0x5E0
/* E2BC 0010E1BC 03000010 */  b          .L0010E1CC
/* E2C0 0010E1C0 EC05C5AF */   sw        $5, 0x5EC($fp)
.L0010E1C4:
/* E2C4 0010E1C4 E005C627 */  addiu      $6, $fp, 0x5E0
/* E2C8 0010E1C8 EC05C6AF */  sw         $6, 0x5EC($fp)
.L0010E1CC:
/* E2CC 0010E1CC 1100073C */  lui        $7, %hi(.L0010E1CC)
/* E2D0 0010E1D0 E005C58F */  lw         $5, 0x5E0($fp)
/* E2D4 0010E1D4 D847040C */  jal        __frame_state_for
/* E2D8 0010E1D8 CCE1E424 */   addiu     $4, $7, %lo(.L0010E1CC)
/* E2DC 0010E1DC 2D184000 */  daddu      $3, $2, $0
/* E2E0 0010E1E0 04006014 */  bnez       $3, .L0010E1F4
/* E2E4 0010E1E4 E005C2AF */   sw        $2, 0x5E0($fp)
/* E2E8 0010E1E8 6435040C */  jal        __terminate
/* E2EC 0010E1EC 00000000 */   nop
/* E2F0 0010E1F0 E005C38F */  lw         $3, 0x5E0($fp)
.L0010E1F4:
/* E2F4 0010E1F4 F006C827 */  addiu      $8, $fp, 0x6F0
/* E2F8 0010E1F8 2D206000 */  daddu      $4, $3, $0
/* E2FC 0010E1FC 000068AC */  sw         $8, 0x0($3)
/* E300 0010E200 E0028324 */  addiu      $3, $4, 0x2E0
/* E304 0010E204 E805C28F */  lw         $2, 0x5E8($fp)
.L0010E208:
/* E308 0010E208 000085DC */  ld         $5, 0x0($4)
/* E30C 0010E20C 080086DC */  ld         $6, 0x8($4)
/* E310 0010E210 100087DC */  ld         $7, 0x10($4)
/* E314 0010E214 180088DC */  ld         $8, 0x18($4)
/* E318 0010E218 000045FC */  sd         $5, 0x0($2)
/* E31C 0010E21C 080046FC */  sd         $6, 0x8($2)
/* E320 0010E220 100047FC */  sd         $7, 0x10($2)
/* E324 0010E224 180048FC */  sd         $8, 0x18($2)
/* E328 0010E228 20008424 */  addiu      $4, $4, 0x20
/* E32C 0010E22C 20004224 */  addiu      $2, $2, 0x20
/* E330 0010E230 00000000 */  nop
/* E334 0010E234 F4FF8314 */  bne        $4, $3, .L0010E208
/* E338 0010E238 00000000 */   nop
/* E33C 0010E23C 000083DC */  ld         $3, 0x0($4)
/* E340 0010E240 080085DC */  ld         $5, 0x8($4)
/* E344 0010E244 000043FC */  sd         $3, 0x0($2)
/* E348 0010E248 080045FC */  sd         $5, 0x8($2)
/* E34C 0010E24C 8006C227 */  addiu      $2, $fp, 0x680
/* E350 0010E250 E405C48F */  lw         $4, 0x5E4($fp)
/* E354 0010E254 0000458C */  lw         $5, 0x0($2)
/* E358 0010E258 E805C68F */  lw         $6, 0x5E8($fp)
/* E35C 0010E25C EC05C78F */  lw         $7, 0x5EC($fp)
/* E360 0010E260 7E37040C */  jal        throw_helper
/* E364 0010E264 FFFFA524 */   addiu     $5, $5, -0x1
/* E368 0010E268 E005C68F */  lw         $6, 0x5E0($fp)
/* E36C 0010E26C 1100033C */  lui        $3, %hi(D_0010E298)
/* E370 0010E270 E805C88F */  lw         $8, 0x5E8($fp)
/* E374 0010E274 98E26524 */  addiu      $5, $3, %lo(D_0010E298)
/* E378 0010E278 0000C38C */  lw         $3, 0x0($6)
/* E37C 0010E27C 8006C427 */  addiu      $4, $fp, 0x680
/* E380 0010E280 0000078D */  lw         $7, 0x0($8)
/* E384 0010E284 000085AC */  sw         $5, 0x0($4)
/* E388 0010E288 2D204000 */  daddu      $4, $2, $0
/* E38C 0010E28C 23186700 */  subu       $3, $3, $7
/* E390 0010E290 03000010 */  b          .L0010E2A0
/* E394 0010E294 E405C28F */   lw        $2, 0x5E4($fp)
D_0010E298:
/* E398 0010E298 08008000 */  jr         $4
/* E39C 0010E29C 21E8A303 */   addu      $sp, $sp, $3
.L0010E2A0:
/* E3A0 0010E2A0 2DE8C003 */  daddu      $sp, $fp, $0
/* E3A4 0010E2A4 8006BFDF */  ld         $31, 0x680($sp)
/* E3A8 0010E2A8 7006BEDF */  ld         $fp, 0x670($sp)
/* E3AC 0010E2AC 6006B7DF */  ld         $23, 0x660($sp)
/* E3B0 0010E2B0 5006B6DF */  ld         $22, 0x650($sp)
/* E3B4 0010E2B4 4006B5DF */  ld         $21, 0x640($sp)
/* E3B8 0010E2B8 3006B4DF */  ld         $20, 0x630($sp)
/* E3BC 0010E2BC 2006B3DF */  ld         $19, 0x620($sp)
/* E3C0 0010E2C0 1006B2DF */  ld         $18, 0x610($sp)
/* E3C4 0010E2C4 0006B1DF */  ld         $17, 0x600($sp)
/* E3C8 0010E2C8 F005B0DF */  ld         $16, 0x5F0($sp)
/* E3CC 0010E2CC E806BFC7 */  lwc1       $f31, 0x6E8($sp)
/* E3D0 0010E2D0 E006BEC7 */  lwc1       $f30, 0x6E0($sp)
/* E3D4 0010E2D4 D806BDC7 */  lwc1       $f29, 0x6D8($sp)
/* E3D8 0010E2D8 D006BCC7 */  lwc1       $f28, 0x6D0($sp)
/* E3DC 0010E2DC C806BBC7 */  lwc1       $f27, 0x6C8($sp)
/* E3E0 0010E2E0 C006BAC7 */  lwc1       $f26, 0x6C0($sp)
/* E3E4 0010E2E4 B806B9C7 */  lwc1       $f25, 0x6B8($sp)
/* E3E8 0010E2E8 B006B8C7 */  lwc1       $f24, 0x6B0($sp)
/* E3EC 0010E2EC A806B7C7 */  lwc1       $f23, 0x6A8($sp)
/* E3F0 0010E2F0 A006B6C7 */  lwc1       $f22, 0x6A0($sp)
/* E3F4 0010E2F4 9806B5C7 */  lwc1       $f21, 0x698($sp)
/* E3F8 0010E2F8 9006B4C7 */  lwc1       $f20, 0x690($sp)
/* E3FC 0010E2FC 0800E003 */  jr         $31
/* E400 0010E300 F006BD27 */   addiu     $sp, $sp, 0x6F0
/* E404 0010E304 00000000 */  nop
