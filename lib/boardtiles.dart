import 'package:flutter/material.dart';
import 'package:tictactoe/tiles_state.dart';



//this Boardtiles is a class of Statelesswidget.
class Boardtiles extends StatelessWidget {
  final double? dimentions;
  final VoidCallback? onPressed;
  final Tilestate?
  tilestate; //its a variable of type tilestate which name is tilestate
  const Boardtiles({ //constructor
    super.key,
    this.tilestate,
    this.dimentions,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimentions,
      width: dimentions,
      child: TextButton(onPressed: onPressed, child: _widgetImagefortile()),
    );
  }

  Widget _widgetImagefortile() {
    Widget? widget;

    switch (tilestate) {
      case Tilestate.EMPTY:
        {
          widget = Container();
        }
        break;
      case Tilestate.CROSS:
        {
          widget = Image.asset('images/x.png');
        }
        break;
      case Tilestate.CIRCLE:
        {
          widget = Image.asset('images/o.png');
        }
        break;

      default:
        widget = SizedBox();
    }
    return widget;
  }
}
