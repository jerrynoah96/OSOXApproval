pragma solidity 0.8.1;

library SaleKindInterface {

    /**
     * Currently supported kinds of sale: fixed price, Dutch auction. 
     * English auctions cannot be supported without stronger escrow guarantees.
     * Future interesting options: Vickrey auction, nonlinear Dutch auctions.
     */
    enum SaleKind { FixedPrice, DutchAuction }

     /**
     * Side: buy or sell.
     */
    enum Side { Buy, Sell }

    
}