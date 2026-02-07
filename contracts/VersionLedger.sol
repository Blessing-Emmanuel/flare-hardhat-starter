// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract VersionHistory {

    struct Version {
        bytes32 contentHash;   
        uint256 parent;     // keep track of previous version 
        uint256 timestamp;
        address author;
    }

    Version[] public versions;

    mapping(address => Version) public version;

    constructor(bytes32[] memory x) {}

    function appendVersion(bytes32 contentHash, uint256 parent, uint256 timestamp, FdcProof calldata proof) external {
        versions.push(Version(contentHash, parent, timestamp, msg.sender));
        // cal fdc verifier contract to verify timestamp, proof and merkle root
        // import fdc
    }

    function retrieveVersion(uint256 index) external view returns (Version memory) {
        require(index < versions.length, "Version index out of bounds");
        return versions[index];
    }

    function retrieveLatestVersionTimestamp() external view returns (uint256) {
        if (versions.length == 0) {
            revert("No versions available");
        }
        return versions[versions.length - 1].timestamp;
    }

    
    function getVersionCount() external view returns (uint256) {
        return versions.length;
    }

}