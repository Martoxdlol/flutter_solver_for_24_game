import 'package:flutter/material.dart';
import 'package:solver_for_24_game/solver.dart';
import 'package:solver_for_24_game/widgets/game_cards.dart';
import 'package:solver_for_24_game/widgets/solve_to_card.dart';
import 'package:solver_for_24_game/widgets/split_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '24 Game Solver',
      theme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF333333),
          background: Colors.black,
          inversePrimary: Colors.black,
          onPrimary: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CardsInput? value;
  int? solveTo = 24;

  @override
  Widget build(BuildContext context) {
    print(value);
    print(value);
    print(value);
    print(value);
    print(value);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                children: [
                  AppBar(
                    toolbarHeight: 60,
                    centerTitle: true,
                    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                    title: const Text("24 Game Solver"),
                  ),
                  SplitView(
                    children: [
                      GameCardsContainer(onChange: (value) => setState(() => this.value = value)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SolveToCard(
                            onChange: (value) => setState(() => solveTo = value),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (value == null) return;
          print(solve(value!.values, 24));
        },
        tooltip: 'Solve',
        label: const Text("Solve"),
        icon: const Icon(Icons.calculate),
      ),
    );
  }
}
