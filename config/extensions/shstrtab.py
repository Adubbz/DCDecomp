from pathlib import Path

from segtypes.ps2.segment import Ps2Segment

class PS2SegShstrtab(Ps2Segment):
    def get_linker_entries(self):
        from segtypes.linker_entry import LinkerEntry

        return [LinkerEntry(self, [], Path(self.name), ".shstrtab")]
