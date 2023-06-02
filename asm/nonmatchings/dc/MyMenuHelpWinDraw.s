.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MyMenuHelpWinDraw__FiiiiiiiP8CTexture
/* 52A30 00152930 40FEBD27 */  addiu      $sp, $sp, -0x1C0
/* 52A34 00152934 9000BF7F */  sq         $31, 0x90($sp)
/* 52A38 00152938 8000BE7F */  sq         $fp, 0x80($sp)
/* 52A3C 0015293C 7000B77F */  sq         $23, 0x70($sp)
/* 52A40 00152940 6000B67F */  sq         $22, 0x60($sp)
/* 52A44 00152944 5000B57F */  sq         $21, 0x50($sp)
/* 52A48 00152948 4000B47F */  sq         $20, 0x40($sp)
/* 52A4C 0015294C 3000B37F */  sq         $19, 0x30($sp)
/* 52A50 00152950 2000B27F */  sq         $18, 0x20($sp)
/* 52A54 00152954 1000B17F */  sq         $17, 0x10($sp)
/* 52A58 00152958 0000B07F */  sq         $16, 0x0($sp)
/* 52A5C 0015295C 28AE8070 */  paddub     $21, $4, $0
/* 52A60 00152960 28A6A070 */  paddub     $20, $5, $0
/* 52A64 00152964 28860071 */  paddub     $16, $8, $0
/* 52A68 00152968 289E2071 */  paddub     $19, $9, $0
/* 52A6C 0015296C 28964071 */  paddub     $18, $10, $0
/* 52A70 00152970 288E6071 */  paddub     $17, $11, $0
/* 52A74 00152974 2000C128 */  slti       $at, $6, 0x20
/* 52A78 00152978 E0FFD724 */  addiu      $23, $6, -0x20
/* 52A7C 0015297C 0BB80100 */  movn       $23, $0, $at
/* 52A80 00152980 01000010 */  b          .L00152988
/* 52A84 00152984 00000000 */   nop
.L00152988:
/* 52A88 00152988 1C00E128 */  slti       $at, $7, 0x1C
/* 52A8C 0015298C E4FFF624 */  addiu      $22, $7, -0x1C
/* 52A90 00152990 0BB00100 */  movn       $22, $0, $at
/* 52A94 00152994 01000010 */  b          .L0015299C
/* 52A98 00152998 00000000 */   nop
.L0015299C:
/* 52A9C 0015299C 28260070 */  paddub     $4, $0, $0
/* 52AA0 001529A0 046F050C */  jal        setbilinear__Fi
/* 52AA4 001529A4 00000000 */   nop
/* 52AA8 001529A8 B000B3AF */  sw         $19, 0xB0($sp)
/* 52AAC 001529AC B400B2AF */  sw         $18, 0xB4($sp)
/* 52AB0 001529B0 10000324 */  addiu      $3, $0, 0x10
/* 52AB4 001529B4 B800A3AF */  sw         $3, 0xB8($sp)
/* 52AB8 001529B8 0E000224 */  addiu      $2, $0, 0xE
/* 52ABC 001529BC BC00A2AF */  sw         $2, 0xBC($sp)
/* 52AC0 001529C0 A000B5AF */  sw         $21, 0xA0($sp)
/* 52AC4 001529C4 A400B4AF */  sw         $20, 0xA4($sp)
/* 52AC8 001529C8 A800A3AF */  sw         $3, 0xA8($sp)
/* 52ACC 001529CC AC00A2AF */  sw         $2, 0xAC($sp)
/* 52AD0 001529D0 80101000 */  sll        $2, $16, 2
/* 52AD4 001529D4 21185000 */  addu       $3, $2, $16
/* 52AD8 001529D8 80100300 */  sll        $2, $3, 2
/* 52ADC 001529DC 21106200 */  addu       $2, $3, $2
/* 52AE0 001529E0 80100200 */  sll        $2, $2, 2
/* 52AE4 001529E4 C3810200 */  sra        $16, $2, 7
/* 52AE8 001529E8 FF000832 */  andi       $8, $16, 0xFF
/* 52AEC 001529EC D48B848F */  lw         $4, -0x742C($gp)
/* 52AF0 001529F0 282E2072 */  paddub     $5, $17, $0
/* 52AF4 001529F4 A000A627 */  addiu      $6, $sp, 0xA0
/* 52AF8 001529F8 B000A727 */  addiu      $7, $sp, 0xB0
/* 52AFC 001529FC C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52B00 00152A00 00000000 */   nop
/* 52B04 00152A04 D000B3AF */  sw         $19, 0xD0($sp)
/* 52B08 00152A08 0E004226 */  addiu      $2, $18, 0xE
/* 52B0C 00152A0C D400A2AF */  sw         $2, 0xD4($sp)
/* 52B10 00152A10 10000324 */  addiu      $3, $0, 0x10
/* 52B14 00152A14 D800A3AF */  sw         $3, 0xD8($sp)
/* 52B18 00152A18 24000224 */  addiu      $2, $0, 0x24
/* 52B1C 00152A1C DC00A2AF */  sw         $2, 0xDC($sp)
/* 52B20 00152A20 C000B5AF */  sw         $21, 0xC0($sp)
/* 52B24 00152A24 0E008226 */  addiu      $2, $20, 0xE
/* 52B28 00152A28 C400A2AF */  sw         $2, 0xC4($sp)
/* 52B2C 00152A2C C800A3AF */  sw         $3, 0xC8($sp)
/* 52B30 00152A30 CC00B6AF */  sw         $22, 0xCC($sp)
/* 52B34 00152A34 FF000832 */  andi       $8, $16, 0xFF
/* 52B38 00152A38 D48B848F */  lw         $4, -0x742C($gp)
/* 52B3C 00152A3C 282E2072 */  paddub     $5, $17, $0
/* 52B40 00152A40 C000A627 */  addiu      $6, $sp, 0xC0
/* 52B44 00152A44 D000A727 */  addiu      $7, $sp, 0xD0
/* 52B48 00152A48 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52B4C 00152A4C 00000000 */   nop
/* 52B50 00152A50 F000B3AF */  sw         $19, 0xF0($sp)
/* 52B54 00152A54 32004226 */  addiu      $2, $18, 0x32
/* 52B58 00152A58 F400A2AF */  sw         $2, 0xF4($sp)
/* 52B5C 00152A5C 10000424 */  addiu      $4, $0, 0x10
/* 52B60 00152A60 F800A4AF */  sw         $4, 0xF8($sp)
/* 52B64 00152A64 0E000324 */  addiu      $3, $0, 0xE
/* 52B68 00152A68 FC00A3AF */  sw         $3, 0xFC($sp)
/* 52B6C 00152A6C E000B5AF */  sw         $21, 0xE0($sp)
/* 52B70 00152A70 0E008226 */  addiu      $2, $20, 0xE
/* 52B74 00152A74 21F0C202 */  addu       $fp, $22, $2
/* 52B78 00152A78 E400BEAF */  sw         $fp, 0xE4($sp)
/* 52B7C 00152A7C E800A4AF */  sw         $4, 0xE8($sp)
/* 52B80 00152A80 EC00A3AF */  sw         $3, 0xEC($sp)
/* 52B84 00152A84 FF000832 */  andi       $8, $16, 0xFF
/* 52B88 00152A88 D48B848F */  lw         $4, -0x742C($gp)
/* 52B8C 00152A8C 282E2072 */  paddub     $5, $17, $0
/* 52B90 00152A90 E000A627 */  addiu      $6, $sp, 0xE0
/* 52B94 00152A94 F000A727 */  addiu      $7, $sp, 0xF0
/* 52B98 00152A98 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52B9C 00152A9C 00000000 */   nop
/* 52BA0 00152AA0 10006226 */  addiu      $2, $19, 0x10
/* 52BA4 00152AA4 1001A2AF */  sw         $2, 0x110($sp)
/* 52BA8 00152AA8 1401B2AF */  sw         $18, 0x114($sp)
/* 52BAC 00152AAC 20000224 */  addiu      $2, $0, 0x20
/* 52BB0 00152AB0 1801A2AF */  sw         $2, 0x118($sp)
/* 52BB4 00152AB4 0E000324 */  addiu      $3, $0, 0xE
/* 52BB8 00152AB8 1C01A3AF */  sw         $3, 0x11C($sp)
/* 52BBC 00152ABC 1000A226 */  addiu      $2, $21, 0x10
/* 52BC0 00152AC0 0001A2AF */  sw         $2, 0x100($sp)
/* 52BC4 00152AC4 0401B4AF */  sw         $20, 0x104($sp)
/* 52BC8 00152AC8 0801B7AF */  sw         $23, 0x108($sp)
/* 52BCC 00152ACC 0C01A3AF */  sw         $3, 0x10C($sp)
/* 52BD0 00152AD0 FF000832 */  andi       $8, $16, 0xFF
/* 52BD4 00152AD4 D48B848F */  lw         $4, -0x742C($gp)
/* 52BD8 00152AD8 282E2072 */  paddub     $5, $17, $0
/* 52BDC 00152ADC 0001A627 */  addiu      $6, $sp, 0x100
/* 52BE0 00152AE0 1001A727 */  addiu      $7, $sp, 0x110
/* 52BE4 00152AE4 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52BE8 00152AE8 00000000 */   nop
/* 52BEC 00152AEC 10006226 */  addiu      $2, $19, 0x10
/* 52BF0 00152AF0 3001A2AF */  sw         $2, 0x130($sp)
/* 52BF4 00152AF4 0E004226 */  addiu      $2, $18, 0xE
/* 52BF8 00152AF8 3401A2AF */  sw         $2, 0x134($sp)
/* 52BFC 00152AFC 20000224 */  addiu      $2, $0, 0x20
/* 52C00 00152B00 3801A2AF */  sw         $2, 0x138($sp)
/* 52C04 00152B04 24000224 */  addiu      $2, $0, 0x24
/* 52C08 00152B08 3C01A2AF */  sw         $2, 0x13C($sp)
/* 52C0C 00152B0C 1000A226 */  addiu      $2, $21, 0x10
/* 52C10 00152B10 2001A2AF */  sw         $2, 0x120($sp)
/* 52C14 00152B14 0E008226 */  addiu      $2, $20, 0xE
/* 52C18 00152B18 2401A2AF */  sw         $2, 0x124($sp)
/* 52C1C 00152B1C 2801B7AF */  sw         $23, 0x128($sp)
/* 52C20 00152B20 2C01B6AF */  sw         $22, 0x12C($sp)
/* 52C24 00152B24 FF000832 */  andi       $8, $16, 0xFF
/* 52C28 00152B28 D48B848F */  lw         $4, -0x742C($gp)
/* 52C2C 00152B2C 282E2072 */  paddub     $5, $17, $0
/* 52C30 00152B30 2001A627 */  addiu      $6, $sp, 0x120
/* 52C34 00152B34 3001A727 */  addiu      $7, $sp, 0x130
/* 52C38 00152B38 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52C3C 00152B3C 00000000 */   nop
/* 52C40 00152B40 10006226 */  addiu      $2, $19, 0x10
/* 52C44 00152B44 5001A2AF */  sw         $2, 0x150($sp)
/* 52C48 00152B48 32004226 */  addiu      $2, $18, 0x32
/* 52C4C 00152B4C 5401A2AF */  sw         $2, 0x154($sp)
/* 52C50 00152B50 20000224 */  addiu      $2, $0, 0x20
/* 52C54 00152B54 5801A2AF */  sw         $2, 0x158($sp)
/* 52C58 00152B58 0E000324 */  addiu      $3, $0, 0xE
/* 52C5C 00152B5C 5C01A3AF */  sw         $3, 0x15C($sp)
/* 52C60 00152B60 1000A226 */  addiu      $2, $21, 0x10
/* 52C64 00152B64 4001A2AF */  sw         $2, 0x140($sp)
/* 52C68 00152B68 4401BEAF */  sw         $fp, 0x144($sp)
/* 52C6C 00152B6C 4801B7AF */  sw         $23, 0x148($sp)
/* 52C70 00152B70 4C01A3AF */  sw         $3, 0x14C($sp)
/* 52C74 00152B74 FF000832 */  andi       $8, $16, 0xFF
/* 52C78 00152B78 D48B848F */  lw         $4, -0x742C($gp)
/* 52C7C 00152B7C 282E2072 */  paddub     $5, $17, $0
/* 52C80 00152B80 4001A627 */  addiu      $6, $sp, 0x140
/* 52C84 00152B84 5001A727 */  addiu      $7, $sp, 0x150
/* 52C88 00152B88 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52C8C 00152B8C 00000000 */   nop
/* 52C90 00152B90 30006226 */  addiu      $2, $19, 0x30
/* 52C94 00152B94 7001A2AF */  sw         $2, 0x170($sp)
/* 52C98 00152B98 7401B2AF */  sw         $18, 0x174($sp)
/* 52C9C 00152B9C 10000424 */  addiu      $4, $0, 0x10
/* 52CA0 00152BA0 7801A4AF */  sw         $4, 0x178($sp)
/* 52CA4 00152BA4 0E000324 */  addiu      $3, $0, 0xE
/* 52CA8 00152BA8 7C01A3AF */  sw         $3, 0x17C($sp)
/* 52CAC 00152BAC 1000A226 */  addiu      $2, $21, 0x10
/* 52CB0 00152BB0 21A8E202 */  addu       $21, $23, $2
/* 52CB4 00152BB4 6001B5AF */  sw         $21, 0x160($sp)
/* 52CB8 00152BB8 6401B4AF */  sw         $20, 0x164($sp)
/* 52CBC 00152BBC 6801A4AF */  sw         $4, 0x168($sp)
/* 52CC0 00152BC0 6C01A3AF */  sw         $3, 0x16C($sp)
/* 52CC4 00152BC4 FF000832 */  andi       $8, $16, 0xFF
/* 52CC8 00152BC8 D48B848F */  lw         $4, -0x742C($gp)
/* 52CCC 00152BCC 282E2072 */  paddub     $5, $17, $0
/* 52CD0 00152BD0 6001A627 */  addiu      $6, $sp, 0x160
/* 52CD4 00152BD4 7001A727 */  addiu      $7, $sp, 0x170
/* 52CD8 00152BD8 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52CDC 00152BDC 00000000 */   nop
/* 52CE0 00152BE0 30006226 */  addiu      $2, $19, 0x30
/* 52CE4 00152BE4 9001A2AF */  sw         $2, 0x190($sp)
/* 52CE8 00152BE8 0E004226 */  addiu      $2, $18, 0xE
/* 52CEC 00152BEC 9401A2AF */  sw         $2, 0x194($sp)
/* 52CF0 00152BF0 10000324 */  addiu      $3, $0, 0x10
/* 52CF4 00152BF4 9801A3AF */  sw         $3, 0x198($sp)
/* 52CF8 00152BF8 24000224 */  addiu      $2, $0, 0x24
/* 52CFC 00152BFC 9C01A2AF */  sw         $2, 0x19C($sp)
/* 52D00 00152C00 8001B5AF */  sw         $21, 0x180($sp)
/* 52D04 00152C04 0E008226 */  addiu      $2, $20, 0xE
/* 52D08 00152C08 8401A2AF */  sw         $2, 0x184($sp)
/* 52D0C 00152C0C 8801A3AF */  sw         $3, 0x188($sp)
/* 52D10 00152C10 8C01B6AF */  sw         $22, 0x18C($sp)
/* 52D14 00152C14 FF000832 */  andi       $8, $16, 0xFF
/* 52D18 00152C18 D48B848F */  lw         $4, -0x742C($gp)
/* 52D1C 00152C1C 282E2072 */  paddub     $5, $17, $0
/* 52D20 00152C20 8001A627 */  addiu      $6, $sp, 0x180
/* 52D24 00152C24 9001A727 */  addiu      $7, $sp, 0x190
/* 52D28 00152C28 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52D2C 00152C2C 00000000 */   nop
/* 52D30 00152C30 30006226 */  addiu      $2, $19, 0x30
/* 52D34 00152C34 B001A2AF */  sw         $2, 0x1B0($sp)
/* 52D38 00152C38 32004226 */  addiu      $2, $18, 0x32
/* 52D3C 00152C3C B401A2AF */  sw         $2, 0x1B4($sp)
/* 52D40 00152C40 10000324 */  addiu      $3, $0, 0x10
/* 52D44 00152C44 B801A3AF */  sw         $3, 0x1B8($sp)
/* 52D48 00152C48 0E000224 */  addiu      $2, $0, 0xE
/* 52D4C 00152C4C BC01A2AF */  sw         $2, 0x1BC($sp)
/* 52D50 00152C50 A001B5AF */  sw         $21, 0x1A0($sp)
/* 52D54 00152C54 A401BEAF */  sw         $fp, 0x1A4($sp)
/* 52D58 00152C58 A801A3AF */  sw         $3, 0x1A8($sp)
/* 52D5C 00152C5C AC01A2AF */  sw         $2, 0x1AC($sp)
/* 52D60 00152C60 FF000832 */  andi       $8, $16, 0xFF
/* 52D64 00152C64 D48B848F */  lw         $4, -0x742C($gp)
/* 52D68 00152C68 282E2072 */  paddub     $5, $17, $0
/* 52D6C 00152C6C A001A627 */  addiu      $6, $sp, 0x1A0
/* 52D70 00152C70 B001A727 */  addiu      $7, $sp, 0x1B0
/* 52D74 00152C74 C470050C */  jal        set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc
/* 52D78 00152C78 00000000 */   nop
/* 52D7C 00152C7C 9000BF7B */  lq         $31, 0x90($sp)
/* 52D80 00152C80 8000BE7B */  lq         $fp, 0x80($sp)
/* 52D84 00152C84 7000B77B */  lq         $23, 0x70($sp)
/* 52D88 00152C88 6000B67B */  lq         $22, 0x60($sp)
/* 52D8C 00152C8C 5000B57B */  lq         $21, 0x50($sp)
/* 52D90 00152C90 4000B47B */  lq         $20, 0x40($sp)
/* 52D94 00152C94 3000B37B */  lq         $19, 0x30($sp)
/* 52D98 00152C98 2000B27B */  lq         $18, 0x20($sp)
/* 52D9C 00152C9C 1000B17B */  lq         $17, 0x10($sp)
/* 52DA0 00152CA0 0000B07B */  lq         $16, 0x0($sp)
/* 52DA4 00152CA4 C001BD27 */  addiu      $sp, $sp, 0x1C0
/* 52DA8 00152CA8 0800E003 */  jr         $31
/* 52DAC 00152CAC 00000000 */   nop
