import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/web_provider.dart';



class BrowserDialog extends StatelessWidget {
  const BrowserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final providerFalse = Provider.of<WebProvider>(context, listen: false);
    final providerTrue = Provider.of<WebProvider>(context, listen: true);
    return AlertDialog(
      backgroundColor: Color(0xff332940),
      title: Text(
        "Choose browser",
        style: TextStyle(color: Colors.white),
      ),
      content: Container(
        height: 240,
        width: 400,
        child: Column(
          children: [
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) => RadioListTile(
                activeColor: Colors.white,
                title: Row(
                  children: [
                    Image.asset(
                      providerTrue.logos[index],
                      height: 25,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      providerTrue.browserNames[index],
                      style: TextStyle(color: Colors.white),
                    ),

                  ],
                ),
                value: providerTrue.browserNames[index],
                groupValue: providerTrue.groupValue,
                onChanged: (value) {
                  providerFalse.updateSearchEngineGroupValue(value!);
                  Navigator.pop(context);
                  providerFalse.updateSearchEngine(value!);

                  print(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}