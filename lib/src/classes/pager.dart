import 'dart:math';

class Pager {

  int _page;
  int _limit;

  Pager([int? limit]) :
    _page = 0,
    _limit = limit ?? 20;

  Pager.from(int page, [int? limit]) :
    _page = page,
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

  dynamic cursor;
  int _limit;

  PagerCursor([int? limit]):
    _limit = limit ?? 20;

  void reset() {
    cursor = null;
  }

  int get limit => _limit;

}
