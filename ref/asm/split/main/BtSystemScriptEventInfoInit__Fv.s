.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel BtSystemScriptEventInfoInit__Fv
/* 0BB160 001BB060 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0BB164 001BB064 0000BF7F */  sq          $31, 0x0($29)
/* 0BB168 001BB068 FFFF0324 */  addiu       $3, $0, -0x1
/* 0BB16C 001BB06C D501013C */  lui         $1, %hi(BtEventInfo + 0x2C)
/* 0BB170 001BB070 6C6723AC */  sw          $3, %lo(BtEventInfo + 0x2C)($1)
/* 0BB174 001BB074 D501013C */  lui         $1, %hi(BtEventInfo + 0x30)
/* 0BB178 001BB078 706723AC */  sw          $3, %lo(BtEventInfo + 0x30)($1)
/* 0BB17C 001BB07C 01000224 */  addiu       $2, $0, 0x1
/* 0BB180 001BB080 D501013C */  lui         $1, %hi(BtEventInfo + 0x28)
/* 0BB184 001BB084 686722AC */  sw          $2, %lo(BtEventInfo + 0x28)($1)
/* 0BB188 001BB088 D501013C */  lui         $1, %hi(BtEventInfo + 0x34)
/* 0BB18C 001BB08C 746720AC */  sw          $0, %lo(BtEventInfo + 0x34)($1)
/* 0BB190 001BB090 D501013C */  lui         $1, %hi(BtEventInfo + 0x20)
/* 0BB194 001BB094 606722AC */  sw          $2, %lo(BtEventInfo + 0x20)($1)
/* 0BB198 001BB098 D501013C */  lui         $1, %hi(BtEventInfo + 0x80)
/* 0BB19C 001BB09C C06720AC */  sw          $0, %lo(BtEventInfo + 0x80)($1)
/* 0BB1A0 001BB0A0 D501013C */  lui         $1, %hi(BtEventInfo + 0x84)
/* 0BB1A4 001BB0A4 C46720AC */  sw          $0, %lo(BtEventInfo + 0x84)($1)
/* 0BB1A8 001BB0A8 D501013C */  lui         $1, %hi(BtEventInfo + 0x88)
/* 0BB1AC 001BB0AC C86720AC */  sw          $0, %lo(BtEventInfo + 0x88)($1)
/* 0BB1B0 001BB0B0 D501013C */  lui         $1, %hi(BtEventInfo + 0x98)
/* 0BB1B4 001BB0B4 D86720AC */  sw          $0, %lo(BtEventInfo + 0x98)($1)
/* 0BB1B8 001BB0B8 D501013C */  lui         $1, %hi(BtEventInfo + 0x9C)
/* 0BB1BC 001BB0BC DC6723AC */  sw          $3, %lo(BtEventInfo + 0x9C)($1)
/* 0BB1C0 001BB0C0 D501013C */  lui         $1, %hi(BtEventInfo + 0xA0)
/* 0BB1C4 001BB0C4 E06723AC */  sw          $3, %lo(BtEventInfo + 0xA0)($1)
/* 0BB1C8 001BB0C8 D501013C */  lui         $1, %hi(BtEventInfo + 0xA4)
/* 0BB1CC 001BB0CC E46720AC */  sw          $0, %lo(BtEventInfo + 0xA4)($1)
/* 0BB1D0 001BB0D0 D501013C */  lui         $1, %hi(BtEventInfo + 0xA8)
/* 0BB1D4 001BB0D4 E86723AC */  sw          $3, %lo(BtEventInfo + 0xA8)($1)
/* 0BB1D8 001BB0D8 D501013C */  lui         $1, %hi(BtEventInfo + 0x8C)
/* 0BB1DC 001BB0DC CC6720AC */  sw          $0, %lo(BtEventInfo + 0x8C)($1)
/* 0BB1E0 001BB0E0 D501013C */  lui         $1, %hi(BtEventInfo + 0x94)
/* 0BB1E4 001BB0E4 D46723AC */  sw          $3, %lo(BtEventInfo + 0x94)($1)
/* 0BB1E8 001BB0E8 D501013C */  lui         $1, %hi(BtEventInfo + 0x90)
/* 0BB1EC 001BB0EC D06722AC */  sw          $2, %lo(BtEventInfo + 0x90)($1)
/* 0BB1F0 001BB0F0 D501013C */  lui         $1, %hi(BtEventInfo + 0xB8)
/* 0BB1F4 001BB0F4 F86720AC */  sw          $0, %lo(BtEventInfo + 0xB8)($1)
/* 0BB1F8 001BB0F8 80BF023C */  lui         $2, (0xBF800000 >> 16)
/* 0BB1FC 001BB0FC D401013C */  lui         $1, %hi(EdEventInfo + 0x3C)
/* 0BB200 001BB100 0CD222AC */  sw          $2, %lo(EdEventInfo + 0x3C)($1)
/* 0BB204 001BB104 EA01023C */  lui         $2, %hi(CharaMain)
/* 0BB208 001BB108 201D4224 */  addiu       $2, $2, %lo(CharaMain)
/* 0BB20C 001BB10C D401013C */  lui         $1, %hi(EdEventInfo + 0x4C)
/* 0BB210 001BB110 1CD222AC */  sw          $2, %lo(EdEventInfo + 0x4C)($1)
/* 0BB214 001BB114 28260070 */  paddub      $4, $0, $0
/* 0BB218 001BB118 0B000010 */  b           .L001BB148
/* 0BB21C 001BB11C 00000000 */   nop
.L001BB120:
/* 0BB220 001BB120 40110400 */  sll         $2, $4, 5
/* 0BB224 001BB124 21184400 */  addu        $3, $2, $4
/* 0BB228 001BB128 80100300 */  sll         $2, $3, 2
/* 0BB22C 001BB12C 21106200 */  addu        $2, $3, $2
/* 0BB230 001BB130 40190200 */  sll         $3, $2, 5
/* 0BB234 001BB134 EB01023C */  lui         $2, %hi(NPCUnit + 0xBC)
/* 0BB238 001BB138 1C854224 */  addiu       $2, $2, %lo(NPCUnit + 0xBC)
/* 0BB23C 001BB13C 21104300 */  addu        $2, $2, $3
/* 0BB240 001BB140 000040AC */  sw          $0, 0x0($2)
/* 0BB244 001BB144 01008424 */  addiu       $4, $4, 0x1
.L001BB148:
/* 0BB248 001BB148 06008228 */  slti        $2, $4, 0x6
/* 0BB24C 001BB14C F4FF4014 */  bnez        $2, .L001BB120
/* 0BB250 001BB150 00000000 */   nop
/* 0BB254 001BB154 EB01023C */  lui         $2, %hi(NPCUnit)
/* 0BB258 001BB158 60844224 */  addiu       $2, $2, %lo(NPCUnit)
/* 0BB25C 001BB15C D401013C */  lui         $1, %hi(EdEventInfo + 0x58)
/* 0BB260 001BB160 28D222AC */  sw          $2, %lo(EdEventInfo + 0x58)($1)
/* 0BB264 001BB164 20000224 */  addiu       $2, $0, 0x20
/* 0BB268 001BB168 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F4)
/* 0BB26C 001BB16C C4D322AC */  sw          $2, %lo(EdEventInfo + 0x1F4)($1)
/* 0BB270 001BB170 11000224 */  addiu       $2, $0, 0x11
/* 0BB274 001BB174 D401013C */  lui         $1, %hi(EdEventInfo + 0x70)
/* 0BB278 001BB178 40D222AC */  sw          $2, %lo(EdEventInfo + 0x70)($1)
/* 0BB27C 001BB17C 06000224 */  addiu       $2, $0, 0x6
/* 0BB280 001BB180 D401013C */  lui         $1, %hi(EdEventInfo + 0x1F8)
/* 0BB284 001BB184 C8D322AC */  sw          $2, %lo(EdEventInfo + 0x1F8)($1)
/* 0BB288 001BB188 D401013C */  lui         $1, %hi(EdEventInfo + 0x1FC)
/* 0BB28C 001BB18C CCD320AC */  sw          $0, %lo(EdEventInfo + 0x1FC)($1)
/* 0BB290 001BB190 28260070 */  paddub      $4, $0, $0
/* 0BB294 001BB194 07000010 */  b           .L001BB1B4
/* 0BB298 001BB198 00000000 */   nop
.L001BB19C:
/* 0BB29C 001BB19C 80180400 */  sll         $3, $4, 2
/* 0BB2A0 001BB1A0 D401023C */  lui         $2, %hi(EdEventInfo + 0x200)
/* 0BB2A4 001BB1A4 D0D34224 */  addiu       $2, $2, %lo(EdEventInfo + 0x200)
/* 0BB2A8 001BB1A8 21104300 */  addu        $2, $2, $3
/* 0BB2AC 001BB1AC 000040AC */  sw          $0, 0x0($2)
/* 0BB2B0 001BB1B0 01008424 */  addiu       $4, $4, 0x1
.L001BB1B4:
/* 0BB2B4 001BB1B4 08008228 */  slti        $2, $4, 0x8
/* 0BB2B8 001BB1B8 F8FF4014 */  bnez        $2, .L001BB19C
/* 0BB2BC 001BB1BC 00000000 */   nop
/* 0BB2C0 001BB1C0 EC01023C */  lui         $2, %hi(BtEventMes0)
/* 0BB2C4 001BB1C4 60AB4224 */  addiu       $2, $2, %lo(BtEventMes0)
/* 0BB2C8 001BB1C8 D401013C */  lui         $1, %hi(EdEventInfo + 0x204)
/* 0BB2CC 001BB1CC D4D322AC */  sw          $2, %lo(EdEventInfo + 0x204)($1)
/* 0BB2D0 001BB1D0 EC01023C */  lui         $2, %hi(BtEventMes1)
/* 0BB2D4 001BB1D4 20C34224 */  addiu       $2, $2, %lo(BtEventMes1)
/* 0BB2D8 001BB1D8 D401013C */  lui         $1, %hi(EdEventInfo + 0x208)
/* 0BB2DC 001BB1DC D8D322AC */  sw          $2, %lo(EdEventInfo + 0x208)($1)
/* 0BB2E0 001BB1E0 045E060C */  jal         EdEventAllClear__Fv
/* 0BB2E4 001BB1E4 00000000 */   nop
/* 0BB2E8 001BB1E8 0000BF7B */  lq          $31, 0x0($29)
/* 0BB2EC 001BB1EC 1000BD27 */  addiu       $29, $29, 0x10
/* 0BB2F0 001BB1F0 0800E003 */  jr          $31
/* 0BB2F4 001BB1F4 00000000 */   nop
/* 0BB2F8 001BB1F8 00000000 */  nop
/* 0BB2FC 001BB1FC 00000000 */  nop
