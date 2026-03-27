import 'package:app_teste/cubits/home_cubit.dart';
import 'package:app_teste/cubits/home_state.dart';
import 'package:app_teste/views/gastos/edit_gasto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListGastos extends StatefulWidget {
  ListGastos({super.key});

  final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  State<ListGastos> createState() => _ListGastosState();
}

class _ListGastosState extends State<ListGastos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Gastos"), centerTitle: true),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.gastos.length,
            itemBuilder: (context, index) {
              final gasto = state.gastos[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade100, Colors.orange.shade300],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),

                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade400,
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),

                    title: Text(
                      gasto.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.formatter.format(gasto.valor),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),

                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<HomeCubit>(),
                                  child: EditGasto(gasto: gasto),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<HomeCubit>(),
                child: const EditGasto(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
