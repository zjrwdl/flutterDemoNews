import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'wallet_login.dart';

class HomeController extends GetxController {
  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;

  String currentAddress = '';

  int currentChain = -1;

  bool wcConnected = false;

  final wc = WalletConnectProvider.binance();

  Web3Provider? web3wc;

  var metamask = WalletLogin();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const loginAddressKey = "loginAddressKey";

  connectMetaMaskProvider() async {
    final SharedPreferences prefs = await _prefs;
    metamask.login(WalletType.metamask).then((success) {
      if (success) {
        currentAddress = metamask.address!;
        currentChain = metamask.chainId!;
        debugPrint('metamask address: ${metamask.address}');
        debugPrint('metamask chainId: ${metamask.chainId}');
        prefs.setString(loginAddressKey, currentAddress);
      } else {
        debugPrint('metamask login failed');
      }
      update();
    });
  }

  connectCoinbaseProvider() async {
    metamask.login(WalletType.coinbase).then((success) {
      if (success) {
        currentAddress = metamask.address!;
        currentChain = metamask.chainId!;
        debugPrint('coinbase address: ${metamask.address}');
        debugPrint('coinbase chainId: ${metamask.chainId}');
      } else {
        debugPrint('coinbase login failed');
      }
      update();
    });
  }

  connectWC() async {
    await wc.connect();
    if (wc.connected) {
      currentAddress = wc.accounts.first;
      currentChain = 56;
      wcConnected = true;
      web3wc = Web3Provider.fromWalletConnect(wc);
    }

    update();
  }

  disconnect() async {
    currentAddress = '';
    currentChain = -1;
    wcConnected = false;
    web3wc = null;
    final SharedPreferences prefs = await _prefs;
    prefs.setString(loginAddressKey, currentAddress);
    update();
  }

  init() async {
    final SharedPreferences prefs = await _prefs;
    currentAddress = prefs.getString(loginAddressKey) ?? "";
    print(
        "init current address is $currentAddress Ethereum.isSupported is ${Ethereum.isSupported}");
    update();
  }

  getLatestBlock() async {
    try {
      print(await provider!.getLastestBlock());
      print(await provider!.getLastestBlockWithTransaction());
    } catch (e) {
      print("getLatestBlock error is $e");
    }
  }

  testProvider() async {
    final rpcProvider = JsonRpcProvider('https://bsc-dataseed.binance.org/');
    print(rpcProvider);
    print(await rpcProvider.getNetwork());
  }

  showBasicInfo() async {
    try {
      String address = await provider!.getSigner().getAddress();
      print("address is $address");
      print("balance is ${await provider!.getBalance(address)}");
      print("network is ${await provider!.getNetwork()}");
    } catch (e) {
      print("showBasicInfo error is $e");
    }
  }

  checkAndAddNetwork() async {
    print("checkAndAddNetwork Ethereum.provider");
    print("checkAndAddNetwork Ethereum.provider is ${Ethereum.provider}");
    await Ethereum.provider!.walletAddChain(
      chainId: 56,
      chainName: 'BNB Chain',
      nativeCurrency:
      CurrencyParams(name: 'BNB', symbol: 'BNB', decimals: 18),
      rpcUrls: ['https://bsc-mainnet.nodereal.io/v1/64a9df0874fb4a93b9d0a3849de012d3'],
    );

    // await Ethereum.provider!.walletAddChain(
    //   chainId: 137,
    //   chainName: 'Polygon',
    //   nativeCurrency:
    //   CurrencyParams(name: 'MATIC', symbol: 'MATIC', decimals: 18),
    //   rpcUrls: ['https://polygon-rpc.com/'],
    // );
  }

  switchNetwork() async {
    await Ethereum.provider!.walletSwitchChain(137, () async {
      await Ethereum.provider!.walletAddChain(
        chainId: 137,
        chainName: 'Polygon',
        nativeCurrency:
        CurrencyParams(name: 'MATIC', symbol: 'MATIC', decimals: 18),
        rpcUrls: ['https://polygon-rpc.com/'],
      );
    });
  }

  @override
  void onInit() {
    init();

    super.onInit();
  }
}

class MetaMaskLoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (h) => Scaffold(
        body: Center(
          child: Column(children: [
            Container(height: 10),
            Builder(builder: (_) {
              var shown = '';
              print("h.currentChain is ${h.currentChain}");
              if (h.isConnected)
                shown =
                    'connected!\n address:${h.currentAddress} \n chainId:${h.currentChain}';
              else if (Ethereum.isSupported)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        child: Text('login metamask'),
                        onPressed: h.connectMetaMaskProvider),
                    SizedBox(
                      width: 20,
                    ),
                    OutlinedButton(
                        child: Text('login coinbase'),
                        onPressed: h.connectCoinbaseProvider),
                  ],
                );
              else
                shown = 'Your browser is not supported!';

              return Text(shown,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
            }),
            Container(height: 30),
            if (h.isConnected) ...[
              OutlinedButton(
                  child: Text('disConnect'), onPressed: h.disconnect),
              Container(height: 10),
              TextButton(
                  onPressed: h.getLatestBlock, child: Text('get latest block')),
              Container(height: 10),
              TextButton(
                  onPressed: h.testProvider,
                  child: Text('test binance rpc provider')),
              Container(height: 10),
              TextButton(
                  onPressed: h.showBasicInfo, child: Text('showBasicInfo')),
              Container(height: 10),
              TextButton(
                  onPressed: h.checkAndAddNetwork,
                  child: Text('add chain network')),
              TextButton(
                  onPressed: h.switchNetwork,
                  child: Text('switch chain network')),
            ],
            Container(height: 30),
            if (!h.isConnected && !h.wc.connected && !h.wcConnected)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      child: Text('login WalletConnect'),
                      onPressed: h.connectWC),
                  Container(height: 10),
                  Text('Wallet Connect connected: ${h.wcConnected}'),
                ],
              ),
            Container(height: 30),
            if (h.wcConnected && h.wc.connected) ...[
              Text(h.wc.walletMeta.toString()),
            ],
          ]),
        ),
      ),
    );
  }
}
