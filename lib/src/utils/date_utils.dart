class DateUtils {
  static bool isTodayString(String date){
    DateTime d;
    try { d = DateTime.parse(date); }
    catch(e) { return false; }    
    final today = DateTime.now();
    return today.difference(d).inDays < 1;
  }
  static bool isToday(DateTime date){
    final today = DateTime.now();
    return today.difference(date).inDays < 1;
  }

  static bool isSameDay(DateTime date1, DateTime date2){
    final d1 = DateTime.utc(date1.year,date1.month,date1.day);
    final d2 = DateTime.utc(date2.year,date2.month,date2.day);     //you can add today's date here
    if(d2.compareTo(d1)==0){
      return true;
    }else{
      return false;
    }
  }

  /// Parse di una data e return di una stringa
  /// [withTime] torna una stringa dd / MM / yyyy hh:mm
  static String dateToString(DateTime date, { bool? withTime }) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final yesterday2 = DateTime(now.year, now.month, now.day - 2);
    if (date == today) {
      return 'Oggi';
    }
    else if (date == yesterday) {
      return 'Ieri';
    }
    else if (date == yesterday2) {
      return 'L\'altro ieri';
    }
    else {
      return '${date.day}/${date.month}/${date.year}' + ((withTime != null && withTime) ? ' ${date.hour} : ${date.second}' : '');
    }
  }

  /// give the elapsed time (seconds / minutes / hours / days)
  /// @param {number} current - the current time
  /// @param {number} previous - the time that you wanna compare
  /// @return {string} the right string message
  static String elapsedTime(int time) {
    final current = DateTime.now().millisecondsSinceEpoch;
    const msPerMinute = 60 * 1000,
          msPerHour = msPerMinute * 60,
          msPerDay = msPerHour * 24;
    final elapsed = current - time;

    if (elapsed < msPerMinute) {
      if ((elapsed / 1000).round() <= 30) { return 'adesso'; }
      else { return '${(elapsed / 1000).round()} secondi fa'; }
    }
    else if (elapsed < msPerHour) {
      if ((elapsed / msPerMinute).round() == 1) { return '${(elapsed / msPerMinute).round()} minuto fa'; }
      else { return '${(elapsed / msPerMinute).round()} minuti fa'; }
    }
    else if (elapsed < msPerDay) {
      if ((elapsed / msPerHour).round() == 1) { return '${(elapsed / msPerHour).round()} ora fa'; }
      else { return '${(elapsed / msPerHour).round()} ore fa'; }
    }
    if ((elapsed / msPerDay).round() == 1) { return '${(elapsed / msPerDay).round()} giorno fa'; }
    return '${(elapsed / msPerDay).round()} giorni fa';
  }

  static DateTime? parseDate(dynamic date) {
    // parse data in forma di stringa o in forma di firestore
    if (date == null) return null;
    DateTime ret;
    if (date is String) {
      try {
        ret = DateTime.parse(date);
        return ret;
      }
      catch(e){

      }
    }
    else if (date is Map) {
      if (date['seconds'] != null) {
        return DateTime.fromMicrosecondsSinceEpoch(date['seconds']);
      }
    }
    else if (date.microsecondsSinceEpoch != null) {
      return DateTime.fromMicrosecondsSinceEpoch(date.microsecondsSinceEpoch);
    }
    return null;
    
  }
}
