import 'package:flutter/material.dart';

class SolverButton extends StatelessWidget {
  const SolverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.calculate,
              color: Colors.black,
            ),
            Text(
              "Solve".toUpperCase(),
              style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
