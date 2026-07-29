.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtLoadMonstor__Fi
/* 00D630 01DB9330 C0FFBD27 */  addiu       $29, $29, -0x40
/* 00D634 01DB9334 3000BF7F */  sq          $31, 0x30($29)
/* 00D638 01DB9338 2000B27F */  sq          $18, 0x20($29)
/* 00D63C 01DB933C 1000B17F */  sq          $17, 0x10($29)
/* 00D640 01DB9340 0000B07F */  sq          $16, 0x0($29)
/* 00D644 01DB9344 288E8070 */  paddub      $17, $4, $0
/* 00D648 01DB9348 F001013C */  lui         $1, %hi(MonstorModelBuffer + 0x8)
/* 00D64C 01DB934C D86620AC */  sw          $0, %lo(MonstorModelBuffer + 0x8)($1)
/* 00D650 01DB9350 C49C858F */  lw          $5, -0x633C($28)
/* 00D654 01DB9354 E09C848F */  lw          $4, -0x6320($28)
/* 00D658 01DB9358 480080AC */  sw          $0, 0x48($4)
/* 00D65C 01DB935C 900080AC */  sw          $0, 0x90($4)
/* 00D660 01DB9360 28360070 */  paddub      $6, $0, $0
/* 00D664 01DB9364 09000010 */  b           .L01DB938C_2F498C
/* 00D668 01DB9368 00000000 */   nop
.L01DB936C_2F496C:
/* 00D66C 01DB936C 00190600 */  sll         $3, $6, 4
/* 00D670 01DB9370 F001023C */  lui         $2, %hi(MonstorScriptBuffer)
/* 00D674 01DB9374 E0664224 */  addiu       $2, $2, %lo(MonstorScriptBuffer)
/* 00D678 01DB9378 21184300 */  addu        $3, $2, $3
/* 00D67C 01DB937C 80100600 */  sll         $2, $6, 2
/* 00D680 01DB9380 21108200 */  addu        $2, $4, $2
/* 00D684 01DB9384 000043AC */  sw          $3, 0x0($2)
/* 00D688 01DB9388 0100C624 */  addiu       $6, $6, 0x1
.L01DB938C_2F498C:
/* 00D68C 01DB938C 1000C228 */  slti        $2, $6, 0x10
/* 00D690 01DB9390 F6FF4014 */  bnez        $2, .L01DB936C_2F496C
/* 00D694 01DB9394 00000000 */   nop
/* 00D698 01DB9398 FFFF0224 */  addiu       $2, $0, -0x1
/* 00D69C 01DB939C 940082AC */  sw          $2, 0x94($4)
/* 00D6A0 01DB93A0 7C7E070C */  jal         CleanViewMonstor__12CMonstorUnitFi
/* 00D6A4 01DB93A4 00000000 */   nop
/* 00D6A8 01DB93A8 E899070C */  jal         BtSetEventExtendTable__Fv
/* 00D6AC 01DB93AC 00000000 */   nop
/* 00D6B0 01DB93B0 28860070 */  paddub      $16, $0, $0
/* 00D6B4 01DB93B4 0C000010 */  b           .L01DB93E8_2F49E8
/* 00D6B8 01DB93B8 00000000 */   nop
.L01DB93BC_2F49BC:
/* 00D6BC 01DB93BC 80101000 */  sll         $2, $16, 2
/* 00D6C0 01DB93C0 21105000 */  addu        $2, $2, $16
/* 00D6C4 01DB93C4 40100200 */  sll         $2, $2, 1
/* 00D6C8 01DB93C8 21105000 */  addu        $2, $2, $16
/* 00D6CC 01DB93CC C0180200 */  sll         $3, $2, 3
/* 00D6D0 01DB93D0 D901023C */  lui         $2, %hi(MonsterTexAnim)
/* 00D6D4 01DB93D4 808C4224 */  addiu       $2, $2, %lo(MonsterTexAnim)
/* 00D6D8 01DB93D8 21204300 */  addu        $4, $2, $3
/* 00D6DC 01DB93DC 349C050C */  jal         Initialize__13CTexAnimeDataFv
/* 00D6E0 01DB93E0 00000000 */   nop
/* 00D6E4 01DB93E4 01001026 */  addiu       $16, $16, 0x1
.L01DB93E8_2F49E8:
/* 00D6E8 01DB93E8 4001022A */  slti        $2, $16, 0x140
/* 00D6EC 01DB93EC F3FF4014 */  bnez        $2, .L01DB93BC_2F49BC
/* 00D6F0 01DB93F0 00000000 */   nop
/* 00D6F4 01DB93F4 C701023C */  lui         $2, %hi(TexManager)
/* 00D6F8 01DB93F8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00D6FC 01DB93FC 2A000524 */  addiu       $5, $0, 0x2A
/* 00D700 01DB9400 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00D704 01DB9404 00000000 */   nop
/* 00D708 01DB9408 C701023C */  lui         $2, %hi(TexManager)
/* 00D70C 01DB940C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00D710 01DB9410 26000524 */  addiu       $5, $0, 0x26
/* 00D714 01DB9414 C0CD040C */  jal         DeleteTextureBlock__15CTextureManagerFi
/* 00D718 01DB9418 00000000 */   nop
/* 00D71C 01DB941C C701023C */  lui         $2, %hi(TexManager)
/* 00D720 01DB9420 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00D724 01DB9424 FCCD040C */  jal         CleanUpBuffer__15CTextureManagerFv
/* 00D728 01DB9428 00000000 */   nop
/* 00D72C 01DB942C C701023C */  lui         $2, %hi(TexManager)
/* 00D730 01DB9430 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00D734 01DB9434 98CE040C */  jal         CleanUpTextureList__15CTextureManagerFv
/* 00D738 01DB9438 00000000 */   nop
/* 00D73C 01DB943C DC01023C */  lui         $2, %hi(LIT_4974)
/* 00D740 01DB9440 C0304424 */  addiu       $4, $2, %lo(LIT_4974)
/* 00D744 01DB9444 948B858F */  lw          $5, -0x746C($28)
/* 00D748 01DB9448 28360070 */  paddub      $6, $0, $0
/* 00D74C 01DB944C D8FC040C */  jal         LoadFile__FPcPvPi
/* 00D750 01DB9450 00000000 */   nop
/* 00D754 01DB9454 DC4F050C */  jal         wait_now_loading_vsync__Fv
/* 00D758 01DB9458 00000000 */   nop
/* 00D75C 01DB945C 948B848F */  lw          $4, -0x746C($28)
/* 00D760 01DB9460 F001023C */  lui         $2, %hi(MonstorModelBuffer)
/* 00D764 01DB9464 D0664524 */  addiu       $5, $2, %lo(MonstorModelBuffer)
/* 00D768 01DB9468 DC9B040C */  jal         LoadCollisionFile__FPUiP14CDataAlloc2_1_
/* 00D76C 01DB946C 00000000 */   nop
/* 00D770 01DB9470 E09C838F */  lw          $3, -0x6320($28)
/* 00D774 01DB9474 400062AC */  sw          $2, 0x40($3)
/* 00D778 01DB9478 E89D928F */  lw          $18, -0x6218($28)
/* 00D77C 01DB947C 28860070 */  paddub      $16, $0, $0
/* 00D780 01DB9480 07000010 */  b           .L01DB94A0_2F4AA0
/* 00D784 01DB9484 00000000 */   nop
.L01DB9488_2F4A88:
/* 00D788 01DB9488 60A10234 */  ori         $2, $0, 0xA160
/* 00D78C 01DB948C 18100202 */  mult        $2, $16, $2
/* 00D790 01DB9490 21204202 */  addu        $4, $18, $2
/* 00D794 01DB9494 10B9060C */  jal         Initialize__12CSHOT_EFFECTFv
/* 00D798 01DB9498 00000000 */   nop
/* 00D79C 01DB949C 01001026 */  addiu       $16, $16, 0x1
.L01DB94A0_2F4AA0:
/* 00D7A0 01DB94A0 0500022A */  slti        $2, $16, 0x5
/* 00D7A4 01DB94A4 F8FF4014 */  bnez        $2, .L01DB9488_2F4A88
/* 00D7A8 01DB94A8 00000000 */   nop
/* 00D7AC 01DB94AC 28860070 */  paddub      $16, $0, $0
/* 00D7B0 01DB94B0 09002016 */  bnez        $17, .L01DB94D8_2F4AD8
/* 00D7B4 01DB94B4 00000000 */   nop
/* 00D7B8 01DB94B8 A49D828F */  lw          $2, -0x625C($28)
/* 00D7BC 01DB94BC 80180200 */  sll         $3, $2, 2
/* 00D7C0 01DB94C0 2900023C */  lui         $2, %hi(BtEnemyLayoutList)
/* 00D7C4 01DB94C4 B0174224 */  addiu       $2, $2, %lo(BtEnemyLayoutList)
/* 00D7C8 01DB94C8 21104300 */  addu        $2, $2, $3
/* 00D7CC 01DB94CC 0000518C */  lw          $17, 0x0($2)
/* 00D7D0 01DB94D0 08000010 */  b           .L01DB94F4_2F4AF4
/* 00D7D4 01DB94D4 00000000 */   nop
.L01DB94D8_2F4AD8:
/* 00D7D8 01DB94D8 A49D828F */  lw          $2, -0x625C($28)
/* 00D7DC 01DB94DC 80180200 */  sll         $3, $2, 2
/* 00D7E0 01DB94E0 2900023C */  lui         $2, %hi(BtUraEnemyLayoutList)
/* 00D7E4 01DB94E4 D0174224 */  addiu       $2, $2, %lo(BtUraEnemyLayoutList)
/* 00D7E8 01DB94E8 21104300 */  addu        $2, $2, $3
/* 00D7EC 01DB94EC 0000518C */  lw          $17, 0x0($2)
/* 00D7F0 01DB94F0 00000000 */  nop
.L01DB94F4_2F4AF4:
/* 00D7F4 01DB94F4 789C828F */  lw          $2, -0x6388($28)
/* 00D7F8 01DB94F8 02004380 */  lb          $3, 0x2($2)
/* 00D7FC 01DB94FC C0100300 */  sll         $2, $3, 3
/* 00D800 01DB9500 23104300 */  subu        $2, $2, $3
/* 00D804 01DB9504 00110200 */  sll         $2, $2, 4
/* 00D808 01DB9508 21882202 */  addu        $17, $17, $2
/* 00D80C 01DB950C 28960070 */  paddub      $18, $0, $0
/* 00D810 01DB9510 12000010 */  b           .L01DB955C_2F4B5C
/* 00D814 01DB9514 00000000 */   nop
.L01DB9518_2F4B18:
/* 00D818 01DB9518 40101200 */  sll         $2, $18, 1
/* 00D81C 01DB951C 21105200 */  addu        $2, $2, $18
/* 00D820 01DB9520 80100200 */  sll         $2, $2, 2
/* 00D824 01DB9524 21105100 */  addu        $2, $2, $17
/* 00D828 01DB9528 0400468C */  lw          $6, 0x4($2)
/* 00D82C 01DB952C FFFF0224 */  addiu       $2, $0, -0x1
/* 00D830 01DB9530 0D00C210 */  beq         $6, $2, .L01DB9568_2F4B68
/* 00D834 01DB9534 00000000 */   nop
/* 00D838 01DB9538 E09C848F */  lw          $4, -0x6320($28)
/* 00D83C 01DB953C 282E0072 */  paddub      $5, $16, $0
/* 00D840 01DB9540 26000724 */  addiu       $7, $0, 0x26
/* 00D844 01DB9544 F001023C */  lui         $2, %hi(MonstorModelBuffer)
/* 00D848 01DB9548 D0664824 */  addiu       $8, $2, %lo(MonstorModelBuffer)
/* 00D84C 01DB954C A47F070C */  jal         SetupBaseModel__12CMonstorUnitFiiiP14CDataAlloc2_1_
/* 00D850 01DB9550 00000000 */   nop
/* 00D854 01DB9554 21800202 */  addu        $16, $16, $2
/* 00D858 01DB9558 01005226 */  addiu       $18, $18, 0x1
.L01DB955C_2F4B5C:
/* 00D85C 01DB955C 0900422A */  slti        $2, $18, 0x9
/* 00D860 01DB9560 EDFF4014 */  bnez        $2, .L01DB9518_2F4B18
/* 00D864 01DB9564 00000000 */   nop
.L01DB9568_2F4B68:
/* 00D868 01DB9568 1CB0760C */  jal         MemoryMapDump__Fv
/* 00D86C 01DB956C 00000000 */   nop
/* 00D870 01DB9570 3000BF7B */  lq          $31, 0x30($29)
/* 00D874 01DB9574 2000B27B */  lq          $18, 0x20($29)
/* 00D878 01DB9578 1000B17B */  lq          $17, 0x10($29)
/* 00D87C 01DB957C 0000B07B */  lq          $16, 0x0($29)
/* 00D880 01DB9580 4000BD27 */  addiu       $29, $29, 0x40
/* 00D884 01DB9584 0800E003 */  jr          $31
/* 00D888 01DB9588 00000000 */   nop
/* 00D88C 01DB958C 00000000 */  nop
