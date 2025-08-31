import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'boardtiles.dart';
import 'tiles_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  var boardState = List.filled(
    9,
    Tilestate.EMPTY,
  ); //  here we created a list of 9 elements which has empty as elements
  Tilestate _currentSymbol = Tilestate.CROSS;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 221, 94, 40),
          title: Text("TIC-TAC-TOE", style: GoogleFonts.lexend(fontSize: 30)),
          centerTitle: true,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        ),

        body: Center(
          child: Stack(
            children: [Image.asset('images/board.png'), _boardTiles()],
          ),
        ),
      ),
    );
  }

  Widget _boardTiles() {
    return Builder(
      builder: (context) {
        final boardDimentions = MediaQuery.of(context).size.width;
        final tileDimention = boardDimentions / 3;

        return SizedBox(
          width: boardDimentions,
          height: boardDimentions,
          child: Column(
            children: chunk(boardState, 3).asMap().entries.map((entry) {
              final chuckIndex = entry.key;
              final tileStateChunk = entry.value;

              return Row(
                children: tileStateChunk.asMap().entries.map((innerEntry) {
                  final innerIndex = innerEntry.key;
                  final tileState = innerEntry.value;
                  final tileIndex = (chuckIndex * 3) + innerIndex;

                  return Boardtiles(
                    tilestate: tileState,

                    onPressed: () => _updateTilesAction(
                      tileIndex,
                    ), //updateTileAction() sai hum clicked tile ko update kringe if empty to udko cross,if cross h to next wala circle hoga jo bhi click hoga
                    dimentions: tileDimention,
                  );
                }).toList(),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  /*
void _updateTilesAction(int selectedIndex) {
  if (_winnerkon() != null) return;

  if (boardState[selectedIndex] == Tilestate.EMPTY) {
    setState(() {
      boardState[selectedIndex] = _currentSymbol;

      _currentSymbol =
          (_currentSymbol == Tilestate.CROSS) // condition
              ? Tilestate.CIRCLE // if true
              : Tilestate.CROSS; // if false
    });

    final winner = _winnerkon();
    if (winner != null) {
      _showingWinner(winner);
    } else if (!boardState.contains(Tilestate.EMPTY)) {
      // 🔥 CHANGE: Only call reset if board is full and no winner
      _reset();
    }
    // 🔥 CHANGE: Removed the else {_reset(winner);} logic that ran every time
  }
}
*/
  void _updateTilesAction(int selectedIndex) {
    if (_winnerkon() != null) return;

    if (boardState[selectedIndex] == Tilestate.EMPTY) {
      setState(() {
        boardState[selectedIndex] = _currentSymbol;

        _currentSymbol =
            (_currentSymbol == Tilestate.CROSS) //condition
            ? Tilestate
                  .CIRCLE //if ture
            : Tilestate.CROSS; //if false
      });

      final winner = _winnerkon();
      if (winner != null) {
        _showingWinner(winner);
      } else if (!boardState.contains(Tilestate.EMPTY)) {
        // 🔥 CHANGE: Only call reset if board is full and no winner
        _reset();
      }
    }
  }

  Tilestate? _winnerkon() {
    //_winnerkon starts yay TileState type ka function h mtlb yay koi na koi Tilestate like cross,circle , emoty return krega
    Tilestate? winnerofMatch(int a, int b, int c) {
      if (boardState[a] != Tilestate.EMPTY) {
        if (boardState[a] == boardState[b] && boardState[b] == boardState[c]) {
          return boardState[a];
        }
      }
      return null;
    }

    List winnerconditions = [
      winnerofMatch(0, 1, 2),
      winnerofMatch(3, 4, 5),
      winnerofMatch(6, 7, 8),
      winnerofMatch(0, 3, 6),
      winnerofMatch(1, 4, 7),
      winnerofMatch(2, 5, 8),
      winnerofMatch(0, 4, 8),
      winnerofMatch(2, 4, 6),
    ];

    Tilestate? winner;
    for (int i = 0; i < winnerconditions.length; i++) {
      if (winnerconditions[i] != null) {
        winner = winnerconditions[i];
      }
    }

    return winner;
  } //winnerkon ends

  //new methods to understand HITESH ........
  void _showingWinner(Tilestate? tileState) {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (_) {
        return AlertDialog(
          title: Text("WINNER"),
          content: Image.asset(
            (tileState == Tilestate.CROSS) /*condition */
                ? 'images/x.png'
                : 'images/o.png',
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  boardState = List.filled(9, Tilestate.EMPTY);
                  _currentSymbol = Tilestate.CROSS;
                });
                Navigator.of(navigatorKey.currentState!.overlay!.context).pop();
              },
              child: Text("NEW GAME"),
            ),
          ],
        );
      },
    );
  }

  /*void _reset() { // 🔥 CHANGE: Removed the Tilestate? parameter
  showDialog(
    context: navigatorKey.currentState!.overlay!.context,
    builder: (_) {
      return AlertDialog(
        title: Text("TIE"),
        content: Text('No winner this time, click to start a new game'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                boardState = List.filled(9, Tilestate.EMPTY);
                _currentSymbol = Tilestate.CROSS;
              });
              Navigator.of(navigatorKey.currentState!.overlay!.context).pop();
            },
            child: Text("NEW GAME"),
          ),
        ],
      );
    },
  );
}
*/
  void _reset() {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (_) {
        return AlertDialog(
          title: Text("TIE"),
          content: Text('No wonner this time , click to new game'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  boardState = List.filled(9, Tilestate.EMPTY);
                  _currentSymbol = Tilestate.CROSS;
                });
                Navigator.of(navigatorKey.currentState!.overlay!.context).pop();
              },
              child: Text("NEW GAME"),
            ),
          ],
        );
      },
    );
  }
}