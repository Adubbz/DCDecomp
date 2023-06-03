#include "texture.hpp"

CTexture::CTexture() {
    this->Initialize();
}

void CTexture::Initialize() {
    /* Initialize members. */
    m_name[0] = NULL;
    m_handle = 0;
    m_mip_data[3] = NULL;
    m_mip_data[2] = NULL;
    m_mip_data[1] = NULL;
    m_mip_data[0] = NULL;
    m_converted_data = NULL;
    m_tex1 = 0;
    m_tex0 = 0;
    m_bytes_per_pixel = 0;
    m_height = 0;
    m_width = 0;
    m_is_converted = 0;
}

CTextureBlock::CTextureBlock() {
    this->Initialize();
}

void CTextureBlock::Initialize() {
    /* Initialize members. */
    m_name[0] = NULL;
    m_gs_texture_end_addr = 0;
    m_gs_reserved_end_addr = 0;
    m_gs_reserved_start_addr = 0;
    m_texture_buffer_end = 0;
    m_texture_buffer_start = 0;
    m_is_fully_loaded = false;
    m_is_extended = false;
}