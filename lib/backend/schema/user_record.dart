import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  @nullable
  String get displayName;

  @nullable
  String get gender;

  @nullable
  String get birthDate;

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
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'photo_Profile')
  String get photoProfile;

  @nullable
  String get nbrPhone;

  @nullable
  String get address;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..displayName = ''
    ..gender = ''
    ..birthDate = ''
    ..sportType1 = ''
    ..sportType2 = ''
    ..sportType3 = ''
    ..sportLevel1 = ''
    ..sportLevel2 = ''
    ..sportLevel3 = ''
    ..photoProfile = ''
    ..nbrPhone = ''
    ..address = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserRecordData({
  String displayName,
  String gender,
  String birthDate,
  String sportType1,
  String sportType2,
  String sportType3,
  String sportLevel1,
  String sportLevel2,
  String sportLevel3,
  DocumentReference user,
  String photoProfile,
  String nbrPhone,
  String address,
}) =>
    serializers.toFirestore(
        UserRecord.serializer,
        UserRecord((u) => u
          ..displayName = displayName
          ..gender = gender
          ..birthDate = birthDate
          ..sportType1 = sportType1
          ..sportType2 = sportType2
          ..sportType3 = sportType3
          ..sportLevel1 = sportLevel1
          ..sportLevel2 = sportLevel2
          ..sportLevel3 = sportLevel3
          ..user = user
          ..photoProfile = photoProfile
          ..nbrPhone = nbrPhone
          ..address = address));
