import 'package:app_teste/models/gasto/gasto.dart';
import 'package:app_teste/models/investimento/investimento.dart';

class HomeState {
  final List<Gasto> gastos;
  final List<Investimento> investimentos;

  const HomeState({this.gastos = const [], this.investimentos = const []});

  HomeState copyWith({List<Gasto>? gastos, List<Investimento>? investimentos}) {
    return HomeState(
      gastos: gastos ?? this.gastos,
      investimentos: investimentos ?? this.investimentos,
    );
  }
}
