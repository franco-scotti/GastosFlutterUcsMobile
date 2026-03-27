class Investimento {
  final int id;
  final String nome;
  final double valor;
  final double valorAtual;

  const Investimento({
    this.id = 0,
    required this.nome,
    required this.valor,
    required this.valorAtual,
  });
}
