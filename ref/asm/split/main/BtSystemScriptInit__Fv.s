.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtSystemScriptInit__Fv
/* 0BB410 001BB310 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0BB414 001BB314 0000BF7F */  sq          $31, 0x0($29)
/* 0BB418 001BB318 01000224 */  addiu       $2, $0, 0x1
/* 0BB41C 001BB31C 189E82AF */  sw          $2, -0x61E8($28)
/* 0BB420 001BB320 8C9C82AF */  sw          $2, -0x6374($28)
/* 0BB424 001BB324 A89C848F */  lw          $4, -0x6358($28)
/* 0BB428 001BB328 1000A527 */  addiu       $5, $29, 0x10
/* 0BB42C 001BB32C 9C91040C */  jal         GetPos__7CCameraFPf
/* 0BB430 001BB330 00000000 */   nop
/* 0BB434 001BB334 A89C848F */  lw          $4, -0x6358($28)
/* 0BB438 001BB338 2000A527 */  addiu       $5, $29, 0x20
/* 0BB43C 001BB33C A891040C */  jal         GetRef__7CCameraFPf
/* 0BB440 001BB340 00000000 */   nop
/* 0BB444 001BB344 DC01023C */  lui         $2, %hi(SubCamera)
/* 0BB448 001BB348 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 0BB44C 001BB34C C492040C */  jal         FollowOff__13CCameraFollowFv
/* 0BB450 001BB350 00000000 */   nop
/* 0BB454 001BB354 DC01023C */  lui         $2, %hi(SubCamera)
/* 0BB458 001BB358 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 0BB45C 001BB35C 1000A527 */  addiu       $5, $29, 0x10
/* 0BB460 001BB360 A490040C */  jal         SetPos__7CCameraFPf
/* 0BB464 001BB364 00000000 */   nop
/* 0BB468 001BB368 DC01023C */  lui         $2, %hi(SubCamera)
/* 0BB46C 001BB36C E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 0BB470 001BB370 2000A527 */  addiu       $5, $29, 0x20
/* 0BB474 001BB374 C490040C */  jal         SetRef__7CCameraFPf
/* 0BB478 001BB378 00000000 */   nop
/* 0BB47C 001BB37C DC01023C */  lui         $2, %hi(SubCamera)
/* 0BB480 001BB380 E0484424 */  addiu       $4, $2, %lo(SubCamera)
/* 0BB484 001BB384 FFFF0524 */  addiu       $5, $0, -0x1
/* 0BB488 001BB388 F491040C */  jal         Step__13CCameraFollowFi
/* 0BB48C 001BB38C 00000000 */   nop
/* 0BB490 001BB390 DC01023C */  lui         $2, %hi(SubCamera)
/* 0BB494 001BB394 E0484224 */  addiu       $2, $2, %lo(SubCamera)
/* 0BB498 001BB398 A89C82AF */  sw          $2, -0x6358($28)
/* 0BB49C 001BB39C A89C848F */  lw          $4, -0x6358($28)
/* 0BB4A0 001BB3A0 C492040C */  jal         FollowOff__13CCameraFollowFv
/* 0BB4A4 001BB3A4 00000000 */   nop
/* 0BB4A8 001BB3A8 789C838F */  lw          $3, -0x6388($28)
/* 0BB4AC 001BB3AC 01000224 */  addiu       $2, $0, 0x1
/* 0BB4B0 001BB3B0 0100013C */  lui         $1, (0x10000 >> 16)
/* 0BB4B4 001BB3B4 21086100 */  addu        $1, $3, $1
/* 0BB4B8 001BB3B8 0C8B22AC */  sw          $2, -0x74F4($1)
/* 0BB4BC 001BB3BC 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0BB4C0 001BB3C0 D401013C */  lui         $1, %hi(EdEventInfo + 0x3C)
/* 0BB4C4 001BB3C4 0CD222AC */  sw          $2, %lo(EdEventInfo + 0x3C)($1)
/* 0BB4C8 001BB3C8 A89C828F */  lw          $2, -0x6358($28)
/* 0BB4CC 001BB3CC D401013C */  lui         $1, %hi(EdEventInfo + 0x40)
/* 0BB4D0 001BB3D0 10D222AC */  sw          $2, %lo(EdEventInfo + 0x40)($1)
/* 0BB4D4 001BB3D4 EA01023C */  lui         $2, %hi(CharaMain)
/* 0BB4D8 001BB3D8 201D4224 */  addiu       $2, $2, %lo(CharaMain)
/* 0BB4DC 001BB3DC D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 0BB4E0 001BB3E0 1CD222AC */  sw          $2, %lo(EdEventInfo + 0x4C)($1)
/* 0BB4E4 001BB3E4 28260070 */  paddub      $4, $0, $0
/* 0BB4E8 001BB3E8 0B000010 */  b           .L001BB418
/* 0BB4EC 001BB3EC 00000000 */   nop
.L001BB3F0:
/* 0BB4F0 001BB3F0 40110400 */  sll         $2, $4, 5
/* 0BB4F4 001BB3F4 21184400 */  addu        $3, $2, $4
/* 0BB4F8 001BB3F8 80100300 */  sll         $2, $3, 2
/* 0BB4FC 001BB3FC 21106200 */  addu        $2, $3, $2
/* 0BB500 001BB400 40190200 */  sll         $3, $2, 5
/* 0BB504 001BB404 EB01023C */  lui         $2, %hi(NPCUnit + 0xBC)
/* 0BB508 001BB408 1C854224 */  addiu       $2, $2, %lo(NPCUnit + 0xBC)
/* 0BB50C 001BB40C 21104300 */  addu        $2, $2, $3
/* 0BB510 001BB410 000040AC */  sw          $0, 0x0($2)
/* 0BB514 001BB414 01008424 */  addiu       $4, $4, 0x1
.L001BB418:
/* 0BB518 001BB418 06008228 */  slti        $2, $4, 0x6
/* 0BB51C 001BB41C F4FF4014 */  bnez        $2, .L001BB3F0
/* 0BB520 001BB420 00000000 */   nop
/* 0BB524 001BB424 EB01023C */  lui         $2, %hi(NPCUnit)
/* 0BB528 001BB428 60844224 */  addiu       $2, $2, %lo(NPCUnit)
/* 0BB52C 001BB42C D401013C */  lui         $1, %hi(EdEventInfo + 0x58)
/* 0BB530 001BB430 28D222AC */  sw          $2, %lo(EdEventInfo + 0x58)($1)
/* 0BB534 001BB434 20000224 */  addiu       $2, $0, 0x20
/* 0BB538 001BB438 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F4)
/* 0BB53C 001BB43C C4D322AC */  sw          $2, %lo(EdEventInfo + 0x1F4)($1)
/* 0BB540 001BB440 11000224 */  addiu       $2, $0, 0x11
/* 0BB544 001BB444 D401013C */  lui         $1, %hi(EdEventInfo + 0x70)
/* 0BB548 001BB448 40D222AC */  sw          $2, %lo(EdEventInfo + 0x70)($1)
/* 0BB54C 001BB44C 06000224 */  addiu       $2, $0, 0x6
/* 0BB550 001BB450 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F8)
/* 0BB554 001BB454 C8D322AC */  sw          $2, %lo(EdEventInfo + 0x1F8)($1)
/* 0BB558 001BB458 D401013C */  lui         $1, %hi(EdEventInfo + 0x1FC)
/* 0BB55C 001BB45C CCD320AC */  sw          $0, %lo(EdEventInfo + 0x1FC)($1)
/* 0BB560 001BB460 28260070 */  paddub      $4, $0, $0
/* 0BB564 001BB464 07000010 */  b           .L001BB484
/* 0BB568 001BB468 00000000 */   nop
.L001BB46C:
/* 0BB56C 001BB46C 80180400 */  sll         $3, $4, 2
/* 0BB570 001BB470 D401023C */  lui         $2, %hi(EdEventInfo + 0x200)
/* 0BB574 001BB474 D0D34224 */  addiu       $2, $2, %lo(EdEventInfo + 0x200)
/* 0BB578 001BB478 21104300 */  addu        $2, $2, $3
/* 0BB57C 001BB47C 000040AC */  sw          $0, 0x0($2)
/* 0BB580 001BB480 01008424 */  addiu       $4, $4, 0x1
.L001BB484:
/* 0BB584 001BB484 08008228 */  slti        $2, $4, 0x8
/* 0BB588 001BB488 F8FF4014 */  bnez        $2, .L001BB46C
/* 0BB58C 001BB48C 00000000 */   nop
/* 0BB590 001BB490 EC01023C */  lui         $2, %hi(BtEventMes0)
/* 0BB594 001BB494 60AB4224 */  addiu       $2, $2, %lo(BtEventMes0)
/* 0BB598 001BB498 D401013C */  lui         $1, %hi(EdEventInfo + 0x204)
/* 0BB59C 001BB49C D4D322AC */  sw          $2, %lo(EdEventInfo + 0x204)($1)
/* 0BB5A0 001BB4A0 EC01023C */  lui         $2, %hi(BtEventMes1)
/* 0BB5A4 001BB4A4 20C34224 */  addiu       $2, $2, %lo(BtEventMes1)
/* 0BB5A8 001BB4A8 D401013C */  lui         $1, %hi(EdEventInfo + 0x208)
/* 0BB5AC 001BB4AC D8D322AC */  sw          $2, %lo(EdEventInfo + 0x208)($1)
/* 0BB5B0 001BB4B0 1C8D848F */  lw          $4, -0x72E4($28)
/* 0BB5B4 001BB4B4 CC5E050C */  jal         GetConfigData__9CSaveDataFv
/* 0BB5B8 001BB4B8 00000000 */   nop
/* 0BB5BC 001BB4BC 1000438C */  lw          $3, 0x10($2)
/* 0BB5C0 001BB4C0 04006010 */  beqz        $3, .L001BB4D4
/* 0BB5C4 001BB4C4 00000000 */   nop
/* 0BB5C8 001BB4C8 A08080C7 */  lwc1        $f0, -0x7F60($28)
/* 0BB5CC 001BB4CC 03000010 */  b           .L001BB4DC
/* 0BB5D0 001BB4D0 00000000 */   nop
.L001BB4D4:
/* 0BB5D4 001BB4D4 7C8080C7 */  lwc1        $f0, -0x7F84($28)
/* 0BB5D8 001BB4D8 00000000 */  nop
.L001BB4DC:
/* 0BB5DC 001BB4DC D401013C */  lui         $1, %hi(EdEventInfo + 0x204)
/* 0BB5E0 001BB4E0 D4D3238C */  lw          $3, %lo(EdEventInfo + 0x204)($1)
/* 0BB5E4 001BB4E4 A40060E4 */  swc1        $f0, 0xA4($3)
/* 0BB5E8 001BB4E8 D401013C */  lui         $1, %hi(EdEventInfo + 0x208)
/* 0BB5EC 001BB4EC D8D3238C */  lw          $3, %lo(EdEventInfo + 0x208)($1)
/* 0BB5F0 001BB4F0 A40060E4 */  swc1        $f0, 0xA4($3)
/* 0BB5F4 001BB4F4 D401013C */  lui         $1, %hi(EdEventInfo + 0x204)
/* 0BB5F8 001BB4F8 D4D3238C */  lw          $3, %lo(EdEventInfo + 0x204)($1)
/* 0BB5FC 001BB4FC A80060E4 */  swc1        $f0, 0xA8($3)
/* 0BB600 001BB500 D401013C */  lui         $1, %hi(EdEventInfo + 0x208)
/* 0BB604 001BB504 D8D3238C */  lw          $3, %lo(EdEventInfo + 0x208)($1)
/* 0BB608 001BB508 A80060E4 */  swc1        $f0, 0xA8($3)
/* 0BB60C 001BB50C D501013C */  lui         $1, %hi(BtEventInfo + 0x90)
/* 0BB610 001BB510 D067238C */  lw          $3, %lo(BtEventInfo + 0x90)($1)
/* 0BB614 001BB514 03006010 */  beqz        $3, .L001BB524
/* 0BB618 001BB518 00000000 */   nop
/* 0BB61C 001BB51C B425060C */  jal         EdFadeInit__Fv
/* 0BB620 001BB520 00000000 */   nop
.L001BB524:
/* 0BB624 001BB524 01000324 */  addiu       $3, $0, 0x1
/* 0BB628 001BB528 D501013C */  lui         $1, %hi(BtEventInfo + 0x90)
/* 0BB62C 001BB52C D06723AC */  sw          $3, %lo(BtEventInfo + 0x90)($1)
/* 0BB630 001BB530 28260070 */  paddub      $4, $0, $0
/* 0BB634 001BB534 0D000010 */  b           .L001BB56C
/* 0BB638 001BB538 00000000 */   nop
.L001BB53C:
/* 0BB63C 001BB53C 40180400 */  sll         $3, $4, 1
/* 0BB640 001BB540 21186400 */  addu        $3, $3, $4
/* 0BB644 001BB544 80280300 */  sll         $5, $3, 2
/* 0BB648 001BB548 D501033C */  lui         $3, %hi(BtObjHdl)
/* 0BB64C 001BB54C 00686324 */  addiu       $3, $3, %lo(BtObjHdl)
/* 0BB650 001BB550 21186500 */  addu        $3, $3, $5
/* 0BB654 001BB554 000060AC */  sw          $0, 0x0($3)
/* 0BB658 001BB558 D501033C */  lui         $3, %hi(BtObjHdl + 0x4)
/* 0BB65C 001BB55C 04686324 */  addiu       $3, $3, %lo(BtObjHdl + 0x4)
/* 0BB660 001BB560 21186500 */  addu        $3, $3, $5
/* 0BB664 001BB564 000060AC */  sw          $0, 0x0($3)
/* 0BB668 001BB568 01008424 */  addiu       $4, $4, 0x1
.L001BB56C:
/* 0BB66C 001BB56C 20008328 */  slti        $3, $4, 0x20
/* 0BB670 001BB570 F2FF6014 */  bnez        $3, .L001BB53C
/* 0BB674 001BB574 00000000 */   nop
/* 0BB678 001BB578 D501013C */  lui         $1, %hi(BtEventInfo + 0x38)
/* 0BB67C 001BB57C 786720AC */  sw          $0, %lo(BtEventInfo + 0x38)($1)
/* 0BB680 001BB580 D501013C */  lui         $1, %hi(BtEventInfo + 0x8C)
/* 0BB684 001BB584 CC6720AC */  sw          $0, %lo(BtEventInfo + 0x8C)($1)
/* 0BB688 001BB588 D501013C */  lui         $1, %hi(BtEventInfo + 0xB0)
/* 0BB68C 001BB58C F06720AC */  sw          $0, %lo(BtEventInfo + 0xB0)($1)
/* 0BB690 001BB590 DC01013C */  lui         $1, %hi(BtActStatus + 0xC)
/* 0BB694 001BB594 8C4420AC */  sw          $0, %lo(BtActStatus + 0xC)($1)
/* 0BB698 001BB598 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BB69C 001BB59C DC01013C */  lui         $1, %hi(BtActStatus + 0x4)
/* 0BB6A0 001BB5A0 844423AC */  sw          $3, %lo(BtActStatus + 0x4)($1)
/* 0BB6A4 001BB5A4 DC01013C */  lui         $1, %hi(BtActStatus + 0x8)
/* 0BB6A8 001BB5A8 884423AC */  sw          $3, %lo(BtActStatus + 0x8)($1)
/* 0BB6AC 001BB5AC DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 0BB6B0 001BB5B0 944420AC */  sw          $0, %lo(BtActStatus + 0x14)($1)
/* 0BB6B4 001BB5B4 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 0BB6B8 001BB5B8 904420AC */  sw          $0, %lo(BtActStatus + 0x10)($1)
/* 0BB6BC 001BB5BC DC01013C */  lui         $1, %hi(BtActStatus + 0x28)
/* 0BB6C0 001BB5C0 A84420AC */  sw          $0, %lo(BtActStatus + 0x28)($1)
/* 0BB6C4 001BB5C4 0000BF7B */  lq          $31, 0x0($29)
/* 0BB6C8 001BB5C8 3000BD27 */  addiu       $29, $29, 0x30
/* 0BB6CC 001BB5CC 0800E003 */  jr          $31
/* 0BB6D0 001BB5D0 00000000 */   nop
/* 0BB6D4 001BB5D4 00000000 */  nop
/* 0BB6D8 001BB5D8 00000000 */  nop
/* 0BB6DC 001BB5DC 00000000 */  nop
