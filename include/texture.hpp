#pragma once

#include "common.h"

#include <libgraph.h>

class sceVif1Packet;
class CTexture;
struct TM2_head;

struct IMG_head {
    char tag[4];    /**< IMG file signature. */
    u_int pictures; /**< Number of image entries in the file. */
    u_int reserved[2];
};

struct IMG_entry {
    char name[32]; /**< Null-terminated texture name. */
    u_int offset;  /**< Byte offset of the texture data. */
    u_int reserved[3];
};

void SetTextureInfo(CTexture *texture, char *name, TM2_head *head);
void SetTextureInfo(CTexture *texture, char *name, u_char *buffer);

/* One texture file a block is built from, as the tables handed to EnterTextureFile hold them.
   LoadTextureBlock walks a table from the front for each block in turn and stops at the first
   entry whose name is null or empty, so a table states its own end rather than its length; the
   third field is carried into EnterIMGFile unread by anything reconstructed. */
struct LOADTEXTURE_INFO {
    char *name;   /**< Texture file or synthetic frame-buffer specification. */
    int block_no; /**< Destination texture block. */
    int unk_08;
};

/* The same three fields for the block loaders that take an image already in memory. The first
   field is spelled as a name because that is what the loaders read it as — they compare its first
   character and hand it to the archive reader — and a caller with pixels rather than a file name
   casts on the way in. */
struct LOADTEXTURE_INFO2 {
    char *name;   /**< Texture file or synthetic frame-buffer specification. */
    int block_no; /**< Destination texture block. */
    int unk_08;
};

/* One texture the registry hands out: the name it answers to, the block that owns it, the `TEX0`
   and `TEX1` already assembled for it, and where each of its four mip levels and its palette were
   copied. A block number of -1 marks a texture no block owns, which is what the registry's own
   entry at index zero and every fixed texture carry. */
class CTexture {
public:
    CTexture();
    void Initialize();

    short block;     /**< Texture block containing this texture. */
    short width;     /**< Texture width in pixels. */
    short height;    /**< Texture height in pixels. */
    short bpp;       /**< Bits per pixel. */
    char name[32];   /**< Null-terminated texture name. */
    u_long tex0;     /**< GS TEX0 register value. */
    u_long tex1;     /**< GS TEX1 register value. */
    u_int *image[4]; /**< Image data for each stored mip level. */
    u_int *clut;     /**< Colour lookup table data. */
    int swizzled;    /**< Whether image data uses GS swizzled ordering. */
};

/* One of the seventy-two texture blocks: the run of video memory its textures were given, the run
   of the registry's buffer their pixels were copied into, and how far another block has since
   written over the first. `vram_end` is where the next texture entered into the block goes and
   `vram_top` is where one entered without pixels goes, which is why the two move apart. */
class CTextureBlock {
public:
    CTextureBlock();
    void Initialize();

    char name[32];         /**< Null-terminated block name. */
    int vram_top;          /**< First VRAM address assigned to the block. */
    int vram_end;          /**< Address immediately after the block's VRAM range. */
    int loaded;            /**< Whether the block has been uploaded. */
    int extend;            /**< Whether the block uses extended allocation. */
    int vram_dirty;        /**< Whether the VRAM copy requires reloading. */
    u_long128 *buffer;     /**< Start of the source image buffer. */
    u_long128 *buffer_end; /**< End of the source image buffer. */
};

/* The registry itself, of which the game keeps exactly one. Seventy-two blocks and a hundred and
   ninety-six textures, all of them constructed at start-up, over one buffer taken whole from
   `TextureData` at Initialize. Video memory is handed out from the bottom for the blocks and from
   `vram_fix` downwards for the fixed textures, and the two meeting is the error every entry
   point checks for. */
class CTextureManager {
public:
    CTextureManager() { Initialize(16352); }

    void Initialize(int size);
    void SetBuffer(u_long128 *buffer, int size);
    int SearchTextureName(char *name, int block);
    int GetTextureHandle(char *name, int block);
    CTexture *GetTexture(int handle);
    CTexture *GetTexture(char *name, int block);
    CTexture *SearchTexture(char *name);
    void EnterTexture(int block, char *name, u_char *image, int width, int height, int bpp,
                      u_char *clut, int clut_colors, int mipmap, u_char *mip1, u_char *mip2,
                      u_char *mip3, u_long tex1, int swizzled);
    void EnterTextureEX(int block, char *name, u_char *image, int width, int height, int bpp,
                        u_char *clut, int clut_colors, int mipmap, u_char *mip1, u_char *mip2,
                        u_char *mip3, u_long tex1, int swizzled);
    void EnterFixTexture(char *name, u_char *image, int width, int height, int bpp, u_char *clut,
                         int clut_colors, int mipmap, u_char *mip1, u_char *mip2, u_char *mip3,
                         u_long tex1, int swizzled);
    void EnterFixTextureZ(u_char *buffer);
    void EnterIMGFile(u_char *buffer, int block, int mipmap, int extend);
    void ReloadTexture(sceVif1Packet *packet, int block);
    void BeginEnterTextureBlock(int block);
    void EndEnterTextureBlock(int block);
    int DeleteTextureBlock(int block);
    int CleanUpBuffer();
    int CleanUpTextureList();
    int LoadTextureBlock(int block, u_int *buffer);
    int LoadTextureBlock(int block, LOADTEXTURE_INFO *table, u_int *buffer);
    int LoadTextureBlock(int block, LOADTEXTURE_INFO2 *table);
    int LoadTextureBlockEX(int block, LOADTEXTURE_INFO2 *table);
    int EnterTextureFile(LOADTEXTURE_INFO *table);
    void print_buff_info();

    int texture_max;          /**< Number of occupied texture records. */
    int vram_work;            /**< Next working VRAM allocation address. */
    int vram_size;            /**< Size of the managed VRAM range. */
    int last_block;           /**< Most recently selected texture block. */
    int vram_max;             /**< Upper bound of working VRAM allocation. */
    int vram_fix;             /**< Boundary of fixed VRAM allocation. */
    CTextureBlock blocks[72]; /**< Managed texture blocks. */
    CTexture textures[196];   /**< Registered textures. */
    u_long128 *buffer;        /**< Texture staging buffer. */
    int buffer_used;          /**< Occupied staging-buffer quadwords. */
    int buffer_size;          /**< Available staging-buffer quadwords. */
    LOADTEXTURE_INFO *file;   /**< Texture load table currently being processed. */
};

extern CTextureManager TexManager;
