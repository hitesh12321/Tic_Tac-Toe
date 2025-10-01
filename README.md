🎯 Tic-Tac-Toe Flutter Game
A classic Tic-Tac-Toe game built with Flutter featuring beautiful UI, win detection, and smooth gameplay.

🎮 Overview
This is a complete Tic-Tac-Toe implementation with:

✨ Beautiful visual design with custom assets

🏆 Win condition detection

🤝 Tie game handling

🔄 New game functionality

📱 Responsive layout

🛠️ Tech Stack
Framework: Flutter

Programming Language: Dart

UI: Custom widgets with Material Design

Assets: Custom X and O images

Fonts: Google Fonts (Lexend)

📁 Project Structure
text
tictactoe/
├── lib/
│   ├── main.dart                 # Primary game implementation
│   ├── extra.dart               # Alternative game implementation
│   ├── boardtiles.dart          # Individual tile widget
│   └── tiles_state.dart         # Game state enums and utilities
├── images/
│   ├── board.png               # Game board background
│   ├── x.png                   # X player image
│   └── o.png                   # O player image
🎯 Features
Core Gameplay
2-Player Turn System: Alternates between X and O

Win Detection: Checks all 8 possible winning combinations

Tie Detection: Identifies when the board is full with no winner

Input Validation: Prevents overwriting occupied tiles

UI/UX Features
Visual Feedback: Custom images for X and O players

Game Board: Overlay system with transparent tiles

Responsive Design: Adapts to different screen sizes

Winner Dialog: Shows winner with player symbol

Tie Dialog: Handles draw scenarios

Game States
EMPTY: Unoccupied tile

CROSS: X player

CIRCLE: O player

🎮 How to Play
Start: Game begins with X player

Take Turns: Players alternate tapping empty tiles

Win Condition: Get three in a row (horizontal, vertical, or diagonal)

Tie Condition: All tiles filled with no winner

New Game: Automatically starts after win/tie detection

📦 Dependencies
Add to your pubspec.yaml:

yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^[latest_version]
Also ensure you have the required assets:

yaml
flutter:
  assets:
    - images/board.png
    - images/x.png
    - images/o.png
🔧 Installation & Setup
Clone the repository

bash
git clone https://github.com/your-username/tictactoe-flutter.git
cd tictactoe-flutter
Install dependencies

bash
flutter pub get
Add game assets

Create images/ folder in your project root

Add board.png, x.png, and o.png images

Run the game

bash
flutter run
🏗️ Architecture
Main Components
MyApp StatefulWidget (main.dart)
Main game controller

Manages game state and player turns

Handles win/tie detection logic

Boardtiles StatelessWidget (boardtiles.dart)
Individual game tile component

Displays X/O images based on state

Handles tap interactions

Game Logic (tiles_state.dart)
Tilestate Enum: Defines possible tile states

chunk() Function: Splits board into 3x3 grid

Key Methods
Game Flow
dart
void _updateTilesAction(int selectedIndex)  // Handles player moves
Tilestate? _winnerkon()                     // Checks for winner
void _showingWinner(Tilestate? tileState)   // Displays winner dialog
void _reset()                               // Handles tie games
Win Conditions
The game checks 8 possible winning combinations:

3 horizontal rows (0-2, 3-5, 6-8)

3 vertical columns (0-3-6, 1-4-7, 2-5-8)

2 diagonals (0-4-8, 2-4-6)

🎨 Customization
Changing Game Assets
Replace the images in the images/ folder:

board.png: Game board background

x.png: X player symbol

o.png: O player symbol

Styling
Modify the AppBar color in main.dart:

dart
backgroundColor: const Color.fromARGB(255, 221, 94, 40)
Fonts
Change the game title font in GoogleFonts.lexend()

🚀 Building for Release
bash
flutter build apk          # For Android
flutter build appbundle    # For Google Play
flutter build ios          # For iOS
🤝 Contributing
Fork the repository

Create your feature branch (git checkout -b feature/NewFeature)

Commit your changes (git commit -m 'Add NewFeature')

Push to the branch (git push origin feature/NewFeature)

Open a Pull Request

🐛 Troubleshooting
Common Issues
Images not loading: Verify asset paths in pubspec.yaml

Game not responding: Check tile state management

Win detection failing: Review _winnerkon() method logic

Debugging Tips
Use print() statements to track game state

Verify all winning combinations are properly checked

Ensure proper state management with setState()

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

⭐ Enjoy playing! Star this repo if you found it helpful!
