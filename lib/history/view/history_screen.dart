
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import '../../web/provider/web_provider.dart';



class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<WebProvider>(context);
    final providerFalse = Provider.of<WebProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "  History",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Text(
                    'Back',style: TextStyle(color: Colors.blue.shade500,fontSize: 20),
                  ))
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            reverse: true,
            itemCount: providerTrue.history.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.only(
                right: 0,
                left: 20,
              ),
              leading: Image.asset(
                providerTrue.history[index].image.toString(),
                height: 20,
              ),
              onTap: () {
                Navigator.pop(context);

                providerFalse.webViewController!.loadUrl(
                    urlRequest: URLRequest(
                        url: WebUri(
                            providerFalse.history[index].history.toString())));
              },
              title: Text(
                providerTrue.history[index].title.toString(),
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                providerTrue.history[index].history.toString(),
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  providerFalse.removeHistory(index);
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
