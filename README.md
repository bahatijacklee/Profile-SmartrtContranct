# 🧾 User Profile Registry Smart Contract

This Solidity smart contract allows users to register, update, and view their personal profile data securely on the blockchain. Each user is identified by their Ethereum address and can register only once.

---

## 🚀 Features

- ✅ User Registration with `name`, `age`, and `email`
- ✏️ Profile Update by the user
- 🔎 Public View Access via `getProfile()`
- 🔐 Prevents double registration
- 🕒 Tracks registration timestamp
- ⚖️ Access control: Only the owner of the address can update their profile

---

## 🧱 Smart Contract Structure

### 🧍 Struct: `User`

```solidity
struct User {
  string name;
  uint age;
  string email;
  uint256 registeredAt;
  bool isRegistered;
}
````

### 🔐 State Variable

* `mapping(address => User) private users;`
  Stores all registered users by their wallet address.

---

## 📦 Functions

| Function                                                              | Type            | Description                                         |
| --------------------------------------------------------------------- | --------------- | --------------------------------------------------- |
| `register(string memory _name, uint _age, string memory _email)`      | `external`      | Registers a new user. Rejects re-registration.      |
| `updateProfile(string memory _name, uint _age, string memory _email)` | `external`      | Allows registered users to update their profile.    |
| `getProfile(address _user)`                                           | `external view` | Returns full profile details of the specified user. |
| `isUserRegistered(address _user)`                                     | `external view` | Checks if the user is registered.                   |

---

## 🛡️ Security Considerations

* ✅ `require()` checks to prevent multiple registrations.
* ✅ `msg.sender` is used to verify user identity.
* ✅ State visibility kept private where appropriate.
* ❗️ Does not store or hash emails — ensure privacy at UI level if needed.

---

## 🧪 Testing

You can test and deploy this contract using:

* [Remix IDE](https://remix.ethereum.org/)
* Hardhat or Truffle
* Compatible with Solidity version `^0.8.20`

---

## 📝 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Author

**Bahati Jacklee**
GitHub: [@bahatijacklee](https://github.com/bahatijacklee)
Feel free to contribute, fork, or open issues!

---
