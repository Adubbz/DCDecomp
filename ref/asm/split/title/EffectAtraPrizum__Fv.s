.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EffectAtraPrizum__Fv
/* 01A840 01DC6540 10FFBD27 */  addiu       $29, $29, -0xF0
/* 01A844 01DC6544 2000BF7F */  sq          $31, 0x20($29)
/* 01A848 01DC6548 1000B17F */  sq          $17, 0x10($29)
/* 01A84C 01DC654C 0000B07F */  sq          $16, 0x0($29)
/* 01A850 01DC6550 DE01013C */  lui         $1, %hi(CScript__2 + 0x26C)
/* 01A854 01DC6554 6C1D2390 */  lbu         $3, %lo(CScript__2 + 0x26C)($1)
/* 01A858 01DC6558 DD006010 */  beqz        $3, .L01DC68D0_2CC0D0
/* 01A85C 01DC655C 00000000 */   nop
/* 01A860 01DC6560 E49A8283 */  lb          $2, -0x651C($28)
/* 01A864 01DC6564 04004014 */  bnez        $2, .L01DC6578_2CBD78
/* 01A868 01DC6568 00000000 */   nop
/* 01A86C 01DC656C E09A80AF */  sw          $0, -0x6520($28)
/* 01A870 01DC6570 01000224 */  addiu       $2, $0, 0x1
/* 01A874 01DC6574 E49A82A3 */  sb          $2, -0x651C($28)
.L01DC6578_2CBD78:
/* 01A878 01DC6578 EC9A8283 */  lb          $2, -0x6514($28)
/* 01A87C 01DC657C 04004014 */  bnez        $2, .L01DC6590_2CBD90
/* 01A880 01DC6580 00000000 */   nop
/* 01A884 01DC6584 E89A80AF */  sw          $0, -0x6518($28)
/* 01A888 01DC6588 01000224 */  addiu       $2, $0, 0x1
/* 01A88C 01DC658C EC9A82A3 */  sb          $2, -0x6514($28)
.L01DC6590_2CBD90:
/* 01A890 01DC6590 0898828F */  lw          $2, -0x67F8($28)
/* 01A894 01DC6594 1B004014 */  bnez        $2, .L01DC6604_2CBE04
/* 01A898 01DC6598 00000000 */   nop
/* 01A89C 01DC659C E09A81C7 */  lwc1        $f1, -0x6520($28)
/* 01A8A0 01DC65A0 0C8480C7 */  lwc1        $f0, -0x7BF4($28)
/* 01A8A4 01DC65A4 40080046 */  add.s       $f1, $f1, $f0
/* 01A8A8 01DC65A8 E09A81E7 */  swc1        $f1, -0x6520($28)
/* 01A8AC 01DC65AC 108480C7 */  lwc1        $f0, -0x7BF0($28)
/* 01A8B0 01DC65B0 36080046 */  c.le.s      $f1, $f0
/* 01A8B4 01DC65B4 00000000 */  nop
/* 01A8B8 01DC65B8 05000145 */  bc1t        .L01DC65D0_2CBDD0
/* 01A8BC 01DC65BC 00000000 */   nop
/* 01A8C0 01DC65C0 E09A81C7 */  lwc1        $f1, -0x6520($28)
/* 01A8C4 01DC65C4 C48380C7 */  lwc1        $f0, -0x7C3C($28)
/* 01A8C8 01DC65C8 01080046 */  sub.s       $f0, $f1, $f0
/* 01A8CC 01DC65CC E09A80E7 */  swc1        $f0, -0x6520($28)
.L01DC65D0_2CBDD0:
/* 01A8D0 01DC65D0 E89A81C7 */  lwc1        $f1, -0x6518($28)
/* 01A8D4 01DC65D4 148480C7 */  lwc1        $f0, -0x7BEC($28)
/* 01A8D8 01DC65D8 41080046 */  sub.s       $f1, $f1, $f0
/* 01A8DC 01DC65DC E89A81E7 */  swc1        $f1, -0x6518($28)
/* 01A8E0 01DC65E0 188480C7 */  lwc1        $f0, -0x7BE8($28)
/* 01A8E4 01DC65E4 34080046 */  c.lt.s      $f1, $f0
/* 01A8E8 01DC65E8 00000000 */  nop
/* 01A8EC 01DC65EC 05000045 */  bc1f        .L01DC6604_2CBE04
/* 01A8F0 01DC65F0 00000000 */   nop
/* 01A8F4 01DC65F4 E89A81C7 */  lwc1        $f1, -0x6518($28)
/* 01A8F8 01DC65F8 1C8480C7 */  lwc1        $f0, -0x7BE4($28)
/* 01A8FC 01DC65FC 00080046 */  add.s       $f0, $f1, $f0
/* 01A900 01DC6600 E89A80E7 */  swc1        $f0, -0x6518($28)
.L01DC6604_2CBE04:
/* 01A904 01DC6604 7000A427 */  addiu       $4, $29, 0x70
/* 01A908 01DC6608 2500023C */  lui         $2, %hi(ambientlight)
/* 01A90C 01DC660C 001C4524 */  addiu       $5, $2, %lo(ambientlight)
/* 01A910 01DC6610 0C86040C */  jal         sceVu0CopyVector
/* 01A914 01DC6614 00000000 */   nop
/* 01A918 01DC6618 0042023C */  lui         $2, (0x42000000 >> 16)
/* 01A91C 01DC661C 7C00A2AF */  sw          $2, 0x7C($29)
/* 01A920 01DC6620 7000A427 */  addiu       $4, $29, 0x70
/* 01A924 01DC6624 40B7040C */  jal         MGSetAmbient__FPf
/* 01A928 01DC6628 00000000 */   nop
/* 01A92C 01DC662C E800A527 */  addiu       $5, $29, 0xE8
/* 01A930 01DC6630 F88B82DF */  ld          $2, -0x7408($28)
/* 01A934 01DC6634 0000A2FC */  sd          $2, 0x0($5)
/* 01A938 01DC6638 E800A393 */  lbu         $3, 0xE8($29)
/* 01A93C 01DC663C 03000630 */  andi        $6, $0, 0x3
/* 01A940 01DC6640 FCFF0224 */  addiu       $2, $0, -0x4
/* 01A944 01DC6644 24106200 */  and         $2, $3, $2
/* 01A948 01DC6648 25104600 */  or          $2, $2, $6
/* 01A94C 01DC664C E800A2A3 */  sb          $2, 0xE8($29)
/* 01A950 01DC6650 E800A493 */  lbu         $4, 0xE8($29)
/* 01A954 01DC6654 08000364 */  daddiu      $3, $0, 0x8
/* 01A958 01DC6658 F3FF0224 */  addiu       $2, $0, -0xD
/* 01A95C 01DC665C 24108200 */  and         $2, $4, $2
/* 01A960 01DC6660 25104300 */  or          $2, $2, $3
/* 01A964 01DC6664 E800A2A3 */  sb          $2, 0xE8($29)
/* 01A968 01DC6668 E800A493 */  lbu         $4, 0xE8($29)
/* 01A96C 01DC666C 00190600 */  sll         $3, $6, 4
/* 01A970 01DC6670 CFFF0224 */  addiu       $2, $0, -0x31
/* 01A974 01DC6674 24108200 */  and         $2, $4, $2
/* 01A978 01DC6678 25104300 */  or          $2, $2, $3
/* 01A97C 01DC667C E800A2A3 */  sb          $2, 0xE8($29)
/* 01A980 01DC6680 E800A493 */  lbu         $4, 0xE8($29)
/* 01A984 01DC6684 40000364 */  daddiu      $3, $0, 0x40
/* 01A988 01DC6688 3FFF0224 */  addiu       $2, $0, -0xC1
/* 01A98C 01DC668C 24108200 */  and         $2, $4, $2
/* 01A990 01DC6690 25104300 */  or          $2, $2, $3
/* 01A994 01DC6694 E800A2A3 */  sb          $2, 0xE8($29)
/* 01A998 01DC6698 D48B848F */  lw          $4, -0x742C($28)
/* 01A99C 01DC669C 086F050C */  jal         setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha
/* 01A9A0 01DC66A0 00000000 */   nop
/* 01A9A4 01DC66A4 C701023C */  lui         $2, %hi(TexManager)
/* 01A9A8 01DC66A8 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 01A9AC 01DC66AC D48B858F */  lw          $5, -0x742C($28)
/* 01A9B0 01DC66B0 04000624 */  addiu       $6, $0, 0x4
/* 01A9B4 01DC66B4 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 01A9B8 01DC66B8 00000000 */   nop
/* 01A9BC 01DC66BC E001013C */  lui         $1, %hi(MainMonstorUnit + 0x3A5C)
/* 01A9C0 01DC66C0 2CC2248C */  lw          $4, %lo(MainMonstorUnit + 0x3A5C)($1)
/* 01A9C4 01DC66C4 DE01023C */  lui         $2, %hi(LIT_964)
/* 01A9C8 01DC66C8 10FE4524 */  addiu       $5, $2, %lo(LIT_964)
/* 01A9CC 01DC66CC C0A1040C */  jal         SearchFrame__6CFrameFPc
/* 01A9D0 01DC66D0 00000000 */   nop
/* 01A9D4 01DC66D4 28864070 */  paddub      $16, $2, $0
/* 01A9D8 01DC66D8 59000012 */  beqz        $16, .L01DC6840_2CC040
/* 01A9DC 01DC66DC 00000000 */   nop
/* 01A9E0 01DC66E0 28260072 */  paddub      $4, $16, $0
/* 01A9E4 01DC66E4 3000A527 */  addiu       $5, $29, 0x30
/* 01A9E8 01DC66E8 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01A9EC 01DC66EC 00000000 */   nop
/* 01A9F0 01DC66F0 DE01013C */  lui         $1, %hi(CScript__2)
/* 01A9F4 01DC66F4 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 01A9F8 01DC66F8 70000224 */  addiu       $2, $0, 0x70
/* 01A9FC 01DC66FC 50006214 */  bne         $3, $2, .L01DC6840_2CC040
/* 01AA00 01DC6700 00000000 */   nop
/* 01AA04 01DC6704 6000B127 */  addiu       $17, $29, 0x60
/* 01AA08 01DC6708 8000A427 */  addiu       $4, $29, 0x80
/* 01AA0C 01DC670C 282E2072 */  paddub      $5, $17, $0
/* 01AA10 01DC6710 0C86040C */  jal         sceVu0CopyVector
/* 01AA14 01DC6714 00000000 */   nop
/* 01AA18 01DC6718 9000A427 */  addiu       $4, $29, 0x90
/* 01AA1C 01DC671C 2A86040C */  jal         sceVu0UnitMatrix
/* 01AA20 01DC6720 00000000 */   nop
/* 01AA24 01DC6724 9000A427 */  addiu       $4, $29, 0x90
/* 01AA28 01DC6728 282E8070 */  paddub      $5, $4, $0
/* 01AA2C 01DC672C E09A8CC7 */  lwc1        $f12, -0x6520($28)
/* 01AA30 01DC6730 A686040C */  jal         sceVu0RotMatrixY
/* 01AA34 01DC6734 00000000 */   nop
/* 01AA38 01DC6738 3000A427 */  addiu       $4, $29, 0x30
/* 01AA3C 01DC673C 282E8070 */  paddub      $5, $4, $0
/* 01AA40 01DC6740 9000A627 */  addiu       $6, $29, 0x90
/* 01AA44 01DC6744 6E85040C */  jal         sceVu0MulMatrix
/* 01AA48 01DC6748 00000000 */   nop
/* 01AA4C 01DC674C 28262072 */  paddub      $4, $17, $0
/* 01AA50 01DC6750 8000A527 */  addiu       $5, $29, 0x80
/* 01AA54 01DC6754 0C86040C */  jal         sceVu0CopyVector
/* 01AA58 01DC6758 00000000 */   nop
/* 01AA5C 01DC675C E301013C */  lui         $1, %hi(Effect + 0xBC)
/* 01AA60 01DC6760 9CD3248C */  lw          $4, %lo(Effect + 0xBC)($1)
/* 01AA64 01DC6764 3000A527 */  addiu       $5, $29, 0x30
/* 01AA68 01DC6768 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 01AA6C 01DC676C 00000000 */   nop
/* 01AA70 01DC6770 E301013C */  lui         $1, %hi(Effect + 0xC68)
/* 01AA74 01DC6774 48DF20AC */  sw          $0, %lo(Effect + 0xC68)($1)
/* 01AA78 01DC6778 E301013C */  lui         $1, %hi(Effect + 0xC64)
/* 01AA7C 01DC677C 44DF20AC */  sw          $0, %lo(Effect + 0xC64)($1)
/* 01AA80 01DC6780 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 01AA84 01DC6784 E301013C */  lui         $1, %hi(Effect + 0xC60)
/* 01AA88 01DC6788 40DF22AC */  sw          $2, %lo(Effect + 0xC60)($1)
/* 01AA8C 01DC678C 0898828F */  lw          $2, -0x67F8($28)
/* 01AA90 01DC6790 05004014 */  bnez        $2, .L01DC67A8_2CBFA8
/* 01AA94 01DC6794 00000000 */   nop
/* 01AA98 01DC6798 E301023C */  lui         $2, %hi(Effect)
/* 01AA9C 01DC679C E0D24424 */  addiu       $4, $2, %lo(Effect)
/* 01AAA0 01DC67A0 4CE1040C */  jal         Step__10CCharacterFv
/* 01AAA4 01DC67A4 00000000 */   nop
.L01DC67A8_2CBFA8:
/* 01AAA8 01DC67A8 E301023C */  lui         $2, %hi(Effect)
/* 01AAAC 01DC67AC E0D24424 */  addiu       $4, $2, %lo(Effect)
/* 01AAB0 01DC67B0 C4E4040C */  jal         Draw__10CCharacterFv
/* 01AAB4 01DC67B4 00000000 */   nop
/* 01AAB8 01DC67B8 28260072 */  paddub      $4, $16, $0
/* 01AABC 01DC67BC 3000A527 */  addiu       $5, $29, 0x30
/* 01AAC0 01DC67C0 6CA0040C */  jal         GetLWMatrix__6CFrameFPA4_f
/* 01AAC4 01DC67C4 00000000 */   nop
/* 01AAC8 01DC67C8 8000A427 */  addiu       $4, $29, 0x80
/* 01AACC 01DC67CC 282E2072 */  paddub      $5, $17, $0
/* 01AAD0 01DC67D0 0C86040C */  jal         sceVu0CopyVector
/* 01AAD4 01DC67D4 00000000 */   nop
/* 01AAD8 01DC67D8 9000A427 */  addiu       $4, $29, 0x90
/* 01AADC 01DC67DC 2A86040C */  jal         sceVu0UnitMatrix
/* 01AAE0 01DC67E0 00000000 */   nop
/* 01AAE4 01DC67E4 9000A427 */  addiu       $4, $29, 0x90
/* 01AAE8 01DC67E8 282E8070 */  paddub      $5, $4, $0
/* 01AAEC 01DC67EC E89A8CC7 */  lwc1        $f12, -0x6518($28)
/* 01AAF0 01DC67F0 A686040C */  jal         sceVu0RotMatrixY
/* 01AAF4 01DC67F4 00000000 */   nop
/* 01AAF8 01DC67F8 3000A427 */  addiu       $4, $29, 0x30
/* 01AAFC 01DC67FC 282E8070 */  paddub      $5, $4, $0
/* 01AB00 01DC6800 9000A627 */  addiu       $6, $29, 0x90
/* 01AB04 01DC6804 6E85040C */  jal         sceVu0MulMatrix
/* 01AB08 01DC6808 00000000 */   nop
/* 01AB0C 01DC680C 28262072 */  paddub      $4, $17, $0
/* 01AB10 01DC6810 8000A527 */  addiu       $5, $29, 0x80
/* 01AB14 01DC6814 0C86040C */  jal         sceVu0CopyVector
/* 01AB18 01DC6818 00000000 */   nop
/* 01AB1C 01DC681C E301013C */  lui         $1, %hi(Effect + 0xBC)
/* 01AB20 01DC6820 9CD3248C */  lw          $4, %lo(Effect + 0xBC)($1)
/* 01AB24 01DC6824 3000A527 */  addiu       $5, $29, 0x30
/* 01AB28 01DC6828 58A1040C */  jal         SetTransMatrix__6CFrameFPA4_f
/* 01AB2C 01DC682C 00000000 */   nop
/* 01AB30 01DC6830 E301013C */  lui         $1, %hi(Effect + 0xBC)
/* 01AB34 01DC6834 9CD3248C */  lw          $4, %lo(Effect + 0xBC)($1)
/* 01AB38 01DC6838 60BB040C */  jal         MGDraw__FP6CFrame
/* 01AB3C 01DC683C 00000000 */   nop
.L01DC6840_2CC040:
/* 01AB40 01DC6840 0898828F */  lw          $2, -0x67F8($28)
/* 01AB44 01DC6844 05004014 */  bnez        $2, .L01DC685C_2CC05C
/* 01AB48 01DC6848 00000000 */   nop
/* 01AB4C 01DC684C E301023C */  lui         $2, %hi(SeireiKing)
/* 01AB50 01DC6850 90E44424 */  addiu       $4, $2, %lo(SeireiKing)
/* 01AB54 01DC6854 4CBC760C */  jal         Step__11CSeireiKingFv
/* 01AB58 01DC6858 00000000 */   nop
.L01DC685C_2CC05C:
/* 01AB5C 01DC685C 6000B027 */  addiu       $16, $29, 0x60
/* 01AB60 01DC6860 E301023C */  lui         $2, %hi(SeireiKing)
/* 01AB64 01DC6864 90E44424 */  addiu       $4, $2, %lo(SeireiKing)
/* 01AB68 01DC6868 282E0072 */  paddub      $5, $16, $0
/* 01AB6C 01DC686C 9C828CC7 */  lwc1        $f12, -0x7D64($28)
/* 01AB70 01DC6870 01000624 */  addiu       $6, $0, 0x1
/* 01AB74 01DC6874 64B9760C */  jal         Draw__11CSeireiKingFPffi
/* 01AB78 01DC6878 00000000 */   nop
/* 01AB7C 01DC687C C498828F */  lw          $2, -0x673C($28)
/* 01AB80 01DC6880 D000A427 */  addiu       $4, $29, 0xD0
/* 01AB84 01DC6884 20024524 */  addiu       $5, $2, 0x220
/* 01AB88 01DC6888 0C86040C */  jal         sceVu0CopyVector
/* 01AB8C 01DC688C 00000000 */   nop
/* 01AB90 01DC6890 E301023C */  lui         $2, %hi(SeireiKing)
/* 01AB94 01DC6894 90E44424 */  addiu       $4, $2, %lo(SeireiKing)
/* 01AB98 01DC6898 E101023C */  lui         $2, %hi(OP_MainCamera)
/* 01AB9C 01DC689C E0954524 */  addiu       $5, $2, %lo(OP_MainCamera)
/* 01ABA0 01DC68A0 28360072 */  paddub      $6, $16, $0
/* 01ABA4 01DC68A4 D000A727 */  addiu       $7, $29, 0xD0
/* 01ABA8 01DC68A8 6CBB760C */  jal         Draw2__11CSeireiKingFP7CCameraPfPf
/* 01ABAC 01DC68AC 00000000 */   nop
/* 01ABB0 01DC68B0 D48B848F */  lw          $4, -0x742C($28)
/* 01ABB4 01DC68B4 F88B8527 */  addiu       $5, $28, -0x7408
/* 01ABB8 01DC68B8 086F050C */  jal         setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha
/* 01ABBC 01DC68BC 00000000 */   nop
/* 01ABC0 01DC68C0 2500023C */  lui         $2, %hi(ambientlight)
/* 01ABC4 01DC68C4 001C4424 */  addiu       $4, $2, %lo(ambientlight)
/* 01ABC8 01DC68C8 40B7040C */  jal         MGSetAmbient__FPf
/* 01ABCC 01DC68CC 00000000 */   nop
.L01DC68D0_2CC0D0:
/* 01ABD0 01DC68D0 2000BF7B */  lq          $31, 0x20($29)
/* 01ABD4 01DC68D4 1000B17B */  lq          $17, 0x10($29)
/* 01ABD8 01DC68D8 0000B07B */  lq          $16, 0x0($29)
/* 01ABDC 01DC68DC F000BD27 */  addiu       $29, $29, 0xF0
/* 01ABE0 01DC68E0 0800E003 */  jr          $31
/* 01ABE4 01DC68E4 00000000 */   nop
/* 01ABE8 01DC68E8 00000000 */  nop
/* 01ABEC 01DC68EC 00000000 */  nop
