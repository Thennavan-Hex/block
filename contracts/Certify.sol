// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Certify {
    struct Record {
        uint mineTime;
        uint blockNumber;
        string instituteName;
        string recipientName;
        string courseName;
        string marks;
        string dateOfCompletion;
    }

    mapping (bytes32 => Record) private docHashes;

    constructor() {
    
    }

    // Function that is used to store records on the blockchain
    function addDocHash(bytes32 hash, string memory insti, string memory reci, string memory course, string memory grade, string memory doc) public {
        Record memory newRecord = Record(block.timestamp, block.number, insti, reci, course, grade, doc);
        docHashes[hash] = newRecord;
    }

    // Verify whether a hash exists on the blockchain and retrieve the corresponding record
    function findDocHash(bytes32 hash) public view returns(uint, string memory, string memory, string memory, string memory, string memory) {
        return (docHashes[hash].blockNumber, docHashes[hash].instituteName, docHashes[hash].recipientName, 
                docHashes[hash].courseName, docHashes[hash].marks, docHashes[hash].dateOfCompletion);
    }
}
