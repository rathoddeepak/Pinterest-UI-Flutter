import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

Color redColor = Color(0xFFE70024);
Color whiteColor = Color(0xFFFFFFFF);

class StartupScreen extends StatelessWidget {
	final inputController = TextEditingController();
	
	void handleChangeText() {
		print(inputController.text);
	}

	@override
	Widget build(BuildContext context) {
		inputController.addListener(handleChangeText);
		double containerWidth = window.physicalSize.width;
		double contentWidth = MediaQuery.of(context).size.width - 100;
		return (
			Directionality(
      			textDirection: TextDirection.ltr,
				child: Container(
					color: Color(0xFF000000),
					child: Column(
						children: [
							ImageLayout(containerWidth),
							Container(
								height: 160,
								width: containerWidth,
								child: Center(
									child: Container(
										child: Column(
											children: [
												//Group 1
												Container(
													width: 110,
													height: 110,
													margin: EdgeInsets.only(bottom: 10),
													child: Image.network(
													  'https://upload.wikimedia.org/wikipedia/commons/0/08/Pinterest-logo.png',
													  fit: BoxFit.cover
													)
												),
												Text("Welcome to Pinterest",
													style: TextStyle(														
														color: whiteColor,
														fontSize: 30
													)
												),
											]
										)
									)
								)
							),
							FooterButtons(
								width: contentWidth
							),
							Expanded(								
								child: Container(
									width: contentWidth,
									alignment: Alignment.bottomCenter,
									child: FooterText()
								)
							)
						]
					)
				)
			)
		);
	}
}

class FooterButtons extends StatelessWidget {	
	final EdgeInsets marginTop = const EdgeInsets.only(top: 30);
	final double buttonHeight = 45;
	final double width;
	const FooterButtons({
		required this.width
	});
	@override
	Widget build(BuildContext context) {
		return (
			Column(
				children:
				[
					Container(
						width: width,
						height: buttonHeight,
						margin: marginTop,
						padding: EdgeInsets.only(left: 20, right: 10),
						decoration: BoxDecoration(
							color: Color(0xFF2B2B2B),
							borderRadius: BorderRadius.circular(100)
						),
						child: TextField(
							style: TextStyle(
								fontSize: 15,
								color: whiteColor,
								fontWeight: FontWeight.bold
							),						
							decoration: InputDecoration(								
								labelText: "Email Address",
								border: InputBorder.none,
								labelStyle: TextStyle(
									color: Color(0xFF727272)
								)
							)
						)
					),

					CustomButton(
						color: redColor,
						width: width,
						height: buttonHeight,
						text: "Continue",
						margin: marginTop
					),

					CustomButton(
						color: Color(0xFF1778F4),
						width: width,
						height: buttonHeight,
						text: "Continue with Facebook",
						margin: marginTop
					),

					CustomButton(
						color: Color(0xFF4B4B4B),
						width: width,
						height: buttonHeight,
						text: "Continue width google",
						margin: EdgeInsets.only(top: 10)
					)
				]
			)
		);
	}
}

class ImageLayout extends StatelessWidget {
	final double layoutHeight = 190;
	final double width;

	ImageLayout(this.width);

	@override
	Widget build(BuildContext context){
		return (
			Stack(
				children: [
					Container(
						width: width,
						height: layoutHeight,
						child: Image.asset(
						  'assets/stock.png',
						  fit: BoxFit.cover
						)
					),
					Container(
						height: layoutHeight,
						width: width,
						decoration: BoxDecoration(
			            gradient: LinearGradient(
			              begin: Alignment.bottomCenter,
			              end: Alignment.topCenter,
			              colors: [Colors.black, Colors.transparent],
			            )
			          )
					)
				]
			)
		);
	}
}

class CustomButton extends StatelessWidget {
	final EdgeInsets? margin;
	final double width;
	final double height;
	final Color color;
	final String text;
	
	CustomButton({
		required this.width,
		required this.height,
		required this.color,
		required this.text,
		this.margin
	});

	Widget build(BuildContext context) {
		return (
			Container(
				width: width,
				height: height,
				margin: margin,
				decoration: BoxDecoration(
					borderRadius: BorderRadius.circular(100),
					color: color
				),
				child: Center(
					child: Text(
						text,
						style: TextStyle(
							fontSize: 16,
							color: whiteColor,
							fontWeight: FontWeight.w500
						)
					)
				)
			)
		);
	}
}

class FooterText extends StatelessWidget {
	TextStyle normalStyle = TextStyle(
		fontSize: 11,
		color: whiteColor		
	);
	TextStyle linkStyle = TextStyle(
		color: Color(0xFF1778F4)
	);
	@override
	Widget build(BuildContext context){
		return (
			RichText(
				textAlign: TextAlign.center,
				text: TextSpan(
					text: "By continuing you agree to Pinterest, ",				
					style: normalStyle,
					children: [
						TextSpan(
							text: "terms and service ",
							style: linkStyle
						),
						TextSpan(
							text: "and acknowledge that you've read our ",
							style: normalStyle
						),
						TextSpan(
							text: "Privacy Policy",
							style: linkStyle
						),
						TextSpan(
							text: ".",
							style: normalStyle
						),
						TextSpan(
							text: "Notice at collection",
							style: linkStyle
						),
						TextSpan(
							text: ".",
							style: normalStyle
						),
					]
				)
			)
		);
	}
}