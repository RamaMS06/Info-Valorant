class WatchTrailerModel {
  late String image;
  late String title;
  late String desc;
  late String index;
  late String url;

  WatchTrailerModel(
      {required this.image,
      required this.title,
      required this.desc,
      required this.index,
      required this.url});
}

List<WatchTrailerModel> listTrailer = [
  WatchTrailerModel(
      image: 'https://media.giphy.com/media/eV08lydIMcTftXX3vi/giphy.gif',
      title: '''DUELIST // VALORANT Cinematic Official Launch Trailer''',
      desc: ''' The fight has just begun.
VALORANT, Riot Games' 5v5 character-based tactical shooter game is available for free
''',
      index: "1",
      url:
          'https://www.youtube.com/watch?v=e_E9W2vsRbQ&list=PLtZR0uMja2BBHVQDLSnnLq0osabqtIG8o'),
  WatchTrailerModel(
      image: 'https://c.tenor.com/UBem9pU9YgsAAAAC/yoru-valorant.gif',
      title: '''DUELIST // VALORANT Cinematic Official Launch Trailer''',
      desc: ''' The fight has just begun.
VALORANT, Riot Games' 5v5 character-based tactical shooter game is available for free
''',
      index: "2",
      url:
          'https://www.youtube.com/watch?v=hhlgphVf-1g&list=PLtZR0uMja2BBHVQDLSnnLq0osabqtIG8o&index=5'),
  WatchTrailerModel(
      image: 'https://c.tenor.com/KOmBoX-o_WQAAAAC/viper-viper-valorant.gif',
      title: '''DUALITY // Official Lore Cinematic - VALORANT''',
      desc:
          '''The fight has just begun. VALORANT, Riot Games' 5v5 character-based tactical shooter game is available for free''',
      index: "3",
      url:
          'https://www.youtube.com/watch?v=-M_r8MKQ3mo&list=PLtZR0uMja2BBHVQDLSnnLq0osabqtIG8o&index=10'),
  WatchTrailerModel(
      image: 'https://c.tenor.com/OzI6Sz-CTfsAAAAd/valorant-valorant-meme.gif',
      title: '''Spark - Neon Agent Trailer // VALORANT''',
      desc:
          '''Our newest Manila-born Agent is sprinting onto the scene with Episode 4: Disruption. Lace up and ''',
      index: "4",
      url:
          'https://www.youtube.com/watch?v=-https://www.youtube.com/watch?v=dtx8CgjRmqE&list=PLtZR0uMja2BBHVQDLSnnLq0osabqtIG8o&index=17'),
  WatchTrailerModel(
      image: 'https://c.tenor.com/OzI6Sz-CTfsAAAAd/valorant-valorant-meme.gif',
      title: '''Spark - Neon Agent Trailer // VALORANT''',
      desc:
          '''Our newest Manila-born Agent is sprinting onto the scene with Episode 4: Disruption. Lace up and ''',
      index: "5",
      url:
          'https://www.youtube.com/watch?v=-https://www.youtube.com/watch?v=dtx8CgjRmqE&list=PLtZR0uMja2BBHVQDLSnnLq0osabqtIG8o&index=17')
];
