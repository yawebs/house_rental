import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:house_rent/widgets/home_top_widget.dart';

class FrontScreen extends StatefulWidget {
  static String routeId ='/frontScreenId';
  String currentUserId;
  FrontScreen({this.currentUserId});
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {


 _imageSlider() {
    return Container(
      //color: Colors.green,

      height: 250,
      child: Carousel(
        boxFit: BoxFit.fill,
        indicatorBgPadding: 1.0,
        images: [
          AssetImage('assets/images/1.jpg'),
          AssetImage('assets/images/2.jpg'),
          AssetImage('assets/images/3.jpg'),
          AssetImage('assets/images/4.jpg')
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
    child: Container(
      // height: MediaQuery.of(context).size.height ,
      child: Column(
        children: <Widget>[
          HomeScreenTopContainer(),
          Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: _buildSelContainSection),

          //Duplex Section
          Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: _buildDuplexSection),

          Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: _imageSlider()),
        ],
      ),
    ),
        ),
      );
  }
  }
  Color firstFrom = Color(0xFFF47D15);
Color secondTo = Color(0xFFEF772C);
ThemeData appTheme = ThemeData(primaryColor: Color(0xFFF3791A));


var _buildSelContainSection = Column(
  children: <Widget>[
    Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Self-Contain',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Text(
              'View All',
              style: TextStyle(
                color: firstFrom,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 30.0,
    ),
    Container(
      height: 250.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: houseModel,
      ),
    )
  ],
);
List<HouseModel> houseModel = [
  HouseModel(
    imagePath: 'assets/images/1.jpg',
    price: '200',
    roomType: 'Self-Contain',
    location: 'Rumuomasi(PH)',
    agent: 'Christian',
    agentFee: '3000',
  ),
  HouseModel(
    imagePath: 'assets/images/2.jpg',
    price: 'N150',
    roomType: 'Self-Contain',
    location: 'Woji(PH)',
    agent: 'Bright',
    agentFee: '2000',
  ),
  HouseModel(
    imagePath: 'assets/images/3.jpg',
    price: 'N160',
    roomType: 'Self-Contain',
    location: 'Rumuomasi(Aba)',
    agent: 'Christian',
    agentFee: '3000',
  ),
  HouseModel(
    imagePath: 'assets/images/4.jpg',
    price: 'N250',
    roomType: 'Self-Contain',
    location: 'Abuloma(Enugu)',
    agent: 'Bari',
    agentFee: '6000',
  ),
];

class HouseModel extends StatelessWidget {
  String imagePath, price, roomType, location, agent, agentFee;
  HouseModel(
      {this.imagePath,
      this.price,
      this.roomType,
      this.location,
      this.agent,
      this.agentFee});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Container(
              height: 250.0,
              width: 200.0,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        roomType,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                      Text(
                        location,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: Text(
                      price,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: firstFrom,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//Duplex

var _buildDuplexSection = Column(
  children: <Widget>[
    Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Duplex',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Text(
              'View All',
              style: TextStyle(
                color: firstFrom,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 30.0,
    ),
    Container(
      height: 250.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: houseModel,
      ),
    )
  ],
);

List<DuplexModule> duplexModule = [
  DuplexModule(
    imagePathd: 'assets/images/1.jpg',
    priced: '350',
    roomTyped: 'Duplex',
    locationd: 'Rumuomasi(PH)',
    agentd: 'Christian',
    agentFeed: '3000',
  ),
  DuplexModule(
    imagePathd: 'assets/images/2.jpg',
    priced: 'N450',
    roomTyped: 'Duplex',
    locationd: 'Woji(PH)',
    agentd: 'Bright',
    agentFeed: '2000',
  ),
  DuplexModule(
    imagePathd: 'assets/images/3.jpg',
    priced: 'N600',
    roomTyped: 'Duplex',
    locationd: 'Rumuobiakani(PH)',
    agentd: 'Christian',
    agentFeed: '3000',
  ),
  DuplexModule(
    imagePathd: 'assets/images/4.jpg',
    priced: 'N400',
    roomTyped: 'Duplex',
    locationd: 'Elekahia(PH)',
    agentd: 'Bari',
    agentFeed: '6000',
  ),
];

class DuplexModule extends StatelessWidget {
  String imagePathd, priced, roomTyped, locationd, agentd, agentFeed;
  DuplexModule(
      {this.imagePathd,
      this.priced,
      this.roomTyped,
      this.locationd,
      this.agentd,
      this.agentFeed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            Container(
              height: 250.0,
              width: 200.0,
              child: Image.asset(imagePathd, fit: BoxFit.cover),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              width: 150,
              height: 60.0,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        roomTyped,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                      Text(
                        locationd,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: Text(
                      priced,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: firstFrom,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
