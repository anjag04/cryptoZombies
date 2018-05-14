/*

*/
pragma solidity ^0.4.19;

contract ZombieFactory 
{
    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie 
    {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    // declare mappings here
    // map THIS to => THIS
    // key => value

    // Owner has an address
    // Zombie has an uint (id)
      mapping (uint => address) public zombieToOwner;
      mapping (address => uint) ownerZombieCount;



    function _createZombie(string _name, uint _dna) private 
    {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        NewZombie(id, _name, _dna);
    } 

    function _generateRandomDna(string _str) private view returns (uint) 
    {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public 
    {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    // Msg.Sender
      zombieToOwner[id] = msg.sender;
      ownerZombieCount[msg.sender]++;
      NewZombie(id, _name, _dna);
}
