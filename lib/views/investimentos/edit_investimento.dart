import 'package:app_teste/cubits/home_cubit.dart';
import 'package:app_teste/models/investimento/investimento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInvestimento extends StatefulWidget {
  final Investimento? investimento;

  const EditInvestimento({super.key, this.investimento});

  @override
  State<EditInvestimento> createState() => _EditInvestimentoState();
}

class _EditInvestimentoState extends State<EditInvestimento> {
  late TextEditingController nomeController;
  late TextEditingController valorController;
  late TextEditingController valorAtualController;

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController(
      text: widget.investimento?.nome ?? '',
    );

    valorController = TextEditingController(
      text: widget.investimento?.valor.toString() ?? '',
    );

    valorAtualController = TextEditingController(
      text: widget.investimento?.valorAtual.toString() ?? '',
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade400,
        title: const Text('Editar Investimento'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do investimento',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: valorAtualController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor Atual',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final investimentos = context
                      .read<HomeCubit>()
                      .state
                      .investimentos;

                  final ultimoId = investimentos.isNotEmpty
                      ? investimentos.last.id
                      : 0;
                  final novoId = ultimoId + 1;

                  final novoInvestimento = Investimento(
                    id: widget.investimento?.id ?? novoId,
                    nome: nomeController.text,
                    valor: double.tryParse(valorController.text) ?? 0,
                    valorAtual: double.tryParse(valorAtualController.text) ?? 0,
                  );

                  if (widget.investimento == null) {
                    context.read<HomeCubit>().adicionarInvestimento(
                      novoInvestimento,
                    );
                  } else {
                    context.read<HomeCubit>().editarInvestimento(
                      novoInvestimento,
                    );
                  }

                  Navigator.pop(context);
                },
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
