.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setTexScroll__Fv
/* 00C5D0 01DB82D0 60FFBD27 */  addiu       $29, $29, -0xA0
/* 00C5D4 01DB82D4 6000BF7F */  sq          $31, 0x60($29)
/* 00C5D8 01DB82D8 5000B37F */  sq          $19, 0x50($29)
/* 00C5DC 01DB82DC 4000B27F */  sq          $18, 0x40($29)
/* 00C5E0 01DB82E0 3000B17F */  sq          $17, 0x30($29)
/* 00C5E4 01DB82E4 2000B07F */  sq          $16, 0x20($29)
/* 00C5E8 01DB82E8 88998283 */  lb          $2, -0x6678($28)
/* 00C5EC 01DB82EC 04004014 */  bnez        $2, .L01DB8300_2BDB00
/* 00C5F0 01DB82F0 00000000 */   nop
/* 00C5F4 01DB82F4 849980AF */  sw          $0, -0x667C($28)
/* 00C5F8 01DB82F8 01000224 */  addiu       $2, $0, 0x1
/* 00C5FC 01DB82FC 889982A3 */  sb          $2, -0x6678($28)
.L01DB8300_2BDB00:
/* 00C600 01DB8300 90998283 */  lb          $2, -0x6670($28)
/* 00C604 01DB8304 04004014 */  bnez        $2, .L01DB8318_2BDB18
/* 00C608 01DB8308 00000000 */   nop
/* 00C60C 01DB830C 8C9980AF */  sw          $0, -0x6674($28)
/* 00C610 01DB8310 01000224 */  addiu       $2, $0, 0x1
/* 00C614 01DB8314 909982A3 */  sb          $2, -0x6670($28)
.L01DB8318_2BDB18:
/* 00C618 01DB8318 DD01023C */  lui         $2, %hi(LIT_1038__3)
/* 00C61C 01DB831C C0674224 */  addiu       $2, $2, %lo(LIT_1038__3)
/* 00C620 01DB8320 7000A327 */  addiu       $3, $29, 0x70
/* 00C624 01DB8324 00004278 */  lq          $2, 0x0($2)
/* 00C628 01DB8328 0000627C */  sq          $2, 0x0($3)
/* 00C62C 01DB832C D48B848F */  lw          $4, -0x742C($28)
/* 00C630 01DB8330 282E0070 */  paddub      $5, $0, $0
/* 00C634 01DB8334 2083040C */  jal         sceVif1PkCnt
/* 00C638 01DB8338 00000000 */   nop
/* 00C63C 01DB833C D48B848F */  lw          $4, -0x742C($28)
/* 00C640 01DB8340 282E0070 */  paddub      $5, $0, $0
/* 00C644 01DB8344 8E83040C */  jal         sceVif1PkOpenDirectCode
/* 00C648 01DB8348 00000000 */   nop
/* 00C64C 01DB834C 7000A227 */  addiu       $2, $29, 0x70
/* 00C650 01DB8350 D48B848F */  lw          $4, -0x742C($28)
/* 00C654 01DB8354 00004578 */  lq          $5, 0x0($2)
/* 00C658 01DB8358 B083040C */  jal         sceVif1PkOpenGifTag
/* 00C65C 01DB835C 00000000 */   nop
/* 00C660 01DB8360 D48B848F */  lw          $4, -0x742C($28)
/* 00C664 01DB8364 3F000524 */  addiu       $5, $0, 0x3F
/* 00C668 01DB8368 28360070 */  paddub      $6, $0, $0
/* 00C66C 01DB836C 0A84040C */  jal         sceVif1PkAddGsAD
/* 00C670 01DB8370 00000000 */   nop
/* 00C674 01DB8374 D48B848F */  lw          $4, -0x742C($28)
/* 00C678 01DB8378 B683040C */  jal         sceVif1PkCloseGifTag
/* 00C67C 01DB837C 00000000 */   nop
/* 00C680 01DB8380 D48B848F */  lw          $4, -0x742C($28)
/* 00C684 01DB8384 A483040C */  jal         sceVif1PkCloseDirectCode
/* 00C688 01DB8388 00000000 */   nop
/* 00C68C 01DB838C D48B848F */  lw          $4, -0x742C($28)
/* 00C690 01DB8390 0A83040C */  jal         sceVif1PkTerminate
/* 00C694 01DB8394 00000000 */   nop
/* 00C698 01DB8398 8C9981C7 */  lwc1        $f1, -0x6674($28)
/* 00C69C 01DB839C 00008044 */  mtc1        $0, $f0
/* 00C6A0 01DB83A0 00000000 */  nop
/* 00C6A4 01DB83A4 36080046 */  c.le.s      $f1, $f0
/* 00C6A8 01DB83A8 00000000 */  nop
/* 00C6AC 01DB83AC 05000045 */  bc1f        .L01DB83C4_2BDBC4
/* 00C6B0 01DB83B0 00000000 */   nop
/* 00C6B4 01DB83B4 FC42023C */  lui         $2, (0x42FC0000 >> 16)
/* 00C6B8 01DB83B8 8C9982AF */  sw          $2, -0x6674($28)
/* 00C6BC 01DB83BC 06000010 */  b           .L01DB83D8_2BDBD8
/* 00C6C0 01DB83C0 00000000 */   nop
.L01DB83C4_2BDBC4:
/* 00C6C4 01DB83C4 003F023C */  lui         $2, (0x3F000000 >> 16)
/* 00C6C8 01DB83C8 00008244 */  mtc1        $2, $f0
/* 00C6CC 01DB83CC 00000000 */  nop
/* 00C6D0 01DB83D0 01080046 */  sub.s       $f0, $f1, $f0
/* 00C6D4 01DB83D4 8C9980E7 */  swc1        $f0, -0x6674($28)
.L01DB83D8_2BDBD8:
/* 00C6D8 01DB83D8 8C998CC7 */  lwc1        $f12, -0x6674($28)
/* 00C6DC 01DB83DC 2C44040C */  jal         fptosi
/* 00C6E0 01DB83E0 00000000 */   nop
/* 00C6E4 01DB83E4 849982AF */  sw          $2, -0x667C($28)
/* 00C6E8 01DB83E8 C701023C */  lui         $2, %hi(TexManager)
/* 00C6EC 01DB83EC 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00C6F0 01DB83F0 DE01023C */  lui         $2, %hi(LIT_1060)
/* 00C6F4 01DB83F4 80DF4524 */  addiu       $5, $2, %lo(LIT_1060)
/* 00C6F8 01DB83F8 FFFF0624 */  addiu       $6, $0, -0x1
/* 00C6FC 01DB83FC B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00C700 01DB8400 00000000 */   nop
/* 00C704 01DB8404 28864070 */  paddub      $16, $2, $0
/* 00C708 01DB8408 C701023C */  lui         $2, %hi(TexManager)
/* 00C70C 01DB840C 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00C710 01DB8410 DE01023C */  lui         $2, %hi(LIT_1061__2)
/* 00C714 01DB8414 88DF4524 */  addiu       $5, $2, %lo(LIT_1061__2)
/* 00C718 01DB8418 FFFF0624 */  addiu       $6, $0, -0x1
/* 00C71C 01DB841C B4C4040C */  jal         GetTexture__15CTextureManagerFPci
/* 00C720 01DB8420 00000000 */   nop
/* 00C724 01DB8424 03000012 */  beqz        $16, .L01DB8434_2BDC34
/* 00C728 01DB8428 00000000 */   nop
/* 00C72C 01DB842C 03004014 */  bnez        $2, .L01DB843C_2BDC3C
/* 00C730 01DB8430 00000000 */   nop
.L01DB8434_2BDC34:
/* 00C734 01DB8434 3B000010 */  b           .L01DB8524_2BDD24
/* 00C738 01DB8438 00000000 */   nop
.L01DB843C_2BDC3C:
/* 00C73C 01DB843C 2800038E */  lw          $3, 0x28($16)
/* 00C740 01DB8440 FF3F7130 */  andi        $17, $3, 0x3FFF
/* 00C744 01DB8444 2800438C */  lw          $3, 0x28($2)
/* 00C748 01DB8448 FF3F7230 */  andi        $18, $3, 0x3FFF
/* 00C74C 01DB844C 280003DE */  ld          $3, 0x28($16)
/* 00C750 01DB8450 BA1B0300 */  dsrl        $3, $3, 14
/* 00C754 01DB8454 3F006330 */  andi        $3, $3, 0x3F
/* 00C758 01DB8458 3C800300 */  dsll32      $16, $3, 0
/* 00C75C 01DB845C 3F801000 */  dsra32      $16, $16, 0
/* 00C760 01DB8460 280043DC */  ld          $3, 0x28($2)
/* 00C764 01DB8464 BA1B0300 */  dsrl        $3, $3, 14
/* 00C768 01DB8468 3F006330 */  andi        $3, $3, 0x3F
/* 00C76C 01DB846C 3C980300 */  dsll32      $19, $3, 0
/* 00C770 01DB8470 3F981300 */  dsra32      $19, $19, 0
/* 00C774 01DB8474 8499848F */  lw          $4, -0x667C($28)
/* 00C778 01DB8478 80000324 */  addiu       $3, $0, 0x80
/* 00C77C 01DB847C 13008310 */  beq         $4, $3, .L01DB84CC_2BDCCC
/* 00C780 01DB8480 00000000 */   nop
/* 00C784 01DB8484 23106400 */  subu        $2, $3, $4
/* 00C788 01DB8488 8000A0AF */  sw          $0, 0x80($29)
/* 00C78C 01DB848C 8400A4AF */  sw          $4, 0x84($29)
/* 00C790 01DB8490 8800A3AF */  sw          $3, 0x88($29)
/* 00C794 01DB8494 8C00A2AF */  sw          $2, 0x8C($29)
/* 00C798 01DB8498 0000A0FF */  sd          $0, 0x0($29)
/* 00C79C 01DB849C 0800A0FF */  sd          $0, 0x8($29)
/* 00C7A0 01DB84A0 1000A0FF */  sd          $0, 0x10($29)
/* 00C7A4 01DB84A4 D48B848F */  lw          $4, -0x742C($28)
/* 00C7A8 01DB84A8 282E4072 */  paddub      $5, $18, $0
/* 00C7AC 01DB84AC 28366072 */  paddub      $6, $19, $0
/* 00C7B0 01DB84B0 283E0070 */  paddub      $7, $0, $0
/* 00C7B4 01DB84B4 8000A827 */  addiu       $8, $29, 0x80
/* 00C7B8 01DB84B8 284E2072 */  paddub      $9, $17, $0
/* 00C7BC 01DB84BC 28560072 */  paddub      $10, $16, $0
/* 00C7C0 01DB84C0 285E0070 */  paddub      $11, $0, $0
/* 00C7C4 01DB84C4 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 00C7C8 01DB84C8 00000000 */   nop
.L01DB84CC_2BDCCC:
/* 00C7CC 01DB84CC 8499838F */  lw          $3, -0x667C($28)
/* 00C7D0 01DB84D0 14006010 */  beqz        $3, .L01DB8524_2BDD24
/* 00C7D4 01DB84D4 00000000 */   nop
/* 00C7D8 01DB84D8 9000A0AF */  sw          $0, 0x90($29)
/* 00C7DC 01DB84DC 9400A0AF */  sw          $0, 0x94($29)
/* 00C7E0 01DB84E0 80000224 */  addiu       $2, $0, 0x80
/* 00C7E4 01DB84E4 9800A2AF */  sw          $2, 0x98($29)
/* 00C7E8 01DB84E8 9C00A3AF */  sw          $3, 0x9C($29)
/* 00C7EC 01DB84EC 0000A0FF */  sd          $0, 0x0($29)
/* 00C7F0 01DB84F0 23104300 */  subu        $2, $2, $3
/* 00C7F4 01DB84F4 0800A2FF */  sd          $2, 0x8($29)
/* 00C7F8 01DB84F8 1000A0FF */  sd          $0, 0x10($29)
/* 00C7FC 01DB84FC D48B848F */  lw          $4, -0x742C($28)
/* 00C800 01DB8500 282E4072 */  paddub      $5, $18, $0
/* 00C804 01DB8504 28366072 */  paddub      $6, $19, $0
/* 00C808 01DB8508 283E0070 */  paddub      $7, $0, $0
/* 00C80C 01DB850C 9000A827 */  addiu       $8, $29, 0x90
/* 00C810 01DB8510 284E2072 */  paddub      $9, $17, $0
/* 00C814 01DB8514 28560072 */  paddub      $10, $16, $0
/* 00C818 01DB8518 285E0070 */  paddub      $11, $0, $0
/* 00C81C 01DB851C 9801050C */  jal         MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii
/* 00C820 01DB8520 00000000 */   nop
.L01DB8524_2BDD24:
/* 00C824 01DB8524 6000BF7B */  lq          $31, 0x60($29)
/* 00C828 01DB8528 5000B37B */  lq          $19, 0x50($29)
/* 00C82C 01DB852C 4000B27B */  lq          $18, 0x40($29)
/* 00C830 01DB8530 3000B17B */  lq          $17, 0x30($29)
/* 00C834 01DB8534 2000B07B */  lq          $16, 0x20($29)
/* 00C838 01DB8538 A000BD27 */  addiu       $29, $29, 0xA0
/* 00C83C 01DB853C 0800E003 */  jr          $31
/* 00C840 01DB8540 00000000 */   nop
/* 00C844 01DB8544 00000000 */  nop
/* 00C848 01DB8548 00000000 */  nop
/* 00C84C 01DB854C 00000000 */  nop
