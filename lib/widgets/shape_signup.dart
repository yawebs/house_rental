import 'package:flutter/material.dart';
import 'package:house_rent/widgets/top_customshpae_clip.dart';

class ShapeSignup extends StatefulWidget {
  @override
  __HomeScreenTopContainerState createState() =>
      __HomeScreenTopContainerState();
}

class __HomeScreenTopContainerState extends State<ShapeSignup> {
  Color firstFrom = Color(0xFFF47D15);
  Color secondTo = Color(0xFFEF772C);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: topCustomShapeClip(),
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  firstFrom,
                  secondTo,
                ]),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100.0, bottom: 20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.supervised_user_circle,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          'Hi, Welcome To Renting..',
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                        //
                      ],
                    ),
                  ),
                  //
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
