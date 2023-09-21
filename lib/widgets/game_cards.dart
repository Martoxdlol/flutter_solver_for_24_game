import 'package:flutter/material.dart';
import 'package:solver_for_24_game/widgets/game_card.dart';

class GameCardsContainer extends StatefulWidget {
  const GameCardsContainer({super.key, required this.onChange});
  final void Function(CardsInput value) onChange;

  @override
  State<GameCardsContainer> createState() => _GameCardsContainerState();
}

class _GameCardsContainerState extends State<GameCardsContainer> {
  int? first;
  int? second;
  int? third;
  int? fourth;

  void updateState(void Function() callback) {
    setState(callback);
    if (first != null && second != null && third != null && fourth != null) {
      widget.onChange(CardsInput(first!, second!, third!, fourth!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: FocusTraversalGroup(
        child: Column(
          children: [
            ContainerRow(
              children: [
                GameCard(onChange: (value) => updateState(() => first = value)),
                GameCard(
                    onChange: (value) => updateState(() => second = value)),
              ],
            ),
            ContainerRow(
              children: [
                GameCard(onChange: (value) => updateState(() => third = value)),
                GameCard(
                    onChange: (value) => updateState(() => fourth = value)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ContainerRow extends StatelessWidget {
  const ContainerRow({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: e,
              ),
            ),
          )
          .toList(),
    );
  }
}

class CardsInput {
  const CardsInput(this.first, this.second, this.third, this.fourth);

  final int first;
  final int second;
  final int third;
  final int fourth;

  List<int> get values => [first, second, third, fourth];
}
