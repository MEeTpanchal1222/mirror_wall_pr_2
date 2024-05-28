import 'package:flutter/material.dart';
import '../../provider/web_provider.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.providerTrue,
    required this.providerFalse,
  });

  final WebProvider providerTrue;
  final WebProvider providerFalse;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Color(0xff121212),
          border: Border(top: BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              disabledColor: Colors.grey,
              color: Colors.white,
              onPressed: providerTrue.isButtonEnabled
                  ? () {
                if (providerTrue.isButtonEnabled) {
                  providerFalse.webViewController!.goBack();
                } else {
                 return;
                }
              } : null,
              icon: Icon(
                Icons.arrow_back_ios,
              )),
          IconButton(
              disabledColor: Colors.grey,
              color: Colors.white,
              onPressed:  providerTrue.isButtonEnabled2?() {
                //providerFalse.webViewController?.goForward();
                if (providerTrue.isButtonEnabled2) {
                  providerFalse.webViewController!.goForward();
                } else {
                  providerFalse.checkIfShouldGoforword();
                  return;

                }
              }:null,
              icon: Icon(
                Icons.arrow_forward_ios,
              )),
          IconButton(
              onPressed: () {
                providerFalse.webViewController?.reload();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.looks_one_outlined,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}