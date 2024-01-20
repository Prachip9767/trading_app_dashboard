// States
abstract class MyState {}
class DataLoading extends MyState {}
class DataLoaded extends MyState {
  final double walletAmount;
  final List<CryptoCurrency> recommended;
  final List<CryptoCurrency> myAssets;

  DataLoaded({
    required this.walletAmount,
    required this.recommended,
    required this.myAssets,
  });
}

class CryptoCurrency {
  final String name;
  final double change;
  final double amount;

  CryptoCurrency({
    required this.name,
    required this.change,
    required this.amount,
  });
}