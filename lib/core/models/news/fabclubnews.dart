class FavouriteClubNews {
  String _title;
  String _date;


  FavouriteClubNews(this._title, this._date);

  set title(String title) {
    _title = title;
  }

  String get title => _title;

  set date(String date) {
    _date = date;
  }

  String get date => _date;
}
