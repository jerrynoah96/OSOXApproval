pragma solidity ^0.8.1;
import "../libraries/SaleKindInterface.sol";
import "../contracts/AuthenticatedProxy.sol";

interface IOpenseaExchangeCore {
     /* Fee method: protocol fee or split fee. */
    enum FeeMethod { ProtocolFee, SplitFee }

    

    function approveOrder_ (
        address[7] memory addrs,
        uint[9] memory uints,
        FeeMethod feeMethod,
        SaleKindInterface.Side side,
        SaleKindInterface.SaleKind saleKind,
        AuthenticatedProxy.HowToCall howToCall,
        bytes calldata,
        bytes memory replacementPattern,
        bytes memory staticExtradata,
        bool orderbookInclusionDesired) 
        external;

}