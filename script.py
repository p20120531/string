import sys
import time
import re
import csv
import numpy as np
from subprocess import call
from os import listdir
from os.path import isdir, isfile, join
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.patches as mpat
from matplotlib.font_manager import FontProperties

############################## Global Variable ###############################
DPI                     = 200
escapeCharSet           = {'!','"','#','$','%','&','\'','(',')','*','+',',',
                           '-','.','/',':',';','<','=','>','?','@','[','\\',
                           ']','^','_','`','{','|','}','~'}
sigma_star_dir          = 'experiment/special_regex/sigma_star.vmt'
empty_set_dir           = 'experiment/special_regex/empty_set.vmt'
epsilon_dir             = 'experiment/special_regex/epsilon.vmt'
sigma_plus_dir          = 'experiment/special_regex/sigma_plus.vmt'
############################## Benchmark Directory ###########################
benchmark_kaluza_dir    = ['benchmark/Kaluza/SMTLIB/sat/small'  ,
                           'benchmark/Kaluza/SMTLIB/sat/big'    ,
                           'benchmark/Kaluza/SMTLIB/unsat/small',
                           'benchmark/Kaluza/SMTLIB/unsat/big'  ]
#dg_kaluza_dir           = ['DG/Kaluza/sat/small']
dg_kaluza_dir           = ['DG/Kaluza/sat/small'  ,'DG/Kaluza/sat/big',
                           'DG/Kaluza/unsat/small','DG/Kaluza/unsat/big']
dg_testing_dir          = ['DG/testing/sat', 'DG/testing/unsat']
############################## Binary Directory ##############################
sla_dir        = 'bin/sla'
regex2dot_dir  = 'bin/regex2blif/target/regex2blif-0.0.1-SNAPSHOT.jar'
abc70930_dir   = 'bin/abc70930'
cvc4_dir       = 'bin/cvc4-2017-03-20-x86_64-linux-opt'
norn_dir       = 'bin/norn/norn'
z3_dir         = 'bin/z3-master/build/z3'
ic3ia_dir      = 'bin/ic3ia/build/ic3ia'

##############################################################################
# [Function Name] init
# [ Description ] create directories for experiments
# [  Arguments  ]
##############################################################################
def init() :
    d1 = ['experiment/Kaluza/result']
    d2 = ['all','strlen','sample']
    for i in d1 :
        for j in d2 :
            call('mkdir -p %s/%s' %(i,j),shell=True)
    d3 = ['DG/Kaluza']
    d4 = ['sat','unsat']
    d5 = ['small','big']
    for i in d3 :
        for j in d4 :
            for k in d5 :
                call('mkdir -p %s/%s/%s' %(i,j,k),shell=True)
    call('mkdir -p experiment/testing/result',shell=True)

##############################################################################
# [Function Name] getDGFile
# [ Description ] return dependency graph files of the benchmark
# [  Arguments  ] benchmark = ['Kaluza','testing']
##############################################################################
def getDGFile(benchmark) :
    if benchmark == 'Kaluza' :
        dgFile = []
        dirs = dg_kaluza_dir
        for d in dirs :
            subpath = [join(d,sp) for sp in listdir(d) if isdir(join(d,sp))]
            for sp in subpath :
                dgFile += [join(sp,idx) for idx in listdir(sp) if isdir(join(sp,idx))]
        return dgFile
    elif benchmark == 'testing' :
        dgFile = []
        dirs = dg_testing_dir
        for d in dirs :
            dgFile += [join(d,sp) for sp in listdir(d) if isdir(join(d,sp))]
        return dgFile
    else :
        sys.exit('[ERROR::getDGFile] invalid benchmark=%s' %(benchmark))

##############################################################################
# [Function Name] getSplitMap
# [ Description ] return idx list and file list from a id to name map
# [  Arguments  ] mapFileName = name of the id to name map file
##############################################################################
def getSplitMap(mapFileName) :
    idxList,fileList = [],[]
    with open(mapFileName) as f :
        lines = f.read().splitlines()
        for i in range(1,len(lines)) :
            v = lines[i].split(',')
            idxList.append(v[0])
            fileList.append(v[1])
    return idxList,fileList

##############################################################################
# [Function Name] buildDG
# [ Description ] build dependency graph from the Kaluza benchmark
# [  Arguments  ] benchmark = ['Kaluza','single']
##############################################################################
def buildDG(benchmark,argv=None) :
    exePath = sla_dir
    if benchmark == 'Kaluza' :
        dirs1 = benchmark_kaluza_dir
        dirs2 = dg_kaluza_dir
        for i in range(len(dirs1)) : 
            files = [f for f in listdir(dirs1[i]) if isfile(join(dirs1[i],f))]
            for f in files :
                smtFile = join(dirs1[i],f)
                DGdir = join(dirs2[i],f[0:f.rfind('.')])
                call('%s --buildDG %s %s' %(exePath,smtFile,DGdir),shell=True)
    elif benchmark == 'single' :
        if len(argv) != 2 : 
            sys.exit('[ERROR::buildDG] argv size not match for buildDG single')
        call('%s --buildDG %s %s' %(exePath,argv[0],argv[1]), shell=True)
    else :
        sys.exit('[ERROR::buildDG] invalid benchmark=%s' %(benchmark))

##############################################################################
# [Function Name] buildMap
# [ Description ] build id to name map of files
# [  Arguments  ] benchmark = ['Kaluza','testing']
#                 scope = ['all','strlen','sample']
##############################################################################
def buildMap(benchmark,scope) :
    if scope != 'all' and scope != 'strlen' and scope != 'sample': 
        sys.exit('[ERROR::buildMap] invalid scope=%s' %(scope))
    if benchmark == 'Kaluza' :
        mapFile = open(join('experiment/Kaluza',scope),'w')
        mapFile.write('id,name')
        dgFile,dgCnt = getDGFile('Kaluza'),0
        if scope == 'all' :
            for f in dgFile :
                dgCnt += 1
                mapFile.write('\n%d,%s' %(dgCnt,f))
        elif scope == 'strlen' :
            for f in dgFile :
                dgCnt += 1
                predFile = open(join(f,'pred'))
                lines = predFile.read().splitlines()
                predFile.close()
                hasStrlen = False
                for line in lines :
                    if line[-1] != ')' :
                        hasStrlen = True
                if hasStrlen :
                    mapFile.write('\n%d,%s' %(dgCnt,f))
        elif scope == 'sample' :
            sampleSize,lines = 100,[]
            strlenMapFile = open('experiment/Kaluza/strlen')
            lines = strlenMapFile.read().splitlines()
            strlenMapFile.close()
            samples = np.random.choice(len(lines)-1,sampleSize,replace=False)
            samples.sort()
            for i in samples :
                mapFile.write('\n%s' %(lines[i]))
        mapFile.close()
    elif benchmark == 'testing' :
        if scope != 'all' : sys.exit('[ERROR::buildMap] benchmark=testing invalid scope=%s' %(scope))
        mapFile = open('experiment/testing/all','w')
        mapFile.write('id,name')
        dgFile,dgCnt = getDGFile('testing'),0
        for f in dgFile :
            dgCnt += 1
            mapFile.write('\n%d,%s' %(dgCnt,f))
        mapFile.close()
    else :
        sys.exit('[ERROR::buildMap] invalid benchmark=%s' %(benchmark))

##############################################################################
# [Function Name] regex2blif
# [ Description ] convert regex to blif file
# [  Arguments  ] dgFileList : list of dependency graph files
##############################################################################
def regex2blif(dgFileList) :
    cnt = 0
    for f in dgFileList :
        cnt += 1
        print 'cnt = %d' %(cnt)
        autFile = open(join(f,'aut'))
        lines = autFile.read().splitlines()
        autFile.close()
        for line in lines :
            v = line.split()
            name = join(f,v[0])
            if v[1] == '".*"' or v[1] == '"~(.*)"' or v[1] == '""' or v[1] == '"~()"' :
                pass
            else :
                call('java -jar %s -r %s -d %s.dot -o garbage' %(regex2dot_dir,v[1],name),shell=True)
                call('%s --dot2blif %s.dot %s.blif' %(sla_dir,name,name),shell=True)
                abcCmdFile = open('abc_cmd','w')
                abcCmdFile.write('read %s.blif' %(name))
                abcCmdFile.write('\nespresso')
                abcCmdFile.write('\nwrite %s.blif' %(name))
                abcCmdFile.close()
                call('%s -f abc_cmd' %(abc70930_dir),shell=True)

##############################################################################
# [Function Name] blif2vmt
# [ Description ] convert blif file to vmt file
# [  Arguments  ] dgFileList : list of dependency graph files
##############################################################################
def blif2vmt(dgFileList) :
    exePath = sla_dir
    for f in dgFileList :
        autFile = open(join(f,'aut'))
        lines = autFile.read().splitlines()
        autFile.close()
        for line in lines :
            v = line.split()
            name = join(f,v[0])
            if v[1] == '".*"' or v[1] == '"~(.*)"' or v[1] == '""' or v[1] == '"~()"' :
                if   v[1] == '".*"'    : d = sigma_star_dir
                elif v[1] == '"~(.*)"' : d = empty_set_dir
                elif v[1] == '""'      : d = epsilon_dir
                else                   : d = sigma_plus_dir
                call('cp %s %s.vmt' %(d,name),shell=True)
            else :
                call('%s --blif2vmt %s.blif %s.vmt' %(exePath,name,name),shell=True)

##############################################################################
# [Function Name] readCmd
# [ Description ] execute cmd file of the file list
# [  Arguments  ] dgFileList : list of dependency graph files
##############################################################################
def readCmd(dgFileList) :
    exePath = sla_dir
    for f in dgFileList :
        cmdFile = join(f,'cmd')
        call('%s --readCmd %s' %(exePath,cmdFile),shell=True)

##############################################################################
# [Function Name] exp
# [ Description ] experiment on different solvers
# [  Arguments  ] benchmark  = ['Kaluza','testing']
#                 scope      = ['all','strlen','sample']
#                 dgIdxList  : idx list of dependency graph files
#                 dgFileList : file list of dependency graph files
#                 solverName = ['cvc4','norn','z3','ic3ia']
##############################################################################
def exp(benchmark,scope,dgIdxList,dgFileList,solverName) :
    if (benchmark == 'testing' && scope != 'all') : 
        sys.exit('[ERROR::exp] benchmark=testing invalid scope=%s' %(scope))
    recordName,header = expParam(benchmark,scope,solverName)
    record = open(recordName,'w')
    record.write('%s' %(header))
    for i in range(len(dgIdxList)) :
        expRecord(solverName,dgIdxList[i],dgFileList[i],record)
    record.close()

def expParam(benchmark,scope,solverName) :
    recordName = 'experiment/%s/result/%s' %(benchmark,scope)
    header = 'id,sat,time'
    if   solverName == 'cvc4' :
        recordName  += '/cvc4.csv'
    elif solverName == 'norn' :
        recordName  += '/norn.csv'
    elif solverName == 'z3'   :
        recordName  += '/z3.csv'
    elif solverName == 'ic3ia':
        recordName  += '/ic3ia.csv'
        header      =  'id,sat,time,step'
    else :
        sys.exit('[ERROR::expParam] Invalid solver name=%s' %(solverName))
    return recordName,header

def expRecord(solverName,idx,dirName,record) :
    f = join(dirName,'sink.smt2')
    if  solverName == 'cvc4' :
        exePath     = cvc4_dir
        ts = time.time()
        call('%s %s > out' %(exePath,f),shell=True)
        te = time.time()
        out = open('out')
        lines = out.read().splitlines()
        out.close()
        if   lines[0] == 'sat'   : sat = '1'
        elif lines[0] == 'unsat' : sat = '0'
        else                     : sat = 'x'
        record.write('\n%s,%s,%.6f' %(idx,sat,te-ts))
    elif solverName == 'norn' :
        exePath     =  norn_dir
        ts = time.time()
        call('%s %s > out' %(exePath,f),shell=True)
        te = time.time()
        out = open('out')
        lines = out.read().splitlines()
        out.close()
        if   lines[0] == 'sat'   : sat = '1'
        elif lines[0] == 'unsat' : sat = '0'
        else                     : sat = 'x'
        record.write('\n%s,%s,%.6f' %(idx,sat,te-ts))
    elif solverName == 'z3'   :
        exePath     =  z3_dir
        ts = time.time()
        call('%s %s > out' %(exePath,f),shell=True)
        te = time.time()
        out = open('out')
        lines = out.read().splitlines()
        out.close()
        if   lines[0] == 'sat'   : sat = '1'
        elif lines[0] == 'unsat' : sat = '0'
        else                     : sat = 'x'
        record.write('\n%s,%s,%.6f' %(idx,sat,te-ts))
    elif solverName == 'ic3ia':
        exePath     =  ic3ia_dir
        f = join(dirName,'sink.vmt')
        ts = time.time()
        call('%s -w -v 2 %s > out' %(exePath,f),shell=True)
        te = time.time()
        out = open('out')
        lines = out.read().splitlines()
        out.close()
        if   lines[-1] == 'safe'   : sat = '0'
        elif lines[-1] == 'unsafe' : sat = '1'
        else                       : sat = 'x'
        #TODO safe <-> frame , unsafe <-> step
        step = 'x'
        if sat == '1' :
            for i in range(1,len(lines)+1) :
                if lines[-i][0:2] == ';;' :
                    v = lines[-i].split()
                    if v[1] != 'step' :
                        sys.exit('[ERROR::expRecord] \';;\' not followed by \'step\'')
                    else :
                        step = v[2]
                    break
        elif sat == '0' :
            for i in range(len(lines)) :
                if (lines[i][0:8] == 'fixpoint')
                    v = lines[i].split()
                    step = v[4]
                    break
        record.write('\n%s,%s,%.6f,%s' %(idx,sat,te-ts,step))
    else :
        sys.exit('[ERROR::expRecord] invalid solver name=%s' %(solverName))

##############################################################################
# [Function Name] ConsistencyChecking
# [ Description ] consistency checking
# [  Arguments  ] benchmark  = ['Kaluza','testing']
#                 scope      = ['all','strlen','sample']
#                 solverList : list of solvers
##############################################################################
def ConsistencyChecking(solverList,benchmark,scope) :
    if solverList[0] != 'ic3ia' : sys.exit('[ERROR::CC] first solver is not ic3ia')
    rstr = 'experiment/%s/result/%s' %(benchmark,scope)
    data = []
    for solver in solverList :
        isIc3ia = False
        if solver == 'ic3ia' : isIc3ia = True
        data.append(getData('%s/%s.csv' %(rstr,solver),isIc3ia))

    # Consistency Checking
    logFile = open('%s/log' %(rstr),'w')
    for i in range(1,len(data)) :
        if len(data[0][0]) != len(data[i][0]) :
            logFile.write('number of cases not match\n')
            logFile.close()
            sys.exit("[ERROR::CC] number of cases not match")
    logFile.write('number of cases match\n')
    
    errFree = True
    for i in range(len(data)) :
        for j in range(len(data[i][1])) :
            if data[i][1][j] == 'x' :
                errFree = False
                logFile.write('case:%-6s ERROR\n' %(data[i][0][j]))
    if not errFree :
        logFile.close()
        sys.exit('[ERROR::CC] some cases have ERROR')

    allConsistent = True
    for i in range(1,len(data)) :
        for j in range(len(data[i][1])) :
            if data[0][1][j] != data[i][1][j] :
                allConsistent = False
                logFile.write('case:%-6s inconsistent\n' %(data[i][0][j]))

    if allConsistent :
        logFile.write('all cases consistent')
    else :
        logFile.close()
        sys.exit("[ERROR::CCandPlot] some cases inconsistent")
    
    logFile.close()

##############################################################################
# [Function Name] CCandPlot
# [ Description ] consistency checking and plot
# [  Arguments  ] benchmark = ['Kaluza','testing']
#                 scope     = ['all','strlen','sample']
##############################################################################
def CCandPlot(benchmark,scope) :
    rstr = 'experiment/%s/result/%s' %(benchmark,scope)
    cvc4 = getData('%s/cvc4.csv' %(rstr))
    norn = getData('%s/norn.csv' %(rstr))
    z3   = getData('%s/z3.csv' %(rstr))
    ic3  = getData('%s/ic3ia.csv' %(rstr),True)

    # Consistency Checking
    logFile = open('%s/log' %(rstr),'w')
    if  (len(cvc4[0]) != len(norn[0])) or (len(z3[0]) != len(ic3[0])) or (len(cvc4[0]) != len(ic3[0])) : 
        logFile.write('number of cases not match\n')
        logFile.close()
        sys.exit("[ERROR::CCandPlot] number of cases not match")
    else :
        logFile.write('number of cases match\n')
    errFree,allConsistent = True,True
    for i in range(len(cvc4[1])) :
        if cvc4[1][i] == 'x' or norn[1][i] == 'x' or z3[1][i] == 'x' or ic3[1][i] == 'x' :
            errFree = False
            logFile.write('case:%-6s ERROR\n' %(cvc4[0][i]))
        else :
            if (cvc4[1][i] != norn[1][i]) or (cvc4[1][i] != z3[1][i]) or (cvc4[1][i] == ic3[1][i]) :
                allConsistent = False
                logFile.write('case:%-6s inconsistent\n' %(cvc4[0][i]))
    if not errFree :
        logFile.close()
        sys.exit('[ERROR::CCandPlot] some cases have ERROR')
    if allConsistent :
        logFile.write('all cases consistent')
    else :
        logFile.write('some cases inconsistent')
        logFile.close()
        sys.exit("[ERROR::CCandPlot] some cases inconsistent")
    logFile.close()
    
    # plot time vs step scatter for ic3ia unsafe case
    unsafeStep,unsafeTime = [],[]
    for i in range(len(ic3[3])) :
        if ic3[1][i] == '0' :
            if ic3[3][i] == 'x' :
                sys.exit('[ERROR::CCandPlot] ic3ia : idx=%s unsafe case must have step != \'x\'' %(ic3[0][i]))
            unsafeStep.append(ic3[3][i])
            unsafeTime.append(ic3[2][i])
    print unsafeStep
    print unsafeTime
    '''
    unsafeStep = np.array(unsafeStep).astype(float)
    unsafeTime = np.array(unsafeTime).astype(float)
    print unsafeStep
    print unsafeTime
    coeff = np.polyfit(unsafeStep, unsafeTime, 1)
    yp    = np.zeros(unsafeStep.shape[0])
    prod  = np.ones(unsafeStep.shape[0])
    for i in range(1,len(coeff)+1) :
        yp += coeff[-i] * prod
        prod *= x
    plt.plot(unsafeStep,yp,'g')
    '''
    plt.scatter(unsafeStep,unsafeTime,c='b')
    plt.title('Time vs Step Scatter Plot (# of case = %d)' %(len(unsafeStep)))
    plt.xlabel('Step Count')
    plt.ylabel('Run Time (s)')
    plt.savefig('%s/step_ic3ia_unsafe.jpg' %(rstr),dpi=DPI)
    plt.cla()
    plt.clf()
    
    # cvc4 , norn , z3 , ic3
    #ALL   = [cvc4[2],norn[2],z3[2],ic3[2]]
    ALL   = [ [] for x in range(4)]
    SAT   = [ [] for x in range(4)]
    UNSAT = [ [] for x in range(4)]
    for i in range(len(cvc4[0])) :
        if ic3[1][i] == 'x' : continue
        ALL[0].append(cvc4[2][i])
        ALL[1].append(norn[2][i])
        ALL[2].append(z3[2][i])
        ALL[3].append(ic3[2][i])
        if cvc4[1][i] == '1' : SAT[0].append(cvc4[2][i])
        else                 : UNSAT[0].append(cvc4[2][i])
        if norn[1][i] == '1' : SAT[1].append(norn[2][i])
        else                 : UNSAT[1].append(norn[2][i])
        if z3[1][i] == '1'   : SAT[2].append(z3[2][i])
        else                 : UNSAT[2].append(z3[2][i])
        if ic3[1][i] == '1'  : UNSAT[3].append(ic3[2][i])
        else                 : SAT[3].append(ic3[2][i])
    
    plotCumTime(rstr,ALL,'all')
    plotCumTime(rstr,SAT,'sat')
    plotCumTime(rstr,UNSAT,'unsat')

def plotCumTime(rstr,data,mode) :
    # plot cumulative time vs case index
    name = ''
    if   mode == 'all'  : name = 'crt_all'
    elif mode == 'sat'  : name = 'crt_sat'
    elif mode == 'unsat': name = 'crt_unsat'
    cvc4 = np.array(data[0],dtype=float)
    norn = np.array(data[1],dtype=float)
    z3   = np.array(data[2],dtype=float)
    ic3  = np.array(data[3],dtype=float)
    np.cumsum(cvc4, out=cvc4)
    np.cumsum(norn,out=norn)
    np.cumsum(z3,out=z3)
    np.cumsum(ic3,out=ic3)

    fig = plt.figure()
    ax  = plt.subplot(111)
    ax.plot(cvc4,'r',label='cvc4')
    ax.plot(norn,'g',label='norn')
    ax.plot(z3,'b',label='z3')
    ax.plot(ic3,'k',label='ic3ia')
    box = ax.get_position()
    ax.set_position([box.x0,box.y0,box.width*0.8,box.height])
    ax.legend(loc='center left',bbox_to_anchor=(1,0.5))
    plt.title('Cumulative Run Time')
    plt.ylabel('Cumulative Run Time (s)')
    plt.xlabel('Benchmark Index')
    plt.savefig('%s/%s_wnorn.jpg' %(rstr,name),dpi=DPI)
    plt.cla()
    plt.clf()

    fig = plt.figure()
    ax  = plt.subplot(111)
    ax.plot(cvc4,'r',label='cvc4')
    ax.plot(z3,'b',label='z3')
    ax.plot(ic3,'k',label='ic3ia')
    box = ax.get_position()
    ax.set_position([box.x0,box.y0,box.width*0.8,box.height])
    ax.legend(loc='center left',bbox_to_anchor=(1,0.5))
    plt.title('Cumulative Run Time')
    plt.ylabel('Cumulative Run Time (s)')
    plt.xlabel('Benchmark Index')
    plt.savefig('%s/%s_wonorn.jpg' %(rstr,name),dpi=DPI)

def getData(filename,isIc3ia=False) :
    idx,sat,time = [],[],[]
    if isIc3ia : step = []
    with open(filename,'r') as  csvfile :
        csvreader = csv.reader(csvfile)
        csvreader.next()
        for row in  csvreader :
            #print row
            idx.append(row[0])
            sat.append(row[1])
            time.append(row[2])
            if isIc3ia : step.append(row[3])
    if isIc3ia :
        return idx,sat,time,step
    else :
        return idx,sat,time
##############################################################################

def build() :
    buildDG('Kaluza')
    buildMap('Kaluza','all')
    buildMap('Kaluza','strlen')
    buildMap('testing','all')

def clear() :
    call('rm -rf DG/Kaluza')
    call('rm -rf experiment/Kaluza', shell=True)
    call('rm -rf experiment/testing', shell=True)

def kaluzaSample() :
    call('rm experiment/Kaluza/sample', shell=True)
    call('rm -rf experiment/Kaluza/result/sample', shell=True)
    buildMap('Kaluza','sample')
    dgIdxList,dgFileList = getSplitMap('experiment/Kaluza/sample')
    solvers = ['ic3ia','cvc4','norn','z3']
    for solver in solvers :
        exp('Kaluza','strlen',dgIdxList,dgFileList,solver)
    ConsistencyChecking('Kaluza','strlen',solvers)
    
def epoch(benchmark,enable_norn=False) :
    if benchmark == 'Kaluza' :
        f = 'experiment/Kaluza/strlen'
        scope = 'strlen'
    elif benchmark == 'testing' :
        f = 'experiment/testing/all'
        scope = 'all'
    if enable_norn : solvers = ['ic3ia','cvc4','z3','norn']
    else           : solvers = ['ic3ia','cvc4','z3']
    dgIdxList,dgFileList = getSplitMap(f)
    regex2blif(dgFileList)
    blif2vmt(dgFileList)
    readCmd(dgFileList)
    solvers = ['ic3ia','cvc4','norn','z3']
    for solver in solvers :
        exp(benchmark,scope,dgIdxList,dgFileList,solver)
    ConsistencyChecking(bemchmark,scope,solvers)

def single(fileName) :
    dgFileList = [fileName]
    regex2blif(dgFileList)
    blif2vmt(dgFileList)
    readCmd(dgFileList)

if __name__ == '__main__' :
    init()
    if sys.argv[1] == 'build' : build()
    elif sys.argv[1] == 'clear' : clear()
    elif sys.argv[1] == 'resample' : kaluzaSample()
    elif sys.argv[1] == 'kaluza' : epoch('Kaluza')
    elif sys.argv[1] == 'testing' : epoch('testing')
    else : print 'invalid option=%s' %(sys.argv[1])
