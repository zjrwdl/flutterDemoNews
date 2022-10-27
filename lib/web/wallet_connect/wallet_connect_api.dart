import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:algorand_dart/algorand_dart.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class HomeController extends GetxController {

  // Algorand _buildAlgorand() {
  //   final algodClient = AlgodClient(
  //     apiUrl: AlgoExplorer.MAINNET_ALGOD_API_URL,
  //   );
  //   final indexerClient = IndexerClient(
  //     apiUrl: AlgoExplorer.MAINNET_ALGOD_API_URL,
  //   );
  //   return Algorand(algodClient: algodClient, indexerClient: indexerClient);
  // }
  static const OPERATING_CHAIN = 56; // meemo modify for test

  @override
  Future<void> onInit() async {
    super.onInit();

    print("web3 onInit");

    // Create an Algorand instance
    // final algorand = _buildAlgorand();


    // Create a connector
    final connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: PeerMeta(
        name: 'WalletConnect',
        description: 'WalletConnect Developer App',
        url: 'https://walletconnect.org',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );
    print("wallet_connect is ${connector.session.accounts}");

    //final algo = AlgorandWalletConnectProvider(connector);

    final ethereumProvider = EthereumWalletConnectProvider(connector);

    // Check if connection is already established
    // Subscribe to events
    connector.on('connect', (session) => print("session is : $session"));
    connector.on('session_update', (payload) => print("payload is : $payload"));
    connector.on('disconnect', (session) => print("disconnect session is $session"));

    // Create a new session
    final session = await connector.createSession(
      chainId: OPERATING_CHAIN,
      onDisplayUri: (uri) => print("wallet_connect uri is $uri"),
    );

    print("wallet_connect session is ${session.accounts}");
    // final sender = Address.fromAlgorandAddress(address: session.accounts[0]);

    // Fetch the suggested transaction params
    // final params = await algorand.getSuggestedTransactionParams();

    // Build the transaction
    // final tx = await (PaymentTransactionBuilder()
    //   ..sender = sender
    //   ..noteText = 'Signed with WalletConnect'
    //   ..amount = Algo.toMicroAlgos(0.0001)
    //   ..receiver = sender
    //   ..suggestedParams = params)
    //     .build();

    // Sign the transaction
    // final signedBytes = await algo.signTransaction(
    //   tx.toBytes(),
    //   params: {
    //     'message': 'Optional description message',
    //   },
    // );

    // Broadcast the transaction
    // final txId = await algorand.sendRawTransactions(
    //   signedBytes,
    //   waitForConfirmation: true,
    // );
    // print("wallet_connect txId is $txId");

    // Kill the session
    connector.killSession();
  }
}

class WalletConnectHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (h) => Scaffold(
        body: Center(),
      ),
    );
  }
}