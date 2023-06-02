.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel buildEventData__11CDungeonMapFiii
/* C8640 001C8540 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* C8644 001C8544 9000BF7F */  sq         $31, 0x90($sp)
/* C8648 001C8548 8000BE7F */  sq         $fp, 0x80($sp)
/* C864C 001C854C 7000B77F */  sq         $23, 0x70($sp)
/* C8650 001C8550 6000B67F */  sq         $22, 0x60($sp)
/* C8654 001C8554 5000B57F */  sq         $21, 0x50($sp)
/* C8658 001C8558 4000B47F */  sq         $20, 0x40($sp)
/* C865C 001C855C 3000B37F */  sq         $19, 0x30($sp)
/* C8660 001C8560 2000B27F */  sq         $18, 0x20($sp)
/* C8664 001C8564 1000B17F */  sq         $17, 0x10($sp)
/* C8668 001C8568 0000B07F */  sq         $16, 0x0($sp)
/* C866C 001C856C 28968070 */  paddub     $18, $4, $0
/* C8670 001C8570 288EA070 */  paddub     $17, $5, $0
/* C8674 001C8574 2886E070 */  paddub     $16, $7, $0
/* C8678 001C8578 01000324 */  addiu      $3, $0, 0x1
/* C867C 001C857C 8301C314 */  bne        $6, $3, .L001C8B8C
/* C8680 001C8580 00000000 */   nop
/* C8684 001C8584 289E0070 */  paddub     $19, $0, $0
/* C8688 001C8588 02000016 */  bnez       $16, .L001C8594
/* C868C 001C858C 00000000 */   nop
/* C8690 001C8590 289E6070 */  paddub     $19, $3, $0
.L001C8594:
/* C8694 001C8594 28A60070 */  paddub     $20, $0, $0
/* C8698 001C8598 BE11040C */  jal        rand
/* C869C 001C859C 00000000 */   nop
/* C86A0 001C85A0 00008244 */  mtc1       $2, $f0
/* C86A4 001C85A4 00000000 */  nop
/* C86A8 001C85A8 60008046 */  cvt.s.w    $f1, $f0
/* C86AC 001C85AC 8040023C */  lui        $2, (0x40800000 >> 16)
/* C86B0 001C85B0 00008244 */  mtc1       $2, $f0
/* C86B4 001C85B4 00000000 */  nop
/* C86B8 001C85B8 42000146 */  mul.s      $f1, $f0, $f1
/* C86BC 001C85BC 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C86C0 001C85C0 00008244 */  mtc1       $2, $f0
/* C86C4 001C85C4 00000000 */  nop
/* C86C8 001C85C8 030B0046 */  div.s      $f12, $f1, $f0
/* C86CC 001C85CC 2C44040C */  jal        fptosi
/* C86D0 001C85D0 00000000 */   nop
/* C86D4 001C85D4 01005724 */  addiu      $23, $2, 0x1
/* C86D8 001C85D8 82000010 */  b          .L001C87E4
/* C86DC 001C85DC 00000000 */   nop
.L001C85E0:
/* C86E0 001C85E0 581C4426 */  addiu      $4, $18, 0x1C58
/* C86E4 001C85E4 F87F8424 */  addiu      $4, $4, 0x7FF8
/* C86E8 001C85E8 282E0070 */  paddub     $5, $0, $0
/* C86EC 001C85EC 28360070 */  paddub     $6, $0, $0
/* C86F0 001C85F0 14000724 */  addiu      $7, $0, 0x14
/* C86F4 001C85F4 2846E070 */  paddub     $8, $7, $0
/* C86F8 001C85F8 A000A927 */  addiu      $9, $sp, 0xA0
/* C86FC 001C85FC F000070C */  jal        SearchiDoPutArea__FP8MAPPARTSiiiiPf
/* C8700 001C8600 00000000 */   nop
/* C8704 001C8604 01001524 */  addiu      $21, $0, 0x1
/* C8708 001C8608 A041023C */  lui        $2, (0x41A00000 >> 16)
/* C870C 001C860C 00608244 */  mtc1       $2, $f12
/* C8710 001C8610 28264072 */  paddub     $4, $18, $0
/* C8714 001C8614 A000A527 */  addiu      $5, $sp, 0xA0
/* C8718 001C8618 B81F070C */  jal        CheckTreasureBox__11CDungeonMapFPff
/* C871C 001C861C 00000000 */   nop
/* C8720 001C8620 02004014 */  bnez       $2, .L001C862C
/* C8724 001C8624 00000000 */   nop
/* C8728 001C8628 28AE0070 */  paddub     $21, $0, $0
.L001C862C:
/* C872C 001C862C A041023C */  lui        $2, (0x41A00000 >> 16)
/* C8730 001C8630 00608244 */  mtc1       $2, $f12
/* C8734 001C8634 28264072 */  paddub     $4, $18, $0
/* C8738 001C8638 A000A527 */  addiu      $5, $sp, 0xA0
/* C873C 001C863C E81F070C */  jal        CheckAtra__11CDungeonMapFPff
/* C8740 001C8640 00000000 */   nop
/* C8744 001C8644 02004014 */  bnez       $2, .L001C8650
/* C8748 001C8648 00000000 */   nop
/* C874C 001C864C 28AE0070 */  paddub     $21, $0, $0
.L001C8650:
/* C8750 001C8650 A041023C */  lui        $2, (0x41A00000 >> 16)
/* C8754 001C8654 00608244 */  mtc1       $2, $f12
/* C8758 001C8658 28264072 */  paddub     $4, $18, $0
/* C875C 001C865C A000A527 */  addiu      $5, $sp, 0xA0
/* C8760 001C8660 7C1E070C */  jal        CheckTrapCircle__11CDungeonMapFPff
/* C8764 001C8664 00000000 */   nop
/* C8768 001C8668 02004010 */  beqz       $2, .L001C8674
/* C876C 001C866C 00000000 */   nop
/* C8770 001C8670 28AE0070 */  paddub     $21, $0, $0
.L001C8674:
/* C8774 001C8674 5B00A012 */  beqz       $21, .L001C87E4
/* C8778 001C8678 00000000 */   nop
/* C877C 001C867C BE11040C */  jal        rand
/* C8780 001C8680 00000000 */   nop
/* C8784 001C8684 00008244 */  mtc1       $2, $f0
/* C8788 001C8688 00000000 */  nop
/* C878C 001C868C 60008046 */  cvt.s.w    $f1, $f0
/* C8790 001C8690 C842023C */  lui        $2, (0x42C80000 >> 16)
/* C8794 001C8694 00008244 */  mtc1       $2, $f0
/* C8798 001C8698 00000000 */  nop
/* C879C 001C869C 42000146 */  mul.s      $f1, $f0, $f1
/* C87A0 001C86A0 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C87A4 001C86A4 00008244 */  mtc1       $2, $f0
/* C87A8 001C86A8 00000000 */  nop
/* C87AC 001C86AC 43080046 */  div.s      $f1, $f1, $f0
/* C87B0 001C86B0 B042023C */  lui        $2, (0x42B00000 >> 16)
/* C87B4 001C86B4 00008244 */  mtc1       $2, $f0
/* C87B8 001C86B8 00000000 */  nop
/* C87BC 001C86BC 34080046 */  c.lt.s     $f1, $f0
/* C87C0 001C86C0 00000000 */  nop
/* C87C4 001C86C4 2D000145 */  bc1t       .L001C877C
/* C87C8 001C86C8 00000000 */   nop
/* C87CC 001C86CC 0200822A */  slti       $2, $20, 0x2
/* C87D0 001C86D0 2A004014 */  bnez       $2, .L001C877C
/* C87D4 001C86D4 00000000 */   nop
/* C87D8 001C86D8 A49D848F */  lw         $4, -0x625C($gp)
/* C87DC 001C86DC 282E2072 */  paddub     $5, $17, $0
/* C87E0 001C86E0 28366072 */  paddub     $6, $19, $0
/* C87E4 001C86E4 283E0070 */  paddub     $7, $0, $0
/* C87E8 001C86E8 BCFF060C */  jal        PresetSmallItemNo_Get__Fiiii
/* C87EC 001C86EC 00000000 */   nop
/* C87F0 001C86F0 28AE4070 */  paddub     $21, $2, $0
/* C87F4 001C86F4 FFFF0224 */  addiu      $2, $0, -0x1
/* C87F8 001C86F8 3A00A212 */  beq        $21, $2, .L001C87E4
/* C87FC 001C86FC 00000000 */   nop
/* C8800 001C8700 BE11040C */  jal        rand
/* C8804 001C8704 00000000 */   nop
/* C8808 001C8708 00008244 */  mtc1       $2, $f0
/* C880C 001C870C 00000000 */  nop
/* C8810 001C8710 60008046 */  cvt.s.w    $f1, $f0
/* C8814 001C8714 C040023C */  lui        $2, (0x40C00000 >> 16)
/* C8818 001C8718 00008244 */  mtc1       $2, $f0
/* C881C 001C871C 00000000 */  nop
/* C8820 001C8720 42000146 */  mul.s      $f1, $f0, $f1
/* C8824 001C8724 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C8828 001C8728 00008244 */  mtc1       $2, $f0
/* C882C 001C872C 00000000 */  nop
/* C8830 001C8730 030B0046 */  div.s      $f12, $f1, $f0
/* C8834 001C8734 2C44040C */  jal        fptosi
/* C8838 001C8738 00000000 */   nop
/* C883C 001C873C 04004004 */  bltz       $2, .L001C8750
/* C8840 001C8740 00000000 */   nop
/* C8844 001C8744 06004328 */  slti       $3, $2, 0x6
/* C8848 001C8748 02006014 */  bnez       $3, .L001C8754
/* C884C 001C874C 00000000 */   nop
.L001C8750:
/* C8850 001C8750 01000224 */  addiu      $2, $0, 0x1
.L001C8754:
/* C8854 001C8754 28264072 */  paddub     $4, $18, $0
/* C8858 001C8758 A000A527 */  addiu      $5, $sp, 0xA0
/* C885C 001C875C 2836A072 */  paddub     $6, $21, $0
/* C8860 001C8760 283E0070 */  paddub     $7, $0, $0
/* C8864 001C8764 28464070 */  paddub     $8, $2, $0
/* C8868 001C8768 9020070C */  jal        SetTreasureBox__11CDungeonMapFPfiii
/* C886C 001C876C 00000000 */   nop
/* C8870 001C8770 01009426 */  addiu      $20, $20, 0x1
/* C8874 001C8774 1B000010 */  b          .L001C87E4
/* C8878 001C8778 00000000 */   nop
.L001C877C:
/* C887C 001C877C A49D848F */  lw         $4, -0x625C($gp)
/* C8880 001C8780 282E2072 */  paddub     $5, $17, $0
/* C8884 001C8784 28366072 */  paddub     $6, $19, $0
/* C8888 001C8788 01000724 */  addiu      $7, $0, 0x1
/* C888C 001C878C BCFF060C */  jal        PresetSmallItemNo_Get__Fiiii
/* C8890 001C8790 00000000 */   nop
/* C8894 001C8794 08000012 */  beqz       $16, .L001C87B8
/* C8898 001C8798 00000000 */   nop
/* C889C 001C879C 02008016 */  bnez       $20, .L001C87A8
/* C88A0 001C87A0 00000000 */   nop
/* C88A4 001C87A4 E9000224 */  addiu      $2, $0, 0xE9
.L001C87A8:
/* C88A8 001C87A8 01000324 */  addiu      $3, $0, 0x1
/* C88AC 001C87AC 02008316 */  bne        $20, $3, .L001C87B8
/* C88B0 001C87B0 00000000 */   nop
/* C88B4 001C87B4 EA000224 */  addiu      $2, $0, 0xEA
.L001C87B8:
/* C88B8 001C87B8 FFFF0324 */  addiu      $3, $0, -0x1
/* C88BC 001C87BC 09004310 */  beq        $2, $3, .L001C87E4
/* C88C0 001C87C0 00000000 */   nop
/* C88C4 001C87C4 28264072 */  paddub     $4, $18, $0
/* C88C8 001C87C8 A000A527 */  addiu      $5, $sp, 0xA0
/* C88CC 001C87CC 28364070 */  paddub     $6, $2, $0
/* C88D0 001C87D0 01000724 */  addiu      $7, $0, 0x1
/* C88D4 001C87D4 28460070 */  paddub     $8, $0, $0
/* C88D8 001C87D8 9020070C */  jal        SetTreasureBox__11CDungeonMapFPfiii
/* C88DC 001C87DC 00000000 */   nop
/* C88E0 001C87E0 01009426 */  addiu      $20, $20, 0x1
.L001C87E4:
/* C88E4 001C87E4 0300E226 */  addiu      $2, $23, 0x3
/* C88E8 001C87E8 2A108202 */  slt        $2, $20, $2
/* C88EC 001C87EC 7CFF4014 */  bnez       $2, .L001C85E0
/* C88F0 001C87F0 00000000 */   nop
/* C88F4 001C87F4 28264072 */  paddub     $4, $18, $0
/* C88F8 001C87F8 6C1E070C */  jal        initTrapCircle__11CDungeonMapFv
/* C88FC 001C87FC 00000000 */   nop
/* C8900 001C8800 289E0070 */  paddub     $19, $0, $0
/* C8904 001C8804 3F000010 */  b          .L001C8904
/* C8908 001C8808 00000000 */   nop
.L001C880C:
/* C890C 001C880C BE11040C */  jal        rand
/* C8910 001C8810 00000000 */   nop
/* C8914 001C8814 00008244 */  mtc1       $2, $f0
/* C8918 001C8818 00000000 */  nop
/* C891C 001C881C 60008046 */  cvt.s.w    $f1, $f0
/* C8920 001C8820 C842023C */  lui        $2, (0x42C80000 >> 16)
/* C8924 001C8824 00008244 */  mtc1       $2, $f0
/* C8928 001C8828 00000000 */  nop
/* C892C 001C882C 42000146 */  mul.s      $f1, $f0, $f1
/* C8930 001C8830 004F023C */  lui        $2, (0x4F000000 >> 16)
/* C8934 001C8834 00008244 */  mtc1       $2, $f0
/* C8938 001C8838 00000000 */  nop
/* C893C 001C883C 030B0046 */  div.s      $f12, $f1, $f0
/* C8940 001C8840 2C44040C */  jal        fptosi
/* C8944 001C8844 00000000 */   nop
/* C8948 001C8848 15004128 */  slti       $at, $2, 0x15
/* C894C 001C884C 2C002010 */  beqz       $at, .L001C8900
/* C8950 001C8850 00000000 */   nop
/* C8954 001C8854 581C4426 */  addiu      $4, $18, 0x1C58
/* C8958 001C8858 F87F8424 */  addiu      $4, $4, 0x7FF8
/* C895C 001C885C 282E0070 */  paddub     $5, $0, $0
/* C8960 001C8860 28360070 */  paddub     $6, $0, $0
/* C8964 001C8864 14000724 */  addiu      $7, $0, 0x14
/* C8968 001C8868 2846E070 */  paddub     $8, $7, $0
/* C896C 001C886C B000A927 */  addiu      $9, $sp, 0xB0
/* C8970 001C8870 F000070C */  jal        SearchiDoPutArea__FP8MAPPARTSiiiiPf
/* C8974 001C8874 00000000 */   nop
/* C8978 001C8878 01001524 */  addiu      $21, $0, 0x1
/* C897C 001C887C A041023C */  lui        $2, (0x41A00000 >> 16)
/* C8980 001C8880 00608244 */  mtc1       $2, $f12
/* C8984 001C8884 28264072 */  paddub     $4, $18, $0
/* C8988 001C8888 B000A527 */  addiu      $5, $sp, 0xB0
/* C898C 001C888C B81F070C */  jal        CheckTreasureBox__11CDungeonMapFPff
/* C8990 001C8890 00000000 */   nop
/* C8994 001C8894 02004014 */  bnez       $2, .L001C88A0
/* C8998 001C8898 00000000 */   nop
/* C899C 001C889C 28AE0070 */  paddub     $21, $0, $0
.L001C88A0:
/* C89A0 001C88A0 A041023C */  lui        $2, (0x41A00000 >> 16)
/* C89A4 001C88A4 00608244 */  mtc1       $2, $f12
/* C89A8 001C88A8 28264072 */  paddub     $4, $18, $0
/* C89AC 001C88AC B000A527 */  addiu      $5, $sp, 0xB0
/* C89B0 001C88B0 E81F070C */  jal        CheckAtra__11CDungeonMapFPff
/* C89B4 001C88B4 00000000 */   nop
/* C89B8 001C88B8 02004014 */  bnez       $2, .L001C88C4
/* C89BC 001C88BC 00000000 */   nop
/* C89C0 001C88C0 28AE0070 */  paddub     $21, $0, $0
.L001C88C4:
/* C89C4 001C88C4 A041023C */  lui        $2, (0x41A00000 >> 16)
/* C89C8 001C88C8 00608244 */  mtc1       $2, $f12
/* C89CC 001C88CC 28264072 */  paddub     $4, $18, $0
/* C89D0 001C88D0 B000A527 */  addiu      $5, $sp, 0xB0
/* C89D4 001C88D4 7C1E070C */  jal        CheckTrapCircle__11CDungeonMapFPff
/* C89D8 001C88D8 00000000 */   nop
/* C89DC 001C88DC 02004010 */  beqz       $2, .L001C88E8
/* C89E0 001C88E0 00000000 */   nop
/* C89E4 001C88E4 28AE0070 */  paddub     $21, $0, $0
.L001C88E8:
/* C89E8 001C88E8 0500A012 */  beqz       $21, .L001C8900
/* C89EC 001C88EC 00000000 */   nop
/* C89F0 001C88F0 28264072 */  paddub     $4, $18, $0
/* C89F4 001C88F4 B000A527 */  addiu      $5, $sp, 0xB0
/* C89F8 001C88F8 AC1E070C */  jal        SetupTrapCircle__11CDungeonMapFPf
/* C89FC 001C88FC 00000000 */   nop
.L001C8900:
/* C8A00 001C8900 01007326 */  addiu      $19, $19, 0x1
.L001C8904:
/* C8A04 001C8904 0300632A */  slti       $3, $19, 0x3
/* C8A08 001C8908 C0FF6014 */  bnez       $3, .L001C880C
/* C8A0C 001C890C 00000000 */   nop
/* C8A10 001C8910 9E000012 */  beqz       $16, .L001C8B8C
/* C8A14 001C8914 00000000 */   nop
/* C8A18 001C8918 28A60070 */  paddub     $20, $0, $0
/* C8A1C 001C891C A49D848F */  lw         $4, -0x625C($gp)
/* C8A20 001C8920 282E2072 */  paddub     $5, $17, $0
/* C8A24 001C8924 C000A627 */  addiu      $6, $sp, 0xC0
/* C8A28 001C8928 4803070C */  jal        BtAtraFloorCyoice__FiiPi
/* C8A2C 001C892C 00000000 */   nop
/* C8A30 001C8930 28864070 */  paddub     $16, $2, $0
/* C8A34 001C8934 92000010 */  b          .L001C8B80
/* C8A38 001C8938 00000000 */   nop
.L001C893C:
/* C8A3C 001C893C 581C4426 */  addiu      $4, $18, 0x1C58
/* C8A40 001C8940 F87F8424 */  addiu      $4, $4, 0x7FF8
/* C8A44 001C8944 282E0070 */  paddub     $5, $0, $0
/* C8A48 001C8948 28360070 */  paddub     $6, $0, $0
/* C8A4C 001C894C 14000724 */  addiu      $7, $0, 0x14
/* C8A50 001C8950 2846E070 */  paddub     $8, $7, $0
/* C8A54 001C8954 B000A927 */  addiu      $9, $sp, 0xB0
/* C8A58 001C8958 F000070C */  jal        SearchiDoPutArea__FP8MAPPARTSiiiiPf
/* C8A5C 001C895C 00000000 */   nop
/* C8A60 001C8960 01001524 */  addiu      $21, $0, 0x1
/* C8A64 001C8964 A041023C */  lui        $2, (0x41A00000 >> 16)
/* C8A68 001C8968 00608244 */  mtc1       $2, $f12
/* C8A6C 001C896C 28264072 */  paddub     $4, $18, $0
/* C8A70 001C8970 B000A527 */  addiu      $5, $sp, 0xB0
/* C8A74 001C8974 B81F070C */  jal        CheckTreasureBox__11CDungeonMapFPff
/* C8A78 001C8978 00000000 */   nop
/* C8A7C 001C897C 02004014 */  bnez       $2, .L001C8988
/* C8A80 001C8980 00000000 */   nop
/* C8A84 001C8984 28AE0070 */  paddub     $21, $0, $0
.L001C8988:
/* C8A88 001C8988 A041023C */  lui        $2, (0x41A00000 >> 16)
/* C8A8C 001C898C 00608244 */  mtc1       $2, $f12
/* C8A90 001C8990 28264072 */  paddub     $4, $18, $0
/* C8A94 001C8994 B000A527 */  addiu      $5, $sp, 0xB0
/* C8A98 001C8998 E81F070C */  jal        CheckAtra__11CDungeonMapFPff
/* C8A9C 001C899C 00000000 */   nop
/* C8AA0 001C89A0 02004014 */  bnez       $2, .L001C89AC
/* C8AA4 001C89A4 00000000 */   nop
/* C8AA8 001C89A8 28AE0070 */  paddub     $21, $0, $0
.L001C89AC:
/* C8AAC 001C89AC A041023C */  lui        $2, (0x41A00000 >> 16)
/* C8AB0 001C89B0 00608244 */  mtc1       $2, $f12
/* C8AB4 001C89B4 28264072 */  paddub     $4, $18, $0
/* C8AB8 001C89B8 B000A527 */  addiu      $5, $sp, 0xB0
/* C8ABC 001C89BC 7C1E070C */  jal        CheckTrapCircle__11CDungeonMapFPff
/* C8AC0 001C89C0 00000000 */   nop
/* C8AC4 001C89C4 02004010 */  beqz       $2, .L001C89D0
/* C8AC8 001C89C8 00000000 */   nop
/* C8ACC 001C89CC 28AE0070 */  paddub     $21, $0, $0
.L001C89D0:
/* C8AD0 001C89D0 6B00A012 */  beqz       $21, .L001C8B80
/* C8AD4 001C89D4 00000000 */   nop
/* C8AD8 001C89D8 0100013C */  lui        $at, (0x10000 >> 16)
/* C8ADC 001C89DC 21084102 */  addu       $at, $18, $at
/* C8AE0 001C89E0 80BD228C */  lw         $2, -0x4280($at)
/* C8AE4 001C89E4 40110200 */  sll        $2, $2, 5
/* C8AE8 001C89E8 21104202 */  addu       $2, $18, $2
/* C8AEC 001C89EC 883C4424 */  addiu      $4, $2, 0x3C88
/* C8AF0 001C89F0 F87F8424 */  addiu      $4, $4, 0x7FF8
/* C8AF4 001C89F4 B000A527 */  addiu      $5, $sp, 0xB0
/* C8AF8 001C89F8 0C86040C */  jal        sceVu0CopyVector
/* C8AFC 001C89FC 00000000 */   nop
/* C8B00 001C8A00 0100013C */  lui        $at, (0x10000 >> 16)
/* C8B04 001C8A04 21084102 */  addu       $at, $18, $at
/* C8B08 001C8A08 80BD228C */  lw         $2, -0x4280($at)
/* C8B0C 001C8A0C 40110200 */  sll        $2, $2, 5
/* C8B10 001C8A10 21105200 */  addu       $2, $2, $18
/* C8B14 001C8A14 0100013C */  lui        $at, (0x10000 >> 16)
/* C8B18 001C8A18 21084100 */  addu       $at, $2, $at
/* C8B1C 001C8A1C 98BC20AC */  sw         $0, -0x4368($at)
/* C8B20 001C8A20 80101400 */  sll        $2, $20, 2
/* C8B24 001C8A24 21105D00 */  addu       $2, $2, $sp
/* C8B28 001C8A28 C000438C */  lw         $3, 0xC0($2)
/* C8B2C 001C8A2C 0100013C */  lui        $at, (0x10000 >> 16)
/* C8B30 001C8A30 21084102 */  addu       $at, $18, $at
/* C8B34 001C8A34 80BD228C */  lw         $2, -0x4280($at)
/* C8B38 001C8A38 40110200 */  sll        $2, $2, 5
/* C8B3C 001C8A3C 21105200 */  addu       $2, $2, $18
/* C8B40 001C8A40 0100013C */  lui        $at, (0x10000 >> 16)
/* C8B44 001C8A44 21084100 */  addu       $at, $2, $at
/* C8B48 001C8A48 90BC23AC */  sw         $3, -0x4370($at)
/* C8B4C 001C8A4C 01000324 */  addiu      $3, $0, 0x1
/* C8B50 001C8A50 0100013C */  lui        $at, (0x10000 >> 16)
/* C8B54 001C8A54 21084102 */  addu       $at, $18, $at
/* C8B58 001C8A58 80BD228C */  lw         $2, -0x4280($at)
/* C8B5C 001C8A5C 40110200 */  sll        $2, $2, 5
/* C8B60 001C8A60 21105200 */  addu       $2, $2, $18
/* C8B64 001C8A64 0100013C */  lui        $at, (0x10000 >> 16)
/* C8B68 001C8A68 21084100 */  addu       $at, $2, $at
/* C8B6C 001C8A6C 94BC23AC */  sw         $3, -0x436C($at)
/* C8B70 001C8A70 28260070 */  paddub     $4, $0, $0
/* C8B74 001C8A74 0F000010 */  b          .L001C8AB4
/* C8B78 001C8A78 00000000 */   nop
.L001C8A7C:
/* C8B7C 001C8A7C 80100400 */  sll        $2, $4, 2
/* C8B80 001C8A80 21104400 */  addu       $2, $2, $4
/* C8B84 001C8A84 00110200 */  sll        $2, $2, 4
/* C8B88 001C8A88 21105200 */  addu       $2, $2, $18
/* C8B8C 001C8A8C 0100013C */  lui        $at, (0x10000 >> 16)
/* C8B90 001C8A90 21084100 */  addu       $at, $2, $at
/* C8B94 001C8A94 588D238C */  lw         $3, -0x72A8($at)
/* C8B98 001C8A98 FFFF0224 */  addiu      $2, $0, -0x1
/* C8B9C 001C8A9C 04006214 */  bne        $3, $2, .L001C8AB0
/* C8BA0 001C8AA0 00000000 */   nop
/* C8BA4 001C8AA4 28B68070 */  paddub     $22, $4, $0
/* C8BA8 001C8AA8 0C000010 */  b          .L001C8ADC
/* C8BAC 001C8AAC 00000000 */   nop
.L001C8AB0:
/* C8BB0 001C8AB0 01008424 */  addiu      $4, $4, 0x1
.L001C8AB4:
/* C8BB4 001C8AB4 30008228 */  slti       $2, $4, 0x30
/* C8BB8 001C8AB8 F0FF4014 */  bnez       $2, .L001C8A7C
/* C8BBC 001C8ABC 00000000 */   nop
/* C8BC0 001C8AC0 2A00023C */  lui        $2, %hi(_2448)
/* C8BC4 001C8AC4 C0BE4424 */  addiu      $4, $2, %lo(_2448)
/* C8BC8 001C8AC8 A611040C */  jal        printf
/* C8BCC 001C8ACC 00000000 */   nop
/* C8BD0 001C8AD0 FFFF0424 */  addiu      $4, $0, -0x1
/* C8BD4 001C8AD4 DC05040C */  jal        exit_2
/* C8BD8 001C8AD8 00000000 */   nop
.L001C8ADC:
/* C8BDC 001C8ADC 03000424 */  addiu      $4, $0, 0x3
/* C8BE0 001C8AE0 80101600 */  sll        $2, $22, 2
/* C8BE4 001C8AE4 21105600 */  addu       $2, $2, $22
/* C8BE8 001C8AE8 00890200 */  sll        $17, $2, 4
/* C8BEC 001C8AEC 21183202 */  addu       $3, $17, $18
/* C8BF0 001C8AF0 0100013C */  lui        $at, (0x10000 >> 16)
/* C8BF4 001C8AF4 21086100 */  addu       $at, $3, $at
/* C8BF8 001C8AF8 588D24AC */  sw         $4, -0x72A8($at)
/* C8BFC 001C8AFC 0100013C */  lui        $at, (0x10000 >> 16)
/* C8C00 001C8B00 21086100 */  addu       $at, $3, $at
/* C8C04 001C8B04 5C8D20AC */  sw         $0, -0x72A4($at)
/* C8C08 001C8B08 0100013C */  lui        $at, (0x10000 >> 16)
/* C8C0C 001C8B0C 21086100 */  addu       $at, $3, $at
/* C8C10 001C8B10 508D3EAC */  sw         $fp, -0x72B0($at)
/* C8C14 001C8B14 0100013C */  lui        $at, (0x10000 >> 16)
/* C8C18 001C8B18 21086100 */  addu       $at, $3, $at
/* C8C1C 001C8B1C 548D3EAC */  sw         $fp, -0x72AC($at)
/* C8C20 001C8B20 0100013C */  lui        $at, (0x10000 >> 16)
/* C8C24 001C8B24 21084102 */  addu       $at, $18, $at
/* C8C28 001C8B28 80BD228C */  lw         $2, -0x4280($at)
/* C8C2C 001C8B2C 0100013C */  lui        $at, (0x10000 >> 16)
/* C8C30 001C8B30 21086100 */  addu       $at, $3, $at
/* C8C34 001C8B34 788D22AC */  sw         $2, -0x7288($at)
/* C8C38 001C8B38 680D6424 */  addiu      $4, $3, 0xD68
/* C8C3C 001C8B3C F87F8424 */  addiu      $4, $4, 0x7FF8
/* C8C40 001C8B40 B000A527 */  addiu      $5, $sp, 0xB0
/* C8C44 001C8B44 0C86040C */  jal        sceVu0CopyVector
/* C8C48 001C8B48 00000000 */   nop
/* C8C4C 001C8B4C 5041043C */  lui        $4, (0x41500000 >> 16)
/* C8C50 001C8B50 21183202 */  addu       $3, $17, $18
/* C8C54 001C8B54 0100013C */  lui        $at, (0x10000 >> 16)
/* C8C58 001C8B58 21086100 */  addu       $at, $3, $at
/* C8C5C 001C8B5C 748D24AC */  sw         $4, -0x728C($at)
/* C8C60 001C8B60 0100013C */  lui        $at, (0x10000 >> 16)
/* C8C64 001C8B64 21084102 */  addu       $at, $18, $at
/* C8C68 001C8B68 80BD238C */  lw         $3, -0x4280($at)
/* C8C6C 001C8B6C 01006324 */  addiu      $3, $3, 0x1
/* C8C70 001C8B70 0100013C */  lui        $at, (0x10000 >> 16)
/* C8C74 001C8B74 21084102 */  addu       $at, $18, $at
/* C8C78 001C8B78 80BD23AC */  sw         $3, -0x4280($at)
/* C8C7C 001C8B7C 01009426 */  addiu      $20, $20, 0x1
.L001C8B80:
/* C8C80 001C8B80 2A189002 */  slt        $3, $20, $16
/* C8C84 001C8B84 6DFF6014 */  bnez       $3, .L001C893C
/* C8C88 001C8B88 00000000 */   nop
.L001C8B8C:
/* C8C8C 001C8B8C 9000BF7B */  lq         $31, 0x90($sp)
/* C8C90 001C8B90 8000BE7B */  lq         $fp, 0x80($sp)
/* C8C94 001C8B94 7000B77B */  lq         $23, 0x70($sp)
/* C8C98 001C8B98 6000B67B */  lq         $22, 0x60($sp)
/* C8C9C 001C8B9C 5000B57B */  lq         $21, 0x50($sp)
/* C8CA0 001C8BA0 4000B47B */  lq         $20, 0x40($sp)
/* C8CA4 001C8BA4 3000B37B */  lq         $19, 0x30($sp)
/* C8CA8 001C8BA8 2000B27B */  lq         $18, 0x20($sp)
/* C8CAC 001C8BAC 1000B17B */  lq         $17, 0x10($sp)
/* C8CB0 001C8BB0 0000B07B */  lq         $16, 0x0($sp)
/* C8CB4 001C8BB4 E000BD27 */  addiu      $sp, $sp, 0xE0
/* C8CB8 001C8BB8 0800E003 */  jr         $31
/* C8CBC 001C8BBC 00000000 */   nop
