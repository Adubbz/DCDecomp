#pragma once

/**
 * Buffers and draws the map editor's debug-text overlay.
 */
class CDebugFont {
public:
    /**
     * Draws the buffered debug text.
     *
     * @mangled Draw__10CDebugFontFv
     */
    void Draw();

    int x;          /**< Horizontal origin of the overlay. */
    int y;          /**< Vertical origin of the overlay. */
    int w;          /**< Width of the overlay texture. */
    int h;          /**< Height of the overlay texture. */
    char *texture;  /**< Name of the glyph texture. */
    int alpha;      /**< Alpha used to composite the glyph texture. */
    int len;        /**< Number of occupied bytes in the text buffer. */
    char text[512]; /**< Buffered text awaiting display. */
};
