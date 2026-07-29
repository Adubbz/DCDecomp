.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel UngagaKey_On__Fv
/* 1431E0 002430E0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 1431E4 002430E4 0000BF7F */  sq          $31, 0x0($29)
/* 1431E8 002430E8 DC01013C */  lui         $1, %hi(BtActStatus + 0x14C)
/* 1431EC 002430EC CC452384 */  lh          $3, %lo(BtActStatus + 0x14C)($1)
/* 1431F0 002430F0 5700601C */  bgtz        $3, .L00243250
/* 1431F4 002430F4 00000000 */   nop
/* 1431F8 002430F8 789C838F */  lw          $3, -0x6388($28)
/* 1431FC 002430FC 01000524 */  addiu       $5, $0, 0x1
/* 143200 00243100 344365AC */  sw          $5, 0x4334($3)
/* 143204 00243104 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 143208 00243108 9044238C */  lw          $3, %lo(BtActStatus + 0x10)($1)
/* 14320C 0024310C 23006014 */  bnez        $3, .L0024319C
/* 143210 00243110 00000000 */   nop
/* 143214 00243114 DC01013C */  lui         $1, %hi(BtActStatus + 0xF8)
/* 143218 00243118 784520AC */  sw          $0, %lo(BtActStatus + 0xF8)($1)
/* 14321C 0024311C 25000224 */  addiu       $2, $0, 0x25
/* 143220 00243120 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 143224 00243124 944422AC */  sw          $2, %lo(BtActStatus + 0x14)($1)
/* 143228 00243128 DC01013C */  lui         $1, %hi(BtActStatus + 0x10)
/* 14322C 0024312C 904425AC */  sw          $5, %lo(BtActStatus + 0x10)($1)
/* 143230 00243130 DC01013C */  lui         $1, %hi(BtActStatus + 0x18)
/* 143234 00243134 984420AC */  sw          $0, %lo(BtActStatus + 0x18)($1)
/* 143238 00243138 803F023C */  lui         $2, (0x3F800000 >> 16)
/* 14323C 0024313C DC01013C */  lui         $1, %hi(BtActStatus + 0x1C)
/* 143240 00243140 9C4422AC */  sw          $2, %lo(BtActStatus + 0x1C)($1)
/* 143244 00243144 DC01013C */  lui         $1, %hi(BtActStatus + 0x5C)
/* 143248 00243148 DC4420AC */  sw          $0, %lo(BtActStatus + 0x5C)($1)
/* 14324C 0024314C 7C9D85AF */  sw          $5, -0x6284($28)
/* 143250 00243150 0843023C */  lui         $2, (0x43080000 >> 16)
/* 143254 00243154 EA01013C */  lui         $1, %hi(CharaMain + 0x2F0)
/* 143258 00243158 102022AC */  sw          $2, %lo(CharaMain + 0x2F0)($1)
/* 14325C 0024315C DC01013C */  lui         $1, %hi(BtActStatus + 0xE8)
/* 143260 00243160 684520AC */  sw          $0, %lo(BtActStatus + 0xE8)($1)
/* 143264 00243164 DC01013C */  lui         $1, %hi(BtActStatus + 0xF0)
/* 143268 00243168 704520AC */  sw          $0, %lo(BtActStatus + 0xF0)($1)
/* 14326C 0024316C DC01013C */  lui         $1, %hi(BtActStatus + 0xE0)
/* 143270 00243170 604520AC */  sw          $0, %lo(BtActStatus + 0xE0)($1)
/* 143274 00243174 EA01023C */  lui         $2, %hi(CharaMain)
/* 143278 00243178 201D4424 */  addiu       $4, $2, %lo(CharaMain)
/* 14327C 0024317C 1000A527 */  addiu       $5, $29, 0x10
/* 143280 00243180 BC5B050C */  jal         GetRotation__7CObjectFPf
/* 143284 00243184 00000000 */   nop
/* 143288 00243188 1400A0C7 */  lwc1        $f0, 0x14($29)
/* 14328C 0024318C DC01013C */  lui         $1, %hi(BtActStatus + 0xF4)
/* 143290 00243190 744520E4 */  swc1        $f0, %lo(BtActStatus + 0xF4)($1)
/* 143294 00243194 2E000010 */  b           .L00243250
/* 143298 00243198 00000000 */   nop
.L0024319C:
/* 14329C 0024319C DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 1432A0 002431A0 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 1432A4 002431A4 25000324 */  addiu       $3, $0, 0x25
/* 1432A8 002431A8 12008314 */  bne         $4, $3, .L002431F4
/* 1432AC 002431AC 00000000 */   nop
/* 1432B0 002431B0 DC01013C */  lui         $1, %hi(BtActStatus + 0xE8)
/* 1432B4 002431B4 6845238C */  lw          $3, %lo(BtActStatus + 0xE8)($1)
/* 1432B8 002431B8 0E006010 */  beqz        $3, .L002431F4
/* 1432BC 002431BC 00000000 */   nop
/* 1432C0 002431C0 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 1432C4 002431C4 C84421C4 */  lwc1        $f1, %lo(BtActStatus + 0x48)($1)
/* 1432C8 002431C8 2042033C */  lui         $3, (0x42200000 >> 16)
/* 1432CC 002431CC 00008344 */  mtc1        $3, $f0
/* 1432D0 002431D0 00000000 */  nop
/* 1432D4 002431D4 34080046 */  c.lt.s      $f1, $f0
/* 1432D8 002431D8 00000000 */  nop
/* 1432DC 002431DC 05000145 */  bc1t        .L002431F4
/* 1432E0 002431E0 00000000 */   nop
/* 1432E4 002431E4 DC01013C */  lui         $1, %hi(BtActStatus + 0xF0)
/* 1432E8 002431E8 704525AC */  sw          $5, %lo(BtActStatus + 0xF0)($1)
/* 1432EC 002431EC DC01013C */  lui         $1, %hi(BtActStatus + 0xF8)
/* 1432F0 002431F0 784520AC */  sw          $0, %lo(BtActStatus + 0xF8)($1)
.L002431F4:
/* 1432F4 002431F4 DC01013C */  lui         $1, %hi(BtActStatus + 0x14)
/* 1432F8 002431F8 9444248C */  lw          $4, %lo(BtActStatus + 0x14)($1)
/* 1432FC 002431FC 26000324 */  addiu       $3, $0, 0x26
/* 143300 00243200 13008314 */  bne         $4, $3, .L00243250
/* 143304 00243204 00000000 */   nop
/* 143308 00243208 DC01013C */  lui         $1, %hi(BtActStatus + 0xE8)
/* 14330C 0024320C 6845238C */  lw          $3, %lo(BtActStatus + 0xE8)($1)
/* 143310 00243210 0F006010 */  beqz        $3, .L00243250
/* 143314 00243214 00000000 */   nop
/* 143318 00243218 DC01013C */  lui         $1, %hi(BtActStatus + 0x48)
/* 14331C 0024321C C84421C4 */  lwc1        $f1, %lo(BtActStatus + 0x48)($1)
/* 143320 00243220 2042033C */  lui         $3, (0x42200000 >> 16)
/* 143324 00243224 00008344 */  mtc1        $3, $f0
/* 143328 00243228 00000000 */  nop
/* 14332C 0024322C 34080046 */  c.lt.s      $f1, $f0
/* 143330 00243230 00000000 */  nop
/* 143334 00243234 06000145 */  bc1t        .L00243250
/* 143338 00243238 00000000 */   nop
/* 14333C 0024323C 01000324 */  addiu       $3, $0, 0x1
/* 143340 00243240 DC01013C */  lui         $1, %hi(BtActStatus + 0xF0)
/* 143344 00243244 704523AC */  sw          $3, %lo(BtActStatus + 0xF0)($1)
/* 143348 00243248 DC01013C */  lui         $1, %hi(BtActStatus + 0xF8)
/* 14334C 0024324C 784520AC */  sw          $0, %lo(BtActStatus + 0xF8)($1)
.L00243250:
/* 143350 00243250 0000BF7B */  lq          $31, 0x0($29)
/* 143354 00243254 2000BD27 */  addiu       $29, $29, 0x20
/* 143358 00243258 0800E003 */  jr          $31
/* 14335C 0024325C 00000000 */   nop
