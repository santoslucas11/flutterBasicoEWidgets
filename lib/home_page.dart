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
        title: Text("Doguinhos Fofinhos"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _text(),
              _pageView(),
              _buttons(),
            ],
          )),
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

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page3",
                    onPressed: () => _onClickNavigator(context, HelloPage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast()),
              ],
            )
          ],
        );
      },
    );
  }

  _onClickToast() {}

  _onClickDialog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Teste Alert Dialog"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                  print("cancelado");
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  print("click");
                },
              )
            ],
          ),
        );
      },
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
        textColor: Colors.yellow[200],
        label: "OK",
        onPressed: () {
          print("Snack");
        },
      ),
    ));
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _img(String img) {
    return Image.asset(img, fit: BoxFit.cover);
  }

  _text() {
    return Text(
      "Doguinhos",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
