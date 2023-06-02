.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GOTO_FISHING__FP12RS_STACKDATAi
/* 96C30 00196B30 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 96C34 00196B34 1000BF7F */  sq         $31, 0x10($sp)
/* 96C38 00196B38 0000B07F */  sq         $16, 0x0($sp)
/* 96C3C 00196B3C FFFF0424 */  addiu      $4, $0, -0x1
/* 96C40 00196B40 842C060C */  jal        GetChara__Fi
/* 96C44 00196B44 00000000 */   nop
/* 96C48 00196B48 28864070 */  paddub     $16, $2, $0
/* 96C4C 00196B4C 04000016 */  bnez       $16, .L00196B60
/* 96C50 00196B50 00000000 */   nop
/* 96C54 00196B54 28160070 */  paddub     $2, $0, $0
/* 96C58 00196B58 22000010 */  b          .L00196BE4
/* 96C5C 00196B5C 00000000 */   nop
.L00196B60:
/* 96C60 00196B60 28260072 */  paddub     $4, $16, $0
/* 96C64 00196B64 2000A527 */  addiu      $5, $sp, 0x20
/* 96C68 00196B68 A000198E */  lw         $25, 0xA0($16)
/* 96C6C 00196B6C A000398F */  lw         $25, 0xA0($25)
/* 96C70 00196B70 09F82003 */  jalr       $25
/* 96C74 00196B74 00000000 */   nop
/* 96C78 00196B78 BC00028E */  lw         $2, 0xBC($16)
/* 96C7C 00196B7C 15004010 */  beqz       $2, .L00196BD4
/* 96C80 00196B80 00000000 */   nop
/* 96C84 00196B84 2700023C */  lui        $2, %hi(_2242)
/* 96C88 00196B88 409C4224 */  addiu      $2, $2, %lo(_2242)
/* 96C8C 00196B8C 3000A327 */  addiu      $3, $sp, 0x30
/* 96C90 00196B90 00004278 */  lq         $2, 0x0($2)
/* 96C94 00196B94 0000627C */  sq         $2, 0x0($3)
/* 96C98 00196B98 BC00048E */  lw         $4, 0xBC($16)
/* 96C9C 00196B9C 2A00023C */  lui        $2, %hi(_2246)
/* 96CA0 00196BA0 30B14524 */  addiu      $5, $2, %lo(_2246)
/* 96CA4 00196BA4 C0A1040C */  jal        SearchFrame__6CFrameFPc
/* 96CA8 00196BA8 00000000 */   nop
/* 96CAC 00196BAC 06004010 */  beqz       $2, .L00196BC8
/* 96CB0 00196BB0 00000000 */   nop
/* 96CB4 00196BB4 28264070 */  paddub     $4, $2, $0
/* 96CB8 00196BB8 2000A527 */  addiu      $5, $sp, 0x20
/* 96CBC 00196BBC 3000A627 */  addiu      $6, $sp, 0x30
/* 96CC0 00196BC0 58A3040C */  jal        GetWorldPosition__6CFrameFPfPf
/* 96CC4 00196BC4 00000000 */   nop
.L00196BC8:
/* 96CC8 00196BC8 2000A427 */  addiu      $4, $sp, 0x20
/* 96CCC 00196BCC FCA6060C */  jal        FishLineInit__FPf
/* 96CD0 00196BD0 00000000 */   nop
.L00196BD4:
/* 96CD4 00196BD4 0B000224 */  addiu      $2, $0, 0xB
/* 96CD8 00196BD8 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 96CDC 00196BDC 18D622AC */  sw         $2, -0x29E8($at)
/* 96CE0 00196BE0 01000224 */  addiu      $2, $0, 0x1
.L00196BE4:
/* 96CE4 00196BE4 1000BF7B */  lq         $31, 0x10($sp)
/* 96CE8 00196BE8 0000B07B */  lq         $16, 0x0($sp)
/* 96CEC 00196BEC 4000BD27 */  addiu      $sp, $sp, 0x40
/* 96CF0 00196BF0 0800E003 */  jr         $31
/* 96CF4 00196BF4 00000000 */   nop
/* 96CF8 00196BF8 00000000 */  nop
/* 96CFC 00196BFC 00000000 */  nop
