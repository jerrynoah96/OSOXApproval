pragma solidity ^0.8.1;
import "../libraries/LibOrder.sol";
import "../libraries/LibFillResults.sol";


interface IOXExchangeCore{
    
     /// @dev Fills the input order.
    /// @param order Order struct containing order specifications.
    /// @param takerAssetFillAmount Desired amount of takerAsset to sell.
    /// @param signature Proof that order has been created by maker.
    
    function fillOrder(
        LibOrder.Order memory order,
        uint256 takerAssetFillAmount,
        bytes memory signature
    )
        external
        payable
        returns (LibFillResults.FillResults memory fillResults);
}