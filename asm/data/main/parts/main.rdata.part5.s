.include "macro.inc"

.include "macro.inc"

.section .rdata, "a"
glabel __vt__6CBound
    /* 1A1480 002A1380 00000000 */ .word 0x00000000
    /* 1A1484 002A1384 00000000 */ .word 0x00000000
    /* 1A1488 002A1388 90DE1300 */ .word Sizeof__6CBoundFv
    /* 1A148C 002A138C 50D21300 */ .word InCheck__6CBoundFPfPf

glabel __vt__6CCloth
    /* 1A1490 002A1390 00000000 */ .word 0x00000000
    /* 1A1494 002A1394 00000000 */ .word 0x00000000
    /* 1A1498 002A1398 C04E1300 */ .word Initialize__10CVisualVu1Fv
    /* 1A149C 002A139C 807E1300 */ .word SetMDTDataAddress__10CVisualVu1FPUi
    /* 1A14A0 002A13A0 907E1300 */ .word GetMDTDataAddress__10CVisualVu1Fv
    /* 1A14A4 002A13A4 B04B1300 */ .word RemakeData__10CVisualVu1FPUi
    /* 1A14A8 002A13A8 70C41300 */ .word DrawVu1__6CClothFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* 1A14AC 002A13AC 30C51300 */ .word DrawVu1__6CClothFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* 1A14B0 002A13B0 F0CB1300 */ .word Initialize__6CClothFP14CDataAlloc2_1_
    /* 1A14B4 002A13B4 50D01300 */ .word Initialize__6CClothFP10MDT_HEADERP14CDataAlloc2_1_
    /* 1A14B8 002A13B8 00000000 */ .word 0x00000000
    /* 1A14BC 002A13BC 00000000 */ .word 0x00000000

glabel __vt__12CNPCharacter
    /* 1A14C0 002A13C0 00000000 */ .word 0x00000000
    /* 1A14C4 002A13C4 00000000 */ .word 0x00000000
    /* 1A14C8 002A13C8 B05F1500 */ .word Step__12CNPCharacterFv
    /* 1A14CC 002A13CC 806C1500 */ .word SetMass__7CObjectFf
    /* 1A14D0 002A13D0 10911300 */ .word SetPosition__10CCharacterF11CVector3_f_
    /* 1A14D4 002A13D4 E0901300 */ .word SetPosition__10CCharacterFPf
    /* 1A14D8 002A13D8 B08F1300 */ .word SetPosition__10CCharacterFfff
    /* 1A14DC 002A13DC F06C1500 */ .word SetVelocity__7CObjectF11CVector3_f_
    /* 1A14E0 002A13E0 206D1500 */ .word SetAcceleration__7CObjectF11CVector3_f_
    /* 1A14E4 002A13E4 506D1500 */ .word SetGravity__7CObjectF11CVector3_f_
    /* 1A14E8 002A13E8 806D1500 */ .word SetMoment__7CObjectF11CVector3_f_
    /* 1A14EC 002A13EC 10921300 */ .word SetRotation__10CCharacterF11CVector3_f_
    /* 1A14F0 002A13F0 50911300 */ .word SetRotation__10CCharacterFfff
    /* 1A14F4 002A13F4 E0911300 */ .word SetRotation__10CCharacterFPf
    /* 1A14F8 002A13F8 206E1500 */ .word SetRotVelocity__7CObjectF11CVector3_f_
    /* 1A14FC 002A13FC 506E1500 */ .word SetRotAcceleration__7CObjectF11CVector3_f_
    /* 1A1500 002A1400 806E1500 */ .word GetMass__7CObjectFv
    /* 1A1504 002A1404 906E1500 */ .word GetPosition__7CObjectFP11CVector3_f_
    /* 1A1508 002A1408 B06E1500 */ .word GetVelocity__7CObjectFP11CVector3_f_
    /* 1A150C 002A140C C06E1500 */ .word GetAcceleration__7CObjectFP11CVector3_f_
    /* 1A1510 002A1410 D06E1500 */ .word GetGravity__7CObjectFP11CVector3_f_
    /* 1A1514 002A1414 E06E1500 */ .word GetMoment__7CObjectFP11CVector3_f_
    /* 1A1518 002A1418 F06E1500 */ .word GetRotation__7CObjectFPf
    /* 1A151C 002A141C 106F1500 */ .word GetRotation__7CObjectFP11CVector3_f_
    /* 1A1520 002A1420 206F1500 */ .word GetRotVelocity__7CObjectFP11CVector3_f_
    /* 1A1524 002A1424 306F1500 */ .word GetRotAcceleration__7CObjectFP11CVector3_f_
    /* 1A1528 002A1428 406F1500 */ .word GetVelocity__7CObjectFv
    /* 1A152C 002A142C 506F1500 */ .word GetAcceleration__7CObjectFv
    /* 1A1530 002A1430 606F1500 */ .word GetGravity__7CObjectFv
    /* 1A1534 002A1434 706F1500 */ .word GetMoment__7CObjectFv
    /* 1A1538 002A1438 806F1500 */ .word GetRotation__7CObjectFv
    /* 1A153C 002A143C 906F1500 */ .word GetRotVelocity__7CObjectFv
    /* 1A1540 002A1440 A06F1500 */ .word GetRotAcceleration__7CObjectFv
    /* 1A1544 002A1444 50921300 */ .word SetScale__10CCharacterFfff
    /* 1A1548 002A1448 E0921300 */ .word SetScale__10CCharacterFPf
    /* 1A154C 002A144C F06F1500 */ .word GetScale__7CObjectFPf
    /* 1A1550 002A1450 F0601500 */ .word ShadowStep__12CNPCharacterFv
    /* 1A1554 002A1454 508E1300 */ .word ClothStep__10CCharacterFi
    /* 1A1558 002A1458 708F1300 */ .word ClothFloor__10CCharacterFi
    /* 1A155C 002A145C 90B31300 */ .word StopCloth__10CCharacterFi
    /* 1A1560 002A1460 B0901300 */ .word GetPosition__10CCharacterFPf
    /* 1A1564 002A1464 40901300 */ .word GetWorldPosition__10CCharacterFPf
    /* 1A1568 002A1468 D0661500 */ .word PickUpPoly__12CNPCharacterFPfP6CCPoly
    /* 1A156C 002A146C 40651500 */ .word Draw__12CNPCharacterFv
    /* 1A1570 002A1470 20661500 */ .word DrawShadow__12CNPCharacterFv
    /* 1A1574 002A1474 F0971300 */ .word LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
    /* 1A1578 002A1478 20981300 */ .word LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
    /* 1A157C 002A147C 50981300 */ .word LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
    /* 1A1580 002A1480 90981300 */ .word LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
    /* 1A1584 002A1484 E0691500 */ .word Initialize__12CNPCharacterFv
    /* 1A1588 002A1488 00000000 */ .word 0x00000000
    /* 1A158C 002A148C 00000000 */ .word 0x00000000

