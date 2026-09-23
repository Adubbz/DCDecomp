#include "scriptinterpreter.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

/**
 * Advances a parser to its next character that is not whitespace.
 */
extern "C" int SkipSpace__FR9input_str__3(input_str &input);

/**
 * Reports whether a character is not parser whitespace.
 */
extern "C" int CheckChar__Fc__3(char value);

/**
 * Replaces the comments in a script with whitespace before it is parsed.
 */
extern "C" void PreProcess__FR9input_str__2(input_str &input);

int CScriptInterpreter::GetNextTAG(void) {
    if (tag_table == NULL) {
        return -1;
    }
    do {
        if (!ControlCode()) {
            return -1;
        }
        if (!SearchCommand(&current_tag)) {
            return -1;
        }
    } while (current_tag >= tag_count || current_tag < 0);

    if (tag_table[current_tag].argument_types[0] >= 0) {
        int status = GetArg(tag_table[current_tag].argument_types);
        if (status == 0) {
            return -1;
        }
        if (status < 0) {
            printf("error at ");
            printf("%s\n", tag_table[current_tag].name);
            for (;;) {
            }
        }
    }
    return current_tag;
}
void CScriptInterpreter::SetTAG(TAG_PARAM *tags, int count) {
    tag_table = tags;
    tag_count = count;
}
void CScriptInterpreter::SetFunction(SPI_FUNC_PARAM *functions, int count) {
    function_table = functions;
    function_count = count;
}
void CScriptInterpreter::SetScript(char *script, int script_size) {
    data = script;
    size = script_size;
    pos = 0;
    argument_data_used = 0;
    current_tag = -1;
    PreProcess__FR9input_str__2(*this);
}
CScriptInterpreter::CScriptInterpreter(void) {
    data = NULL;
    data = NULL;
    size = 0;
    pos = 0;
    argument_data_used = 0;
    current_tag = -1;
    tag_table = NULL;
    function_table = NULL;
}
int CScriptInterpreter::ControlCode(void) {
    if (!SkipSpace__FR9input_str__3(*this)) {
        return 0;
    }

    int control_type = 1;
    if (memcmp(data + pos, "if", 2) == 0) {
        control_type = 2;
        printf("if\n");
    }
    if (control_type == 1) {
        return 1;
    }

    int c;
    do {
        if (get(&c) == 0) {
            return 0;
        }
    } while (c != '(');

    int condition;
    if (!CallFunction(&condition)) {
        return 0;
    }
    if (condition == 0) {
        do {
            if (get(&c) == 0) {
                return 0;
            }
        } while (c != '}');
    }
    return control_type;
}
int CScriptInterpreter::CallFunction(int *result) {
    char words[512];
    void *argv[24];

    if (!SkipSpace__FR9input_str__3(*this)) {
        return 0;
    }

    int length = 0;
    int argc = 0;
    int c;
    while (1) {
        if (get(&c) == 0) {
            return 0;
        }
        if (c == ')') {
            break;
        }
        if (c == '(' || c == ',') {
            words[length++] = 0;
            argc++;
        } else if (CheckChar__Fc__3(c)) {
            words[length++] = c;
        }
    }
    words[length] = 0;
    words[length + 1] = 0;
    if (function_table == NULL) {
        return -1;
    }

    SPI_FUNC_PARAM *function = NULL;
    for (length = 0; length < function_count; length++) {
        if (strcmp(function_table[length].name, words) == 0) {
            function = &function_table[length];
            break;
        }
    }
    if (function == NULL) {
        return -1;
    }

    for (length = 0; function->argument_types[length] >= 0; length++) {
    }
    if (length != argc || argc >= 24) {
        return -1;
    }

    int used = 0;
    u8 *out = &function_argument_data[argument_data_used];
    char *word = words;
    for (length = 0; length < argc; length++) {
        int size = 0;
        while (*word++ != 0) {
        }
        argv[length] = out;
        switch (function->argument_types[length]) {
            case SCRIPT_ARGUMENT_STRING:
                strcpy((char *) out, word);
                size = strlen(word);
                size = ((size >> 2) + 1) << 2;
                break;
            case SCRIPT_ARGUMENT_INTEGER:
                *(int *) out = atoi(word);
                size = 4;
                break;
            case SCRIPT_ARGUMENT_FLOAT:
                *(float *) out = atof(word);
                size = 4;
                break;
        }
        out += size;
        used += size;
    }
    *result = function->function(argv);
    return 1;
}
int CScriptInterpreter::GetArg(int *argument_types) {
    char value[256];

    if (!SkipSpace__FR9input_str__3(*this)) {
        return 0;
    }

    int argc;
    for (argc = 0; argument_types[argc] >= 0; argc++) {
    }

    int c;
    int i;
    int used = 0;
    for (i = 0; i < argc; i++) {
        arguments[i] = &argument_text[used];
        int length = 0;
        if (!SkipSpace__FR9input_str__3(*this)) {
            return 0;
        }
        if (get(&c) == 0) {
            return 0;
        }
        if (c != ',') {
            value[length++] = c;
        } else if (!SkipSpace__FR9input_str__3(*this)) {
            return 0;
        }
        while (1) {
            if (get(&c) == 0) {
                return 0;
            }
            if (c == ',' || !CheckChar__Fc__3(c)) {
                break;
            }
            value[length++] = c;
        }
        value[length] = 0;

        switch (argument_types[i]) {
            case SCRIPT_ARGUMENT_STRING:
                if (value[0] != '"') {
                    return -1;
                }
                for (length = 1;; length++) {
                    if (value[length] == '"') {
                        value[length] = 0;
                        break;
                    }
                    if (value[length] == 0) {
                        return -1;
                    }
                }
                strcpy((char *) arguments[i], value + 1);
                used += ((((int) strlen((char *) arguments[i]) + 1) >> 2) + 1) << 2;
                break;
            case SCRIPT_ARGUMENT_INTEGER:
                for (length = 0; value[length] != 0; length++) {
                    char digit = value[length];
                    if ((digit < '0' || digit > '9') && digit != '-') {
                        return -1;
                    }
                }
                *(int *) arguments[i] = atoi(value);
                used += 4;
                break;
            case SCRIPT_ARGUMENT_FLOAT:
                for (length = 0; value[length] != 0; length++) {
                    char digit = value[length];
                    if ((digit < '0' || digit > '9') && digit != '.' && digit != '-') {
                        return -1;
                    }
                }
                *(float *) arguments[i] = atof(value);
                used += 4;
                break;
            default:
                return -1;
        }
    }
    return 1;
}
int CScriptInterpreter::SearchCommand(int *tag_index) {
    char command[256];

    if (!SkipSpace__FR9input_str__3(*this)) {
        return 0;
    }

    int length = 0;
    int c;
    while (1) {
        if (get(&c) == 0) {
            return 0;
        }
        if (!CheckChar__Fc__3(c)) {
            break;
        }
        command[length++] = c;
    }
    command[length] = 0;
    if (command[0] < 'A' || command[0] > 'Z') {
        *tag_index = -1;
        return 1;
    }
    for (int i = 0; i < tag_count; i++) {
        if (strcmp(tag_table[i].name, command) == 0) {
            *tag_index = i;
            return 1;
        }
    }
    if (strcmp(command, "end") == 0) {
        return 0;
    }
    *tag_index = -1;
    return 1;
}
