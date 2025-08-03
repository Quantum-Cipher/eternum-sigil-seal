// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Eternum Sigil Memory
/// @author @Cipher
/// @notice Stores CID + sigil fingerprint as a proof-of-memory

contract SigilMemory {
    struct Sigil {
        string sigilId;
        string walletAddress;
        string cid;
        string logHash;
        string timestamp;
    }

    mapping(string => Sigil) public sigils;

    event SigilBound(string sigilId, string walletAddress, string cid, string logHash, string timestamp);

    function bindSigil(
        string memory _sigilId,
        string memory _walletAddress,
        string memory _cid,
        string memory _logHash,
        string memory _timestamp
    ) public {
        require(bytes(sigils[_sigilId].sigilId).length == 0, "Sigil already exists");

        sigils[_sigilId] = Sigil({
            sigilId: _sigilId,
            walletAddress: _walletAddress,
            cid: _cid,
            logHash: _logHash,
            timestamp: _timestamp
        });

        emit SigilBound(_sigilId, _walletAddress, _cid, _logHash, _timestamp);
    }

    function getSigil(string memory _sigilId) public view returns (Sigil memory) {
        return sigils[_sigilId];
    }
}
