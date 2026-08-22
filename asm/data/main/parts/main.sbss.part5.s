.include "macro.inc"

.include "macro.inc"

.section .sbss, "wa"
glabel errFlag2
    /* 002A2BF8 */ .space 0x04

glabel argLevel__2
    /* 002A2BFC */ .space 0x04

glabel teigiFileSize__2
    /* 002A2C00 */ .space 0x04

glabel nowPartsCnt__2
    /* 002A2C04 */ .space 0x04

glabel FrameObjAnimCnt
    /* 002A2C08 */ .space 0x04

glabel filePathNum
    /* 002A2C0C */ .space 0x04

glabel filePathColNum
    /* 002A2C10 */ .space 0x04

glabel VERSION_VOL
    /* 002A2C14 */ .space 0x04

glabel BtGetTreasurebox_Sled
    /* 002A2C18 */ .space 0x04

glabel BtGetAtraBoll_Sled
    /* 002A2C1C */ .space 0x04

glabel TreasureboxBig_itemNo
    /* 002A2C20 */ .space 0x04

glabel TreasureboxBig_itemType
    /* 002A2C24 */ .space 0x04

glabel TreasureboxBig_itemScale
    /* 002A2C28 */ .space 0x04

glabel BtGetTreasureboxSmall_itemNo
    /* 002A2C2C */ .space 0x04

glabel BtGetTreasureboxSmall_itemVolume
    /* 002A2C30 */ .space 0x04

glabel BtAtraGetID
    /* 002A2C34 */ .space 0x04

glabel BtAtraGetNo
    /* 002A2C38 */ .space 0x04

glabel BtMiniChrSelecter_Sled
    /* 002A2C3C */ .space 0x04

glabel BtMiniChrSel_Type
    /* 002A2C40 */ .space 0x04

glabel BtMiniChrSelectNo
    /* 002A2C44 */ .space 0x04

glabel frameWait$907
    /* 002A2C48 */ .space 0x04

glabel BtMiniItemSelect_Sled
    /* 002A2C4C */ .space 0x04

glabel GateKey_itemNo
    /* 002A2C50 */ .space 0x04

glabel GateKey_Sled
    /* 002A2C54 */ .space 0x04

glabel gateItemFlag
    /* 002A2C58 */ .space 0x04

glabel escape_chr
    /* 002A2C5C */ .space 0x04

glabel escape_sled
    /* 002A2C60 */ .space 0x04

glabel hitCnt
    /* 002A2C64 */ .space 0x04

glabel cnt$1192
    /* 002A2C68 */ .space 0x04

glabel init$1193
    /* 002A2C6C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2C6D
    /* 002A2C6D */ .space 0x03

glabel bak_ColNo
    /* 002A2C70 */ .space 0x04

glabel ShopUserStatusPt
    /* 002A2C74 */ .space 0x04

glabel ShopBoard
    /* 002A2C78 */ .space 0x04

glabel ShopStockPt
    /* 002A2C7C */ .space 0x04

glabel ShopBoardInfo
    /* 002A2C80 */ .space 0x04

glabel ItemBoardInfo
    /* 002A2C84 */ .space 0x04

glabel WeaponBoardInfo
    /* 002A2C88 */ .space 0x04

glabel AttachBoardInfo
    /* 002A2C8C */ .space 0x04

glabel ShopListPt
    /* 002A2C90 */ .space 0x04

glabel ShopWorkBuf
    /* 002A2C94 */ .space 0x04

glabel ShopHelpWinPos
    /* 002A2C98 */ .space 0x08

glabel ShopHelpWinH
    /* 002A2CA0 */ .space 0x04

glabel ShopHelpWinW
    /* 002A2CA4 */ .space 0x04

glabel ShopHaveItemPt
    /* 002A2CA8 */ .space 0x04

glabel ShopHaveWepPt
    /* 002A2CAC */ .space 0x04

glabel ShopHaveAttachPt
    /* 002A2CB0 */ .space 0x04

glabel ChargeOrShopFlag
    /* 002A2CB4 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2CB6
    /* 002A2CB6 */ .space 0x02

glabel FishMenuTex
    /* 002A2CB8 */ .space 0x04

glabel MenuMapJumpMode
    /* 002A2CBC */ .space 0x04

glabel BtlMenuSaveDataPt
    /* 002A2CC0 */ .space 0x04

glabel BtlMenuStatusPt
    /* 002A2CC4 */ .space 0x04

glabel BtlMenuMode
    /* 002A2CC8 */ .space 0x04

glabel BtlMenuBGMvol
    /* 002A2CCC */ .space 0x04

glabel BtlMenuReadBlock
    /* 002A2CD0 */ .space 0x04

glabel BtlMenuReadBuf
    /* 002A2CD4 */ .space 0x04

glabel BtlMenuReadEndFlag
    /* 002A2CD8 */ .space 0x04

glabel ItemMenuWeaponIconReadBlock
    /* 002A2CDC */ .space 0x04

glabel ItemMenuAlreadyReadWepIconTexFlag
    /* 002A2CE0 */ .space 0x04

glabel MenuShadowReadBlock
    /* 002A2CE4 */ .space 0x04

glabel BtlMenuExReadBlock
    /* 002A2CE8 */ .space 0x04

glabel BtlMenuExReadFlag
    /* 002A2CEC */ .space 0x04

glabel MenuExtendReadBlock
    /* 002A2CF0 */ .space 0x04

glabel MenuExTextureReadFlag
    /* 002A2CF4 */ .space 0x04

glabel ItemMenuCharaReadBuf
    /* 002A2CF8 */ .space 0x04

glabel BtlMDSBuildCnt
    /* 002A2CFC */ .space 0x04

glabel BtlMenuManualReadBlock
    /* 002A2D00 */ .space 0x04

glabel DngWepHavePt
    /* 002A2D04 */ .space 0x04

glabel WepMenuEffectReadBuf
    /* 002A2D08 */ .space 0x04

glabel CharaStatus
    /* 002A2D0C */ .space 0x04

glabel MenuCharaFace
    /* 002A2D10 */ .space 0x04

glabel NonCharaFace
    /* 002A2D14 */ .space 0x04

glabel BtStatus
    /* 002A2D18 */ .space 0x04

glabel WepStatus
    /* 002A2D1C */ .space 0x04

glabel BtlAlpha
    /* 002A2D20 */ .space 0x04

glabel BtlHira
    /* 002A2D24 */ .space 0x04

glabel BtlKata
    /* 002A2D28 */ .space 0x04

/* Automatically generated and unreferenced pad */
glabel D_002A2D2C
    /* 002A2D2C */ .space 0x04

glabel HelpWinHead
    /* 002A2D30 */ .space 0x08

glabel BtlWakuMake2
    /* 002A2D38 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2D39
    /* 002A2D39 */ .space 0x03

glabel BtlHelpWinAlpha
    /* 002A2D3C */ .space 0x04

glabel BtlHelpWinW
    /* 002A2D40 */ .space 0x04

glabel BtlHelpWinH
    /* 002A2D44 */ .space 0x04

glabel MenuSelect
    /* 002A2D48 */ .space 0x08

glabel MenuItemPackPt
    /* 002A2D50 */ .space 0x04

glabel EscapeDngFlg
    /* 002A2D54 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2D56
    /* 002A2D56 */ .space 0x02

glabel RoomOutFlag
    /* 002A2D58 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2D5A
    /* 002A2D5A */ .space 0x02

glabel MenuCharaMove
    /* 002A2D5C */ .space 0x04

glabel PosAngle
    /* 002A2D60 */ .space 0x04

glabel BtlHaveItemPt
    /* 002A2D64 */ .space 0x04

glabel WepFrameRate
    /* 002A2D68 */ .space 0x04

glabel WeaponPos
    /* 002A2D6C */ .space 0x04

glabel WepPolyPos
    /* 002A2D70 */ .space 0x04

glabel BtlEffectCt
    /* 002A2D74 */ .space 0x04

glabel MenuWarningMsgFlag
    /* 002A2D78 */ .space 0x04

glabel BtlMenuCharaChangeBuf
    /* 002A2D7C */ .space 0x04

glabel warningcnt$1676
    /* 002A2D80 */ .space 0x04

glabel init$1677
    /* 002A2D84 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2D85
    /* 002A2D85 */ .space 0x03

glabel warmcnt$2370
    /* 002A2D88 */ .space 0x04

glabel init$2371
    /* 002A2D8C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2D8D
    /* 002A2D8D */ .space 0x03

glabel levelbrinkcnt$2379
    /* 002A2D90 */ .space 0x04

glabel init$2380
    /* 002A2D94 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2D95
    /* 002A2D95 */ .space 0x03

glabel WeaponMenuSelectKeyLockFlag
    /* 002A2D98 */ .space 0x04

glabel ct$4025
    /* 002A2D9C */ .space 0x04

glabel init$4026
    /* 002A2DA0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2DA1
    /* 002A2DA1 */ .space 0x03

glabel ncnt$4292
    /* 002A2DA4 */ .space 0x04

glabel init$4293
    /* 002A2DA8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2DA9
    /* 002A2DA9 */ .space 0x03

glabel ct$5739
    /* 002A2DAC */ .space 0x04

glabel init$5740
    /* 002A2DB0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2DB1
    /* 002A2DB1 */ .space 0x03

glabel statusCnt$5776
    /* 002A2DB4 */ .space 0x04

glabel init$5777
    /* 002A2DB8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2DB9
    /* 002A2DB9 */ .space 0x03

glabel NextWorldPos
    /* 002A2DBC */ .space 0x04

glabel MapMoveCursor
    /* 002A2DC0 */ .space 0x04

glabel MenuMoveTex
    /* 002A2DC4 */ .space 0x04

glabel MenuItemUseVolume
    /* 002A2DC8 */ .space 0x04

glabel WeaponRead_Buf
    /* 002A2DCC */ .space 0x04

glabel MenuCharaEffectReadFlag
    /* 002A2DD0 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2DD2
    /* 002A2DD2 */ .space 0x02

glabel MenuCharaOldEffect
    /* 002A2DD4 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2DD6
    /* 002A2DD6 */ .space 0x02

glabel WepEffectMenuPt
    /* 002A2DD8 */ .space 0x04

glabel WepEffectMenuReadBuf
    /* 002A2DDC */ .space 0x04

glabel MenuWeaponModelBuildBuffer
    /* 002A2DE0 */ .space 0x04

glabel CharaFileBGReadNo
    /* 002A2DE4 */ .space 0x04

glabel charachangeid
    /* 002A2DE8 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2DEA
    /* 002A2DEA */ .space 0x02

glabel CharaChangeBaseBuf
    /* 002A2DEC */ .space 0x04

glabel menucharReadbuf
    /* 002A2DF0 */ .space 0x04

glabel menud0wepReadBuf
    /* 002A2DF4 */ .space 0x04

glabel menud1wepReadBuf
    /* 002A2DF8 */ .space 0x04

glabel menud2wepReadBuf
    /* 002A2DFC */ .space 0x04

glabel MenuWepIconCharaChangePtr
    /* 002A2E00 */ .space 0x04

glabel MenuVoiceLoadPtr
    /* 002A2E04 */ .space 0x04

glabel CharaNameMes
    /* 002A2E08 */ .space 0x04

glabel DngMenuMes
    /* 002A2E0C */ .space 0x04

glabel CharaNameDrawFlag
    /* 002A2E10 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E12
    /* 002A2E12 */ .space 0x02

glabel CharaNameDrawCase
    /* 002A2E14 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E16
    /* 002A2E16 */ .space 0x02

glabel DngEscapeTex
    /* 002A2E18 */ .space 0x04

glabel DngEscapeBlock
    /* 002A2E1C */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E1E
    /* 002A2E1E */ .space 0x02

glabel DngEscapeEndFlag
    /* 002A2E20 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E22
    /* 002A2E22 */ .space 0x02

glabel Analyze
    /* 002A2E24 */ .space 0x04

glabel AnaBar
    /* 002A2E28 */ .space 0x04

glabel EdMenuTextureReadEndFlag
    /* 002A2E2C */ .space 0x04

glabel EdMenuTextureBlock
    /* 002A2E30 */ .space 0x04

glabel EdMenuWorkBuf
    /* 002A2E34 */ .space 0x04

glabel EdMenuExTextureBlock
    /* 002A2E38 */ .space 0x04

glabel EdMenuExTextureBlock1
    /* 002A2E3C */ .space 0x04

glabel EdMenuExTextureBlock2
    /* 002A2E40 */ .space 0x04

glabel EditSwitch
    /* 002A2E44 */ .space 0x04

glabel EdMenuRGB
    /* 002A2E48 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E4A
    /* 002A2E4A */ .space 0x02

glabel EdEffectCt
    /* 002A2E4C */ .space 0x04

glabel EdMenuHelpWinAlpha
    /* 002A2E50 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E52
    /* 002A2E52 */ .space 0x02

glabel AnalyzeSelect
    /* 002A2E54 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E56
    /* 002A2E56 */ .space 0x02

glabel EdMenuMesNo2
    /* 002A2E58 */ .space 0x04

glabel EdMenuMesMake2
    /* 002A2E5C */ .space 0x04

glabel ButtonAdd
    /* 002A2E60 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E62
    /* 002A2E62 */ .space 0x02

glabel AnalyzeBackBlockCnt
    /* 002A2E64 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E66
    /* 002A2E66 */ .space 0x02

glabel EdMenuEffectFlag
    /* 002A2E68 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E6A
    /* 002A2E6A */ .space 0x02

glabel EdMenuEffectCt
    /* 002A2E6C */ .space 0x04

glabel WindowPos
    /* 002A2E70 */ .space 0x08

glabel EditMenuWinW
    /* 002A2E78 */ .space 0x04

glabel EditMenuWinH
    /* 002A2E7C */ .space 0x04

glabel MakeWin2Flag
    /* 002A2E80 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2E82
    /* 002A2E82 */ .space 0x02

glabel old_format$442
    /* 002A2E84 */ .space 0x04

glabel iconNo$676
    /* 002A2E88 */ .space 0x04

glabel init$677
    /* 002A2E8C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2E8D
    /* 002A2E8D */ .space 0x03

glabel StayTex
    /* 002A2E90 */ .space 0x04

glabel AttachIcon
    /* 002A2E94 */ .space 0x04

glabel ItemIcon
    /* 002A2E98 */ .space 0x04

glabel ItemIcon2
    /* 002A2E9C */ .space 0x04

glabel WepIcon
    /* 002A2EA0 */ .space 0x04

glabel Sozai
    /* 002A2EA4 */ .space 0x04

glabel HoleGray
    /* 002A2EA8 */ .space 0x04

glabel HoleGold
    /* 002A2EAC */ .space 0x04

glabel ObTip
    /* 002A2EB0 */ .space 0x04

glabel ObPerson
    /* 002A2EB4 */ .space 0x04

glabel CompleteTex
    /* 002A2EB8 */ .space 0x04

glabel VillageBar
    /* 002A2EBC */ .space 0x04

glabel VillageName
    /* 002A2EC0 */ .space 0x04

glabel SaveBoard
    /* 002A2EC4 */ .space 0x04

glabel MenuOption
    /* 002A2EC8 */ .space 0x04

glabel CommonMenuAtoraInfo
    /* 002A2ECC */ .space 0x04

glabel GetAtraMsgReadBuf
    /* 002A2ED0 */ .space 0x04

glabel NowTipHavePt
    /* 002A2ED4 */ .space 0x04

glabel AtoraTextureEnterFlag
    /* 002A2ED8 */ .space 0x04

glabel AtoraTextureBaseBlock
    /* 002A2EDC */ .space 0x04

glabel AtoraTextureReadBlock
    /* 002A2EE0 */ .space 0x04

glabel AtoraOffsetBuf
    /* 002A2EE4 */ .space 0x04

glabel CursorVibeCnt
    /* 002A2EE8 */ .space 0x04

glabel MenuWakuCnt$723
    /* 002A2EEC */ .space 0x04

glabel init$724
    /* 002A2EF0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2EF1
    /* 002A2EF1 */ .space 0x03

glabel tipcurCnt$998
    /* 002A2EF4 */ .space 0x04

glabel init$999
    /* 002A2EF8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2EF9
    /* 002A2EF9 */ .space 0x03

glabel AtoraHeyCnt
    /* 002A2EFC */ .space 0x04

glabel CompMsgCt
    /* 002A2F00 */ .space 0x04

glabel OpConfigPt
    /* 002A2F04 */ .space 0x04

glabel OpMenuWakuCnt$2385
    /* 002A2F08 */ .space 0x04

glabel init$2386
    /* 002A2F0C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2F0D
    /* 002A2F0D */ .space 0x03

glabel OptionCurCnt$2388
    /* 002A2F10 */ .space 0x04

glabel init$2389
    /* 002A2F14 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2F15
    /* 002A2F15 */ .space 0x03

glabel ct$2680
    /* 002A2F18 */ .space 0x04

glabel init$2681
    /* 002A2F1C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2F1D
    /* 002A2F1D */ .space 0x03

glabel EventBoardPos
    /* 002A2F20 */ .space 0x08

glabel EventItemMoveY
    /* 002A2F28 */ .space 0x04

glabel EventBarY
    /* 002A2F2C */ .space 0x04

glabel MiniEventBoard
    /* 002A2F30 */ .space 0x04

glabel FishFoodBoard
    /* 002A2F34 */ .space 0x04

glabel EventItemPackPt
    /* 002A2F38 */ .space 0x04

glabel MiniEventTextureBlock
    /* 002A2F3C */ .space 0x04

glabel MiniEventTexReadFlag
    /* 002A2F40 */ .space 0x04

/* Automatically generated and unreferenced pad */
glabel D_002A2F44
    /* 002A2F44 */ .space 0x04

glabel MiniCur
    /* 002A2F48 */ .space 0x08

glabel MenuEtcErrCnt
    /* 002A2F50 */ .space 0x04

glabel DunLogBoard
    /* 002A2F54 */ .space 0x04

glabel DunLogBoard2
    /* 002A2F58 */ .space 0x04

glabel DEnterStatusPt
    /* 002A2F5C */ .space 0x04

glabel DunWakuCnt$865
    /* 002A2F60 */ .space 0x04

glabel init$866
    /* 002A2F64 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2F65
    /* 002A2F65 */ .space 0x03

glabel QuickCharaPos
    /* 002A2F68 */ .space 0x08

glabel CharaChangeTexBlock
    /* 002A2F70 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2F72
    /* 002A2F72 */ .space 0x02

glabel CharaChangeReadFlag
    /* 002A2F74 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2F76
    /* 002A2F76 */ .space 0x02

glabel chara_change_buf
    /* 002A2F78 */ .space 0x04

glabel QuickCharaTex
    /* 002A2F7C */ .space 0x04

glabel ChangeStatusDataPt
    /* 002A2F80 */ .space 0x04

glabel ItemPolyView
    /* 002A2F84 */ .space 0x04

glabel MDebugItemPolyViewFlag
    /* 002A2F88 */ .space 0x04

glabel polyreadflag
    /* 002A2F8C */ .space 0x04

glabel PerBoardStatusPt
    /* 002A2F90 */ .space 0x04

glabel PerBoardTex
    /* 002A2F94 */ .space 0x04

glabel PerBoardPt
    /* 002A2F98 */ .space 0x04

glabel ManualMsg
    /* 002A2F9C */ .space 0x04

glabel PrevEastKingSndNo
    /* 002A2FA0 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2FA2
    /* 002A2FA2 */ .space 0x02

glabel PrevEastKingSndVol
    /* 002A2FA4 */ .space 0x02

/* Automatically generated and unreferenced pad */
glabel D_002A2FA6
    /* 002A2FA6 */ .space 0x02

glabel EastKingSndReadBuf
    /* 002A2FA8 */ .space 0x04

glabel CharaName
    /* 002A2FAC */ .space 0x04

glabel CharaFace
    /* 002A2FB0 */ .space 0x04

glabel NameTemp
    /* 002A2FB4 */ .space 0x04

glabel HiraTex
    /* 002A2FB8 */ .space 0x04

glabel KataTex
    /* 002A2FBC */ .space 0x04

glabel AlphaTex
    /* 002A2FC0 */ .space 0x04

glabel up_or_down$942
    /* 002A2FC4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2FC5
    /* 002A2FC5 */ .space 0x03

glabel init$943
    /* 002A2FC8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2FC9
    /* 002A2FC9 */ .space 0x03

glabel OpeningReadBuf
    /* 002A2FCC */ .space 0x04
