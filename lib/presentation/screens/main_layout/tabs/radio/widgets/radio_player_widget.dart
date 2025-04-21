import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';

class SoundPlayWidget extends StatefulWidget {
  SoundPlayWidget({super.key, required this.name});

  final String name;
  bool isPlayed = false;
  bool isMuted = false;

  @override
  State<SoundPlayWidget> createState() => _SoundPlayWidgetState();
}

class _SoundPlayWidgetState extends State<SoundPlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 132,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: !widget.isPlayed
                ? const AssetImage(AssetsManager.radioPlayerBackground)
                : const AssetImage(AssetsManager.playingRadio),
            fit: BoxFit.fitWidth),
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name,
              style: const TextStyle(
                color: ColorsManager.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    widget.isPlayed = !widget.isPlayed;
                    setState(() {});
                  },
                  icon: Icon(
                    widget.isPlayed ? Icons.pause : Icons.play_arrow,
                    size: 40,
                  )),
              IconButton(
                  onPressed: () {
                    widget.isMuted = !widget.isMuted;
                    setState(() {});
                  },
                  icon: Icon(
                    widget.isMuted ? Icons.volume_off : Icons.volume_up_rounded,
                    size: 36,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
