// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UserProfileRegistry {
    
    struct User {
        string name;
        uint age;
        string email;
        uint256 registeredAt; // timestamp of registration
        bool isRegistered;
    }

    mapping(address => User) private users;

    /// @notice Register a new user
    function register(string memory _name, uint _age, string memory _email) external {
        require(!users[msg.sender].isRegistered, "Already registered");

        users[msg.sender] = User({
            name: _name,
            age: _age,
            email: _email,
            registeredAt: block.timestamp,
            isRegistered: true
        });
    }

    /// @notice Update existing user profile
    function updateProfile(string memory _name, uint _age, string memory _email) external {
        require(users[msg.sender].isRegistered, "User not registered");

        User storage user = users[msg.sender];
        user.name = _name;
        user.age = _age;
        user.email = _email;
    }

    /// @notice Fetch user profile information (view function)
    function getProfile(address _user) external view returns (
        string memory name,
        uint age,
        string memory email,
        uint registeredAt,
        bool isRegistered
    ) {
        User memory user = users[_user];
        return (
            user.name,
            user.age,
            user.email,
            user.registeredAt,
            user.isRegistered
        );
    }

    /// @notice Check if the user is registered
    function isUserRegistered(address _user) external view returns (bool) {
        return users[_user].isRegistered;
    }
}
