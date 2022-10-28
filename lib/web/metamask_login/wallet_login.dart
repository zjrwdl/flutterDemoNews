import 'package:js/js.dart';

@JS('window')
external dynamic get window;
@JS('window.ethereum')
external dynamic get ethereum;
@JS('window.address')
external dynamic get _address;
@JS('window.chainId')
external dynamic get _chainId;
@JS('window.errorCode')
external dynamic get _errorCode;
@JS('eval')
external dynamic get eval;

enum WalletType{
  metamask,
  coinbase,
}

enum WalletLoginErrorCode{
  unKnown,
  extensionNotInstall,
}

class WalletLogin {
  String? address;
  int? chainId;
  int errorCode = WalletLoginErrorCode.unKnown.index;

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
          console.log('walletLogin window.ethereum is installed!');
        }
        console.log("window.ethereum.isMetaMask is : " + window.ethereum.isMetaMask);
        console.log("window.ethereum.isCoinbaseWallet is : " + window.ethereum.isCoinbaseWallet);
        console.log(window.ethereum);
        var checkWalletExtensionInstalled = false;
        var provider;
        if(typeof window.ethereum.providers !== 'undefined' && window.ethereum.providers.length > 1){
          var walletProvider;
          if("${walletType.name}" == "coinbase") {
            console.log('walletLogin want to login coinbase!');
            walletProvider = window.ethereum.providers.find((provider) => provider.isCoinbaseWallet);
          }else if("${walletType.name}" == "matamask") {
            console.log('walletLogin want to login matamask!');
            walletProvider = window.ethereum.providers.find((provider) => provider.isMetaMask);
          }
          if(walletProvider != null) {
            checkWalletExtensionInstalled = true;
            provider = new ethers.providers.Web3Provider(walletProvider);
          }
        }else{
          //如果只有一个provider的时候，通过window.ethereum.isMetaMask或者window.ethereum.isCoinbaseWallet来判断默认的是什么钱包，如果都不是，直接提示错误，引导用户安装插件
          if("${walletType.name}" == "coinbase" && window.ethereum.isCoinbaseWallet == true) {
            checkWalletExtensionInstalled = true;
          }
          if("${walletType.name}" == "metamask" && window.ethereum.isMetaMask == true) {
            checkWalletExtensionInstalled = true;
          }
          provider = new ethers.providers.Web3Provider(window.ethereum);
        }
        if(checkWalletExtensionInstalled) {
          await provider.send("eth_requestAccounts", []);
          window.address = await provider.getSigner().getAddress();
          window.chainId = await provider.send("eth_chainId");
        }else {
          //记录错误，提示用户安装插件
          console.log('wallet extension [${walletType.name}] not installed!');
          window.errorCode = ${WalletLoginErrorCode.extensionNotInstall.index};
        }
      }
      walletLogin();
      ''');
      if(_errorCode == WalletLoginErrorCode.unKnown.index) {
        print("walletLogin success");
        address = _address.toString();
        chainId = int.parse(_chainId);
      }else {
        errorCode = _errorCode;
        print("walletLogin errorCode is $_errorCode");
        return false;
      }
      return true;
    } catch (e) {
      print("walletLogin login e is $e");
      return false;
    }
  }

}
