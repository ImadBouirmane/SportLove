import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'story_comment_record.g.dart';

abstract class StoryCommentRecord
    implements Built<StoryCommentRecord, StoryCommentRecordBuilder> {
  static Serializer<StoryCommentRecord> get serializer =>
      _$storyCommentRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  DocumentReference get storyUser;

  @nullable
  String get comment;

  @nullable
  DateTime get timeCreated;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StoryCommentRecordBuilder builder) =>
      builder..comment = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storyComment');

  static Stream<StoryCommentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StoryCommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  StoryCommentRecord._();
  factory StoryCommentRecord(
          [void Function(StoryCommentRecordBuilder) updates]) =
      _$StoryCommentRecord;

  static StoryCommentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStoryCommentRecordData({
  DocumentReference user,
  DocumentReference storyUser,
  String comment,
  DateTime timeCreated,
}) =>
    serializers.toFirestore(
        StoryCommentRecord.serializer,
        StoryCommentRecord((s) => s
          ..user = user
          ..storyUser = storyUser
          ..comment = comment
          ..timeCreated = timeCreated));
