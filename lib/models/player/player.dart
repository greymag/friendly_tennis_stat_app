import 'package:innim_lib/database.dart';
import 'package:innim_lib/innim_dart_lib.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'player.g.dart';

@JsonSerializable()
class Player extends Mappable {
  final String uid;
  final String firstName;
  final String lastName;
  @JsonKey(fromJson: boolFromJsonAny)
  final bool isRemoved;

  Player(
      {@required this.uid,
      @required this.firstName,
      @required this.lastName,
      @required this.isRemoved})
      : assert(uid != null),
        assert(firstName != null),
        assert(lastName != null),
        assert(isRemoved != null);

  factory Player.fromJson(Map<String, Object> map) => _$PlayerFromJson(map);

  @override
  Map<String, Object> toJson() => _$PlayerToJson(this);
}
