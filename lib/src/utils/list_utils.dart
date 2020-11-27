


class ListUtils {


  static List<T> merge<T extends dynamic>(List<T> list, T entity, {List<String> compares = const ['id']}){

      var present = false;
      var index = -1;
      final entityJson = entity.toJson();

      for(var t in list){

        var check = true;
        index++;
        final json = t.toJson();

        for(var compare in compares){
          if(compare.contains('.')){
            if(json[compare.split('.')[0]][compare.split('.')[1]] != entityJson[compare.split('.')[0]][compare.split('.')[1]]){ 
              check = false; 
            } 
          }
          else{
            if(json[compare] != entityJson[compare]){ 
              check = false; 
            }
          }
        }
        if(check){ present = true; break; }
      }
      if(present){
        list[index] = entity;
      }
      else{
        list.add(entity);
      }

      return list;
  }

  static List<T> mergeLists<T extends dynamic>(List<T> list, List<T> list2, { List<String> compares = const ['id']}){

    for(var e in list2){
      list = merge(list, e, compares: compares);
    }
    return list;
  }

  static List<int> mergeIds(List<int> list, List<int> list2) {
    for(var id in list2){
      list = mergeId(list, id);
    }
    return list;
  }

  static List<int> mergeId(List<int> list, int id){
    if(!list.contains(id)) list.add(id);
    return list;
  }

}


abstract class Entity {
  String id;
  Map<String, dynamic> toJson();
}
