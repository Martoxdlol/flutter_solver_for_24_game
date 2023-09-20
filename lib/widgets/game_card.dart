import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:solver_for_24_game/random.dart';

class GameCard extends StatefulWidget {
  const GameCard({super.key, required this.onChange, this.defaultValue, this.small = false});
  final void Function(int? value) onChange;
  final int? defaultValue;
  final bool small;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final hint = randomInt().toString();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 10,
      child: InkWell(
        enableFeedback: false,
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ]),
          child: Stack(children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: 0,
              child: DottedBorder(
                radius: const Radius.circular(8),
                borderPadding: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                borderType: BorderType.RRect,
                dashPattern: const [3, 2],
                strokeWidth: 1,
                color: Colors.grey.shade400,
                child: Center(
                  child: TextField(
                    onChanged: (v) => widget.onChange(int.tryParse(v)),
                    focusNode: focusNode,
                    controller: controller,
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: widget.small ? 22 : 28, color: Colors.black),
                    decoration: InputDecoration.collapsed(
                      hintText: widget.defaultValue?.toString() ?? hint,
                      hintStyle: TextStyle(
                          fontSize: widget.small ? (widget.defaultValue != null ? 22 : 18) : (widget.defaultValue != null ? 28 : 24),
                          color: widget.defaultValue != null ? Colors.grey.shade700 : Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
