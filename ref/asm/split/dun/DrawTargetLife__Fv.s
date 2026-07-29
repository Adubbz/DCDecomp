.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DrawTargetLife__Fv
/* 014010 01DBFD10 A0FFBD27 */  addiu       $29, $29, -0x60
/* 014014 01DBFD14 2000BF7F */  sq          $31, 0x20($29)
/* 014018 01DBFD18 1000B17F */  sq          $17, 0x10($29)
/* 01401C 01DBFD1C 0000B07F */  sq          $16, 0x0($29)
/* 014020 01DBFD20 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x10)
/* 014024 01DBFD24 308F238C */  lw          $3, %lo(EnemyLifeGage + 0x10)($1)
/* 014028 01DBFD28 60006010 */  beqz        $3, .L01DBFEAC_2FB4AC
/* 01402C 01DBFD2C 00000000 */   nop
/* 014030 01DBFD30 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x14)
/* 014034 01DBFD34 348F238C */  lw          $3, %lo(EnemyLifeGage + 0x14)($1)
/* 014038 01DBFD38 5C006010 */  beqz        $3, .L01DBFEAC_2FB4AC
/* 01403C 01DBFD3C 00000000 */   nop
/* 014040 01DBFD40 1C8D848F */  lw          $4, -0x72E4($28)
/* 014044 01DBFD44 CC5E050C */  jal         GetConfigData__9CSaveDataFv
/* 014048 01DBFD48 00000000 */   nop
/* 01404C 01DBFD4C 2C00438C */  lw          $3, 0x2C($2)
/* 014050 01DBFD50 56006014 */  bnez        $3, .L01DBFEAC_2FB4AC
/* 014054 01DBFD54 00000000 */   nop
/* 014058 01DBFD58 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x8)
/* 01405C 01DBFD5C 288F228C */  lw          $2, %lo(EnemyLifeGage + 0x8)($1)
/* 014060 01DBFD60 E0FF5024 */  addiu       $16, $2, -0x20
/* 014064 01DBFD64 E601013C */  lui         $1, %hi(EnemyLifeGage + 0xC)
/* 014068 01DBFD68 2C8F228C */  lw          $2, %lo(EnemyLifeGage + 0xC)($1)
/* 01406C 01DBFD6C 43100200 */  sra         $2, $2, 1
/* 014070 01DBFD70 40100200 */  sll         $2, $2, 1
/* 014074 01DBFD74 E601013C */  lui         $1, %hi(EnemyLifeGage + 0xC)
/* 014078 01DBFD78 2C8F22AC */  sw          $2, %lo(EnemyLifeGage + 0xC)($1)
/* 01407C 01DBFD7C 8042023C */  lui         $2, (0x42800000 >> 16)
/* 014080 01DBFD80 00088244 */  mtc1        $2, $f1
/* 014084 01DBFD84 E601013C */  lui         $1, %hi(EnemyLifeGage)
/* 014088 01DBFD88 208F20C4 */  lwc1        $f0, %lo(EnemyLifeGage)($1)
/* 01408C 01DBFD8C 20008046 */  cvt.s.w     $f0, $f0
/* 014090 01DBFD90 43080046 */  div.s       $f1, $f1, $f0
/* 014094 01DBFD94 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x4)
/* 014098 01DBFD98 248F20C4 */  lwc1        $f0, %lo(EnemyLifeGage + 0x4)($1)
/* 01409C 01DBFD9C 20008046 */  cvt.s.w     $f0, $f0
/* 0140A0 01DBFDA0 020B0046 */  mul.s       $f12, $f1, $f0
/* 0140A4 01DBFDA4 2C44040C */  jal         fptosi
/* 0140A8 01DBFDA8 00000000 */   nop
/* 0140AC 01DBFDAC 288E4070 */  paddub      $17, $2, $0
/* 0140B0 01DBFDB0 4102012A */  slti        $1, $16, 0x241
/* 0140B4 01DBFDB4 03002010 */  beqz        $1, .L01DBFDC4_2FB3C4
/* 0140B8 01DBFDB8 00000000 */   nop
/* 0140BC 01DBFDBC 03000106 */  bgez        $16, .L01DBFDCC_2FB3CC
/* 0140C0 01DBFDC0 00000000 */   nop
.L01DBFDC4_2FB3C4:
/* 0140C4 01DBFDC4 39000010 */  b           .L01DBFEAC_2FB4AC
/* 0140C8 01DBFDC8 00000000 */   nop
.L01DBFDCC_2FB3CC:
/* 0140CC 01DBFDCC E601013C */  lui         $1, %hi(EnemyLifeGage + 0xC)
/* 0140D0 01DBFDD0 2C8F238C */  lw          $3, %lo(EnemyLifeGage + 0xC)($1)
/* 0140D4 01DBFDD4 E1016128 */  slti        $1, $3, 0x1E1
/* 0140D8 01DBFDD8 03002010 */  beqz        $1, .L01DBFDE8_2FB3E8
/* 0140DC 01DBFDDC 00000000 */   nop
/* 0140E0 01DBFDE0 03006104 */  bgez        $3, .L01DBFDF0_2FB3F0
/* 0140E4 01DBFDE4 00000000 */   nop
.L01DBFDE8_2FB3E8:
/* 0140E8 01DBFDE8 30000010 */  b           .L01DBFEAC_2FB4AC
/* 0140EC 01DBFDEC 00000000 */   nop
.L01DBFDF0_2FB3F0:
/* 0140F0 01DBFDF0 FFFF6324 */  addiu       $3, $3, -0x1
/* 0140F4 01DBFDF4 FFFF0226 */  addiu       $2, $16, -0x1
/* 0140F8 01DBFDF8 3000A2AF */  sw          $2, 0x30($29)
/* 0140FC 01DBFDFC 3400A3AF */  sw          $3, 0x34($29)
/* 014100 01DBFE00 42000224 */  addiu       $2, $0, 0x42
/* 014104 01DBFE04 3800A2AF */  sw          $2, 0x38($29)
/* 014108 01DBFE08 06000224 */  addiu       $2, $0, 0x6
/* 01410C 01DBFE0C 3C00A2AF */  sw          $2, 0x3C($29)
/* 014110 01DBFE10 D48B848F */  lw          $4, -0x742C($28)
/* 014114 01DBFE14 3000A527 */  addiu       $5, $29, 0x30
/* 014118 01DBFE18 188B8627 */  addiu       $6, $28, -0x74E8
/* 01411C 01DBFE1C 1C8B8727 */  addiu       $7, $28, -0x74E4
/* 014120 01DBFE20 2846C070 */  paddub      $8, $6, $0
/* 014124 01DBFE24 284EE070 */  paddub      $9, $7, $0
/* 014128 01DBFE28 4878050C */  jal         set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 01412C 01DBFE2C 00000000 */   nop
/* 014130 01DBFE30 E601013C */  lui         $1, %hi(EnemyLifeGage + 0xC)
/* 014134 01DBFE34 2C8F228C */  lw          $2, %lo(EnemyLifeGage + 0xC)($1)
/* 014138 01DBFE38 4000B0AF */  sw          $16, 0x40($29)
/* 01413C 01DBFE3C 4400A2AF */  sw          $2, 0x44($29)
/* 014140 01DBFE40 40000224 */  addiu       $2, $0, 0x40
/* 014144 01DBFE44 4800A2AF */  sw          $2, 0x48($29)
/* 014148 01DBFE48 04000224 */  addiu       $2, $0, 0x4
/* 01414C 01DBFE4C 4C00A2AF */  sw          $2, 0x4C($29)
/* 014150 01DBFE50 D48B848F */  lw          $4, -0x742C($28)
/* 014154 01DBFE54 4000A527 */  addiu       $5, $29, 0x40
/* 014158 01DBFE58 208B8627 */  addiu       $6, $28, -0x74E0
/* 01415C 01DBFE5C 283EC070 */  paddub      $7, $6, $0
/* 014160 01DBFE60 2846C070 */  paddub      $8, $6, $0
/* 014164 01DBFE64 284EC070 */  paddub      $9, $6, $0
/* 014168 01DBFE68 4878050C */  jal         set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 01416C 01DBFE6C 00000000 */   nop
/* 014170 01DBFE70 E601013C */  lui         $1, %hi(EnemyLifeGage + 0xC)
/* 014174 01DBFE74 2C8F228C */  lw          $2, %lo(EnemyLifeGage + 0xC)($1)
/* 014178 01DBFE78 5000B0AF */  sw          $16, 0x50($29)
/* 01417C 01DBFE7C 5400A2AF */  sw          $2, 0x54($29)
/* 014180 01DBFE80 5800B1AF */  sw          $17, 0x58($29)
/* 014184 01DBFE84 04000224 */  addiu       $2, $0, 0x4
/* 014188 01DBFE88 5C00A2AF */  sw          $2, 0x5C($29)
/* 01418C 01DBFE8C D48B848F */  lw          $4, -0x742C($28)
/* 014190 01DBFE90 5000A527 */  addiu       $5, $29, 0x50
/* 014194 01DBFE94 108B8627 */  addiu       $6, $28, -0x74F0
/* 014198 01DBFE98 148B8727 */  addiu       $7, $28, -0x74EC
/* 01419C 01DBFE9C 2846C070 */  paddub      $8, $6, $0
/* 0141A0 01DBFEA0 284EE070 */  paddub      $9, $7, $0
/* 0141A4 01DBFEA4 4878050C */  jal         set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
/* 0141A8 01DBFEA8 00000000 */   nop
.L01DBFEAC_2FB4AC:
/* 0141AC 01DBFEAC 2000BF7B */  lq          $31, 0x20($29)
/* 0141B0 01DBFEB0 1000B17B */  lq          $17, 0x10($29)
/* 0141B4 01DBFEB4 0000B07B */  lq          $16, 0x0($29)
/* 0141B8 01DBFEB8 6000BD27 */  addiu       $29, $29, 0x60
/* 0141BC 01DBFEBC 0800E003 */  jr          $31
/* 0141C0 01DBFEC0 00000000 */   nop
/* 0141C4 01DBFEC4 00000000 */  nop
/* 0141C8 01DBFEC8 00000000 */  nop
/* 0141CC 01DBFECC 00000000 */  nop
