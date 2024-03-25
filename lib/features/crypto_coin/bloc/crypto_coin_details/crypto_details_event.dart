part of 'crypto_details_bloc.dart';

abstract class CryptoDetailsEvent{}
class LoadCryptoCoinDetails extends CryptoDetailsEvent{
  final String? currencyCode;

  LoadCryptoCoinDetails({
    required this.currencyCode
    });
  // @override
  // List<Object?> get props => [currencyCode];
}

class CryptoCoinDetailsLoadingEvent extends CryptoDetailsEvent {
  
}