import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.count, required this.counter})
      : super(key: key);
  final num count;
  final num counter;

  @override
  Widget build(BuildContext context) {
    final double _barWidth = MediaQuery.of(context).size.width * 0.90;
    List<double> stops;
    double _barColorRGBO = (count == 0 && counter == 0)
        ? 0.5
        : _barWidth * (count / (count + counter));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 20.0),
              height: 30.0,
              width: _barWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(214, 3, 3, 1),
                      Color.fromRGBO(255, 93, 93, 1),
                      Color.fromRGBO(247, 171, 171, 1),
                      Color.fromRGBO(250, 219, 219, 1),
                    ],
                    stops: [0.75, 1, 1, 1],
                  )),
            ),
            Container(
              height: 30.0,
              width: (count == 0 && counter == 0)
                  ? 0.5
                  : _barWidth * (count / (count + counter)),
              decoration: BoxDecoration(
                  borderRadius: (_barColorRGBO == _barWidth)
                      ? BorderRadius.circular(200)
                      : BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(171, 231, 255, 1),
                      Color.fromRGBO(108, 213, 255, 1),
                      Color.fromRGBO(57, 198, 254, 1),
                      Color.fromARGB(255, 19, 157, 221),
                    ],
                    stops: [0.25, 0.5, 0.75, 1.0],
                  )),
            ),
            Positioned(
              left: 10,
              top: 0,
              child: Text(count.round().toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Positioned(
              right: 35,
              top: 0,
              child: Text(counter.toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
