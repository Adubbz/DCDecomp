.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitDancerPos__Fv
/* 009BA0 01DB58A0 C0FDBD27 */  addiu       $29, $29, -0x240
/* 009BA4 01DB58A4 0000BF7F */  sq          $31, 0x0($29)
/* 009BA8 01DB58A8 DD01023C */  lui         $2, %hi(LIT_349__4)
/* 009BAC 01DB58AC 10644524 */  addiu       $5, $2, %lo(LIT_349__4)
/* 009BB0 01DB58B0 1000A427 */  addiu       $4, $29, 0x10
/* 009BB4 01DB58B4 23000324 */  addiu       $3, $0, 0x23
.L01DB58B8_2BB0B8:
/* 009BB8 01DB58B8 0000A278 */  lq          $2, 0x0($5)
/* 009BBC 01DB58BC 1000A524 */  addiu       $5, $5, 0x10
/* 009BC0 01DB58C0 FFFF6324 */  addiu       $3, $3, -0x1
/* 009BC4 01DB58C4 0000827C */  sq          $2, 0x0($4)
/* 009BC8 01DB58C8 10008424 */  addiu       $4, $4, 0x10
/* 009BCC 01DB58CC FAFF601C */  bgtz        $3, .L01DB58B8_2BB0B8
/* 009BD0 01DB58D0 00000000 */   nop
/* 009BD4 01DB58D4 28260070 */  paddub      $4, $0, $0
/* 009BD8 01DB58D8 23000010 */  b           .L01DB5968_2BB168
/* 009BDC 01DB58DC 00000000 */   nop
.L01DB58E0_2BB0E0:
/* 009BE0 01DB58E0 00290400 */  sll         $5, $4, 4
/* 009BE4 01DB58E4 2118BD00 */  addu        $3, $5, $29
/* 009BE8 01DB58E8 2041023C */  lui         $2, (0x41200000 >> 16)
/* 009BEC 01DB58EC 00088244 */  mtc1        $2, $f1
/* 009BF0 01DB58F0 100060C4 */  lwc1        $f0, 0x10($3)
/* 009BF4 01DB58F4 02080046 */  mul.s       $f0, $f1, $f0
/* 009BF8 01DB58F8 E201023C */  lui         $2, %hi(DancerPos)
/* 009BFC 01DB58FC 60E04224 */  addiu       $2, $2, %lo(DancerPos)
/* 009C00 01DB5900 21104500 */  addu        $2, $2, $5
/* 009C04 01DB5904 000040E4 */  swc1        $f0, 0x0($2)
/* 009C08 01DB5908 140060C4 */  lwc1        $f0, 0x14($3)
/* 009C0C 01DB590C 02080046 */  mul.s       $f0, $f1, $f0
/* 009C10 01DB5910 E201023C */  lui         $2, %hi(DancerPos + 0x4)
/* 009C14 01DB5914 64E04224 */  addiu       $2, $2, %lo(DancerPos + 0x4)
/* 009C18 01DB5918 21104500 */  addu        $2, $2, $5
/* 009C1C 01DB591C 000040E4 */  swc1        $f0, 0x0($2)
/* 009C20 01DB5920 180060C4 */  lwc1        $f0, 0x18($3)
/* 009C24 01DB5924 02080046 */  mul.s       $f0, $f1, $f0
/* 009C28 01DB5928 00080046 */  add.s       $f0, $f1, $f0
/* 009C2C 01DB592C E201023C */  lui         $2, %hi(DancerPos + 0x8)
/* 009C30 01DB5930 68E04224 */  addiu       $2, $2, %lo(DancerPos + 0x8)
/* 009C34 01DB5934 21104500 */  addu        $2, $2, $5
/* 009C38 01DB5938 000040E4 */  swc1        $f0, 0x0($2)
/* 009C3C 01DB593C E201023C */  lui         $2, %hi(DancerRot)
/* 009C40 01DB5940 90E24224 */  addiu       $2, $2, %lo(DancerRot)
/* 009C44 01DB5944 21184500 */  addu        $3, $2, $5
/* 009C48 01DB5948 000060AC */  sw          $0, 0x0($3)
/* 009C4C 01DB594C B08080C7 */  lwc1        $f0, -0x7F50($28)
/* 009C50 01DB5950 E201023C */  lui         $2, %hi(DancerRot + 0x4)
/* 009C54 01DB5954 94E24224 */  addiu       $2, $2, %lo(DancerRot + 0x4)
/* 009C58 01DB5958 21104500 */  addu        $2, $2, $5
/* 009C5C 01DB595C 000040E4 */  swc1        $f0, 0x0($2)
/* 009C60 01DB5960 000060AC */  sw          $0, 0x0($3)
/* 009C64 01DB5964 01008424 */  addiu       $4, $4, 0x1
.L01DB5968_2BB168:
/* 009C68 01DB5968 23008228 */  slti        $2, $4, 0x23
/* 009C6C 01DB596C DCFF4014 */  bnez        $2, .L01DB58E0_2BB0E0
/* 009C70 01DB5970 00000000 */   nop
/* 009C74 01DB5974 00608044 */  mtc1        $0, $f12
/* 009C78 01DB5978 7A43023C */  lui         $2, (0x437A0000 >> 16)
/* 009C7C 01DB597C 00708244 */  mtc1        $2, $f14
/* 009C80 01DB5980 46630046 */  mov.s       $f13, $f12
/* 009C84 01DB5984 DF01023C */  lui         $2, %hi(UraEventMan + 0xA50)
/* 009C88 01DB5988 00694424 */  addiu       $4, $2, %lo(UraEventMan + 0xA50)
/* 009C8C 01DB598C ECE3040C */  jal         SetPosition__10CCharacterFfff
/* 009C90 01DB5990 00000000 */   nop
/* 009C94 01DB5994 00708044 */  mtc1        $0, $f14
/* 009C98 01DB5998 00000000 */  nop
/* 009C9C 01DB599C 06730046 */  mov.s       $f12, $f14
/* 009CA0 01DB59A0 DF01023C */  lui         $2, %hi(UraEventMan + 0xA50)
/* 009CA4 01DB59A4 00694424 */  addiu       $4, $2, %lo(UraEventMan + 0xA50)
/* 009CA8 01DB59A8 B0808DC7 */  lwc1        $f13, -0x7F50($28)
/* 009CAC 01DB59AC 54E4040C */  jal         SetRotation__10CCharacterFfff
/* 009CB0 01DB59B0 00000000 */   nop
/* 009CB4 01DB59B4 0000BF7B */  lq          $31, 0x0($29)
/* 009CB8 01DB59B8 4002BD27 */  addiu       $29, $29, 0x240
/* 009CBC 01DB59BC 0800E003 */  jr          $31
/* 009CC0 01DB59C0 00000000 */   nop
/* 009CC4 01DB59C4 00000000 */  nop
/* 009CC8 01DB59C8 00000000 */  nop
/* 009CCC 01DB59CC 00000000 */  nop
