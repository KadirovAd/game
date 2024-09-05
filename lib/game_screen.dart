import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_cubit.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Игра')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BlocBuilder<GameCubit, List<List<int>>>(
              builder: (context, grid) {
                return Center(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: grid.length,
                    ),
                    itemCount: grid.length * grid.length,
                    itemBuilder: (context, index) {
                      final row = index ~/ grid.length;
                      final col = index % grid.length;
                      final value = grid[row][col];

                      return GestureDetector(
                        onTap: value != 0
                            ? () => context.read<GameCubit>().incrementTile(row, col)
                            : null,
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          color: value == 0 ? Colors.cyan : Colors.green,
                          child: Center(
                            child: Text(
                              value != 0 ? '$value' : '',
                              style: const TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => context.read<GameCubit>().restartGame(),
              child: const Text('Рестарт'),
            ),
          ),
        ],
      ),
    );
  }
}
