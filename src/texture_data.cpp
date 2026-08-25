#include "texture.hpp"

#include "dataalloc.hpp"

/**
 * Supplies the main texture-loading allocation arena.
 */
CDataAlloc2<1> TextureData;

/**
 * Manages the game's loaded textures.
 */
CTextureManager TexManager;
