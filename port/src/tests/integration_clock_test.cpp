#include <string>

#include "platform/clock.hpp"
#include "test.hpp"

namespace {

std::string g_trace;

void HookA() {
    g_trace += 'a';
}

void HookB() {
    g_trace += 'b';
}

void Idle() {
    g_trace += 'i';
}

void SelfRemoving() {
    g_trace += 's';
    ClockRemovePumpHook(SelfRemoving);
}

} // namespace

DC_TEST(integration_pump_hooks_chain_before_the_idle_hook) {
    ClockSetUnbounded(true);
    ClockSetIdleHook(nullptr);
    ClockAddPumpHook(HookA);
    ClockAddPumpHook(HookB);
    ClockAddPumpHook(HookA);
    ClockPump();
    DC_CHECK(g_trace == "ab");

    g_trace.clear();
    ClockSetIdleHook(Idle);
    DC_CHECK(ClockGetIdleHook() == Idle);
    ClockSyncV();
    DC_CHECK(g_trace == "abi");

    // The loading screen clearing the idle hook leaves the host's hooks running.
    g_trace.clear();
    ClockSetIdleHook(nullptr);
    ClockPump();
    DC_CHECK(g_trace == "ab");

    g_trace.clear();
    ClockRemovePumpHook(HookA);
    ClockAddPumpHook(SelfRemoving);
    ClockPump();
    ClockPump();
    DC_CHECK(g_trace == "bsb");
    ClockRemovePumpHook(HookB);
}
