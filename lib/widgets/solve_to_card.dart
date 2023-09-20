import 'package:flutter/material.dart';
import 'package:solver_for_24_game/widgets/game_card.dart';
import 'package:solver_for_24_game/widgets/solver_button.dart';

class SolveToCard extends StatelessWidget {
  const SolveToCard({super.key, required this.onChange});
  final void Function(int? value) onChange;

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
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            GameCard(onChange: onChange, defaultValue: 24, small: true),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SolverButton(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
