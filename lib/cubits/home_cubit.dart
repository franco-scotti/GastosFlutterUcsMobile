import 'package:app_teste/cubits/home_state.dart';
import 'package:app_teste/models/gasto/gasto.dart';
import 'package:app_teste/models/investimento/investimento.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
    : super(
        const HomeState(
          gastos: [
            Gasto(id: 0, nome: 'SuperMercado', valor: 2),
            Gasto(id: 1, nome: 'Gasolina', valor: 1),
          ],
          investimentos: [
            Investimento(
              id: 0,
              nome: 'Terreno',
              valor: 500000,
              valorAtual: 55000,
            ),
            Investimento(
              id: 1,
              nome: 'Casa',
              valor: 200000,
              valorAtual: 220000,
            ),
          ],
        ),
      );

  void adicionarGasto(Gasto gasto) {
    final novaLista = List<Gasto>.from(state.gastos);
    novaLista.add(gasto);

    emit(state.copyWith(gastos: novaLista));
  }

  void editarGasto(Gasto gastoAtualizado) {
    final novaLista = state.gastos.map((gasto) {
      if (gasto.id == gastoAtualizado.id) {
        return gastoAtualizado;
      }
      return gasto;
    }).toList();

    emit(state.copyWith(gastos: novaLista));
  }

  void adicionarInvestimento(Investimento investimento) {
    final novaLista = List<Investimento>.from(state.investimentos);
    novaLista.add(investimento);

    emit(state.copyWith(investimentos: novaLista));
  }

  void editarInvestimento(Investimento investimentoAtualizado) {
    final novaLista = state.investimentos.map((investimento) {
      if (investimento.id == investimentoAtualizado.id) {
        return investimentoAtualizado;
      }
      return investimento;
    }).toList();

    emit(state.copyWith(investimentos: novaLista));
  }
}
