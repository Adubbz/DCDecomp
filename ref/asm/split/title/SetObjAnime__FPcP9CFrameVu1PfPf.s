.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetObjAnime__FPcP9CFrameVu1PfPf
/* 01F1C0 01DCAEC0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 01F1C4 01DCAEC4 4000BF7F */  sq          $31, 0x40($29)
/* 01F1C8 01DCAEC8 3000B37F */  sq          $19, 0x30($29)
/* 01F1CC 01DCAECC 2000B27F */  sq          $18, 0x20($29)
/* 01F1D0 01DCAED0 1000B17F */  sq          $17, 0x10($29)
/* 01F1D4 01DCAED4 0000B07F */  sq          $16, 0x0($29)
/* 01F1D8 01DCAED8 289E8070 */  paddub      $19, $4, $0
/* 01F1DC 01DCAEDC 2896A070 */  paddub      $18, $5, $0
/* 01F1E0 01DCAEE0 288EC070 */  paddub      $17, $6, $0
/* 01F1E4 01DCAEE4 2886E070 */  paddub      $16, $7, $0
/* 01F1E8 01DCAEE8 B498838F */  lw          $3, -0x674C($28)
/* 01F1EC 01DCAEEC C0100300 */  sll         $2, $3, 3
/* 01F1F0 01DCAEF0 21104300 */  addu        $2, $2, $3
/* 01F1F4 01DCAEF4 00190200 */  sll         $3, $2, 4
/* 01F1F8 01DCAEF8 E201023C */  lui         $2, %hi(OP_AnimeSeq)
/* 01F1FC 01DCAEFC 20C54224 */  addiu       $2, $2, %lo(OP_AnimeSeq)
/* 01F200 01DCAF00 21204300 */  addu        $4, $2, $3
/* 01F204 01DCAF04 2497050C */  jal         Initialize__13OBJ_ANIME_SEQFv
/* 01F208 01DCAF08 00000000 */   nop
/* 01F20C 01DCAF0C B498838F */  lw          $3, -0x674C($28)
/* 01F210 01DCAF10 C0100300 */  sll         $2, $3, 3
/* 01F214 01DCAF14 21104300 */  addu        $2, $2, $3
/* 01F218 01DCAF18 00110200 */  sll         $2, $2, 4
/* 01F21C 01DCAF1C E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x10)
/* 01F220 01DCAF20 30C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x10)
/* 01F224 01DCAF24 21186200 */  addu        $3, $3, $2
/* 01F228 01DCAF28 000060AC */  sw          $0, 0x0($3)
/* 01F22C 01DCAF2C E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x14)
/* 01F230 01DCAF30 34C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x14)
/* 01F234 01DCAF34 21186200 */  addu        $3, $3, $2
/* 01F238 01DCAF38 000060AC */  sw          $0, 0x0($3)
/* 01F23C 01DCAF3C 000020C6 */  lwc1        $f0, 0x0($17)
/* 01F240 01DCAF40 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x20)
/* 01F244 01DCAF44 40C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x20)
/* 01F248 01DCAF48 21186200 */  addu        $3, $3, $2
/* 01F24C 01DCAF4C 000060E4 */  swc1        $f0, 0x0($3)
/* 01F250 01DCAF50 040020C6 */  lwc1        $f0, 0x4($17)
/* 01F254 01DCAF54 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x24)
/* 01F258 01DCAF58 44C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x24)
/* 01F25C 01DCAF5C 21186200 */  addu        $3, $3, $2
/* 01F260 01DCAF60 000060E4 */  swc1        $f0, 0x0($3)
/* 01F264 01DCAF64 080020C6 */  lwc1        $f0, 0x8($17)
/* 01F268 01DCAF68 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x28)
/* 01F26C 01DCAF6C 48C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x28)
/* 01F270 01DCAF70 21186200 */  addu        $3, $3, $2
/* 01F274 01DCAF74 000060E4 */  swc1        $f0, 0x0($3)
/* 01F278 01DCAF78 000000C6 */  lwc1        $f0, 0x0($16)
/* 01F27C 01DCAF7C E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x40)
/* 01F280 01DCAF80 60C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x40)
/* 01F284 01DCAF84 21186200 */  addu        $3, $3, $2
/* 01F288 01DCAF88 000060E4 */  swc1        $f0, 0x0($3)
/* 01F28C 01DCAF8C 040000C6 */  lwc1        $f0, 0x4($16)
/* 01F290 01DCAF90 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x44)
/* 01F294 01DCAF94 64C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x44)
/* 01F298 01DCAF98 21186200 */  addu        $3, $3, $2
/* 01F29C 01DCAF9C 000060E4 */  swc1        $f0, 0x0($3)
/* 01F2A0 01DCAFA0 080000C6 */  lwc1        $f0, 0x8($16)
/* 01F2A4 01DCAFA4 E201033C */  lui         $3, %hi(OP_AnimeSeq + 0x48)
/* 01F2A8 01DCAFA8 68C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq + 0x48)
/* 01F2AC 01DCAFAC 21186200 */  addu        $3, $3, $2
/* 01F2B0 01DCAFB0 000060E4 */  swc1        $f0, 0x0($3)
/* 01F2B4 01DCAFB4 E201033C */  lui         $3, %hi(OP_AnimeSeq)
/* 01F2B8 01DCAFB8 20C56324 */  addiu       $3, $3, %lo(OP_AnimeSeq)
/* 01F2BC 01DCAFBC 21206200 */  addu        $4, $3, $2
/* 01F2C0 01DCAFC0 282E6072 */  paddub      $5, $19, $0
/* 01F2C4 01DCAFC4 5A15040C */  jal         strcpy
/* 01F2C8 01DCAFC8 00000000 */   nop
/* 01F2CC 01DCAFCC B498838F */  lw          $3, -0x674C($28)
/* 01F2D0 01DCAFD0 C0100300 */  sll         $2, $3, 3
/* 01F2D4 01DCAFD4 21104300 */  addu        $2, $2, $3
/* 01F2D8 01DCAFD8 00190200 */  sll         $3, $2, 4
/* 01F2DC 01DCAFDC E201023C */  lui         $2, %hi(OP_AnimeSeq)
/* 01F2E0 01DCAFE0 20C54224 */  addiu       $2, $2, %lo(OP_AnimeSeq)
/* 01F2E4 01DCAFE4 21284300 */  addu        $5, $2, $3
/* 01F2E8 01DCAFE8 28264072 */  paddub      $4, $18, $0
/* 01F2EC 01DCAFEC 4097050C */  jal         InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* 01F2F0 01DCAFF0 00000000 */   nop
/* 01F2F4 01DCAFF4 B498838F */  lw          $3, -0x674C($28)
/* 01F2F8 01DCAFF8 01006324 */  addiu       $3, $3, 0x1
/* 01F2FC 01DCAFFC B49883AF */  sw          $3, -0x674C($28)
/* 01F300 01DCB000 4000BF7B */  lq          $31, 0x40($29)
/* 01F304 01DCB004 3000B37B */  lq          $19, 0x30($29)
/* 01F308 01DCB008 2000B27B */  lq          $18, 0x20($29)
/* 01F30C 01DCB00C 1000B17B */  lq          $17, 0x10($29)
/* 01F310 01DCB010 0000B07B */  lq          $16, 0x0($29)
/* 01F314 01DCB014 5000BD27 */  addiu       $29, $29, 0x50
/* 01F318 01DCB018 0800E003 */  jr          $31
/* 01F31C 01DCB01C 00000000 */   nop
