pragma solidity ^0.5.1;

contract coin_ico {
    
    // Total number of coin
    uint public max_coins = 1000000;
    
    // Conversion rate 
    uint public coins_per_dollar = 1000;
    
    // Total number of coin bought
    uint public total_coins_bought = 0;
    
    // Equity mappings
    mapping(address => uint) equity_coin;
    mapping(address => uint) equity_dollar;

    // Modifier
    modifier can_buy_coins(uint dollars_invested){
        require(dollars_invested * coins_per_dollar + total_coins_bought <= max_coins);
        _;
    }

    // Getting th equity of the investor in coins
    function equity_in_coin(address investor) external view returns(uint){
        return equity_coin[investor];
    }

    // Getting the equity of the investor in dollars
    function equity_in_dollars(address investor) external view returns(uint){
        return equity_dollar[investor];
    }

    // Buying coins
    function buy_coin(address investor, uint dollars) external
    can_buy_coins(dollars) {
        uint coins_bought = dollars * coins_per_dollar;
        equity_coin[investor] += coins_bought;
        equity_dollar[investor] = equity_coin[investor] / coins_per_dollar;
        total_coins_bought += coins_bought;
    }

    // Selling coins
    function sell_coin(address investor, uint coins_selling) external {
        equity_coin[investor] -= coins_selling;
        equity_dollar[investor] = equity_coin[investor] / coins_per_dollar;
        total_coins_bought -= coins_selling;
    }
}
