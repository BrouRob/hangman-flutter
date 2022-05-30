import 'package:flutter/material.dart';
import 'package:forcateste/forcainicio.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(const MaterialApp(home: ForcaInicioWidget(), debugShowCheckedModeBanner: false));
}

class Forcateste extends StatelessWidget {
  const Forcateste({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ForcaInicioWidget(),
      title: "Forca"
    );
  }
}

//Testando para ver se o git esta atualizando