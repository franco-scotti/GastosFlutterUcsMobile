import 'package:app_teste/cubits/home_cubit.dart';
import 'package:app_teste/models/gasto/gasto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditGasto extends StatefulWidget {
  final Gasto? gasto;

  const EditGasto({super.key, this.gasto});

  @override
  State<EditGasto> createState() => _EditGastoState();
}

class _EditGastoState extends State<EditGasto> {
  late TextEditingController nomeController;
  late TextEditingController valorController;

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController(text: widget.gasto?.nome ?? '');

    valorController = TextEditingController(
      text: widget.gasto?.valor.toString() ?? '',
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
        backgroundColor: Colors.red.shade400,
        title: const Text('Editar Gasto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do gasto',
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

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final gastos = context.read<HomeCubit>().state.gastos;

                  final ultimoId = gastos.isNotEmpty ? gastos.last.id : 0;
                  final novoId = ultimoId + 1;

                  final novoGasto = Gasto(
                    id: widget.gasto?.id ?? novoId,
                    nome: nomeController.text,
                    valor: double.tryParse(valorController.text) ?? 0,
                  );

                  if (widget.gasto == null) {
                    context.read<HomeCubit>().adicionarGasto(novoGasto);
                  } else {
                    context.read<HomeCubit>().editarGasto(novoGasto);
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
