#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 440

#include "title/script.hpp"

#include <cstdlib>
#include <cstring>

#include "dataread.hpp"

/* The command table the parser matches a line against, in the order it matches them: a name is
   compared by the length the row carries rather than by its own, so a name that is another's prefix
   has to stand in front of it ([title-script.md](../../docs/formats/title-script.md)). */
CSCRIPT_COMMAND Command[26] = {
    {"OBJ_MOTION2", 11, 3, {2, 1, 1}},
    {"OBJ_MOTION", 10, 3, {2, 1, 0}},
    {"OBJ_MOVE", 8, 2, {2, 1}},
    {"OBJ_TALK", 8, 7, {2, 1, 1, 1, 1, 1, 1}},
    {"OBJ_EYE", 7, 3, {2, 1, 1}},
    {"OBJ_MOUTH", 9, 3, {2, 1, 1}},
    {"OBJ_DISP", 8, 2, {2, 1}},
    {"OBJ_STEP", 8, 2, {2, 1}},
    {"CAMERA", 6, 4, {2, 1, 1, 1}},
    {"SE_STOP", 7, 3, {2, 1, 1}},
    {"SE", 2, 4, {2, 1, 1, 1}},
    {"SOUND_FADE", 10, 3, {2, 1, 1}},
    {"FADE_IN", 7, 2, {2, 1}},
    {"FADE_OUT", 8, 2, {2, 1}},
    {"MESSAGE", 7, 6, {2, 1, 1, 1, 1, 1}},
    {"NEXT_MES", 8, 1, {2}},
    {"MES_CLR", 7, 0, {0}},
    {"LOAD_OBJ", 8, 2, {2, 1}},
    {"SPRITE", 6, 1, {2}},
    {"BOM", 3, 4, {2, 1, 1, 1}},
    {"BEEM", 4, 6, {2, 1, 1, 1, 1, 1}},
    {"SCENE_LOAD", 10, 1, {2}},
    {"SCENE", 5, 1, {2}},
    {"END", 3, 0, {0}},
    {"WAIT_KEY", 8, 1, {2}},
    {"WAIT", 4, 1, {2}},
};

/* The one script the overlay runs. It is 58112 bytes because the file is held whole inside it and
   re-parsed from the cursor every tick. */
class CScript CScript__2;

/* Read the whole script in and put every actor back to a state nothing has asked anything of yet.
   Nothing is reset when the load fails, so a missing file leaves the previous script's state
   standing rather than an empty one. */
void CScript::Load(const char *name) {
    int i;

    p = data;

    if (LoadFile((char *) name, p, &size)) {
        wait = 0;
        mes_no = 0;
        mes_page_wait = 40;
        pos = 0;
        camera_start = -1;
        camera_no = -1;
        fade = 0;
        sprite = 0;
        end = 0;
        scene = 0;
        load_no = -1;
        mes_wait = 0;
        bom_no = 0;
        beem_no = 0;
        reset_flag = 0;
        se_no = 0;
        se_voice = 0;
        se_stop = 0;
        bgm_fade = 0;

        for (i = 0; i < 128; i++)
            arg[i] = 0;

        for (i = 0; i < 23; i++) {
            obj[i].disp = 1;
            obj[i].motion = 0;
            obj[i].motion_end = -1;
            obj[i].move = 0;
            obj[i].move_req = 0;
            obj[i].eye = 0;
            obj[i].eye_time = 0;
            obj[i].mouth = 0;
            obj[i].mouth_time = 0;
            obj[i].talk = 0;
            obj[i].load = -1;
            obj[i].load_step = -1;
            obj[i].step = 0.05f;
        }
    }
}

/* One tick of the script: nothing happens while the wait is still running, and when it runs out
   the parser reads one command after another out of the text until it reaches one that ends the
   tick. A line matching no row is fatal - there is no way to skip it, because nothing in the format
   says where a line ends. */
void CScript::Step() {
    bool unmatched;
    bool done;
    int i;

    if (this->end)
        return;

    if (mes_wait)
        wait = 1.0f + motion_step;

    if (wait < 1.0f) {
        done = false;
        pos = SkipSpace(p, pos);

        do {
            unmatched = true;

            for (i = 0; i < 26; i++) {
                if (memcmp(&p[pos], Command[i].name, Command[i].length) == 0) {
                    unmatched = false;
                    pos = SkipSpace(p, pos + Command[i].length);
                    pos = CheckScript(p, pos, &Command[i], i);

                    if (pos != -1) {
                        if (i == 23 || i == 24 || i == 25)
                            done = true;
                    }
                    break;
                }
            }

            if (unmatched)
                exit__2(-1);
        } while (!done);
    } else {
        wait = wait - motion_step;
    }
}

/* One command, once its arguments have been read: every case is a write into the object and
   nothing acts on it here, so a command is a request the overlay's own per-tick code picks up
   ([title-script.md](../../docs/formats/title-script.md)). */
#ifdef PAL
INCLUDE_ASM("asm/pal/nonmatchings/title/script", CheckScript__7CScriptFPciP15CSCRIPT_COMMANDi);
/* Retail's data for the function the marker above supplies. */
unsigned int pal_at337__3[26] __attribute__((aligned(16))) __attribute__((section(".rodata"))) = {
    0x01DC4474, 0x01DC450C, 0x01DC4590, 0x01DC4614, 0x01DC472C, 0x01DC47BC, 0x01DC484C,
    0x01DC48E8, 0x01DC492C, 0x01DC49A4, 0x01DC49FC, 0x01DC4A64, 0x01DC4AB4, 0x01DC4B08,
    0x01DC4B5C, 0x01DC4BF4, 0x01DC4C14, 0x01DC4C20, 0x01DC4CA0, 0x01DC4CC8, 0x01DC4D68,
    0x01DC4E7C, 0x01DC4E9C, 0x01DC4F2C, 0x01DC4EFC, 0x01DC4ED4,
};
#pragma name_counter 559
#else
int CScript::CheckScript(char *buffer, int position, CSCRIPT_COMMAND *command, int command_no) {
    int cursor;

    cursor = position;

    if (command->arg_count)
        cursor = CheckArg(buffer, cursor, command);

    switch (command_no) {
        case 0:
            obj[(int) arg[0]].motion = (int) arg[1];
            obj[(int) arg[0]].motion_end = (int) arg[2];
            break;

        case 1:
            obj[(int) arg[0]].motion = (int) arg[1];
            obj[(int) arg[0]].motion_end = -1;
            break;

        case 2:
            obj[(int) arg[0]].move = (int) arg[1];
            obj[(int) arg[0]].move_req = 1;
            break;

        case 3:
            obj[(int) arg[0]].talk = 1;
            mes_no = (int) arg[1];
            mes_timer = arg[2];
            obj[(int) arg[0]].mouth_time = arg[2];
            mes_x = (int) arg[3];
            mes_y = (int) arg[4];
            mes_talker = (int) arg[0];
            mes_tail_x = (int) arg[5];
            mes_tail_y = (int) arg[6];
            break;

        case 4:
            obj[(int) arg[0]].eye = (char) arg[1];
            obj[(int) arg[0]].eye_time = arg[2];
            break;

        case 5:
            obj[(int) arg[0]].mouth = (char) arg[1];
            obj[(int) arg[0]].mouth_time = arg[2];
            break;

        case 6:
            if (arg[1] == 1.0f) {
                obj[(int) arg[0]].disp = 1;
            } else {
                obj[(int) arg[0]].disp = 0;
            }
            break;

        case 7:
            obj[(int) arg[0]].step = arg[1];
            break;

        case 8:
            camera_no = camera_start;
            camera_start = (int) arg[0];
            motion_start = (int) arg[1];
            motion_end = (int) arg[2];
            motion_step = arg[3];
            motion_req = 1;
            break;

        case 9:
            se_kind = (int) arg[0];
            se_no = (int) arg[1];
            se_voice = (int) arg[2];
            se_stop = 1;
            break;

        case 10:
            se_kind = (int) arg[0];
            se_no = (int) arg[1];
            se_voice = (int) arg[2];
            se_fade_time = (int) arg[3];
            break;

        case 11:
            se_kind = (int) arg[0];
            se_fade_time = (int) arg[1];
            bgm_fade = (int) arg[2];
            break;

        case 12:
            if (arg[0] == 0.0f) {
                fade = 1;
            } else {
                fade = 3;
            }
            fade_speed = arg[1];
            break;

        case 13:
            if (arg[0] == 0.0f) {
                fade = 2;
            } else {
                fade = 4;
            }
            fade_speed = arg[1];
            break;

        case 14:
            mes_no = (int) arg[0];
            mes_timer = arg[1];
            mes_x = (int) arg[2];
            mes_y = (int) arg[3];
            mes_talker = -1;
            mes_tail_x = (int) arg[4];
            mes_tail_y = (int) arg[5];
            break;

        case 15:
            mes_page_wait = (int) arg[0];
            break;

        case 16:
            mes_no = 0;
            break;

        case 17:
            obj[(int) arg[1]].load = (int) arg[0];
            obj[(int) arg[1]].load_step = 0;
            break;

        case 18:
            sprite = (char) arg[0];
            break;

        case 19:
            bom_no++;
            if (bom_no > 2)
                bom_no = 0;
            bom_pos[bom_no][0] = arg[0];
            bom_pos[bom_no][1] = arg[1];
            bom_pos[bom_no][2] = arg[2];
            bom_size[bom_no] = arg[3];
            bom_req = 1;
            break;

        case 20:
            beem_no++;
            if (beem_no > 2)
                beem_no = 0;
            if (arg[0] == -1.0f) {
                beem_end = 1;
            } else {
                beem_end = 0;
                beem_from[beem_no][0] = arg[0];
                beem_from[beem_no][1] = arg[1];
                beem_from[beem_no][2] = arg[2];
                beem_to[beem_no][0] = arg[3];
                beem_to[beem_no][1] = arg[4];
                beem_to[beem_no][2] = arg[5];
            }
            beem_req = 1;
            break;

        case 21:
            load_no = (int) arg[0];
            break;

        case 22:
            scene = (int) arg[0];
            init_no = (int) arg[0];
            break;

        case 25:
            wait = arg[0] - 1.0f;
            break;

        case 24:
            mes_wait = (int) (1.0f + arg[0]);
            break;

        case 23:
            end = 1;
            break;
    }

    return cursor;
}
#endif

/* One command's arguments. Both kinds read the same three forms and differ only in what stands
   before them: a kind-1 argument must be preceded by a comma and a kind-2 one stands where it is.
   Anything the three forms do not cover hands back -1, which the caller stores and then parses
   from ([title-script.md](../../docs/formats/title-script.md)). */
int CScript::CheckArg(char *buffer, int position, CSCRIPT_COMMAND *command) {
    int cursor;
    int i;
    int digit_count;
    int accepted;

    cursor = position;

    for (i = 0; i < command->arg_count; i++) {
        switch (command->arg_type[i]) {
            case 1:
                if (buffer[cursor] != ',')
                    return -1;

                cursor = SkipSpace(buffer, cursor + 1);
                if (memcmp(&buffer[cursor], "ON", 2) == 0) {
                    arg[i] = 1.0f;
                    cursor += 2;
                } else if (memcmp(&buffer[cursor], "OFF", 3) == 0) {
                    arg[i] = 0;
                    cursor += 3;
                } else {
                    accepted = 0;
                    if (buffer[cursor] == '-')
                        accepted = 1;
                    if (buffer[cursor] >= '0' && buffer[cursor] <= '9')
                        accepted = 1;
                    if (!accepted)
                        return -1;

                    arg[i] = (float) atof(&buffer[cursor]);

                    for (digit_count = 0; digit_count < 32; digit_count++) {
                        accepted = 0;
                        if (buffer[cursor] == '-') {
                            cursor++;
                            accepted = 1;
                        }
                        if (buffer[cursor] >= '0' && buffer[cursor] <= '9') {
                            cursor++;
                            accepted = 1;
                        }
                        if (buffer[cursor] == '.') {
                            cursor++;
                            accepted = 1;
                        }
                        if (!accepted)
                            break;
                    }

                    if (digit_count == 32)
                        return -1;
                }

                cursor = SkipSpace(buffer, cursor);
                break;

            case 2:
                if (memcmp(&buffer[cursor], "ON", 2) == 0) {
                    arg[i] = 1.0f;
                    cursor += 2;
                } else if (memcmp(&buffer[cursor], "OFF", 3) == 0) {
                    arg[i] = 0;
                    cursor += 3;
                } else {
                    accepted = 0;
                    if (buffer[cursor] == '-')
                        accepted = 1;
                    if (buffer[cursor] >= '0' && buffer[cursor] <= '9')
                        accepted = 1;
                    if (!accepted)
                        return -1;

                    arg[i] = (float) atof(&buffer[cursor]);

                    for (digit_count = 0; digit_count < 32; digit_count++) {
                        accepted = 0;
                        if (buffer[cursor] == '-') {
                            cursor++;
                            accepted = 1;
                        }
                        if (buffer[cursor] >= '0' && buffer[cursor] <= '9') {
                            cursor++;
                            accepted = 1;
                        }
                        if (buffer[cursor] == '.') {
                            cursor++;
                            accepted = 1;
                        }
                        if (!accepted)
                            break;
                    }

                    if (digit_count == 32)
                        return -1;
                }

                cursor = SkipSpace(buffer, cursor);
                break;
        }
    }

    return cursor;
}

/* The run of separators standing before a token. Two of the five consume more than the byte they
   are found cursor - a comment runs to its line ending inclusive and the ideographic space is two bytes -
   which is why the skip is a loop over the whole file rather than a walk over one kind of byte
   ([title-script.md](../../docs/formats/title-script.md)). */
int CScript::SkipSpace(char *buffer, int position) {
    bool stop;

    while (position < size) {
        stop = true;

        if (memcmp(&buffer[position], "\x81\x40", 2) == 0) {
            position++;
            stop = false;
        }

        if (buffer[position] == ' ')
            stop = false;
        if (buffer[position] == '\t')
            stop = false;
        if (buffer[position] == '\n') {
            position++;
            stop = false;
        }
        if (buffer[position] == '\r') {
            position++;
            stop = false;
        }

        if (memcmp(&buffer[position], "//", 2) == 0) {
            while (buffer[position] != '\n' && buffer[position] != '\r')
                position++;
            position++;
            stop = false;
        }

        if (stop)
            return position;
        position++;
    }

    return size;
}
