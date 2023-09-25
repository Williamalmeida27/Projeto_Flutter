import 'package:hive/hive.dart';

part 'tarefa_hive_model.g.dart';

@HiveType(typeId: 1)
class TarefaHiveModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? descricao;

  @HiveField(2)
  bool? concluido;

  TarefaHiveModel();

  TarefaHiveModel.criar(this.descricao, this.concluido);
}
