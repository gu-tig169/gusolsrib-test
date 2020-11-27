import 'Todo.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Todo.dart';
import './SecondView.dart';
import 'package:provider/provider.dart';
import './Mystate.dart';


class Mystate extends ChangeNotifier{ 
  String _filterlistby ='all';
  List<Todo> todolist = List();
  List<Todo> donelist = List();
  List <Todo> remaining = List();

  List<dynamic> get list {

    if (filterlistby == 'Done') {
      return donelist;
    }
    if (filterlistby == 'remaining') {
      return remaining;
    }
    else {return todolist;}

  } 
  String get filterlistby => _filterlistby;

  void setfilterlistBy(String filterlistby){
    this._filterlistby = filterlistby;
    
    if (filterlistby == 'Done'){
    donelist = filterlist(filterlistby).toList();
    }
    if (filterlistby == 'remaining'){
    remaining = filterlist(filterlistby).toList();
    }
   
    notifyListeners();
  }
    
   Iterable<Todo> filterlist(filterlistby){
    
    
    if (filterlistby == 'remaining') {return todolist.where((item) => item.value == false);}
    if (filterlistby == 'Done') {return todolist.where((item) => item.value== true);}
    else {return todolist;}
    
  }

  void addItem(String item){
    Todo todo = Todo(text: item,value:false );
    todolist.add(todo);

    notifyListeners();
  }
  void addItemdone(String item,int index){
  
    notifyListeners();
  }

  void removeItem(index){
   todolist.removeAt(index);
   
     notifyListeners();
  }


  void updateItem(int index, String newContent){
   // _list[index] = newContent;
    notifyListeners();

  }

  getCheckBox(index){
    return list[index].value;
  }
  
  void setCheckBox( index,newValue){
    list[index].value = newValue;
       
    notifyListeners();
    
  }
  

}