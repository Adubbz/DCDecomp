.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadEditMapData__FP13EDIT_MAP_INFOPci
/* 74490 00174390 FEFF013C */  lui        $at, (0xFFFEFC60 >> 16)
/* 74494 00174394 60FC2134 */  ori        $at, $at, (0xFFFEFC60 & 0xFFFF)
/* 74498 00174398 21E8A103 */  addu       $sp, $sp, $at
/* 7449C 0017439C 7000BF7F */  sq         $31, 0x70($sp)
/* 744A0 001743A0 6000B67F */  sq         $22, 0x60($sp)
/* 744A4 001743A4 5000B57F */  sq         $21, 0x50($sp)
/* 744A8 001743A8 4000B47F */  sq         $20, 0x40($sp)
/* 744AC 001743AC 3000B37F */  sq         $19, 0x30($sp)
/* 744B0 001743B0 2000B27F */  sq         $18, 0x20($sp)
/* 744B4 001743B4 1000B17F */  sq         $17, 0x10($sp)
/* 744B8 001743B8 0000B07F */  sq         $16, 0x0($sp)
/* 744BC 001743BC 2886A070 */  paddub     $16, $5, $0
/* 744C0 001743C0 28AEC070 */  paddub     $21, $6, $0
/* 744C4 001743C4 C08F84AF */  sw         $4, -0x7040($gp)
/* 744C8 001743C8 288E0072 */  paddub     $17, $16, $0
/* 744CC 001743CC 0A000010 */  b          .L001743F8
/* 744D0 001743D0 00000000 */   nop
.L001743D4:
/* 744D4 001743D4 3C1E0200 */  dsll32     $3, $2, 24
/* 744D8 001743D8 3F1E0300 */  dsra32     $3, $3, 24
/* 744DC 001743DC 2E000224 */  addiu      $2, $0, 0x2E
/* 744E0 001743E0 04006214 */  bne        $3, $2, .L001743F4
/* 744E4 001743E4 00000000 */   nop
/* 744E8 001743E8 01003126 */  addiu      $17, $17, 0x1
/* 744EC 001743EC 05000010 */  b          .L00174404
/* 744F0 001743F0 00000000 */   nop
.L001743F4:
/* 744F4 001743F4 01003126 */  addiu      $17, $17, 0x1
.L001743F8:
/* 744F8 001743F8 00002282 */  lb         $2, 0x0($17)
/* 744FC 001743FC F5FF4014 */  bnez       $2, .L001743D4
/* 74500 00174400 00000000 */   nop
.L00174404:
/* 74504 00174404 948B858F */  lw         $5, -0x746C($gp)
/* 74508 00174408 28260072 */  paddub     $4, $16, $0
/* 7450C 0017440C 8C00A627 */  addiu      $6, $sp, 0x8C
/* 74510 00174410 283E0070 */  paddub     $7, $0, $0
/* 74514 00174414 F4FC040C */  jal        LoadFile2__FPcPvPii
/* 74518 00174418 00000000 */   nop
/* 7451C 0017441C 08004014 */  bnez       $2, .L00174440
/* 74520 00174420 00000000 */   nop
/* 74524 00174424 67000224 */  addiu      $2, $0, 0x67
/* 74528 00174428 020022A2 */  sb         $2, 0x2($17)
/* 7452C 0017442C 948B858F */  lw         $5, -0x746C($gp)
/* 74530 00174430 28260072 */  paddub     $4, $16, $0
/* 74534 00174434 8C00A627 */  addiu      $6, $sp, 0x8C
/* 74538 00174438 D8FC040C */  jal        LoadFile__FPcPvPi
/* 7453C 0017443C 00000000 */   nop
.L00174440:
/* 74540 00174440 948B928F */  lw         $18, -0x746C($gp)
/* 74544 00174444 9000B027 */  addiu      $16, $sp, 0x90
/* 74548 00174448 D48F80AF */  sw         $0, -0x702C($gp)
/* 7454C 0017444C D201013C */  lui        $at, (0x1D20000 >> 16)
/* 74550 00174450 F09A20A0 */  sb         $0, -0x6510($at)
/* 74554 00174454 109080AF */  sw         $0, -0x6FF0($gp)
/* 74558 00174458 78D0050C */  jal        InitInfo__Fv
/* 7455C 0017445C 00000000 */   nop
/* 74560 00174460 C48F80AF */  sw         $0, -0x703C($gp)
/* 74564 00174464 C88F80AF */  sw         $0, -0x7038($gp)
/* 74568 00174468 CC8F80AF */  sw         $0, -0x7034($gp)
/* 7456C 0017446C 01000224 */  addiu      $2, $0, 0x1
/* 74570 00174470 D08F82AF */  sw         $2, -0x7030($gp)
/* 74574 00174474 D88F82AF */  sw         $2, -0x7028($gp)
/* 74578 00174478 DC8F82AF */  sw         $2, -0x7024($gp)
/* 7457C 0017447C E08F82AF */  sw         $2, -0x7020($gp)
/* 74580 00174480 E48F82AF */  sw         $2, -0x701C($gp)
/* 74584 00174484 E88F80AF */  sw         $0, -0x7018($gp)
/* 74588 00174488 F08F80AF */  sw         $0, -0x7010($gp)
/* 7458C 0017448C F88F80AF */  sw         $0, -0x7008($gp)
/* 74590 00174490 FC8F80AF */  sw         $0, -0x7004($gp)
/* 74594 00174494 089080AF */  sw         $0, -0x6FF8($gp)
/* 74598 00174498 FFFF0224 */  addiu      $2, $0, -0x1
/* 7459C 0017449C 0C9082AF */  sw         $2, -0x6FF4($gp)
/* 745A0 001744A0 EC8F80AF */  sw         $0, -0x7014($gp)
/* 745A4 001744A4 D201013C */  lui        $at, (0x1D20000 >> 16)
/* 745A8 001744A8 309B20A0 */  sb         $0, -0x64D0($at)
/* 745AC 001744AC F48F80AF */  sw         $0, -0x700C($gp)
/* 745B0 001744B0 049080AF */  sw         $0, -0x6FFC($gp)
/* 745B4 001744B4 149080AF */  sw         $0, -0x6FEC($gp)
/* 745B8 001744B8 189080AF */  sw         $0, -0x6FE8($gp)
/* 745BC 001744BC C08F848F */  lw         $4, -0x7040($gp)
/* 745C0 001744C0 2A00023C */  lui        $2, %hi(_478)
/* 745C4 001744C4 C8A74524 */  addiu      $5, $2, %lo(_478)
/* 745C8 001744C8 5A15040C */  jal        strcpy
/* 745CC 001744CC 00000000 */   nop
/* 745D0 001744D0 01000324 */  addiu      $3, $0, 0x1
/* 745D4 001744D4 C08F828F */  lw         $2, -0x7040($gp)
/* 745D8 001744D8 E01B43AC */  sw         $3, 0x1BE0($2)
/* 745DC 001744DC C08F828F */  lw         $2, -0x7040($gp)
/* 745E0 001744E0 E41B40AC */  sw         $0, 0x1BE4($2)
/* 745E4 001744E4 C08F828F */  lw         $2, -0x7040($gp)
/* 745E8 001744E8 E81B43AC */  sw         $3, 0x1BE8($2)
/* 745EC 001744EC A043033C */  lui        $3, (0x43A00000 >> 16)
/* 745F0 001744F0 C08F828F */  lw         $2, -0x7040($gp)
/* 745F4 001744F4 0200013C */  lui        $at, (0x20000 >> 16)
/* 745F8 001744F8 21084100 */  addu       $at, $2, $at
/* 745FC 001744FC EC8323AC */  sw         $3, -0x7C14($at)
/* 74600 00174500 3944033C */  lui        $3, (0x44390000 >> 16)
/* 74604 00174504 C08F828F */  lw         $2, -0x7040($gp)
/* 74608 00174508 0200013C */  lui        $at, (0x20000 >> 16)
/* 7460C 0017450C 21084100 */  addu       $at, $2, $at
/* 74610 00174510 F08323AC */  sw         $3, -0x7C10($at)
/* 74614 00174514 02000424 */  addiu      $4, $0, 0x2
/* 74618 00174518 C08F828F */  lw         $2, -0x7040($gp)
/* 7461C 0017451C 0200013C */  lui        $at, (0x20000 >> 16)
/* 74620 00174520 21084100 */  addu       $at, $2, $at
/* 74624 00174524 F48324AC */  sw         $4, -0x7C0C($at)
/* 74628 00174528 34000324 */  addiu      $3, $0, 0x34
/* 7462C 0017452C C08F828F */  lw         $2, -0x7040($gp)
/* 74630 00174530 0200013C */  lui        $at, (0x20000 >> 16)
/* 74634 00174534 21084100 */  addu       $at, $2, $at
/* 74638 00174538 F88323AC */  sw         $3, -0x7C08($at)
/* 7463C 0017453C 20000324 */  addiu      $3, $0, 0x20
/* 74640 00174540 C08F828F */  lw         $2, -0x7040($gp)
/* 74644 00174544 0200013C */  lui        $at, (0x20000 >> 16)
/* 74648 00174548 21084100 */  addu       $at, $2, $at
/* 7464C 0017454C FC8323AC */  sw         $3, -0x7C04($at)
/* 74650 00174550 FFFF0324 */  addiu      $3, $0, -0x1
/* 74654 00174554 C08F828F */  lw         $2, -0x7040($gp)
/* 74658 00174558 480043AC */  sw         $3, 0x48($2)
/* 7465C 0017455C C08F828F */  lw         $2, -0x7040($gp)
/* 74660 00174560 4C0043AC */  sw         $3, 0x4C($2)
/* 74664 00174564 C08F828F */  lw         $2, -0x7040($gp)
/* 74668 00174568 500044AC */  sw         $4, 0x50($2)
/* 7466C 0017456C 04000324 */  addiu      $3, $0, 0x4
/* 74670 00174570 C08F828F */  lw         $2, -0x7040($gp)
/* 74674 00174574 540043AC */  sw         $3, 0x54($2)
/* 74678 00174578 05000324 */  addiu      $3, $0, 0x5
/* 7467C 0017457C C08F828F */  lw         $2, -0x7040($gp)
/* 74680 00174580 580043AC */  sw         $3, 0x58($2)
/* 74684 00174584 1E000324 */  addiu      $3, $0, 0x1E
/* 74688 00174588 C08F828F */  lw         $2, -0x7040($gp)
/* 7468C 0017458C 5C0043AC */  sw         $3, 0x5C($2)
/* 74690 00174590 C08F828F */  lw         $2, -0x7040($gp)
/* 74694 00174594 440040AC */  sw         $0, 0x44($2)
/* 74698 00174598 7C8080C7 */  lwc1       $f0, -0x7F84($gp)
/* 7469C 0017459C C08F828F */  lw         $2, -0x7040($gp)
/* 746A0 001745A0 600040E4 */  swc1       $f0, 0x60($2)
/* 746A4 001745A4 C08F828F */  lw         $2, -0x7040($gp)
/* 746A8 001745A8 640040AC */  sw         $0, 0x64($2)
/* 746AC 001745AC 808080C7 */  lwc1       $f0, -0x7F80($gp)
/* 746B0 001745B0 C08F828F */  lw         $2, -0x7040($gp)
/* 746B4 001745B4 680040E4 */  swc1       $f0, 0x68($2)
/* 746B8 001745B8 888080C7 */  lwc1       $f0, -0x7F78($gp)
/* 746BC 001745BC C08F828F */  lw         $2, -0x7040($gp)
/* 746C0 001745C0 6C0040E4 */  swc1       $f0, 0x6C($2)
/* 746C4 001745C4 282E0070 */  paddub     $5, $0, $0
/* 746C8 001745C8 09000010 */  b          .L001745F0
/* 746CC 001745CC 00000000 */   nop
.L001745D0:
/* 746D0 001745D0 FFFF0424 */  addiu      $4, $0, -0x1
/* 746D4 001745D4 C08F838F */  lw         $3, -0x7040($gp)
/* 746D8 001745D8 80100500 */  sll        $2, $5, 2
/* 746DC 001745DC 21104300 */  addu       $2, $2, $3
/* 746E0 001745E0 0200013C */  lui        $at, (0x20000 >> 16)
/* 746E4 001745E4 21084100 */  addu       $at, $2, $at
/* 746E8 001745E8 00A224AC */  sw         $4, -0x5E00($at)
/* 746EC 001745EC 0100A524 */  addiu      $5, $5, 0x1
.L001745F0:
/* 746F0 001745F0 1000A228 */  slti       $2, $5, 0x10
/* 746F4 001745F4 F6FF4014 */  bnez       $2, .L001745D0
/* 746F8 001745F8 00000000 */   nop
/* 746FC 001745FC 28262072 */  paddub     $4, $17, $0
/* 74700 00174600 2A00023C */  lui        $2, %hi(_482_2)
/* 74704 00174604 D8A74524 */  addiu      $5, $2, %lo(_482_2)
/* 74708 00174608 0815040C */  jal        strcmp
/* 7470C 0017460C 00000000 */   nop
/* 74710 00174610 33004014 */  bnez       $2, .L001746E0
/* 74714 00174614 00000000 */   nop
/* 74718 00174618 01000224 */  addiu      $2, $0, 0x1
/* 7471C 0017461C 109082AF */  sw         $2, -0x6FF0($gp)
/* 74720 00174620 28864072 */  paddub     $16, $18, $0
/* 74724 00174624 27000010 */  b          .L001746C4
/* 74728 00174628 00000000 */   nop
.L0017462C:
/* 7472C 0017462C 0000118E */  lw         $17, 0x0($16)
/* 74730 00174630 04001026 */  addiu      $16, $16, 0x4
/* 74734 00174634 8B002006 */  bltz       $17, .L00174864
/* 74738 00174638 00000000 */   nop
/* 7473C 0017463C 289E0070 */  paddub     $19, $0, $0
.L00174640:
/* 74740 00174640 0000038E */  lw         $3, 0x0($16)
/* 74744 00174644 04001026 */  addiu      $16, $16, 0x4
/* 74748 00174648 15006004 */  bltz       $3, .L001746A0
/* 7474C 0017464C 00000000 */   nop
/* 74750 00174650 80101300 */  sll        $2, $19, 2
/* 74754 00174654 21105D00 */  addu       $2, $2, $sp
/* 74758 00174658 0100013C */  lui        $at, (0x10000 >> 16)
/* 7475C 0017465C 21084100 */  addu       $at, $2, $at
/* 74760 00174660 90FA30AC */  sw         $16, -0x570($at)
/* 74764 00174664 01007326 */  addiu      $19, $19, 0x1
/* 74768 00174668 0A006014 */  bnez       $3, .L00174694
/* 7476C 0017466C 00000000 */   nop
/* 74770 00174670 28260072 */  paddub     $4, $16, $0
/* 74774 00174674 A015040C */  jal        strlen
/* 74778 00174678 00000000 */   nop
/* 7477C 0017467C 04004224 */  addiu      $2, $2, 0x4
/* 74780 00174680 82100200 */  srl        $2, $2, 2
/* 74784 00174684 80100200 */  sll        $2, $2, 2
/* 74788 00174688 21800202 */  addu       $16, $16, $2
/* 7478C 0017468C ECFF0010 */  b          .L00174640
/* 74790 00174690 00000000 */   nop
.L00174694:
/* 74794 00174694 04001026 */  addiu      $16, $16, 0x4
/* 74798 00174698 E9FF0010 */  b          .L00174640
/* 7479C 0017469C 00000000 */   nop
.L001746A0:
/* 747A0 001746A0 987AA427 */  addiu      $4, $sp, 0x7A98
/* 747A4 001746A4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 747A8 001746A8 80181100 */  sll        $3, $17, 2
/* 747AC 001746AC 2700023C */  lui        $2, %hi(CommandExe_5)
/* 747B0 001746B0 B0914224 */  addiu      $2, $2, %lo(CommandExe_5)
/* 747B4 001746B4 21104300 */  addu       $2, $2, $3
/* 747B8 001746B8 0000428C */  lw         $2, 0x0($2)
/* 747BC 001746BC 09F84000 */  jalr       $2
/* 747C0 001746C0 00000000 */   nop
.L001746C4:
/* 747C4 001746C4 23181202 */  subu       $3, $16, $18
/* 747C8 001746C8 8C00A28F */  lw         $2, 0x8C($sp)
/* 747CC 001746CC 2A106200 */  slt        $2, $3, $2
/* 747D0 001746D0 D6FF4014 */  bnez       $2, .L0017462C
/* 747D4 001746D4 00000000 */   nop
/* 747D8 001746D8 62000010 */  b          .L00174864
/* 747DC 001746DC 00000000 */   nop
.L001746E0:
/* 747E0 001746E0 187BA427 */  addiu      $4, $sp, 0x7B18
/* 747E4 001746E4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 747E8 001746E8 AC7C050C */  jal        __ct__18CScriptInterpreterFv
/* 747EC 001746EC 00000000 */   nop
/* 747F0 001746F0 187BA427 */  addiu      $4, $sp, 0x7B18
/* 747F4 001746F4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 747F8 001746F8 282E4072 */  paddub     $5, $18, $0
/* 747FC 001746FC 8C00A68F */  lw         $6, 0x8C($sp)
/* 74800 00174700 9C7C050C */  jal        SetScript__18CScriptInterpreterFPci
/* 74804 00174704 00000000 */   nop
/* 74808 00174708 2600023C */  lui        $2, %hi(Command_5)
/* 7480C 0017470C D0794524 */  addiu      $5, $2, %lo(Command_5)
/* 74810 00174710 187BA427 */  addiu      $4, $sp, 0x7B18
/* 74814 00174714 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 74818 00174718 3D000624 */  addiu      $6, $0, 0x3D
/* 7481C 0017471C 947C050C */  jal        SetTAG__18CScriptInterpreterFP9TAG_PARAMi
/* 74820 00174720 00000000 */   nop
/* 74824 00174724 187BA427 */  addiu      $4, $sp, 0x7B18
/* 74828 00174728 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 7482C 0017472C 2700023C */  lui        $2, %hi(func_table)
/* 74830 00174730 B0924524 */  addiu      $5, $2, %lo(func_table)
/* 74834 00174734 01000624 */  addiu      $6, $0, 0x1
/* 74838 00174738 987C050C */  jal        SetFunction__18CScriptInterpreterFP14SPI_FUNC_PARAMi
/* 7483C 0017473C 00000000 */   nop
.L00174740:
/* 74840 00174740 187BA427 */  addiu      $4, $sp, 0x7B18
/* 74844 00174744 F87F8424 */  addiu      $4, $4, 0x7FF8
/* 74848 00174748 407C050C */  jal        GetNextTAG__18CScriptInterpreterFv
/* 7484C 0017474C 00000000 */   nop
/* 74850 00174750 288E4070 */  paddub     $17, $2, $0
/* 74854 00174754 41002006 */  bltz       $17, .L0017485C
/* 74858 00174758 00000000 */   nop
/* 7485C 0017475C 3C7FB627 */  addiu      $22, $sp, 0x7F3C
/* 74860 00174760 F87FD626 */  addiu      $22, $22, 0x7FF8
/* 74864 00174764 2826C072 */  paddub     $4, $22, $0
/* 74868 00174768 80181100 */  sll        $3, $17, 2
/* 7486C 0017476C 2700023C */  lui        $2, %hi(CommandExe_5)
/* 74870 00174770 B0914224 */  addiu      $2, $2, %lo(CommandExe_5)
/* 74874 00174774 21104300 */  addu       $2, $2, $3
/* 74878 00174778 0000428C */  lw         $2, 0x0($2)
/* 7487C 0017477C 09F84000 */  jalr       $2
/* 74880 00174780 00000000 */   nop
/* 74884 00174784 000011AE */  sw         $17, 0x0($16)
/* 74888 00174788 04001026 */  addiu      $16, $16, 0x4
/* 7488C 0017478C 80101100 */  sll        $2, $17, 2
/* 74890 00174790 21185100 */  addu       $3, $2, $17
/* 74894 00174794 80100300 */  sll        $2, $3, 2
/* 74898 00174798 21106200 */  addu       $2, $3, $2
/* 7489C 0017479C 80180200 */  sll        $3, $2, 2
/* 748A0 001747A0 2600023C */  lui        $2, %hi(Command_5)
/* 748A4 001747A4 D0794224 */  addiu      $2, $2, %lo(Command_5)
/* 748A8 001747A8 21104300 */  addu       $2, $2, $3
/* 748AC 001747AC 04005124 */  addiu      $17, $2, 0x4
/* 748B0 001747B0 28960070 */  paddub     $18, $0, $0
.L001747B4:
/* 748B4 001747B4 0000228E */  lw         $2, 0x0($17)
/* 748B8 001747B8 04003126 */  addiu      $17, $17, 0x4
/* 748BC 001747BC 22004004 */  bltz       $2, .L00174848
/* 748C0 001747C0 00000000 */   nop
/* 748C4 001747C4 000002AE */  sw         $2, 0x0($16)
/* 748C8 001747C8 04001026 */  addiu      $16, $16, 0x4
/* 748CC 001747CC 15004014 */  bnez       $2, .L00174824
/* 748D0 001747D0 00000000 */   nop
/* 748D4 001747D4 80101200 */  sll        $2, $18, 2
/* 748D8 001747D8 2198C202 */  addu       $19, $22, $2
/* 748DC 001747DC 0000648E */  lw         $4, 0x0($19)
/* 748E0 001747E0 A015040C */  jal        strlen
/* 748E4 001747E4 00000000 */   nop
/* 748E8 001747E8 04004224 */  addiu      $2, $2, 0x4
/* 748EC 001747EC 83100200 */  sra        $2, $2, 2
/* 748F0 001747F0 80A00200 */  sll        $20, $2, 2
/* 748F4 001747F4 28260072 */  paddub     $4, $16, $0
/* 748F8 001747F8 282E0070 */  paddub     $5, $0, $0
/* 748FC 001747FC 28368072 */  paddub     $6, $20, $0
/* 74900 00174800 5A0D040C */  jal        memset
/* 74904 00174804 00000000 */   nop
/* 74908 00174808 0000658E */  lw         $5, 0x0($19)
/* 7490C 0017480C 28260072 */  paddub     $4, $16, $0
/* 74910 00174810 5A15040C */  jal        strcpy
/* 74914 00174814 00000000 */   nop
/* 74918 00174818 21801402 */  addu       $16, $16, $20
/* 7491C 0017481C 07000010 */  b          .L0017483C
/* 74920 00174820 00000000 */   nop
.L00174824:
/* 74924 00174824 80101200 */  sll        $2, $18, 2
/* 74928 00174828 2110C202 */  addu       $2, $22, $2
/* 7492C 0017482C 0000428C */  lw         $2, 0x0($2)
/* 74930 00174830 0000428C */  lw         $2, 0x0($2)
/* 74934 00174834 000002AE */  sw         $2, 0x0($16)
/* 74938 00174838 04001026 */  addiu      $16, $16, 0x4
.L0017483C:
/* 7493C 0017483C 01005226 */  addiu      $18, $18, 0x1
/* 74940 00174840 DCFF0010 */  b          .L001747B4
/* 74944 00174844 00000000 */   nop
.L00174848:
/* 74948 00174848 FFFF0224 */  addiu      $2, $0, -0x1
/* 7494C 0017484C 000002AE */  sw         $2, 0x0($16)
/* 74950 00174850 04001026 */  addiu      $16, $16, 0x4
/* 74954 00174854 BAFF0010 */  b          .L00174740
/* 74958 00174858 00000000 */   nop
.L0017485C:
/* 7495C 0017485C FFFF0224 */  addiu      $2, $0, -0x1
/* 74960 00174860 000002AE */  sw         $2, 0x0($16)
.L00174864:
/* 74964 00174864 C08F848F */  lw         $4, -0x7040($gp)
/* 74968 00174868 C48F838F */  lw         $3, -0x703C($gp)
/* 7496C 0017486C C0100300 */  sll        $2, $3, 3
/* 74970 00174870 21104300 */  addu       $2, $2, $3
/* 74974 00174874 C0100200 */  sll        $2, $2, 3
/* 74978 00174878 21104400 */  addu       $2, $2, $4
/* 7497C 0017487C E00940A0 */  sb         $0, 0x9E0($2)
/* 74980 00174880 FFFF0524 */  addiu      $5, $0, -0x1
/* 74984 00174884 C08F848F */  lw         $4, -0x7040($gp)
/* 74988 00174888 C48F838F */  lw         $3, -0x703C($gp)
/* 7498C 0017488C C0100300 */  sll        $2, $3, 3
/* 74990 00174890 21104300 */  addu       $2, $2, $3
/* 74994 00174894 C0100200 */  sll        $2, $2, 3
/* 74998 00174898 21104400 */  addu       $2, $2, $4
/* 7499C 0017489C 200A45AC */  sw         $5, 0xA20($2)
/* 749A0 001748A0 C08F838F */  lw         $3, -0x7040($gp)
/* 749A4 001748A4 CC8F828F */  lw         $2, -0x7034($gp)
/* 749A8 001748A8 D8020424 */  addiu      $4, $0, 0x2D8
/* 749AC 001748AC 18104400 */  mult       $2, $2, $4
/* 749B0 001748B0 21104300 */  addu       $2, $2, $3
/* 749B4 001748B4 A02540A0 */  sb         $0, 0x25A0($2)
/* 749B8 001748B8 C08F838F */  lw         $3, -0x7040($gp)
/* 749BC 001748BC CC8F828F */  lw         $2, -0x7034($gp)
/* 749C0 001748C0 18104470 */  mult1      $2, $2, $4
/* 749C4 001748C4 21104300 */  addu       $2, $2, $3
/* 749C8 001748C8 E02540A0 */  sb         $0, 0x25E0($2)
/* 749CC 001748CC C08F838F */  lw         $3, -0x7040($gp)
/* 749D0 001748D0 CC8F828F */  lw         $2, -0x7034($gp)
/* 749D4 001748D4 18104400 */  mult       $2, $2, $4
/* 749D8 001748D8 21104300 */  addu       $2, $2, $3
/* 749DC 001748DC 202640A0 */  sb         $0, 0x2620($2)
/* 749E0 001748E0 C08F838F */  lw         $3, -0x7040($gp)
/* 749E4 001748E4 CC8F828F */  lw         $2, -0x7034($gp)
/* 749E8 001748E8 18104400 */  mult       $2, $2, $4
/* 749EC 001748EC 21104300 */  addu       $2, $2, $3
/* 749F0 001748F0 602640A0 */  sb         $0, 0x2660($2)
/* 749F4 001748F4 D08F838F */  lw         $3, -0x7030($gp)
/* 749F8 001748F8 C08F828F */  lw         $2, -0x7040($gp)
/* 749FC 001748FC 0200013C */  lui        $at, (0x20000 >> 16)
/* 74A00 00174900 21084100 */  addu       $at, $2, $at
/* 74A04 00174904 40A223AC */  sw         $3, -0x5DC0($at)
/* 74A08 00174908 D88F838F */  lw         $3, -0x7028($gp)
/* 74A0C 0017490C C08F828F */  lw         $2, -0x7040($gp)
/* 74A10 00174910 0200013C */  lui        $at, (0x20000 >> 16)
/* 74A14 00174914 21084100 */  addu       $at, $2, $at
/* 74A18 00174918 48A223AC */  sw         $3, -0x5DB8($at)
/* 74A1C 0017491C DC8F838F */  lw         $3, -0x7024($gp)
/* 74A20 00174920 C08F828F */  lw         $2, -0x7040($gp)
/* 74A24 00174924 0200013C */  lui        $at, (0x20000 >> 16)
/* 74A28 00174928 21084100 */  addu       $at, $2, $at
/* 74A2C 0017492C 44A223AC */  sw         $3, -0x5DBC($at)
/* 74A30 00174930 E08F838F */  lw         $3, -0x7020($gp)
/* 74A34 00174934 C08F828F */  lw         $2, -0x7040($gp)
/* 74A38 00174938 0200013C */  lui        $at, (0x20000 >> 16)
/* 74A3C 0017493C 21084100 */  addu       $at, $2, $at
/* 74A40 00174940 4CA223AC */  sw         $3, -0x5DB4($at)
/* 74A44 00174944 E48F838F */  lw         $3, -0x701C($gp)
/* 74A48 00174948 C08F828F */  lw         $2, -0x7040($gp)
/* 74A4C 0017494C 0200013C */  lui        $at, (0x20000 >> 16)
/* 74A50 00174950 21084100 */  addu       $at, $2, $at
/* 74A54 00174954 50A223AC */  sw         $3, -0x5DB0($at)
/* 74A58 00174958 2A00A006 */  bltz       $21, .L00174A04
/* 74A5C 0017495C 00000000 */   nop
/* 74A60 00174960 0500A12A */  slti       $at, $21, 0x5
/* 74A64 00174964 27002010 */  beqz       $at, .L00174A04
/* 74A68 00174968 00000000 */   nop
/* 74A6C 0017496C 28860070 */  paddub     $16, $0, $0
/* 74A70 00174970 21000010 */  b          .L001749F8
/* 74A74 00174974 00000000 */   nop
.L00174978:
/* 74A78 00174978 C0101000 */  sll        $2, $16, 3
/* 74A7C 0017497C 21105000 */  addu       $2, $2, $16
/* 74A80 00174980 00190200 */  sll        $3, $2, 4
/* 74A84 00174984 C08F828F */  lw         $2, -0x7040($gp)
/* 74A88 00174988 21104300 */  addu       $2, $2, $3
/* 74A8C 0017498C 0100013C */  lui        $at, (0x18400 >> 16)
/* 74A90 00174990 00842134 */  ori        $at, $at, (0x18400 & 0xFFFF)
/* 74A94 00174994 21884100 */  addu       $17, $2, $at
/* 74A98 00174998 80101500 */  sll        $2, $21, 2
/* 74A9C 0017499C 21185500 */  addu       $3, $2, $21
/* 74AA0 001749A0 80100300 */  sll        $2, $3, 2
/* 74AA4 001749A4 21106200 */  addu       $2, $3, $2
/* 74AA8 001749A8 00190200 */  sll        $3, $2, 4
/* 74AAC 001749AC 2600023C */  lui        $2, %hi(EditCharaData)
/* 74AB0 001749B0 70704224 */  addiu      $2, $2, %lo(EditCharaData)
/* 74AB4 001749B4 21184300 */  addu       $3, $2, $3
/* 74AB8 001749B8 80101000 */  sll        $2, $16, 2
/* 74ABC 001749BC 21105000 */  addu       $2, $2, $16
/* 74AC0 001749C0 80100200 */  sll        $2, $2, 2
/* 74AC4 001749C4 21904300 */  addu       $18, $2, $3
/* 74AC8 001749C8 28262072 */  paddub     $4, $17, $0
/* 74ACC 001749CC 0000458E */  lw         $5, 0x0($18)
/* 74AD0 001749D0 5A15040C */  jal        strcpy
/* 74AD4 001749D4 00000000 */   nop
/* 74AD8 001749D8 440030AE */  sw         $16, 0x44($17)
/* 74ADC 001749DC 04004286 */  lh         $2, 0x4($18)
/* 74AE0 001749E0 480022AE */  sw         $2, 0x48($17)
/* 74AE4 001749E4 06004286 */  lh         $2, 0x6($18)
/* 74AE8 001749E8 4C0022AE */  sw         $2, 0x4C($17)
/* 74AEC 001749EC 10004286 */  lh         $2, 0x10($18)
/* 74AF0 001749F0 5C0022AE */  sw         $2, 0x5C($17)
/* 74AF4 001749F4 01001026 */  addiu      $16, $16, 0x1
.L001749F8:
/* 74AF8 001749F8 1000022A */  slti       $2, $16, 0x10
/* 74AFC 001749FC DEFF4014 */  bnez       $2, .L00174978
/* 74B00 00174A00 00000000 */   nop
.L00174A04:
/* 74B04 00174A04 C08F828F */  lw         $2, -0x7040($gp)
/* 74B08 00174A08 4000428C */  lw         $2, 0x40($2)
/* 74B0C 00174A0C 1F004014 */  bnez       $2, .L00174A8C
/* 74B10 00174A10 00000000 */   nop
/* 74B14 00174A14 281E0070 */  paddub     $3, $0, $0
/* 74B18 00174A18 19000010 */  b          .L00174A80
/* 74B1C 00174A1C 00000000 */   nop
.L00174A20:
/* 74B20 00174A20 00210300 */  sll        $4, $3, 4
/* 74B24 00174A24 2600023C */  lui        $2, %hi(def_light)
/* 74B28 00174A28 B06F4224 */  addiu      $2, $2, %lo(def_light)
/* 74B2C 00174A2C 21104400 */  addu       $2, $2, $4
/* 74B30 00174A30 000040C4 */  lwc1       $f0, 0x0($2)
/* 74B34 00174A34 C08F828F */  lw         $2, -0x7040($gp)
/* 74B38 00174A38 80290300 */  sll        $5, $3, 6
/* 74B3C 00174A3C 2110A200 */  addu       $2, $5, $2
/* 74B40 00174A40 300140E4 */  swc1       $f0, 0x130($2)
/* 74B44 00174A44 2600023C */  lui        $2, %hi(def_light + 0x4)
/* 74B48 00174A48 B46F4224 */  addiu      $2, $2, %lo(def_light + 0x4)
/* 74B4C 00174A4C 21104400 */  addu       $2, $2, $4
/* 74B50 00174A50 000040C4 */  lwc1       $f0, 0x0($2)
/* 74B54 00174A54 C08F828F */  lw         $2, -0x7040($gp)
/* 74B58 00174A58 2110A200 */  addu       $2, $5, $2
/* 74B5C 00174A5C 400140E4 */  swc1       $f0, 0x140($2)
/* 74B60 00174A60 2600023C */  lui        $2, %hi(def_light + 0x8)
/* 74B64 00174A64 B86F4224 */  addiu      $2, $2, %lo(def_light + 0x8)
/* 74B68 00174A68 21104400 */  addu       $2, $2, $4
/* 74B6C 00174A6C 000040C4 */  lwc1       $f0, 0x0($2)
/* 74B70 00174A70 C08F828F */  lw         $2, -0x7040($gp)
/* 74B74 00174A74 2110A200 */  addu       $2, $5, $2
/* 74B78 00174A78 500140E4 */  swc1       $f0, 0x150($2)
/* 74B7C 00174A7C 01006324 */  addiu      $3, $3, 0x1
.L00174A80:
/* 74B80 00174A80 0C006228 */  slti       $2, $3, 0xC
/* 74B84 00174A84 E6FF4014 */  bnez       $2, .L00174A20
/* 74B88 00174A88 00000000 */   nop
.L00174A8C:
/* 74B8C 00174A8C C08F838F */  lw         $3, -0x7040($gp)
/* 74B90 00174A90 4C00628C */  lw         $2, 0x4C($3)
/* 74B94 00174A94 03004104 */  bgez       $2, .L00174AA4
/* 74B98 00174A98 00000000 */   nop
/* 74B9C 00174A9C 01000224 */  addiu      $2, $0, 0x1
/* 74BA0 00174AA0 440062AC */  sw         $2, 0x44($3)
.L00174AA4:
/* 74BA4 00174AA4 01000224 */  addiu      $2, $0, 0x1
/* 74BA8 00174AA8 7000BF7B */  lq         $31, 0x70($sp)
/* 74BAC 00174AAC 6000B67B */  lq         $22, 0x60($sp)
/* 74BB0 00174AB0 5000B57B */  lq         $21, 0x50($sp)
/* 74BB4 00174AB4 4000B47B */  lq         $20, 0x40($sp)
/* 74BB8 00174AB8 3000B37B */  lq         $19, 0x30($sp)
/* 74BBC 00174ABC 2000B27B */  lq         $18, 0x20($sp)
/* 74BC0 00174AC0 1000B17B */  lq         $17, 0x10($sp)
/* 74BC4 00174AC4 0000B07B */  lq         $16, 0x0($sp)
/* 74BC8 00174AC8 0100013C */  lui        $at, (0x103A0 >> 16)
/* 74BCC 00174ACC A0032134 */  ori        $at, $at, (0x103A0 & 0xFFFF)
/* 74BD0 00174AD0 21E8A103 */  addu       $sp, $sp, $at
/* 74BD4 00174AD4 0800E003 */  jr         $31
/* 74BD8 00174AD8 00000000 */   nop
/* 74BDC 00174ADC 00000000 */  nop
