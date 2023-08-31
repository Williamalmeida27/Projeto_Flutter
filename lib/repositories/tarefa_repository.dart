import 'package:my_app/model/tarefa_list.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionarTarefa(Tarefa tarefas) async {
    await Future.delayed(const Duration(milliseconds: 1));
    _tarefas.add(tarefas);
  }

  Future<void> alterarTarefa(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 1));
    _tarefas.where((tarefa) => tarefa.id == id).first.concluido;
  }

  Future<List<Tarefa>> listarTarefa() async {
    await Future.delayed(const Duration(milliseconds: 1));
    return _tarefas;
  }

  Future<List<Tarefa>> listarTarefaNaoConcluidas() async {
    await Future.delayed(const Duration(milliseconds: 1));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }

  Future<void> removerTarefa(String id) async {
    await Future.delayed(const Duration(milliseconds: 1));
    _tarefas.remove(_tarefas.where((element) => element.id == id).first);
  }
}
