import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(fontSize: 22.0, color: Colors.black),
        ),
        backgroundColor: Color(0xffd6b738),
        actions: [
          CircleAvatar(
            radius: 12.0,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 22.0,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              child: Icon(
                Icons.shop,
                size: 22.0,
                color: Colors.black,
              ),
              radius: 12.0,
              backgroundColor: Color(0xffd4d181),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://ak.picdn.net/shutterstock/videos/5039891/thumb/1.jpg'),
                ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        //color: Colors.red,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 150, bottom: 1),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffd1ad17),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(50.0),
                                      bottomRight: Radius.circular(50.0),
                                    )),
                                height: 50.0,
                                width: 100.0,
                                child: Center(
                                  child: Text(
                                    'Vegi',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                            color: Colors.green.shade800,
                                            blurRadius: 10,
                                            offset: Offset(3, 3),
                                          ),
                                        ]),
                                    //textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 32),
                              child: Text(
                                '30% Off',
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'on all vegetables products',
                              style: TextStyle(
                                // fontSize: 18.0,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
