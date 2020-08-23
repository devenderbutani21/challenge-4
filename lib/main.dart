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
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cardNoController = TextEditingController();
  final expDateController = TextEditingController();
  final cvvController = TextEditingController();
  final cardHolderNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cardNoController.dispose();
    super.dispose();
  }

  _renderBg() {
    return Container(
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
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Color(0x00FFFFFF),
      ),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
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
//                  'XXXX XXXX XXXX XXXX',
                  cardNoController.text,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 30,
                child: Text(
                  'Valid until   MM/YY',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 30,
                child: Text(
                  'CARDHOLDER NAME',
                  style: TextStyle(
                    fontSize: 22,
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
                  'CVV',
                  style: TextStyle(
                    fontSize: 20,
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
            color: Colors.blue,
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
                        CustomContainer(
                          labelText: 'Card Number',
                          childWidget: Container(
                            height: 60,
                            width: 350,
                            margin: EdgeInsets.only(
                              top: 30,
                              left: 10,
                              bottom: 5,
                            ),
                            child: TextField(
                              controller: cardNoController,
                              style: TextStyle(
                                fontSize: 40.0,
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
                              controller: cardNoController,
                              style: TextStyle(
                                fontSize: 40.0,
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
                              controller: cardNoController,
                              style: TextStyle(
                                fontSize: 40.0,
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
                              controller: cardNoController,
                              style: TextStyle(
                                fontSize: 40.0,
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
