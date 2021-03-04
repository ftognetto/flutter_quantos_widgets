import 'dart:math';

class Pager {

  int _page;
  int _limit;

  Pager(int limit) :
    _page = 0,
    _limit = limit ?? 20;

  int get current => _page;
  
  int getNext() {
    _page++;
    return _page;
  }

  void reset() {
    _page = 0;
  }

  void back() {
    _page = max(_page - 1, 0);
  }

  int get limit => _limit;

}

class PagerCursor {

  String? _cursor;
  int _limit;

  PagerCursor(int limit):
    _limit = limit ?? 20;
  
  String? get cursor => _cursor;
  set cursor(String? cursor) => _cursor = cursor;

  void reset() {
    _cursor = null;
  }

  int get limit => _limit;

}