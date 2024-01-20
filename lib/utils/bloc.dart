import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app_dashboard/utils/bloc_events.dart';
import 'package:trading_app_dashboard/utils/bloc_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(DataLoading()) {
    on<LoadData>((event, emit) {

      double walletAmount = 8540.00;
      List<CryptoCurrency> recommended = [
        CryptoCurrency(name: 'BNB', change: 1.37, amount: 216.3,),
        CryptoCurrency(name: 'ADL', change: 2.72, amount: 0.4976, ),

      ];
      List<CryptoCurrency> myAssets = [
        CryptoCurrency(name: 'Bitcoin', change: -4.5, amount: 4500.00, ),
        CryptoCurrency(name: 'Tether', change: 0, amount: 2200.00, ),
      ];

      emit(DataLoaded(walletAmount: walletAmount, recommended: recommended, myAssets: myAssets));
    });
  }
}