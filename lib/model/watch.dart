const String tableWatchTrailer = 'watchtrailer';

class WatchTrailerFields {
  static const String id = '_id';
  static const String image = 'image';
  static const String title = 'title';
  static const String desc = 'desc';
  static const String number = 'number';
  static const String url = 'url';

  static final List<String> values = [id, image, title, desc, number, url];
}

class WatchTrailerModel {
  late int? id;
  late String image;
  late String title;
  late String desc;
  late String number;
  late String url;

  WatchTrailerModel(
      {this.id,
      required this.image,
      required this.title,
      required this.desc,
      required this.number,
      required this.url});

  WatchTrailerModel copy(
          {int? id,
          String? image,
          String? title,
          String? desc,
          String? number,
          String? url}) =>
      WatchTrailerModel(
          id: this.id,
          image: this.image,
          title: this.title,
          desc: this.desc,
          number: this.number,
          url: this.url);

  static WatchTrailerModel fromJson(Map<String, Object?> json) =>
      WatchTrailerModel(
        id: json[WatchTrailerFields.id] as int?,
        image: json[WatchTrailerFields.image] as String,
        title: json[WatchTrailerFields.title] as String,
        desc: json[WatchTrailerFields.desc] as String,
        number: json[WatchTrailerFields.number] as String,
        url: json[WatchTrailerFields.url] as String,
      );

  Map<String, Object?> toJson() => {
        WatchTrailerFields.id: id,
        WatchTrailerFields.image: image,
        WatchTrailerFields.title: title,
        WatchTrailerFields.desc: desc,
        WatchTrailerFields.number: number,
        WatchTrailerFields.url: url
      };
}

List<WatchTrailerModel> listDefaultTrailer = [
  WatchTrailerModel(
      image: 'https://media.giphy.com/media/eV08lydIMcTftXX3vi/giphy.gif',
      title: '''DUELIST // VALORANT Cinematic Official Launch Trailer''',
      desc: '''The fight has just begun.
VALORANT, Riot Games' 5v5 character-based tactical shooter game is available for free
''',
      number: "1",
      url: 'https://www.youtube.com/watch?v=e_E9W2vsRbQ&ab_channel=VALORANT'),
  WatchTrailerModel(
      image: 'https://c.tenor.com/UBem9pU9YgsAAAAC/yoru-valorant.gif',
      title: '''RETAKE // Episode 2 Cinematic - VALORANT''',
      desc: '''The fight has just begun.
The game has changed. Now’s your chance to play VALORANT: https://riot.com/3idlntG
''',
      number: "2",
      url:
          'https://www.youtube.com/watch?v=hhlgphVf-1g&list=PLtZR0uMja2BBHVQDLSnnLq0osabqtIG8o&index=5'),
  WatchTrailerModel(
      image: 'https://c.tenor.com/KOmBoX-o_WQAAAAC/viper-viper-valorant.gif',
      title: '''DUALITY // Official Lore Cinematic - VALORANT''',
      desc:
          '''The fight has just begun. VALORANT, Riot Games' 5v5 character-based tactical shooter game is available for free''',
      number: "3",
      url:
          'https://www.youtube.com/watch?v=-M_r8MKQ3mo&list=PLtZR0uMja2BBHVQDLSnnLq0osabqtIG8o&index=10'),
  WatchTrailerModel(
      image: 'https://c.tenor.com/OzI6Sz-CTfsAAAAd/valorant-valorant-meme.gif',
      title: '''Spark - Neon Agent Trailer // VALORANT''',
      desc:
          '''Our newest Manila-born Agent is sprinting onto the scene with Episode 4: Disruption. Lace up and ''',
      number: "4",
      url:
          'https://www.youtube.com/watch?v=dtx8CgjRmqE&t=23s&ab_channel=VALORANT'),
  WatchTrailerModel(
      image: 'https://media.giphy.com/media/e6wlM2pxP7A71bPrvO/giphy.gif',
      title: '''VALORANT | Raze - Only good things!''',
      desc:
          '''For the music 'Banho de Folhas', by Luedji Luna and VALORANT, hit play and enjoy an amazing tour of the heart of Bahia with Raze.''',
      number: "5",
      url:
          'https://www.youtube.com/watch?v=ZGvz7jTVbc8&t=120s&ab_channel=VALORANT'),
  WatchTrailerModel(
      image:
          'https://www.esports.net/wp-content/uploads/2022/04/Fade-Valorant.jpg',
      title: '''İYİ GECELER - Fade Agent Trailer // VALORANT''',
      desc:
          '''Good night, VALORANT Protocol. Fade, VALORANT’s new Turkish Initiator Agent, steps out of the shadows to stalk her prey with ''',
      number: "6",
      url: 'https://www.youtube.com/watch?v=e7VOQ1l20eo&ab_channel=VALORANT')
];
