// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract IsOwner {
    address owner;
    constructor() {
        owner = msg.sender;
    }

    modifier validateIsOwner() {
        require(owner == msg.sender, "Owner can only get the secret value");
        _;
    }
}


contract SecretVaultInfo {
    string secretVaultInfo;

    constructor(string memory _secretVaultInfo) {
        secretVaultInfo = _secretVaultInfo;
    }

    function getSecretVaultInfo() public view returns(string memory) {
        return secretVaultInfo;
    }
}

contract SecretVault is IsOwner{
    address secretVaultAddr;

    constructor(string memory _secretVaultInfo) {
        SecretVaultInfo _secretVaultInstance = new SecretVaultInfo(_secretVaultInfo);
        secretVaultAddr = address(_secretVaultInstance);
        super;
    }

    function getSecretVaultInfo() validateIsOwner public view returns(string memory) {
        return SecretVaultInfo(secretVaultAddr).getSecretVaultInfo();
    }

}