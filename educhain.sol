// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EduChainDAO {

    address public owner;

    constructor(){
        owner = msg.sender;
        isMember[msg.sender] = true;
        memberCount = 1;
    }

    struct Application {
        uint id;
        address student;
        string ipfsHash;
        uint approve;
        uint reject;
        bool finalized;
        bool approved;
    }

    uint public applicationCount;

    mapping(uint => Application) public applications;

    // 🔥 Track voting
    mapping(uint => mapping(address => bool)) public hasVoted;

    // 🔥 DAO MEMBERS
    mapping(address => bool) public isMember;
    uint public memberCount;

    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier onlyMember(){
        require(isMember[msg.sender], "Not DAO member");
        _;
    }

    // 🔥 Add DAO members
    function addMember(address _member) public onlyOwner {
        require(!isMember[_member], "Already member");
        isMember[_member] = true;
        memberCount++;
    }

    // APPLY
    function applyForScholarship(string memory _ipfsHash) public {
        applicationCount++;

        applications[applicationCount] = Application({
            id: applicationCount,
            student: msg.sender,
            ipfsHash: _ipfsHash,
            approve: 0,
            reject: 0,
            finalized: false,
            approved: false
        });
    }

    // VOTE (ONLY MEMBERS + ONE VOTE)
    function vote(uint id, bool decision) public onlyMember {
        require(!applications[id].finalized, "Already finalized");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        if(decision){
            applications[id].approve++;
        } else {
            applications[id].reject++;
        }
    }

    // FINALIZE (QUORUM BASED)
    function finalizeApplication(uint id) public onlyMember {
        Application storage app = applications[id];

        require(!app.finalized, "Already finalized");

        uint totalVotes = app.approve + app.reject;

        // 🔥 QUORUM: at least 50% of members must vote
        require(totalVotes * 100 / memberCount >= 50, "Quorum not reached");

        // 🔥 DECISION
        if(app.reject >= app.approve){
            app.approved = false;
        } else {
            app.approved = true;
        }

        app.finalized = true;
    }

    // GET
    function getApplication(uint id) public view returns (
        uint,
        address,
        string memory,
        uint,
        uint,
        bool,
        bool
    ) {
        Application storage a = applications[id];
        return (
            a.id,
            a.student,
            a.ipfsHash,
            a.approve,
            a.reject,
            a.finalized,
            a.approved
        );
    }
}