#include "autMgr.h"
#include <map>

extern AutMgr* autmgr;
static size_t& gflag = autmgr->getGFlag();

string VmtNode::getTypeStr() 
{
    string typeStr;
    switch (_type) {
        case INPUT   : typeStr = "INPUT";
                       break;
        case INPUT_N : typeStr = "INPUT_N";
                       break;
        case STATE   : typeStr = "STATE";
                       break;
        case STATE_N : typeStr = "STATE_N";
                       break;
        case LEN     : typeStr = "LEN";
                       break;
        case LEN_N   : typeStr = "LEN_N";
                       break;
        case PARAM   : typeStr = "PARAM";
                       break;
        case NOPARAM : typeStr = "NOPARAM";
                       break;
        case OTHER   : typeStr = "OTHER";
                       break;
        default      : typeStr = "INVALID";
                       break;
    }
    return typeStr;
}

void VmtNode::print(const size_t level) 
{
    cout << string(level*3,' ') << _name << " " << this << " " << getTypeStr() << " " << _flag;
    for (size_t i = 0; i < 6; ++i) {
        for (VmtNodeSet::iterator it=_paraList[i].begin(); it!=_paraList[i].end(); ++it)
            cout << " " << (*it)->_name;
    }
    cout << endl;
    for (size_t i=0,size=_children.size(); i<size; ++i) {
        _children[i]->print(level+1);
    }
}

void VmtNode::write(ofstream& outFile)
{
    // NOPARAM is handled in the else branch
    cout << "write " << _name << endl;
    if (_flag == gflag) {
        cout << "    visited\n";
        if (_type == PARAM) {
            cout << "        PARAM\n";
            assert((_children.empty()));
            assert((_source->_flag == gflag));
            assert((hasParam()));
            outFile << "(" << _source->_name;
            for (size_t i = 0; i < 6; ++i) {
                for (VmtNodeSet::iterator it = _paraList[i].begin(); it != _paraList[i].end(); ++it) {
                    outFile << " " << (*it)->_name;
                }
            }
            outFile << ")";
        }
        else {
            if (!_children.empty()) {
                cout << "        non-empty\n";
                assert((hasParam()));
                outFile << "(" << _name;
                for (size_t i = 0; i < 6; ++i) {
                    for (VmtNodeSet::iterator it = _paraList[i].begin(); it != _paraList[i].end(); ++it) {
                        outFile << " " << (*it)->_name;
                    }
                }
                outFile << ")";
            }
            else {
                outFile << _name;
            }
        }
        return;
    }
    _flag = gflag;
    if (_type == PARAM) {
        cout << "    PARAM\n";
        assert((_children.empty()));
        assert((_source->_flag == gflag));
        assert((hasParam()));
        outFile << "(" << _source->_name;
        for (size_t i = 0; i < 6; ++i) {
            for (VmtNodeSet::iterator it = _paraList[i].begin(); it != _paraList[i].end(); ++it) {
                outFile << " " << (*it)->_name;
            }
        }
        outFile << ")";
    }
    else {
        if (!_children.empty()) {
            cout << "    non-empty\n";
            outFile << "(" << _name;
            for (size_t i = 0, size = _children.size(); i < size; ++i) {
                outFile << " ";
                _children[i]->write(outFile);
            }
            outFile << ")";
        }
        else {
            cout << "    empty\n";
            outFile << _name;
        }
    }
}

// Merge v2 into v1 with repetition eliminated
void VmtNode::merge(VmtNodeSet& v1, const VmtNodeSet& v2) 
{
    for (VmtNodeSet::iterator it = v2.begin(); it != v2.end(); ++it)
        v1.insert(*it);
}

bool VmtNode::hasParam()
{
    for (size_t i = 0; i < 6; ++i) {
        if (!_paraList[i].empty())
            return 1;
    }
    return 0;
}

bool VmtNode::haveSameParam(VmtNode* n)
{
    for (size_t i = 0; i < 6; ++i)
        for (VmtNodeSet::iterator it=n->_paraList[i].begin(); it!=n->_paraList[i].end(); ++it) {
            VmtNodeSet::iterator jt = _paraList[i].find(*it);
            if (jt == _paraList[i].end()) return 0;
        }
    return 1;
}

void VmtNode::addChild(VmtNode* n)
{
    _children.push_back(n);
}

void VmtNode::clearParam()
{
    cout << "clearParam " << _name << endl;
    cout << "    _flag=" << _flag << endl;
    cout << "    gflag=" << gflag << " " << &gflag << endl;
    if (_flag == gflag) {
        cout << "    visited\n";
        return;
    }
    else if(_type == PARAM) {
        cout << "    PARAM\n";
        return;
    }
    else if(_type == NOPARAM) {
        cout << "    NOPARAM\n";
        return;
    }
    _flag = gflag;
    
    for (size_t i = 0; i < 6; ++i)
        _paraList[i].clear();
    for (size_t i = 0,size = _children.size(); i < size; ++i)
        _children[i]->clearParam();
}

void VmtNode::buildParam()
{
    cout << "buildParam " << _name << endl;
    if (_flag == gflag) {
        cout << "    visited\n";
        return;
    }
    else if(_type == PARAM) {
        cout << "    PARAM\n";
        return;
    }
    else if(_type == NOPARAM) {
        cout << "    NOPARAM\n";
        return;
    }
    _flag = gflag;
    if (_children.empty()) {
        switch (_type) {
            case INPUT   :
                _paraList[0].insert(this);
                break;
            case STATE :
                _paraList[1].insert(this);
                break;
            case LEN   :
                _paraList[2].insert(this);
                break;
            case INPUT_N :
                _paraList[3].insert(this);
                break;
            case STATE_N :
                _paraList[4].insert(this);
                break;
            case LEN_N   :
                _paraList[5].insert(this);
                break;
            default      :
                cout << "[ERROR::VmtNode::buildParam] invalid type=" << _type << endl;
                break;
        }
    }
    else {
        for (size_t i = 0, size = _children.size(); i < size; ++i) {
            _children[i]->buildParam();
            for (size_t j = 0; j < 6; ++j)
                merge(_paraList[j],_children[i]->_paraList[j]);
        }
    }
}

void VmtNode::writeParam(ofstream& file)
{
    bool isfirst = 1;
    for (size_t j = 0; j < 6; ++j) {
        for (VmtNodeSet::iterator it=_paraList[j].begin(); it != _paraList[j].end(); ++it) {
            if (!isfirst) file << " ";
            isfirst = 0;
            file << "(" << (*it)->_name;
            if (j == 2 || j == 5) {
                file << " Int)";
            }
            else {
                file << " Bool)";
            }
        }
    }
}

void VmtNode::shiftStateVar(const size_t& delta)
{
    //cout << "node=" << _name <<endl;
    if (_flag == gflag) return;
    /*
    cout << "node=" << _name << " unvisited"<<endl;
    for (size_t i=0;i<6;++i){
        for (VmtNodeSet::iterator it=_paraList[i].begin();it!=_paraList[i].end();++it)
            cout << (*it)->getName() << endl;
    }
    */
    _flag = gflag;
    if (_type == PARAM) {
        assert((_children.empty()));
        
        VmtNodeSet tmp;
        for (VmtNodeSet::iterator it = _paraList[1].begin(); it != _paraList[1].end(); ++it)
            tmp.insert( Aut::state[0][ (*it)->_idx + delta ] );
        _paraList[1] = tmp;
        
        tmp.clear();
        for (VmtNodeSet::iterator it = _paraList[4].begin(); it != _paraList[4].end(); ++it)
            tmp.insert( Aut::state[1][ (*it)->_idx + delta ] );
        _paraList[4] = tmp;
        return;
    }

    for (size_t i = 0, size = _children.size(); i < size; ++i) {
        _children[i]->shiftStateVar(delta);
        //cout << "node = " << _name << " children[" << i << "] = " << _children[i]->_name << endl;
        size_t idx = _children[i]->_idx + delta;
        if (_children[i]->_type == STATE) {
            //cout << "renameSV " << _children[i]->_idx << " -> " <<  xsList[1][svar]->_idx << endl;
            _children[i] = Aut::state[0][idx];
        }
        else if (_children[i]->_type == STATE_N) {
            //cout << "renameSV " << _children[i]->_idx << " -> " <<  xsList[3][svar]->_idx << endl;
            _children[i] = Aut::state[1][idx];
        }
    }
}