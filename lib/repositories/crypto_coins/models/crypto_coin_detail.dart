import 'package:equatable/equatable.dart';

class CryptoCoinDetail extends Equatable{
  final String? name;
  final double priceInUSD;
  final String imageUrl;
  final String toSymbol;
  final double high24Hour;
  final double low24Hour;
  //final double lastUpgrade;
    // String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  // factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
  //     _$CryptoCoinDetailFromJson(json);

  // Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  //static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  //static DateTime _dateTimeFromJson(int milliseconds) =>
     // DateTime.fromMillisecondsSinceEpoch(milliseconds);

  const CryptoCoinDetail({
    required this.name, 
    required this.priceInUSD, 
    required this.imageUrl, 
    required this.toSymbol, 
    required this.high24Hour, 
    required this.low24Hour, 
    //required this.lastUpgrade
    });
    
      @override
      List<Object?> get props => [name, priceInUSD, imageUrl, toSymbol, high24Hour,/*low24Hour*/];

 
}