import 'package:flutter/material.dart';
import 'package:forcateste/forcainicio.dart';
import 'package:google_fonts/google_fonts.dart';

class ForcaRegrasWidget extends StatefulWidget {
  const ForcaRegrasWidget({Key? key}) : super(key: key);

  @override
  _ForcaRegrasWidgetState createState() => _ForcaRegrasWidgetState();
}

class _ForcaRegrasWidgetState extends State<ForcaRegrasWidget> {
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
            'Regras',
            style: TextStyle(
                  fontFamily: 'poppins',
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
              const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text("Escolha um dos tópicos disponíveis\npara começar o jogo, selecione uma letra por vez; tendo como dica o número de traços e o tema escolhido à palavra. Se errar, começa a desenhar-se o boneco! Serão apresentadas três palavras por partida, o jogo se encerra após acertar a terceira ou errar qualquer palavra.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'poppins', fontSize: 22)),
                  )),
          Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 105, 0, 0),
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
                          builder: (context) => const ForcaInicioWidget(),
                        ),
                      );
                    },
                child: Text('Voltar', style: GoogleFonts.poppins()),
              ),
              )
          )],
          ),
        ),
      ),
    ));
  }
}