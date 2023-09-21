import 'package:flutter/material.dart';

class SolverButton extends StatefulWidget {
  const SolverButton({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<SolverButton> createState() => _SolverButtonState();
}

class _SolverButtonState extends State<SolverButton> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: focused ? Colors.grey[500] : null,
      ),
      child: InkWell(
        onFocusChange: (value) {
          setState(() {
            focused = value;
          });
        },
        onTap: widget.onTap,
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
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
