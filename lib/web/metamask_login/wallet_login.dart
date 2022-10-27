import 'package:js/js.dart';

@JS('window')
external dynamic get window;
@JS('window.ethereum')
external dynamic get ethereum;
@JS('window.address')
external dynamic get _address;
@JS('window.chainId')
external dynamic get _chainId;
@JS('eval')
external dynamic get eval;

enum WalletType{
  metamask,
  coinbase,
}

class WalletLogin {
  String? address;
  int? chainId;

  bool get isSupported => ethereum != null;

  Future<bool> login(WalletType walletType) async {
    try {
      if (ethereum == null) {
        print("ethereum is null");
        return false;
      }
      eval('''
      async function walletLogin(){
        if (typeof window.ethereum !== 'undefined') {
          console.log('walletLogin is installed!');
        }
        if(typeof window.ethereum.providers !== 'undefined' && window.ethereum.providers.length > 1){
          var walletProvider;
          if("${walletType.name}" == "coinbase") {
            walletProvider = window.ethereum.providers.find((provider) => provider.isCoinbaseWallet);
          }else {
            walletProvider = window.ethereum.providers.find((provider) => provider.isMetaMask);
          }
          var provider = new ethers.providers.Web3Provider(walletProvider);
        }else{
          var provider = new ethers.providers.Web3Provider(window.ethereum);
        }
        await provider.send("eth_requestAccounts", []);
        window.address = await provider.getSigner().getAddress();
        window.chainId = await provider.send("eth_chainId");
      }
      walletLogin();
      ''');
      while (_address == null) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      address = _address.toString();
      chainId = int.parse(_chainId);
      return true;
    } catch (e) {
      print("walletLogin login e is $e");
      return false;
    }
  }
}
