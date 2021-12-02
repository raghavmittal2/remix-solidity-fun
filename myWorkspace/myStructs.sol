pragma solidity 0.5.1;

contract myStructs {
    //an array of People structs which is accecisble by people variable
    //Person[] public people;

    mapping(uint256 => Person) public people;
    uint256 public countPeople;

    //struct is a datatype which can store complex information about a particualar object/ thing irl
    struct Person {
        uint _id;
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname) public {
        //pushing Persons on the array people
        //people.push(Person(_firstname, _lastname));

        //incrementing the counter every time the function is accessed
        countPeople += 1;

        //adding the entry to the people hashmap with countPeople as the key and Person struct as the value
        people[countPeople] = Person(countPeople, _firstname, _lastname);
    }
}