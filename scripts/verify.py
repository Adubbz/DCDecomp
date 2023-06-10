#!/usr/bin/env python3
import argparse
import hashlib
import sys
from pathlib import Path

# Constants
COLOR_GREEN = '\033[92m'
COLOR_RED = '\033[91m'
COLOR_GREY = '\033[90m'
COLOR_END = '\033[0m'

class FileHash:
    def __init__(self, hash, offset=0, size=-1):
        self.hash = hash
        self.offset = offset
        self.size = size

    def compare(self, hash: str):
        return hash.lower() == self.hash.lower()

HASHES = {
    'DATA.HED': [FileHash('22b6684c0abb32eeb709e8a8794457681f1e0b7d55c9c3d0eced71326431df03')],
    'DUN.BIN': [FileHash('bf2051f70258d54fac37e0289d146c4000a71a3c5566bd7f1b198ea37bb4e3a2')],
    'MODHSYN.IRX': [FileHash('f4eb3549f7f2f3b6533444c33ec45fbb57102ad239853c3185dba973467b3ff9')],
    'INET.IRX': [FileHash('b12b384e6220b243c68c3526f44c1f6060da9b0814efff5732e4fdbb21c69f36')],
    'AN986.IRX': [FileHash('01cc63a4e90985c6057c2a7076696c35a4b854e33f3b50e2172abf7f0c389897')],
    'NETCNF.IRX': [FileHash('a5df47e49c430573cde4d3dafd09edd19f650581b95a9af7549ce4dda903800a')],
    'IOPRP21.IMG': [FileHash('5c82d57a3e81a53e16c665d8d4a99152005060fa6ea327066fe2bd3788a02549')],
    'LIBNET.IRX': [FileHash('0bb3ae21e961f9be997e1dcddc504ddeadd954d21d7599d2d38e0a61e652768e')],
    'USBD.IRX': [FileHash('d695af5f72cb766e597abe3b67cd88b4b2579445084488bea1aca6b48a594a22')],
    'PADMAN.IRX': [FileHash('c2200e7f7071b7e747e122bd036f70133efa6b631415f500a806b75d55fcb88b')],
    'SDRDRV.IRX': [FileHash('b75f0020a1e28ece42c8e790c2c48f7daf0773fd4dc4cca7ec72e044049198a3')],
    'IOPRP211.IMG': [FileHash('58e4dab3fbfd1b564a1bff1d9d62a10063d8c26a342af2198edb0b5623645943')],
    'SIO2MAN.IRX': [FileHash('f41e341efe08ac407fce467639d10bb2a4532b70a8a5829dbe350edef58516d7')],
    'CDVDMAN.IRX': [FileHash('1d5bd4024149cf4685e5d4e97952cf9a1e5f6e7834045a1b3780689f46c651c7')],
    'MCMAN.IRX': [FileHash('4f01c1ee5afc457b3a030b7910431f92ba623e3ecc234d5bc5be64f48e38cd3a')],
    'LIBSD.IRX': [FileHash('71596ef4029f672205e1523dedbd8dacfe5dfa50132c8a747b81289cd24f1db6')],
    'MSIFRPC.IRX': [FileHash('e91a27ad702873ae11764e1ba44516eeb3138e97fe5a43c713eb197b30ee7387')],
    'EZMIDI.IRX': [FileHash('8b6f8a8199197b0c9ebb403aeea6987d4106fb807ecc98bcc99b60251e648315')],
    'MODMIDI.IRX': [FileHash('2eed3e9598025d162a2424522a0dbd0ded343468a6d9dc7e50f55b6885d01851')],
    'MCSERV.IRX': [FileHash('c55abb687fd08e0df292c3636cfd9a34d06a3261a62a1916d06c463fa30cbae0')],
    'DATA.HD2': [FileHash('2fc1bddcbd16fb632d237a3ae5b2a29c62ae81b48a169be9e3fe20bdb934c0aa')],
    'TITLE.BIN': [FileHash('c7c825a22e249dd962678f686665fde121426b1270e0565663912ee7c0581f05')],
    'SYSTEM.CNF': [FileHash('988ef4d844b56d6b6dc5e9c2e12d48656f3c87d96e57a0583db53fe119c5f7f9')],
    'SCUS_971.11': [FileHash('de3015eefbe86dddbd126a122ef60eda0e29cd12b7d2eaf87ed3ad236e11989c'), FileHash('b128a252266b2e872fcc796ff18e9819a329cd0e0fa90155725793a19bb52c7e', 0x100, 0x1A2380)],
    'IFC003.CNF': [FileHash('666928da6e5c86a413117eabee81ef0785e3257249c97fc588f647fc88f2d739')],
    'IFC000.CNF': [FileHash('1a77809cb407c34bd95e520fb861242430523b336d0ec99402040d74c568a4f4')],
    'DEV000.CNF': [FileHash('95f18d485675aa913ab434f08807705188ff9050d1dd5fe435cc668c8f1de435')],
    'IFC001.CNF': [FileHash('3a357283e942bd05cf19e8c5f60e875db3c78b63e0d049247113acdf9e7a8dc4')],
    'NET003.CNF': [FileHash('60f38a9a8c902d23a8808390a79ba07446c157697882cca46149daa33b3e016d')],
    'NET000.CNF': [FileHash('211132a94378b8574be11007b2f0422a228928b56892b010cb3c987ca3f24e38')],
    'NET001.CNF': [FileHash('b7b67c815e7a66e6977cf7ccb5b6ae28d8d5ff288b84635a96b3ab392cf2eb35')],
    'DEV001.CNF': [FileHash('bb5c69cfeed43f3ba30ff8f2b38ee985f9e91c777582f7237beb6dd0c6389f83')],
    'DEV003.CNF': [FileHash('2313085880aa4199708c1426fc16c8b6f39db8c0703d9f7969d8c33fb4c7b7ba')],
    'NET.DB': [FileHash('7a8ecdfb6e303bbd3907054a29a616c648d27755db5819fb55ec0bf41bc37191')],
    'DMMY': [FileHash('32000a674a8e37c5345b6bce47c19e4894f8d01f59332aab614e1130a8ba5867')],
    'DATA.DAT': [FileHash('4f581c66d83d9270da6cb9adce7ec10b6b9ade5cf74cf44718bcdd8e70401fb5')],
    'Vu_prog0.bin': [FileHash('6aad883fd92ed4350c4e5235438a854aab0acbc2dca957ba5cf1d7112712ff6f')],
    'Vu_prog0f.bin': [FileHash('2bb9bdefdd2ba22e0c0760fb137095b54de952edd1f967ee5913a54432054b0a')],
    'Vu_prog1.bin': [FileHash('e09315ae736ccc026de51a8c901d78766e03866c5ede03b04610d33b4439dc03')],
    'Vu_progmain.bin': [FileHash('fbb2e542bfad2382073929121eb782e3dd2a7b9a37c9e511b7ae00c70b8f6b66')],
    'Vu_shadow3.bin': [FileHash('0af76bd0fe8f750b5f649878e60201af4dceb4b5dcb1d6fd83bd549f475f8cba')],
    'Vu_progg.bin': [FileHash('625a5e35d0e34c350ae3cf5788050aca0610428bc5a8a9251686f3c6ff9dcd7d')],
    'Vu_shadow.bin': [FileHash('3e726144b59dc851bd361291b4d7f607583e86b448761e96843eb1a041c69fd7')],
    'Vu_shadow2.bin': [FileHash('e693583b29a756b4de15d481f84a68bfea1bb62e8b7f40f5b80d1b19ad448829')]
}

def calculate_sha256(path, offset=0, size=-1):
    with open(path, 'rb') as f:
        f.seek(offset)
        data = f.read(size)
        return hashlib.sha256(data).hexdigest()

def validate(path, offset=0, size=-1, log=True):
    log_prefix = f'{path.name}' if offset == 0 else f'{path.name} {COLOR_GREY}(partial){COLOR_END}'

    if not path.exists():
        if log:
            print(f"{log_prefix}: {COLOR_RED}FAILED{COLOR_END} - File doesn't exist!")

        return False

    if not path.name in HASHES.keys():
        raise ValueError(f'No known hash exists for {path.name}')

    known_hashes = list(filter(lambda x: x.offset == offset and x.size == size, HASHES[path.name]))
    if not known_hashes:
        raise ValueError(f'No known exists for {path.name} with offset {offset:x} and size {size:x}')

    hash = calculate_sha256(path, offset, size)
    if known_hashes[0].compare(hash):
        if log:
            print(f'{log_prefix}: {COLOR_GREEN}OK{COLOR_END}')
        return True
    else:
        if log:
            print(f'{log_prefix}: {COLOR_RED}FAILED{COLOR_END}')
        return False

def ensure_ok(path, offset=0, size=-1):
    if not validate(path, offset, size):
        sys.exit(1)

def verify_extracted():
    print('Verifying extracted files')
    for path in Path('extracted/').rglob('*.*'):
        ensure_ok(path)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Verify decompiled files')
    parser.add_argument('-f', '--file', dest='file')
    parser.add_argument('-e', '--verify_extracted', dest='verify_extracted', action='store_true', help='Verify that the game has been extracted correctly')
    parser.add_argument('-p', '--partial', dest='partial', action='store_true')
    args = parser.parse_args()

    if args.file:
        path = Path(args.file)

        if args.partial:
            if path.name == 'SCUS_971.11':
                ensure_ok(path, 0x100, 0x1A2380)
        else:
            ensure_ok(path)
    elif args.verify_extracted:
        verify_extracted()
