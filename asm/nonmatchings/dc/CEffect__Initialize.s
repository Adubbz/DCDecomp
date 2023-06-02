.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__7CEffectFv
/* 64970 00164870 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 64974 00164874 1000BF7F */  sq         $31, 0x10($sp)
/* 64978 00164878 0000B07F */  sq         $16, 0x0($sp)
/* 6497C 0016487C 28868070 */  paddub     $16, $4, $0
/* 64980 00164880 000080A4 */  sh         $0, 0x0($4)
/* 64984 00164884 020080A4 */  sh         $0, 0x2($4)
/* 64988 00164888 040080A4 */  sh         $0, 0x4($4)
/* 6498C 0016488C 060080A4 */  sh         $0, 0x6($4)
/* 64990 00164890 100080AC */  sw         $0, 0x10($4)
/* 64994 00164894 700080AC */  sw         $0, 0x70($4)
/* 64998 00164898 C00080AC */  sw         $0, 0xC0($4)
/* 6499C 0016489C 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 649A0 001648A0 C40082AC */  sw         $2, 0xC4($4)
/* 649A4 001648A4 CC0080AC */  sw         $0, 0xCC($4)
/* 649A8 001648A8 C80080AC */  sw         $0, 0xC8($4)
/* 649AC 001648AC 0C0080AC */  sw         $0, 0xC($4)
/* 649B0 001648B0 080080AC */  sw         $0, 0x8($4)
/* 649B4 001648B4 2C0080AC */  sw         $0, 0x2C($4)
/* 649B8 001648B8 280080AC */  sw         $0, 0x28($4)
/* 649BC 001648BC 240080AC */  sw         $0, 0x24($4)
/* 649C0 001648C0 200080AC */  sw         $0, 0x20($4)
/* 649C4 001648C4 30000426 */  addiu      $4, $16, 0x30
/* 649C8 001648C8 20000526 */  addiu      $5, $16, 0x20
/* 649CC 001648CC 0C86040C */  jal        sceVu0CopyVector
/* 649D0 001648D0 00000000 */   nop
/* 649D4 001648D4 40000426 */  addiu      $4, $16, 0x40
/* 649D8 001648D8 20000526 */  addiu      $5, $16, 0x20
/* 649DC 001648DC 0C86040C */  jal        sceVu0CopyVector
/* 649E0 001648E0 00000000 */   nop
/* 649E4 001648E4 50000426 */  addiu      $4, $16, 0x50
/* 649E8 001648E8 20000526 */  addiu      $5, $16, 0x20
/* 649EC 001648EC 0C86040C */  jal        sceVu0CopyVector
/* 649F0 001648F0 00000000 */   nop
/* 649F4 001648F4 60000426 */  addiu      $4, $16, 0x60
/* 649F8 001648F8 20000526 */  addiu      $5, $16, 0x20
/* 649FC 001648FC 0C86040C */  jal        sceVu0CopyVector
/* 64A00 00164900 00000000 */   nop
/* 64A04 00164904 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 64A08 00164908 840002AE */  sw         $2, 0x84($16)
/* 64A0C 0016490C 800002AE */  sw         $2, 0x80($16)
/* 64A10 00164910 90000426 */  addiu      $4, $16, 0x90
/* 64A14 00164914 20000526 */  addiu      $5, $16, 0x20
/* 64A18 00164918 0C86040C */  jal        sceVu0CopyVector
/* 64A1C 0016491C 00000000 */   nop
/* 64A20 00164920 A0000426 */  addiu      $4, $16, 0xA0
/* 64A24 00164924 20000526 */  addiu      $5, $16, 0x20
/* 64A28 00164928 0C86040C */  jal        sceVu0CopyVector
/* 64A2C 0016492C 00000000 */   nop
/* 64A30 00164930 B0000426 */  addiu      $4, $16, 0xB0
/* 64A34 00164934 20000526 */  addiu      $5, $16, 0x20
/* 64A38 00164938 0C86040C */  jal        sceVu0CopyVector
/* 64A3C 0016493C 00000000 */   nop
/* 64A40 00164940 D00000AE */  sw         $0, 0xD0($16)
/* 64A44 00164944 2000A0AF */  sw         $0, 0x20($sp)
/* 64A48 00164948 2400A0AF */  sw         $0, 0x24($sp)
/* 64A4C 0016494C 2800A0AF */  sw         $0, 0x28($sp)
/* 64A50 00164950 2C00A0AF */  sw         $0, 0x2C($sp)
/* 64A54 00164954 2000A327 */  addiu      $3, $sp, 0x20
/* 64A58 00164958 00006378 */  lq         $3, 0x0($3)
/* 64A5C 0016495C E000037E */  sq         $3, 0xE0($16)
/* 64A60 00164960 F00000AE */  sw         $0, 0xF0($16)
/* 64A64 00164964 F40000AE */  sw         $0, 0xF4($16)
/* 64A68 00164968 1000BF7B */  lq         $31, 0x10($sp)
/* 64A6C 0016496C 0000B07B */  lq         $16, 0x0($sp)
/* 64A70 00164970 3000BD27 */  addiu      $sp, $sp, 0x30
/* 64A74 00164974 0800E003 */  jr         $31
/* 64A78 00164978 00000000 */   nop
/* 64A7C 0016497C 00000000 */  nop
