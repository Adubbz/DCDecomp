#!/bin/sh
# Stand in for wibo, so the compiler is run with its pragmas honoured.
#
# mwccgap takes a `--wibo-path`, so this is where the build reaches statefix:
# it is handed the guest executable and its arguments exactly as wibo would be.
#
# On by default. A unit says what compiler state it is compiled under with the
# pragmas scripts/build/statefix.py adds; a source carrying them still compiles
# without this shim -- mwcc ignores a pragma it does not know -- it just does
# not get the state.
#
#     STATEFIX=0 ./run.sh              plain wibo, no pragmas
set -e
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
if [ "${STATEFIX:-1}" != "1" ]; then
    exec "${WIBO:-wibo}" "$@"
fi
exec python3 "$here/statefix.py" --wibo -- "$@"
