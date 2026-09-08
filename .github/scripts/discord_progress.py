#!/usr/bin/env python3
import argparse
import json
from pathlib import Path


def percentage(measures, name):
    return f"{float(measures.get(name, 0.0)):.4f}%"


def integer(measures, name):
    return f"{int(measures.get(name, 0)):,}"


def progress_lines(measures):
    return (
        f"Overall progress: **{percentage(measures, 'fuzzy_match_percent')}**\n"
        f"Perfect code: **{percentage(measures, 'matched_code_percent')}** "
        f"({integer(measures, 'matched_code')} / "
        f"{integer(measures, 'total_code')} bytes)\n"
        f"Perfect functions: **{integer(measures, 'matched_functions')} / "
        f"{integer(measures, 'total_functions')}** "
        f"({percentage(measures, 'matched_functions_percent')})\n"
        f"Complete code: **{percentage(measures, 'complete_code_percent')}**"
    )


def category_lines(measures):
    return (
        f"Perfect functions: **{integer(measures, 'matched_functions')} / "
        f"{integer(measures, 'total_functions')}** "
        f"({percentage(measures, 'matched_functions_percent')})\n"
        f"Perfect code: **{percentage(measures, 'matched_code_percent')}** · "
        f"Fuzzy: **{percentage(measures, 'fuzzy_match_percent')}** · "
        f"Complete: **{percentage(measures, 'complete_code_percent')}**"
    )


def payload(report):
    fields = [
        {
            "name": "Overall",
            "value": progress_lines(report["measures"]),
            "inline": False,
        }
    ]
    fields.extend(
        {
            "name": category["name"],
            "value": category_lines(category["measures"]),
            "inline": False,
        }
        for category in report.get("categories", [])
    )

    return {
        "username": "DCDecomp Progress",
        "allowed_mentions": {"parse": []},
        "embeds": [
            {
                "title": "Dark Cloud NTSC 1.02 Progress",
                "color": 0x5865F2,
                "fields": fields,
            }
        ],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("report", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    with args.report.open(encoding="utf-8") as report_file:
        report = json.load(report_file)
    with args.output.open("w", encoding="utf-8") as output_file:
        json.dump(payload(report), output_file, ensure_ascii=False)
        output_file.write("\n")


if __name__ == "__main__":
    main()
