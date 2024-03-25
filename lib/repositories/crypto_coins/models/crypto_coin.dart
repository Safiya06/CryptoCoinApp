import 'package:crypto_coins_list_app/repositories/crypto_coins/models/crypto_coin_detail.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  final String? name;
  final double priceInUSD;
  final String imageUrl;
  final CryptoCoinDetail? details;

  const CryptoCoin( {this.details,
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
    });
    
      @override
      List<Object?> get props => [name, priceInUSD, imageUrl];
}