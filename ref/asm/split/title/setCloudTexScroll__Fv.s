.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setCloudTexScroll__Fv
/* 00C850 01DB8550 60FFBD27 */  addiu       $29, $29, -0xA0
/* 00C854 01DB8554 6000BF7F */  sq          $31, 0x60($29)
/* 00C858 01DB8558 5000B37F */  sq          $19, 0x50($29)
/* 00C85C 01DB855C 4000B27F */  sq          $18, 0x40($29)
/* 00C860 01DB8560 3000B17F */  sq          $17, 0x30($29)
/* 00C864 01DB8564 2000B07F */  sq          $16, 0x20($29)
/* 00C868 01DB8568 98998283 */  lb          $2, -0x6668($28)
/* 00C86C 01DB856C 04004014 */  bnez        $2, .L01DB8580_2BDD80
/* 00C870 01DB8570 00000000 */   nop
/* 00C874 01DB8574 949980AF */  sw          $0, -0x666C($28)
/* 00C878 01DB8578 01000224 */  addiu       $2, $0, 0x1
/* 00C87C 01DB857C 989982A3 */  sb          $2, -0x6668($28)
.L01DB8580_2BDD80:
/* 00C880 01DB8580 A0998283 */  lb          $2, -0x6660($28)
/* 00C884 01DB8584 04004014 */  bnez        $2, .L01DB8598_2BDD98
/* 00C888 01DB8588 00000000 */   nop
/* 00C88C 01DB858C 9C9980AF */  sw          $0, -0x6664($28)
/* 00C890 01DB8590 01000224 */  addiu       $2, $0, 0x1
/* 00C894 01DB8594 A09982A3 */  sb          $2, -0x6660($28)
.L01DB8598_2BDD98:
/* 00C898 01DB8598 DD01023C */  lui         $2, %hi(LIT_1068)
/* 00C89C 01DB859C D0674224 */  addiu       $2, $2, %lo(LIT_1068)
/* 00C8A0 01DB85A0 7000A327 */  addiu       $3, $29, 0x70
/* 00C8A4 01DB85A4 00004278 */  lq          $2, 0x0($2)
/* 00C8A8 01DB85A8 0000627C */  sq          $2, 0x0($3)
/* 00C8AC 01DB85AC D48B848F */  lw          $4, -0x742C($28)
/* 00C8B0 01DB85B0 282E0070 */  paddub      $5, $0, $0
/* 00C8B4 01DB85B4 2083040C */  jal         sceVif1PkCnt
/* 00C8B8 01DB85B8 00000000 */   nop
/* 00C8BC 01DB85BC D48B848F */  lw          $4, -0x742C($28)
/* 00C8C0 01DB85C0 282E0070 */  paddub      $5, $0, $0
/* 00C8C4 01DB85C4 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 00C8C8 01DB85C8 00000000 */   nop
/* 00C8CC 01DB85CC 7000A227 */  addiu       $2, $29, 0x70
/* 00C8D0 01DB85D0 D48B848F */  lw          $4, -0x742C($28)
/* 00C8D4 01DB85D4 00004578 */  lq          $5, 0x0($2)
/* 00C8D8 01DB85D8 B083040C */  jal         sceVif1PkOpenGifTag
/* 00C8DC 01DB85DC 00000000 */   nop
/* 00C8E0 01DB85E0 D48B848F */  lw          $4, -0x742C($28)
/* 00C8E4 01DB85E4 3F000524 */  addiu       $5, $0, 0x3F
/* 00C8E8 01DB85E8 28360070 */  paddub      $6, $0, $0
/* 00C8EC 01DB85EC 0A84040C */  jal         sceVif1PkAddGsAD
/* 00C8F0 01DB85F0 00000000 */   nop
/* 00C8F4 01DB85F4 D48B848F */  lw          $4, -0x742C($28)
/* 00C8F8 01DB85F8 B683040C */  jal         sceVif1PkCloseGifTag
/* 00C8FC 01DB85FC 00000000 */   nop
/* 00C900 01DB8600 D48B848F */  lw          $4, -0x742C($28)
/* 00C904 01DB8604 A483040C */  jal         sceVif1PkCloseDirectCode
/* 00C908 01DB8608 00000000 */   nop
/* 00C90C 01DB860C D48B848F */  lw          $4, -0x742C($28)
/* 00C910 01DB8610 0A83040C */  jal         sceVif1PkTerminate
/* 00C914 01DB8614 00000000 */   nop
/* 00C918 01DB8618 9C9981C7 */  lwc1        $f1, -0x6664($28)
/* 00C91C 01DB861C 00008044 */  mtc1        $0, $f0
/* 00C920 01DB8620 00000000 */  nop
/* 00C924 01DB8624 36080046 */  c.le.s      $f1, $f0
/* 00C928 01DB8628 00000000 */  nop
/* 00C92C 01DB862C 05000045 */  bc1f        .L01DB8644_2BDE44
/* 00C930 01DB8630 00000000 */   nop
/* 00C934 01DB8634 FC42023C */  lui         $2, (0x42FC0000 >> 16)
/* 00C938 01DB8638 9C9982AF */  sw          $2, -0x6664($28)
/* 00C93C 01DB863C 06000010 */  b           .L01DB8658_2BDE58
/* 00C940 01DB8640 00000000 */   nop
.L01DB8644_2BDE44:
/* 00C944 01DB8644 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 00C948 01DB8648 00008244 */  mtc1        $2, $f0
/* 00C94C 01DB864C 00000000 */  nop
/* 00C950 01DB8650 01080046 */  sub.s       $f0, $f1, $f0
/* 00C954 01DB8654 9C9980E7 */  swc1        $f0, -0x6664($28)
.L01DB8658_2BDE58:
/* 00C958 01DB8658 9C998CC7 */  lwc1        $f12, -0x6664($28)
/* 00C95C 01DB865C 2C44040C */  jal         fptosi
/* 00C960 01DB8660 00000000 */   nop
/* 00C964 01DB8664 949982AF */  sw          $2, -0x666C($28)
/* 00C968 01DB8668 C701023C */  lui         $2, %hi(TexManager)
/* 00C96C 01DB866C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00C970 01DB8670 DE01023C */  lui         $2, %hi(LIT_1090__3)
/* 00C974 01DB8674 90DF4524 */  addiu       $5, $2, %lo(LIT_1090__3)
/* 00C978 01DB8678 FFFF0624 */  addiu       $6, $0, -0x1
/* 00C97C 01DB867C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00C980 01DB8680 00000000 */   nop
/* 00C984 01DB8684 28864070 */  paddub      $16, $2, $0
/* 00C988 01DB8688 C701023C */  lui         $2, %hi(TexManager)
/* 00C98C 01DB868C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00C990 01DB8690 DE01023C */  lui         $2, %hi(LIT_1091__2)
/* 00C994 01DB8694 98DF4524 */  addiu       $5, $2, %lo(LIT_1091__2)
/* 00C998 01DB8698 FFFF0624 */  addiu       $6, $0, -0x1
/* 00C99C 01DB869C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00C9A0 01DB86A0 00000000 */   nop
/* 00C9A4 01DB86A4 03000012 */  beqz        $16, .L01DB86B4_2BDEB4
/* 00C9A8 01DB86A8 00000000 */   nop
/* 00C9AC 01DB86AC 03004014 */  bnez        $2, .L01DB86BC_2BDEBC
/* 00C9B0 01DB86B0 00000000 */   nop
.L01DB86B4_2BDEB4:
/* 00C9B4 01DB86B4 3B000010 */  b           .L01DB87A4_2BDFA4
/* 00C9B8 01DB86B8 00000000 */   nop
.L01DB86BC_2BDEBC:
/* 00C9BC 01DB86BC 2800038E */  lw          $3, 0x28($16)
/* 00C9C0 01DB86C0 FF3F7130 */  andi        $17, $3, 0x3FFF
/* 00C9C4 01DB86C4 2800438C */  lw          $3, 0x28($2)
/* 00C9C8 01DB86C8 FF3F7230 */  andi        $18, $3, 0x3FFF
/* 00C9CC 01DB86CC 280003DE */  ld          $3, 0x28($16)
/* 00C9D0 01DB86D0 BA1B0300 */  dsrl        $3, $3, 14
/* 00C9D4 01DB86D4 3F006330 */  andi        $3, $3, 0x3F
/* 00C9D8 01DB86D8 3C800300 */  dsll32      $16, $3, 0
/* 00C9DC 01DB86DC 3F801000 */  dsra32      $16, $16, 0
/* 00C9E0 01DB86E0 280043DC */  ld          $3, 0x28($2)
/* 00C9E4 01DB86E4 BA1B0300 */  dsrl        $3, $3, 14
/* 00C9E8 01DB86E8 3F006330 */  andi        $3, $3, 0x3F
/* 00C9EC 01DB86EC 3C980300 */  dsll32      $19, $3, 0
/* 00C9F0 01DB86F0 3F981300 */  dsra32      $19, $19, 0
/* 00C9F4 01DB86F4 9499848F */  lw          $4, -0x666C($28)
/* 00C9F8 01DB86F8 80000324 */  addiu       $3, $0, 0x80
/* 00C9FC 01DB86FC 13008310 */  beq         $4, $3, .L01DB874C_2BDF4C
/* 00CA00 01DB8700 00000000 */   nop
/* 00CA04 01DB8704 23106400 */  subu        $2, $3, $4
/* 00CA08 01DB8708 8000A0AF */  sw          $0, 0x80($29)
/* 00CA0C 01DB870C 8400A4AF */  sw          $4, 0x84($29)
/* 00CA10 01DB8710 8800A3AF */  sw          $3, 0x88($29)
/* 00CA14 01DB8714 8C00A2AF */  sw          $2, 0x8C($29)
/* 00CA18 01DB8718 0000A0FF */  sd          $0, 0x0($29)
/* 00CA1C 01DB871C 0800A0FF */  sd          $0, 0x8($29)
/* 00CA20 01DB8720 1000A0FF */  sd          $0, 0x10($29)
/* 00CA24 01DB8724 D48B848F */  lw          $4, -0x742C($28)
/* 00CA28 01DB8728 282E4072 */  paddub      $5, $18, $0
/* 00CA2C 01DB872C 28366072 */  paddub      $6, $19, $0
/* 00CA30 01DB8730 283E0070 */  paddub      $7, $0, $0
/* 00CA34 01DB8734 8000A827 */  addiu       $8, $29, 0x80
/* 00CA38 01DB8738 284E2072 */  paddub      $9, $17, $0
/* 00CA3C 01DB873C 28560072 */  paddub      $10, $16, $0
/* 00CA40 01DB8740 285E0070 */  paddub      $11, $0, $0
/* 00CA44 01DB8744 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 00CA48 01DB8748 00000000 */   nop
.L01DB874C_2BDF4C:
/* 00CA4C 01DB874C 9499838F */  lw          $3, -0x666C($28)
/* 00CA50 01DB8750 14006010 */  beqz        $3, .L01DB87A4_2BDFA4
/* 00CA54 01DB8754 00000000 */   nop
/* 00CA58 01DB8758 9000A0AF */  sw          $0, 0x90($29)
/* 00CA5C 01DB875C 9400A0AF */  sw          $0, 0x94($29)
/* 00CA60 01DB8760 80000224 */  addiu       $2, $0, 0x80
/* 00CA64 01DB8764 9800A2AF */  sw          $2, 0x98($29)
/* 00CA68 01DB8768 9C00A3AF */  sw          $3, 0x9C($29)
/* 00CA6C 01DB876C 0000A0FF */  sd          $0, 0x0($29)
/* 00CA70 01DB8770 23104300 */  subu        $2, $2, $3
/* 00CA74 01DB8774 0800A2FF */  sd          $2, 0x8($29)
/* 00CA78 01DB8778 1000A0FF */  sd          $0, 0x10($29)
/* 00CA7C 01DB877C D48B848F */  lw          $4, -0x742C($28)
/* 00CA80 01DB8780 282E4072 */  paddub      $5, $18, $0
/* 00CA84 01DB8784 28366072 */  paddub      $6, $19, $0
/* 00CA88 01DB8788 283E0070 */  paddub      $7, $0, $0
/* 00CA8C 01DB878C 9000A827 */  addiu       $8, $29, 0x90
/* 00CA90 01DB8790 284E2072 */  paddub      $9, $17, $0
/* 00CA94 01DB8794 28560072 */  paddub      $10, $16, $0
/* 00CA98 01DB8798 285E0070 */  paddub      $11, $0, $0
/* 00CA9C 01DB879C 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 00CAA0 01DB87A0 00000000 */   nop
.L01DB87A4_2BDFA4:
/* 00CAA4 01DB87A4 6000BF7B */  lq          $31, 0x60($29)
/* 00CAA8 01DB87A8 5000B37B */  lq          $19, 0x50($29)
/* 00CAAC 01DB87AC 4000B27B */  lq          $18, 0x40($29)
/* 00CAB0 01DB87B0 3000B17B */  lq          $17, 0x30($29)
/* 00CAB4 01DB87B4 2000B07B */  lq          $16, 0x20($29)
/* 00CAB8 01DB87B8 A000BD27 */  addiu       $29, $29, 0xA0
/* 00CABC 01DB87BC 0800E003 */  jr          $31
/* 00CAC0 01DB87C0 00000000 */   nop
/* 00CAC4 01DB87C4 00000000 */  nop
/* 00CAC8 01DB87C8 00000000 */  nop
/* 00CACC 01DB87CC 00000000 */  nop
