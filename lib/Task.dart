class Task {
  String _title;
  String _description;
  DateTime _expireDate;
  bool _state;

  Task(this._title, this._description, this._expireDate, this._state);

  String get title => _title;

  bool get state => _state;

  void setState(bool current) {
    _state = current;
  }

  DateTime get expireDate => _expireDate;

  String get description => _description;

  set setTitle(String title) {
    _title = title;
  }

  set setDescription(String description) {
    _description = description;
  }

  set setExpireDate(DateTime expireDate) {
    _expireDate = expireDate;
  }
}
