.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BtGetAttach_Loop__Fv
/* D3C00 001D3B00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D3C04 001D3B04 1000BF7F */  sq         $31, 0x10($sp)
/* D3C08 001D3B08 0000B07F */  sq         $16, 0x0($sp)
/* D3C0C 001D3B0C 28860070 */  paddub     $16, $0, $0
/* D3C10 001D3B10 6494838F */  lw         $3, -0x6B9C($gp)
/* D3C14 001D3B14 01000224 */  addiu      $2, $0, 0x1
/* D3C18 001D3B18 17006210 */  beq        $3, $2, .L001D3B78
/* D3C1C 001D3B1C 00000000 */   nop
/* D3C20 001D3B20 03006010 */  beqz       $3, .L001D3B30
/* D3C24 001D3B24 00000000 */   nop
/* D3C28 001D3B28 2B000010 */  b          .L001D3BD8
/* D3C2C 001D3B2C 00000000 */   nop
.L001D3B30:
/* D3C30 001D3B30 28260070 */  paddub     $4, $0, $0
/* D3C34 001D3B34 B004770C */  jal        func_1DC12C0
/* D3C38 001D3B38 00000000 */   nop
/* D3C3C 001D3B3C FFFF0224 */  addiu      $2, $0, -0x1
/* D3C40 001D3B40 B49D82AF */  sw         $2, -0x624C($gp)
/* D3C44 001D3B44 01000724 */  addiu      $7, $0, 0x1
/* D3C48 001D3B48 EC9C87AF */  sw         $7, -0x6314($gp)
/* D3C4C 001D3B4C E49C87AF */  sw         $7, -0x631C($gp)
/* D3C50 001D3B50 3C94848F */  lw         $4, -0x6BC4($gp)
/* D3C54 001D3B54 4094858F */  lw         $5, -0x6BC0($gp)
/* D3C58 001D3B58 28000624 */  addiu      $6, $0, 0x28
/* D3C5C 001D3B5C A480050C */  jal        ItemGetMes__Fiiii
/* D3C60 001D3B60 00000000 */   nop
/* D3C64 001D3B64 6494828F */  lw         $2, -0x6B9C($gp)
/* D3C68 001D3B68 01004224 */  addiu      $2, $2, 0x1
/* D3C6C 001D3B6C 649482AF */  sw         $2, -0x6B9C($gp)
/* D3C70 001D3B70 19000010 */  b          .L001D3BD8
/* D3C74 001D3B74 00000000 */   nop
.L001D3B78:
/* D3C78 001D3B78 CC01023C */  lui        $2, %hi(GamePad)
/* D3C7C 001D3B7C 40C54424 */  addiu      $4, $2, %lo(GamePad)
/* D3C80 001D3B80 60000524 */  addiu      $5, $0, 0x60
/* D3C84 001D3B84 1CAE040C */  jal        Down__8CGamePadFi
/* D3C88 001D3B88 00000000 */   nop
/* D3C8C 001D3B8C 12004010 */  beqz       $2, .L001D3BD8
/* D3C90 001D3B90 00000000 */   nop
/* D3C94 001D3B94 01000424 */  addiu      $4, $0, 0x1
/* D3C98 001D3B98 EA01013C */  lui        $at, (0x1EA7690 >> 16)
/* D3C9C 001D3B9C 907624AC */  sw         $4, (0x1EA7690 & 0xFFFF)($at)
/* D3CA0 001D3BA0 789C828F */  lw         $2, -0x6388($gp)
/* D3CA4 001D3BA4 0100013C */  lui        $at, (0x10000 >> 16)
/* D3CA8 001D3BA8 21084100 */  addu       $at, $2, $at
/* D3CAC 001D3BAC 0C8B20AC */  sw         $0, -0x74F4($at)
/* D3CB0 001D3BB0 B004770C */  jal        func_1DC12C0
/* D3CB4 001D3BB4 00000000 */   nop
/* D3CB8 001D3BB8 EC9C80AF */  sw         $0, -0x6314($gp)
/* D3CBC 001D3BBC E49C80AF */  sw         $0, -0x631C($gp)
/* D3CC0 001D3BC0 689480AF */  sw         $0, -0x6B98($gp)
/* D3CC4 001D3BC4 DC01013C */  lui        $at, (0x1DC451C >> 16)
/* D3CC8 001D3BC8 1C4520AC */  sw         $0, (0x1DC451C & 0xFFFF)($at)
/* D3CCC 001D3BCC 3480050C */  jal        ClearSystemMes__Fv
/* D3CD0 001D3BD0 00000000 */   nop
/* D3CD4 001D3BD4 01001024 */  addiu      $16, $0, 0x1
.L001D3BD8:
/* D3CD8 001D3BD8 28160072 */  paddub     $2, $16, $0
/* D3CDC 001D3BDC 1000BF7B */  lq         $31, 0x10($sp)
/* D3CE0 001D3BE0 0000B07B */  lq         $16, 0x0($sp)
/* D3CE4 001D3BE4 2000BD27 */  addiu      $sp, $sp, 0x20
/* D3CE8 001D3BE8 0800E003 */  jr         $31
/* D3CEC 001D3BEC 00000000 */   nop
