import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import '../../web/provider/web_provider.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<WebProvider>(context);
    final providerFalse = Provider.of<WebProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  Bookmarks",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close,color: Colors.white,)
                )
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              reverse: true,
              shrinkWrap: true,
              itemCount: providerTrue.bookmarks.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.only(right: 0, left: 20),
                leading: Icon(
                  Icons.web_asset_rounded,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
        
                  providerFalse.webViewController!.loadUrl(
                      urlRequest: URLRequest(
                          url: WebUri(providerFalse.bookmarks[index].bookMark
                              .toString())));
                },
                title: Text(
                  providerTrue.bookmarks[index].title.toString(),
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  providerTrue.bookmarks[index].bookMark.toString(),
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  onPressed: () {
                    providerFalse.removeBookmark(index);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}