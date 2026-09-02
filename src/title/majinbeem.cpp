#pragma helper_mask_gpr 0x30

#include "title/majinbeem.hpp"

#include <cmath>

#include "camera.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"
#include "texture.hpp"

/* The tail, which is drawn where its elements already are: the head is the only element `Step`
   moves and every other one is a place the head has been. */
void CMajinBeem::Draw(CCamera *camera) {
    sceVu0FVECTOR camera_position;
    sceVu0FVECTOR position;
    int corner0[4];
    int corner1[4];
    int corner2[4];
    int corner3[4];
    sceGsAlpha alpha;
    sceGsZbuf zbuf;
    int i;

    camera->GetPos(camera_position);

    alpha = mgAlpha;
    alpha.bits.a = 0;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 1;
    MGSetGsALPHA(&alpha);

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);

    for (i = 0; i < 59; i++) {
        if (active != 1)
            continue;
        if (counters[i] < 0)
            continue;

        position[0] = positions[i][0];
        position[1] = positions[i][1];
        position[2] = positions[i][2];
        position[3] = 1.0f;

        if (MGRotTransPers3DSprite(corner0, corner1, position, sizes[i], sizes[i] / 2.0f, 0) != 1) {
            continue;
        }

        corner2[0] = corner1[0];
        corner2[1] = corner0[1];
        corner2[2] = corner0[2];
        corner2[3] = corner0[3];
        corner3[0] = corner0[0];
        corner3[1] = corner1[1];
        corner3[2] = corner1[2];
        corner3[3] = corner1[3];

        {
            CRect_i_ rect;

            rect.x = 0;
            rect.y = 0;
            rect.width = 128;
            rect.height = 128;
            set3DSprite(Vif1Packet, TexManager.GetTexture("beem", -1), rect, corner0, corner2,
                        corner3, corner1, (u_char) alphas[i]);
        }
    }

    MGSetGsALPHA(0);
    MGSetGsZBUF(0);
}

/* The head, which the caller places rather than the effect: whatever is carrying the beam hands
   its own position in every tick.
   The head is projected twice and only the depth of the second projection is kept. The second is
   the same point moved fifteen units towards the camera, so all four corners take a depth the
   thing that fired the beam cannot be in front of. */
void CMajinBeem::Draw2(CCamera *camera, float *head, float *from) {
    sceVu0FVECTOR direction;
    sceVu0FVECTOR position;
    int corner0[4];
    int corner1[4];
    int near0[4];
    int near1[4];
    int corner2[4];
    int corner3[4];
    sceGsAlpha alpha;
    sceGsZbuf zbuf;

    camera->GetPos(direction);
    direction[0] -= from[0];
    direction[1] -= from[1];
    direction[2] -= from[2];
    sceVu0Normalize(direction, direction);
    direction[0] *= 15.0f;
    direction[1] *= 15.0f;
    direction[2] *= 15.0f;

    alpha = mgAlpha;
    alpha.bits.a = 0;
    alpha.bits.b = 2;
    alpha.bits.c = 0;
    alpha.bits.d = 1;
    MGSetGsALPHA(&alpha);

    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;
    MGSetGsZBUF(&zbuf);

    if (alphas[59] > 0.0f) {
        alphas[59] -= 1.0f;
        sizes[59] -= 0.25f;
        sceVu0CopyVector(positions[59], head);

        position[0] = positions[59][0];
        position[1] = positions[59][1];
        position[2] = positions[59][2];
        position[3] = 1.0f;

        if (MGRotTransPers3DSprite(corner0, corner1, position, sizes[59], sizes[59] / 2.0f, 0) == 1) {
            CRect_i_ rect;

            corner2[0] = corner1[0];
            corner2[1] = corner0[1];
            corner2[2] = corner0[2];
            corner2[3] = corner0[3];
            corner3[0] = corner0[0];
            corner3[1] = corner1[1];
            corner3[2] = corner1[2];
            corner3[3] = corner1[3];

            position[0] += direction[0];
            position[1] += direction[1];
            position[2] += direction[2];

            if (MGRotTransPers3DSprite(near0, near1, position, sizes[59], sizes[59] / 2.0f, 0) == 1) {
                corner1[2] = near0[2];
                corner3[2] = near0[2];
                corner0[2] = near0[2];
                corner2[2] = near0[2];
            }

            rect.x = 0;
            rect.y = 0;
            rect.width = 128;
            rect.height = 128;
            set3DSprite(Vif1Packet, TexManager.GetTexture("beem", -1), rect, corner0, corner2,
                        corner3, corner1, (u_char) alphas[59]);
        }
    }

    MGSetGsALPHA(0);
    MGSetGsZBUF(0);
}

/* The whole path is fixed on the first tick: the two angles from the head's starting point to the
   target are taken once and nothing steers afterwards, so the beam is straight. */
void CMajinBeem::Step() {
    int i;
    int j;

    switch (state) {
        case 0:
            pitch = atan2f(target[0] - positions[0][0], target[1] - positions[0][1]);
            yaw = atan2f(target[0] - positions[0][0], target[2] - positions[0][2]);
            state++;
            break;

        case 1:
            for (i = 0; i < 3; i++) {
                for (j = 0; j < 58; j++) {
                    sceVu0CopyVector(positions[58 - j], positions[57 - j]);
                    counters[j]++;
                }

                positions[0][1] += speed / 3.0f * cos(pitch);
                positions[0][0] += speed / 3.0f * sin(yaw);
                positions[0][2] += speed / 3.0f * cos(yaw);
            }

            if (counters[58] >= 200)
                active = 0;
            break;
    }
}
