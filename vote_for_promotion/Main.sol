// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Main{

    // 사안
    string private _content = "Do you agree to promote Cho Young-joon to the manager position?";

    //첫번째 지갑 주소 소유자 - ceo
    //두번째 지갑 주소 소유자 - 팀장
    //세번째 지갑 주소 소유자 - 같은 팀 팀원
    address[3] private fix_voter = [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db];

    address[3] private check_voter;

    uint256[2] public _result = [0, 0];

    function getContent() public view virtual returns (string memory) {
        return _content;
    }

    function vote(address voter, bool opinion) public returns (string memory) {
        bool check = false;
        for(uint256 i = 0; i < 3; i++){
            if(fix_voter[i] == voter){
                if(check_voter[i] == voter){
                    return "already";
                }
                check_voter[i] = voter;
                check = true;
                break;
            }
        }
        if(check){

            if(opinion){
                _result[0] += 1;
            }else{
                _result[1] += 1;
            }
            return "true";

        }else{
            return "no permission";
        }
    }

    function getAgreement() public view returns (uint256) {
        return _result[0];
    }

    function getOpposition() public view returns (uint256) {
        return _result[1];
    }

}