.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DebugInfomationInit__Fv
/* B47F0 001B46F0 D501013C */  lui        $at, (0x1D56460 >> 16)
/* B47F4 001B46F4 606420AC */  sw         $0, (0x1D56460 & 0xFFFF)($at)
/* B47F8 001B46F8 D501013C */  lui        $at, (0x1D56464 >> 16)
/* B47FC 001B46FC 646420AC */  sw         $0, (0x1D56464 & 0xFFFF)($at)
/* B4800 001B4700 D501013C */  lui        $at, (0x1D56468 >> 16)
/* B4804 001B4704 686420AC */  sw         $0, (0x1D56468 & 0xFFFF)($at)
/* B4808 001B4708 D501013C */  lui        $at, (0x1D5646C >> 16)
/* B480C 001B470C 6C6420AC */  sw         $0, (0x1D5646C & 0xFFFF)($at)
/* B4810 001B4710 01000424 */  addiu      $4, $0, 0x1
/* B4814 001B4714 D501013C */  lui        $at, (0x1D56474 >> 16)
/* B4818 001B4718 746424AC */  sw         $4, (0x1D56474 & 0xFFFF)($at)
/* B481C 001B471C D501013C */  lui        $at, (0x1D56478 >> 16)
/* B4820 001B4720 786420AC */  sw         $0, (0x1D56478 & 0xFFFF)($at)
/* B4824 001B4724 D501013C */  lui        $at, (0x1D56470 >> 16)
/* B4828 001B4728 706420AC */  sw         $0, (0x1D56470 & 0xFFFF)($at)
/* B482C 001B472C D501013C */  lui        $at, (0x1D5647C >> 16)
/* B4830 001B4730 7C6420AC */  sw         $0, (0x1D5647C & 0xFFFF)($at)
/* B4834 001B4734 96000324 */  addiu      $3, $0, 0x96
/* B4838 001B4738 D501013C */  lui        $at, (0x1D56480 >> 16)
/* B483C 001B473C 806423AC */  sw         $3, (0x1D56480 & 0xFFFF)($at)
/* B4840 001B4740 FFFF0324 */  addiu      $3, $0, -0x1
/* B4844 001B4744 D501013C */  lui        $at, (0x1D56484 >> 16)
/* B4848 001B4748 846423AC */  sw         $3, (0x1D56484 & 0xFFFF)($at)
/* B484C 001B474C D501013C */  lui        $at, (0x1D56488 >> 16)
/* B4850 001B4750 886420AC */  sw         $0, (0x1D56488 & 0xFFFF)($at)
/* B4854 001B4754 64000324 */  addiu      $3, $0, 0x64
/* B4858 001B4758 D501013C */  lui        $at, (0x1D5648C >> 16)
/* B485C 001B475C 8C6423AC */  sw         $3, (0x1D5648C & 0xFFFF)($at)
/* B4860 001B4760 D501013C */  lui        $at, (0x1D56490 >> 16)
/* B4864 001B4764 906420AC */  sw         $0, (0x1D56490 & 0xFFFF)($at)
/* B4868 001B4768 10000324 */  addiu      $3, $0, 0x10
/* B486C 001B476C D501013C */  lui        $at, (0x1D56494 >> 16)
/* B4870 001B4770 946423AC */  sw         $3, (0x1D56494 & 0xFFFF)($at)
/* B4874 001B4774 D501013C */  lui        $at, (0x1D56498 >> 16)
/* B4878 001B4778 986420AC */  sw         $0, (0x1D56498 & 0xFFFF)($at)
/* B487C 001B477C D501013C */  lui        $at, (0x1D5649C >> 16)
/* B4880 001B4780 9C6423AC */  sw         $3, (0x1D5649C & 0xFFFF)($at)
/* B4884 001B4784 D501013C */  lui        $at, (0x1D564A0 >> 16)
/* B4888 001B4788 A06420AC */  sw         $0, (0x1D564A0 & 0xFFFF)($at)
/* B488C 001B478C D501013C */  lui        $at, (0x1D564A4 >> 16)
/* B4890 001B4790 A46420AC */  sw         $0, (0x1D564A4 & 0xFFFF)($at)
/* B4894 001B4794 90010324 */  addiu      $3, $0, 0x190
/* B4898 001B4798 D501013C */  lui        $at, (0x1D564A8 >> 16)
/* B489C 001B479C A86423AC */  sw         $3, (0x1D564A8 & 0xFFFF)($at)
/* B48A0 001B47A0 D501013C */  lui        $at, (0x1D564AC >> 16)
/* B48A4 001B47A4 AC6424AC */  sw         $4, (0x1D564AC & 0xFFFF)($at)
/* B48A8 001B47A8 D501013C */  lui        $at, (0x1D564B0 >> 16)
/* B48AC 001B47AC B06420AC */  sw         $0, (0x1D564B0 & 0xFFFF)($at)
/* B48B0 001B47B0 0800E003 */  jr         $31
/* B48B4 001B47B4 00000000 */   nop
/* B48B8 001B47B8 00000000 */  nop
/* B48BC 001B47BC 00000000 */  nop
