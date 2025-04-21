import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/radio/widgets/radio_player_widget.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});
  final List<SoundPlayWidget> radios = [
    SoundPlayWidget(name: "Radio Ibrahim Al-Akdar"),
    SoundPlayWidget(name: "Radio Al-Qaria Yassen"),
    SoundPlayWidget(name: "Radio Ahmed Al-trabulsi"),
    SoundPlayWidget(name: "Radio Addokali Mohammad Alalim"),
  ];
  final List<SoundPlayWidget> reciters = [
    SoundPlayWidget(name: " Ibrahim Al-Akdar"),
    SoundPlayWidget(name: " Al-Qaria Yassen"),
    SoundPlayWidget(name: " Ahmed Al-trabulsi"),
    SoundPlayWidget(name: " Addokali Mohammad Alalim"),
  ];

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isRadioSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsManager.radioBackground), fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManager.radioHeader,
              width: 200,
              height: 200,
            ),
            buildSwitcher(),
            isRadioSelected
                ? Expanded(
                    child: ListView.builder(
                      itemCount: widget.radios.length,
                      itemBuilder: (context, index) {
                        return widget.radios[index];
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: widget.reciters.length,
                      itemBuilder: (context, index) {
                        return widget.reciters[index];
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  buildSwitcher() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isRadioSelected = true;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    isRadioSelected ? ColorsManager.gold : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  "Radio",
                  style: TextStyle(
                      color: isRadioSelected
                          ? ColorsManager.black
                          : ColorsManager.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isRadioSelected = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    !isRadioSelected ? ColorsManager.gold : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  "Reciters",
                  style: TextStyle(
                      color: !isRadioSelected
                          ? ColorsManager.black
                          : ColorsManager.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
