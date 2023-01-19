import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/coinapi_io.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String country = 'USD';
  int btc = 0;
  int eth = 0;
  int ltc = 0;

  void updateRate() async {
    for (String coin in ['/BTC', '/ETH', '/LTC']) {
      CoinAPI coinAPI = CoinAPI(unencodedPath: coin + '/' + country);
      double exchangeRate = await coinAPI.exchangeRate();
      if (coin == '/BTC') btc = exchangeRate.toInt();
      if (coin == '/ETH') eth = exchangeRate.toInt();
      if (coin == '/LTC') ltc = exchangeRate.toInt();
    }
  }

  DropdownButton<String> dropdownButton() {
    List<DropdownMenuItem<String>> dropdownButtonItems = [];

    for (String currency in currenciesList) {
      dropdownButtonItems.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: country,
      items: dropdownButtonItems,
      onChanged: (value) => setState(
        () {
          country = value!;
          updateRate();
        },
      ),
    );
  }

  CupertinoPicker cupertinoPicker() {
    List<Text> cupertinoPickerChildren = [];

    for (String currency in currenciesList) {
      cupertinoPickerChildren.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      children: cupertinoPickerChildren,
      onSelectedItemChanged: (value) => setState(
        () {
          country = currenciesList[value];
          updateRate();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text('1 BTC = ${btc} ${country}'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text('1 ETH = ${eth} ${country}'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text('1 LTC = ${ltc} ${country}'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            height: 128.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 32.0),
            child: Platform.isIOS ? cupertinoPicker() : dropdownButton(),
          ),
        ],
      ),
    );
  }
}
