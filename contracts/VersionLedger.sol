// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract VersionLedger {
    struct Version {
        bytes32 contentHash;
        uint256 parent;
        uint256 timestamp;
        address author;
    }

    Version[] private versions;

    function appendVersion(bytes32 contentHash, uint256 timestamp) external {
        uint256 parent;
        if (versions.length == 0) {
            parent = 0;
        } else {
            parent = versions.length - 1;
        }
        versions.push(Version({ contentHash: contentHash, parent: parent, timestamp: timestamp, author: msg.sender }));
    }

    function retrieveVersion(uint256 index) external view returns (Version memory) {
        require(index < versions.length, "Version index out of bounds");
        return versions[index];
    }

    function retrieveLatestVersionTimestamp() external view returns (uint256) {
        require(versions.length > 0, "No versions available");
        return versions[versions.length - 1].timestamp;
    }

    function getVersionCount() external view returns (uint256) {
        return versions.length;
    }
}
