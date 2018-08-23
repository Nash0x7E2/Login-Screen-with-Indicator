import "package:flutter/material.dart";
import 'package:login_page_with_indicator_slider/triangle_painter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                  minHeight: constraints.maxHeight,
                ),
                child: HomePageBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  HomePageBodyState createState() => HomePageBodyState();
}

class HomePageBodyState extends State<HomePageBody>
    with SingleTickerProviderStateMixin {
  final String imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD05rG-G4WhgBbzDoetCTeqO1Ite8-uMJ2jnx4rilB8ko1aJQWgQ";

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  Widget _buildHeaderPanel(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            imageUrl,
            color: Color(0xFFBDA778),
            colorBlendMode: BlendMode.multiply,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.network(
                    "http://icons.iconarchive.com/icons/iconsmind/outline/512/Beer-icon.png",
                    color: Colors.white,
                    width: 100.0,
                    height: 100.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                    child: Text(
                      "A WORLD THAT MAKES YOU HAPPY AND AWESOME",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      height: 60.0,
      color: Color(0xFFBDA778),
      child: CustomPaint(
        painter: TrianglePainter(_pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome to Edge",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "Email",
                ),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                  counterText: "Forget Password?",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: MaterialButton(
                color: Color(0xFFB29762),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
                onPressed: () {}),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "Sign Up".toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Text(
            "Welcome to Edge",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: "Username",
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "Email",
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 23.0),
            child: MaterialButton(
                color: Color(0xFFB29762),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text("Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderPanel(context),
        _buildMenuBar(context),
        Expanded(
          flex: 2,
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              _buildSignIn(context),
              _buildSignUp(context),
            ],
          ),
        ),
      ],
    );
  }
}
