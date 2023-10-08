# Rock-Paper-Scissors Game

## Description

This is a command-line implementation of a generalized rock-paper-scissors game with support for an arbitrary number of moves. The game includes features such as a cryptographically strong random key generation, HMAC (Hash-based Message Authentication Code) calculation, and a help menu that displays a win/lose/draw table for different move combinations.

## Features

- Play a rock-paper-scissors game against the computer.
- Generate a cryptographically strong random key for added security.
- Calculate HMAC based on SHA-256.
- Display a help menu with a win/lose/draw table.
- Accept an arbitrary number of non-repeating moves.

## Usage

1. Clone this repository to your local machine.
2. Make sure you have Ruby installed.
3. Open your terminal and navigate to the project directory.
4. Run the game with the following command:

   ```
   ruby game.rb <move1> <move2> ... <moveN>
   ```

   Replace `<move1>`, `<move2>`, etc., with the available moves you want for your game.

5. Follow the on-screen instructions to play the game. You can enter your move by typing the corresponding number and press Enter.

## Example

Here's an example of how to run the game:

```
ruby game.rb rock paper scissors
```

## Requirements

- Ruby (2.7+ recommended)
- OpenSSL Ruby library

## 🚀 Live Demo <a name="live-demo"></a>

- [Demo Video](https://www.loom.com/share/8e2d57e7dc5f4645819d3e381c174a14?sid=9bcb9ade-6864-4771-b037-e9625aff0a07)

## Author

Haliljon Juraboev

- GitHub: [@githubhaliljon](https://github.com/haliljon)
- Twitter: [@twitterhaliljon1](https://twitter.com/haliljon1)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/juraboev-haliljon)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
