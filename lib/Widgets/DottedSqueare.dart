import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class DottedSquare extends StatefulWidget {
  const DottedSquare({super.key});

  @override
  State<DottedSquare> createState() => _DottedSquareState();
}

class _DottedSquareState extends State<DottedSquare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                  width:double.infinity,
                  height: 120,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  color: Colors.blueGrey.shade900,
                  child:Stack(
                    children: const [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Dash(
                              direction: Axis.horizontal,
                              length:280,
                              dashLength: 10,
                              dashColor: Colors.white
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Dash(
                                  direction: Axis.vertical,
                                  length: 100,
                                  dashLength: 10,
                                  dashColor: Colors.white
                              ),
                              Dash(
                                  direction: Axis.vertical,
                                  length:  100,
                                  dashLength: 10,
                                  dashColor: Colors.white
                              )
                            ],
                          ),
                          Dash(
                              direction: Axis.horizontal,
                              length:300-20,
                              dashLength: 10,
                              dashColor: Colors.white
                          ),
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // SvgPicture.asset(camera,color:Colors.white,width: 50,height: 50,),
                            Text("Visiting",style: TextStyle(color: Colors.white,fontSize: 16),)
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(58.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [8, 4],
                radius: Radius.circular(12),
                padding: EdgeInsets.all(6),
                strokeWidth: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            DottedBorder(
              // customPath: (_) => customPath,
              color: Colors.indigo,
              dashPattern: const [8, 4],
              strokeWidth: 2,
              child: Container(
                height: 220,
                width: 120,
                color: Colors.green.withAlpha(20),
              ),
            ),
            customBorder,
            roundedRectBorderWidget
          ],
        ),
      ),
    );
  }

  Widget get roundedRectBorderWidget {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 200,
          width: 120,
          color: Colors.amber,
        ),
      ),
    );
  }

  Widget get customBorder {
    Path customPath = Path()
      ..moveTo(20, 20)
      ..lineTo(50, 100)
      ..lineTo(20, 200)
      ..lineTo(100, 100)
      ..lineTo(20, 20);

    return DottedBorder(
      customPath: (_) => customPath,
      color: Colors.indigo,
      dashPattern: const [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 220,
        width: 120,
        color: Colors.green.withAlpha(20),
      ),
    );
  }
}
