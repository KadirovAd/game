import 'package:bloc/bloc.dart';

class GameCubit extends Cubit<List<List<int>>> {
  final int gridSize;

  GameCubit(this.gridSize) : super(_initialGrid(gridSize));

  static List<List<int>> _initialGrid(int size) {
    return List.generate(
      size,
      (_) => List.generate(size, (_) => 1),
    );
  }

  void incrementTile(int row, int col) {
    List<List<int>> newGrid = List.from(state);
    if (newGrid[row][col] != 0) {
      newGrid[row][col] = newGrid[row][col] % 5 + 1;
    }
    emit(newGrid);
  }

  void restartGame() {
    emit(_initialGrid(gridSize));
  }
}
