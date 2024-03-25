 part of 'crypto_details_bloc.dart';
  class CryptoDetailsState{
   CryptoCoinModel cryptoCoinModel;
   CryptoDetailsState({required this.cryptoCoinModel});
 }

 class CryptoDetailInitial extends CryptoDetailsState{
   CryptoDetailInitial({required CryptoCoinModel cryptoCoinModel}) : super (cryptoCoinModel: cryptoCoinModel);
   // @override
   // List<Object?> get props => [];
 }

 class CryptoDetailsLoading extends CryptoDetailsState{
   CryptoDetailsLoading({required CryptoCoinModel cryptoCoinModel}) : super (cryptoCoinModel: cryptoCoinModel);
   // @override
   // List<Object?> get props => [];
 }

 class CryptoDetailsLoaded extends CryptoDetailsState{
   CryptoDetailsLoaded({required CryptoCoinModel cryptoCoinModel}) : super (cryptoCoinModel: cryptoCoinModel);
   // final CryptoCoinDetail? coin;

   // CryptoCoinDetailsLoaded({this.coin});
  
   // @override
   // List<Object?> get props => [coin];
 }
 class CryptoCoinDetailsLoadingFalure extends CryptoDetailsState{
  CryptoCoinDetailsLoadingFalure({required CryptoCoinModel cryptoCoinModel}) : super (cryptoCoinModel: cryptoCoinModel);
   //   final Object? exception;

   // CryptoCoinDetailsLoadingFalure({
   //    this.exception
   //   });
   // @override
   // List<Object?> get props => [exception];
 }


 
// class CryptoCoinDetailsState extends Equatable{
//   const CryptoCoinDetailsState();
  
  
//   @override
//   List<Object?> get props => [];
// }
// class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {
//   @override
//   List<Object?> get props => [];
// }
// class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {
//   const CryptoCoinDetailsLoaded(this.coinDetails);
//   final CryptoCoinDetail coinDetails;
//   @override
//   List<Object?> get props => [coinDetails];
// }
// class CryptoCoinDetailsLoadingFalure extends CryptoCoinDetailsState {
//   const CryptoCoinDetailsLoadingFalure(
//     this.exception,
//     this.stack
//     );
//   final Object exception;
//   final Object stack;
//   @override
//   List<Object?> get props => [exception];
// }
