class Task{
  String _task;
  String _time;
  int _id;

  Task(this._task,this._time);

  Task.map(dynamic obj){
    this._id = obj['id'];
    this._task = obj['tasks'];
    this._time = obj['time'];
  }

  int get id => _id;
  String get time => _time;
  String get task => _task;

  Map<String, dynamic> toMap(){
    var map = new Map <String , dynamic> ();
    map['tasks'] = _task;
    map['time'] = _time;
    if(id != null){
      map['id'] = _id;
    }
    return map;
  }

  Task.fromMap(Map<String,dynamic> map){
    this._task = map['tasks'];
    this._time = map['time'];
    this._id = map['id'];
  }

}