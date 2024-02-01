import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  bool isThinking = false;
  List<String> diceImages = [];

  @override
  void initState() {
    super.initState();
    // Start with one dice
    diceImages.add('assets/images/dice-3.png');
  }

  void rollDice() {
    setState(() {
      isThinking = true;
      Random random = Random();
      for (int i = 0; i < diceImages.length; i++) {
        int intValue = random.nextInt(6) + 1;
        diceImages[i] = 'assets/images/dice-$intValue.png';
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isThinking = false;
      });
    });
  }

  void addDice() {
    if (diceImages.length < 6) {
      setState(() {
        diceImages.add('assets/images/dice-${Random().nextInt(6) + 1}.png');
      });
    }
  }

  void removeDice() {
    if (diceImages.isNotEmpty && diceImages.length != 1) {
      setState(() {
        diceImages.removeLast();
      });
    }
  }

  void removeDiceByIndex(int index) {

    if(diceImages.length > 1){
setState(() {
      diceImages.removeAt(index);
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: !isThinking
                ? Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: diceImages.asMap().entries.map((entry) {
                      int index = entry.key;
                      String diceImage = entry.value;

                      return GestureDetector(
                        onTap: () => removeDiceByIndex(index),
                        child: Image.asset(
                          diceImage,
                          width: 150,
                          height: 150,
                        ),
                      );
                    }).toList(),
                  )
                : Container(
                    height: 300,
                    alignment: Alignment.center,
                    child: const Text(
                      'THINKING',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
          ),
        ),
        Column(
          children: [
            TextButton(
              onPressed: !isThinking ? rollDice : () {},
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 242, 255, 177),
                  minimumSize: const Size(150, 50)),
              child: const Text(
                "Roll dice!",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: diceImages.length != 6 ? addDice : null,
              style: TextButton.styleFrom(
                  backgroundColor: diceImages.length != 6 ? const Color.fromARGB(255, 242, 255, 177) : const Color.fromARGB(59, 254, 255, 248),
                  minimumSize: const Size(150, 50)),
              child: Text(
                "Add dice!",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: diceImages.length != 6 ? Colors.black : Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: diceImages.length > 1 ? removeDice : null,
              style: TextButton.styleFrom(
                  backgroundColor: diceImages.length > 1 ? const Color.fromARGB(255, 242, 255, 177) : const Color.fromARGB(59, 254, 255, 248),
                  minimumSize: const Size(150, 50)),
              child: Text(
                "Remove dice!",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: diceImages.length > 1 ? Colors.black : Colors.white),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
