// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract voting{
    uint internal First;
    uint internal Second;
    uint internal Third;
    uint16 internal Candidate;
    constructor(){
        First=0;
        Second=0;
        Third=0;
        Candidate=1;

    }
    struct Member{
        uint16 age;
        string name;
        address person;
    }
    Member[] internal mem;
    mapping(uint=>Member)internal allmembers;
    mapping(address=>Member)internal votemember;
    mapping(address=>address)internal voter;
    mapping(address=>uint16)internal check;
    modifier isSmall(uint16 no){
        require(no<4 && no>0,"problem in no");
        _;
    }
    
    function setMember(string memory _name,uint16 _age)public isSmall(Candidate){
        allmembers[Candidate]=Member(_age,_name,msg.sender);
        mem.push(Member(_age,_name,msg.sender));
        check[msg.sender]=Candidate;
        Candidate++;
    }
    function getCandidate()public view returns(uint16){
        return Candidate;
    }
    function getMembers()public view returns(Member[] memory){
        
        return mem;
    }
    
    
    function GiveVote(address _vote)public returns (uint8){
        
        voter[msg.sender]=_vote;
        uint16 number=check[_vote];
        
        if(number==1){
            First++;
            return 1;
        }
        if(number==2){
            Second++;
            return 1;
        }
        if(number==3){
            Third++;
            return 1;
        }
        else{
            return 0;
        }
    }
    function getAllVote()public view returns(uint,uint,uint){
        return (First,Second,Third);
    }
    function voterVote()public view returns(address){
        address a1=voter[msg.sender];
        return a1;

    }

    //contract address

//0xfa4c1fb70bddf67cc1f5029a6272adfe4f0baa85

// https://eth-mainnet.g.alchemy.com/v2/b9PSYBnjCEAb4iPngTb5rZFobyFA8pl_












}
