/*
  Lesson 1: Making the Zombie Factory
  FROM: https://cryptozombies.io/en/lesson/1/chapter/13
  RESULT: https://share.cryptozombies.io/en/lesson/1/share/CryptoZom?id=Z2l0aHVifDMxMzU5NjM2
*/

//1. Enter solidity version here
pragma solidity ^0.4.19;

//2. Create contract here
contract ZombieFactory 
{
    // declare our event here
    event NewZombie(uint zombieId, string name, uint dna);
    
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie 
    {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private 
    {
        // and fire it here
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
}