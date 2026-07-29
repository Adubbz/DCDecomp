.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel InitWorkBuffer__Fv
/* 077F20 00177E20 D201013C */  lui         $1, %hi(EdNPCBuffer + 0x8)
/* 077F24 00177E24 58B3258C */  lw          $5, %lo(EdNPCBuffer + 0x8)($1)
/* 077F28 00177E28 00210500 */  sll         $4, $5, 4
/* 077F2C 00177E2C D201013C */  lui         $1, %hi(EdNPCBuffer)
/* 077F30 00177E30 50B3238C */  lw          $3, %lo(EdNPCBuffer)($1)
/* 077F34 00177E34 21206400 */  addu        $4, $3, $4
/* 077F38 00177E38 D201013C */  lui         $1, %hi(EdNPCBuffer + 0xC)
/* 077F3C 00177E3C 5CB3238C */  lw          $3, %lo(EdNPCBuffer + 0xC)($1)
/* 077F40 00177E40 23286500 */  subu        $5, $3, $5
/* 077F44 00177E44 D201013C */  lui         $1, %hi(EdVillagerBuffer)
/* 077F48 00177E48 60B324AC */  sw          $4, %lo(EdVillagerBuffer)($1)
/* 077F4C 00177E4C D201013C */  lui         $1, %hi(EdVillagerBuffer + 0xC)
/* 077F50 00177E50 6CB325AC */  sw          $5, %lo(EdVillagerBuffer + 0xC)($1)
/* 077F54 00177E54 D201013C */  lui         $1, %hi(EdVillagerBuffer + 0x8)
/* 077F58 00177E58 68B320AC */  sw          $0, %lo(EdVillagerBuffer + 0x8)($1)
/* 077F5C 00177E5C 83190400 */  sra         $3, $4, 6
/* 077F60 00177E60 01006324 */  addiu       $3, $3, 0x1
/* 077F64 00177E64 80210300 */  sll         $4, $3, 6
/* 077F68 00177E68 D201013C */  lui         $1, %hi(EdWorkBuffer)
/* 077F6C 00177E6C C0B324AC */  sw          $4, %lo(EdWorkBuffer)($1)
/* 077F70 00177E70 FCFFA324 */  addiu       $3, $5, -0x4
/* 077F74 00177E74 D201013C */  lui         $1, %hi(EdWorkBuffer + 0xC)
/* 077F78 00177E78 CCB323AC */  sw          $3, %lo(EdWorkBuffer + 0xC)($1)
/* 077F7C 00177E7C D201013C */  lui         $1, %hi(EdWorkBuffer + 0x8)
/* 077F80 00177E80 C8B320AC */  sw          $0, %lo(EdWorkBuffer + 0x8)($1)
/* 077F84 00177E84 948B848F */  lw          $4, -0x746C($28)
/* 077F88 00177E88 E8FF013C */  lui         $1, (0xFFE80000 >> 16)
/* 077F8C 00177E8C 21188100 */  addu        $3, $4, $1
/* 077F90 00177E90 D201013C */  lui         $1, %hi(EdMenuBuffer)
/* 077F94 00177E94 D0B323AC */  sw          $3, %lo(EdMenuBuffer)($1)
/* 077F98 00177E98 0300033C */  lui         $3, (0x3A2E0 >> 16)
/* 077F9C 00177E9C E0A26334 */  ori         $3, $3, (0x3A2E0 & 0xFFFF)
/* 077FA0 00177EA0 D201013C */  lui         $1, %hi(EdMenuBuffer + 0xC)
/* 077FA4 00177EA4 DCB323AC */  sw          $3, %lo(EdMenuBuffer + 0xC)($1)
/* 077FA8 00177EA8 D201013C */  lui         $1, %hi(EdMenuBuffer + 0x8)
/* 077FAC 00177EAC D8B320AC */  sw          $0, %lo(EdMenuBuffer + 0x8)($1)
/* 077FB0 00177EB0 0800E003 */  jr          $31
/* 077FB4 00177EB4 00000000 */   nop
/* 077FB8 00177EB8 00000000 */  nop
/* 077FBC 00177EBC 00000000 */  nop
