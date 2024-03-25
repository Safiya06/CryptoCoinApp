import 'dart:async';

import 'package:crypto_coins_list_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_coins_list_app.dart';
import 'repositories/crypto_coins/crypto_coins_repository.dart';

void main() {

    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton(talker);
    GetIt.I<Talker>().debug('Talker started...');

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    ()=>CryptoCoinsRepository(dio:Dio()),
    );

    runZonedGuarded(() => runApp(const CryproCurrenciesListApp()),
     (e, st) => GetIt.I<Talker>().handle(e,st)
     );
  
}




