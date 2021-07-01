import 'dart:ffi';

import 'package:flutter/material.dart';

class IncreaseOrDecrease extends StatefulWidget {
  final num count;
  final void Function() onAdd;
  final void Function() onDecrement;

  const IncreaseOrDecrease(
      {Key? key,
      required this.count,
      required this.onAdd,
      required this.onDecrement})
      : super(key: key);

  @override
  _IncreaseOrDecreaseState createState() => _IncreaseOrDecreaseState();
}

class _IncreaseOrDecreaseState extends State<IncreaseOrDecrease> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Button(
          icon: Icons.remove,
          onPressed: () {
            widget.onDecrement();
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
           widget.count.toString().padLeft(2, "0"),
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Button(
            icon: Icons.add,
            onPressed: () {
              widget.onAdd();
            })
      ],
    );
  }
}

class Button extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;

  const Button({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double horizontal = 5.0;
    const double vertical = 1.0;
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: horizontal, vertical: vertical),
        child: Icon(
          icon,
          color: Colors.grey,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
