import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movietest/app/config/environments.dart';
import 'package:movietest/presentation/controllers/movies/movies_controller.dart';

class MoviesPage extends StatelessWidget {
  var controller = Get.find<MoviesController>();

  MoviesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.genreName),
      ),
      body: GetBuilder<MoviesController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: controller.movies.value.results?.length ?? 0,
            controller: controller.scrollController,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final movie = controller.movies.value.results?[index];
              return GestureDetector(
                onTap: () {
                  controller.selectMovie(movie!);
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                CurrentEnvironment.environment.imagePrefix +
                                    movie!.posterPath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: movie.posterPath == null
                            ? const Icon(
                                Icons.movie,
                                size: 48,
                              )
                            : null),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.title ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 15.0,
                                color: Colors.black,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      ),
    );
  }
}
