pragma solidity 0.5.1;

contract myContract {
    mapping(uint256 => Person) public people;
    uint256 public countPeople;
    address owner;

    constructor() public {
        //assigning the owner as the person who deploys this SmartContract
        owner = msg.sender;
    }

    modifier onlyOwner() {
        /*msg.sender is a way inside solidity to know the metadata of who called the function. We are comparing this with the address of the owner to modify access of functions */
        require(msg.sender == owner);
        _;
    }

    struct Person {
        uint _id;
        string _firstname;
        string _lastname;
    }

    //added the onlyOwner access modifier so that only the owner can add people
    function addPerson(string memory _firstname, string memory _lastname) public onlyOwner {
        incrementCount();
        people[countPeople] = Person(countPeople, _firstname, _lastname);
    }

    function incrementCount() internal {
        countPeople += 1;
    }
}