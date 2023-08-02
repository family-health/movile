enum HeaderDimension { tiny, big }

class HeaderOptions {
  final HeaderDimension? dimension;

  HeaderOptions({
    this.dimension = HeaderDimension.tiny,
  });
}

//read this link
// https://www.freecodecamp.org/news/constructors-in-dart/