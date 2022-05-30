import 'package:forcateste/forcainicio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forcateste/forcamenu.dart';
import 'package:forcateste/forcajogo.dart';

class ForcaRankingWidget extends StatefulWidget {
  const ForcaRankingWidget({Key? key}) : super(key: key);

  @override
  _ForcaRankingWidgetState createState() => _ForcaRankingWidgetState();
}

class _ForcaRankingWidgetState extends State<ForcaRankingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String palavra1 = ' --- ';
  String palavra2 = ' --- ';
  String palavra3 = ' --- ';
  double res1 = 0;
  double res2 = 0;
  double res3 = 0;

  @override
  Widget build(BuildContext context) {

    if(lstPalavras.length == 1){
      palavra1 = lstPalavras[0].replaceAll(' ', '\n');
      res1 = (acertost1 / (errost1 + acertost1)) * 100;
    }
    
    if(lstPalavras.length == 2){
      palavra1 = lstPalavras[0].replaceAll(' ', '\n');
      palavra2 = lstPalavras[1].replaceAll(' ', '\n');
      res1 = (acertost1 / (errost1 + acertost1)) * 100;
      res2 = (acertost2 / (errost2 + acertost2)) * 100;
    }
    
    if(lstPalavras.length == 3){
      palavra1 = lstPalavras[0].replaceAll(' ', '\n');
      palavra2 = lstPalavras[1].replaceAll(' ', '\n');
      palavra3 = lstPalavras[2].replaceAll(' ', '\n');
      res1 = (acertost1 / (errost1 + acertost1)) * 100;
      res2 = (acertost2 / (errost2 + acertost2)) * 100;
      res3 = (acertost3 / (errost3 + acertost3)) * 100;
    }

    tentativas = 0;
    return WillPopScope(onWillPop: () async {return false;}, child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF544B4B),
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Ranking',
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fundo.png"),
            fit: BoxFit.cover
          )
        ),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                    child: Text("Pontuação: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 50, color: Colors.white)),
                  )),                 
                  Stack(
                    children: const [Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(45, 20, 0, 0),
                    child: Text("Palavra",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.yellow)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 45, 0),
                    child: Text("Acertos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.lightGreen)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(80, 20, 0, 0),
                    child: Text("Erros",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.red)),
                  )),
                  Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 50, 0),
                    child: Text("% Acertos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.blue)),
                  )),]),                  
                  Stack(
                    children: [Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(44, 10, 0, 0),
                    child: Text(palavra1,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 45, 0),
                    child: Text('$acertost1',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(80, 10, 0, 0),
                    child: Text('$errost1',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(290, 10, 50, 0),
                    child: Text(res1.toStringAsFixed(2) + '%',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),]),
                  Stack(
                    children: [Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(44, 10, 0, 0),
                    child: Text(palavra2,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 45, 0),
                    child: Text('$acertost2',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(80, 10, 0, 0),
                    child: Text('$errost2',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(290, 10, 50, 0),
                    child: Text(res2.toStringAsFixed(2) + '%',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),]),
                  Stack(
                    children: [Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(44, 10, 0, 0),
                    child: Text(palavra3,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 45, 0),
                    child: Text('$acertost3',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(80, 10, 0, 0),
                    child: Text('$errost3',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),
                  Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(290, 10, 50, 0),
                    child: Text(res3.toStringAsFixed(2) + '%',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 13.5, color: Colors.white)),
                  )),]),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(100, 50, 100, 0), //150 aumentando para descer o botão
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () async {	
                            escolherTopico = "";	
                            tentativas = 0;	
                            acertost1 = 0;	
                            acertost2 = 0;	
                            acertost3 = 0;	
                            errost1 = 0;	
                            errost2 = 0;	
                            errost3 = 0;	
                            lstPalavras.clear();	
                            await Navigator.push(	
                              context,	
                              MaterialPageRoute(	
                                builder: (context) => const ForcaInicioWidget(),	
                              ),	
                            );	
                          },	
                          child: const Text('Voltar ao Início',	
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'assets/poppins')),	
                        ),	
                      )),	
                ],	
              ),	
            ),	
          ),	
        )));	
  }	
}