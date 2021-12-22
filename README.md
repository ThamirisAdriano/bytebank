Projeto criado em Flutter para simular transferências.

No main inserimos qual vai ser a página que iniciará o projeto. Esse projeto será iniciado com ListaTransferencias(). E o tema, nesse caso o escolhido foi o Dark.

```dart
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
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1253af13-d576-4af4-823e-4acca0cb717f/Untitled.png)

Na página de ListaTransferencias() terá um widget `ListView.builder` onde estarão as transferências realizadas na página FormulariosTransferencias.

Terá também um botão com um Icon de add além de um void que atualizará as transferências nessa página.

```dart
void _atualiza(Transferencia? transferenciaRecebida) {
    if(transferenciaRecebida != null) {
      setState((){
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}
```

Os card são editados em uma classe ItemTransferencia .

```dart
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
```

Na página de FormulárioTransferencia() são importadas as outras páginas criadas, além da página de transferência que será utilizada no código abaixo:

```dart
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
```

https://www.notion.so/Flutter-App-transfer-ncia-9858b4523a1d4e798c2bcff5c1e8c485#84455c0d835b474c9ac729b4d868b09a
