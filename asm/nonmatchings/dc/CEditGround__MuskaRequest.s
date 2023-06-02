.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MuskaRequest__11CEditGroundFPA64_P9CMapParts
/* A7A20 001A7920 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* A7A24 001A7924 2000BF7F */  sq         $31, 0x20($sp)
/* A7A28 001A7928 1000B17F */  sq         $17, 0x10($sp)
/* A7A2C 001A792C 0000B07F */  sq         $16, 0x0($sp)
/* A7A30 001A7930 288E8070 */  paddub     $17, $4, $0
/* A7A34 001A7934 2886A070 */  paddub     $16, $5, $0
/* A7A38 001A7938 09000524 */  addiu      $5, $0, 0x9
/* A7A3C 001A793C 0100013C */  lui        $at, (0x15030 >> 16)
/* A7A40 001A7940 21088100 */  addu       $at, $4, $at
/* A7A44 001A7944 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7A48 001A7948 000065AC */  sw         $5, 0x0($3)
/* A7A4C 001A794C 0400838C */  lw         $3, 0x4($4)
/* A7A50 001A7950 72016010 */  beqz       $3, .L001A7F1C
/* A7A54 001A7954 00000000 */   nop
/* A7A58 001A7958 0000038E */  lw         $3, 0x0($16)
/* A7A5C 001A795C 39006010 */  beqz       $3, .L001A7A44
/* A7A60 001A7960 00000000 */   nop
/* A7A64 001A7964 0008038E */  lw         $3, 0x800($16)
/* A7A68 001A7968 36006010 */  beqz       $3, .L001A7A44
/* A7A6C 001A796C 00000000 */   nop
/* A7A70 001A7970 01000224 */  addiu      $2, $0, 0x1
/* A7A74 001A7974 C000A2AF */  sw         $2, 0xC0($sp)
/* A7A78 001A7978 C400A0AF */  sw         $0, 0xC4($sp)
/* A7A7C 001A797C 06000224 */  addiu      $2, $0, 0x6
/* A7A80 001A7980 C800A2AF */  sw         $2, 0xC8($sp)
/* A7A84 001A7984 03000224 */  addiu      $2, $0, 0x3
/* A7A88 001A7988 CC00A2AF */  sw         $2, 0xCC($sp)
/* A7A8C 001A798C 282E0070 */  paddub     $5, $0, $0
/* A7A90 001A7990 28360070 */  paddub     $6, $0, $0
/* A7A94 001A7994 C000A727 */  addiu      $7, $sp, 0xC0
/* A7A98 001A7998 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7A9C 001A799C 00000000 */   nop
/* A7AA0 001A79A0 28004010 */  beqz       $2, .L001A7A44
/* A7AA4 001A79A4 00000000 */   nop
/* A7AA8 001A79A8 3C00A0AF */  sw         $0, 0x3C($sp)
/* A7AAC 001A79AC 3800A0AF */  sw         $0, 0x38($sp)
/* A7AB0 001A79B0 3400A0AF */  sw         $0, 0x34($sp)
/* A7AB4 001A79B4 3000A0AF */  sw         $0, 0x30($sp)
/* A7AB8 001A79B8 28262072 */  paddub     $4, $17, $0
/* A7ABC 001A79BC 3000A527 */  addiu      $5, $sp, 0x30
/* A7AC0 001A79C0 0000068E */  lw         $6, 0x0($16)
/* A7AC4 001A79C4 02000724 */  addiu      $7, $0, 0x2
/* A7AC8 001A79C8 0E000824 */  addiu      $8, $0, 0xE
/* A7ACC 001A79CC D499060C */  jal        GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A7AD0 001A79D0 00000000 */   nop
/* A7AD4 001A79D4 28262072 */  paddub     $4, $17, $0
/* A7AD8 001A79D8 08000524 */  addiu      $5, $0, 0x8
/* A7ADC 001A79DC 28360070 */  paddub     $6, $0, $0
/* A7AE0 001A79E0 3000A727 */  addiu      $7, $sp, 0x30
/* A7AE4 001A79E4 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7AE8 001A79E8 00000000 */   nop
/* A7AEC 001A79EC 15004010 */  beqz       $2, .L001A7A44
/* A7AF0 001A79F0 00000000 */   nop
/* A7AF4 001A79F4 0000048E */  lw         $4, 0x0($16)
/* A7AF8 001A79F8 0008058E */  lw         $5, 0x800($16)
/* A7AFC 001A79FC 01000624 */  addiu      $6, $0, 0x1
/* A7B00 001A7A00 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A7B04 001A7A04 00000000 */   nop
/* A7B08 001A7A08 0E004010 */  beqz       $2, .L001A7A44
/* A7B0C 001A7A0C 00000000 */   nop
/* A7B10 001A7A10 0100013C */  lui        $at, (0x15030 >> 16)
/* A7B14 001A7A14 21082102 */  addu       $at, $17, $at
/* A7B18 001A7A18 3050248C */  lw         $4, (0x15030 & 0xFFFF)($at)
/* A7B1C 001A7A1C 282E0070 */  paddub     $5, $0, $0
/* A7B20 001A7A20 4068060C */  jal        GetCompEvent__14CEditPartsInfoFi
/* A7B24 001A7A24 00000000 */   nop
/* A7B28 001A7A28 06004010 */  beqz       $2, .L001A7A44
/* A7B2C 001A7A2C 00000000 */   nop
/* A7B30 001A7A30 01000424 */  addiu      $4, $0, 0x1
/* A7B34 001A7A34 0100013C */  lui        $at, (0x15030 >> 16)
/* A7B38 001A7A38 21082102 */  addu       $at, $17, $at
/* A7B3C 001A7A3C 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7B40 001A7A40 040064AC */  sw         $4, 0x4($3)
.L001A7A44:
/* A7B44 001A7A44 0001038E */  lw         $3, 0x100($16)
/* A7B48 001A7A48 23006010 */  beqz       $3, .L001A7AD8
/* A7B4C 001A7A4C 00000000 */   nop
/* A7B50 001A7A50 000A038E */  lw         $3, 0xA00($16)
/* A7B54 001A7A54 20006010 */  beqz       $3, .L001A7AD8
/* A7B58 001A7A58 00000000 */   nop
/* A7B5C 001A7A5C 4C00A0AF */  sw         $0, 0x4C($sp)
/* A7B60 001A7A60 4800A0AF */  sw         $0, 0x48($sp)
/* A7B64 001A7A64 4400A0AF */  sw         $0, 0x44($sp)
/* A7B68 001A7A68 4000A0AF */  sw         $0, 0x40($sp)
/* A7B6C 001A7A6C 28262072 */  paddub     $4, $17, $0
/* A7B70 001A7A70 4000A527 */  addiu      $5, $sp, 0x40
/* A7B74 001A7A74 0001068E */  lw         $6, 0x100($16)
/* A7B78 001A7A78 02000724 */  addiu      $7, $0, 0x2
/* A7B7C 001A7A7C 0E000824 */  addiu      $8, $0, 0xE
/* A7B80 001A7A80 D499060C */  jal        GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A7B84 001A7A84 00000000 */   nop
/* A7B88 001A7A88 28262072 */  paddub     $4, $17, $0
/* A7B8C 001A7A8C 0A000524 */  addiu      $5, $0, 0xA
/* A7B90 001A7A90 28360070 */  paddub     $6, $0, $0
/* A7B94 001A7A94 4000A727 */  addiu      $7, $sp, 0x40
/* A7B98 001A7A98 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7B9C 001A7A9C 00000000 */   nop
/* A7BA0 001A7AA0 0D004010 */  beqz       $2, .L001A7AD8
/* A7BA4 001A7AA4 00000000 */   nop
/* A7BA8 001A7AA8 0001048E */  lw         $4, 0x100($16)
/* A7BAC 001A7AAC 000A058E */  lw         $5, 0xA00($16)
/* A7BB0 001A7AB0 01000624 */  addiu      $6, $0, 0x1
/* A7BB4 001A7AB4 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A7BB8 001A7AB8 00000000 */   nop
/* A7BBC 001A7ABC 06004010 */  beqz       $2, .L001A7AD8
/* A7BC0 001A7AC0 00000000 */   nop
/* A7BC4 001A7AC4 01000424 */  addiu      $4, $0, 0x1
/* A7BC8 001A7AC8 0100013C */  lui        $at, (0x15030 >> 16)
/* A7BCC 001A7ACC 21082102 */  addu       $at, $17, $at
/* A7BD0 001A7AD0 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7BD4 001A7AD4 080064AC */  sw         $4, 0x8($3)
.L001A7AD8:
/* A7BD8 001A7AD8 0002038E */  lw         $3, 0x200($16)
/* A7BDC 001A7ADC 23006010 */  beqz       $3, .L001A7B6C
/* A7BE0 001A7AE0 00000000 */   nop
/* A7BE4 001A7AE4 0009038E */  lw         $3, 0x900($16)
/* A7BE8 001A7AE8 20006010 */  beqz       $3, .L001A7B6C
/* A7BEC 001A7AEC 00000000 */   nop
/* A7BF0 001A7AF0 5C00A0AF */  sw         $0, 0x5C($sp)
/* A7BF4 001A7AF4 5800A0AF */  sw         $0, 0x58($sp)
/* A7BF8 001A7AF8 5400A0AF */  sw         $0, 0x54($sp)
/* A7BFC 001A7AFC 5000A0AF */  sw         $0, 0x50($sp)
/* A7C00 001A7B00 28262072 */  paddub     $4, $17, $0
/* A7C04 001A7B04 5000A527 */  addiu      $5, $sp, 0x50
/* A7C08 001A7B08 0002068E */  lw         $6, 0x200($16)
/* A7C0C 001A7B0C 02000724 */  addiu      $7, $0, 0x2
/* A7C10 001A7B10 0E000824 */  addiu      $8, $0, 0xE
/* A7C14 001A7B14 D499060C */  jal        GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A7C18 001A7B18 00000000 */   nop
/* A7C1C 001A7B1C 28262072 */  paddub     $4, $17, $0
/* A7C20 001A7B20 09000524 */  addiu      $5, $0, 0x9
/* A7C24 001A7B24 28360070 */  paddub     $6, $0, $0
/* A7C28 001A7B28 5000A727 */  addiu      $7, $sp, 0x50
/* A7C2C 001A7B2C 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7C30 001A7B30 00000000 */   nop
/* A7C34 001A7B34 0D004010 */  beqz       $2, .L001A7B6C
/* A7C38 001A7B38 00000000 */   nop
/* A7C3C 001A7B3C 0002048E */  lw         $4, 0x200($16)
/* A7C40 001A7B40 0009058E */  lw         $5, 0x900($16)
/* A7C44 001A7B44 28360070 */  paddub     $6, $0, $0
/* A7C48 001A7B48 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A7C4C 001A7B4C 00000000 */   nop
/* A7C50 001A7B50 06004010 */  beqz       $2, .L001A7B6C
/* A7C54 001A7B54 00000000 */   nop
/* A7C58 001A7B58 01000424 */  addiu      $4, $0, 0x1
/* A7C5C 001A7B5C 0100013C */  lui        $at, (0x15030 >> 16)
/* A7C60 001A7B60 21082102 */  addu       $at, $17, $at
/* A7C64 001A7B64 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7C68 001A7B68 0C0064AC */  sw         $4, 0xC($3)
.L001A7B6C:
/* A7C6C 001A7B6C 0003038E */  lw         $3, 0x300($16)
/* A7C70 001A7B70 35006010 */  beqz       $3, .L001A7C48
/* A7C74 001A7B74 00000000 */   nop
/* A7C78 001A7B78 0009038E */  lw         $3, 0x900($16)
/* A7C7C 001A7B7C 32006010 */  beqz       $3, .L001A7C48
/* A7C80 001A7B80 00000000 */   nop
/* A7C84 001A7B84 6C00A0AF */  sw         $0, 0x6C($sp)
/* A7C88 001A7B88 6800A0AF */  sw         $0, 0x68($sp)
/* A7C8C 001A7B8C 6400A0AF */  sw         $0, 0x64($sp)
/* A7C90 001A7B90 6000A0AF */  sw         $0, 0x60($sp)
/* A7C94 001A7B94 28262072 */  paddub     $4, $17, $0
/* A7C98 001A7B98 6000A527 */  addiu      $5, $sp, 0x60
/* A7C9C 001A7B9C 000B068E */  lw         $6, 0xB00($16)
/* A7CA0 001A7BA0 02000724 */  addiu      $7, $0, 0x2
/* A7CA4 001A7BA4 B098060C */  jal        GetRectParts__11CEditGroundFP8CRect_i_P9CMapPartsi
/* A7CA8 001A7BA8 00000000 */   nop
/* A7CAC 001A7BAC 28262072 */  paddub     $4, $17, $0
/* A7CB0 001A7BB0 03000524 */  addiu      $5, $0, 0x3
/* A7CB4 001A7BB4 28360070 */  paddub     $6, $0, $0
/* A7CB8 001A7BB8 6000A727 */  addiu      $7, $sp, 0x60
/* A7CBC 001A7BBC 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7CC0 001A7BC0 00000000 */   nop
/* A7CC4 001A7BC4 20004010 */  beqz       $2, .L001A7C48
/* A7CC8 001A7BC8 00000000 */   nop
/* A7CCC 001A7BCC 7C00A0AF */  sw         $0, 0x7C($sp)
/* A7CD0 001A7BD0 7800A0AF */  sw         $0, 0x78($sp)
/* A7CD4 001A7BD4 7400A0AF */  sw         $0, 0x74($sp)
/* A7CD8 001A7BD8 7000A0AF */  sw         $0, 0x70($sp)
/* A7CDC 001A7BDC 28262072 */  paddub     $4, $17, $0
/* A7CE0 001A7BE0 7000A527 */  addiu      $5, $sp, 0x70
/* A7CE4 001A7BE4 0003068E */  lw         $6, 0x300($16)
/* A7CE8 001A7BE8 02000724 */  addiu      $7, $0, 0x2
/* A7CEC 001A7BEC 0E000824 */  addiu      $8, $0, 0xE
/* A7CF0 001A7BF0 D499060C */  jal        GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A7CF4 001A7BF4 00000000 */   nop
/* A7CF8 001A7BF8 28262072 */  paddub     $4, $17, $0
/* A7CFC 001A7BFC 09000524 */  addiu      $5, $0, 0x9
/* A7D00 001A7C00 28360070 */  paddub     $6, $0, $0
/* A7D04 001A7C04 7000A727 */  addiu      $7, $sp, 0x70
/* A7D08 001A7C08 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7D0C 001A7C0C 00000000 */   nop
/* A7D10 001A7C10 0D004010 */  beqz       $2, .L001A7C48
/* A7D14 001A7C14 00000000 */   nop
/* A7D18 001A7C18 0003048E */  lw         $4, 0x300($16)
/* A7D1C 001A7C1C 0009058E */  lw         $5, 0x900($16)
/* A7D20 001A7C20 02000624 */  addiu      $6, $0, 0x2
/* A7D24 001A7C24 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A7D28 001A7C28 00000000 */   nop
/* A7D2C 001A7C2C 06004010 */  beqz       $2, .L001A7C48
/* A7D30 001A7C30 00000000 */   nop
/* A7D34 001A7C34 01000424 */  addiu      $4, $0, 0x1
/* A7D38 001A7C38 0100013C */  lui        $at, (0x15030 >> 16)
/* A7D3C 001A7C3C 21082102 */  addu       $at, $17, $at
/* A7D40 001A7C40 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7D44 001A7C44 100064AC */  sw         $4, 0x10($3)
.L001A7C48:
/* A7D48 001A7C48 0004038E */  lw         $3, 0x400($16)
/* A7D4C 001A7C4C 23006010 */  beqz       $3, .L001A7CDC
/* A7D50 001A7C50 00000000 */   nop
/* A7D54 001A7C54 0009038E */  lw         $3, 0x900($16)
/* A7D58 001A7C58 20006010 */  beqz       $3, .L001A7CDC
/* A7D5C 001A7C5C 00000000 */   nop
/* A7D60 001A7C60 8C00A0AF */  sw         $0, 0x8C($sp)
/* A7D64 001A7C64 8800A0AF */  sw         $0, 0x88($sp)
/* A7D68 001A7C68 8400A0AF */  sw         $0, 0x84($sp)
/* A7D6C 001A7C6C 8000A0AF */  sw         $0, 0x80($sp)
/* A7D70 001A7C70 28262072 */  paddub     $4, $17, $0
/* A7D74 001A7C74 8000A527 */  addiu      $5, $sp, 0x80
/* A7D78 001A7C78 0004068E */  lw         $6, 0x400($16)
/* A7D7C 001A7C7C 02000724 */  addiu      $7, $0, 0x2
/* A7D80 001A7C80 0E000824 */  addiu      $8, $0, 0xE
/* A7D84 001A7C84 D499060C */  jal        GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A7D88 001A7C88 00000000 */   nop
/* A7D8C 001A7C8C 28262072 */  paddub     $4, $17, $0
/* A7D90 001A7C90 09000524 */  addiu      $5, $0, 0x9
/* A7D94 001A7C94 28360070 */  paddub     $6, $0, $0
/* A7D98 001A7C98 8000A727 */  addiu      $7, $sp, 0x80
/* A7D9C 001A7C9C 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7DA0 001A7CA0 00000000 */   nop
/* A7DA4 001A7CA4 0D004010 */  beqz       $2, .L001A7CDC
/* A7DA8 001A7CA8 00000000 */   nop
/* A7DAC 001A7CAC 0004048E */  lw         $4, 0x400($16)
/* A7DB0 001A7CB0 0009058E */  lw         $5, 0x900($16)
/* A7DB4 001A7CB4 01000624 */  addiu      $6, $0, 0x1
/* A7DB8 001A7CB8 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A7DBC 001A7CBC 00000000 */   nop
/* A7DC0 001A7CC0 06004010 */  beqz       $2, .L001A7CDC
/* A7DC4 001A7CC4 00000000 */   nop
/* A7DC8 001A7CC8 01000424 */  addiu      $4, $0, 0x1
/* A7DCC 001A7CCC 0100013C */  lui        $at, (0x15030 >> 16)
/* A7DD0 001A7CD0 21082102 */  addu       $at, $17, $at
/* A7DD4 001A7CD4 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7DD8 001A7CD8 140064AC */  sw         $4, 0x14($3)
.L001A7CDC:
/* A7DDC 001A7CDC 0005038E */  lw         $3, 0x500($16)
/* A7DE0 001A7CE0 23006010 */  beqz       $3, .L001A7D70
/* A7DE4 001A7CE4 00000000 */   nop
/* A7DE8 001A7CE8 000A038E */  lw         $3, 0xA00($16)
/* A7DEC 001A7CEC 20006010 */  beqz       $3, .L001A7D70
/* A7DF0 001A7CF0 00000000 */   nop
/* A7DF4 001A7CF4 9C00A0AF */  sw         $0, 0x9C($sp)
/* A7DF8 001A7CF8 9800A0AF */  sw         $0, 0x98($sp)
/* A7DFC 001A7CFC 9400A0AF */  sw         $0, 0x94($sp)
/* A7E00 001A7D00 9000A0AF */  sw         $0, 0x90($sp)
/* A7E04 001A7D04 28262072 */  paddub     $4, $17, $0
/* A7E08 001A7D08 9000A527 */  addiu      $5, $sp, 0x90
/* A7E0C 001A7D0C 0005068E */  lw         $6, 0x500($16)
/* A7E10 001A7D10 02000724 */  addiu      $7, $0, 0x2
/* A7E14 001A7D14 0E000824 */  addiu      $8, $0, 0xE
/* A7E18 001A7D18 D499060C */  jal        GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A7E1C 001A7D1C 00000000 */   nop
/* A7E20 001A7D20 28262072 */  paddub     $4, $17, $0
/* A7E24 001A7D24 0A000524 */  addiu      $5, $0, 0xA
/* A7E28 001A7D28 28360070 */  paddub     $6, $0, $0
/* A7E2C 001A7D2C 9000A727 */  addiu      $7, $sp, 0x90
/* A7E30 001A7D30 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7E34 001A7D34 00000000 */   nop
/* A7E38 001A7D38 0D004010 */  beqz       $2, .L001A7D70
/* A7E3C 001A7D3C 00000000 */   nop
/* A7E40 001A7D40 0005048E */  lw         $4, 0x500($16)
/* A7E44 001A7D44 000A058E */  lw         $5, 0xA00($16)
/* A7E48 001A7D48 28360070 */  paddub     $6, $0, $0
/* A7E4C 001A7D4C 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A7E50 001A7D50 00000000 */   nop
/* A7E54 001A7D54 06004010 */  beqz       $2, .L001A7D70
/* A7E58 001A7D58 00000000 */   nop
/* A7E5C 001A7D5C 01000424 */  addiu      $4, $0, 0x1
/* A7E60 001A7D60 0100013C */  lui        $at, (0x15030 >> 16)
/* A7E64 001A7D64 21082102 */  addu       $at, $17, $at
/* A7E68 001A7D68 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7E6C 001A7D6C 180064AC */  sw         $4, 0x18($3)
.L001A7D70:
/* A7E70 001A7D70 0006038E */  lw         $3, 0x600($16)
/* A7E74 001A7D74 28006010 */  beqz       $3, .L001A7E18
/* A7E78 001A7D78 00000000 */   nop
/* A7E7C 001A7D7C 0008038E */  lw         $3, 0x800($16)
/* A7E80 001A7D80 25006010 */  beqz       $3, .L001A7E18
/* A7E84 001A7D84 00000000 */   nop
/* A7E88 001A7D88 AC00A0AF */  sw         $0, 0xAC($sp)
/* A7E8C 001A7D8C A800A0AF */  sw         $0, 0xA8($sp)
/* A7E90 001A7D90 A400A0AF */  sw         $0, 0xA4($sp)
/* A7E94 001A7D94 A000A0AF */  sw         $0, 0xA0($sp)
/* A7E98 001A7D98 28262072 */  paddub     $4, $17, $0
/* A7E9C 001A7D9C A000A527 */  addiu      $5, $sp, 0xA0
/* A7EA0 001A7DA0 0006068E */  lw         $6, 0x600($16)
/* A7EA4 001A7DA4 02000724 */  addiu      $7, $0, 0x2
/* A7EA8 001A7DA8 0E000824 */  addiu      $8, $0, 0xE
/* A7EAC 001A7DAC D499060C */  jal        GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A7EB0 001A7DB0 00000000 */   nop
/* A7EB4 001A7DB4 28262072 */  paddub     $4, $17, $0
/* A7EB8 001A7DB8 08000524 */  addiu      $5, $0, 0x8
/* A7EBC 001A7DBC 28360070 */  paddub     $6, $0, $0
/* A7EC0 001A7DC0 A000A727 */  addiu      $7, $sp, 0xA0
/* A7EC4 001A7DC4 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7EC8 001A7DC8 00000000 */   nop
/* A7ECC 001A7DCC 12004010 */  beqz       $2, .L001A7E18
/* A7ED0 001A7DD0 00000000 */   nop
/* A7ED4 001A7DD4 0006048E */  lw         $4, 0x600($16)
/* A7ED8 001A7DD8 0008058E */  lw         $5, 0x800($16)
/* A7EDC 001A7DDC 28360070 */  paddub     $6, $0, $0
/* A7EE0 001A7DE0 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A7EE4 001A7DE4 00000000 */   nop
/* A7EE8 001A7DE8 0B004010 */  beqz       $2, .L001A7E18
/* A7EEC 001A7DEC 00000000 */   nop
/* A7EF0 001A7DF0 0006048E */  lw         $4, 0x600($16)
/* A7EF4 001A7DF4 2C6A060C */  jal        GetRotY__9CMapPartsFv
/* A7EF8 001A7DF8 00000000 */   nop
/* A7EFC 001A7DFC 01000424 */  addiu      $4, $0, 0x1
/* A7F00 001A7E00 05004414 */  bne        $2, $4, .L001A7E18
/* A7F04 001A7E04 00000000 */   nop
/* A7F08 001A7E08 0100013C */  lui        $at, (0x15030 >> 16)
/* A7F0C 001A7E0C 21082102 */  addu       $at, $17, $at
/* A7F10 001A7E10 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7F14 001A7E14 1C0064AC */  sw         $4, 0x1C($3)
.L001A7E18:
/* A7F18 001A7E18 0007038E */  lw         $3, 0x700($16)
/* A7F1C 001A7E1C 23006010 */  beqz       $3, .L001A7EAC
/* A7F20 001A7E20 00000000 */   nop
/* A7F24 001A7E24 0008038E */  lw         $3, 0x800($16)
/* A7F28 001A7E28 20006010 */  beqz       $3, .L001A7EAC
/* A7F2C 001A7E2C 00000000 */   nop
/* A7F30 001A7E30 BC00A0AF */  sw         $0, 0xBC($sp)
/* A7F34 001A7E34 B800A0AF */  sw         $0, 0xB8($sp)
/* A7F38 001A7E38 B400A0AF */  sw         $0, 0xB4($sp)
/* A7F3C 001A7E3C B000A0AF */  sw         $0, 0xB0($sp)
/* A7F40 001A7E40 28262072 */  paddub     $4, $17, $0
/* A7F44 001A7E44 B000A527 */  addiu      $5, $sp, 0xB0
/* A7F48 001A7E48 0007068E */  lw         $6, 0x700($16)
/* A7F4C 001A7E4C 02000724 */  addiu      $7, $0, 0x2
/* A7F50 001A7E50 0E000824 */  addiu      $8, $0, 0xE
/* A7F54 001A7E54 D499060C */  jal        GetRectDirParts__11CEditGroundFP8CRect_i_P9CMapPartsii
/* A7F58 001A7E58 00000000 */   nop
/* A7F5C 001A7E5C 28262072 */  paddub     $4, $17, $0
/* A7F60 001A7E60 08000524 */  addiu      $5, $0, 0x8
/* A7F64 001A7E64 28360070 */  paddub     $6, $0, $0
/* A7F68 001A7E68 B000A727 */  addiu      $7, $sp, 0xB0
/* A7F6C 001A7E6C 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7F70 001A7E70 00000000 */   nop
/* A7F74 001A7E74 0D004010 */  beqz       $2, .L001A7EAC
/* A7F78 001A7E78 00000000 */   nop
/* A7F7C 001A7E7C 0007048E */  lw         $4, 0x700($16)
/* A7F80 001A7E80 0008058E */  lw         $5, 0x800($16)
/* A7F84 001A7E84 02000624 */  addiu      $6, $0, 0x2
/* A7F88 001A7E88 249E060C */  jal        CheckRot__FP9CMapPartsP9CMapPartsi
/* A7F8C 001A7E8C 00000000 */   nop
/* A7F90 001A7E90 06004010 */  beqz       $2, .L001A7EAC
/* A7F94 001A7E94 00000000 */   nop
/* A7F98 001A7E98 01000424 */  addiu      $4, $0, 0x1
/* A7F9C 001A7E9C 0100013C */  lui        $at, (0x15030 >> 16)
/* A7FA0 001A7EA0 21082102 */  addu       $at, $17, $at
/* A7FA4 001A7EA4 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A7FA8 001A7EA8 200064AC */  sw         $4, 0x20($3)
.L001A7EAC:
/* A7FAC 001A7EAC 000A038E */  lw         $3, 0xA00($16)
/* A7FB0 001A7EB0 1A006010 */  beqz       $3, .L001A7F1C
/* A7FB4 001A7EB4 00000000 */   nop
/* A7FB8 001A7EB8 02000224 */  addiu      $2, $0, 0x2
/* A7FBC 001A7EBC D000A2AF */  sw         $2, 0xD0($sp)
/* A7FC0 001A7EC0 D400A0AF */  sw         $0, 0xD4($sp)
/* A7FC4 001A7EC4 03000224 */  addiu      $2, $0, 0x3
/* A7FC8 001A7EC8 D800A2AF */  sw         $2, 0xD8($sp)
/* A7FCC 001A7ECC 0E000224 */  addiu      $2, $0, 0xE
/* A7FD0 001A7ED0 DC00A2AF */  sw         $2, 0xDC($sp)
/* A7FD4 001A7ED4 28262072 */  paddub     $4, $17, $0
/* A7FD8 001A7ED8 0A000524 */  addiu      $5, $0, 0xA
/* A7FDC 001A7EDC 28360070 */  paddub     $6, $0, $0
/* A7FE0 001A7EE0 D000A727 */  addiu      $7, $sp, 0xD0
/* A7FE4 001A7EE4 7898060C */  jal        CheckPartsRect__11CEditGroundFiiR8CRect_i_
/* A7FE8 001A7EE8 00000000 */   nop
/* A7FEC 001A7EEC 0B004010 */  beqz       $2, .L001A7F1C
/* A7FF0 001A7EF0 00000000 */   nop
/* A7FF4 001A7EF4 000A048E */  lw         $4, 0xA00($16)
/* A7FF8 001A7EF8 2C6A060C */  jal        GetRotY__9CMapPartsFv
/* A7FFC 001A7EFC 00000000 */   nop
/* A8000 001A7F00 06004014 */  bnez       $2, .L001A7F1C
/* A8004 001A7F04 00000000 */   nop
/* A8008 001A7F08 01000424 */  addiu      $4, $0, 0x1
/* A800C 001A7F0C 0100013C */  lui        $at, (0x15030 >> 16)
/* A8010 001A7F10 21082102 */  addu       $at, $17, $at
/* A8014 001A7F14 3050238C */  lw         $3, (0x15030 & 0xFFFF)($at)
/* A8018 001A7F18 2C0064AC */  sw         $4, 0x2C($3)
.L001A7F1C:
/* A801C 001A7F1C 2000BF7B */  lq         $31, 0x20($sp)
/* A8020 001A7F20 1000B17B */  lq         $17, 0x10($sp)
/* A8024 001A7F24 0000B07B */  lq         $16, 0x0($sp)
/* A8028 001A7F28 E000BD27 */  addiu      $sp, $sp, 0xE0
/* A802C 001A7F2C 0800E003 */  jr         $31
/* A8030 001A7F30 00000000 */   nop
/* A8034 001A7F34 00000000 */  nop
/* A8038 001A7F38 00000000 */  nop
/* A803C 001A7F3C 00000000 */  nop
