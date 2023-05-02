// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


interface AggregatorV4Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
}



contract Funding{

    mapping( address => uint256 ) public addressToAmountFunded;

    function fund() public payable {
        uint256 minimumAmountUsd = 50 * 10**18;
        require(getConversionRate(msg.value) >= minimumAmountUsd, "Minimum ETH value is: ......");
        addressToAmountFunded[msg.sender] += msg.value;
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function getVersion() public view returns (uint256){
        AggregatorV4Interface priceFeed = AggregatorV4Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getDesc() public view returns(string memory){
        AggregatorV4Interface priceFeed = AggregatorV4Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.description();
    }

    function getPrice() public view returns(uint256){
        AggregatorV4Interface priceFeed = AggregatorV4Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 10**10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 10**18;
        return ethAmountInUsd;
    }

    function withdraw() payable public {
        
    }
}