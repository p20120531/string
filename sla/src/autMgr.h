#ifndef _AUT_MGR_
#define _AUT_MGR_
#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <set>
#include <assert.h>
#include <bitset>
#include "utility.h"
using namespace std;

class TGEdge;
class TGraph;
class VmtNode;
class Aut;
class AutMgr;

// PARAM   : has _paraList different from _source
// NOPARAM : no need to specify _paraList
enum VmtType {
    INPUT, INPUT_N, STATE, STATE_N, LEN, LEN_N, PARAM, NOPARAM, OTHER
};

typedef vector<TGEdge*>       TGEdgeList;
typedef vector<VmtNode*>      VmtNodeList;
typedef set<VmtNode*>         VmtNodeSet;
typedef vector<VmtNodeSet>    ParaSetList;
typedef vector<VmtNodeList>   VarList;
typedef pair<string,VmtNode*> Str2VmtNode;
typedef map<string,VmtNode*>  Str2VmtNodeMap;

class TGEdge{
    friend class AutMgr;
    friend class TGraph;
    public:
        TGEdge(const size_t& sIdx, const size_t& eIdx, const size_t& label0, const size_t& label1): _sIdx(sIdx), _eIdx(eIdx), _label0(label0), _label1(label1) {}
    private:
        size_t _sIdx;
        size_t _eIdx;
        size_t _label0;
        size_t _label1;
};

class TGraph{
    friend class AutMgr;
    public:
        TGraph(const char* fileName): _inputBitNum(8),_epsilonEncode(0),_leftEncode(254),_rightEncode(255){parse(fileName);}
        // I/O
        parse(const char*);
        write(const char*);
        print() const;
    private:
        void init();
        bool isAccepting(const string&);
        void parseLabels(const string&, size_t&, size_t&);
        const size_t  _inputBitNum;
        const size_t  _epsilonEncode;
        const size_t  _leftEncode;
        const size_t  _rightEncode;
        vecotr<size_t> _alphabetList;
        vector<string> _stateBitStr;
        map<string,string> _h2bMap;
        size_t     _stateBitNum;
        size_t     _initIdx;
        vector<size_t> _oList;
        TGEdgeList _tList;
        set<char>  _nSet;
};

class VmtNode{
    friend class Aut;
    friend class AutMgr;
    public:
        VmtNode (const string& name,const VmtType& type=OTHER,const size_t& idx=0): _name(name) 
            {_paraList.assign(6,VmtNodeSet()); _type = type; _idx = idx; _source=0; _flag = 0;}
        VmtNode (const string& name, VmtNode* source) : _name(name), _source(source)
            {_paraList.assign(6,VmtNodeSet()); _type = OTHER; _idx = 0; _flag = 0;}
        void        print(const size_t);
        void        write(ofstream&);
        const       string& getName()            {return _name;}
        void        setType(const VmtType& type) {_type = type;}
        string      getTypeStr();
    private:
        void        merge(VmtNodeSet&, const VmtNodeSet&);
        bool        hasParam();
        bool        haveSameParam(VmtNode*);
        void        addChild(VmtNode*);
        void        clearParam();
        void        buildParam();
        void        writeParam(ofstream&);
        void        shiftStateVar(const size_t&);
        string      _name;
        size_t      _idx;
        VmtType     _type;
        VmtNodeList _children;
        VmtNode*    _source;   // used for _type == PARAM
        ParaSetList _paraList; // input/state/lvar
        size_t      _flag;
};

class Aut{
    friend class VmtNode;
    friend class AutMgr;
    public :
        Aut(){
            init();
            cout << "Aut()"<< endl;
            printVarList();
            printEpsilon();
        }
        Aut(const char* fileName){ 
            init();
            parse(fileName);
        }
        Aut(const string& fileName){ 
            init();
            parse(fileName.c_str()); 
        }
        // Static Member Function
        // static member function cannot have const qualifier (don't have this)
        static VmtNode* initEpsilon();
        static VarList  initVarList(const VmtType&);
        static void     printEpsilon();
        static void     printVarList();
        // Non-Static Member Function
        // I/O
        void            test();
        void            print() const;
        void            parse(const char*);
        void            write(const char*);
        void            write(const string&);
        // Operations
        void            addlen(const string&);
        void            intersect(Aut*,Aut*);
        void            concate(Aut*,Aut*);
        void            replace(Aut*,Aut*,Aut*,Aut*);
        void            addpred(const string&);
    private:
        // Static Member
        static void     expandVarList(const VmtType&);
        static void     vmtTokenize(const string&,vector<string>&,vector<string>&);
        static VmtNode* buildVmtNode(const string&,size_t,size_t,Str2VmtNodeMap&);
        static bool     isReservedString(const string&);
        static void     check(Aut*);
        static void     check(Aut*, const size_t&);
        static void     check(Aut*, Aut*);
        static void     check(Aut*, Aut*, const size_t&);
        
        static size_t   inputBitNum;
        static size_t   stateBitNum;
        static size_t   lvarNum;
        static VarList  input;
        static VarList  state;
        static VarList  lvar;
        static VmtNode* epsilon;
        // Non-Static Member Function
        void            init();
        void            clearParam();
        void            buildParam();
        void            renameDef();
        void            shiftStateVar(const size_t&);
        void            parseDef(const string&, size_t&, Str2VmtNodeMap&);
        void            parsePred(const string&, size_t&, Str2VmtNodeMap&);
        void            defineFun(const string&, const string&, VmtNodeList&);
        void            defineFun(const string&, const string&, VmtNodeList&, Str2VmtNodeMap&);
        void            defineFun(const string&, const string&, VmtNodeList&, void (Aut::*)(VmtNode*));
        void            renameITO(const string&, VmtNode*);
        void            renameITOs2Aut(Aut*,Aut*);
        void            integrate(Aut*, Aut*);
        size_t          addStateVar(const size_t&);
        void            addLVar(const size_t&);
        VmtNode*        getI();
        VmtNode*        getO();
        VmtNode*        getT();
        void            setI(VmtNode*);
        void            setO(VmtNode*);
        void            setT(VmtNode*);
        // Non-Static Data Member
        VarList         _state;
        VarList         _lvar;
        VarList         _predBV;
        VarList         _predIV;
        VmtNodeList     _nxtList;
        VmtNodeList     _imdList;
        VmtNodeList     _itoList;
        VmtNodeList     _predList;
        Str2VmtNodeMap  _vmap;
        size_t          _stateVarNum;
};

class AutMgr{
    public :
        AutMgr():epsilonEncode(0),leftEncode(254),rightEncode(255)
        {   
            _gflag = 0;
            cout << "epsilonEncode=" << epsilonEncode << " "
                 << "leftEncode="    << leftEncode    << " "
                 << "rightEncode="   << rightEncode   << endl;
        }
        // Converter
        void dot2blif(const char*);
        void regex2blif(const char*);
        void blif2vmt(const char*,const char*);
        // Automata Operation
        void readCmdFile(const char*);
        size_t& getGFlag() {return _gflag;}
    private:
        // Converter
        string Uint2bitString(const size_t& ,const size_t&);
        void writeCompleTransition(ofstream&, const vector<string>&, const string&, const string&, const size_t idx=0);
        void regex2blif_r(const vector<string>&, const string&, const string&);
        // Data Member
        const size_t  epsilonEncode;
        const size_t  leftEncode;
        const size_t  rightEncode;
        size_t        _gflag;
};

#endif