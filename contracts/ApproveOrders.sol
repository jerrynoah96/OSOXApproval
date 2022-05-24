pragma solidity ^0.8.1;
import "../interfaces/IOpenseaExchangeCore.sol";
import "../interfaces/IOXExchangeCore.sol";
import "../libraries/SaleKindInterface.sol";
import "../libraries/LibOrder.sol";

contract OSOXApproval {

    enum HowToCall { Call, DelegateCall }

    struct OSOrderDetails{
        address[7] addrs;
        uint[9] uints;
       IOpenseaExchangeCore.FeeMethod feeMethod;
        SaleKindInterface.Side side;
        SaleKindInterface.SaleKind saleKind;
        AuthenticatedProxy.HowToCall howToCall;
        bytes calldat;
        bytes replacementPattern;
        bytes staticExtradata;
        bool orderbookInclusionDesired;
    }

    struct OxOrdersParam{
        LibOrder.Order details;
        uint256 takerAssetFillAmounts;
        bytes signatures;
    }

    
    //@notice - OSC just stands for openSea exchange core while OXC for OX Exchange core 
    // do note that these are not conventional nor made by openSea or OX- these were abbreviated for the purpose of this conyr
    IOpenseaExchangeCore OSC;
    IOXExchangeCore OXC;

    constructor( address _oscAddress, address _oxcAddress ){
        OSC = IOpenseaExchangeCore(_oscAddress);
        OXC = IOXExchangeCore(_oxcAddress);
    }



    function approveOrders(OSOrderDetails[] memory OSOrders, OxOrdersParam[] memory OXOrders) public returns(bool){

        for(uint256 i = 0; i < OSOrders.length; i++){
            OSC.approveOrder_(
                OSOrders[i].addrs,
                OSOrders[i].uints,
                OSOrders[i].feeMethod,
                OSOrders[i].side,
                OSOrders[i].saleKind,
                OSOrders[i].howToCall,
                OSOrders[i].calldat,
                OSOrders[i].replacementPattern,
                OSOrders[i].staticExtradata,
                OSOrders[i].orderbookInclusionDesired);
        }

        for(uint256 i =0; i < OXOrders.length; i++){
            OXC.fillOrder(OXOrders[i].details, OXOrders[i].takerAssetFillAmounts, OXOrders[i].signatures);
            
        }

        return true;

        

    }


}