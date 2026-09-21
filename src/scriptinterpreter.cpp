#include "scriptinterpreter.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#ifdef NON_MATCHING
/**
 *
 * Reports whether a character is not parser whitespace.
 *
 */
static int CheckChar(char character) {
    return character != ' ' && character != '\t' && character != '\n' &&
           character != '\r';
}

/**
 *
 * Advances a parser to its next non-whitespace character.
 *
 */
static int SkipSpace(CScriptInterpreter &input) {
    int position = input.pos;
    while (position < input.size && !CheckChar(input.data[position])) {
        position++;
    }
    input.pos = position;
    return position < input.size;
}

/**
 *
 * Replaces comments in a script with whitespace before parsing.
 *
 */
static void PreProcess(CScriptInterpreter &input) {
    unsigned char *script = (unsigned char *) input.data;
    int position = 0;
    while (position < input.size) {
        if (script[position] == '/' && script[position + 1] == '/') {
            while (position < input.size && script[position] != '\n' &&
                   script[position] != '\r') {
                script[position++] = ' ';
            }
        }
        if (script[position] == '/' && script[position + 1] == '*') {
            while (position < input.size) {
                if (script[position] == '*' && script[position + 1] == '/') {
                    script[position] = ' ';
                    script[position + 1] = ' ';
                    break;
                }
                script[position++] = ' ';
            }
            continue;
        }
        position++;
    }
}
#endif

#ifdef NON_MATCHING
int CScriptInterpreter::GetNextTAG(void) {
    if (tag_table == NULL) {
        return -1;
    }
    do {
        if (!ControlCode() || !SearchCommand(&current_tag)) {
            return -1;
        }
    } while (current_tag >= tag_count || current_tag < 0);

    TAG_PARAM *tag = &tag_table[current_tag];
    if (tag->argument_types[0] >= 0) {
        int status = GetArg(tag->argument_types);
        if (status == 0) {
            return -1;
        }
        if (status < 0) {
            printf("error at ");
            printf("%s\n", tag->name);
            for (;;) {
            }
        }
    }
    return current_tag;
}
#else
INCLUDE_ASM("asm/nonmatchings/scriptinterpreter", GetNextTAG__18CScriptInterpreterFv);
#endif
INCLUDE_RODATA("asm/nonmatchings/scriptinterpreter", @183);
INCLUDE_RODATA("asm/nonmatchings/scriptinterpreter", @184);
void CScriptInterpreter::SetTAG(TAG_PARAM *tags, int count) {
    tag_table = tags;
    tag_count = count;
}
void CScriptInterpreter::SetFunction(SPI_FUNC_PARAM *functions, int count) {
    function_table = functions;
    function_count = count;
}
#ifdef NON_MATCHING
void CScriptInterpreter::SetScript(char *script, int script_size) {
    data = script;
    size = script_size;
    pos = 0;
    argument_data_used = 0;
    current_tag = -1;
    PreProcess(*this);
}
#else
INCLUDE_ASM("asm/nonmatchings/scriptinterpreter", SetScript__18CScriptInterpreterFPci);
#endif
#ifdef NON_MATCHING
CScriptInterpreter::CScriptInterpreter(void) {
    data = NULL;
    size = 0;
    pos = 0;
    argument_data_used = 0;
    current_tag = -1;
    tag_table = NULL;
    function_table = NULL;
}
#else
INCLUDE_ASM("asm/nonmatchings/scriptinterpreter", __ct__18CScriptInterpreterFv);
#endif
#ifdef NON_MATCHING
int CScriptInterpreter::ControlCode(void) {
    if (!SkipSpace(*this)) {
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

    char character;
    do {
        character = data[pos++];
        if (pos > size) {
            return 0;
        }
    } while (character != '(');

    int condition;
    if (!CallFunction(&condition)) {
        return 0;
    }
    if (condition == 0) {
        do {
            character = data[pos++];
            if (pos > size) {
                return 0;
            }
        } while (character != '}');
    }
    return control_type;
}
#else
INCLUDE_ASM("asm/nonmatchings/scriptinterpreter", ControlCode__18CScriptInterpreterFv);
#endif
INCLUDE_RODATA("asm/nonmatchings/scriptinterpreter", @223);
INCLUDE_RODATA("asm/nonmatchings/scriptinterpreter", @224);
#ifdef NON_MATCHING
int CScriptInterpreter::CallFunction(int *result) {
    if (!SkipSpace(*this)) {
        return 0;
    }

    char words[512];
    int text_length = 0;
    int word_count = 0;
    while (true) {
        char character = data[pos++];
        if (pos > size) {
            return 0;
        }
        if (character == ')') {
            words[text_length] = '\0';
            words[text_length + 1] = '\0';
            break;
        }
        if (character == '(' || character == ',') {
            words[text_length++] = '\0';
            word_count++;
        } else if (CheckChar(character)) {
            words[text_length++] = character;
        }
    }
    if (function_table == NULL) {
        return -1;
    }

    SPI_FUNC_PARAM *function = NULL;
    for (int index = 0; index < function_count; index++) {
        if (strcmp(function_table[index].name, words) == 0) {
            function = &function_table[index];
            break;
        }
    }
    if (function == NULL) {
        return -1;
    }

    int expected_count = 0;
    while (function->argument_types[expected_count] >= 0) {
        expected_count++;
    }
    if (expected_count != word_count || word_count >= 24) {
        return -1;
    }

    int destination_offset = argument_data_used;
    char *word = words;
    for (int argument = 0; argument < word_count; argument++) {
        while (*word++ != '\0') {
        }
        arguments[argument] = &function_argument_data[destination_offset];
        switch (function->argument_types[argument]) {
        case SCRIPT_ARGUMENT_STRING: {
            strcpy((char *) arguments[argument], word);
            destination_offset += (strlen(word) / 4 + 1) * 4;
            break;
        }
        case SCRIPT_ARGUMENT_INTEGER:
            *(int *) arguments[argument] = atoi(word);
            destination_offset += sizeof(int);
            break;
        case SCRIPT_ARGUMENT_FLOAT:
            *(float *) arguments[argument] = (float) atof(word);
            destination_offset += sizeof(float);
            break;
        }
    }
    *result = function->function(arguments);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/scriptinterpreter", CallFunction__18CScriptInterpreterFPi);
#endif
#ifdef NON_MATCHING
int CScriptInterpreter::GetArg(int *argument_types) {
    if (!SkipSpace(*this)) {
        return 0;
    }

    int argument_count = 0;
    while (argument_types[argument_count] >= 0) {
        argument_count++;
    }
    int storage_used = 0;
    for (int argument = 0; argument < argument_count; argument++) {
        arguments[argument] = &argument_text[storage_used];
        char value[256];
        int length = 0;
        if (!SkipSpace(*this)) {
            return 0;
        }
        char character = data[pos++];
        if (pos > size) {
            return 0;
        }
        if (character == ',') {
            if (!SkipSpace(*this)) {
                return 0;
            }
        } else {
            value[length++] = character;
        }
        while (true) {
            character = data[pos++];
            if (pos > size) {
                return 0;
            }
            if (character == ',' || !CheckChar(character)) {
                break;
            }
            value[length++] = character;
        }
        value[length] = '\0';

        if (argument_types[argument] == SCRIPT_ARGUMENT_FLOAT) {
            for (int index = 0; value[index] != '\0'; index++) {
                character = value[index];
                if ((character < '0' || character > '9') && character != '.' &&
                    character != '-') {
                    return -1;
                }
            }
            *(float *) arguments[argument] = (float) atof(value);
            storage_used += sizeof(float);
        } else if (argument_types[argument] == SCRIPT_ARGUMENT_INTEGER) {
            for (int index = 0; value[index] != '\0'; index++) {
                character = value[index];
                if ((character < '0' || character > '9') && character != '-') {
                    return -1;
                }
            }
            *(int *) arguments[argument] = atoi(value);
            storage_used += sizeof(int);
        } else if (argument_types[argument] == SCRIPT_ARGUMENT_STRING) {
            if (value[0] != '"') {
                return -1;
            }
            int quote = 1;
            while (value[quote] != '"') {
                if (value[quote] == '\0') {
                    return -1;
                }
                quote++;
            }
            value[quote] = '\0';
            strcpy((char *) arguments[argument], value + 1);
            storage_used += ((strlen((char *) arguments[argument]) + 1) / 4 + 1) * 4;
        } else {
            return -1;
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/scriptinterpreter", GetArg__18CScriptInterpreterFPi);
#endif
#ifdef NON_MATCHING
int CScriptInterpreter::SearchCommand(int *tag_index) {
    if (!SkipSpace(*this)) {
        return 0;
    }

    char command[256];
    int length = 0;
    while (true) {
        char character = data[pos++];
        if (pos > size) {
            return 0;
        }
        if (!CheckChar(character)) {
            command[length] = '\0';
            break;
        }
        command[length++] = character;
    }
    if (command[0] < 'A' || command[0] > 'Z') {
        *tag_index = -1;
        return 1;
    }
    for (int index = 0; index < tag_count; index++) {
        if (strcmp(tag_table[index].name, command) == 0) {
            *tag_index = index;
            return 1;
        }
    }
    if (strcmp(command, "end") == 0) {
        return 0;
    }
    *tag_index = -1;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/scriptinterpreter", SearchCommand__18CScriptInterpreterFPi);
#endif
INCLUDE_RODATA("asm/nonmatchings/scriptinterpreter", @403);
