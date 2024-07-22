// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";
import "forge-std/console.sol";

contract DeployHackMeIfYouCan is Script {
    function run() external {
        bytes32 password = keccak256("malthus");
        bytes32[15] memory data;

        vm.startBroadcast();
        new HackMeIfYouCan(password, data);
        vm.stopBroadcast();
        console.log("Script deployed");
    }
}
