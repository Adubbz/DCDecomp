#pragma once

#include "common.h"

#include <libgraph.h>

typedef int TextureHandle;

struct i {
    u8 r;
    u8 g;
    u8 b;
    u8 a;
};

class CTexture {
    private:
        s16 m_handle;
        s16 m_width;
        s16 m_height;
        u16 m_bytes_per_pixel;
        char m_name[32];
    public:
        sceGsTex0 m_tex0; /**< The register the texture draws through. */
    private:
        u64 m_tex1;
        u8 *m_mip_data[4];
        i *m_converted_data;
        u32 m_is_converted;
    public:
        CTexture();
        void Initialize();
};
STATIC_ASSERT(sizeof(CTexture) == 0x50);

class CTextureBlock {
    private:
        char m_name[32];
        int m_gs_reserved_end_addr;
        int m_gs_texture_end_addr;
        u32 m_is_fully_loaded;
        u32 m_is_extended;
        int m_gs_reserved_start_addr;
        i *m_texture_buffer_start;
        i *m_texture_buffer_end;
    public:
        CTextureBlock();
        void Initialize();
};
STATIC_ASSERT(sizeof(CTextureBlock) == 0x3C);

struct sceVif1Packet;

/**
 * Names one block of textures that a caller asks the manager to load.
 */
/**
 * Names one texture file and the block it goes into, for the calls that read
 * the files themselves rather than a pack.
 */
struct LOADTEXTURE_INFO {
    char *name;   /**< Names the texture file, or the image inside a pack. */
    s32 block_no; /**< Block that the textures go into. */
    s32 unk_08;
};

/**
 * Names one texture file and the block it goes into.
 *
 * The loading calls take an array of these and stop at the first entry with
 * no name, so a caller with one file to load passes two: the file and the
 * terminator.
 */
struct LOADTEXTURE_INFO2 {
    char *name;   /**< Names the texture file, or the image inside a pack. */
    s32 block_no; /**< Block that the textures go into. */
    s32 unk_08;
};

class CTextureManager {
    private:
        u8 data[0x4E48];
    public:
        void Initialize(int gs_addr);
        // A size argument should also be included here, however it seems L5 had a mismatch between the header and implementation.
        void SetBuffer(i *buffer); 
        TextureHandle GetTextureHandle(char *name, TextureHandle handle);
        CTexture *GetTexture(TextureHandle handle);
        CTexture *GetTexture(char *name, TextureHandle handle);

        /**
         * @mangled DeleteTextureBlock__15CTextureManagerFi
         * @address 0x133700
         * @size 0xF0
         * @unknownret
         */
        void DeleteTextureBlock(int block_no);

        /**
         * Enters into the manager every texture an IMG file already read holds.
         *
         * @mangled EnterIMGFile__15CTextureManagerFPUciii
         * @address 0x132BA0
         * @size 0x2E4
         * @unknownret
         */
        void EnterIMGFile(unsigned char *img, int block_no, int, int);

        /**
         * Enters into the manager the fixed textures a file already read holds.
         *
         * @mangled EnterFixTextureZ__15CTextureManagerFPUc
         * @address 0x132930
         * @size 0x264
         * @unknownret
         */
        void EnterFixTextureZ(unsigned char *file);

        /**
         * Reads every texture a list names and enters it into the manager.
         *
         * @mangled EnterTextureFile__15CTextureManagerFP16LOADTEXTURE_INFO
         * @address 0x134260
         * @size 0x10
         * @unknownret
         */
        void EnterTextureFile(LOADTEXTURE_INFO *info);

        /**
         * Loads into a block the textures a pack already read holds.
         *
         * @mangled LoadTextureBlock__15CTextureManagerFiPUi
         * @address 0x133D30
         * @size 0x28
         * @unknownret
         */
        void LoadTextureBlock(int block_no, unsigned int *pack);

        /**
         * Frees every texture buffer that no block still holds.
         *
         * @mangled CleanUpBuffer__15CTextureManagerFv
         * @address 0x1337F0
         * @size 0x268
         * @unknownret
         */
        void CleanUpBuffer(void);

        /**
         * Drops the entries of the texture list that no block still holds.
         *
         * @mangled CleanUpTextureList__15CTextureManagerFv
         * @address 0x133A60
         * @size 0xE4
         * @unknownret
         */
        void CleanUpTextureList(void);

        /**
         * Prints how much of each texture buffer is in use.
         *
         * @mangled print_buff_info__15CTextureManagerFv
         * @address 0x134750
         * @size 0x8
         * @unknownret
         */
        void print_buff_info(void);

        /**
         * Loads a list of textures into a block, replacing what is there.
         *
         * @mangled LoadTextureBlock__15CTextureManagerFiP17LOADTEXTURE_INFO2
         * @address 0x133F20
         * @size 0x194
         * @unknownret
         */
        void LoadTextureBlock(int block_no, LOADTEXTURE_INFO2 *info);

        /**
         * @mangled LoadTextureBlockEX__15CTextureManagerFiP17LOADTEXTURE_INFO2
         * @address 0x1340C0
         * @size 0x1A0
         * @unknownret
         */
        void LoadTextureBlockEX(int block_no, LOADTEXTURE_INFO2 *info);

        /**
         * @mangled ReloadTexture__15CTextureManagerFP13sceVif1Packeti
         * @address 0x133070
         * @size 0x1C0
         * @unknownret
         */
        void ReloadTexture(sceVif1Packet *packet, int handle);
    private:
        TextureHandle SearchTextureName(char *name, TextureHandle handle);
        CTexture *SearchTexture(char *name);
};
STATIC_ASSERT(sizeof(CTextureManager) == 0x4E48);

/**
 * Manages the game's loaded textures.
 *
 * @address 0x1C75870
 * @size 0x4E48
 */
extern CTextureManager TexManager;
