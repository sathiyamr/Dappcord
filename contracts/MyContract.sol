// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    int8  public myInt8 = -1;
    uint8 public myUint8 = 2;
    uint256 public myUint256 = 3;
    string public myString = "Sathyamoorthy";
    bytes32 public myBytes32 = "Sathiya Bytes Test";
    struct MyStruct {
        uint8 myUint;
        string myString;
    }
    MyStruct public myNewStruct = MyStruct(4, "Sathiyamoorthy yes");
    uint[] public myUinitArray = [1,2,3];
    string[] public myStringArray = ["apple", "banana"];
    uint[][] public myArray2D = [[1,2], [3,4]];
    string[] public values;
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    struct Book {
        string author;
        string title;
    }
    mapping(address => mapping(uint => Book)) public myBooks;

    uint[] numbersList = [1,2,3,4,5,6,7,8,9,10];
    address ownerAdd;


    constructor() {
        names[0] = "A";
        names[1] = "B";
        names[2] = "C";
        ownerAdd = msg.sender;
    }

    function addArraycontent(string memory _value) public {
        values.push(_value);
    }

    function getValueCnt() view public returns(uint)  {
        return values.length;
    }

    function addBooks(uint _id, string memory _author, string memory _title) public {
        books[_id] = Book(_author, _title);
    }

    function addMyBooks(uint _id, string memory _author, string memory _title) public {
        myBooks[msg.sender][_id] = Book(_author, _title);
    }


    function getEventCount() public view returns(uint) {
        uint count = 0;
        for(uint _i = 0; _i < numbersList.length; _i++) {
            if(isEvenOrOdd(numbersList[_i])) {
                count +=1;
            }
        }

        return count;
    }

    function isEvenOrOdd(uint _number) public pure returns(bool) {
        if(_number % 2 == 0) {
            return true;
        }
        else {
            return false;
        }
    }

    function isOwner() public view returns(bool) {
        return msg.sender == ownerAdd;
    }


}