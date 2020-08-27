import 'package:challenge4/success.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

import 'custom_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment Card',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cardNo = '';
  String expDate = '';
  String cvv = '';
  String cardHolderName = '';

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        key: cardKey,
        direction: FlipDirection.HORIZONTAL,
        flipOnTouch: false,
        speed: 1000,
        front: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade400.withOpacity(0.8),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Stack(
            children: <Widget>[
              // ignore: deprecated_member_use
              Positioned(
                top: 30,
                left: 30,
                child: Text(
                  'INFINITESHOP',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 15,
                child: Image.asset(
                  'assets/images/maestro.png',
                  height: 60,
                  width: 60,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 15,
                child: Image.asset(
                  'assets/images/chip.png',
                  height: 50,
                  width: 50,
                ),
              ),
              Positioned(
                top: 80,
                left: 30,
                child: Text(
                  cardNo.isEmpty ? 'XXXX XXXX XXXX XXXX' : cardNo,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 30,
                child: Text(
                  'Valid until',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 130,
                child: Text(
                  expDate.isEmpty ? 'MM/YY' : expDate,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 30,
                child: Text(
                  cardHolderName.isEmpty ? 'CARDHOLDER NAME' : cardHolderName,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade400.withOpacity(0.8),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 30,
                child: Container(
                  height: 50,
                  width: 400,
                  color: Color(0xff2c2b29),
                ),
              ),
              Positioned(
                top: 100,
                child: Container(
                  height: 55,
                  width: 300,
                  color: Colors.grey.shade300,
                ),
              ),
              Positioned(
                top: 107.5,
                left: 300,
                child: Container(
                  height: 40,
                  width: 300,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 115,
                left: 330,
                child: Text(
                  cvv,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 15,
                child: Image.asset(
                  'assets/images/chip.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.blueAccent,
                ],
              ),
            ),
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              children: <Widget>[
                Container(
                  height: deviceSize.height / 3,
                  width: deviceSize.width,
                  child: _renderContent(context),
                ),
                Container(
                  height: deviceSize.height * 2 / 3,
                  width: deviceSize.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        CustomContainer(
                          labelText: 'Card Number',
                          childWidget: Container(
                            height: 60,
                            width: 350,
                            margin: EdgeInsets.only(
                              top: 30,
                              left: 10,
                              bottom: 0,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              onTap: () {
                                // ignore: unnecessary_statements
                                cardKey.currentState.isFront;
                              },
                              onChanged: (value) {
                                setState(() {
                                  cardNo = value;
                                });
                              },
                              maxLength: 19,
                              style: TextStyle(
                                fontSize: 32.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        CustomContainer(
                          labelText: 'Expiry Date',
                          childWidget: Container(
                            height: 60,
                            width: 350,
                            margin: EdgeInsets.only(
                              top: 30,
                              left: 10,
                              bottom: 5,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              onTap: () {
                                // ignore: unnecessary_statements
                                cardKey.currentState.isFront;
                              },
                              onChanged: (value) {
                                setState(() {
                                  expDate = value;
                                });
                              },
                              maxLength: 5,
                              style: TextStyle(
                                fontSize: 32.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        CustomContainer(
                          labelText: 'CVV',
                          childWidget: Container(
                            height: 60,
                            width: 350,
                            margin: EdgeInsets.only(
                              top: 30,
                              left: 10,
                              bottom: 5,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              onTap: () {
                                cardKey.currentState.toggleCard();
                              },
                              onChanged: (value) {
                                setState(() {
                                  cvv = value;
                                });
                              },
                              maxLength: 4,
                              style: TextStyle(
                                fontSize: 32.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        CustomContainer(
                          labelText: 'CardHolder Name',
                          childWidget: Container(
                            height: 60,
                            width: 350,
                            margin: EdgeInsets.only(
                              top: 30,
                              left: 10,
                              bottom: 5,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              onTap: () {
                                // ignore: unnecessary_statements
                                cardKey.currentState.toggleCard();
                              },
                              onChanged: (value) {
                                setState(() {
                                  cardHolderName = value;
                                });
                              },
                              maxLength: 30,
                              style: TextStyle(
                                fontSize: 32.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 60,
                            width: deviceSize.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Success()),
                                );
                              },
                              child: Text(
                                'CHECKOUT',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
