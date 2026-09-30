#!/usr/bin/env python3
"""Generate an objdiff report for one release or for both releases together."""

import argparse
import json
import os
from pathlib import Path
import subprocess


ROOT = Path(__file__).resolve().parents[2]
REGIONS = ("NTSC", "PAL")
SECTION_NAMES = {"game": "Game", "title": "TITLE", "dun": "DUN"}


def load_region(region):
    path = ROOT / ("objdiff.json" if region == "NTSC" else "build/pal/objdiff.json")
    config = json.loads(path.read_text(encoding="utf-8"))
    for unit in config["units"]:
        for key in ("target_path", "base_path"):
            if key in unit:
                unit[key] = str(ROOT / unit[key])
    return config


def combined_config(configs):
    result = {key: value for key, value in configs["NTSC"].items()
              if key not in ("units", "progress_categories")}
    result["name"] = "dcdecomp NTSC + PAL"
    result["units"] = []
    result["progress_categories"] = []
    for region in REGIONS:
        prefix = region.lower()
        label = "NTSC 1.02" if region == "NTSC" else "PAL prototype"
        result["progress_categories"].append({"id": prefix, "name": label})
        result["progress_categories"].extend(
            {"id": f"{prefix}_{section}", "name": f"{label} {name}"}
            for section, name in SECTION_NAMES.items()
        )
        for unit in configs[region]["units"]:
            unit["name"] = f"{region}/{unit['name']}"
            metadata = unit.setdefault("metadata", {})
            sections = metadata.get("progress_categories", ())
            metadata["progress_categories"] = [prefix] + [
                f"{prefix}_{section}" for section in sections
            ]
            result["units"].append(unit)
    return result


def print_summary(report, region, combined=False):
    red, green, yellow, gray, reset = "\033[91m", "\033[92m", "\033[93m", "\033[90m", "\033[0m"
    categories = {entry["id"]: entry["measures"] for entry in report["categories"]}
    for section, image in (("game", "SCUS_971.11"), ("title", "TITLE.BIN"),
                           ("dun", "DUN.BIN")):
        key = f"{region.lower()}_{section}" if combined else section
        measures = categories[key]
        units = [unit for unit in report["units"] if key in
                 unit.get("metadata", {}).get("progress_categories", ())]
        fuzzy = sum(1 for unit in units for function in unit.get("functions", ())
                    if function.get("fuzzy_match_percent", 100.0) < 100.0)
        perfect = measures["matched_functions"]
        unmatched = measures["total_functions"] - perfect - fuzzy
        passed = float(measures["matched_code_percent"]) == 100.0
        status = f"{green}OK{reset}" if passed else f"{red}FAILED{reset}"
        print(f"{image}: {status} {gray}({perfect} perfect, {fuzzy} fuzzy, "
              f"0 asm, {unmatched} unmatched){reset}")

    measures = categories[region.lower()] if combined else report["measures"]
    units = ([unit for unit in report["units"] if region.lower() in
              unit.get("metadata", {}).get("progress_categories", ())]
             if combined else report["units"])
    fuzzy = sum(1 for unit in units for function in unit.get("functions", ())
                if function.get("fuzzy_match_percent", 100.0) < 100.0)
    perfect = measures["matched_functions"]
    unmatched = measures["total_functions"] - perfect - fuzzy
    perfect_share = float(measures["matched_code_percent"])
    fuzzy_share = float(measures["fuzzy_match_percent"]) - perfect_share
    unmatched_share = 100.0 - float(measures["fuzzy_match_percent"])
    print("\nCode, by byte")
    for label, color, share, count in (
        ("Perfect", green, perfect_share, perfect),
        ("Fuzzy", yellow, fuzzy_share, fuzzy),
        ("Asm", gray, 0.0, 0),
        ("Unmatched", red, unmatched_share, unmatched),
    ):
        print(f"  {color}{label:<11}{reset} {share:6.2f}%    {count:4d} functions")
    # Objdiff's data score includes sections it cannot compare. It is not a
    # byte-for-byte linked-image comparison, so do not call its gap a diff.
    total_data = int(measures.get("total_data", 0))
    if total_data:
        unmatched_data = total_data - int(measures.get("matched_data", 0))
        print(f"  Data       {yellow}{unmatched_data} bytes not matched by objdiff{reset}")
    differences = [(unit["name"], function["name"],
                    "fuzzy" if "fuzzy_match_percent" in function else "unmatched")
                   for unit in units for function in unit.get("functions", ())
                   if function.get("fuzzy_match_percent", 0.0) < 100.0]
    differences.sort(key=lambda entry: entry[2] != "unmatched")
    for unit, function, status in differences[:10]:
        color = yellow if status == "fuzzy" else red
        print(f"    {color}{status}{reset} {unit}/{function}")
    if len(differences) > 10:
        print(f"    ... and {len(differences) - 10} more")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--region", choices=(*REGIONS, "BOTH"),
                        default=os.environ.get("REGION", "NTSC").upper())
    args = parser.parse_args()

    configs = {region: load_region(region) for region in
               (REGIONS if args.region == "BOTH" else (args.region,))}
    config = combined_config(configs) if args.region == "BOTH" else configs[args.region]
    project = ROOT / "build" / "report_project" / args.region.lower()
    project.mkdir(parents=True, exist_ok=True)
    (project / "objdiff.json").write_text(json.dumps(config, indent=2) + "\n",
                                          encoding="utf-8")
    output = ROOT / "progress" / (
        "report.json" if args.region == "BOTH" else f"{args.region.lower()}/report.json"
    )
    output.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run(["objdiff-cli", "report", "generate", "--project", str(project),
                    "--output", str(output)], cwd=ROOT, check=True)
    report = json.loads(output.read_text(encoding="utf-8"))
    if args.region == "BOTH":
        for region in REGIONS:
            print(f"\n{region}")
            print_summary(report, region, combined=True)
    else:
        print_summary(report, args.region)


if __name__ == "__main__":
    main()
