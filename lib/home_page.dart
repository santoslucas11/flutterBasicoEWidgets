import 'package:aula01/pages/hello_listview.dart';
import 'package:aula01/pages/hello_page1.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projeto Doguinhos"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      child:Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_text(), _pageView(), _buttons(context)
          ],
        )
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons(context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
             BlueButton("ListView", onPressed: () => _onClickNavigator(context, HelloListView())),
             BlueButton( "Page2", onPressed: () => _onClickNavigator(context, HelloPage2())),
             BlueButton( "Page3", onPressed: () => _onClickNavigator(context, HelloPage3()))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("snack", onPressed: _onClickSnack()),
            BlueButton("Dialog", onPressed: _onClickDialog()),
            BlueButton("Toast", onPressed: _onClickToast()),
          ],
        )
      ],
    );
  }

  _onClickToast(){

  }

  _onClickDialog() {
    
  }

  _onClickSnack() {

  }
  
  void _onClickNavigator(BuildContext context, Widget page) async{

    String s = await push(context, page);
    print(">> $s");
  }

  _img(String img) {
    return Image.asset(img, fit: BoxFit.cover);
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.black,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
