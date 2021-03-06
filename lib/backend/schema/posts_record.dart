import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  String get photo;

  @nullable
  String get description;

  @nullable
  DateTime get timeCreated;

  @nullable
  String get titre;

  @nullable
  String get typeSport;

  @nullable
  bool get visibility;

  @nullable
  bool get postOwner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..photo = ''
    ..description = ''
    ..titre = ''
    ..typeSport = ''
    ..visibility = false
    ..postOwner = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPostsRecordData({
  DocumentReference user,
  String photo,
  String description,
  DateTime timeCreated,
  String titre,
  String typeSport,
  bool visibility,
  bool postOwner,
}) =>
    serializers.toFirestore(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..user = user
          ..photo = photo
          ..description = description
          ..timeCreated = timeCreated
          ..titre = titre
          ..typeSport = typeSport
          ..visibility = visibility
          ..postOwner = postOwner));
