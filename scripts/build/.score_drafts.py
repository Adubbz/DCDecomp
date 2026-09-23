#!/usr/bin/env python3
# score_drafts.py <source> [mangled ...] : compile with NON_MATCHING and score functions
import os,sys,subprocess,tempfile,re
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import quicktu as q
DIFF='-d' in sys.argv
argv=[a for a in sys.argv if a!='-d']
src=argv[1]; names=argv[2:]
image='dun' if '/dun/' in src else ('title' if '/title/' in src else 'main')
d,b=os.path.split(src)
h,tmp=tempfile.mkstemp(suffix=os.path.splitext(src)[1],prefix='tmpscore_',dir=d); os.close(h)
obj=tmp.rsplit('.',1)[0]+'.o'
open(tmp,'w').write(open(src).read())
try:
    cmd=['scripts/build/statefix-wibo.sh','tools/compilers/mw/2.3.3/mwccmips.exe']+q.FLAGS+['-define','NON_MATCHING','-lang','c' if src.endswith('.c') else 'c++','-o',obj,tmp]
    r=subprocess.run(cmd,capture_output=True,text=True,env=dict(os.environ,MWCIncludes='include/std;include/sce',STATEFIX_SOURCE=src))
    out=(r.stdout+r.stderr).replace('\r','')
    if 'caused tool to abort' in out or not os.path.exists(obj):
        print('COMPILE FAILED'); print('\n'.join(l for l in out.splitlines() if l.startswith('#'))[:4000]); sys.exit(1)
    for n in names:
        try: t=q.retail_function(image,n)
        except SystemExit as e: print(n,'noretail',e); continue
        m=q.ours(obj,n)
        print('%s %d/%d len %d vs %d'%(n,q.compare(t,m),len(t),len(m),len(t)))
        if DIFF:
            for i in range(max(len(t),len(m))):
                a=q.shape(t[i],m[i][1] if i<len(m) else False) if i<len(t) else ''
                b=q.shape(m[i][0],m[i][1]) if i<len(m) else ''
                print('%s%-40s %s'%('*' if a!=b else ' ',a,b))
finally:
    for f in (tmp,obj):
        if os.path.exists(f): os.unlink(f)
