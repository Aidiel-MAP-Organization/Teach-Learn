
class Subject {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _title;
  String _description;
  int _price;
  int _counter;

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


  Subject(
      {dynamic id,
      String title = '',
      String description = '',
      int price = 0,
      int counter = 0})
      : _id = id,
        _title = title,
        _description = description,
        _counter = counter,
        _price = price;

  Subject.copy(Subject from)
      : this(
            id: from.id,
            title: from.title,
            description: from.description,
            price: from.price,
            counter: from.counter);

  Subject.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          price: json['price'],
          counter: json['counter'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'counter': counter,
      };
}
