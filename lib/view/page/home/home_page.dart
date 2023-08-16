import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:wakelock/wakelock.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool pause = false;
  final _meeduPlayerController = MeeduPlayerController(
    autoHideControls: true,
    controlsEnabled: false,
    enabledButtons: const EnabledButtons(
      fullscreen: false,
      rewindAndfastForward: false,
      playBackSpeed: false,
      pip: false,
      lockControls: false,
      muteAndSound: false,
      videoFit: false,
      playPauseAndRepeat: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    Wakelock.enable();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  @override
  void dispose() {
    Wakelock.disable();
    _meeduPlayerController.dispose();
    super.dispose();
  }

  _init() {
    _meeduPlayerController.setDataSource(
      DataSource(
        type: DataSourceType.asset,
        source: "assets/video/video.mp4",
      ),
      autoplay: true,
      looping: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double withDevice = size.width;
    double heightDevice = size.height;
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 9 / 16,
            child: Container(
              // width: withDevice,
              // height: heightDevice,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Text(
                  "Image: $index",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
          // return AspectRatio(
          //   aspectRatio: 5 / 16,
          //   child: InkWell(
          //     onTap: () {
          //       //         setState(() {
          //       //           if (_meeduPlayerController != null && _meeduPlayerController.play()) {
          //       //   _controller.pause();
          //       // }
          //       //         });
          //     },
          //     child: MeeduVideoPlayer(
          //       controller: _meeduPlayerController,
          //     ),
          //   ),
          // );
        });
  }
}
