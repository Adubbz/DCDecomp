.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawCloud__Fv
/* 00AA10 01DB6710 D0FFBD27 */  addiu       $29, $29, -0x30
/* 00AA14 01DB6714 1000BF7F */  sq          $31, 0x10($29)
/* 00AA18 01DB6718 0000B4E7 */  swc1        $f20, 0x0($29)
/* 00AA1C 01DB671C 20998383 */  lb          $3, -0x66E0($28)
/* 00AA20 01DB6720 04006014 */  bnez        $3, .L01DB6734_2BBF34
/* 00AA24 01DB6724 00000000 */   nop
/* 00AA28 01DB6728 1C9980AF */  sw          $0, -0x66E4($28)
/* 00AA2C 01DB672C 01000324 */  addiu       $3, $0, 0x1
/* 00AA30 01DB6730 209983A3 */  sb          $3, -0x66E0($28)
.L01DB6734_2BBF34:
/* 00AA34 01DB6734 DE01013C */  lui         $1, %hi(CScript__2 + 0x14)
/* 00AA38 01DB6738 141B248C */  lw          $4, %lo(CScript__2 + 0x14)($1)
/* 00AA3C 01DB673C 02000324 */  addiu       $3, $0, 0x2
/* 00AA40 01DB6740 03008314 */  bne         $4, $3, .L01DB6750_2BBF50
/* 00AA44 01DB6744 00000000 */   nop
/* 00AA48 01DB6748 01000324 */  addiu       $3, $0, 0x1
/* 00AA4C 01DB674C C89883A3 */  sb          $3, -0x6738($28)
.L01DB6750_2BBF50:
/* 00AA50 01DB6750 C8988483 */  lb          $4, -0x6738($28)
/* 00AA54 01DB6754 01000324 */  addiu       $3, $0, 0x1
/* 00AA58 01DB6758 71008314 */  bne         $4, $3, .L01DB6920_2BC120
/* 00AA5C 01DB675C 00000000 */   nop
/* 00AA60 01DB6760 C701023C */  lui         $2, %hi(TexManager)
/* 00AA64 01DB6764 70584424 */  addiu       $4, $2, %lo(TexManager)
/* 00AA68 01DB6768 D48B858F */  lw          $5, -0x742C($28)
/* 00AA6C 01DB676C 08000624 */  addiu       $6, $0, 0x8
/* 00AA70 01DB6770 1CCC040C */  jal         ReloadTexture__15CTextureManagerFP13sceVif1Packeti
/* 00AA74 01DB6774 00000000 */   nop
/* 00AA78 01DB6778 0898828F */  lw          $2, -0x67F8($28)
/* 00AA7C 01DB677C 03004014 */  bnez        $2, .L01DB678C_2BBF8C
/* 00AA80 01DB6780 00000000 */   nop
/* 00AA84 01DB6784 54E1760C */  jal         setCloudTexScroll__Fv
/* 00AA88 01DB6788 00000000 */   nop
.L01DB678C_2BBF8C:
/* 00AA8C 01DB678C 1C998CC7 */  lwc1        $f12, -0x66E4($28)
/* 00AA90 01DB6790 E201013C */  lui         $1, %hi(Cloud + 0xBC)
/* 00AA94 01DB6794 7CE5248C */  lw          $4, %lo(Cloud + 0xBC)($1)
/* 00AA98 01DB6798 46630046 */  mov.s       $f13, $f12
/* 00AA9C 01DB679C 86630046 */  mov.s       $f14, $f12
/* 00AAA0 01DB67A0 D49F040C */  jal         SetScale__6CFrameFfff
/* 00AAA4 01DB67A4 00000000 */   nop
/* 00AAA8 01DB67A8 DE01013C */  lui         $1, %hi(CScript__2)
/* 00AAAC 01DB67AC 001B238C */  lw          $3, %lo(CScript__2)($1)
/* 00AAB0 01DB67B0 2C000224 */  addiu       $2, $0, 0x2C
/* 00AAB4 01DB67B4 04006210 */  beq         $3, $2, .L01DB67C8_2BBFC8
/* 00AAB8 01DB67B8 00000000 */   nop
/* 00AABC 01DB67BC 10000224 */  addiu       $2, $0, 0x10
/* 00AAC0 01DB67C0 14006214 */  bne         $3, $2, .L01DB6814_2BC014
/* 00AAC4 01DB67C4 00000000 */   nop
.L01DB67C8_2BBFC8:
/* 00AAC8 01DB67C8 00608044 */  mtc1        $0, $f12
/* 00AACC 01DB67CC F041023C */  lui         $2, (0x41F00000 >> 16)
/* 00AAD0 01DB67D0 00688244 */  mtc1        $2, $f13
/* 00AAD4 01DB67D4 20C1023C */  lui         $2, (0xC1200000 >> 16)
/* 00AAD8 01DB67D8 00708244 */  mtc1        $2, $f14
/* 00AADC 01DB67DC E201023C */  lui         $2, %hi(Cloud)
/* 00AAE0 01DB67E0 C0E44424 */  addiu       $4, $2, %lo(Cloud)
/* 00AAE4 01DB67E4 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 00AAE8 01DB67E8 00000000 */   nop
/* 00AAEC 01DB67EC 00608044 */  mtc1        $0, $f12
/* 00AAF0 01DB67F0 00000000 */  nop
/* 00AAF4 01DB67F4 86630046 */  mov.s       $f14, $f12
/* 00AAF8 01DB67F8 E201023C */  lui         $2, %hi(Cloud)
/* 00AAFC 01DB67FC C0E44424 */  addiu       $4, $2, %lo(Cloud)
/* 00AB00 01DB6800 B0808DC7 */  lwc1        $f13, -0x7F50($28)
/* 00AB04 01DB6804 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00AB08 01DB6808 00000000 */   nop
/* 00AB0C 01DB680C 12000010 */  b           .L01DB6858_2BC058
/* 00AB10 01DB6810 00000000 */   nop
.L01DB6814_2BC014:
/* 00AB14 01DB6814 00608044 */  mtc1        $0, $f12
/* 00AB18 01DB6818 7041023C */  lui         $2, (0x41700000 >> 16)
/* 00AB1C 01DB681C 00708244 */  mtc1        $2, $f14
/* 00AB20 01DB6820 4842023C */  lui         $2, (0x42480000 >> 16)
/* 00AB24 01DB6824 00688244 */  mtc1        $2, $f13
/* 00AB28 01DB6828 E201023C */  lui         $2, %hi(Cloud)
/* 00AB2C 01DB682C C0E44424 */  addiu       $4, $2, %lo(Cloud)
/* 00AB30 01DB6830 ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 00AB34 01DB6834 00000000 */   nop
/* 00AB38 01DB6838 00608044 */  mtc1        $0, $f12
/* 00AB3C 01DB683C 00000000 */  nop
/* 00AB40 01DB6840 86630046 */  mov.s       $f14, $f12
/* 00AB44 01DB6844 46630046 */  mov.s       $f13, $f12
/* 00AB48 01DB6848 E201023C */  lui         $2, %hi(Cloud)
/* 00AB4C 01DB684C C0E44424 */  addiu       $4, $2, %lo(Cloud)
/* 00AB50 01DB6850 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 00AB54 01DB6854 00000000 */   nop
.L01DB6858_2BC058:
/* 00AB58 01DB6858 2000A427 */  addiu       $4, $29, 0x20
/* 00AB5C 01DB685C 4CB7040C */  jal         MGGetAmbient__FPf
/* 00AB60 01DB6860 00000000 */   nop
/* 00AB64 01DB6864 DD01023C */  lui         $2, %hi(ambient$655)
/* 00AB68 01DB6868 60664424 */  addiu       $4, $2, %lo(ambient$655)
/* 00AB6C 01DB686C 40B7040C */  jal         MGSetAmbient__FPf
/* 00AB70 01DB6870 00000000 */   nop
/* 00AB74 01DB6874 E201023C */  lui         $2, %hi(Cloud)
/* 00AB78 01DB6878 C0E44424 */  addiu       $4, $2, %lo(Cloud)
/* 00AB7C 01DB687C C4E4040C */  jal         Draw__10CCharacterFv
/* 00AB80 01DB6880 00000000 */   nop
/* 00AB84 01DB6884 50DA760C */  jal         SmokeProcess__Fv
/* 00AB88 01DB6888 00000000 */   nop
/* 00AB8C 01DB688C 2000A427 */  addiu       $4, $29, 0x20
/* 00AB90 01DB6890 40B7040C */  jal         MGSetAmbient__FPf
/* 00AB94 01DB6894 00000000 */   nop
/* 00AB98 01DB6898 0898838F */  lw          $3, -0x67F8($28)
/* 00AB9C 01DB689C 23006014 */  bnez        $3, .L01DB692C_2BC12C
/* 00ABA0 01DB68A0 00000000 */   nop
/* 00ABA4 01DB68A4 1C9994C7 */  lwc1        $f20, -0x66E4($28)
/* 00ABA8 01DB68A8 06A30046 */  mov.s       $f12, $f20
/* 00ABAC 01DB68AC 9044040C */  jal         fptodp
/* 00ABB0 01DB68B0 00000000 */   nop
/* 00ABB4 01DB68B4 F03F033C */  lui         $3, (0x3FF00000 >> 16)
/* 00ABB8 01DB68B8 3C280300 */  dsll32      $5, $3, 0
/* 00ABBC 01DB68BC 28264070 */  paddub      $4, $2, $0
/* 00ABC0 01DB68C0 4400040C */  jal         _dpflt
/* 00ABC4 01DB68C4 00000000 */   nop
/* 00ABC8 01DB68C8 04004010 */  beqz        $2, .L01DB68DC_2BC0DC
/* 00ABCC 01DB68CC 00000000 */   nop
/* 00ABD0 01DB68D0 EC8380C7 */  lwc1        $f0, -0x7C14($28)
/* 00ABD4 01DB68D4 00001446 */  add.s       $f0, $f0, $f20
/* 00ABD8 01DB68D8 1C9980E7 */  swc1        $f0, -0x66E4($28)
.L01DB68DC_2BC0DC:
/* 00ABDC 01DB68DC DD01013C */  lui         $1, %hi(ambient$655 + 0xC)
/* 00ABE0 01DB68E0 6C6621C4 */  lwc1        $f1, %lo(ambient$655 + 0xC)($1)
/* 00ABE4 01DB68E4 A042033C */  lui         $3, (0x42A00000 >> 16)
/* 00ABE8 01DB68E8 00008344 */  mtc1        $3, $f0
/* 00ABEC 01DB68EC 00000000 */  nop
/* 00ABF0 01DB68F0 34080046 */  c.lt.s      $f1, $f0
/* 00ABF4 01DB68F4 00000000 */  nop
/* 00ABF8 01DB68F8 0C000045 */  bc1f        .L01DB692C_2BC12C
/* 00ABFC 01DB68FC 00000000 */   nop
/* 00AC00 01DB6900 803F033C */  lui         $3, (0x3F800000 >> 16)
/* 00AC04 01DB6904 00008344 */  mtc1        $3, $f0
/* 00AC08 01DB6908 00000000 */  nop
/* 00AC0C 01DB690C 00080046 */  add.s       $f0, $f1, $f0
/* 00AC10 01DB6910 DD01013C */  lui         $1, %hi(ambient$655 + 0xC)
/* 00AC14 01DB6914 6C6620E4 */  swc1        $f0, %lo(ambient$655 + 0xC)($1)
/* 00AC18 01DB6918 04000010 */  b           .L01DB692C_2BC12C
/* 00AC1C 01DB691C 00000000 */   nop
.L01DB6920_2BC120:
/* 00AC20 01DB6920 1C9980AF */  sw          $0, -0x66E4($28)
/* 00AC24 01DB6924 DD01013C */  lui         $1, %hi(ambient$655 + 0xC)
/* 00AC28 01DB6928 6C6620AC */  sw          $0, %lo(ambient$655 + 0xC)($1)
.L01DB692C_2BC12C:
/* 00AC2C 01DB692C 1000BF7B */  lq          $31, 0x10($29)
/* 00AC30 01DB6930 0000B4C7 */  lwc1        $f20, 0x0($29)
/* 00AC34 01DB6934 3000BD27 */  addiu       $29, $29, 0x30
/* 00AC38 01DB6938 0800E003 */  jr          $31
/* 00AC3C 01DB693C 00000000 */   nop
