import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/model/tarefa_list.dart';
import 'package:my_app/repositories/tarefa_repository.dart';

void main() {
  test('Testando metodo adicionar do tarefa repositorie', () {
    Tarefa tarefas = Tarefa("_descricao", true);
    expect(() => TarefaRepository().adicionarTarefa(tarefas), equals(tarefas));
  });
}
