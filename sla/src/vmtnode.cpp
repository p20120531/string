#include "autMgr.h"
#include <map>

extern AutMgr* autmgr;
static size_t& gflag = autmgr->getGFlag();

void VmtNode::print(const size_t& level) 
{
    cout << string(level*3,' ') << _name << " " << this << " " << Aut::getTypeStr(_type) << " " << _flag;
    for (size_t i = 0; i < PI_NUM; ++i) {
        for (size_t j = 0, size = _paramList[i].size(); j < size; ++j)
            cout << " " << _paramList[i][j]->_name;
    }
    cout << endl;
    for (size_t i = 0, size = _children.size(); i < size; ++i) {
        _children[i]->print(level+1);
    }
}

void VmtNode::write(const size_t& level,ofstream& outFile)
{
    #ifndef VMTNODE_NDEBUG
        cout << string(level*3,' ') << _name << " " << this << " " << Aut::getTypeStr(_type) << " " << _flag;
        if      (_flag == gflag)     cout << " visited";
        else                         cout << " unvisited";
        if      (Aut::isLEAF(_type)) cout << " LEAF\n";
        else {assert(Aut::isIMD(_type)); cout << " IMD\n";}
    #endif
    /*
    if (_flag == gflag) {
        if (_type == PARAM) {
            assert( (_children.empty()) );
            assert( (_source->_flag == gflag) );
            assert( (hasParam()) );
            writeParamBody(_source->_name,outFile);
        }
        else {
            if (!_children.empty()) {
                if ( hasParam() ) {
                    writeParamBody(_name,outFile);
                }
                else {
                    cout << "[VmtNode::write] special node name=" << _name << " c0=" << _children[0]->_name << endl;
                    assert( (_children.size() == 1) );
                    assert( (_children[0] == Aut::const0 || _children[0] == Aut::const1) );
                    outFile << _name;
                }
            }
            else {
                outFile << _name;
            }
        }
        return;
    }
    */
    if ( _flag == gflag ) {
        if ( Aut::isLEAF(_type) ) {
            assert( (_type != PARAM) );
            outFile << _name;
        }
        else {
            assert( (_type == MODULE) );
            assert( (!_children.empty()) );
            if ( hasParam() ) 
                writeParamBody(_name,outFile);
            else {
                cout << "[VmtNode::write] special node name=" << _name << " c0=" << _children[0]->_name << endl;
                assert( (_children.size() == 1) );
                assert( (_children[0] == Aut::const0 || _children[0] == Aut::const1) );
                outFile << _name;
            }
        }
        return;
    }
    _flag = gflag;
    if ( Aut::isLEAF(_type) ) {
        if (_type == PARAM) {
            assert( (_children.empty()) );
            assert( (_source->_flag == gflag) );
            assert( (hasParam()) );
            writeParamBody(_source->_name,outFile);
        }
        else
            outFile << _name;
    }
    else {
        assert( (Aut::isIMD(_type)) );
        assert( (!_children.empty()) );
        outFile << "(" << _name;
        for (size_t i = 0, size = _children.size(); i < size; ++i) {
            outFile << " ";
            _children[i]->write(level+1,outFile);
        }
        outFile << ")";
    }
    /*
    if (_type == PARAM) {
        assert( (_children.empty()) );
        assert( (_source->_flag == gflag) );
        assert( (hasParam()) );
        writeParamBody(_source->_name,outFile);
    }
    else {
        if (!_children.empty()) {
            outFile << "(" << _name;
            for (size_t i = 0, size = _children.size(); i < size; ++i) {
                outFile << " ";
                _children[i]->write(level+1,outFile);
            }
            outFile << ")";
        }
        else {
            outFile << _name;
        }
    }
    */
}

VmtType VmtNode::getType(const string& name)
{
    if      (name == "not"  ) return NOT;
    else if (name == "-"    ) return NEG;
    else if (name == "and"  ) return AND;
    else if (name == "or"   ) return OR;
    else if (name == "+"    ) return PLUS;
    else if (name == "<"    ) return LT;
    else if (name == "<="   ) return LTOEQ;
    else if (name == "="    ) return EQ;
    else if (name == ">="   ) return MTOEQ;
    else if (name == ">"    ) return MT;
    else if (name == "!"    ) return EXCM;
    else if (name == "false") return CONST0;
    else if (name == "true" ) return CONST1;
    else if (isNumber(name) ) return NUM;
    else if (name == ":trans" || name == ":init" || name == ":invar-property") return SPECIAL;
    else if (name[0] == 'x' ) return INPUT;
    else if (name[0] == 'y' ) return EXIST;
    else if (name[0] == 'B' ) return PREDBV;
    else if (name[0] == 'I' ) return PREDIV;
    else if (name[0] == 's' ) {
        if ( *(name.end()) == 't' ) return STATE_N;
        else                        return STATE;
    }
    else if (name[0] == 'n') {
        if ( *(name.end()) == 't' ) return LEN_N;
        else                        return LEN;
    }
    else return MODULE;
}

bool VmtNode::hasParam()
{
    for (size_t i = 0; i < PI_NUM; ++i) {
        if (!_paramList[i].empty())
            return 1;
    }
    return 0;
}

bool VmtNode::haveSameParam(VmtNode* n)
{
    for (size_t i = 0; i < PI_NUM; ++i) {
        set<string> s0,s1;
        for (size_t j = 0, size = _paramList[i].size(); j < size; ++j)
            s0.insert(_paramList[i][j]->_name);
        for (size_t j = 0, size = n->_paramList[i].size(); j < size; ++j)
            s1.insert(n->_paramList[i][j]->_name);
        for (set<string>::iterator it = s1.begin(); it != s1.end(); ++it)
            if (s0.find(*it) == s0.end())
                return 0;
    }
    return 1;
}

void VmtNode::addChild(VmtNode* n)
{
    _children.push_back(n);
}

void VmtNode::clearParam(const size_t& level)
{
    #ifndef VMTNODE_NDEBUG
        cout << string(level*3,' ') << _name << " " << this << " " << Aut::getTypeStr(_type) << " " << _flag;
        if      (_flag == gflag)     cout << " visited";
        else if (Aut::isLEAF(_type)) cout << " LEAF";
        cout << endl;
    #endif
    if ( _flag == gflag || Aut::isLEAF(_type) ) return;
    
    _flag = gflag;
    
    for (size_t i = 0; i < PI_NUM; ++i)
        _paramList[i].clear();
    for (size_t i = 0, size = _children.size(); i < size; ++i)
        _children[i]->clearParam(level+1);
}

void VmtNode::buildParam(const size_t& level)
{
    #ifndef VMTNODE_NDEBUG
        cout << string(level*3,' ') << _name << " " << this << " " << Aut::getTypeStr(_type) << " " << _flag;
        if      (_flag == gflag)     cout << " visited";
        else if (Aut::isLEAF(_type)) cout << " LEAF";
        cout << endl;
    #endif
    if ( _flag == gflag || Aut::isLEAF(_type) ) return;
    _flag = gflag;

    // do not push CONST0 CONST1 into _paramList
    vector<set<size_t> > count(PI_NUM,set<size_t>());
    for (size_t i = 0, size = _children.size(); i < size; ++i) {
        const VmtType& type = _children[i]->_type;
        if ( Aut::isPI(type) ) {
            count[type].insert( _children[i]->_idx );
        }
    }
    // push parameters into _paramList increasingly
    for (size_t i = 0; i < PI_NUM; ++i) {
        for (set<size_t>::iterator it = count[i].begin(); it != count[i].end(); ++it) {
            _paramList[i].push_back(Aut::piList[i][*it]);
        }
    }
}

void VmtNode::collectPARAM(VmtNodeList& PARAMList)
{
    if (_flag == gflag) return;
    _flag = gflag;
    if (_type == PARAM) PARAMList.push_back(this);
    for (size_t i = 0, size = _children.size(); i < size; ++i)
        _children[i]->collectPARAM(PARAMList);
}

void VmtNode::writeParamHead(ofstream& file)
{
    assert( (_type == MODULE) );
    bool isfirst = 1;
    #ifndef VMTNODE_NDEBUG
        cout << "[VmtNode::writeParamHead]";
    #endif
    for (size_t i = 0; i < PI_NUM; ++i) {
        for (size_t j = 0, size = _paramList[i].size(); j < size; ++j) {
            #ifndef VMTNODE_NDEBUG
                cout << " " << _paramList[i][j]->_name 
                     << " " << Aut::getTypeStr(_paramList[i][j]->_type);
            #endif
            if (!isfirst) file << " ";
            isfirst = 0;
            file << "(" << _paramList[i][j]->_name;
            if (i == 3 || i == 5 || i == 7) {
                file << " Int)";
            }
            else {
                file << " Bool)";
            }
        }
    }
    #ifndef VMTNODE_NDEBUG
        cout << endl;
    #endif
}

void VmtNode::writeParamBody(const string& fname, ofstream& file)
{
    file << "(" << fname;
    for (size_t i = 0; i < PI_NUM; ++i) {
        for (size_t j = 0, size = _paramList[i].size(); j < size; ++j)
            file << " " << _paramList[i][j]->_name;
    }
    file << ")";
}

void VmtNode::shiftStateVar(const size_t& delta)
{
    if ( _flag == gflag || (_type != PARAM && !Aut::isIMD(_type)) ) return;
    
    _flag = gflag;
    if (_type == PARAM) {
        assert((_children.empty()));
        
        // change STATE 
        VmtNodeList tmp;
        for (size_t i = 0, size = _paramList[STATE].size(); i < size; ++i)
            tmp.push_back( Aut::piList[STATE][ _paramList[STATE][i]->_idx + delta ] );
        _paramList[STATE] = tmp;
        
        // change STATE_N
        tmp.clear();
        for (size_t i = 0, size = _paramList[STATE_N].size(); i < size; ++i)
            tmp.push_back( Aut::piList[STATE_N][ _paramList[STATE_N][i]->_idx + delta ] );
        _paramList[STATE_N] = tmp;
        return;
    }

    for (size_t i = 0, size = _children.size(); i < size; ++i) {
        _children[i]->shiftStateVar(delta);
        //cout << "node = " << _name << " children[" << i << "] = " << _children[i]->_name << endl;
        const VmtType& type = _children[i]->_type;
        if (type != STATE && type != STATE_N) continue;
        _children[i] = Aut::piList[type][ _children[i]->_idx + delta ];
    }
}
