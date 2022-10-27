import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool get isInOperatingChain => currentChain == OPERATING_CHAIN;

  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;

  String currentAddress = '';

  int currentChain = -1;

  bool wcConnected = false;

  static const OPERATING_CHAIN = 56;

  final wc = WalletConnectProvider.binance();

  Web3Provider? web3wc;

  connectProvider() async {
    if (Ethereum.isSupported) {
      final accs = await Ethereum.provider!.requestAccount();
      if (accs.isNotEmpty) {
        currentAddress = accs.first;
        currentChain = await Ethereum.provider!.getChainId();
        print("currentChain is $currentChain");
      }

      update();
    }
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

  clear() {
    currentAddress = '';
    currentChain = -1;
    wcConnected = false;
    web3wc = null;

    update();
  }

  init() {
    if (Ethereum.isSupported) {
      connectProvider();

      Ethereum.provider!.onAccountsChanged((accs) {
        clear();
      });

      Ethereum.provider!.onChainChanged((chain) {
        clear();
      });
    }
  }

  getLastestBlock() async {
    print(await provider!.getLastestBlock());
    print(await provider!.getLastestBlockWithTransaction());
  }

  testProvider() async {
    final rpcProvider = JsonRpcProvider('https://bsc-dataseed.binance.org/');
    print(rpcProvider);
    print(await rpcProvider.getNetwork());
  }

  test() async {
    String address = await provider!.getSigner().getAddress();
    print("address is $address");
    print("balance is ${await provider!.getBalance(address)}");
  }

  testSwitchChain() async {
    print("testSwitchChain Ethereum.provider! is ${Ethereum.provider!}");
    await Ethereum.provider!.walletAddChain(
      chainId: 137,
      chainName: 'Polygon',
      nativeCurrency:
      CurrencyParams(name: 'MATIC', symbol: 'MATIC', decimals: 18),
      rpcUrls: ['https://polygon-rpc.com/'],
    );

    // await Ethereum.provider!.walletSwitchChain(1337, () async {
    //   await Ethereum.provider!.walletAddChain(
    //     chainId: 1337,
    //     chainName: 'http://localhost:8545',
    //     nativeCurrency:
    //     CurrencyParams(name: 'ETH-02', symbol: 'ETH-02', decimals: 18),
    //     rpcUrls: ['http://localhost:8545'],
    //   );
    // });
  }

  @override
  void onInit() {
    init();

    super.onInit();
  }
}

class FlutterWeb3Home extends StatelessWidget {
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
              if (h.isConnected && h.isInOperatingChain)
                shown = 'You\'re connected!/n ${h.currentAddress}';
              else if (h.isConnected && !h.isInOperatingChain)
                shown = 'Wrong chain[${h.currentChain}]! Please connect to BSC. (56)';
              else if (Ethereum.isSupported)
                return OutlinedButton(
                    child: Text('Connect'), onPressed: h.connectProvider);
              else
                shown = 'Your browser is not supported!';

              return Text(shown,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
            }),
            Container(height: 30),
            if (h.isConnected && h.isInOperatingChain) ...[
              TextButton(
                  onPressed: h.getLastestBlock,
                  child: Text('get lastest block')),
              Container(height: 10),
              TextButton(
                  onPressed: h.testProvider,
                  child: Text('test binance rpc provider')),
              Container(height: 10),
              TextButton(onPressed: h.test, child: Text('test')),
              Container(height: 10),
              TextButton(
                  onPressed: h.testSwitchChain,
                  child: Text('test switch chain')),
            ],
            Container(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wallet Connect connected: ${h.wcConnected}'),
                Container(width: 10),
                OutlinedButton(
                    child: Text('Connect to WC'), onPressed: h.connectWC)
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