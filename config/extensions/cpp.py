from pathlib import Path
from typing import Optional, Set, List, Tuple

from util import log, options, symbols

from segtypes.common.codesubsegment import CommonSegCodeSubsegment

class PS2SegCpp(CommonSegCodeSubsegment):
    @staticmethod
    def is_text() -> bool:
        return True

    def out_path(self) -> Optional[Path]:
        return options.opts.src_path / self.dir / f"{self.name}.cpp"

    def get_linker_section(self) -> str:
        return ".text"
