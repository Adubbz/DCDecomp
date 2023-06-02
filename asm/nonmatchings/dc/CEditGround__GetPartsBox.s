.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPartsBox__11CEditGroundFP7CBoxVu0fff
/* A2D80 001A2C80 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A2D84 001A2C84 2000BF7F */  sq         $31, 0x20($sp)
/* A2D88 001A2C88 1000B17F */  sq         $17, 0x10($sp)
/* A2D8C 001A2C8C 0000B07F */  sq         $16, 0x0($sp)
/* A2D90 001A2C90 288E8070 */  paddub     $17, $4, $0
/* A2D94 001A2C94 2886A070 */  paddub     $16, $5, $0
/* A2D98 001A2C98 AC85060C */  jal        GetAreaCode__11CEditGroundFfff
/* A2D9C 001A2C9C 00000000 */   nop
/* A2DA0 001A2CA0 0C004104 */  bgez       $2, .L001A2CD4
/* A2DA4 001A2CA4 00000000 */   nop
/* A2DA8 001A2CA8 080000AE */  sw         $0, 0x8($16)
/* A2DAC 001A2CAC 040000AE */  sw         $0, 0x4($16)
/* A2DB0 001A2CB0 000000AE */  sw         $0, 0x0($16)
/* A2DB4 001A2CB4 803F033C */  lui        $3, (0x3F800000 >> 16)
/* A2DB8 001A2CB8 0C0003AE */  sw         $3, 0xC($16)
/* A2DBC 001A2CBC 180000AE */  sw         $0, 0x18($16)
/* A2DC0 001A2CC0 140000AE */  sw         $0, 0x14($16)
/* A2DC4 001A2CC4 100000AE */  sw         $0, 0x10($16)
/* A2DC8 001A2CC8 1C0003AE */  sw         $3, 0x1C($16)
/* A2DCC 001A2CCC 09000010 */  b          .L001A2CF4
/* A2DD0 001A2CD0 00000000 */   nop
.L001A2CD4:
/* A2DD4 001A2CD4 80180200 */  sll        $3, $2, 2
/* A2DD8 001A2CD8 21187100 */  addu       $3, $3, $17
/* A2DDC 001A2CDC 0400648C */  lw         $4, 0x4($3)
/* A2DE0 001A2CE0 04008010 */  beqz       $4, .L001A2CF4
/* A2DE4 001A2CE4 00000000 */   nop
/* A2DE8 001A2CE8 282E0072 */  paddub     $5, $16, $0
/* A2DEC 001A2CEC B4BB050C */  jal        GetPartsBox__9CEditAreaFP7CBoxVu0
/* A2DF0 001A2CF0 00000000 */   nop
.L001A2CF4:
/* A2DF4 001A2CF4 2000BF7B */  lq         $31, 0x20($sp)
/* A2DF8 001A2CF8 1000B17B */  lq         $17, 0x10($sp)
/* A2DFC 001A2CFC 0000B07B */  lq         $16, 0x0($sp)
/* A2E00 001A2D00 3000BD27 */  addiu      $sp, $sp, 0x30
/* A2E04 001A2D04 0800E003 */  jr         $31
/* A2E08 001A2D08 00000000 */   nop
/* A2E0C 001A2D0C 00000000 */  nop
