import 'package:codigo6_qr/db/db_admin.dart';
import 'package:codigo6_qr/models/qr_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends StatelessWidget {
  void myAlert(BuildContext context, QRModel model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(10.0),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cerrar",
              ),
            ),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                model.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                model.observation,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                model.datetime,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 200,
                child: QrImage(
                  data: model.url,
                  //size: 150,
                  version: QrVersions.auto,
                  //errorStateBuilder: (context, error) => Text(error.toString()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Historial General",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Listado general de tus QR registrados.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                FutureBuilder(
                  future: DBAdmin().getQRList(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    print(snap);
                    if (snap.hasData) {
                      List<QRModel> qrList = snap.data;
                      return ListView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), //ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: qrList.length,
                        itemBuilder: (BuildContext context, int index) {
                          bool isUrl =
                              qrList[index].url.toLowerCase().contains("http");

                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            padding: EdgeInsets.symmetric(
                              vertical: 14.0,
                              horizontal: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.09),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${qrList[index].datetime}",
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Text(
                                        qrList[index].title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        qrList[index].observation,
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isUrl
                                    ? IconButton(
                                        onPressed: () {
                                          Uri uri =
                                              Uri.parse(qrList[index].url);
                                          launchUrl(uri,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        },
                                        icon: Icon(Icons.link),
                                        color: Colors.white,
                                      )
                                    : SizedBox(),
                                IconButton(
                                  onPressed: () {
                                    myAlert(context, qrList[index]);
                                  },
                                  icon: Icon(Icons.qr_code),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
