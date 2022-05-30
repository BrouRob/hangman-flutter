import 'package:forcateste/forcajogo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForcaMenuWidget extends StatefulWidget {
  const ForcaMenuWidget({Key? key}) : super(key: key);

  @override
  _ForcaMenuWidgetState createState() => _ForcaMenuWidgetState();
}

const nomeBotaoUm = "Animal";
const nomeBotaoDois = "Carro";
const nomeBotaoTres = "Jogo";
const nomeBotaoQuatro = "Herói";
const nomeBotaoCinco = "Filme";
const nomeBotaoSeis = "Seriado";
const nomeBotaoSete = "País";
const nomeBotaoOito = "Famoso";
String escolherTopico = "";
int tentativas = 0;
int acertost1 = 0;
int acertost2 = 0;
int acertost3 = 0;
int errost1 = 0;
int errost2 = 0;
int errost3 = 0;
List lstPalavras = <String>[];	
List lstLetras = <String>[];	


class _ForcaMenuWidgetState extends State<ForcaMenuWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {return false;}, child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF544B4B),
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Selecione um Tópico',
            style: TextStyle(
                  fontFamily: 'assets/poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 30),
                      textStyle: const TextStyle(fontSize: 30),
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: () async {
                      escolherTopico = 'Animal';
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaJogoWidget(),
                        ),
                      );
                    },
                child: const Text(nomeBotaoUm, style: TextStyle(fontFamily: 'assets/poppins')),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 30),
                      textStyle: const TextStyle(fontSize: 30),
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: () async {
                      escolherTopico = 'Carro';
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaJogoWidget(),
                        ),
                      );
                    },
                child: const Text(nomeBotaoDois, style: TextStyle(fontFamily: 'assets/poppins')),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 30),
                      textStyle: const TextStyle(fontSize: 30),
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: () async {
                      escolherTopico = 'Jogo';
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaJogoWidget(),
                        ),
                      );
                    },
                child: const Text(nomeBotaoTres, style: TextStyle(fontFamily: 'assets/poppins')),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 30),
                      textStyle: const TextStyle(fontSize: 30),
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: () async {
                      escolherTopico = 'Herói';
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaJogoWidget(),
                        ),
                      );
                    },
                child: const Text(nomeBotaoQuatro, style: TextStyle(fontFamily: 'assets/poppins')),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 30),
                      textStyle: const TextStyle(fontSize: 30),
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: () async {
                      escolherTopico = 'Filme';
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaJogoWidget(),
                        ),
                      );
                    },
                child: const Text(nomeBotaoCinco, style: TextStyle(fontFamily: 'assets/poppins')),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 30),
                      textStyle: const TextStyle(fontSize: 30),
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: () async {
                      escolherTopico = 'Seriado';
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaJogoWidget(),
                        ),
                      );
                    },
                child: const Text(nomeBotaoSeis, style: TextStyle(fontFamily: 'assets/poppins')),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 30),
                      textStyle: const TextStyle(fontSize: 30),
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: () async {
                      escolherTopico = 'País';
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaJogoWidget(),
                        ),
                      );
                    },
                child: const Text(nomeBotaoSete, style: TextStyle(fontFamily: 'assets/poppins')),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(1000, 30),
                      textStyle: const TextStyle(fontSize: 30),
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: () async {
                      escolherTopico = 'Famoso';
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForcaJogoWidget(),
                        ),
                      );
                    },
                child: const Text(nomeBotaoOito, style: TextStyle(fontFamily: 'assets/poppins')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
