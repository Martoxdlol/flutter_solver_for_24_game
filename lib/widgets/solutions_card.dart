import 'package:flutter/material.dart';
import 'package:solve_24_game/solution.dart';
import 'package:solver_for_24_game/solution_view.dart';
import 'package:solver_for_24_game/widgets/game_cards.dart';

class SolutionsCard extends StatelessWidget {
  const SolutionsCard({
    super.key,
    required this.input,
    required this.solveTo,
    required this.solutions,
  });

  final CardsInput input;
  final int solveTo;
  final List<Solution> solutions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: SizedBox(
        child: Column(
          children: [
            Text(
              "Solutions for $solveTo",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: input.values
                  .map(
                    (e) => Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[600],
                        ),
                        child: Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  showSolutionView(context, solutions, input, solveTo);
                },
                child: Text(
                  "Show ${solutions.length} solution",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
