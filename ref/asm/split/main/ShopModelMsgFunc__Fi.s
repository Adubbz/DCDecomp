.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ShopModelMsgFunc__Fi
/* 0ED7E0 001ED6E0 D0FFBD27 */  addiu       $29, $29, -0x30
/* 0ED7E4 001ED6E4 2000BF7F */  sq          $31, 0x20($29)
/* 0ED7E8 001ED6E8 1000B17F */  sq          $17, 0x10($29)
/* 0ED7EC 001ED6EC 0000B07F */  sq          $16, 0x0($29)
/* 0ED7F0 001ED6F0 288E8070 */  paddub      $17, $4, $0
/* 0ED7F4 001ED6F4 D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0ED7F8 001ED6F8 64022484 */  lh          $4, %lo(ShopMenu + 0x194)($1)
/* 0ED7FC 001ED6FC 02000324 */  addiu       $3, $0, 0x2
/* 0ED800 001ED700 A7008314 */  bne         $4, $3, .L001ED9A0
/* 0ED804 001ED704 00000000 */   nop
/* 0ED808 001ED708 D901013C */  lui         $1, %hi(ShopMenu + 0x19C)
/* 0ED80C 001ED70C 6C023084 */  lh          $16, %lo(ShopMenu + 0x19C)($1)
/* 0ED810 001ED710 D901013C */  lui         $1, %hi(ShopMenu + 0x19A)
/* 0ED814 001ED714 6A022384 */  lh          $3, %lo(ShopMenu + 0x19A)($1)
/* 0ED818 001ED718 01000224 */  addiu       $2, $0, 0x1
/* 0ED81C 001ED71C 20006210 */  beq         $3, $2, .L001ED7A0
/* 0ED820 001ED720 00000000 */   nop
/* 0ED824 001ED724 03006010 */  beqz        $3, .L001ED734
/* 0ED828 001ED728 00000000 */   nop
/* 0ED82C 001ED72C 30000010 */  b           .L001ED7F0
/* 0ED830 001ED730 00000000 */   nop
.L001ED734:
/* 0ED834 001ED734 28860070 */  paddub      $16, $0, $0
/* 0ED838 001ED738 CC01023C */  lui         $2, %hi(GamePad)
/* 0ED83C 001ED73C 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0ED840 001ED740 0CAD040C */  jal         AllOn__8CGamePadFv
/* 0ED844 001ED744 00000000 */   nop
/* 0ED848 001ED748 05004010 */  beqz        $2, .L001ED760
/* 0ED84C 001ED74C 00000000 */   nop
/* 0ED850 001ED750 D901013C */  lui         $1, %hi(ShopMenu + 0x1A4)
/* 0ED854 001ED754 740220AC */  sw          $0, %lo(ShopMenu + 0x1A4)($1)
/* 0ED858 001ED758 25000010 */  b           .L001ED7F0
/* 0ED85C 001ED75C 00000000 */   nop
.L001ED760:
/* 0ED860 001ED760 D901013C */  lui         $1, %hi(ShopMenu + 0x1A4)
/* 0ED864 001ED764 7402228C */  lw          $2, %lo(ShopMenu + 0x1A4)($1)
/* 0ED868 001ED768 01004224 */  addiu       $2, $2, 0x1
/* 0ED86C 001ED76C D901013C */  lui         $1, %hi(ShopMenu + 0x1A4)
/* 0ED870 001ED770 740222AC */  sw          $2, %lo(ShopMenu + 0x1A4)($1)
/* 0ED874 001ED774 D901013C */  lui         $1, %hi(ShopMenu + 0x1A4)
/* 0ED878 001ED778 7402228C */  lw          $2, %lo(ShopMenu + 0x1A4)($1)
/* 0ED87C 001ED77C 40014228 */  slti        $2, $2, 0x140
/* 0ED880 001ED780 1B004014 */  bnez        $2, .L001ED7F0
/* 0ED884 001ED784 00000000 */   nop
/* 0ED888 001ED788 01000224 */  addiu       $2, $0, 0x1
/* 0ED88C 001ED78C D901013C */  lui         $1, %hi(ShopMenu + 0x19A)
/* 0ED890 001ED790 6A0222A4 */  sh          $2, %lo(ShopMenu + 0x19A)($1)
/* 0ED894 001ED794 03001024 */  addiu       $16, $0, 0x3
/* 0ED898 001ED798 15000010 */  b           .L001ED7F0
/* 0ED89C 001ED79C 00000000 */   nop
.L001ED7A0:
/* 0ED8A0 001ED7A0 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0ED8A4 001ED7A4 50022284 */  lh          $2, %lo(ShopMenu + 0x180)($1)
/* 0ED8A8 001ED7A8 03004010 */  beqz        $2, .L001ED7B8
/* 0ED8AC 001ED7AC 00000000 */   nop
/* 0ED8B0 001ED7B0 0E000010 */  b           .L001ED7EC
/* 0ED8B4 001ED7B4 00000000 */   nop
.L001ED7B8:
/* 0ED8B8 001ED7B8 CC01023C */  lui         $2, %hi(GamePad)
/* 0ED8BC 001ED7BC 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0ED8C0 001ED7C0 0CAD040C */  jal         AllOn__8CGamePadFv
/* 0ED8C4 001ED7C4 00000000 */   nop
/* 0ED8C8 001ED7C8 09004010 */  beqz        $2, .L001ED7F0
/* 0ED8CC 001ED7CC 00000000 */   nop
/* 0ED8D0 001ED7D0 D901013C */  lui         $1, %hi(ShopMenu + 0x19A)
/* 0ED8D4 001ED7D4 6A0220A4 */  sh          $0, %lo(ShopMenu + 0x19A)($1)
/* 0ED8D8 001ED7D8 D901013C */  lui         $1, %hi(ShopMenu + 0x1A4)
/* 0ED8DC 001ED7DC 740220AC */  sw          $0, %lo(ShopMenu + 0x1A4)($1)
/* 0ED8E0 001ED7E0 28860070 */  paddub      $16, $0, $0
/* 0ED8E4 001ED7E4 02000010 */  b           .L001ED7F0
/* 0ED8E8 001ED7E8 00000000 */   nop
.L001ED7EC:
/* 0ED8EC 001ED7EC 03001024 */  addiu       $16, $0, 0x3
.L001ED7F0:
/* 0ED8F0 001ED7F0 D901013C */  lui         $1, %hi(ShopMenu + 0x19A)
/* 0ED8F4 001ED7F4 6A022384 */  lh          $3, %lo(ShopMenu + 0x19A)($1)
/* 0ED8F8 001ED7F8 01000224 */  addiu       $2, $0, 0x1
/* 0ED8FC 001ED7FC 44006214 */  bne         $3, $2, .L001ED910
/* 0ED900 001ED800 00000000 */   nop
/* 0ED904 001ED804 D901013C */  lui         $1, %hi(ShopMenu)
/* 0ED908 001ED808 D0002584 */  lh          $5, %lo(ShopMenu)($1)
/* 0ED90C 001ED80C 28262072 */  paddub      $4, $17, $0
/* 0ED910 001ED810 1CB5070C */  jal         GetNowMasterMsgNo2__Fii
/* 0ED914 001ED814 00000000 */   nop
/* 0ED918 001ED818 288E4070 */  paddub      $17, $2, $0
/* 0ED91C 001ED81C D901013C */  lui         $1, %hi(ShopMenu + 0x19E)
/* 0ED920 001ED820 6E022284 */  lh          $2, %lo(ShopMenu + 0x19E)($1)
/* 0ED924 001ED824 08005114 */  bne         $2, $17, .L001ED848
/* 0ED928 001ED828 00000000 */   nop
/* 0ED92C 001ED82C CC01023C */  lui         $2, %hi(GamePad)
/* 0ED930 001ED830 40C54424 */  addiu       $4, $2, %lo(GamePad)
/* 0ED934 001ED834 60000524 */  addiu       $5, $0, 0x60
/* 0ED938 001ED838 1CAE040C */  jal         Down__8CGamePadFi
/* 0ED93C 001ED83C 00000000 */   nop
/* 0ED940 001ED840 0D004010 */  beqz        $2, .L001ED878
/* 0ED944 001ED844 00000000 */   nop
.L001ED848:
/* 0ED948 001ED848 D901013C */  lui         $1, %hi(ShopMenu + 0x19E)
/* 0ED94C 001ED84C 6E0231A4 */  sh          $17, %lo(ShopMenu + 0x19E)($1)
/* 0ED950 001ED850 FFFF0224 */  addiu       $2, $0, -0x1
/* 0ED954 001ED854 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x16BC)
/* 0ED958 001ED858 CC5122AC */  sw          $2, %lo(CommonMenuMes3 + 0x16BC)($1)
/* 0ED95C 001ED85C D901013C */  lui         $1, %hi(ShopMenu + 0x19E)
/* 0ED960 001ED860 6E022584 */  lh          $5, %lo(ShopMenu + 0x19E)($1)
/* 0ED964 001ED864 DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0ED968 001ED868 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0ED96C 001ED86C 5441050C */  jal         MakeMesWin__6ClsMesFi
/* 0ED970 001ED870 00000000 */   nop
/* 0ED974 001ED874 03001024 */  addiu       $16, $0, 0x3
.L001ED878:
/* 0ED978 001ED878 D901013C */  lui         $1, %hi(ShopMenu + 0x180)
/* 0ED97C 001ED87C 50022384 */  lh          $3, %lo(ShopMenu + 0x180)($1)
/* 0ED980 001ED880 01000224 */  addiu       $2, $0, 0x1
/* 0ED984 001ED884 22006210 */  beq         $3, $2, .L001ED910
/* 0ED988 001ED888 00000000 */   nop
/* 0ED98C 001ED88C 02000224 */  addiu       $2, $0, 0x2
/* 0ED990 001ED890 1F006210 */  beq         $3, $2, .L001ED910
/* 0ED994 001ED894 00000000 */   nop
/* 0ED998 001ED898 01000010 */  b           .L001ED8A0
/* 0ED99C 001ED89C 00000000 */   nop
.L001ED8A0:
/* 0ED9A0 001ED8A0 D901013C */  lui         $1, %hi(ShopMenu + 0x194)
/* 0ED9A4 001ED8A4 64022284 */  lh          $2, %lo(ShopMenu + 0x194)($1)
/* 0ED9A8 001ED8A8 19004010 */  beqz        $2, .L001ED910
/* 0ED9AC 001ED8AC 00000000 */   nop
/* 0ED9B0 001ED8B0 70B6070C */  jal         SetShopTalkMsgPos__Fv
/* 0ED9B4 001ED8B4 00000000 */   nop
/* 0ED9B8 001ED8B8 01000224 */  addiu       $2, $0, 0x1
/* 0ED9BC 001ED8BC DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x58)
/* 0ED9C0 001ED8C0 683B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x58)($1)
/* 0ED9C4 001ED8C4 08000224 */  addiu       $2, $0, 0x8
/* 0ED9C8 001ED8C8 DA01013C */  lui         $1, %hi(CommonMenuMes3 + 0x54)
/* 0ED9CC 001ED8CC 643B22AC */  sw          $2, %lo(CommonMenuMes3 + 0x54)($1)
/* 0ED9D0 001ED8D0 DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0ED9D4 001ED8D4 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0ED9D8 001ED8D8 6437050C */  jal         Step__6ClsMesFv
/* 0ED9DC 001ED8DC 00000000 */   nop
/* 0ED9E0 001ED8E0 D901013C */  lui         $1, %hi(ShopMenu + 0x1A0)
/* 0ED9E4 001ED8E4 7002228C */  lw          $2, %lo(ShopMenu + 0x1A0)($1)
/* 0ED9E8 001ED8E8 04004228 */  slti        $2, $2, 0x4
/* 0ED9EC 001ED8EC 05004014 */  bnez        $2, .L001ED904
/* 0ED9F0 001ED8F0 00000000 */   nop
/* 0ED9F4 001ED8F4 DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0ED9F8 001ED8F8 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0ED9FC 001ED8FC C44C050C */  jal         DrawMesWin__6ClsMesFv
/* 0EDA00 001ED900 00000000 */   nop
.L001ED904:
/* 0EDA04 001ED904 28260070 */  paddub      $4, $0, $0
/* 0EDA08 001ED908 046F050C */  jal         setbilinear__Fi
/* 0EDA0C 001ED90C 00000000 */   nop
.L001ED910:
/* 0EDA10 001ED910 DA01023C */  lui         $2, %hi(CommonMenuMes3)
/* 0EDA14 001ED914 103B4424 */  addiu       $4, $2, %lo(CommonMenuMes3)
/* 0EDA18 001ED918 2038050C */  jal         State__6ClsMesFv
/* 0EDA1C 001ED91C 00000000 */   nop
/* 0EDA20 001ED920 02000324 */  addiu       $3, $0, 0x2
/* 0EDA24 001ED924 0E004310 */  beq         $2, $3, .L001ED960
/* 0EDA28 001ED928 00000000 */   nop
/* 0EDA2C 001ED92C 01000324 */  addiu       $3, $0, 0x1
/* 0EDA30 001ED930 0B004310 */  beq         $2, $3, .L001ED960
/* 0EDA34 001ED934 00000000 */   nop
/* 0EDA38 001ED938 04000324 */  addiu       $3, $0, 0x4
/* 0EDA3C 001ED93C 05004310 */  beq         $2, $3, .L001ED954
/* 0EDA40 001ED940 00000000 */   nop
/* 0EDA44 001ED944 03004010 */  beqz        $2, .L001ED954
/* 0EDA48 001ED948 00000000 */   nop
/* 0EDA4C 001ED94C 05000010 */  b           .L001ED964
/* 0EDA50 001ED950 00000000 */   nop
.L001ED954:
/* 0EDA54 001ED954 28860070 */  paddub      $16, $0, $0
/* 0EDA58 001ED958 02000010 */  b           .L001ED964
/* 0EDA5C 001ED95C 00000000 */   nop
.L001ED960:
/* 0EDA60 001ED960 03001024 */  addiu       $16, $0, 0x3
.L001ED964:
/* 0EDA64 001ED964 D901013C */  lui         $1, %hi(ShopMenu + 0x19C)
/* 0EDA68 001ED968 6C022384 */  lh          $3, %lo(ShopMenu + 0x19C)($1)
/* 0EDA6C 001ED96C 0C007010 */  beq         $3, $16, .L001ED9A0
/* 0EDA70 001ED970 00000000 */   nop
/* 0EDA74 001ED974 D901013C */  lui         $1, %hi(ShopMenu + 0x19C)
/* 0EDA78 001ED978 6C0230A4 */  sh          $16, %lo(ShopMenu + 0x19C)($1)
/* 0EDA7C 001ED97C D901013C */  lui         $1, %hi(ShopMenu + 0x19C)
/* 0EDA80 001ED980 6C022384 */  lh          $3, %lo(ShopMenu + 0x19C)($1)
/* 0EDA84 001ED984 D901013C */  lui         $1, %hi(MenuCharaFrame + 0xC68)
/* 0EDA88 001ED988 E81023AC */  sw          $3, %lo(MenuCharaFrame + 0xC68)($1)
/* 0EDA8C 001ED98C D901013C */  lui         $1, %hi(MenuCharaFrame + 0xC64)
/* 0EDA90 001ED990 E41020AC */  sw          $0, %lo(MenuCharaFrame + 0xC64)($1)
/* 0EDA94 001ED994 80BF033C */  lui         $3, (0xBF800000 >> 16)
/* 0EDA98 001ED998 D901013C */  lui         $1, %hi(MenuCharaFrame + 0xC60)
/* 0EDA9C 001ED99C E01023AC */  sw          $3, %lo(MenuCharaFrame + 0xC60)($1)
.L001ED9A0:
/* 0EDAA0 001ED9A0 2000BF7B */  lq          $31, 0x20($29)
/* 0EDAA4 001ED9A4 1000B17B */  lq          $17, 0x10($29)
/* 0EDAA8 001ED9A8 0000B07B */  lq          $16, 0x0($29)
/* 0EDAAC 001ED9AC 3000BD27 */  addiu       $29, $29, 0x30
/* 0EDAB0 001ED9B0 0800E003 */  jr          $31
/* 0EDAB4 001ED9B4 00000000 */   nop
/* 0EDAB8 001ED9B8 00000000 */  nop
/* 0EDABC 001ED9BC 00000000 */  nop
