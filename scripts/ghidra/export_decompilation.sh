#!/usr/bin/env bash
# Export Ghidra's decompilation of every manifest function, per translation unit.
#
#   export_decompilation.sh                 both programs
#   export_decompilation.sh SCUS_971.11     one of them
#
# Writes re/ai/<unit>/ghidra-decompilation.md. Run it after a unit is added or
# a translation-unit boundary moves; regenerate the manifest first with
# scripts/ghidra/generate_dark_cloud_annotations.py, which must run on the host
# because it reads the retail ELF under re/.
set -euo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

GHIDRA=${GHIDRA_HOME:-$HOME/Applications/ghidra}
PROJECT_DIR=${DC_GHIDRA_PROJECT_DIR:-$HOME/development/re/Dark Cloud/ghidra}
PROJECT=${DC_GHIDRA_PROJECT:-Dark Cloud}
MANIFEST=$PWD/config/ghidra_annotations.json
OUTPUT=$PWD/re/ai
TIMEOUT=${DC_DECOMPILE_TIMEOUT:-120}

[ -x "$GHIDRA/support/analyzeHeadless" ] || {
    echo "$0: no analyzeHeadless under $GHIDRA; set GHIDRA_HOME" >&2
    exit 1
}
[ -f "$MANIFEST" ] || {
    echo "$0: $MANIFEST is missing; run scripts/ghidra/generate_dark_cloud_annotations.py" >&2
    exit 1
}

programs=("$@")
[ ${#programs[@]} -gt 0 ] || programs=(SCUS_971.11 DUN.BIN)

for program in "${programs[@]}"; do
    echo "== $program"
    "$GHIDRA/support/analyzeHeadless" "$PROJECT_DIR" "$PROJECT" \
        -process "$program" -noanalysis -readOnly \
        -scriptPath "$PWD/scripts/ghidra" \
        -postScript DarkCloudExportDecompilation.java \
        "$MANIFEST" "$OUTPUT" "$TIMEOUT" \
        | grep -E "EXPORTED|ERROR|Exception" || true
done
