import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:myproject/view/dropdown.dart';
import 'package:myproject/view/widgets/bubbles.dart';
import 'package:myproject/view/widgets/lotties.dart';
import 'package:provider/provider.dart';
import '../control/providers/providerone.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late FlutterTts flutterTts;
  late final AnimationController _delivery;
  late final AnimationController _calling;
  late final AnimationController _tiger;
  bool contoller = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _delivery = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _calling = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _tiger = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }


  bool isPlaying = false;


  Future<void> playAll() async {

    isPlaying = true;
    // Wait for each TTS message to complete before playing the next one
    await speak('textcalling'.tr().toString(), 1.5, context);
    if (!isPlaying) return;
    await Future.delayed(Duration(seconds: 3));
    if (!isPlaying) return;
    await speak('textdelivery'.tr().toString(), 1.5, context);
    if (!isPlaying) return;
    await Future.delayed(Duration(milliseconds: 2500));
    if (!isPlaying) return;
    await speak('texttiger'.tr().toString(), 1.5, context);
    isPlaying = false;
  }

  Future<void> speak(String text, double pitch, BuildContext context) async {
    String language = context.locale.languageCode;
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(pitch);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final providerone = Provider.of<ProviderOne>(context);

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Icon(Icons.menu),
        title: Text( "heading".tr()),
        actions: [IconButton(onPressed: () async {
          if (providerone.isPlaying) {
            providerone.setIsPlaying(false);
            isPlaying = false;

            await flutterTts.stop();
          } else {
            providerone.setIsPlaying(true);
            await playAll();
            providerone.setIsPlaying(false);
          }
        },
          icon: Icon(providerone.isPlaying ? Icons.pause : Icons.play_arrow),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end
                ,
                children: [
                  DropDown(),
                ],
              ),
              //--------------------------------------------
              Bubbles(
                onTap: () {
                  speak('textcalling'.tr().toString(), 1.5, context);
                },
                text: 'textcalling',
                bottomleft: 30,
                bottomright: 0,
                // height: 100,
                width: width*.45,
              ),
              LottiAnime(
                controller: _calling,
                onTapController: () {
                  if (contoller == false) {
                    _calling.forward();
                    contoller = true;
                  } else {
                    contoller = false;
                    _calling.reverse();
                  }
                },
                lottieImage: 'customersupport',
              ),

              //------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Bubbles(
                    onTap: () {
                      speak('textdelivery'.tr().toString(), 1.5, context);
                    },
                    text: 'textdelivery',
                    bottomleft: 0,
                    bottomright: 30,
                    // height: 70,
                    width: width*0.4,
                  ),
                ],
              ),
              LottiAnime(
                controller: _delivery,
                onTapController: () {
                  if (contoller == false) {
                    _delivery.forward();
                    contoller = true;
                  } else {
                    contoller = false;
                    _delivery.reverse();
                  }
                },
                lottieImage: 'delivery',
              ),
              //--------------------------------------------------
              Bubbles(
                onTap: () {
                  speak('texttiger'.tr().toString(), 1.5, context);
                },
                text: 'texttiger',
                bottomleft: 30,
                bottomright: 0,
                // height: 60,
                width: width*0.3,
              ),
              LottiAnime(
                controller: _tiger,
                onTapController: () {
                  if (contoller == false) {
                    _tiger.forward();
                    contoller = true;
                  } else {
                    contoller = false;
                    _tiger.reverse();
                  }
                },
                lottieImage: 'tiger',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
