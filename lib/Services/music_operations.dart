import 'package:spotify_app/Modals/Music.dart';

class Music_Opertaions{
  Music_Opertaions._(){

  }

  static List<Music> getMusic(){

    return <Music>[
      Music('Kasoor', 'https://lyricalsansar.com/wp-content/uploads/2021/07/Kasoor-Lyrics.jpg',
          'Kasoor - Prateek Kuhad (Acoustic)', 'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/35/ae/84/35ae84dc-e14a-f303-618f-3d165ef521a0/mzaf_4310609277700045518.plus.aac.p.m4a'),
      Music('Bekhayali ', 'https://1.bp.blogspot.com/-LnDauafM0Rw/XunR3q3WVsI/AAAAAAAABz0/c5a-6C1VjYAJaCXRxm2QwB-ubuU11lQkgCK4BGAsYHg/w640-h384/bekhayali-lyrics-hindi-kabir-singh.jpg',
          'Kabir Singh ','https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/2b/90/b1/2b90b1b4-60d0-db01-8886-99f6e179bc5d/mzaf_11359144741862327291.plus.aac.p.m4a'),
      Music('Ae Dil AHi Mushkil', 'https://i.scdn.co/image/ab67616d0000b273c8e96da2669b5d51ee36205a',
          'Ae Dil Hai Mushkil COver ','https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/b5/22/29/b52229d1-a2b8-d186-2405-d7e01cc095b8/mzaf_1873452132409323918.plus.aac.p.m4a'),
      Music('Toofan', 'https://i.scdn.co/image/ab67616d0000b27327cc930418d75cd3efe40378',
          'Toofan KGF','https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/b5/22/29/b52229d1-a2b8-d186-2405-d7e01cc095b8/mzaf_1873452132409323918.plus.aac.p.m4a')

    ];
  }
}