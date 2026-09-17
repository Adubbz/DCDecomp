#include "motionmodel.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "btmisc.hpp"
#include "dataread.hpp"
#include "frame.hpp"
#include "mglib.hpp"

#ifdef NON_MATCHING
/* The attribute bit each weapon element hits with; the last entry is what an
 * element outside the table gets. */
static int element_tbl[6] = {1, 2, 4, 8, 0x10, 0};
#endif

#ifdef NON_MATCHING
int GetWeaponElementAttr(int element) {
    if (element < 0 || element >= 6) {
        element = 5;
    }
    return element_tbl[element];
}
#else
INCLUDE_ASM("asm/nonmatchings/motionmodel", GetWeaponElementAttr__Fi);
#endif
#ifdef NON_MATCHING
void CMotionModel::LoadPack(unsigned int *pack, char *base_name, CDataAlloc2<1> *model_arena,
                            CDataAlloc2<1> *motion_arena, MOTION_INFO *motion_info,
                            int initialize_frames) {
    char model_name[64];
    char bone_name[64];
    char motion_name[64];
    char weight_name[76];
    int model_size;

    strcpy(model_name, base_name);
    strcpy(bone_name, base_name);
    strcpy(motion_name, base_name);
    strcpy(weight_name, base_name);
    strcat(model_name, ".mds");
    strcat(bone_name, ".bbp");
    strcat(motion_name, ".mot");
    strcat(weight_name, ".wgt");

    int model_flags = initialize_frames != 0 ? 6 : 0;
    unsigned int *model_data = GetPackFile(pack, model_name, &model_size);
    if (model_data == NULL) {
        printf("Model NotFound!! %s\n", model_name);
        exit__2(-1);
    }
    frame = (CFrame *) LoadMDSFile(model_data, model_arena, model_flags, NULL, NULL);
    printf("pack = %s\n", model_name);

    MOTION_FILE_INFO files[3];
    files[0].name = bone_name;
    files[1].name = motion_name;
    files[2].name = weight_name;
    files[0].data = GetPackFile(pack, bone_name, &files[0].size);
    files[1].data = GetPackFile(pack, motion_name, &files[1].size);
    files[2].data = GetPackFile(pack, weight_name, &files[2].size);
    if (files[0].size == 0) {
        files[0].name = NULL;
    }
    if (files[1].size == 0) {
        files[1].name = NULL;
    }
    if (files[2].size == 0) {
        files[2].name = NULL;
    }

    CreateAnimeDataEX(&motion, motion_arena, files);
    if (initialize_frames != 0) {
        AnimeDataInit(frame, &motion, model_arena, &motion.frame_info);
    }
    motion.motion_info = motion_info;
    motion.state.time = (float) motion_info->start;
    motion.state.blend_step = 1.0f;
    motion.state.motion_no = 0;
    motion.state.playing_no = 0;
    motion.state.blending = 0;
    current_motion = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/motionmodel", LoadPack__12CMotionModelFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P11MOTION_INFOi);
#endif
INCLUDE_RODATA("asm/nonmatchings/motionmodel", @864);
INCLUDE_RODATA("asm/nonmatchings/motionmodel", @865);
INCLUDE_RODATA("asm/nonmatchings/motionmodel", @866);
INCLUDE_RODATA("asm/nonmatchings/motionmodel", @867);
INCLUDE_RODATA("asm/nonmatchings/motionmodel", @868);
#ifdef NON_MATCHING
void CMotionModel::Step(void) {
    motion.state.motion_no = current_motion;
    if (motion.state.motion_no != motion.state.playing_no) {
        motion.state.next_frame = motion.motion_info[current_motion].start;
    }
    SetMotionEX(frame, &motion, motion.motion_info, &motion.state, motion.frame_info);
}
#else
INCLUDE_ASM("asm/nonmatchings/motionmodel", Step__12CMotionModelFv);
#endif
#ifdef NON_MATCHING
void CMotionModel::Draw(void) {
    if (frame != NULL) {
        MGDraw(frame);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/motionmodel", Draw__12CMotionModelFv);
#endif
