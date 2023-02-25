import 'package:codigo6_qr/db/db_admin.dart';
import 'package:codigo6_qr/models/qr_model.dart';
import 'package:codigo6_qr/pages/home_page.dart';
import 'package:codigo6_qr/ui/general/colors.dart';
import 'package:codigo6_qr/ui/widgets/common_button_widget.dart';
import 'package:codigo6_qr/ui/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatelessWidget {
  String url;
  RegisterPage({required this.url});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Text(
                        "Registrar Contenido",
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
                        "Por favor ingresa los campos requeridos",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      CommonTextField(
                        hintText: "Ingresa un titulo ...",
                        controller: _titleController,
                        isRequired: true,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      CommonTextField(
                        hintText: "Ingresa una obsrevación ...",
                        controller: _observationController,
                        isRequired: false,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: QrImage(
                          data: "1234567890",
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                      // Expanded(
                      //   child: SizedBox(),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CommonButtonWidget(
                onPressed: () {
                  //print(model.toJson());

                  if (_formkey.currentState!.validate()) {
                    DateFormat myFormat = DateFormat("yyyy-MM-dd");
                    String myDate = myFormat.format(DateTime.now());
                    //print(myDate);

                    QRModel model = QRModel(
                      title: _titleController.text,
                      observation: _observationController.text,
                      url: url,
                      datetime: myDate,
                    );

                    DBAdmin().insertQR(model).then(
                      (value) {
                        if (value >= 0) {
                          //Navigator.pop(context);
                          //Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              (route) => false);
                          //Mostrar SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Se registro tu QR correctamente"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: kBrandPrimaryColor,
                            ),
                          );
                        }
                      },
                    );
                  }
                  //DBAdmin().getQRList();
                },
                text: "Guardar",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
