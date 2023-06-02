.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtSystemScriptEventInfoInit__Fv
/* BB160 001BB060 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* BB164 001BB064 0000BF7F */  sq         $31, 0x0($sp)
/* BB168 001BB068 FFFF0324 */  addiu      $3, $0, -0x1
/* BB16C 001BB06C D501013C */  lui        $at, (0x1D5676C >> 16)
/* BB170 001BB070 6C6723AC */  sw         $3, (0x1D5676C & 0xFFFF)($at)
/* BB174 001BB074 D501013C */  lui        $at, (0x1D56770 >> 16)
/* BB178 001BB078 706723AC */  sw         $3, (0x1D56770 & 0xFFFF)($at)
/* BB17C 001BB07C 01000224 */  addiu      $2, $0, 0x1
/* BB180 001BB080 D501013C */  lui        $at, (0x1D56768 >> 16)
/* BB184 001BB084 686722AC */  sw         $2, (0x1D56768 & 0xFFFF)($at)
/* BB188 001BB088 D501013C */  lui        $at, (0x1D56774 >> 16)
/* BB18C 001BB08C 746720AC */  sw         $0, (0x1D56774 & 0xFFFF)($at)
/* BB190 001BB090 D501013C */  lui        $at, (0x1D56760 >> 16)
/* BB194 001BB094 606722AC */  sw         $2, (0x1D56760 & 0xFFFF)($at)
/* BB198 001BB098 D501013C */  lui        $at, (0x1D567C0 >> 16)
/* BB19C 001BB09C C06720AC */  sw         $0, (0x1D567C0 & 0xFFFF)($at)
/* BB1A0 001BB0A0 D501013C */  lui        $at, (0x1D567C4 >> 16)
/* BB1A4 001BB0A4 C46720AC */  sw         $0, (0x1D567C4 & 0xFFFF)($at)
/* BB1A8 001BB0A8 D501013C */  lui        $at, (0x1D567C8 >> 16)
/* BB1AC 001BB0AC C86720AC */  sw         $0, (0x1D567C8 & 0xFFFF)($at)
/* BB1B0 001BB0B0 D501013C */  lui        $at, (0x1D567D8 >> 16)
/* BB1B4 001BB0B4 D86720AC */  sw         $0, (0x1D567D8 & 0xFFFF)($at)
/* BB1B8 001BB0B8 D501013C */  lui        $at, (0x1D567DC >> 16)
/* BB1BC 001BB0BC DC6723AC */  sw         $3, (0x1D567DC & 0xFFFF)($at)
/* BB1C0 001BB0C0 D501013C */  lui        $at, (0x1D567E0 >> 16)
/* BB1C4 001BB0C4 E06723AC */  sw         $3, (0x1D567E0 & 0xFFFF)($at)
/* BB1C8 001BB0C8 D501013C */  lui        $at, (0x1D567E4 >> 16)
/* BB1CC 001BB0CC E46720AC */  sw         $0, (0x1D567E4 & 0xFFFF)($at)
/* BB1D0 001BB0D0 D501013C */  lui        $at, (0x1D567E8 >> 16)
/* BB1D4 001BB0D4 E86723AC */  sw         $3, (0x1D567E8 & 0xFFFF)($at)
/* BB1D8 001BB0D8 D501013C */  lui        $at, (0x1D567CC >> 16)
/* BB1DC 001BB0DC CC6720AC */  sw         $0, (0x1D567CC & 0xFFFF)($at)
/* BB1E0 001BB0E0 D501013C */  lui        $at, (0x1D567D4 >> 16)
/* BB1E4 001BB0E4 D46723AC */  sw         $3, (0x1D567D4 & 0xFFFF)($at)
/* BB1E8 001BB0E8 D501013C */  lui        $at, (0x1D567D0 >> 16)
/* BB1EC 001BB0EC D06722AC */  sw         $2, (0x1D567D0 & 0xFFFF)($at)
/* BB1F0 001BB0F0 D501013C */  lui        $at, (0x1D567F8 >> 16)
/* BB1F4 001BB0F4 F86720AC */  sw         $0, (0x1D567F8 & 0xFFFF)($at)
/* BB1F8 001BB0F8 80BF023C */  lui        $2, (0xBF800000 >> 16)
/* BB1FC 001BB0FC D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB200 001BB100 0CD222AC */  sw         $2, -0x2DF4($at)
/* BB204 001BB104 EA01023C */  lui        $2, %hi(D_1EA1D20)
/* BB208 001BB108 201D4224 */  addiu      $2, $2, %lo(D_1EA1D20)
/* BB20C 001BB10C D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB210 001BB110 1CD222AC */  sw         $2, -0x2DE4($at)
/* BB214 001BB114 28260070 */  paddub     $4, $0, $0
/* BB218 001BB118 0B000010 */  b          .L001BB148
/* BB21C 001BB11C 00000000 */   nop
.L001BB120:
/* BB220 001BB120 40110400 */  sll        $2, $4, 5
/* BB224 001BB124 21184400 */  addu       $3, $2, $4
/* BB228 001BB128 80100300 */  sll        $2, $3, 2
/* BB22C 001BB12C 21106200 */  addu       $2, $3, $2
/* BB230 001BB130 40190200 */  sll        $3, $2, 5
/* BB234 001BB134 EB01023C */  lui        $2, %hi(D_1EA851C)
/* BB238 001BB138 1C854224 */  addiu      $2, $2, %lo(D_1EA851C)
/* BB23C 001BB13C 21104300 */  addu       $2, $2, $3
/* BB240 001BB140 000040AC */  sw         $0, 0x0($2)
/* BB244 001BB144 01008424 */  addiu      $4, $4, 0x1
.L001BB148:
/* BB248 001BB148 06008228 */  slti       $2, $4, 0x6
/* BB24C 001BB14C F4FF4014 */  bnez       $2, .L001BB120
/* BB250 001BB150 00000000 */   nop
/* BB254 001BB154 EB01023C */  lui        $2, %hi(D_1EA8460)
/* BB258 001BB158 60844224 */  addiu      $2, $2, %lo(D_1EA8460)
/* BB25C 001BB15C D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB260 001BB160 28D222AC */  sw         $2, -0x2DD8($at)
/* BB264 001BB164 20000224 */  addiu      $2, $0, 0x20
/* BB268 001BB168 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB26C 001BB16C C4D322AC */  sw         $2, -0x2C3C($at)
/* BB270 001BB170 11000224 */  addiu      $2, $0, 0x11
/* BB274 001BB174 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB278 001BB178 40D222AC */  sw         $2, -0x2DC0($at)
/* BB27C 001BB17C 06000224 */  addiu      $2, $0, 0x6
/* BB280 001BB180 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB284 001BB184 C8D322AC */  sw         $2, -0x2C38($at)
/* BB288 001BB188 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB28C 001BB18C CCD320AC */  sw         $0, -0x2C34($at)
/* BB290 001BB190 28260070 */  paddub     $4, $0, $0
/* BB294 001BB194 07000010 */  b          .L001BB1B4
/* BB298 001BB198 00000000 */   nop
.L001BB19C:
/* BB29C 001BB19C 80180400 */  sll        $3, $4, 2
/* BB2A0 001BB1A0 D401023C */  lui        $2, %hi(D_1D3D3D0)
/* BB2A4 001BB1A4 D0D34224 */  addiu      $2, $2, %lo(D_1D3D3D0)
/* BB2A8 001BB1A8 21104300 */  addu       $2, $2, $3
/* BB2AC 001BB1AC 000040AC */  sw         $0, 0x0($2)
/* BB2B0 001BB1B0 01008424 */  addiu      $4, $4, 0x1
.L001BB1B4:
/* BB2B4 001BB1B4 08008228 */  slti       $2, $4, 0x8
/* BB2B8 001BB1B8 F8FF4014 */  bnez       $2, .L001BB19C
/* BB2BC 001BB1BC 00000000 */   nop
/* BB2C0 001BB1C0 EC01023C */  lui        $2, %hi(D_1EBAB60)
/* BB2C4 001BB1C4 60AB4224 */  addiu      $2, $2, %lo(D_1EBAB60)
/* BB2C8 001BB1C8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB2CC 001BB1CC D4D322AC */  sw         $2, -0x2C2C($at)
/* BB2D0 001BB1D0 EC01023C */  lui        $2, %hi(D_1EBC320)
/* BB2D4 001BB1D4 20C34224 */  addiu      $2, $2, %lo(D_1EBC320)
/* BB2D8 001BB1D8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* BB2DC 001BB1DC D8D322AC */  sw         $2, -0x2C28($at)
/* BB2E0 001BB1E0 045E060C */  jal        EdEventAllClear__Fv
/* BB2E4 001BB1E4 00000000 */   nop
/* BB2E8 001BB1E8 0000BF7B */  lq         $31, 0x0($sp)
/* BB2EC 001BB1EC 1000BD27 */  addiu      $sp, $sp, 0x10
/* BB2F0 001BB1F0 0800E003 */  jr         $31
/* BB2F4 001BB1F4 00000000 */   nop
/* BB2F8 001BB1F8 00000000 */  nop
/* BB2FC 001BB1FC 00000000 */  nop
