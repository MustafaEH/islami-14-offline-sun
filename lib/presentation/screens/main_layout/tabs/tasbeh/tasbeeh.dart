import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  int tasbeehCount = 0;
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AssetsManager.sebhaBackground),
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Image.asset(AssetsManager.tasbeehHeader),
              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              InkWell(
                onTap: _incrementCounter,
                child: Stack(
                  alignment: Alignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    AnimatedRotation(
                      turns: turns,
                      duration: const Duration(milliseconds: 600),
                      child: Column(
                        children: [
                          Image.asset(
                            AssetsManager.sebhaHead,
                            height: 50,
                          ),
                          Image.asset(
                            AssetsManager.sebhaBody,
                            height: 350,
                          ),
                        ],
                      ),
                    ),
                    TasbeehCounter(tasbeehCount: tasbeehCount),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      tasbeehCount++;
      turns += 1 / 33;
    });
  }
}

class TasbeehCounter extends StatelessWidget {
  final int tasbeehCount;

  const TasbeehCounter({super.key, required this.tasbeehCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text(
          "سُبْحَانَ اللَّهِ",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 25),
        Text(
          "$tasbeehCount",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
