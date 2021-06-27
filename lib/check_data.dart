class CheckData {
  bool isDataEmpty(List<dynamic> list) {
    var isEmpty = true;
    for(var i in list){
      if (i.toString()==''){
        isEmpty=false;
        break;
      }
    }
    return isEmpty;
  }

  bool isPositiveNumber(List<dynamic>list)
  {
    return true;
  }
}
