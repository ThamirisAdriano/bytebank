import 'package:bytebank/screens/transferencia/lista_transferencia.dart';
import 'package:flutter/material.dart';


void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ListaTransferencias(),

    );
  }
}







