import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/resources/app_images.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.movie_peaky,
      title: 'Turning Red',
      time: 'March 10, 2022',
      description: 'Thirteen-year-old Mei is experiencing the'
          ' awkwardness of being a teenager with a twist – when she'
          ' gets too excited, she transforms into a giant red panda.',
    ),
    Movie(
      id: 2,
      imageName: AppImages.movie_peaky,
      title: 'Spider-Man: No Way Home',
      time: 'December 15, 2021',
      description:
          'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.',
    ),
    Movie(
      id: 2,
      imageName: AppImages.movie_peaky,
      title: 'The Adam Project',
      time: 'March 11, 2022',
      description:
          'After accidentally crash-landing in 2022, time-traveling fighter pilot Adam Reed teams up with his 12-year-old self on a mission to save the future.',
    ),
    Movie(
      id: 3,
      imageName: AppImages.movie_peaky,
      title: 'Blacklight',
      time: 'February 10, 2022',
      description:
          'Travis Block is a shadowy Government agent who specializes in removing operatives whose covers have been exposed. He then has to uncover a deadly conspiracy within his own ranks that reaches the highest echelons of power.',
    ),
    Movie(
      id: 4,
      imageName: AppImages.movie_peaky,
      title: 'Peaky Blinders',
      time: 'September 12, 2013',
      description:
          'A gangster family epic set in 1919 Birmingham, England and centered on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby, who means to move up in the world.',
    ),
    Movie(
      id: 5,
      imageName: AppImages.movie_peaky,
      title: 'The Batman',
      time: 'March 1, 2022',
      description:
          'In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.',
    ),
    Movie(
      id: 6,
      imageName: AppImages.movie_peaky,
      title: 'Encanto',
      time: 'November 24, 2021',
      description:
          'The tale of an extraordinary family, the Madrigals, who live hidden in the mountains of Colombia, in a magical house, in a vibrant town, in a wondrous, charmed place called an Encanto. The magic of the Encanto has blessed every child in the family with a unique gift from super strength to the power to heal—every child except one, Mirabel. ',
    ),
    Movie(
      id: 7,
      imageName: AppImages.movie_peaky,
      title: 'No Exit',
      time: 'February 25, 2022',
      description:
          'Stranded at a rest stop in the mountains during a blizzard, a recovering addict discovers a kidnapped child hidden in a car belonging to one of the people inside the building which sets her on a terrifying struggle to identify who among them is the kidnapper.',
    ),
    Movie(
      id: 8,
      imageName: AppImages.movie_peaky,
      title: 'Gold',
      time: 'January 13, 2022',
      description:
          'In the not-too-distant future, two drifters traveling through the desert stumble across the biggest gold nugget ever found and the dream of immense wealth and greed takes hold. They hatch a plan to excavate their bounty, with one man leaving',
    ),
    Movie(
      id: 9,
      imageName: AppImages.movie_peaky,
      title: 'Pil\'s Adventures',
      time: 'August 11, 2021',
      description:
          'Pil, a little vagabond girl, lives on the streets of the medieval city of Roc-en-Brume, along with her three tame weasels. She survives of food stolen from the castle of the sinister Regent Tristain. One day, to escape his guards, Pil disguises herself as a princess. ',
    ),
    Movie(
      id: 10,
      imageName: AppImages.movie_peaky,
      title: 'Red Notice',
      time: 'November 4, 2021',
      description:
          'An Interpol-issued Red Notice is a global alert to hunt and capture the world\'s most wanted. But when a daring heist brings together the FBI\'s top profiler and two rival criminals, there\'s no telling what will happen.',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
    print(_filteredMovies.length);
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movie_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            var movie = _movies[index];
            if (_filteredMovies.isNotEmpty) movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: Offset(0, 5))
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.time,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        _onMovieTap(index);
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(240),
              border: OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }
}
