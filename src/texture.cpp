#include "texture.hpp"

/* @ 0x130EF0 (0x30 bytes) -- __ct__8CTextureFv */
CTexture::CTexture() {
    this->Initialize();
}

/* @ 0x130F20 (0x40 bytes) -- Initialize__8CTextureFv */
void CTexture::Initialize() {
    m_name[0] = 0;
    m_handle = 0;
    m_mip_data[3] = 0;
    m_mip_data[2] = 0;
    m_mip_data[1] = 0;
    m_mip_data[0] = 0;
    m_converted_data = 0;
    m_tex1 = 0;
    m_tex0 = 0;
    m_bytes_per_pixel = 0;
    m_height = 0;
    m_width = 0;
    m_is_converted = 0;
}

/* @ 0x130F60 (0x30 bytes) -- __ct__13CTextureBlockFv */
CTextureBlock::CTextureBlock() {
    this->Initialize();
}

/* @ 0x130F90 (0x30 bytes) -- Initialize__13CTextureBlockFv */
void CTextureBlock::Initialize() {
    m_name[0] = 0;
    m_gs_texture_end_addr = 0;
    m_gs_reserved_end_addr = 0;
    m_gs_reserved_start_addr = 0;
    m_texture_buffer_end = 0;
    m_texture_buffer_start = 0;
    m_is_fully_loaded = 0;
    m_is_extended = 0;
}

/* Retail `TextureData` (main.bss, 0x10 bytes, immediately before `WaterData`).
 * Field layout unconfirmed, so migrated as a same-sized placeholder array. */
char TextureData[0x10];

INCLUDE_ASM("asm/nonmatchings/texture", Initialize__15CTextureManagerFi);
INCLUDE_RODATA("asm/nonmatchings/texture", LIT_221);
INCLUDE_ASM("asm/nonmatchings/texture", SetBuffer__15CTextureManagerFP1i);
INCLUDE_ASM("asm/nonmatchings/texture", SearchTextureName__15CTextureManagerFPci);
INCLUDE_ASM("asm/nonmatchings/texture", GetTextureHandle__15CTextureManagerFPci);
INCLUDE_ASM("asm/nonmatchings/texture", GetTexture__15CTextureManagerFi);
INCLUDE_ASM("asm/nonmatchings/texture", GetTexture__15CTextureManagerFPci);
INCLUDE_ASM("asm/nonmatchings/texture", SearchTexture__15CTextureManagerFPc);
INCLUDE_RODATA("asm/nonmatchings/texture", LIT_308);
INCLUDE_ASM("asm/nonmatchings/texture", EnterTexture__15CTextureManagerFiPcPUciiiPUciiPUcPUcPUcUli);
INCLUDE_RODATA("asm/nonmatchings/texture", LIT_408);
INCLUDE_RODATA("asm/nonmatchings/texture", LIT_409);
INCLUDE_RODATA("asm/nonmatchings/texture", LIT_410);
INCLUDE_ASM("asm/nonmatchings/texture", EnterTextureEX__15CTextureManagerFiPcPUciiiPUciiPUcPUcPUcUli);
INCLUDE_ASM("asm/nonmatchings/texture", EnterFixTexture__15CTextureManagerFPcPUciiiPUciiPUcPUcPUcUli);
INCLUDE_ASM("asm/nonmatchings/texture", EnterFixTextureZ__15CTextureManagerFPUc);
INCLUDE_ASM("asm/nonmatchings/texture", EnterIMGFile__15CTextureManagerFPUciii);
INCLUDE_RODATA("asm/nonmatchings/texture", LIT_619);
INCLUDE_ASM("asm/nonmatchings/texture", LoadImage__FPUiiiiP1iiiii);
INCLUDE_ASM("asm/nonmatchings/texture", ReloadTexture__15CTextureManagerFP13sceVif1Packeti);
INCLUDE_ASM("asm/nonmatchings/texture", BeginEnterTextureBlock__15CTextureManagerFi);
INCLUDE_ASM("asm/nonmatchings/texture", EndEnterTextureBlock__15CTextureManagerFi);
INCLUDE_RODATA("asm/nonmatchings/texture", LIT_723);
INCLUDE_ASM("asm/nonmatchings/texture", DeleteTextureBlock__15CTextureManagerFi);
INCLUDE_ASM("asm/nonmatchings/texture", CleanUpBuffer__15CTextureManagerFv);
INCLUDE_ASM("asm/nonmatchings/texture", CleanUpTextureList__15CTextureManagerFv);
INCLUDE_ASM("asm/nonmatchings/texture", GetStr__FPcPc);
INCLUDE_ASM("asm/nonmatchings/texture", GetDummyInfo__FPcPcPiPiPi);
INCLUDE_ASM("asm/nonmatchings/texture", LoadTextureBlock__15CTextureManagerFiPUi);
INCLUDE_ASM("asm/nonmatchings/texture", LoadTextureBlock__15CTextureManagerFiP16LOADTEXTURE_INFOPUi);
INCLUDE_ASM("asm/nonmatchings/texture", LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2);
INCLUDE_ASM("asm/nonmatchings/texture", LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2);
INCLUDE_ASM("asm/nonmatchings/texture", EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO);
INCLUDE_ASM("asm/nonmatchings/texture", PageConv8to32__FiiPUcPUc);
INCLUDE_ASM("asm/nonmatchings/texture", BlockConv8to32__FPUcPUc);
INCLUDE_ASM("asm/nonmatchings/texture", Conv8to32__FiiPUcPUc);
INCLUDE_ASM("asm/nonmatchings/texture", print_buff_info__15CTextureManagerFv);
