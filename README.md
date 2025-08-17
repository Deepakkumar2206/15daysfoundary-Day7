## ERC20 Mintable Token (Foundry)

### This project demonstrates how to manage dependencies in Foundry by integrating OpenZeppelin Contracts.
### We build a simple ERC20 Mintable Token where only the contract owner can mint new tokens.

### Key takeawys
- Using **forge install** to add dependencies.
- Managing imports with remappings.txt.
- Inheriting OpenZeppelin contracts (ERC20, Ownable).
- Writing tests to check access control.

### Prerequisites

Install Foundry (Forge, Cast, Anvil):

```shell
curl -L https://foundry.paradigm.xyz | bash

foundryup
```

### Install OpenZeppelin dependencies

```shell
forge install OpenZeppelin/openzeppelin-contracts
```

### What is foundry.toml?

- Config file for Foundry.
- It defines Solidity version, optimizer settings, and remappings for dependencies.

- Example:

```shell
[profile.default]
src = 'src'
out = 'out'
libs = ['lib']
optimizer = true
optimizer_runs = 200
remappings = [
  '@openzeppelin/=lib/openzeppelin-contracts/contracts/'
]
```

### Remappings Explanation
#### Remappings in Foundry allow for shortening import paths in Solidity.

- Instead of writing long paths like

```shell
import "../../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
```

- we can set a remapping in remappings.txt
```shell
@openzeppelin/contracts/=contracts/
```

- Then import becomes simpler

```shell
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
```
### Contracts Explanation
#### Ownable.sol (from OpenZeppelin)
- Provides ownership access control.
- Functions restricted with onlyOwner can only be executed by the owner.
- Includes transferOwnership and renounceOwnership.

#### ERC20Mintable.sol (Main Contract)
Located in src/ERC20Mintable.sol
- Inherits:
ERC20 - standard token implementation.
Ownable - restricts minting to the owner.
- Adds a mint(address to, uint256 amount) function, restricted with onlyOwner.

#### ERC20Mintable.t.sol (Test File)

Located in test/ERC20Mintable.t.sol
- testOwnerCanMint() - verifies owner can mint tokens.
- test_RevertWhen_NonOwnerMints() - ensures non-owners cannot mint.

### Build Contracts
```shell
forge build
```

### Run Test

```shell
forge test -vvvv
```

### Example Output

```shell
[PASS] testOwnerCanMint() (gas: 59328)
[PASS] test_RevertWhen_NonOwnerMints() (gas: 14493)
Suite result: ok. 2 passed; 0 failed
```

### End of the Project.
