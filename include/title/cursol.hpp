#pragma once

#include "common.h"

/**
 *          Controls selection and easing for the title menu cursor.
 */
class CCursol {
public:
    /**
     *          Constructs a cursor in its initial menu state.
     *
     * @mangled __ct__7CCursolFv
     * @address 0x1DD4CC0
     * @size 0x30
     */
    CCursol(void);

    /**
     *          Resets the cursor selection and animation state.
     *
     * @mangled Init__7CCursolFv
     * @address 0x1DD4CF0
     * @size 0x30
     * @unknownret
     */
    void Init(void);

    /**
     *          Processes input and advances cursor movement.
     *
     * @mangled Move__7CCursolFv
     * @address 0x1DD4D20
     * @size 0x390
     * @unknownret
     */
    int Move(void);

    /**
     *          Sets the cursor's target vertical position.
     *
     * @mangled Set__7CCursolFf
     * @address 0x1DD50B0
     * @size 0x10
     * @unknownret
     */
    void Set(float);

    /**
     *          Returns the currently selected menu row.
     *
     * @mangled GetSelect__7CCursolFv
     * @address 0x1DD50C0
     * @size 0x10
     * @unknownret
     */
    int GetSelect(void);

    /**
     *          Returns the cursor's current display position.
     *
     * @mangled GetPos__7CCursolFv
     * @address 0x1DD50D0
     * @size 0x30
     * @unknownret
     */
    int GetPos(void);

    float y;        /**< Height the cursor has eased to. */
    float target_y; /**< Height the cursor is easing towards. */
    int alpha[5];   /**< Opacity of each menu row. */
    int select;     /**< Row the cursor stands on. */
    char arrived;   /**< Whether the cursor has reached its target. */
};
