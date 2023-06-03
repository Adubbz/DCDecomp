#include "texture.hpp"

CTexture::CTexture() {
    this->Initialize();
}

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

CTextureBlock::CTextureBlock() {
    this->Initialize();
}

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