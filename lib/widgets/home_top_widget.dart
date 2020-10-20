import 'package:flutter/material.dart';
import 'package:house_rent/widgets/top_customshpae_clip.dart';


class HomeScreenTopContainer extends StatefulWidget {
  @override
  __HomeScreenTopContainerState createState() =>
      __HomeScreenTopContainerState();
}

class __HomeScreenTopContainerState extends State<HomeScreenTopContainer> {
  final _formKey = GlobalKey<FormState>();
  var _selectedLocationIndex = 0;
  var _seletedComunityIndex = 0;
  var _selectedRoom = 0;
  List<String> _location = ['Portharcourt', 'Aba', 'Lagos'];
  List<String> _locationCommunity = ['Rumuomasi', 'Woji', 'Dline'];
  List<String> _houseType = ['Self-Contain', 'Duplex', 'One-Room'];
  String _name;
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
                height: 400.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    firstFrom,
                    secondTo,
                  ]
                  ),
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
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          PopupMenuButton(
                            onSelected: (index) {
                              setState(() {
                                _selectedLocationIndex = index;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(_location[_selectedLocationIndex],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Icon(Icons.keyboard_arrow_down,
                                    color: Colors.white)
                              ],
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(_location[0]),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(_location[1]),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text(_location[2]),
                                value: 2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Material(
                              elevation: 5.0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: 'House In ' +
                                        _location[_selectedLocationIndex] +
                                        ' ?'),
                                decoration: InputDecoration(
                                    suffixIcon: Material(
                                        elevation: 5.0,
                                        child: Icon(Icons.search)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 32.0, vertical: 10.0),
                                    // labelText: 'Username',

                                    border: InputBorder.none),
                                validator: (input) => input.trim().isEmpty
                                    ? 'Please Enter a Username'
                                    : null,
                                onSaved: (input) => _name = input,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 30.0),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            // border:
                            //     Border.all(width: 1.0, color: Colors.white),
                          ),
                          height: 80.0,
                          child: PopupMenuButton(
                            onSelected: (indexCommunity) {
                              setState(() {
                                _seletedComunityIndex = indexCommunity;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(
                                  _locationCommunity[_seletedComunityIndex],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                Icon(Icons.keyboard_arrow_down,
                                    color: Colors.white)
                              ],
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(_locationCommunity[0]),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(_locationCommunity[1]),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text(_locationCommunity[2]),
                                value: 2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30.0),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            // border: Border.all(width: 1.0, color: Colors.grey),
                          ),
                          height: 80.0,
                          child: PopupMenuButton(
                            onSelected: (indexRoom) {
                              setState(() {
                                _selectedRoom = indexRoom;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(
                                  _houseType[_selectedRoom],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                                Icon(Icons.keyboard_arrow_down,
                                    color: Colors.white)
                              ],
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<int>>[
                              PopupMenuItem(
                                child: Text(_houseType[0]),
                                value: 0,
                              ),
                              PopupMenuItem(
                                child: Text(_houseType[1]),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text(_houseType[2]),
                                value: 2,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

