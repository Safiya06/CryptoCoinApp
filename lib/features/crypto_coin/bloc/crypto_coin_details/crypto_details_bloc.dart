import 'package:crypto_coins_list_app/features/crypto_coin/bloc/crypto_coin_details/crypto_coin_model.dart';
import 'package:crypto_coins_list_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_details_event.dart';
part 'crypto_details_state.dart';

class CryptoCoinDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepository)
   : super(CryptoDetailsState(cryptoCoinModel: CryptoCoinModel())) {
    on<LoadCryptoCoinDetails>(_load);
  }

  final  AbstractCoinsRepository coinsRepository;

  Future<void> _load(
    LoadCryptoCoinDetails event,
    Emitter <CryptoDetailsState> emit,
  )async {
      final current = state.cryptoCoinModel;
      debugPrint("work");
    // try {
      if(state is! CryptoDetailsLoaded){
        emit( CryptoDetailsLoading(cryptoCoinModel:  current));
      }
      final coinDetails =
      await coinsRepository.getCoinDetails(event.currencyCode);
      current.coin = coinDetails;
debugPrint("$coinDetails");

      emit(CryptoDetailsLoaded(cryptoCoinModel: current));
      debugPrint("$state");
    // } catch(e){
    //   debugPrint("$e");
    //   current.error = e;
    //   emit(CryptoCoinDetailsLoadingFalure(cryptoCoinModel:  current));
    // }
  }
}

// import 'package:crypto_coins_list_app/features/crypto_coin/bloc/crypto_coin_details/crypto_coin_model.dart';
// import 'package:crypto_coins_list_app/features/crypto_list/bloc/crypto_list_bloc.dart';
// import 'package:crypto_coins_list_app/repositories/crypto_coins/abstract_coins_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'crypto_details_event.dart';
// part 'crypto_details_state.dart';

// class CryptoDetailsBloc
//  extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
//   CryptoDetailsBloc(this.coinsRepository)
//    : super( CryptoDetailsState(cryptoCoinModel: CryptoCoinModel())) {
//     on<LoadCryptoCoinDetails>(_load);
//   }
//     final AbstractCoinsRepository coinsRepository;

// Future<void> _load(
//   LoadCryptoList event,
//   Emitter <CryptoListState> emit,
//   ) async {
//   try {
//     if(state is! CryptoDetailsLoaded){
//       emit(const CryptoDetailsLoading(cryptoCoinModel:current));
//     }
//     final coinDetails =
//     await coinsRepository.getCoinDetails(event.currencyCode);

//     emit(CryptoDetailsLoaded(coinDetails));
//   }
//   catch(e,st){
//     emit(CryptoDetailsLoadingFalure(e,st));
//     GetIt.I<Talker>().handle(e,st);
//   }
// }
// }