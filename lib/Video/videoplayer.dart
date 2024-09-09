import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({Key? key}) : super(key: key);

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;


  final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
      CustomVideoPlayerWebSettings(
    src: longVideo.toString(),
  );

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.networkUrl(
      longVideo,
    )..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
    );
    _customVideoPlayerWebController = CustomVideoPlayerWebController(
      webVideoPlayerSettings: _customVideoPlayerWebSettings,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Basketball Basic Beginner"),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            kIsWeb
                ? Expanded(
                    child: CustomVideoPlayerWeb(
                      customVideoPlayerWebController:
                          _customVideoPlayerWebController,
                    ),
                  )
                : CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController,
                  ),
            CupertinoButton(
              child: const Text("Play Fullscreen"),
              onPressed: () {
                if (kIsWeb) {
                  _customVideoPlayerWebController.setFullscreen(true);
                  _customVideoPlayerWebController.play();
                } else {
                  _customVideoPlayerController.setFullscreen(true);
                  _customVideoPlayerController.videoPlayerController.play();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Uri longVideo =
    Uri.parse("https://ff9078b26f919097930f11e95a0e58bfde6def8488e34674b604fab-apidata.googleusercontent.com/download/storage/v1/b/tenaga_tutorial_video/o/DSCF0743.MP4?jk=AfSM9cBMc4IgyQI4QUX5V5ZbYKCRHNz6MfzcRgZk-vwOeCNB15KK5xVo85rkbKaDd3zHIOum1sgeEnGOWF90B1O8ruwzvYcqbOOiYRm_Ij730_q_0mY8WhN8JzOQzqcaro9zPAdhs4oDdjX8Wp_2jtMOqriW3w52zmE7bs1U_tM_3gaHaVj8pb_0WFVIVOset6LD99NrKd_s2zJimmyu9lifVrgrrsUPAOKuLWChkzbnSZ-UHrCQCUKyN0GxRRl_dL2bijoFSokLKlAihXibLBnLmbeuGZvTdyZQzqwrnCQ-u3UFywRnYtuBqKLi3AHpH3u5fvRVHACAkhkqo2Tc9sInJ6xEvTmeG5-HQj1wefaUaWO5h0tZVF8x-N1ga00R415AbU4Y0jVQBSFwsVE5924JKw5MR1mbZKJDt7cTpgEeXlPIrF2RC86O3zN8CgsNm2Zn89_wC2XJ2do4YQmptYxt9HpycXHrCYs6cI0fZXpDJf2cxCeKxRVvkDg9A75_UQnvd8LOs_1seZKZw1bCkcSle-fpbLxiElZIbo2HGrNcbyvYCx3snwM1M8MrLDDUGxd1KIpHlktGXhlvo5HRLb8WC9-yvxuaO83DfF4sKDvWZBhn7sAH5VI-6LtqPbuquEfHovtlw6vyz6EBZs3qP5Uy755CsSE3DgCby_LdPcHgvYN5VIIiz_t5sO2wCGz8Lc9zX7wv89xPhdPCM_vIo_MfTwCctQavIlb3_QfIouJN_tG3uX1zvC3hD8ZvU1nobku2Qvrq-kIyUZmkg5_gaCXxPejOnPaQkf7uEbKoK1eltvimsYm00IhbR8mFvH57kOXHmzZM-kIn_lvogE3AUczNhgQIaP2dNNdI2mkKOcF4W_s9M1i-gnctNaXFjBzMnxxh3w3mv6r2UgTmEtSJmtfeLtC3vP16cTJjjT4G43zAdeWB30iV0pNUYwl2PDr07EWvIxwqsZ_KNnqzFFC98_LBZljIgh1acpCRBKsmjRss7ex7gFxGrQXdzUmnBsn5nji036dEmStS3xY1uAqObpQlNQPjr4vONxoyytDofpofropczt39IlYjtZ7MiKiDlAf_lZIJtx8V3ZNT2Qi1T0F0PSvsPNf99VPjVeKctkRVB61n7CaWF_KG-UaxK-bkV057KyeNCCTCl_vMQkz09yQsl7z7J6-uTVUIi-IQ-Hzuk4bFgTH8JpIxx8edvdlY34l7h6E0&isca=1");
