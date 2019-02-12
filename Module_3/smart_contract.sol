pragma solidity ^0.4.11;

contract coin.ico{
    
    // Total number of coin
    uint public max_coins = 1000000;
    
    // Conversion rate 
    uint public coins_per_dollar = 1000;
    
    // Total number of coin bought
    uint public coins_bought = 0;
    
    // Equity mappings
    mapping(address => uint) equity_coin;
    mapping(address => uint) equity_dollar;


}
