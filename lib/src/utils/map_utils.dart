class MapUtils {

  static Map<int,T> mergeList<T extends dynamic>(Map<int,T> map, List<T> elements){
    final newMap = Map.from(map);
    newMap.addAll({ for (var e in elements) e.id : e });
    return newMap;
  }

  static Map<int,T> mergeElement<T extends dynamic>(Map<int,T> map, T element){
    final newMap = Map.from(map);
    newMap.update(element.id, (e) => element, ifAbsent: () => element);
    return newMap;
  }

  static Map<int,T> deleteElement<T extends dynamic>(Map<int,T> map, int id){
    final newMap = Map.from(map);
    newMap.remove(id);
    return newMap;
  }

  static Map<int,T> deleteElementFromValue<T extends dynamic>(Map<int,T> map, T element){
    final newMap = Map.from(map);
    newMap.removeWhere((key,value) => value == element);
    return newMap;
  }

}