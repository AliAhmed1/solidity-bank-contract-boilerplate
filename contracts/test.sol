pragma solidity ^0.8.4;

contract Bank{

    mapping(address => uint256) public accounts;

    modifier hasFunds(uint256 _amount){
        require(_amount<=accounts[msg.sender]," insufficient amount");
        _;
    }

    function deposit() public payable {
        accounts[msg.sender] += msg.value;
    }


    function withDraw(uint256 _amount) public hasFunds(_amount){
        payable(msg.sender).transfer(_amount);
    }

    function checkAssets() public view returns(uint256){
        return address(this).balance;
    }
}