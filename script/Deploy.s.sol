// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../contracts/SigilMemory.sol";

contract DeploySigilMemory is Script {
    function run() external {
        vm.startBroadcast();
        new SigilMemory();
        vm.stopBroadcast();
    }
}
