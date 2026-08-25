.include "macro.inc"

.include "macro.inc"

.section .sbss, "wa"

glabel linear
    /* 002A25A8 */ .space 0x04

glabel data_top
    /* 002A25AC */ .space 0x04

glabel pdata
    /* 002A25B0 */ .space 0x04

glabel dma_cnt
    /* 002A25B4 */ .space 0x04

glabel now_loding_flag
    /* 002A25B8 */ .space 0x04

glabel nl_start_cnt
    /* 002A25BC */ .space 0x04

glabel col_cnt
    /* 002A25C0 */ .space 0x04

glabel col_add
    /* 002A25C4 */ .space 0x04

glabel logo_count
    /* 002A25C8 */ .space 0x04

glabel count__2
    /* 002A25CC */ .space 0x04

glabel map_title_no
    /* 002A25D0 */ .space 0x04

glabel now_loding_off
    /* 002A25D4 */ .space 0x04

glabel now_loading_vsync_end
    /* 002A25D8 */ .space 0x04

glabel VSyncField
    /* 002A25DC */ .space 0x04

glabel snd_read_buf
    /* 002A25E0 */ .space 0x04

glabel bgm_off
    /* 002A25E4 */ .space 0x04

glabel snd_id
    /* 002A25E8 */ .space 0x04

glabel now_sound_set
    /* 002A25EC */ .space 0x04

glabel now_voice_set
    /* 002A25F0 */ .space 0x04

glabel now_bgm_no
    /* 002A25F4 */ .space 0x04

glabel now_bgm_play
    /* 002A25F8 */ .space 0x04

glabel now_bgm_vol
    /* 002A25FC */ .space 0x04

glabel bgm_fade
    /* 002A2600 */ .space 0x04

glabel now_bgm_fade_vol
    /* 002A2604 */ .space 0x04

glabel bgm_fade_step
    /* 002A2608 */ .space 0x04

glabel bgm_fade_vol
    /* 002A260C */ .space 0x04

glabel now_amb_no
    /* 002A2610 */ .space 0x04

glabel now_amb_vol
    /* 002A2614 */ .space 0x04

glabel now_amb_play
    /* 002A2618 */ .space 0x04

glabel now_sp_no
    /* 002A261C */ .space 0x04

glabel se_table_no
    /* 002A2620 */ .space 0x04

glabel basic_se_table_no
    /* 002A2624 */ .space 0x04

glabel load_bgm_no
    /* 002A2628 */ .space 0x04

glabel load_bgm_adr
    /* 002A262C */ .space 0x04

glabel load_snd_set
    /* 002A2630 */ .space 0x04

glabel load_snd_adr
    /* 002A2634 */ .space 0x04

glabel load_voice_set
    /* 002A2638 */ .space 0x04

glabel load_voice_adr
    /* 002A263C */ .space 0x04

glabel load_sp_no
    /* 002A2640 */ .space 0x04

glabel load_sp_adr
    /* 002A2644 */ .space 0x04

glabel init_snd
    /* 002A2648 */ .space 0x04

glabel system_snd_id$551
    /* 002A264C */ .space 0x04

glabel init$552
    /* 002A2650 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2651
    /* 002A2651 */ .space 0x03

glabel se_list
    /* 002A2654 */ .space 0x04

glabel SoundInfo
    /* 002A2658 */ .space 0x04

glabel SystemMesCount
    /* 002A265C */ .space 0x04

glabel SystemMesWait
    /* 002A2660 */ .space 0x04

glabel SystemMesInputKey
    /* 002A2664 */ .space 0x04

glabel sw
    /* 002A2668 */ .space 0x04

glabel effect_count
    /* 002A266C */ .space 0x04

glabel smoke_tex
    /* 002A2670 */ .space 0x04

glabel sibuki_tex
    /* 002A2674 */ .space 0x04

glabel hamon_tex
    /* 002A2678 */ .space 0x04

glabel all_stop
    /* 002A267C */ .space 0x04

glabel stop_anime__13CTextureAnime
    /* 002A2680 */ .space 0x04

glabel pTexAnime
    /* 002A2684 */ .space 0x04

glabel now_group
    /* 002A2688 */ .space 0x04

glabel ebattle_flag
    /* 002A268C */ .space 0x04

glabel ebattle_intro_flag
    /* 002A2690 */ .space 0x04

glabel eb_count
    /* 002A2694 */ .space 0x04

glabel eb_intro_cnt
    /* 002A2698 */ .space 0x04

glabel eb_finish_cnt
    /* 002A269C */ .space 0x04

glabel eb_end_count
    /* 002A26A0 */ .space 0x04

glabel eb_result
    /* 002A26A4 */ .space 0x04

glabel eb_key_count
    /* 002A26A8 */ .space 0x04

glabel now_button_no
    /* 002A26AC */ .space 0x04

glabel eb_chara
    /* 002A26B0 */ .space 0x04

glabel fade_bgm
    /* 002A26B4 */ .space 0x04

glabel play_fanfare
    /* 002A26B8 */ .space 0x04

glabel now_time
    /* 002A26BC */ .space 0x04

glabel sound_cnt
    /* 002A26C0 */ .space 0x04

glabel debug_mode
    /* 002A26C4 */ .space 0x04

glabel tex
    /* 002A26C8 */ .space 0x04

glabel tex2
    /* 002A26CC */ .space 0x04

glabel eb_key_num
    /* 002A26D0 */ .space 0x04

glabel ok_draw_cnt
    /* 002A26D4 */ .space 0x04

glabel ok_type
    /* 002A26D8 */ .space 0x04

glabel ok_effect_button
    /* 002A26DC */ .space 0x04

glabel viewMode
    /* 002A26E0 */ .space 0x04

glabel chara_mode
    /* 002A26E4 */ .space 0x04

glabel chara_fishing
    /* 002A26E8 */ .space 0x04

glabel fishing_mes
    /* 002A26EC */ .space 0x04

glabel viewAngleH
    /* 002A26F0 */ .space 0x04

glabel viewAngleV
    /* 002A26F4 */ .space 0x04

glabel rot_count$769
    /* 002A26F8 */ .space 0x04

glabel init$770
    /* 002A26FC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A26FD
    /* 002A26FD */ .space 0x03

glabel bgm_vol$845
    /* 002A2700 */ .space 0x04

glabel init$846
    /* 002A2704 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2705
    /* 002A2705 */ .space 0x03

glabel load_file$848
    /* 002A2708 */ .space 0x04

glabel init$849
    /* 002A270C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A270D
    /* 002A270D */ .space 0x03

glabel st_cnt$855
    /* 002A2710 */ .space 0x04

glabel init$856
    /* 002A2714 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2715
    /* 002A2715 */ .space 0x03

glabel wait_cnt$858
    /* 002A2718 */ .space 0x04

glabel init$859
    /* 002A271C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A271D
    /* 002A271D */ .space 0x03

glabel cnt$1010
    /* 002A2720 */ .space 0x04

glabel init$1011
    /* 002A2724 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2725
    /* 002A2725 */ .space 0x03

glabel ext$839
    /* 002A2728 */ .space 0x04

glabel init$840
    /* 002A272C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A272D
    /* 002A272D */ .space 0x03

glabel EdDebugCameraFlag
    /* 002A2730 */ .space 0x04

glabel EdDebugParamDrawOff
    /* 002A2734 */ .space 0x04

glabel EdDebugCharaDrawOff
    /* 002A2738 */ .space 0x04

glabel EdDebugMoveFlag
    /* 002A273C */ .space 0x04

glabel DebugFont__2
    /* 002A2740 */ .space 0x04

glabel count$345
    /* 002A2744 */ .space 0x04

glabel init$346
    /* 002A2748 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2749
    /* 002A2749 */ .space 0x03

glabel thunder_count
    /* 002A274C */ .space 0x04

glabel start_thunder
    /* 002A2750 */ .space 0x04

glabel next_thunder_cnt
    /* 002A2754 */ .space 0x04

glabel init_menu_cnt
    /* 002A2758 */ .space 0x04

glabel menu_mode
    /* 002A275C */ .space 0x04

glabel use_item
    /* 002A2760 */ .space 0x04

glabel shop_no
    /* 002A2764 */ .space 0x04

glabel name_reg_chara
    /* 002A2768 */ .space 0x04

glabel SystemMesCount__2
    /* 002A276C */ .space 0x04

glabel SystemMesPosition__2
    /* 002A2770 */ .space 0x04

glabel SystemMesW
    /* 002A2774 */ .space 0x04

glabel SystemMesH
    /* 002A2778 */ .space 0x04

glabel SystemMesX
    /* 002A277C */ .space 0x04

glabel SystemMesY
    /* 002A2780 */ .space 0x04

glabel SystemMesWait__2
    /* 002A2784 */ .space 0x04

glabel SystemMesInputKey__2
    /* 002A2788 */ .space 0x04

glabel HelpMesCount
    /* 002A278C */ .space 0x04

glabel cnt1
    /* 002A2790 */ .space 0x04

glabel cnt2
    /* 002A2794 */ .space 0x04

glabel ibox_open_flag
    /* 002A2798 */ .space 0x04

glabel ibox_open_close_flag
    /* 002A279C */ .space 0x04

glabel ibox_open_cnt
    /* 002A27A0 */ .space 0x04

glabel ibox_frame
    /* 002A27A4 */ .space 0x04

glabel ibox_base_frame
    /* 002A27A8 */ .space 0x04

glabel frame_image_flag
    /* 002A27AC */ .space 0x04

glabel edit_info
    /* 002A27B0 */ .space 0x04

glabel texture_list
    /* 002A27B4 */ .space 0x04

glabel fobject_list
    /* 002A27B8 */ .space 0x04

glabel mapobj_list
    /* 002A27BC */ .space 0x04

glabel objanime_list
    /* 002A27C0 */ .space 0x04

glabel light_no
    /* 002A27C4 */ .space 0x04

glabel partseffect_list
    /* 002A27C8 */ .space 0x04

glabel objeffect_list
    /* 002A27CC */ .space 0x04

glabel objtimer_list
    /* 002A27D0 */ .space 0x04

glabel event_list
    /* 002A27D4 */ .space 0x04

glabel water_list
    /* 002A27D8 */ .space 0x04

glabel mapjump_id
    /* 002A27DC */ .space 0x04

glabel people_list
    /* 002A27E0 */ .space 0x04

glabel week_no
    /* 002A27E4 */ .space 0x04

glabel objframe
    /* 002A27E8 */ .space 0x04

glabel mapobj
    /* 002A27EC */ .space 0x04

glabel mapparts
    /* 002A27F0 */ .space 0x04

glabel water_info
    /* 002A27F4 */ .space 0x04

glabel now_villinfo
    /* 002A27F8 */ .space 0x04

glabel now_parts_no
    /* 002A27FC */ .space 0x04

glabel binary
    /* 002A2800 */ .space 0x04

glabel edit_rect_list
    /* 002A2804 */ .space 0x04

glabel motion_parts_list
    /* 002A2808 */ .space 0x04

glabel StayTexture
    /* 002A280C */ .space 0x04

glabel NowEditMap
    /* 002A2810 */ .space 0x04

glabel EdNPCReadBuffer
    /* 002A2814 */ .space 0x04

glabel EdStepTimeFlag
    /* 002A2818 */ .space 0x04

glabel EdInteriorFlag
    /* 002A281C */ .space 0x04

glabel EdInteriorPartsNo
    /* 002A2820 */ .space 0x04

glabel EdInteriorJumpID
    /* 002A2824 */ .space 0x04

glabel EdInteriorDoorSound
    /* 002A2828 */ .space 0x04

glabel EdInteriorStartEvent
    /* 002A282C */ .space 0x04

glabel EdBeforeInBgmNo
    /* 002A2830 */ .space 0x04

/* Automatically generated and unreferenced pad */
glabel D_002A2834
    /* 002A2834 */ .space 0x04

glabel EdEffectGroup
    /* 002A2838 */ .space 0x08

glabel EffectTable__3
    /* 002A2840 */ .space 0x04

/* Automatically generated and unreferenced pad */
glabel D_002A2844
    /* 002A2844 */ .space 0x0C

glabel EditMapInfo
    /* 002A2850 */ .space 0x04

glabel EdEventData
    /* 002A2854 */ .space 0x04

glabel EdSystemEventData
    /* 002A2858 */ .space 0x04

glabel EdDrawOffFlag
    /* 002A285C */ .space 0x04

glabel EdDrawOffMap
    /* 002A2860 */ .space 0x04

glabel EdDrawOffMapShadow
    /* 002A2864 */ .space 0x04

glabel EdThunderEffectFlag
    /* 002A2868 */ .space 0x04

glabel EdPauseFlag
    /* 002A286C */ .space 0x04

glabel clear_screen
    /* 002A2870 */ .space 0x04

glabel key_lock
    /* 002A2874 */ .space 0x04

glabel goto_dungeon
    /* 002A2878 */ .space 0x04

glabel exit_loop
    /* 002A287C */ .space 0x04

glabel loop_counter
    /* 002A2880 */ .space 0x04

glabel key_counter
    /* 002A2884 */ .space 0x04

glabel goto_menu
    /* 002A2888 */ .space 0x04

glabel goto_return_menu
    /* 002A288C */ .space 0x04

glabel sound_off_cnt
    /* 002A2890 */ .space 0x04

glabel debug_menu_mode
    /* 002A2894 */ .space 0x04

glabel goto_cmp_event
    /* 002A2898 */ .space 0x04

glabel goto_cmp_event_level
    /* 002A289C */ .space 0x04

glabel change_time_event
    /* 002A28A0 */ .space 0x04

glabel draw_npc_cursor
    /* 002A28A4 */ .space 0x04

glabel draw_clock
    /* 002A28A8 */ .space 0x04

glabel edit_mode_draw
    /* 002A28AC */ .space 0x04

glabel edit_mode_grd_draw
    /* 002A28B0 */ .space 0x04

glabel depth_of_field
    /* 002A28B4 */ .space 0x04

glabel edit_mode_lighting
    /* 002A28B8 */ .space 0x04

glabel draw_sky
    /* 002A28BC */ .space 0x04

glabel start_event_no
    /* 002A28C0 */ .space 0x04

glabel start_system_event
    /* 002A28C4 */ .space 0x04

glabel move_count
    /* 002A28C8 */ .space 0x04

glabel interior_test
    /* 002A28CC */ .space 0x04

glabel interior_name
    /* 002A28D0 */ .space 0x04

glabel oldGameMode
    /* 002A28D4 */ .space 0x04

glabel pEditGround
    /* 002A28D8 */ .space 0x04

glabel EditArea
    /* 002A28DC */ .space 0x04

glabel ObjParts
    /* 002A28E0 */ .space 0x04

glabel RiverParts
    /* 002A28E4 */ .space 0x04

glabel RoadParts
    /* 002A28E8 */ .space 0x04

glabel MotionParts
    /* 002A28EC */ .space 0x04

glabel NowCamera
    /* 002A28F0 */ .space 0x04

glabel NowTime
    /* 002A28F4 */ .space 0x04

glabel SkyBackFrame
    /* 002A28F8 */ .space 0x04

glabel CharaCursor0
    /* 002A28FC */ .space 0x04

glabel CharaCursor1
    /* 002A2900 */ .space 0x04

glabel CharaCursor2
    /* 002A2904 */ .space 0x04

glabel TreasureCursor
    /* 002A2908 */ .space 0x04

glabel TreasureCursorOpen
    /* 002A290C */ .space 0x04

glabel end_counter
    /* 002A2910 */ .space 0x04

glabel bgm_vol
    /* 002A2914 */ .space 0x04

glabel bgm_play_flag
    /* 002A2918 */ .space 0x04

glabel bgm_play_start
    /* 002A291C */ .space 0x04

glabel door_open_cnt
    /* 002A2920 */ .space 0x04

glabel door_open
    /* 002A2924 */ .space 0x04

glabel fix_pos_enble
    /* 002A2928 */ .space 0x04

glabel talk_villager
    /* 002A292C */ .space 0x04

glabel chg_time_cnt
    /* 002A2930 */ .space 0x04

glabel NowSelectAngle
    /* 002A2934 */ .space 0x04

glabel OldSelectAngle
    /* 002A2938 */ .space 0x04

glabel NowCursorRotY
    /* 002A293C */ .space 0x04

glabel NowFocusParts
    /* 002A2940 */ .space 0x04

glabel OldFocusParts
    /* 002A2944 */ .space 0x04

glabel DrawPartsNameCount
    /* 002A2948 */ .space 0x04

glabel init$654
    /* 002A294C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A294D
    /* 002A294D */ .space 0x03

glabel debug_flag_set$664
    /* 002A2950 */ .space 0x04

glabel init$665
    /* 002A2954 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2955
    /* 002A2955 */ .space 0x03

glabel end_count$767
    /* 002A2958 */ .space 0x04

glabel init$768
    /* 002A295C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A295D
    /* 002A295D */ .space 0x03

glabel top$798
    /* 002A2960 */ .space 0x04

glabel init$799
    /* 002A2964 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2965
    /* 002A2965 */ .space 0x03

glabel select$801
    /* 002A2968 */ .space 0x04

glabel init$802
    /* 002A296C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A296D
    /* 002A296D */ .space 0x03

glabel cur$804
    /* 002A2970 */ .space 0x04

glabel init$805
    /* 002A2974 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2975
    /* 002A2975 */ .space 0x03

glabel debug_flag$1047
    /* 002A2978 */ .space 0x04

glabel init$1048
    /* 002A297C */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A297D
    /* 002A297D */ .space 0x03

glabel event_next$1100
    /* 002A2980 */ .space 0x04

glabel init$1101
    /* 002A2984 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2985
    /* 002A2985 */ .space 0x03

glabel old_mode$1129
    /* 002A2988 */ .space 0x04

glabel end_code$1144
    /* 002A298C */ .space 0x04

glabel init$1145
    /* 002A2990 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2991
    /* 002A2991 */ .space 0x03

glabel offset$1876
    /* 002A2994 */ .space 0x04

glabel init$1877
    /* 002A2998 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2999
    /* 002A2999 */ .space 0x03

glabel a$1906
    /* 002A299C */ .space 0x04

glabel init$1907
    /* 002A29A0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29A1
    /* 002A29A1 */ .space 0x03

glabel draw_day_cnt
    /* 002A29A4 */ .space 0x04

glabel draw_day_flag
    /* 002A29A8 */ .space 0x04

glabel time_flag$2188
    /* 002A29AC */ .space 0x04

glabel init$2189
    /* 002A29B0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29B1
    /* 002A29B1 */ .space 0x03

glabel parts$2227
    /* 002A29B4 */ .space 0x04

glabel init$2228
    /* 002A29B8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29B9
    /* 002A29B9 */ .space 0x03

glabel now_obj$2241
    /* 002A29BC */ .space 0x04

glabel init$2242
    /* 002A29C0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29C1
    /* 002A29C1 */ .space 0x03

glabel camera_dist_mode$2599
    /* 002A29C4 */ .space 0x04

glabel init$2600
    /* 002A29C8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29C9
    /* 002A29C9 */ .space 0x03

glabel parts_no$2646
    /* 002A29CC */ .space 0x04

glabel init$2647
    /* 002A29D0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29D1
    /* 002A29D1 */ .space 0x03

glabel scn_data
    /* 002A29D4 */ .space 0x04

glabel parts_read_buffer
    /* 002A29D8 */ .space 0x04

glabel roty$585
    /* 002A29DC */ .space 0x04

glabel init$586
    /* 002A29E0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29E1
    /* 002A29E1 */ .space 0x03

glabel sys_eff_sc$590
    /* 002A29E4 */ .space 0x04

glabel init$591
    /* 002A29E8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29E9
    /* 002A29E9 */ .space 0x03

glabel sys_eff_cnt$593
    /* 002A29EC */ .space 0x04

glabel init$594
    /* 002A29F0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29F1
    /* 002A29F1 */ .space 0x03

glabel init$632
    /* 002A29F4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A29F5
    /* 002A29F5 */ .space 0x03

glabel fade_in_out
    /* 002A29F8 */ .space 0x04

glabel fade_end
    /* 002A29FC */ .space 0x04

glabel fade_step
    /* 002A2A00 */ .space 0x04

glabel simple_event
    /* 002A2A04 */ .space 0x04

glabel event_enable
    /* 002A2A08 */ .space 0x04

glabel run_system_event
    /* 002A2A0C */ .space 0x04

glabel not_wait_load
    /* 002A2A10 */ .space 0x04

glabel motion_stop_flag
    /* 002A2A14 */ .space 0x04

glabel menu_mode__2
    /* 002A2A18 */ .space 0x04

glabel menu_mode_status
    /* 002A2A1C */ .space 0x04

glabel p_use_item
    /* 002A2A20 */ .space 0x04

glabel p_jump_map_no
    /* 002A2A24 */ .space 0x04

glabel event_stop
    /* 002A2A28 */ .space 0x04

glabel event_pause
    /* 002A2A2C */ .space 0x04

glabel skip_enable
    /* 002A2A30 */ .space 0x04

glabel set_wl_matrix
    /* 002A2A34 */ .space 0x04

glabel follow_chara
    /* 002A2A38 */ .space 0x04

glabel sync_camera_ref_chara
    /* 002A2A3C */ .space 0x04

glabel sync_camera_ref_obj
    /* 002A2A40 */ .space 0x04

glabel sync_camera_pos_obj
    /* 002A2A44 */ .space 0x04

glabel BaseBuffer
    /* 002A2A48 */ .space 0x04

glabel actv_file
    /* 002A2A4C */ .space 0x04

glabel actv_buffer
    /* 002A2A50 */ .space 0x04

glabel mode$2445
    /* 002A2A54 */ .space 0x04

glabel init$2446
    /* 002A2A58 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2A59
    /* 002A2A59 */ .space 0x03

glabel select_chara$2452
    /* 002A2A5C */ .space 0x04

glabel init$2453
    /* 002A2A60 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2A61
    /* 002A2A61 */ .space 0x03

glabel talk_villager__2
    /* 002A2A64 */ .space 0x04

glabel talk_chara_info_id
    /* 002A2A68 */ .space 0x04

glabel talk_camera
    /* 002A2A6C */ .space 0x04

glabel talk_mode
    /* 002A2A70 */ .space 0x04

glabel talk_select
    /* 002A2A74 */ .space 0x04

glabel TalkMesMake
    /* 002A2A78 */ .space 0x04

glabel TalkMesNo
    /* 002A2A7C */ .space 0x04

glabel EdInInfo
    /* 002A2A80 */ .space 0x04

glabel GameMode__2
    /* 002A2A84 */ .space 0x04

glabel active_camera
    /* 002A2A88 */ .space 0x04

glabel camera_change_count
    /* 002A2A8C */ .space 0x04

glabel camera_num
    /* 002A2A90 */ .space 0x04

glabel door_open_cnt__2
    /* 002A2A94 */ .space 0x04

glabel NowCamera__2
    /* 002A2A98 */ .space 0x04

glabel Chara__2
    /* 002A2A9C */ .space 0x04

glabel NowTime__2
    /* 002A2AA0 */ .space 0x04

glabel obj_anime_num
    /* 002A2AA4 */ .space 0x04

glabel effect_num
    /* 002A2AA8 */ .space 0x04

glabel parts_num
    /* 002A2AAC */ .space 0x04

glabel func_point
    /* 002A2AB0 */ .space 0x04

glabel func_num__2
    /* 002A2AB4 */ .space 0x04

glabel start_event_no__2
    /* 002A2AB8 */ .space 0x04

glabel start_system_event__2
    /* 002A2ABC */ .space 0x04

glabel goto_menu__2
    /* 002A2AC0 */ .space 0x04

glabel goto_return_menu__2
    /* 002A2AC4 */ .space 0x04

glabel key_counter__2
    /* 002A2AC8 */ .space 0x04

glabel loop_counter__2
    /* 002A2ACC */ .space 0x04

glabel event_text$604
    /* 002A2AD0 */ .space 0x04

glabel init$605
    /* 002A2AD4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2AD5
    /* 002A2AD5 */ .space 0x03

glabel old_mode$633
    /* 002A2AD8 */ .space 0x04

glabel end_count$644
    /* 002A2ADC */ .space 0x04

glabel init$645
    /* 002A2AE0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2AE1
    /* 002A2AE1 */ .space 0x03

glabel debug_flag$964
    /* 002A2AE4 */ .space 0x04

glabel init$965
    /* 002A2AE8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2AE9
    /* 002A2AE9 */ .space 0x03

glabel debug_menu_mode$967
    /* 002A2AEC */ .space 0x04

glabel init$968
    /* 002A2AF0 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2AF1
    /* 002A2AF1 */ .space 0x03

glabel cnt$1223
    /* 002A2AF4 */ .space 0x04

glabel init$1224
    /* 002A2AF8 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2AF9
    /* 002A2AF9 */ .space 0x03

glabel setTexAnimCnt
    /* 002A2AFC */ .space 0x04

glabel setTexAnimCntf
    /* 002A2B00 */ .space 0x04

glabel npc_count
    /* 002A2B04 */ .space 0x04

glabel objanime_list__2
    /* 002A2B08 */ .space 0x04

glabel effect_list
    /* 002A2B0C */ .space 0x04

glabel debug__2
    /* 002A2B10 */ .space 0x04

glabel motion_parts_list__2
    /* 002A2B14 */ .space 0x04

glabel water_list__2
    /* 002A2B18 */ .space 0x04

glabel water_info__2
    /* 002A2B1C */ .space 0x04

glabel old_parts$1125
    /* 002A2B20 */ .space 0x04

glabel init$1126
    /* 002A2B24 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2B25
    /* 002A2B25 */ .space 0x03

glabel WaterLevel
    /* 002A2B28 */ .space 0x04

glabel GroundLevel
    /* 002A2B2C */ .space 0x04

glabel UkiGroundLevel
    /* 002A2B30 */ .space 0x04

glabel HookGroundLevel
    /* 002A2B34 */ .space 0x04

glabel LineGroundLevel
    /* 002A2B38 */ .space 0x04

glabel EsaFrame
    /* 002A2B3C */ .space 0x04

glabel esa_type
    /* 002A2B40 */ .space 0x04

glabel HookFrame
    /* 002A2B44 */ .space 0x04

glabel UkiFrame
    /* 002A2B48 */ .space 0x04

glabel fishing_texb
    /* 002A2B4C */ .space 0x04

glabel fish_texb
    /* 002A2B50 */ .space 0x04

glabel esa_texb
    /* 002A2B54 */ .space 0x04

glabel Fish
    /* 002A2B58 */ .space 0x04

glabel AngleFish
    /* 002A2B5C */ .space 0x04

glabel BattleFish
    /* 002A2B60 */ .space 0x04

glabel FishNum
    /* 002A2B64 */ .space 0x04

glabel cpoly
    /* 002A2B68 */ .space 0x04

glabel cpoly_num
    /* 002A2B6C */ .space 0x04

glabel set_hook_pos
    /* 002A2B70 */ .space 0x04

glabel set_uki_pos
    /* 002A2B74 */ .space 0x04

glabel pull_hook
    /* 002A2B78 */ .space 0x04

glabel msg_cnt$1151
    /* 002A2B7C */ .space 0x04

glabel init$1152
    /* 002A2B80 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2B81
    /* 002A2B81 */ .space 0x03

glabel WaterWaveLingWait
    /* 002A2B84 */ .space 0x04

glabel healingSpeed
    /* 002A2B88 */ .space 0x04

glabel healingSpeed_flg
    /* 002A2B8C */ .space 0x04

glabel statusAlarmRate
    /* 002A2B90 */ .space 0x04

glabel statusAlarmCounter
    /* 002A2B94 */ .space 0x04

glabel statusRGBColor_life
    /* 002A2B98 */ .space 0x04

glabel statusRGBColor_weapon
    /* 002A2B9C */ .space 0x04

glabel statusRGBColor_30
    /* 002A2BA0 */ .space 0x04

glabel statusRGBColor_15
    /* 002A2BA4 */ .space 0x04

glabel statusRGBColor_life_2
    /* 002A2BA8 */ .space 0x04

glabel statusRGBColor_weapon_2
    /* 002A2BAC */ .space 0x04

glabel statusRGBColor_30_2
    /* 002A2BB0 */ .space 0x04

glabel statusRGBColor_15_2
    /* 002A2BB4 */ .space 0x04

glabel popupYRate$864
    /* 002A2BB8 */ .space 0x04

glabel init$865
    /* 002A2BBC */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2BBD
    /* 002A2BBD */ .space 0x03

glabel popupRGBRate$869
    /* 002A2BC0 */ .space 0x04

glabel init$870
    /* 002A2BC4 */ .space 0x01

/* Automatically generated and unreferenced pad */
glabel D_002A2BC5
    /* 002A2BC5 */ .space 0x03

glabel poison_counter
    /* 002A2BC8 */ .space 0x04

glabel BtCfgFlag
    /* 002A2BCC */ .space 0x04

glabel BtSteebMsgNo
    /* 002A2BD0 */ .space 0x04

glabel DebugInfoNowCursor
    /* 002A2BD4 */ .space 0x04

glabel BtBattleMusic_Flag
    /* 002A2BD8 */ .space 0x04

glabel BtBattleMusic_Wait
    /* 002A2BDC */ .space 0x04

glabel BtBattleMusic_Vol
    /* 002A2BE0 */ .space 0x04

glabel BtMapJumpFloor
    /* 002A2BE4 */ .space 0x04

glabel BtLoadMapType
    /* 002A2BE8 */ .space 0x04

