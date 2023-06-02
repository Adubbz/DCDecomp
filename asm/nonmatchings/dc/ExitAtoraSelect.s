.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExitAtoraSelect__Fv
/* 11A990 0021A890 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 11A994 0021A894 1000BF7F */  sq         $31, 0x10($sp)
/* 11A998 0021A898 0000B07F */  sq         $16, 0x0($sp)
/* 11A99C 0021A89C 1C8D848F */  lw         $4, -0x72E4($gp)
/* 11A9A0 0021A8A0 D05E050C */  jal        GetMenuCursor__9CSaveDataFv
/* 11A9A4 0021A8A4 00000000 */   nop
/* 11A9A8 0021A8A8 00004384 */  lh         $3, 0x0($2)
/* 11A9AC 0021A8AC 15006014 */  bnez       $3, .L0021A904
/* 11A9B0 0021A8B0 00000000 */   nop
/* 11A9B4 0021A8B4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A9B8 0021A8B8 D080238C */  lw         $3, -0x7F30($at)
/* 11A9BC 0021A8BC 1C0043A4 */  sh         $3, 0x1C($2)
/* 11A9C0 0021A8C0 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A9C4 0021A8C4 D080248C */  lw         $4, -0x7F30($at)
/* 11A9C8 0021A8C8 01000324 */  addiu      $3, $0, 0x1
/* 11A9CC 0021A8CC 09008310 */  beq        $4, $3, .L0021A8F4
/* 11A9D0 0021A8D0 00000000 */   nop
/* 11A9D4 0021A8D4 03008010 */  beqz       $4, .L0021A8E4
/* 11A9D8 0021A8D8 00000000 */   nop
/* 11A9DC 0021A8DC 08000010 */  b          .L0021A900
/* 11A9E0 0021A8E0 00000000 */   nop
.L0021A8E4:
/* 11A9E4 0021A8E4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A9E8 0021A8E8 DE803084 */  lh         $16, -0x7F22($at)
/* 11A9EC 0021A8EC 04000010 */  b          .L0021A900
/* 11A9F0 0021A8F0 00000000 */   nop
.L0021A8F4:
/* 11A9F4 0021A8F4 DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11A9F8 0021A8F8 F080308C */  lw         $16, -0x7F10($at)
/* 11A9FC 0021A8FC 00000000 */  nop
.L0021A900:
/* 11AA00 0021A900 080050A4 */  sh         $16, 0x8($2)
.L0021A904:
/* 11AA04 0021A904 DA01023C */  lui        $2, %hi(CommonMenuMes2)
/* 11AA08 0021A908 50234424 */  addiu      $4, $2, %lo(CommonMenuMes2)
/* 11AA0C 0021A90C DB01013C */  lui        $at, (0x1DB0000 >> 16)
/* 11AA10 0021A910 7482258C */  lw         $5, -0x7D8C($at)
/* 11AA14 0021A914 8036050C */  jal        SetBuff__6ClsMesFPs
/* 11AA18 0021A918 00000000 */   nop
/* 11AA1C 0021A91C FFFF0224 */  addiu      $2, $0, -0x1
/* 11AA20 0021A920 DA01013C */  lui        $at, (0x1DA3B64 >> 16)
/* 11AA24 0021A924 643B22AC */  sw         $2, (0x1DA3B64 & 0xFFFF)($at)
/* 11AA28 0021A928 DA01023C */  lui        $2, %hi(CommonMenuMes3)
/* 11AA2C 0021A92C 103B4424 */  addiu      $4, $2, %lo(CommonMenuMes3)
/* 11AA30 0021A930 01000524 */  addiu      $5, $0, 0x1
/* 11AA34 0021A934 9836050C */  jal        Preset__6ClsMesFi
/* 11AA38 0021A938 00000000 */   nop
/* 11AA3C 0021A93C DA01013C */  lui        $at, (0x1DA69AC >> 16)
/* 11AA40 0021A940 AC6920AC */  sw         $0, (0x1DA69AC & 0xFFFF)($at)
/* 11AA44 0021A944 1000BF7B */  lq         $31, 0x10($sp)
/* 11AA48 0021A948 0000B07B */  lq         $16, 0x0($sp)
/* 11AA4C 0021A94C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 11AA50 0021A950 0800E003 */  jr         $31
/* 11AA54 0021A954 00000000 */   nop
/* 11AA58 0021A958 00000000 */  nop
/* 11AA5C 0021A95C 00000000 */  nop
