import 'package:flutter/material.dart';
import 'package:forcateste/forcamenu.dart';
import 'package:forcateste/forcatutorial1.dart';
import 'package:google_fonts/google_fonts.dart';

class ForcaInicioWidget extends StatefulWidget {
  const ForcaInicioWidget({Key? key}) : super(key: key);

  @override
  _ForcaInicioWidgetState createState() => _ForcaInicioWidgetState();
}

class _ForcaInicioWidgetState extends State<ForcaInicioWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return WillPopScope(onWillPop: () async {return false;}, child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF544B4B),
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Jogo da Forca',
            style: TextStyle(
                  fontFamily: 'assets/poppins',
                  color: Colors.white,
                  fontSize: 45,
                ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height : sizeHeight * 20,
         width : sizeWidth * 20,
        child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 10,
                child: Align(
                  alignment: const AlignmentDirectional(-0.25, -0.8),
                  child: Image.asset(
                    'assets/Imagem3.png',
                    width: MediaQuery.of(context).size.width * 10,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 80),
                      textStyle: const TextStyle(fontSize: 50),
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaMenuWidget(),
                        ),
                      );
                    },
                child: const Text('Iniciar', style: TextStyle(fontFamily: 'assets/poppins')),
              ),
              )
          ),
          Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 80),
                      textStyle: const TextStyle(fontSize: 50),
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaTutorial1Widget(),
                        ),
                      );
                    },
                child: const Text('Regras', style: TextStyle(fontFamily: 'assets/poppins')),
              ),
              )
          )],
          ),
        ),
      )),
    ));
  }
}