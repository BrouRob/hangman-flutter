import 'package:flutter/material.dart';
import 'package:forcateste/forcatutorial2.dart';
import 'package:google_fonts/google_fonts.dart';

class ForcaTutorial1Widget extends StatefulWidget {
  const ForcaTutorial1Widget({Key? key}) : super(key: key);

  @override
  _ForcaTutorial1WidgetState createState() => _ForcaTutorial1WidgetState();
}

class _ForcaTutorial1WidgetState extends State<ForcaTutorial1Widget> {
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
            'Regras',
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
                    'assets/tutorial1.png',
                    width: MediaQuery.of(context).size.width * 10,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Text("Escolha um dos tópicos\ndisponíveis para começar o jogo.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 29)),
                  )),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 80),
                      textStyle: const TextStyle(fontSize: 45),
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaTutorial2Widget(),
                        ),
                      );
                    },
                child: const Text('Próximo', style: TextStyle(fontFamily: 'assets/poppins')),
              ),
              )
          )],
          ),
        ),
      )),
    ));
  }
}