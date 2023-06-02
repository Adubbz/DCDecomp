.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearSeq__10CActionSeqFv
/* 54CC0 00154BC0 CC0080AC */  sw         $0, 0xCC($4)
/* 54CC4 00154BC4 040080AC */  sw         $0, 0x4($4)
/* 54CC8 00154BC8 000080AC */  sw         $0, 0x0($4)
/* 54CCC 00154BCC 400080AC */  sw         $0, 0x40($4)
/* 54CD0 00154BD0 480080AC */  sw         $0, 0x48($4)
/* 54CD4 00154BD4 4C0080AC */  sw         $0, 0x4C($4)
/* 54CD8 00154BD8 840080AC */  sw         $0, 0x84($4)
/* 54CDC 00154BDC 800080AC */  sw         $0, 0x80($4)
/* 54CE0 00154BE0 B00080AC */  sw         $0, 0xB0($4)
/* 54CE4 00154BE4 B80080AC */  sw         $0, 0xB8($4)
/* 54CE8 00154BE8 B40080AC */  sw         $0, 0xB4($4)
/* 54CEC 00154BEC C00080AC */  sw         $0, 0xC0($4)
/* 54CF0 00154BF0 BC0080AC */  sw         $0, 0xBC($4)
/* 54CF4 00154BF4 500080AC */  sw         $0, 0x50($4)
/* 54CF8 00154BF8 440080AC */  sw         $0, 0x44($4)
/* 54CFC 00154BFC 540080AC */  sw         $0, 0x54($4)
/* 54D00 00154C00 580080AC */  sw         $0, 0x58($4)
/* 54D04 00154C04 5C0080AC */  sw         $0, 0x5C($4)
/* 54D08 00154C08 600080AC */  sw         $0, 0x60($4)
/* 54D0C 00154C0C 0800E003 */  jr         $31
/* 54D10 00154C10 00000000 */   nop
/* 54D14 00154C14 00000000 */  nop
/* 54D18 00154C18 00000000 */  nop
/* 54D1C 00154C1C 00000000 */  nop
