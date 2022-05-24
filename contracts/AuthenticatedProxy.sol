
pragma solidity ^0.8.1;
import "./TokenRecipient.sol";
import "./OwnedUpgradeabilityStorage.sol";

contract AuthenticatedProxy is TokenRecipient, OwnedUpgradeabilityStorage {

    /* Delegate call could be used to atomically transfer multiple assets owned by the proxy contract with one order. */
    enum HowToCall { Call, DelegateCall }

}