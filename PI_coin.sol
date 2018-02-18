pragma solidity ^0.4.2;
contract PI {
    /* Setting total supply to fixed amount. */
    uint256 _totalsupply = 1000000000;

    /* an array of all balances */
    mapping (address => uint256) public balanceOf;
    mapping(address => mapping (address => uint256)) allowed;

    /* Initializer */
    function PI (uint256 initialSupply) public {   
        balanceOf[msg.sender] = initialSupply;  // Give the creator all initial tokens
    }

    /* Transfer coins */
    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);  // Check if sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
        balanceOf[msg.sender] -= _value;    // Subtract from the sender
        balanceOf[_to] += _value;   // Add the same to the recipient
    }

    function totalSupply() public constant returns (uint256 thetotalsupply) {
        thetotalsupply = _totalsupply;
        return thetotalsupply;
    }

    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balanceOf[_owner];
    }

    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success) {
        if (balanceOf[_from] >= _amount && allowed[_from][msg.sender] >= _amount && _amount>0 && balanceOf[_to] + _amount > balanceOf[_to]) {
            balanceOf[_from]-=_amount;
            balanceOf[_to]+=_amount;
            return true;
        } else {
            return false;
        }
    }
}