import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BouncingDots(),
  ));
}

class BouncingDots extends StatefulWidget {
  @override
  _BouncingDotsState createState() => _BouncingDotsState();
}

class _BouncingDotsState extends State<BouncingDots>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curvedAnimation1;
  CurvedAnimation _curvedAnimation2;
  CurvedAnimation _curvedAnimation3;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _controller.repeat(min: .0, max: 1);
    _curvedAnimation1 = CurvedAnimation(
        parent: _controller, curve: JumpingCurve1(end: .4, begin: .0));
    _curvedAnimation2 = CurvedAnimation(
        parent: _controller, curve: JumpingCurve1(begin: .2, end: .6));
    _curvedAnimation3 = CurvedAnimation(
        parent: _controller, curve: JumpingCurve1(begin: .4, end: .8));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFA8A8A8),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              height: MediaQuery.of(context).size.height * .20,
              width: MediaQuery.of(context).size.width * .70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(0, -1.5))
                          .animate(_curvedAnimation1),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Color(0xFF3C3F41), shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(0, -1.5))
                          .animate(_curvedAnimation2),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Color(0xFF3C3F41), shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SlideTransition(
                      position: Tween(begin: Offset(0, 0), end: Offset(0, -1.5))
                          .animate(_curvedAnimation3),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Color(0xFF3C3F41), shape: BoxShape.circle),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class JumpingCurve1 extends Curve {
  double begin;
  double end;
  double width;

  JumpingCurve1({@required this.begin, @required this.end,this.width=.2});

  @override
  double transformInternal(double t) {
    if (t > begin && t <= begin + width) {
      return (5 * t) - ((begin) * 10 / 2);
    }
    if (t > begin + width && t <= end) {
      return ((end) * 10 / 2) - (5 * t);
    } else {
      return 0;
    }
  }
}
