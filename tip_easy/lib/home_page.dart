import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:tip_easy/widgets/InputTextFormField.dart';
import 'package:tip_easy/fixes_variables/paddings.dart';
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
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() {
              price.clear();
              tip.clear();
            }),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TypePadding().w20(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? 'lib/assets/TipEasyDark.png'
                  : 'lib/assets/TipEasy.png',
              width: MediaQuery.of(context).size.height * 0.3,
            ),
            const Divider(color: Colors.transparent),
            InputTextFormField(
              controller: price,
              labelText: 'Price value',
              hintText: 'Insert the price value in',
              prefixText: '\$  ',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const Divider(color: Colors.transparent),
            InputTextFormField(
              controller: tip,
              labelText: 'Tip percentage',
              hintText: 'Insert the tip percentage',
              prefixText: '%  ',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const Divider(color: Colors.transparent),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Calculate'),
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
          title: 'Error',
          icon: Icons.error,
          content: [
            Text('Please, fill all the fields'),
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
          title: 'Bill amont',
          icon: Icons.monetization_on,
          content: [
            Text(
              'The bill amount is a total of \$ $amount',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ), // EN:
            const Divider(),
            Text('The tip percentage was R\$ ${(value * percent)}'), // EN:
          ],
        ),
      );
    }
  }
}
