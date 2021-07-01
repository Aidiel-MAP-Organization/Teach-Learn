
class Subject {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _title;
  String _description;
  int _price;
  int _counter;
  List <dynamic> _videoUrl;
  List <dynamic> _pdfUrl;
  List <dynamic> _imageUrl;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get title => _title;
  set title(value) => _title = value;

  get description => _description;
  set description(value) => _description = value;

  get price => _price;
  set price(value) => _price = value;

  get counter => _counter;
  set counter(value) => _counter = value;
  
  get video => _videoUrl;
  void setvideo(String value) {
      _videoUrl.add(value);
  }

  get pdf => _pdfUrl;
  void setpdf(String value) {
      _pdfUrl.add(value);
  }

  get image => _imageUrl;
  void setimage(String value) {
      _imageUrl.add(value);
  }


  Subject(
      {dynamic id,
      String title = '',
      String description = '',
      int price = 0,
      int counter = 0,
      List videoUrl,
      List imageUrl,
      List pdfUrl})
      : _id = id,
        _title = title,
        _description = description,
        _counter = counter,
        _price = price,
        _videoUrl = videoUrl,
        _imageUrl = imageUrl,
        _pdfUrl = pdfUrl;

  Subject.copy(Subject from)
      : this(
            id: from.id,
            title: from.title,
            description: from.description,
            price: from.price,
            counter: from.counter,
            videoUrl: from.video,
            imageUrl: from.image,
            pdfUrl: from.pdf);

  Subject.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          price: json['price'],
          counter: json['counter'],
          videoUrl: json['videoUrl'],
          imageUrl: json['imageUrl'],
          pdfUrl: json['pdfUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'counter': counter,
        'videoUrl': video,
        'imageUrl': image,
        'pdfUrl': pdf,
  };
}
