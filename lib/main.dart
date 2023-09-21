import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solve_24_game/solution.dart';
import 'package:solve_24_game/solve_24_game.dart' as solver;
import 'package:solver_for_24_game/widgets/game_cards.dart';
import 'package:solver_for_24_game/widgets/solutions_card.dart';
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

Iterable<Solution> solveCallback((CardsInput cards, int? solveTo) data) {
  return solver.solve([
    data.$1.first,
    data.$1.second,
    data.$1.third,
    data.$1.fourth,
  ], data.$2 ?? 24);
}

class _HomePageState extends State<HomePage> {
  CardsInput? value;
  int? solveTo = 24;
  List<Solution>? solutions;
  final scrollController = ScrollController();

  void solve() {
    if (value == null) return;

    final solutions = solver.solve([
      value!.first,
      value!.second,
      value!.third,
      value!.fourth,
    ], solveTo ?? 24);

    final noRepeat = <String, Solution>{};

    for (final solution in solutions) {
      final key = solution.toString();
      if (noRepeat.containsKey(key)) continue;
      noRepeat[key] = solution;
    }

    setState(() {
      this.solutions = noRepeat.values.toList();
    });

    scrollController.animateTo(500,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
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
                controller: scrollController,
                children: [
                  AppBar(
                    toolbarHeight: 60,
                    centerTitle: true,
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    title: const Text("24 Game Solver"),
                  ),
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: SplitView(
                        children: [
                          GameCardsContainer(
                            onChange: (value) => setState(() {
                              this.value = value;
                              solutions = null;
                            }),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SolveToCard(
                                onChange: (value) => setState(() {
                                  solveTo = value;
                                  solutions = null;
                                }),
                                onSolve: solve,
                              ),
                              if (solutions != null &&
                                  solutions!.isNotEmpty &&
                                  value != null)
                                SolutionsCard(
                                  input: value!,
                                  solveTo: solveTo ?? 24,
                                  solutions: solutions!,
                                ),
                              if (solutions?.isEmpty == true)
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      "No solutions found",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
