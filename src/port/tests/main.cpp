#include "test.hpp"

#include <cstring>

namespace dc::test {

Case *&Registry() {
    static Case *head;
    return head;
}

[[noreturn]] void Fail(const char *file, int line, const char *expression) {
    std::fprintf(stderr, "%s:%d: check failed: %s\n", file, line, expression);
    std::exit(1);
}

} // namespace dc::test

int main(int argc, char **argv) {
    using namespace dc::test;
    if (argc < 2) {
        for (Case *c = Registry(); c != nullptr; c = c->next) {
            std::printf("%s\n", c->name);
        }
        return 0;
    }
    for (Case *c = Registry(); c != nullptr; c = c->next) {
        if (std::strcmp(c->name, argv[1]) == 0) {
            c->run();
            return 0;
        }
    }
    std::fprintf(stderr, "no test named %s\n", argv[1]);
    return 2;
}
