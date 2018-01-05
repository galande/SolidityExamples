pragma solidity ^0.4.19;

contract MyVoting{

    bytes32[] candidates;
    mapping(bytes32 => uint) vote;

    mapping(address => voter) voters;

    struct voter{
        bool voted;
        bytes32 delegateTo;
    }

    function MyVoting(bytes32[] candidateList) public{
        candidates = candidateList;
    }

    function getCandidates() constant public returns(bytes32[]) {
        return candidates;
    }

    function getVoterStatus( address voterAddress) public constant returns( string){
        if (voters[voterAddress].voted){
            return "Already Voted ";
        }else{
            return "Has to vote";
        }
    }

    function giveVote(bytes32 candidate) public{
        require(validCandidate(candidate));
        vote[candidate] += 1;
        voters[msg.sender].voted = true;
        voters[msg.sender].delegateTo = candidate;
    }

    function getTotalVoteOf( bytes32 candidate) constant public returns(uint){
        require(validCandidate(candidate));
        return vote[candidate];
    }

    function validCandidate(bytes32 candidate) view internal returns(bool){
        for(uint i= 0; i <= candidates.length; i++){
            if (candidate == candidates[i]){
                return true;
            }
        }
        return false;
    }
}
