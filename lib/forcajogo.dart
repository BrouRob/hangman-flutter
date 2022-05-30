import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forcateste/forcamenu.dart';
import 'package:forcateste/forcarank.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math';

class ForcaJogoWidget extends StatefulWidget {
  const ForcaJogoWidget({Key? key}) : super(key: key);

  @override
  _ForcaJogoWidgetState createState() => _ForcaJogoWidgetState();
}

class _ForcaJogoWidgetState extends State<ForcaJogoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List _items = [];
  Random random = Random();
  int randomNumber = 0;
  String palavraSorteada = '';
  String palavraMascara = '';
  String botaoClick = '';
  int acertos = 0;
  int erros = 0;
  bool ganhou = false;
  bool perdeu = false;
  bool comecaContar = false;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/forca.json');
    final data = await json.decode(response);
    setState(() {
      _items = data[escolherTopico];
    });
    bool novaPalavra = false;	
    do {	
      randomNumber = random.nextInt(_items.length);	
      if (lstPalavras.contains(_items[randomNumber]) == false) {	
        palavraSorteada = _items[randomNumber];	
        palavraMascara = palavraOculta(palavraSorteada, '', '');	
        tentativas++;	
        lstPalavras.add(palavraSorteada);	
        novaPalavra = true;	
      }	
    } while (novaPalavra == false);
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  //String ocultarPalavra(strPalavra) {
  //  String palavra = "";
  //  int tamanho = strPalavra.length;
  //  for (int i = 0; i < tamanho; i++) {
  //    palavra += '_ ';
  //  }
  //  return palavra;
  //}

  String palavraOculta(String sPalavra, String sMascara, String sLetra) {
    String sPalavraAtualizada = '';
    String sPalavraEspacada = '';
    String sFinal = '';
    int contaPalavraOk = 0;
    String resultado = '';

    if (tentativas < 3) {
    resultado = 'Próximo';
    } else {
      resultado = "Fim";
    }

    if (sLetra.isNotEmpty == false) {
      for (int i = 0; i < sPalavra.length; i++) {
        if (sPalavra[i] == ' ') {
          sFinal = sFinal + ' ';
        } else {
          sFinal = sFinal + '_ ';
        }
      }
    } else {
      for (int i = 0; i < sPalavra.length; i++) {
        if (sPalavra[i] == ' ') {
          sPalavraEspacada = sPalavraEspacada + ' ';
        } else {
          sPalavraEspacada = sPalavraEspacada + sPalavra[i] + ' ';
        }
      }
      if (sPalavraEspacada != '') {
        for (int i = 0; i < sPalavraEspacada.length; i++) {
          if (sLetra.toUpperCase() == 'A' &&
                  (sPalavraEspacada[i].toUpperCase() == 'A' ||
                      sPalavraEspacada[i].toUpperCase() == 'Ã' ||
                      sPalavraEspacada[i].toUpperCase() == 'Á') ||
              sPalavraEspacada[i].toUpperCase() == 'Â') {
            if (sPalavraEspacada[i].toUpperCase() == 'Ã') {
              sPalavraAtualizada = sPalavraAtualizada + 'Ã';
              contaPalavraOk++;
            } else if (sPalavraEspacada[i].toUpperCase() == 'Á') {
              sPalavraAtualizada = sPalavraAtualizada + 'Á';
              contaPalavraOk++;
            } else if (sPalavraEspacada[i].toUpperCase() == 'Â') {
              sPalavraAtualizada = sPalavraAtualizada + 'Â';
              contaPalavraOk++;
            } else {
              sPalavraAtualizada = sPalavraAtualizada + 'A';
              contaPalavraOk++;
            }
          } else if (sLetra.toUpperCase() == 'E' &&
              (sPalavraEspacada[i].toUpperCase() == 'E' ||
                  sPalavraEspacada[i].toUpperCase() == 'É' ||
                  sPalavraEspacada[i].toUpperCase() == 'Ê')) {
            if (sPalavraEspacada[i].toUpperCase() == 'É') {
              sPalavraAtualizada = sPalavraAtualizada + 'É';
              contaPalavraOk++;
            } else if (sPalavraEspacada[i].toUpperCase() == 'Ê') {
              sPalavraAtualizada = sPalavraAtualizada + 'Ê';
              contaPalavraOk++;
            } else {
              sPalavraAtualizada = sPalavraAtualizada + 'E';
              contaPalavraOk++;
            }
          } else if (sLetra.toUpperCase() == 'I' &&
              (sPalavraEspacada[i].toUpperCase() == 'I' ||
                  sPalavraEspacada[i].toUpperCase() == 'Í' ||
                  sPalavraEspacada[i].toUpperCase() == 'Î')) {
            if (sPalavraEspacada[i].toUpperCase() == 'Í') {
              sPalavraAtualizada = sPalavraAtualizada + 'Í';
              contaPalavraOk++;
            } else if (sPalavraEspacada[i].toUpperCase() == 'Î') {
              sPalavraAtualizada = sPalavraAtualizada + 'Î';
              contaPalavraOk++;
            } else {
              sPalavraAtualizada = sPalavraAtualizada + 'I';
              contaPalavraOk++;
            }
          } else if (sLetra.toUpperCase() == 'O' &&
              (sPalavraEspacada[i].toUpperCase() == 'O' ||
                  sPalavraEspacada[i].toUpperCase() == 'Õ' ||
                  sPalavraEspacada[i].toUpperCase() == 'Ó' ||
                  sPalavraEspacada[i].toUpperCase() == 'Ô')) {
            if (sPalavraEspacada[i].toUpperCase() == 'Õ') {
              sPalavraAtualizada = sPalavraAtualizada + 'Õ';
              contaPalavraOk++;
            } else if (sPalavraEspacada[i].toUpperCase() == 'Ó') {
              sPalavraAtualizada = sPalavraAtualizada + 'Ó';
              contaPalavraOk++;
            } else if (sPalavraEspacada[i].toUpperCase() == 'Ô') {
              sPalavraAtualizada = sPalavraAtualizada + 'Ô';
              contaPalavraOk++;
            } else {
              sPalavraAtualizada = sPalavraAtualizada + 'O';
              contaPalavraOk++;
            }
          } else if (sLetra.toUpperCase() == 'U' &&
              (sPalavraEspacada[i].toUpperCase() == 'U' ||
                  sPalavraEspacada[i].toUpperCase() == 'Ú' ||
                  sPalavraEspacada[i].toUpperCase() == 'Û')) {
            if (sPalavraEspacada[i].toUpperCase() == 'Ú') {
              sPalavraAtualizada = sPalavraAtualizada + 'Ú';
              contaPalavraOk++;
            } else if (sPalavraEspacada[i].toUpperCase() == 'Û') {
              sPalavraAtualizada = sPalavraAtualizada + 'Û';
              contaPalavraOk++;
            } else {
              sPalavraAtualizada = sPalavraAtualizada + 'U';
              contaPalavraOk++;
            }
          } else if (sLetra.toUpperCase() == 'C' &&
              (sPalavraEspacada[i].toUpperCase() == 'C' ||
                  sPalavraEspacada[i].toUpperCase() == 'Ç')) {
            if (sPalavraEspacada[i].toUpperCase() == 'Ç') {
              sPalavraAtualizada = sPalavraAtualizada + 'Ç';
              contaPalavraOk++;
            } else {
              sPalavraAtualizada = sPalavraAtualizada + 'C';
              contaPalavraOk++;
            }
          } else if (sPalavraEspacada[i].toUpperCase() ==
              sLetra.toUpperCase()) {
            sPalavraAtualizada = sPalavraAtualizada + sLetra.toUpperCase();
            contaPalavraOk++;
          } else {
            sPalavraAtualizada = sPalavraAtualizada + sMascara[i];
          }
        }
      }
      sFinal = sPalavraAtualizada;
      palavraMascara = sFinal;
    }
    if (comecaContar == true) {
      if (contaPalavraOk > 0) {
        if (lstLetras.contains(sLetra) == false) {	
          lstLetras.add(sLetra);	
          acertos++;	
        }	
      } else {	
        if (lstLetras.contains(sLetra) == false) {	
          lstLetras.add(sLetra);	
          erros++;	
        }
      }
    }
    if (palavraMascara.contains('_')) {
      ganhou = false;
    } else {
      ganhou = true;
      if (tentativas == 1 && (acertos != 0 || erros != 0)) {
        acertost1 = acertos;
        errost1 = erros;
      } else if (tentativas == 2 && (acertos != 0 || erros != 0)) {
        acertost2 = acertos;
        errost2 = erros;
      } else if (tentativas == 3 && (acertos != 0 || erros != 0)) {
        acertost3 = acertos;
        errost3 = erros;
      }
      if (comecaContar == true) {
        showDialog(
          context: context,	
            builder: (a) => AlertDialog(	
                  insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),	
                  content:	
                      Stack(alignment: Alignment.center, children: <Widget>[	
                    Image.asset('assets/minion.png'),	
                    Align(	
                        child: Padding(	
                            padding: const EdgeInsetsDirectional.fromSTEB(	
                                0, 170, 20, 0),	
                            child: Row(	
                                mainAxisAlignment: MainAxisAlignment.end,	
                                children: [	
                                  TextButton(	
                                      onPressed: () {	
                                        lstLetras.clear();	
                                        if (tentativas < 3) {	
                                          Navigator.push(	
                                            context,	
                                            MaterialPageRoute(	
                                              builder: (context) =>	
                                                  const ForcaJogoWidget(),	
                                            ),	
                                          );	
                                        } else {	
                                          Navigator.push(	
                                            context,	
                                            MaterialPageRoute(	
                                              builder: (context) =>	
                                                  const ForcaRankingWidget(),	
                                            ),	
                                          );	
                                        }	
                                      },	
                                      child: Text(resultado,	
                                          style: const TextStyle(	
                                            fontFamily: 'assets/Berlin Sans FB',	
                                            fontSize: 35,	
                                          )))	
                                ]))),	
                  ]),	
                  backgroundColor: Colors.transparent,	
                  shape: RoundedRectangleBorder(	
                      borderRadius: BorderRadius.circular(20)),	
                ),	
            barrierDismissible: false);
      }
    }
    return sFinal;
  }

  String palavraClicada(int nindex) {
    botaoClick = _alfabeto[nindex];
    return botaoClick;
  }

  String imagem = 'assets/Imagem3.png';
  //int mudaImagem = 0;

  String mudarImagem(valerros) {
    if (valerros == 1) {
      imagem = 'assets/erro1.png';
    } else if (valerros == 2) {
      imagem = 'assets/erro2.png';
    } else if (valerros == 3) {
      imagem = 'assets/erro3.png';
    } else if (valerros == 4) {
      imagem = 'assets/erro4.png';
    } else if (valerros == 5) {
      imagem = 'assets/erro5.png';
    } else if (valerros == 6) {
      imagem = 'assets/erro6.png';
      perdeu = true;
      if (tentativas == 1 && (acertos != 0 || erros != 0)) {
        acertost1 = acertos;
        errost1 = erros;
      } else if (tentativas == 2 && (acertos != 0 || erros != 0)) {
        acertost2 = acertos;
        errost2 = erros;
      } else if (tentativas == 3 && (acertos != 0 || erros != 0)) {
        acertost3 = acertos;
        errost3 = erros;
      }
      if (comecaContar == true) {
        showDialog(
          context: context,	
            builder: (a) => AlertDialog(	
                  insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),	
                  content:	
                      Stack(alignment: Alignment.center, children: <Widget>[	
                    Image.asset('assets/gameover.png'),
                    Align(	
                        child: Padding(	
                            padding: const EdgeInsetsDirectional.fromSTEB(	
                                0, 120, 0, 0),	
                            child: Row(	
                                mainAxisAlignment: MainAxisAlignment.center,	
                                children: [	
                                  TextButton(	
                                      onPressed: () {	
                                        lstLetras.clear();	
                                          Navigator.push(	
                                            context,	
                                            MaterialPageRoute(	
                                              builder: (context) =>	
                                                  const ForcaRankingWidget(),	
                                            ),	
                                          );
                                      },	
                                      child: const Text("Fim",	
                                          style: TextStyle(	
                                            fontFamily: 'assets/Berlin Sans FB',	
                                            fontSize: 50,
                                            color: Colors.blue	
                                          )))	
                                ]))),	
                  ]),	
                  backgroundColor: Colors.transparent,	
                  shape: RoundedRectangleBorder(	
                      borderRadius: BorderRadius.circular(20)),	
                ),	
            barrierDismissible: false);
      }
    }
    return imagem;
  }

  incrementeImagem(int numArg) {
    setState(() {
      //mudarImagem(numArg);
      atualizaPalavra(palavraSorteada, palavraMascara,
          palavraClicada(numArg - 1).toLowerCase());
    });
  }

  atualizaPalavra(sPal, sMas, sLet) {
    setState(() {
      palavraOculta(sPal, sMas, sLet);
    });
  }

  static const _alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  Map dic = <int, bool>{};

  teclas(int idBotao, int acao) {
    if (acao == 1) {
      return dic[idBotao];
    }

    if (acao == 2) {
      dic[idBotao] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {return false;}, child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF544B4B),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Text(
            'Adivinhe o nome de um $escolherTopico',
            style: const TextStyle(
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
              Expanded(
                flex: 10,
                child: Align(
                  alignment: const AlignmentDirectional(-0.25, -0.70),
                  child: Image.asset(
                    imagem,
                    width: MediaQuery.of(context).size.width * 10,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.fitHeight,
                    gaplessPlayback: true,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Text(palavraMascara.replaceAll('  ', '\n'),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins', fontSize: 50)),
                  )),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, //esse é a quantidade de botões por linha
                    crossAxisSpacing: 3, //esse é a largura de lado dos botões
                    mainAxisExtent: 45, //esse é a largura para cima dos botões
                    mainAxisSpacing: 5, //esse é o espaçamento entre as linhas
                  ),
                  shrinkWrap: true,
                  itemCount: _alfabeto.length,
                  itemBuilder: (context, index) {
                    Color color = Colors.blue;

                    if (teclas(index + 1, 1) == true) {
                      color = Colors.grey;
                    }

                    return ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(color)),
                      onPressed: () => {
                        comecaContar = true,
                        teclas(index, 2),
                        incrementeImagem(index),
                        mudarImagem(erros),
                        print(palavraSorteada),
                        print(palavraMascara),
                        print('Erros: $erros'),
                        print('Acertos: $acertos'),
                        print('Perdeu: $perdeu'),
                        print('Ganhou: $ganhou'),
                        print('Tentativas: $tentativas'),
                        print('Acertos T1: $acertost1'),
                        print('Erros T1: $errost1'),
                        print('Acertos T2: $acertost2'),
                        print('Erros T2: $errost2'),
                        print('Acertos T3: $acertost3'),
                        print('Erros T3: $errost3')
                      }, //onPressed: () => {incrementeImagem(index), Colors.black}, \\ k < 3 ? () => {k < 5} : null
                      child: Text(
                        _alfabeto[index++], // flutter operador ternário
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'assets/poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}