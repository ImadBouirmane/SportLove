import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_stories_record.g.dart';

abstract class UserStoriesRecord
    implements Built<UserStoriesRecord, UserStoriesRecordBuilder> {
  static Serializer<UserStoriesRecord> get serializer =>
      _$userStoriesRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  String get storyPhoto;

  @nullable
  String get storyVideo;

  @nullable
  String get storyDescription;

  @nullable
  DateTime get storyCreated;

  @nullable
  bool get storyOwner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserStoriesRecordBuilder builder) => builder
    ..storyPhoto = ''
    ..storyVideo = ''
    ..storyDescription = ''
    ..storyOwner = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userStories');

  static Stream<UserStoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserStoriesRecord._();
  factory UserStoriesRecord([void Function(UserStoriesRecordBuilder) updates]) =
      _$UserStoriesRecord;

  static UserStoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserStoriesRecordData({
  DocumentReference user,
  String storyPhoto,
  String storyVideo,
  String storyDescription,
  DateTime storyCreated,
  bool storyOwner,
}) =>
    serializers.toFirestore(
        UserStoriesRecord.serializer,
        UserStoriesRecord((u) => u
          ..user = user
          ..storyPhoto = storyPhoto
          ..storyVideo = storyVideo
          ..storyDescription = storyDescription
          ..storyCreated = storyCreated
          ..storyOwner = storyOwner));
