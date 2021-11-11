import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  bool get notifications;

  @nullable
  String get gender;

  @nullable
  String get birthDate;

  @nullable
  String get address;

  @nullable
  String get sportType1;

  @nullable
  String get sportType2;

  @nullable
  String get sportType3;

  @nullable
  String get sportLevel1;

  @nullable
  String get sportLevel2;

  @nullable
  String get sportLevel3;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..password = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..notifications = false
    ..gender = ''
    ..birthDate = ''
    ..address = ''
    ..sportType1 = ''
    ..sportType2 = ''
    ..sportType3 = ''
    ..sportLevel1 = ''
    ..sportLevel2 = ''
    ..sportLevel3 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String password,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  bool notifications,
  String gender,
  String birthDate,
  String address,
  String sportType1,
  String sportType2,
  String sportType3,
  String sportLevel1,
  String sportLevel2,
  String sportLevel3,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..password = password
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..notifications = notifications
          ..gender = gender
          ..birthDate = birthDate
          ..address = address
          ..sportType1 = sportType1
          ..sportType2 = sportType2
          ..sportType3 = sportType3
          ..sportLevel1 = sportLevel1
          ..sportLevel2 = sportLevel2
          ..sportLevel3 = sportLevel3));
