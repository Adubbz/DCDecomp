.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Myset2DSprite_Fuchi__6ClsMesFP13sceVif1PacketP8CTextureiiiiiiii
/* 50910 00150810 C0FEBD27 */  addiu      $sp, $sp, -0x140
/* 50914 00150814 9000BF7F */  sq         $31, 0x90($sp)
/* 50918 00150818 8000BE7F */  sq         $fp, 0x80($sp)
/* 5091C 0015081C 7000B77F */  sq         $23, 0x70($sp)
/* 50920 00150820 6000B67F */  sq         $22, 0x60($sp)
/* 50924 00150824 5000B57F */  sq         $21, 0x50($sp)
/* 50928 00150828 4000B47F */  sq         $20, 0x40($sp)
/* 5092C 0015082C 3000B37F */  sq         $19, 0x30($sp)
/* 50930 00150830 2000B27F */  sq         $18, 0x20($sp)
/* 50934 00150834 1000B17F */  sq         $17, 0x10($sp)
/* 50938 00150838 0000B07F */  sq         $16, 0x0($sp)
/* 5093C 0015083C 28B68070 */  paddub     $22, $4, $0
/* 50940 00150840 28AEA070 */  paddub     $21, $5, $0
/* 50944 00150844 28A6C070 */  paddub     $20, $6, $0
/* 50948 00150848 289EE070 */  paddub     $19, $7, $0
/* 5094C 0015084C 28960071 */  paddub     $18, $8, $0
/* 50950 00150850 288E2071 */  paddub     $17, $9, $0
/* 50954 00150854 28864071 */  paddub     $16, $10, $0
/* 50958 00150858 28BE6071 */  paddub     $23, $11, $0
/* 5095C 0015085C C016848C */  lw         $4, 0x16C0($4)
/* 50960 00150860 04000324 */  addiu      $3, $0, 0x4
/* 50964 00150864 88008310 */  beq        $4, $3, .L00150A88
/* 50968 00150868 00000000 */   nop
/* 5096C 0015086C 03000324 */  addiu      $3, $0, 0x3
/* 50970 00150870 49008310 */  beq        $4, $3, .L00150998
/* 50974 00150874 00000000 */   nop
/* 50978 00150878 02000324 */  addiu      $3, $0, 0x2
/* 5097C 0015087C 26008310 */  beq        $4, $3, .L00150918
/* 50980 00150880 00000000 */   nop
/* 50984 00150884 01000324 */  addiu      $3, $0, 0x1
/* 50988 00150888 03008310 */  beq        $4, $3, .L00150898
/* 5098C 0015088C 00000000 */   nop
/* 50990 00150890 B9000010 */  b          .L00150B78
/* 50994 00150894 00000000 */   nop
.L00150898:
/* 50998 00150898 D416C38E */  lw         $3, 0x16D4($22)
/* 5099C 0015089C 40006128 */  slti       $at, $3, 0x40
/* 509A0 001508A0 03002010 */  beqz       $at, .L001508B0
/* 509A4 001508A4 00000000 */   nop
/* 509A8 001508A8 02000010 */  b          .L001508B4
/* 509AC 001508AC 00000000 */   nop
.L001508B0:
/* 509B0 001508B0 40000324 */  addiu      $3, $0, 0x40
.L001508B4:
/* 509B4 001508B4 B000B7AF */  sw         $23, 0xB0($sp)
/* 509B8 001508B8 4001A28F */  lw         $2, 0x140($sp)
/* 509BC 001508BC B400A2AF */  sw         $2, 0xB4($sp)
/* 509C0 001508C0 4801A28F */  lw         $2, 0x148($sp)
/* 509C4 001508C4 B800A2AF */  sw         $2, 0xB8($sp)
/* 509C8 001508C8 5001A28F */  lw         $2, 0x150($sp)
/* 509CC 001508CC BC00A2AF */  sw         $2, 0xBC($sp)
/* 509D0 001508D0 01006226 */  addiu      $2, $19, 0x1
/* 509D4 001508D4 A000A2AF */  sw         $2, 0xA0($sp)
/* 509D8 001508D8 01004226 */  addiu      $2, $18, 0x1
/* 509DC 001508DC A400A2AF */  sw         $2, 0xA4($sp)
/* 509E0 001508E0 A800B1AF */  sw         $17, 0xA8($sp)
/* 509E4 001508E4 AC00B0AF */  sw         $16, 0xAC($sp)
/* 509E8 001508E8 FF006B30 */  andi       $11, $3, 0xFF
/* 509EC 001508EC 2826A072 */  paddub     $4, $21, $0
/* 509F0 001508F0 282E8072 */  paddub     $5, $20, $0
/* 509F4 001508F4 A000A627 */  addiu      $6, $sp, 0xA0
/* 509F8 001508F8 B000A727 */  addiu      $7, $sp, 0xB0
/* 509FC 001508FC FF000824 */  addiu      $8, $0, 0xFF
/* 50A00 00150900 284E0071 */  paddub     $9, $8, $0
/* 50A04 00150904 28560071 */  paddub     $10, $8, $0
/* 50A08 00150908 F030050C */  jal        set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 50A0C 0015090C 00000000 */   nop
/* 50A10 00150910 99000010 */  b          .L00150B78
/* 50A14 00150914 00000000 */   nop
.L00150918:
/* 50A18 00150918 D416C38E */  lw         $3, 0x16D4($22)
/* 50A1C 0015091C 40006128 */  slti       $at, $3, 0x40
/* 50A20 00150920 03002010 */  beqz       $at, .L00150930
/* 50A24 00150924 00000000 */   nop
/* 50A28 00150928 02000010 */  b          .L00150934
/* 50A2C 0015092C 00000000 */   nop
.L00150930:
/* 50A30 00150930 40000324 */  addiu      $3, $0, 0x40
.L00150934:
/* 50A34 00150934 D000B7AF */  sw         $23, 0xD0($sp)
/* 50A38 00150938 4001A28F */  lw         $2, 0x140($sp)
/* 50A3C 0015093C D400A2AF */  sw         $2, 0xD4($sp)
/* 50A40 00150940 4801A28F */  lw         $2, 0x148($sp)
/* 50A44 00150944 D800A2AF */  sw         $2, 0xD8($sp)
/* 50A48 00150948 5001A28F */  lw         $2, 0x150($sp)
/* 50A4C 0015094C DC00A2AF */  sw         $2, 0xDC($sp)
/* 50A50 00150950 01006226 */  addiu      $2, $19, 0x1
/* 50A54 00150954 C000A2AF */  sw         $2, 0xC0($sp)
/* 50A58 00150958 01004226 */  addiu      $2, $18, 0x1
/* 50A5C 0015095C C400A2AF */  sw         $2, 0xC4($sp)
/* 50A60 00150960 C800B1AF */  sw         $17, 0xC8($sp)
/* 50A64 00150964 CC00B0AF */  sw         $16, 0xCC($sp)
/* 50A68 00150968 FF006B30 */  andi       $11, $3, 0xFF
/* 50A6C 0015096C 2826A072 */  paddub     $4, $21, $0
/* 50A70 00150970 282E8072 */  paddub     $5, $20, $0
/* 50A74 00150974 C000A627 */  addiu      $6, $sp, 0xC0
/* 50A78 00150978 D000A727 */  addiu      $7, $sp, 0xD0
/* 50A7C 0015097C 28460070 */  paddub     $8, $0, $0
/* 50A80 00150980 284E0070 */  paddub     $9, $0, $0
/* 50A84 00150984 28560070 */  paddub     $10, $0, $0
/* 50A88 00150988 F030050C */  jal        set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 50A8C 0015098C 00000000 */   nop
/* 50A90 00150990 79000010 */  b          .L00150B78
/* 50A94 00150994 00000000 */   nop
.L00150998:
/* 50A98 00150998 28F60070 */  paddub     $fp, $0, $0
/* 50A9C 0015099C 2F000010 */  b          .L00150A5C
/* 50AA0 001509A0 00000000 */   nop
.L001509A4:
/* 50AA4 001509A4 D416C28E */  lw         $2, 0x16D4($22)
/* 50AA8 001509A8 2A084400 */  slt        $at, $2, $4
/* 50AAC 001509AC 0A108100 */  movz       $2, $4, $at
/* 50AB0 001509B0 01000010 */  b          .L001509B8
/* 50AB4 001509B4 00000000 */   nop
.L001509B8:
/* 50AB8 001509B8 F000B7AF */  sw         $23, 0xF0($sp)
/* 50ABC 001509BC 4001A48F */  lw         $4, 0x140($sp)
/* 50AC0 001509C0 F400A4AF */  sw         $4, 0xF4($sp)
/* 50AC4 001509C4 4801A48F */  lw         $4, 0x148($sp)
/* 50AC8 001509C8 F800A4AF */  sw         $4, 0xF8($sp)
/* 50ACC 001509CC 5001A48F */  lw         $4, 0x150($sp)
/* 50AD0 001509D0 FC00A4AF */  sw         $4, 0xFC($sp)
/* 50AD4 001509D4 2500043C */  lui        $4, %hi(FuchiTbl_E + 0x4)
/* 50AD8 001509D8 243F8424 */  addiu      $4, $4, %lo(FuchiTbl_E + 0x4)
/* 50ADC 001509DC 21208300 */  addu       $4, $4, $3
/* 50AE0 001509E0 0000848C */  lw         $4, 0x0($4)
/* 50AE4 001509E4 21284402 */  addu       $5, $18, $4
/* 50AE8 001509E8 2500043C */  lui        $4, %hi(FuchiTbl_E)
/* 50AEC 001509EC 203F8424 */  addiu      $4, $4, %lo(FuchiTbl_E)
/* 50AF0 001509F0 21208300 */  addu       $4, $4, $3
/* 50AF4 001509F4 0000848C */  lw         $4, 0x0($4)
/* 50AF8 001509F8 21206402 */  addu       $4, $19, $4
/* 50AFC 001509FC E000A4AF */  sw         $4, 0xE0($sp)
/* 50B00 00150A00 E400A5AF */  sw         $5, 0xE4($sp)
/* 50B04 00150A04 E800B1AF */  sw         $17, 0xE8($sp)
/* 50B08 00150A08 EC00B0AF */  sw         $16, 0xEC($sp)
/* 50B0C 00150A0C 2500043C */  lui        $4, %hi(FuchiTbl_E + 0x8)
/* 50B10 00150A10 283F8424 */  addiu      $4, $4, %lo(FuchiTbl_E + 0x8)
/* 50B14 00150A14 21208300 */  addu       $4, $4, $3
/* 50B18 00150A18 00008890 */  lbu        $8, 0x0($4)
/* 50B1C 00150A1C 2500043C */  lui        $4, %hi(FuchiTbl_E + 0xC)
/* 50B20 00150A20 2C3F8424 */  addiu      $4, $4, %lo(FuchiTbl_E + 0xC)
/* 50B24 00150A24 21208300 */  addu       $4, $4, $3
/* 50B28 00150A28 00008990 */  lbu        $9, 0x0($4)
/* 50B2C 00150A2C 2500043C */  lui        $4, %hi(FuchiTbl_E + 0x10)
/* 50B30 00150A30 303F8424 */  addiu      $4, $4, %lo(FuchiTbl_E + 0x10)
/* 50B34 00150A34 21188300 */  addu       $3, $4, $3
/* 50B38 00150A38 00006A90 */  lbu        $10, 0x0($3)
/* 50B3C 00150A3C FF004B30 */  andi       $11, $2, 0xFF
/* 50B40 00150A40 2826A072 */  paddub     $4, $21, $0
/* 50B44 00150A44 282E8072 */  paddub     $5, $20, $0
/* 50B48 00150A48 E000A627 */  addiu      $6, $sp, 0xE0
/* 50B4C 00150A4C F000A727 */  addiu      $7, $sp, 0xF0
/* 50B50 00150A50 F030050C */  jal        set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 50B54 00150A54 00000000 */   nop
/* 50B58 00150A58 0100DE27 */  addiu      $fp, $fp, 0x1
.L00150A5C:
/* 50B5C 00150A5C 40181E00 */  sll        $3, $fp, 1
/* 50B60 00150A60 21187E00 */  addu       $3, $3, $fp
/* 50B64 00150A64 C0180300 */  sll        $3, $3, 3
/* 50B68 00150A68 2500043C */  lui        $4, %hi(FuchiTbl_E + 0x14)
/* 50B6C 00150A6C 343F8424 */  addiu      $4, $4, %lo(FuchiTbl_E + 0x14)
/* 50B70 00150A70 21208300 */  addu       $4, $4, $3
/* 50B74 00150A74 0000848C */  lw         $4, 0x0($4)
/* 50B78 00150A78 CAFF801C */  bgtz       $4, .L001509A4
/* 50B7C 00150A7C 00000000 */   nop
/* 50B80 00150A80 3D000010 */  b          .L00150B78
/* 50B84 00150A84 00000000 */   nop
.L00150A88:
/* 50B88 00150A88 D416C38E */  lw         $3, 0x16D4($22)
/* 50B8C 00150A8C 80006128 */  slti       $at, $3, 0x80
/* 50B90 00150A90 03002010 */  beqz       $at, .L00150AA0
/* 50B94 00150A94 00000000 */   nop
/* 50B98 00150A98 02000010 */  b          .L00150AA4
/* 50B9C 00150A9C 00000000 */   nop
.L00150AA0:
/* 50BA0 00150AA0 80000324 */  addiu      $3, $0, 0x80
.L00150AA4:
/* 50BA4 00150AA4 1001B7AF */  sw         $23, 0x110($sp)
/* 50BA8 00150AA8 4001A28F */  lw         $2, 0x140($sp)
/* 50BAC 00150AAC 1401A2AF */  sw         $2, 0x114($sp)
/* 50BB0 00150AB0 4801A28F */  lw         $2, 0x148($sp)
/* 50BB4 00150AB4 1801A2AF */  sw         $2, 0x118($sp)
/* 50BB8 00150AB8 5001A28F */  lw         $2, 0x150($sp)
/* 50BBC 00150ABC 1C01A2AF */  sw         $2, 0x11C($sp)
/* 50BC0 00150AC0 01006226 */  addiu      $2, $19, 0x1
/* 50BC4 00150AC4 0001A2AF */  sw         $2, 0x100($sp)
/* 50BC8 00150AC8 01004226 */  addiu      $2, $18, 0x1
/* 50BCC 00150ACC 0401A2AF */  sw         $2, 0x104($sp)
/* 50BD0 00150AD0 0801B1AF */  sw         $17, 0x108($sp)
/* 50BD4 00150AD4 0C01B0AF */  sw         $16, 0x10C($sp)
/* 50BD8 00150AD8 FF006B30 */  andi       $11, $3, 0xFF
/* 50BDC 00150ADC 2826A072 */  paddub     $4, $21, $0
/* 50BE0 00150AE0 282E8072 */  paddub     $5, $20, $0
/* 50BE4 00150AE4 0001A627 */  addiu      $6, $sp, 0x100
/* 50BE8 00150AE8 1001A727 */  addiu      $7, $sp, 0x110
/* 50BEC 00150AEC 40000824 */  addiu      $8, $0, 0x40
/* 50BF0 00150AF0 284E0071 */  paddub     $9, $8, $0
/* 50BF4 00150AF4 28560071 */  paddub     $10, $8, $0
/* 50BF8 00150AF8 F030050C */  jal        set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 50BFC 00150AFC 00000000 */   nop
/* 50C00 00150B00 D416C38E */  lw         $3, 0x16D4($22)
/* 50C04 00150B04 80006128 */  slti       $at, $3, 0x80
/* 50C08 00150B08 03002010 */  beqz       $at, .L00150B18
/* 50C0C 00150B0C 00000000 */   nop
/* 50C10 00150B10 02000010 */  b          .L00150B1C
/* 50C14 00150B14 00000000 */   nop
.L00150B18:
/* 50C18 00150B18 80000324 */  addiu      $3, $0, 0x80
.L00150B1C:
/* 50C1C 00150B1C 3001B7AF */  sw         $23, 0x130($sp)
/* 50C20 00150B20 4001A28F */  lw         $2, 0x140($sp)
/* 50C24 00150B24 3401A2AF */  sw         $2, 0x134($sp)
/* 50C28 00150B28 4801A28F */  lw         $2, 0x148($sp)
/* 50C2C 00150B2C 3801A2AF */  sw         $2, 0x138($sp)
/* 50C30 00150B30 5001A28F */  lw         $2, 0x150($sp)
/* 50C34 00150B34 3C01A2AF */  sw         $2, 0x13C($sp)
/* 50C38 00150B38 02006226 */  addiu      $2, $19, 0x2
/* 50C3C 00150B3C 2001A2AF */  sw         $2, 0x120($sp)
/* 50C40 00150B40 02004226 */  addiu      $2, $18, 0x2
/* 50C44 00150B44 2401A2AF */  sw         $2, 0x124($sp)
/* 50C48 00150B48 2801B1AF */  sw         $17, 0x128($sp)
/* 50C4C 00150B4C 2C01B0AF */  sw         $16, 0x12C($sp)
/* 50C50 00150B50 FF006B30 */  andi       $11, $3, 0xFF
/* 50C54 00150B54 2826A072 */  paddub     $4, $21, $0
/* 50C58 00150B58 282E8072 */  paddub     $5, $20, $0
/* 50C5C 00150B5C 2001A627 */  addiu      $6, $sp, 0x120
/* 50C60 00150B60 3001A727 */  addiu      $7, $sp, 0x130
/* 50C64 00150B64 28460070 */  paddub     $8, $0, $0
/* 50C68 00150B68 284E0070 */  paddub     $9, $0, $0
/* 50C6C 00150B6C 28560070 */  paddub     $10, $0, $0
/* 50C70 00150B70 F030050C */  jal        set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
/* 50C74 00150B74 00000000 */   nop
.L00150B78:
/* 50C78 00150B78 9000BF7B */  lq         $31, 0x90($sp)
/* 50C7C 00150B7C 8000BE7B */  lq         $fp, 0x80($sp)
/* 50C80 00150B80 7000B77B */  lq         $23, 0x70($sp)
/* 50C84 00150B84 6000B67B */  lq         $22, 0x60($sp)
/* 50C88 00150B88 5000B57B */  lq         $21, 0x50($sp)
/* 50C8C 00150B8C 4000B47B */  lq         $20, 0x40($sp)
/* 50C90 00150B90 3000B37B */  lq         $19, 0x30($sp)
/* 50C94 00150B94 2000B27B */  lq         $18, 0x20($sp)
/* 50C98 00150B98 1000B17B */  lq         $17, 0x10($sp)
/* 50C9C 00150B9C 0000B07B */  lq         $16, 0x0($sp)
/* 50CA0 00150BA0 4001BD27 */  addiu      $sp, $sp, 0x140
/* 50CA4 00150BA4 0800E003 */  jr         $31
/* 50CA8 00150BA8 00000000 */   nop
/* 50CAC 00150BAC 00000000 */  nop
