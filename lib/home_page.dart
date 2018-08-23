import "package:flutter/material.dart";

class SignUpPage extends StatelessWidget {
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
								child: SignUpPageBody(),
							),
						),
					);
				},
			),
		);
	}
}

class SignUpPageBody extends StatefulWidget {
	@override
	SignUpPageBodyState createState() {
		return new SignUpPageBodyState();
	}
}

class SignUpPageBodyState extends State<SignUpPageBody>
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

class TrianglePainter extends CustomPainter {
	TrianglePainter(this._pageController) : super(repaint: _pageController);
	final PageController _pageController;
	@override
	void paint(Canvas canvas, Size size) {
		final pos = _pageController.position;
		double fullExtent =
		(pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);
		double pageCount = fullExtent / pos.viewportDimension;
		double pageOffset = pos.extentBefore / fullExtent;
		
		final double indicatorHeight = size.height * 0.25;
		final Offset centerPoint =
		Offset((size.width / pageCount) * 0.5, size.height - indicatorHeight);
		
		Path path = Path()
			..moveTo(centerPoint.dx, centerPoint.dy)
			..relativeLineTo(indicatorHeight, indicatorHeight)
			..relativeLineTo(-indicatorHeight * 2, 0.0)
			..close();
		Paint paint = Paint()
			..color = Colors.white
			..style = PaintingStyle.fill
			..strokeCap = StrokeCap.round;
		
		canvas.save();
		canvas.translate(size.width * pageOffset, 0.0);
		canvas.drawPath(path, paint);
		canvas.restore();
	}
	
	@override
	bool shouldRepaint(TrianglePainter oldDelegate) => true;
}