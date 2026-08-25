#include "title/script.hpp"
#include "dataread.hpp"
#include <cstdlib>
#include <cstring>

/* The command table the parser matches a line against, in the order it matches them: a name is
   compared by the length the row carries rather than by its own, so a name that is another's prefix
   has to stand in front of it ([title-script.md](../../docs/formats/title-script.md)). */
/* The one script the overlay runs. It is 58112 bytes because the file is held whole inside it and
   re-parsed from the cursor every tick. */
/* Read the whole script in and put every actor back to a state nothing has asked anything of yet.
   Nothing is reset when the load fails, so a missing file leaves the previous script's state
   standing rather than an empty one. */
void CScript::Load(const char* name)
{
    int i;

    p = data;

    if (LoadFile((char*)name, p, &size)) {
        wait = 0;
        mes_no = 0;
        mes_fuchi = 40;
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
        unk_2C = 0;
        se_no = 0;
        se_voice = 0;
        se_stop = 0;
        bgm_fade = 0;

        for (i = 0; i < 128; i++) arg[i] = 0;

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
            obj[i].load_motion = -1;
            obj[i].step = 0.05f;
        }
    }
}

/* One tick of the script: nothing happens while the wait is still running, and when it runs out
   the parser reads one command after another out of the text until it reaches one that ends the
   tick. A line matching no row is fatal - there is no way to skip it, because nothing in the format
   says where a line ends. */
void CScript::Step()
{
    bool unknown;
    bool done;
    int i;

    if (this->end) return;

    if (mes_wait) wait = 1.0f + motion_step;

    if (wait < 1.0f) {
        done = false;
        pos = SkipSpace(p, pos);

        do {
            unknown = true;

            for (i = 0; i < 26; i++) {
                if (memcmp(&p[pos], Command[i].name, Command[i].length) == 0) {
                    unknown = false;
                    pos = SkipSpace(p, pos + Command[i].length);
                    pos = CheckScript(p, pos, &Command[i], i);

                    if (pos != -1) {
                        if (i == 23 || i == 24 || i == 25) done = true;
                    }
                    break;
                }
            }

            if (unknown) exit__2(-1);
        } while (!done);
    } else {
        wait = wait - motion_step;
    }
}

/* One command, once its arguments have been read: every case is a write into the object and
   nothing acts on it here, so a command is a request the overlay's own per-tick code picks up
   ([title-script.md](../../docs/formats/title-script.md)). */
int CScript::CheckScript(char* buf, int pos, CSCRIPT_COMMAND* command, int no)
{
    int at;

    at = pos;

    if (command->arg_count) at = CheckArg(buf, at, command);

    switch (no) {
    case 0:
        obj[(int)arg[0]].motion = (int)arg[1];
        obj[(int)arg[0]].motion_end = (int)arg[2];
        break;

    case 1:
        obj[(int)arg[0]].motion = (int)arg[1];
        obj[(int)arg[0]].motion_end = -1;
        break;

    case 2:
        obj[(int)arg[0]].move = (int)arg[1];
        obj[(int)arg[0]].move_req = 1;
        break;

    case 3:
        obj[(int)arg[0]].talk = 1;
        mes_no = (int)arg[1];
        mes_timer = arg[2];
        obj[(int)arg[0]].mouth_time = arg[2];
        mes_x = (int)arg[3];
        mes_y = (int)arg[4];
        mes_talker = (int)arg[0];
        mes_tail_x = (int)arg[5];
        mes_tail_y = (int)arg[6];
        break;

    case 4:
        obj[(int)arg[0]].eye = (char)arg[1];
        obj[(int)arg[0]].eye_time = arg[2];
        break;

    case 5:
        obj[(int)arg[0]].mouth = (char)arg[1];
        obj[(int)arg[0]].mouth_time = arg[2];
        break;

    case 6:
        if (arg[1] == 1.0f) {
            obj[(int)arg[0]].disp = 1;
        } else {
            obj[(int)arg[0]].disp = 0;
        }
        break;

    case 7:
        obj[(int)arg[0]].step = arg[1];
        break;

    case 8:
        camera_no = camera_start;
        camera_start = (int)arg[0];
        motion_start = (int)arg[1];
        motion_end = (int)arg[2];
        motion_step = arg[3];
        motion_req = 1;
        break;

    case 9:
        se_kind = (int)arg[0];
        se_no = (int)arg[1];
        se_voice = (int)arg[2];
        se_stop = 1;
        break;

    case 10:
        se_kind = (int)arg[0];
        se_no = (int)arg[1];
        se_voice = (int)arg[2];
        se_fade_time = (int)arg[3];
        break;

    case 11:
        se_kind = (int)arg[0];
        se_fade_time = (int)arg[1];
        bgm_fade = (int)arg[2];
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
        mes_no = (int)arg[0];
        mes_timer = arg[1];
        mes_x = (int)arg[2];
        mes_y = (int)arg[3];
        mes_talker = -1;
        mes_tail_x = (int)arg[4];
        mes_tail_y = (int)arg[5];
        break;

    case 15:
        mes_fuchi = (int)arg[0];
        break;

    case 16:
        mes_no = 0;
        break;

    case 17:
        obj[(int)arg[1]].load = (int)arg[0];
        obj[(int)arg[1]].load_motion = 0;
        break;

    case 18:
        sprite = (char)arg[0];
        break;

    case 19:
        bom_no++;
        if (bom_no > 2) bom_no = 0;
        bom_pos[bom_no][0] = arg[0];
        bom_pos[bom_no][1] = arg[1];
        bom_pos[bom_no][2] = arg[2];
        bom_size[bom_no] = arg[3];
        bom_req = 1;
        break;

    case 20:
        beem_no++;
        if (beem_no > 2) beem_no = 0;
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
        load_no = (int)arg[0];
        break;

    case 22:
        scene = (int)arg[0];
        init_no = (int)arg[0];
        break;

    case 25:
        wait = arg[0] - 1.0f;
        break;

    case 24:
        mes_wait = (int)(1.0f + arg[0]);
        break;

    case 23:
        end = 1;
        break;
    }

    return at;
}

/* One command's arguments. Both kinds read the same three forms and differ only in what stands
   before them: a kind-1 argument must be preceded by a comma and a kind-2 one stands where it is.
   Anything the three forms do not cover hands back -1, which the caller stores and then parses
   from ([title-script.md](../../docs/formats/title-script.md)). */
int CScript::CheckArg(char* buf, int pos, CSCRIPT_COMMAND* command)
{
    int at;
    int i;
    int n;
    int ok;

    at = pos;

    for (i = 0; i < command->arg_count; i++) {
        switch (command->arg_type[i]) {
        case 1:
            if (buf[at] != ',') return -1;

            at = SkipSpace(buf, at + 1);
            if (memcmp(&buf[at], "ON", 2) == 0) {
                arg[i] = 1.0f;
                at += 2;
            } else if (memcmp(&buf[at], "OFF", 3) == 0) {
                arg[i] = 0;
                at += 3;
            } else {
                ok = 0;
                if (buf[at] == '-') ok = 1;
                if (buf[at] >= '0' && buf[at] <= '9') ok = 1;
                if (!ok) return -1;

                arg[i] = (float)atof(&buf[at]);

                for (n = 0; n < 32; n++) {
                    ok = 0;
                    if (buf[at] == '-') {
                        at++;
                        ok = 1;
                    }
                    if (buf[at] >= '0' && buf[at] <= '9') {
                        at++;
                        ok = 1;
                    }
                    if (buf[at] == '.') {
                        at++;
                        ok = 1;
                    }
                    if (!ok) break;
                }

                if (n == 32) return -1;
            }

            at = SkipSpace(buf, at);
            break;

        case 2:
            if (memcmp(&buf[at], "ON", 2) == 0) {
                arg[i] = 1.0f;
                at += 2;
            } else if (memcmp(&buf[at], "OFF", 3) == 0) {
                arg[i] = 0;
                at += 3;
            } else {
                ok = 0;
                if (buf[at] == '-') ok = 1;
                if (buf[at] >= '0' && buf[at] <= '9') ok = 1;
                if (!ok) return -1;

                arg[i] = (float)atof(&buf[at]);

                for (n = 0; n < 32; n++) {
                    ok = 0;
                    if (buf[at] == '-') {
                        at++;
                        ok = 1;
                    }
                    if (buf[at] >= '0' && buf[at] <= '9') {
                        at++;
                        ok = 1;
                    }
                    if (buf[at] == '.') {
                        at++;
                        ok = 1;
                    }
                    if (!ok) break;
                }

                if (n == 32) return -1;
            }

            at = SkipSpace(buf, at);
            break;
        }
    }

    return at;
}

/* The run of separators standing before a token. Two of the five consume more than the byte they
   are found at - a comment runs to its line ending inclusive and the ideographic space is two bytes -
   which is why the skip is a loop over the whole file rather than a walk over one kind of byte
   ([title-script.md](../../docs/formats/title-script.md)). */
int CScript::SkipSpace(char* buf, int pos)
{
    bool stop;

    while (pos < size) {
        stop = true;

        if (memcmp(&buf[pos], "\x81\x40", 2) == 0) {
            pos++;
            stop = false;
        }

        if (buf[pos] == ' ') stop = false;
        if (buf[pos] == '\t') stop = false;
        if (buf[pos] == '\n') {
            pos++;
            stop = false;
        }
        if (buf[pos] == '\r') {
            pos++;
            stop = false;
        }

        if (memcmp(&buf[pos], "//", 2) == 0) {
            while (buf[pos] != '\n' && buf[pos] != '\r') pos++;
            pos++;
            stop = false;
        }

        if (stop) return pos;
        pos++;
    }

    return size;
}
