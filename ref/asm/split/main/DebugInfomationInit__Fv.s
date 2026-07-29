.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel DebugInfomationInit__Fv
/* 0B47F0 001B46F0 D501013C */  lui         $1, %hi(DebugStatus)
/* 0B47F4 001B46F4 606420AC */  sw          $0, %lo(DebugStatus)($1)
/* 0B47F8 001B46F8 D501013C */  lui         $1, %hi(DebugStatus + 0x4)
/* 0B47FC 001B46FC 646420AC */  sw          $0, %lo(DebugStatus + 0x4)($1)
/* 0B4800 001B4700 D501013C */  lui         $1, %hi(DebugStatus + 0x8)
/* 0B4804 001B4704 686420AC */  sw          $0, %lo(DebugStatus + 0x8)($1)
/* 0B4808 001B4708 D501013C */  lui         $1, %hi(DebugStatus + 0xC)
/* 0B480C 001B470C 6C6420AC */  sw          $0, %lo(DebugStatus + 0xC)($1)
/* 0B4810 001B4710 01000424 */  addiu       $4, $0, 0x1
/* 0B4814 001B4714 D501013C */  lui         $1, %hi(DebugStatus + 0x14)
/* 0B4818 001B4718 746424AC */  sw          $4, %lo(DebugStatus + 0x14)($1)
/* 0B481C 001B471C D501013C */  lui         $1, %hi(DebugStatus + 0x18)
/* 0B4820 001B4720 786420AC */  sw          $0, %lo(DebugStatus + 0x18)($1)
/* 0B4824 001B4724 D501013C */  lui         $1, %hi(DebugStatus + 0x10)
/* 0B4828 001B4728 706420AC */  sw          $0, %lo(DebugStatus + 0x10)($1)
/* 0B482C 001B472C D501013C */  lui         $1, %hi(DebugStatus + 0x1C)
/* 0B4830 001B4730 7C6420AC */  sw          $0, %lo(DebugStatus + 0x1C)($1)
/* 0B4834 001B4734 96000324 */  addiu       $3, $0, 0x96
/* 0B4838 001B4738 D501013C */  lui         $1, %hi(DebugStatus + 0x20)
/* 0B483C 001B473C 806423AC */  sw          $3, %lo(DebugStatus + 0x20)($1)
/* 0B4840 001B4740 FFFF0324 */  addiu       $3, $0, -0x1
/* 0B4844 001B4744 D501013C */  lui         $1, %hi(DebugStatus + 0x24)
/* 0B4848 001B4748 846423AC */  sw          $3, %lo(DebugStatus + 0x24)($1)
/* 0B484C 001B474C D501013C */  lui         $1, %hi(DebugStatus + 0x28)
/* 0B4850 001B4750 886420AC */  sw          $0, %lo(DebugStatus + 0x28)($1)
/* 0B4854 001B4754 64000324 */  addiu       $3, $0, 0x64
/* 0B4858 001B4758 D501013C */  lui         $1, %hi(DebugStatus + 0x2C)
/* 0B485C 001B475C 8C6423AC */  sw          $3, %lo(DebugStatus + 0x2C)($1)
/* 0B4860 001B4760 D501013C */  lui         $1, %hi(DebugStatus + 0x30)
/* 0B4864 001B4764 906420AC */  sw          $0, %lo(DebugStatus + 0x30)($1)
/* 0B4868 001B4768 10000324 */  addiu       $3, $0, 0x10
/* 0B486C 001B476C D501013C */  lui         $1, %hi(DebugStatus + 0x34)
/* 0B4870 001B4770 946423AC */  sw          $3, %lo(DebugStatus + 0x34)($1)
/* 0B4874 001B4774 D501013C */  lui         $1, %hi(DebugStatus + 0x38)
/* 0B4878 001B4778 986420AC */  sw          $0, %lo(DebugStatus + 0x38)($1)
/* 0B487C 001B477C D501013C */  lui         $1, %hi(DebugStatus + 0x3C)
/* 0B4880 001B4780 9C6423AC */  sw          $3, %lo(DebugStatus + 0x3C)($1)
/* 0B4884 001B4784 D501013C */  lui         $1, %hi(DebugStatus + 0x40)
/* 0B4888 001B4788 A06420AC */  sw          $0, %lo(DebugStatus + 0x40)($1)
/* 0B488C 001B478C D501013C */  lui         $1, %hi(DebugStatus + 0x44)
/* 0B4890 001B4790 A46420AC */  sw          $0, %lo(DebugStatus + 0x44)($1)
/* 0B4894 001B4794 90010324 */  addiu       $3, $0, 0x190
/* 0B4898 001B4798 D501013C */  lui         $1, %hi(DebugStatus + 0x48)
/* 0B489C 001B479C A86423AC */  sw          $3, %lo(DebugStatus + 0x48)($1)
/* 0B48A0 001B47A0 D501013C */  lui         $1, %hi(DebugStatus + 0x4C)
/* 0B48A4 001B47A4 AC6424AC */  sw          $4, %lo(DebugStatus + 0x4C)($1)
/* 0B48A8 001B47A8 D501013C */  lui         $1, %hi(DebugStatus + 0x50)
/* 0B48AC 001B47AC B06420AC */  sw          $0, %lo(DebugStatus + 0x50)($1)
/* 0B48B0 001B47B0 0800E003 */  jr          $31
/* 0B48B4 001B47B4 00000000 */   nop
/* 0B48B8 001B47B8 00000000 */  nop
/* 0B48BC 001B47BC 00000000 */  nop
