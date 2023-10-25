import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tip_easy/widgets/InputTextFormField.dart';
import 'package:tip_easy/fixes_variables/paddings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController conta = TextEditingController();
  TextEditingController gorgeta = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Easy'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TypePadding().w20(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            InputTextFormField(
              controller: conta,
              labelText: 'Valor da conta',
              hintText: 'Insira o valor da conta',
              prefixText: 'R\$  ',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const Divider(color: Colors.transparent),
            InputTextFormField(
              controller: gorgeta,
              labelText: 'Porcentagem da gorjeta',
              hintText: 'Insira o valor da gorjeta',
              prefixText: '%  ',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const Divider(color: Colors.transparent),
            ElevatedButton(
              child: const Text('Calcular montante'),
              onPressed: () => calcularMontante(),
            ),
          ],
        ),
      ),
    );
  }

  calcularMontante() {
    double valueConta = double.parse(conta.text);
    double porcentagem = double.parse(gorgeta.text) / 100;
    double montante = valueConta + (valueConta * porcentagem);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Valor da conta'),
          icon: const Icon(Icons.monetization_on),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('O valor da conta ficou um total de R\$ $montante'),
              const Divider(),
              Text(
                  'O valor da gorgeta foi de R\$ ${(valueConta * porcentagem)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
