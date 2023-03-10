import 'package:codigo6_qr/pages/history_page.dart';
import 'package:codigo6_qr/pages/scanner_page.dart';
import 'package:codigo6_qr/ui/general/colors.dart';
import 'package:codigo6_qr/ui/widgets/common_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //pero backgroundColor: Color(0xff12151A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              Text(
                "SaveQR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Gestiona los codigos QR de tu preferencia y accede cuando quieras",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Image.asset(
                "assets/images/qr.png",
                width: width * 0.8,
              ),
              CommonButtonWidget(
                text: "Escanear QR",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScannerPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(),
                    ),
                  );
                },
                child: Text(
                  "Ver Historial",
                  style: TextStyle(
                    color: kBrandPrimaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
