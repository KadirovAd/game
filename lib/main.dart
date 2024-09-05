import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_cubit.dart';
import 'game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tile Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LevelSelectionScreen(),
    );
  }
}

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите уровень сложности')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _navigateToGame(context, 3),
              child: const Text('Легкий (3x3)'),
            ),
            ElevatedButton(
              onPressed: () => _navigateToGame(context, 4),
              child: const Text('Средний (4x4)'),
            ),
            ElevatedButton(
              onPressed: () => _navigateToGame(context, 5),
              child: const Text('Сложный (5x5)'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToGame(BuildContext context, int gridSize) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => GameCubit(gridSize),
          child: GameScreen(),
        ),
      ),
    );
  }
}
