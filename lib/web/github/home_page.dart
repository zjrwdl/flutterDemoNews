import 'package:flutter/material.dart';
import 'package:flutter_news_app/web/github/nav_bar.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class GithubHomepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return GithubHomepageState();
  }

}

class GithubHomepageState extends State{
  static const String privateKey =
      '3b1431f1205339993f9272731b1eef8c2385b11cb37d87abb14cd8d1f1dd68c0';
  static const String rpcUrl = 'http://localhost:8545';

  void initState() {
    // _testWeb3SendTrans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///第一页
            Container(
              height: 800,
              width: double.infinity,
              color: Colors.deepPurple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NavBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _testWeb3() async {
    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    print("meemo web3 block number is ${await client.getBalance(address)}");
  }

  _testWeb3SendTrans() async {
    final client = Web3Client(rpcUrl, Client());
    final credentials = EthPrivateKey.fromHex(privateKey);
    await client.sendTransaction(
      credentials,
      Transaction(
        to: EthereumAddress.fromHex('0x81DaF3399023ae3bc57e98e73C6Bcd150a206cA4'),
        gasPrice: EtherAmount.inWei(BigInt.one),
        maxGas: 100000,
        value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
      ),
    );
    _testWeb3();
  }

}

