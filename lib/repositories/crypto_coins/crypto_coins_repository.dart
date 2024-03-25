import 'package:crypto_coins_list_app/repositories/crypto_coins/models/crypto_coin_detail.dart';
import 'package:dio/dio.dart';

import 'abstract_coins_repository.dart';
import 'models/crypto_coin.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository{

     Dio dio;

  CryptoCoinsRepository({
    required this.dio,
    });

  @override
  Future<List<CryptoCoin>> getCoinsList() async{
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDT,USDC,BUSD,XRP,ADA,SOL,DOGE,DOT,DAI,MATIC,SHIB,TRX,AVAX,LEO,LTC,XLM,BCH&tsyms=USD');
    final data = response.data as Map<String,dynamic>;
    final dataRaw = data['RAW'] as Map<String,dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = 
         (e.value as Map<String,dynamic>) ['USD'] as Map<String,dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
      name: e.key,
      priceInUSD: price,
      imageUrl: 'https://www.cryptocompare.com/$imageUrl',
    );})
    .toList();
    return cryptoCoinsList;
  }
  
  @override
  Future<CryptoCoinDetail> getCoinDetails(String? currencyCode) async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map<String,dynamic>;
    final dataRaw = data['RAW'] as Map<String,dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String,dynamic>;
    final usdData = coinData['USD'] as Map<String,dynamic>;
    final price = usdData['PRICE'];
    final imageUrl = usdData['IMAGEURL'];
    final toSymbol = usdData['TOSYMBOL'];
    //final lastUpgrade = usdData['LASTUPGRADE'];
    final high24Hour = usdData['HIGH24HOUR'];
    final low24Hour = usdData['LOW24HOUR'];

    return CryptoCoinDetail(
      name: currencyCode,
      priceInUSD: price,
      imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      toSymbol: toSymbol,
      //lastUpgrade: DateTime.fromMillisecondsSinceEpoch(lastUpgrade),
      high24Hour: high24Hour,
      low24Hour: low24Hour,
    );
  }
}
