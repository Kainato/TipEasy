import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:tip_easy/themes.dart';
import 'package:tip_easy/widgets/ChangeThemeButton.dart';
import 'package:tip_easy/widgets/InputTextFormField.dart';
import 'package:tip_easy/widgets/InsertDialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController price = TextEditingController();
  TextEditingController tip = TextEditingController();
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Easy'),
        actions: [
          IconButton(
            tooltip: 'Como utilizar',
            icon: const Icon(Icons.help_outline),
            onPressed: () => showTip(),
          ),
          IconButton(
            tooltip: 'Limpar todos os campos',
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {
              price.clear();
              tip.clear();
            }),
          ),
          const ChangeThemeButton(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PaddingScreen().pad20(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              ThemeProvider().widgetTheme(context,
                  darkTheme: 'lib/assets/TipEasyDark.png',
                  lightTheme: 'lib/assets/TipEasy.png'),
              width: MediaQuery.of(context).size.height * 0.3,
            ),
            const Divider(color: Colors.transparent),
            InputTextFormField(
              controller: price,
              labelText: 'Preço da conta',
              hintText: 'Insira o preço da conta',
              prefixText: '\$  ',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
            ),
            const Divider(color: Colors.transparent),
            InputTextFormField(
              controller: tip,
              labelText: 'Porcentagem da gorjeta',
              hintText: 'Insira a porcentagem da gorjeta',
              prefixText: '%  ',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
            ),
            const Divider(color: Colors.transparent),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Calcular resultado'),
              ),
              onPressed: () => calculate(),
            ),
          ],
        ),
      ),
    );
  }

  calculate() {
    if (price.text.isEmpty || tip.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const InsertDialog(
          title: 'Ops...',
          icon: Icons.error,
          content: [
            Text(
                'Você deve preencher todos os campos para calcular o resultado!'),
          ],
        ),
      );
    } else {
      double value = double.parse(price.text);
      double percent = double.parse(tip.text) / 100;
      double amount = value + (value * percent);

      showDialog(
        context: context,
        builder: (context) => InsertDialog(
          title: 'Resultado',
          icon: Icons.monetization_on,
          content: [
            Text(
              'O valor total da conta é $amount\$',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Text('O valor da gorjeta foi de ${value * percent}\$'),
          ],
        ),
      );
    }
  }

  showTip() {
    showDialog(
      context: context,
      builder: (context) => const InsertDialog(
        title: 'Como utilizar o Tip Easy',
        icon: Icons.monetization_on,
        content: [
          Text(
            '1. Insira o valor da conta no campo "Preço da conta".',
            style: TextThemeData.headlineMedium,
          ),
          Divider(color: Colors.transparent),
          Text(
            '2. Insira a porcentagem da gorjeta no campo "Porcentagem da gorjeta".',
            style: TextThemeData.headlineMedium,
          ),
          Divider(color: Colors.transparent),
          Text(
            '3. Clique no botão "Calcular resultado".',
            style: TextThemeData.headlineMedium,
          ),
          Divider(color: Colors.transparent),
          Text(
            '4. Veja o resultado!',
            style: TextThemeData.headlineMedium,
          ),
        ],
      ),
    );
  }
}
