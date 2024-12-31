// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {

    address payable public owner;
    enum Statuses {
        Vacant,
        Occupied
    }
    event Occupy(address _occupant, uint _value);

    Statuses public currentStatus;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier isNotOwner {
        require(owner != msg.sender, "Other than owner");
        _;
    }

    modifier onlyVacant {
        require(currentStatus == Statuses.Vacant, "Currently Occuped");
        _;
    }

    modifier atleast2Ether(uint _amount) {
        require(msg.value >= _amount, "more than or equal to 2 ether");
        _;
    }

    function book() public payable isNotOwner onlyVacant atleast2Ether(2 ether) {
        currentStatus = Statuses.Occupied;
        emit Occupy(msg.sender, msg.value);
    }

}