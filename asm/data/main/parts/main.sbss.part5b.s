.include "macro.inc"

.include "macro.inc"

.section .sbss, "wa"
glabel Fade
    /* 002A2FD8 */ .space 0x04

glabel Cursor
    /* 002A2FDC */ .space 0x04

glabel Proc
    /* 002A2FE0 */ .space 0x04

glabel PassReadBuffer
    /* 002A2FE4 */ .space 0x04

glabel MesBuffer
    /* 002A2FE8 */ .space 0x04

glabel OpBgmSqPort
    /* 002A2FEC */ .space 0x04

glabel frame_info_cam
    /* 002A2FF0 */ .space 0x04

glabel SceneNp__2
    /* 002A2FF4 */ .space 0x04

glabel Pause
    /* 002A2FF8 */ .space 0x04

glabel CameraMode
    /* 002A2FFC */ .space 0x04

glabel SceneRp
    /* 002A3000 */ .space 0x04

glabel SceneCnt
    /* 002A3004 */ .space 0x04

glabel SceneFlg
    /* 002A3008 */ .space 0x04

glabel SceneSw
    /* 002A300C */ .space 0x04

glabel PauseFrame
    /* 002A3010 */ .space 0x04

glabel End
    /* 002A3014 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3015
    /* 002A3015 */ .space 0x03

glabel EndCnt
    /* 002A3018 */ .space 0x04

glabel BgmOff
    /* 002A301C */ .space 0x04

glabel BgmVol
    /* 002A3020 */ .space 0x04

glabel BgmNo
    /* 002A3024 */ .space 0x04

glabel endflg$707
    /* 002A3028 */ .space 0x04

glabel init$708
    /* 002A302C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A302D
    /* 002A302D */ .space 0x03

glabel flg$743
    /* 002A3030 */ .space 0x04

glabel init$744
    /* 002A3034 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3035
    /* 002A3035 */ .space 0x03

glabel cnt$746
    /* 002A3038 */ .space 0x04

glabel init$747
    /* 002A303C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A303D
    /* 002A303D */ .space 0x03

glabel no$920
    /* 002A3040 */ .space 0x04

glabel init$921
    /* 002A3044 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3045
    /* 002A3045 */ .space 0x03

glabel cnt$937
    /* 002A3048 */ .space 0x04

glabel init$938
    /* 002A304C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A304D
    /* 002A304D */ .space 0x03

glabel WaterR
    /* 002A3050 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3051
    /* 002A3051 */ .space 0x03

glabel WaterG
    /* 002A3054 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3055
    /* 002A3055 */ .space 0x03

glabel WaterB
    /* 002A3058 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3059
    /* 002A3059 */ .space 0x03

glabel WaterFlag
    /* 002A305C */ .space 0x04

glabel WaterMeshW
    /* 002A3060 */ .space 0x04

glabel WaterMeshH
    /* 002A3064 */ .space 0x04

glabel WaterShake
    /* 002A3068 */ .space 0x04

glabel WaterCourant
    /* 002A306C */ .space 0x04

glabel WaterDecline
    /* 002A3070 */ .space 0x04

glabel WaterAmplitude
    /* 002A3074 */ .space 0x04

glabel WaterRefraction
    /* 002A3078 */ .space 0x04

glabel ColModelCount
    /* 002A307C */ .space 0x04

glabel shadowModelCount
    /* 002A3080 */ .space 0x04

glabel animeSpeed1
    /* 002A3084 */ .space 0x04

glabel animeSpeed2
    /* 002A3088 */ .space 0x04

glabel pointLightStack
    /* 002A308C */ .space 0x04

glabel argLevel
    /* 002A3090 */ .space 0x04

glabel teigiFileSize
    /* 002A3094 */ .space 0x04

glabel nowObjCnt
    /* 002A3098 */ .space 0x04

glabel nowObjCnt2
    /* 002A309C */ .space 0x04

glabel nowPartsCnt
    /* 002A30A0 */ .space 0x04

glabel OP_AnimeSeqRot
    /* 002A30A4 */ .space 0x04

glabel OP_FireList
    /* 002A30A8 */ .space 0x04

glabel OP_GroundCol
    /* 002A30AC */ .space 0x04

glabel OP_SkyFrame
    /* 002A30B0 */ .space 0x04

glabel OP_CharaFrame__2
    /* 002A30B4 */ .space 0x04

glabel CloudFlag
    /* 002A30B8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A30B9
    /* 002A30B9 */ .space 0x03

glabel Shadow
    /* 002A30BC */ .space 0x04

glabel DancerAmb
    /* 002A30C0 */ .space 0x04

/* Automatically generated and unreferenced pad */
glabel D_002A30C4
    /* 002A30C4 */ .space 0x04

glabel Smoke
    /* 002A30C8 */ .space 0x08

glabel EffectTable
    /* 002A30D0 */ .space 0x04

glabel DanceWait
    /* 002A30D4 */ .space 0x04

glabel DanceCnt
    /* 002A30D8 */ .space 0x04

glabel DanceStart
    /* 002A30DC */ .space 0x04

glabel wait$360
    /* 002A30E0 */ .space 0x04

glabel col$393
    /* 002A30E4 */ .space 0x04

glabel init$394
    /* 002A30E8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A30E9
    /* 002A30E9 */ .space 0x03

glabel am$396
    /* 002A30EC */ .space 0x04

glabel init$397
    /* 002A30F0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A30F1
    /* 002A30F1 */ .space 0x03

glabel wait$399
    /* 002A30F4 */ .space 0x04

glabel init$400
    /* 002A30F8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A30F9
    /* 002A30F9 */ .space 0x03

glabel cnt$468
    /* 002A30FC */ .space 0x04

glabel init$469
    /* 002A3100 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3101
    /* 002A3101 */ .space 0x03

glabel sw$471
    /* 002A3104 */ .space 0x04

glabel init$472
    /* 002A3108 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3109
    /* 002A3109 */ .space 0x03

glabel sc$656
    /* 002A310C */ .space 0x04

glabel init$657
    /* 002A3110 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3111
    /* 002A3111 */ .space 0x03

glabel cnt$681
    /* 002A3114 */ .space 0x04

glabel init$682
    /* 002A3118 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3119
    /* 002A3119 */ .space 0x03

glabel d$717
    /* 002A311C */ .space 0x04

glabel f$786
    /* 002A3120 */ .space 0x04

glabel mus$915
    /* 002A3124 */ .space 0x04

glabel init$916__2
    /* 002A3128 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3129
    /* 002A3129 */ .space 0x03

glabel wait$925
    /* 002A312C */ .space 0x04

glabel init$926
    /* 002A3130 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3131
    /* 002A3131 */ .space 0x03

glabel wait$940
    /* 002A3134 */ .space 0x04

glabel init$941
    /* 002A3138 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3139
    /* 002A3139 */ .space 0x03

glabel wait$955
    /* 002A313C */ .space 0x04

glabel init$956
    /* 002A3140 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3141
    /* 002A3141 */ .space 0x03

glabel wait$970
    /* 002A3144 */ .space 0x04

glabel init$971
    /* 002A3148 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3149
    /* 002A3149 */ .space 0x03

glabel seflg$988
    /* 002A314C */ .space 0x04

glabel init$989
    /* 002A3150 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3151
    /* 002A3151 */ .space 0x03

glabel secnt$991
    /* 002A3154 */ .space 0x04

glabel init$992
    /* 002A3158 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3159
    /* 002A3159 */ .space 0x03

glabel vol$994
    /* 002A315C */ .space 0x04

glabel init$995
    /* 002A3160 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3161
    /* 002A3161 */ .space 0x03

glabel flg$1006
    /* 002A3164 */ .space 0x04

glabel init$1007
    /* 002A3168 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3169
    /* 002A3169 */ .space 0x03

glabel flg$1019
    /* 002A316C */ .space 0x04

glabel init$1020
    /* 002A3170 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3171
    /* 002A3171 */ .space 0x03

glabel setTexScrollCnt$1032
    /* 002A3174 */ .space 0x04

glabel init$1033
    /* 002A3178 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3179
    /* 002A3179 */ .space 0x03

glabel setTexScrollCntf$1035
    /* 002A317C */ .space 0x04

glabel init$1036
    /* 002A3180 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3181
    /* 002A3181 */ .space 0x03

glabel setTexScrollCnt$1062
    /* 002A3184 */ .space 0x04

glabel init$1063
    /* 002A3188 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3189
    /* 002A3189 */ .space 0x03

glabel setTexScrollCntf$1065
    /* 002A318C */ .space 0x04

glabel init$1066
    /* 002A3190 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3191
    /* 002A3191 */ .space 0x03

glabel ToansHouse
    /* 002A3194 */ .space 0x04

glabel DoransFuusya
    /* 002A3198 */ .space 0x08

glabel VolFade
    /* 002A31A0 */ .space 0x04

glabel camera$589
    /* 002A31A4 */ .space 0x04

glabel init$590
    /* 002A31A8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A31A9
    /* 002A31A9 */ .space 0x03

glabel wait$644
    /* 002A31AC */ .space 0x04

glabel init$645__2
    /* 002A31B0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A31B1
    /* 002A31B1 */ .space 0x03

glabel wait$675
    /* 002A31B4 */ .space 0x04

glabel init$676
    /* 002A31B8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A31B9
    /* 002A31B9 */ .space 0x03

glabel cnt$782
    /* 002A31BC */ .space 0x04

glabel init$783
    /* 002A31C0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A31C1
    /* 002A31C1 */ .space 0x07

glabel DoransFuusya__2
    /* 002A31C8 */ .space 0x08

glabel EffectTable__2
    /* 002A31D0 */ .space 0x04

/* Automatically generated and unreferenced pad */
glabel D_002A31D4
    /* 002A31D4 */ .space 0x04

glabel Smoke__2
    /* 002A31D8 */ .space 0x08

glabel MBeemCnt
    /* 002A31E0 */ .space 0x04

glabel FireStep
    /* 002A31E4 */ .space 0x04

glabel MajinBgmStart
    /* 002A31E8 */ .space 0x04

glabel DanceBgmStart
    /* 002A31EC */ .space 0x04

glabel DanceBgmCnt
    /* 002A31F0 */ .space 0x04

glabel SndCnt
    /* 002A31F4 */ .space 0x04

glabel camera$900
    /* 002A31F8 */ .space 0x04

glabel init$901
    /* 002A31FC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A31FD
    /* 002A31FD */ .space 0x03

glabel step$938
    /* 002A3200 */ .space 0x04

glabel init$939
    /* 002A3204 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3205
    /* 002A3205 */ .space 0x03

glabel d$941
    /* 002A3208 */ .space 0x04

glabel init$942
    /* 002A320C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A320D
    /* 002A320D */ .space 0x03

glabel vol$992
    /* 002A3210 */ .space 0x04

glabel init$993
    /* 002A3214 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3215
    /* 002A3215 */ .space 0x03

glabel cnt$995
    /* 002A3218 */ .space 0x04

glabel init$996
    /* 002A321C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A321D
    /* 002A321D */ .space 0x03

glabel se$1004
    /* 002A3220 */ .space 0x04

glabel init$1005
    /* 002A3224 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3225
    /* 002A3225 */ .space 0x03

glabel wait$1041
    /* 002A3228 */ .space 0x04

glabel init$1042
    /* 002A322C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A322D
    /* 002A322D */ .space 0x03

glabel wait$1062
    /* 002A3230 */ .space 0x04

glabel init$1063__2
    /* 002A3234 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3235
    /* 002A3235 */ .space 0x03

glabel wait$1077
    /* 002A3238 */ .space 0x04

glabel init$1078
    /* 002A323C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A323D
    /* 002A323D */ .space 0x03

glabel wait$1094
    /* 002A3240 */ .space 0x04

glabel init$1095
    /* 002A3244 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3245
    /* 002A3245 */ .space 0x03

glabel flg$1180
    /* 002A3248 */ .space 0x04

glabel init$1181
    /* 002A324C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A324D
    /* 002A324D */ .space 0x03

glabel bright$1183
    /* 002A3250 */ .space 0x04

glabel init$1184
    /* 002A3254 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3255
    /* 002A3255 */ .space 0x03

glabel cnt$1744
    /* 002A3258 */ .space 0x04

glabel init$1745
    /* 002A325C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A325D
    /* 002A325D */ .space 0x03

glabel setTexScrollCnt
    /* 002A3260 */ .space 0x04

glabel setTexScrollCntf
    /* 002A3264 */ .space 0x04

glabel setTexAnimCnt__2
    /* 002A3268 */ .space 0x04

glabel setTexAnimCntf__2
    /* 002A326C */ .space 0x04

glabel amb3
    /* 002A3270 */ .space 0x04

glabel SkyFrame__2
    /* 002A3274 */ .space 0x04

glabel camera$574
    /* 002A3278 */ .space 0x04

glabel init$575
    /* 002A327C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A327D
    /* 002A327D */ .space 0x03

glabel se$622
    /* 002A3280 */ .space 0x04

glabel init$623
    /* 002A3284 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3285
    /* 002A3285 */ .space 0x03

glabel mus$630
    /* 002A3288 */ .space 0x04

glabel init$631
    /* 002A328C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A328D
    /* 002A328D */ .space 0x03

glabel se$640
    /* 002A3290 */ .space 0x04

glabel init$641
    /* 002A3294 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3295
    /* 002A3295 */ .space 0x03

glabel mus$648
    /* 002A3298 */ .space 0x04

glabel init$649
    /* 002A329C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A329D
    /* 002A329D */ .space 0x03

glabel se$656
    /* 002A32A0 */ .space 0x04

glabel init$657__2
    /* 002A32A4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32A5
    /* 002A32A5 */ .space 0x03

glabel mus$664
    /* 002A32A8 */ .space 0x04

glabel init$665__2
    /* 002A32AC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32AD
    /* 002A32AD */ .space 0x03

glabel wait$678
    /* 002A32B0 */ .space 0x04

glabel init$679
    /* 002A32B4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32B5
    /* 002A32B5 */ .space 0x03

glabel fade1$766
    /* 002A32B8 */ .space 0x04

glabel init$767
    /* 002A32BC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32BD
    /* 002A32BD */ .space 0x03

glabel fade2$769
    /* 002A32C0 */ .space 0x04

glabel init$770__2
    /* 002A32C4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32C5
    /* 002A32C5 */ .space 0x03

glabel fade3$772
    /* 002A32C8 */ .space 0x04

glabel init$773
    /* 002A32CC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32CD
    /* 002A32CD */ .space 0x03

glabel rot1$932
    /* 002A32D0 */ .space 0x04

glabel init$933
    /* 002A32D4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32D5
    /* 002A32D5 */ .space 0x03

glabel rot2$935
    /* 002A32D8 */ .space 0x04

glabel init$936
    /* 002A32DC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32DD
    /* 002A32DD */ .space 0x03

glabel angle$975
    /* 002A32E0 */ .space 0x04

glabel init$976
    /* 002A32E4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32E5
    /* 002A32E5 */ .space 0x03

glabel cnt$996
    /* 002A32E8 */ .space 0x04

glabel init$997
    /* 002A32EC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32ED
    /* 002A32ED */ .space 0x03

glabel cnt1$1014
    /* 002A32F0 */ .space 0x04

glabel init$1015
    /* 002A32F4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32F5
    /* 002A32F5 */ .space 0x03

glabel cntA$1017
    /* 002A32F8 */ .space 0x04

glabel init$1018
    /* 002A32FC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A32FD
    /* 002A32FD */ .space 0x03

glabel cnt2$1024
    /* 002A3300 */ .space 0x04

glabel init$1025
    /* 002A3304 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3305
    /* 002A3305 */ .space 0x03

glabel cntB$1027
    /* 002A3308 */ .space 0x04

glabel init$1028
    /* 002A330C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A330D
    /* 002A330D */ .space 0x03

glabel fadeA1$1034
    /* 002A3310 */ .space 0x04

glabel init$1035
    /* 002A3314 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3315
    /* 002A3315 */ .space 0x03

glabel fadeA2$1037
    /* 002A3318 */ .space 0x04

glabel init$1038
    /* 002A331C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A331D
    /* 002A331D */ .space 0x03

glabel fadeB1$1047
    /* 002A3320 */ .space 0x04

glabel init$1048__2
    /* 002A3324 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3325
    /* 002A3325 */ .space 0x03

glabel fadeB2$1050
    /* 002A3328 */ .space 0x04

glabel init$1051
    /* 002A332C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A332D
    /* 002A332D */ .space 0x03

glabel fadeB3$1053
    /* 002A3330 */ .space 0x04

glabel init$1054
    /* 002A3334 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3335
    /* 002A3335 */ .space 0x03

glabel x$1075
    /* 002A3338 */ .space 0x04

glabel init$1076
    /* 002A333C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A333D
    /* 002A333D */ .space 0x03

glabel y$1078
    /* 002A3340 */ .space 0x04

glabel init$1079
    /* 002A3344 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3345
    /* 002A3345 */ .space 0x03

glabel rot$1081
    /* 002A3348 */ .space 0x04

glabel init$1082
    /* 002A334C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A334D
    /* 002A334D */ .space 0x03

glabel x2$1084
    /* 002A3350 */ .space 0x04

glabel init$1085
    /* 002A3354 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3355
    /* 002A3355 */ .space 0x03

glabel y2$1087
    /* 002A3358 */ .space 0x04

glabel init$1088
    /* 002A335C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A335D
    /* 002A335D */ .space 0x03

glabel rot2$1090
    /* 002A3360 */ .space 0x04

glabel init$1091
    /* 002A3364 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3365
    /* 002A3365 */ .space 0x03

glabel x3$1093
    /* 002A3368 */ .space 0x04

glabel init$1094
    /* 002A336C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A336D
    /* 002A336D */ .space 0x03

glabel y3$1096
    /* 002A3370 */ .space 0x04

glabel init$1097
    /* 002A3374 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3375
    /* 002A3375 */ .space 0x03

glabel rot3$1099
    /* 002A3378 */ .space 0x04

glabel init$1100
    /* 002A337C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A337D
    /* 002A337D */ .space 0x03

glabel x$1136
    /* 002A3380 */ .space 0x04

glabel init$1137
    /* 002A3384 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3385
    /* 002A3385 */ .space 0x03

glabel y$1139
    /* 002A3388 */ .space 0x04

glabel init$1140
    /* 002A338C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A338D
    /* 002A338D */ .space 0x03

glabel x2$1142
    /* 002A3390 */ .space 0x04

glabel init$1143
    /* 002A3394 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3395
    /* 002A3395 */ .space 0x03

glabel y2$1145
    /* 002A3398 */ .space 0x04

glabel init$1146
    /* 002A339C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A339D
    /* 002A339D */ .space 0x03

glabel OP_CharaFrame
    /* 002A33A0 */ .space 0x04

glabel bEnd
    /* 002A33A4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A33A5
    /* 002A33A5 */ .space 0x03

glabel EndCnt__2
    /* 002A33A8 */ .space 0x04

glabel CameraMode__2
    /* 002A33AC */ .space 0x04

glabel SceneNp
    /* 002A33B0 */ .space 0x04

glabel TitleAngle
    /* 002A33B4 */ .space 0x04

glabel StartDisp
    /* 002A33B8 */ .space 0x04

glabel TitleFade
    /* 002A33BC */ .space 0x04

glabel TitleFadeCnt
    /* 002A33C0 */ .space 0x04

glabel StartLightning
    /* 002A33C4 */ .space 0x04

glabel atraGetStatusRate
    /* 002A33C8 */ .space 0x04

glabel old$498
    /* 002A33CC */ .space 0x04

glabel init$499
    /* 002A33D0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A33D1
    /* 002A33D1 */ .space 0x03

glabel iwacnt$512
    /* 002A33D4 */ .space 0x04

glabel init$513
    /* 002A33D8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A33D9
    /* 002A33D9 */ .space 0x03

glabel fade$599
    /* 002A33DC */ .space 0x04

glabel init$600
    /* 002A33E0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A33E1
    /* 002A33E1 */ .space 0x03

glabel mus$645
    /* 002A33E4 */ .space 0x04

glabel init$646
    /* 002A33E8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A33E9
    /* 002A33E9 */ .space 0x03

glabel ambi$653
    /* 002A33EC */ .space 0x04

glabel init$654__2
    /* 002A33F0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A33F1
    /* 002A33F1 */ .space 0x03

glabel bat$661
    /* 002A33F4 */ .space 0x04

glabel init$662
    /* 002A33F8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A33F9
    /* 002A33F9 */ .space 0x03

glabel wait$679
    /* 002A33FC */ .space 0x04

glabel init$680
    /* 002A3400 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3401
    /* 002A3401 */ .space 0x03

glabel wait$703
    /* 002A3404 */ .space 0x04

glabel init$704
    /* 002A3408 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3409
    /* 002A3409 */ .space 0x03

glabel lightning$958
    /* 002A340C */ .space 0x04

glabel init$959
    /* 002A3410 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3411
    /* 002A3411 */ .space 0x03

glabel col$961
    /* 002A3414 */ .space 0x04

glabel init$962
    /* 002A3418 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3419
    /* 002A3419 */ .space 0x03

glabel ObjectFrame3
    /* 002A341C */ .space 0x04

glabel CProcess
    /* 002A3420 */ .space 0x08

glabel CFade
    /* 002A3428 */ .space 0x04

glabel Fade1
    /* 002A342C */ .space 0x04

glabel Fade2
    /* 002A3430 */ .space 0x04

glabel Fade3
    /* 002A3434 */ .space 0x04

glabel Fade4
    /* 002A3438 */ .space 0x04

glabel Wait
    /* 002A343C */ .space 0x04

glabel opcnt
    /* 002A3440 */ .space 0x04

glabel keywait
    /* 002A3444 */ .space 0x04

glabel brink
    /* 002A3448 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3449
    /* 002A3449 */ .space 0x03

glabel brinkcnt
    /* 002A344C */ .space 0x04

glabel EffCnt
    /* 002A3450 */ .space 0x04

glabel br$577
    /* 002A3454 */ .space 0x04

glabel init$578
    /* 002A3458 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A3459
    /* 002A3459 */ .space 0x07

glabel GameEnv
    /* 002A3460 */ .space 0x08
