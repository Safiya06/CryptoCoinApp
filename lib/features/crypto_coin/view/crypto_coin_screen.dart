import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list_app/features/crypto_coin/bloc/crypto_coin_details/crypto_details_bloc.dart';
import 'package:crypto_coins_list_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list_app/repositories/crypto_coins/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({
    super.key,
    // required this.coin,
  });
// ModalRoute.of
  // final CryptoCoin coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  // CryptoCoin? coin;

  final _coinDetailsBloc = CryptoCoinDetailsBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final coin = ModalRoute.of(context)?.settings.arguments as CryptoCoin;
    _coinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: coin.name));      
    });

    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   assert(args != null && args is CryptoCoin, 'You must provide String args');
  //   coin = args as CryptoCoin;
  //   _coinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: coin!.name));
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoDetailsState>(
        bloc: _coinDetailsBloc,
        builder: (context, state) {
          
            final coin = state.cryptoCoinModel.coin;
            final coinDetails = coin;
            return state is CryptoDetailsLoaded ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(coinDetails?.imageUrl ??'-'),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    coin?.name ?? '-',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 350,
                    height: 80,
                    child: Card(
                       color: Colors.black,
                      child: Center(
                        child: Text(
                          '${coinDetails?.priceInUSD} \$',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width:350,
                    height: 90,
                    margin: EdgeInsets.only(top: 10),
                    //padding: EdgeInsets.only(top:5),
                    child: Card(
                      color: Colors.black,
                      child: Column(
                        children: [
                          _DataRow(
                            title: 'High 24 Hour',
                            value: '${coinDetails?.high24Hour} \$',
                          ),
                          const SizedBox(height: 6),
                          _DataRow(
                            title: 'Low 24 Hour',
                            value: '${coinDetails?.low24Hour} \$',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ) : Text("");
          // return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100, child: Text(title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),)),
       // const SizedBox(width: 10),
        Flexible(
          child: Text(value, 
          style: const TextStyle(
            fontSize:16,
            fontWeight: FontWeight.w400,
            ),),
        ),
      ],
    );
  }
}