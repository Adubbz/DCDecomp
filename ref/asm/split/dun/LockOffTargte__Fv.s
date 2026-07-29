.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel LockOffTargte__Fv
/* 013FE0 01DBFCE0 909D80AF */  sw          $0, -0x6270($28)
/* 013FE4 01DBFCE4 FFFF0324 */  addiu       $3, $0, -0x1
/* 013FE8 01DBFCE8 949D83AF */  sw          $3, -0x626C($28)
/* 013FEC 01DBFCEC 989D80AF */  sw          $0, -0x6268($28)
/* 013FF0 01DBFCF0 9C9D83AF */  sw          $3, -0x6264($28)
/* 013FF4 01DBFCF4 A09D80AF */  sw          $0, -0x6260($28)
/* 013FF8 01DBFCF8 E601013C */  lui         $1, %hi(EnemyLifeGage + 0x10)
/* 013FFC 01DBFCFC 308F20AC */  sw          $0, %lo(EnemyLifeGage + 0x10)($1)
/* 014000 01DBFD00 0800E003 */  jr          $31
/* 014004 01DBFD04 00000000 */   nop
/* 014008 01DBFD08 00000000 */  nop
/* 01400C 01DBFD0C 00000000 */  nop
