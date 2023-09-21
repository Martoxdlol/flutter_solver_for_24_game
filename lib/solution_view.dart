import 'package:flutter/material.dart';
import 'package:solve_24_game/solution.dart';
import 'package:solver_for_24_game/solution_page_route.dart';
import 'package:solver_for_24_game/widgets/game_cards.dart';

void showSolutionView(BuildContext context, List<Solution> solutions,
    CardsInput input, int solveTo) {
  Navigator.of(context).push(
    SolutionPageRoute(
      builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 6,
                right: 6,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: Text(
                  "Solutions for $solveTo",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Positioned(
                top: 46,
                left: 20,
                right: 20,
                bottom: 20,
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: solutions
                        .map((e) => SolutionTile(
                              solution: e,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

class SolutionTile extends StatelessWidget {
  const SolutionTile({
    super.key,
    required this.solution,
  });

  final Solution solution;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          solution.toString(),
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
