class MainRepo {
  List<Movie> getUrls() {
    List<Movie> images = new List<Movie>()
      ..add(Movie(
          "https://ep01.epimg.net/cultura/imagenes/2019/07/22/actualidad/1563791717_146941_1563803892_noticia_normal.jpg",
          "Avengers"))
      ..add(Movie(
          "https://statics-uestudio.uecdn.es/buhomag/2019/06/aladdin-accion-real-disney.jpg",
          "Aladin"))
      ..add(Movie(
          "https://cronicaglobal.elespanol.com/uploads/s1/78/69/57/8/mejores-peliculas-hollywood.jpeg",
          "Erase una vez"));

    return images;
  }
}

class Movie {
  String image;
  String title;

  Movie(this.image, this.title);
}
