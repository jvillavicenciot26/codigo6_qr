import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white.withOpacity(0.09),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.symmetric(
                        vertical: 14.0,
                        horizontal: 12.0,
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "12-02-2022 12:30",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                "Pasta Canteen",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "Carnes y Parrillas",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
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
