import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

//告诉生成器，这个类需要生成model类
@JsonSerializable()
class Entity{
  @JsonKey(name: 'data')
  List<Data> data;
  @JsonKey(name: 'errorCode')
  int errorCode;
  @JsonKey(name: 'errorMsg')
  String errorMsg;

  Entity(this.data,this.errorCode,this.errorMsg);

  factory Entity.fromJson(Map<String,dynamic> json)=>_$EntityFromJson(json);

  Map<String,dynamic> toJson()=>_$EntityToJson(this);

}
@JsonSerializable()
class Data {
  Data(this.children, this.courseId, this.id, this.name, this.order,
      this.parentChapterId, this.userControlSetTop, this.visible);

  List<Data> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  factory Data.fromJson(Map<String,dynamic> json)=>_$DataFromJson(json);

  Map<String,dynamic> toJson()=>_$DataToJson(this);
}