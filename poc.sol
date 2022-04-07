contract Test {
	function outer(uint[][] calldata foo) public returns (uint) {
		return this.doIt(foo);
	}

	function doIt(uint[][] memory bar) public returns (uint) {
		return bar[0][1];
	}

	function ext() public returns (uint) {
		bytes memory buffer = abi.encodeWithSignature("outer(uint256[][])", uint256(32), uint256(1), uint256(32), uint256(2), uint256(12));
		(bool succ, bytes memory ret) =  address(this).call(buffer);
		require(succ);
		uint a = abi.decode(ret, (uint));
		return a;
	}
}
