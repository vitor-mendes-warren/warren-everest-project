import 'package:warren_task_one/portfolio/mapper/coin_mapper.dart';
import 'package:warren_task_one/portfolio/model/coin_view_data.dart';
import 'package:warren_task_one/shared/repository/coin_repository.dart';

class GetAllCoinUseCase {
  final CoinRepository repository;
  GetAllCoinUseCase({
    required this.repository,
  });
  Future<List<CoinViewData>> execute() async {
    final response = await repository.getAllCharacters();

    return response.toViewData();
  }
}
