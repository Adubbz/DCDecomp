#pragma once

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <string_view>

namespace dc::test {

struct Case {
    const char *name;
    void (*run)();
    Case      *next;
};

Case *&Registry();

struct Registrar {
    Registrar(Case *c) {
        c->next    = Registry();
        Registry() = c;
    }
};

[[noreturn]] void Fail(const char *file, int line, const char *expression);

} // namespace dc::test

#define DC_TEST(name)                                                                              \
    static void          dc_test_##name();                                                         \
    static dc::test::Case dc_test_case_##name{#name, dc_test_##name, nullptr};                     \
    static dc::test::Registrar dc_test_registrar_##name{&dc_test_case_##name};                     \
    static void          dc_test_##name()

#define DC_CHECK(expression)                                                                       \
    do {                                                                                           \
        if (!(expression)) {                                                                       \
            dc::test::Fail(__FILE__, __LINE__, #expression);                                       \
        }                                                                                          \
    } while (0)

#define DC_CHECK_NEAR(a, b, tolerance) DC_CHECK(std::fabs((a) - (b)) <= (tolerance))
