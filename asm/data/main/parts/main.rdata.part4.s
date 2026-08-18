.include "macro.inc"

.include "macro.inc"

.section .rdata, "a"
glabel __vt__13CCollisionMDT
    /* 1A11D0 002A10D0 00000000 */ .word 0x00000000
    /* 1A11D4 002A10D4 00000000 */ .word 0x00000000
    /* 1A11D8 002A10D8 C04E1200 */ .word GetPolygon__13CCollisionMDTFiPA4_fPA4_fPA4_f
    /* 1A11DC 002A10DC 104F1200 */ .word GetMaxY__13CCollisionMDTFPf
    /* 1A11E0 002A10E0 F0541200 */ .word GetVertexAddress__13CCollisionMDTFPi
    /* 1A11E4 002A10E4 20511200 */ .word Intersection__13CCollisionMDTFPfPfPf
    /* 1A11E8 002A10E8 40551200 */ .word PickUpNearPoly__13CCollisionMDTFP6CCPolyPff
    /* 1A11EC 002A10EC C0561200 */ .word PickUpNearPoly__13CCollisionMDTFP6CCPolyRC7CBoxVu0
    /* 1A11F0 002A10F0 B0581200 */ .word PickUpNearPoly__13CCollisionMDTFP6CCPoly
    /* 1A11F4 002A10F4 70591200 */ .word Initialize__13CCollisionMDTFv
    /* 1A11F8 002A10F8 00000000 */ .word 0x00000000
    /* 1A11FC 002A10FC 00000000 */ .word 0x00000000

glabel __vt__10CCollision
    /* 1A1200 002A1100 00000000 */ .word 0x00000000
    /* 1A1204 002A1104 00000000 */ .word 0x00000000
    /* 1A1208 002A1108 30781200 */ .word GetPolygon__10CCollisionFiPA4_fPA4_fPA4_f
    /* 1A120C 002A110C 40781200 */ .word GetMaxY__10CCollisionFPf
    /* 1A1210 002A1110 B04E1200 */ .word GetVertexAddress__10CCollisionFPi
    /* 1A1214 002A1114 50781200 */ .word Intersection__10CCollisionFPfPfPf
    /* 1A1218 002A1118 80781200 */ .word PickUpNearPoly__10CCollisionFP6CCPolyPff
    /* 1A121C 002A111C 70781200 */ .word PickUpNearPoly__10CCollisionFP6CCPolyRC7CBoxVu0
    /* 1A1220 002A1120 60781200 */ .word PickUpNearPoly__10CCollisionFP6CCPoly
    /* 1A1224 002A1124 90781200 */ .word Initialize__10CCollisionFv
    /* 1A1228 002A1128 00000000 */ .word 0x00000000
    /* 1A122C 002A112C 00000000 */ .word 0x00000000

glabel __vt__6CFrame
    /* 1A1230 002A1130 00000000 */ .word 0x00000000
    /* 1A1234 002A1134 00000000 */ .word 0x00000000
    /* 1A1238 002A1138 A0A11200 */ .word DrawVu1__6CFrameFPUiP10RenderInfo
    /* 1A123C 002A113C B0A11200 */ .word DrawVu1__6CFrameFP13sceVif1PacketP10RenderInfo
    /* 1A1240 002A1140 707D1200 */ .word Initialize__6CFrameFv
    /* 1A1244 002A1144 00000000 */ .word 0x00000000
    /* 1A1248 002A1148 00000000 */ .word 0x00000000
    /* 1A124C 002A114C 00000000 */ .word 0x00000000

glabel __vt__9CFrameVu1
    /* 1A1250 002A1150 00000000 */ .word 0x00000000
    /* 1A1254 002A1154 00000000 */ .word 0x00000000
    /* 1A1258 002A1158 00941200 */ .word DrawVu1__9CFrameVu1FPUiP10RenderInfo
    /* 1A125C 002A115C 10A11200 */ .word DrawVu1__9CFrameVu1FP13sceVif1PacketP10RenderInfo
    /* 1A1260 002A1160 30A21200 */ .word Initialize__9CFrameVu1Fv
    /* 1A1264 002A1164 00000000 */ .word 0x00000000

glabel __vt__7CVisual
    /* 1A1268 002A1168 00000000 */ .word 0x00000000
    /* 1A126C 002A116C 00000000 */ .word 0x00000000
    /* 1A1270 002A1170 504B1300 */ .word Initialize__7CVisualFv
    /* 1A1274 002A1174 00000000 */ .word 0x00000000
    /* 1A1278 002A1178 00000000 */ .word 0x00000000
    /* 1A127C 002A117C 00000000 */ .word 0x00000000

glabel __vt__13CVisualShadow
    /* 1A1280 002A1180 00000000 */ .word 0x00000000
    /* 1A1284 002A1184 00000000 */ .word 0x00000000
    /* 1A1288 002A1188 704F1300 */ .word Initialize__13CVisualMDTVu1Fv
    /* 1A128C 002A118C 504F1300 */ .word SetMDTDataAddress__13CVisualMDTVu1FPUi
    /* 1A1290 002A1190 604F1300 */ .word GetMDTDataAddress__13CVisualMDTVu1Fv
    /* 1A1294 002A1194 40681300 */ .word RemakeData__13CVisualShadowFPUi
    /* 1A1298 002A1198 90621300 */ .word DrawVu1__13CVisualShadowFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* 1A129C 002A119C E0631300 */ .word DrawVu1__13CVisualShadowFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii

glabel __vt__13CVisualMDTVu1
    /* 1A12A0 002A11A0 00000000 */ .word 0x00000000
    /* 1A12A4 002A11A4 00000000 */ .word 0x00000000
    /* 1A12A8 002A11A8 704F1300 */ .word Initialize__13CVisualMDTVu1Fv
    /* 1A12AC 002A11AC 504F1300 */ .word SetMDTDataAddress__13CVisualMDTVu1FPUi
    /* 1A12B0 002A11B0 604F1300 */ .word GetMDTDataAddress__13CVisualMDTVu1Fv
    /* 1A12B4 002A11B4 40621300 */ .word RemakeData__13CVisualMDTVu1FPUi
    /* 1A12B8 002A11B8 E0601300 */ .word DrawVu1__13CVisualMDTVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* 1A12BC 002A11BC 00621300 */ .word DrawVu1__13CVisualMDTVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii

glabel __vt__10CVisualVu1
    /* 1A12C0 002A11C0 00000000 */ .word 0x00000000
    /* 1A12C4 002A11C4 00000000 */ .word 0x00000000
    /* 1A12C8 002A11C8 C04E1300 */ .word Initialize__10CVisualVu1Fv
    /* 1A12CC 002A11CC 807E1300 */ .word SetMDTDataAddress__10CVisualVu1FPUi
    /* 1A12D0 002A11D0 907E1300 */ .word GetMDTDataAddress__10CVisualVu1Fv
    /* 1A12D4 002A11D4 B04B1300 */ .word RemakeData__10CVisualVu1FPUi
    /* 1A12D8 002A11D8 00501300 */ .word DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* 1A12DC 002A11DC C04B1300 */ .word DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii

