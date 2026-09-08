#!/usr/bin/env python3
import argparse
import json
from decimal import Decimal, ROUND_HALF_UP
from pathlib import Path


def percentage(measures, name):
    return f"{float(measures.get(name, 0.0)):.4f}%"


def integer(measures, name):
    return f"{int(measures.get(name, 0)):,}"


def fuzzy_code(measures):
    total = Decimal(str(measures.get("total_code", 0)))
    percent = Decimal(str(measures.get("fuzzy_match_percent", 0)))
    return int((total * percent / 100).quantize(Decimal("1"), ROUND_HALF_UP))


def progress_line(measures):
    return (
        f"Perfect **{percentage(measures, 'matched_code_percent')}** "
        f"({integer(measures, 'matched_code')}/{integer(measures, 'total_code')})"
        f" · Fuzzy **{percentage(measures, 'fuzzy_match_percent')}** "
        f"({fuzzy_code(measures):,}/{integer(measures, 'total_code')})"
    )


def payload(report):
    categories = {category["id"]: category for category in report["categories"]}
    sections = (
        ("Overall", report["measures"]),
        ("Game", categories["game"]["measures"]),
        ("Title", categories["title"]["measures"]),
        ("DUN", categories["dun"]["measures"]),
    )

    return {
        "username": "Osmond",
        "allowed_mentions": {"parse": []},
        "embeds": [
            {
                "title": "Dark Cloud NTSC 1.02",
                "color": 0x5865F2,
                "fields": [
                    {
                        "name": name,
                        "value": progress_line(measures),
                        "inline": False,
                    }
                    for name, measures in sections
                ],
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
