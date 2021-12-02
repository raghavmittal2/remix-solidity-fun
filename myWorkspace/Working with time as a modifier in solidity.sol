pragma solidity 0.5.1;

contract myContract {
    mapping(uint256 => Person) public people;
    uint256 public countPeople = 0;
    //time is measured in seconds ie Epoch Time
    uint256 openingTime = 1638417252;

    //block.timestamp gives us the time of the current block on the blockchain. if this becomes greater than the openeingTime then let the user add people
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        uint _id;
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname) public onlyWhileOpen {
        incrementCount();
        people[countPeople] = Person(countPeople, _firstname, _lastname);
    }

    function incrementCount() internal {
        countPeople += 1;
    }
}