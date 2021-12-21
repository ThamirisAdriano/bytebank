
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criano transferência';
const _rotuloCampoValor = 'Valor';
const _rotuloCampoNumeroConta = 'Número da conta';

class FormularioTransferencia extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{

  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(controlador: _controladorCampoNumeroConta, dica: '000', rotulo: _rotuloCampoNumeroConta ),
              Editor(controlador: _controladorCampoValor, rotulo: _rotuloCampoValor, dica: '0,00', icone: Icons.monetization_on),
              ElevatedButton(child: Text('Confirmar'),
                  onPressed: () {
                    _criaTransferencia(context);
                  })
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(
        _controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(
        _controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada); // que vai notificar a lista
    }
  }
}
