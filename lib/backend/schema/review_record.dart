import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'review_record.g.dart';

abstract class ReviewRecord
    implements Built<ReviewRecord, ReviewRecordBuilder> {
  static Serializer<ReviewRecord> get serializer => _$reviewRecordSerializer;

  @nullable
  DocumentReference get userReview;

  @nullable
  String get comment;

  @nullable
  double get reviewRating;

  @nullable
  DateTime get timeCreated;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReviewRecordBuilder builder) => builder
    ..comment = ''
    ..reviewRating = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('review');

  static Stream<ReviewRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReviewRecord._();
  factory ReviewRecord([void Function(ReviewRecordBuilder) updates]) =
      _$ReviewRecord;

  static ReviewRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReviewRecordData({
  DocumentReference userReview,
  String comment,
  double reviewRating,
  DateTime timeCreated,
}) =>
    serializers.toFirestore(
        ReviewRecord.serializer,
        ReviewRecord((r) => r
          ..userReview = userReview
          ..comment = comment
          ..reviewRating = reviewRating
          ..timeCreated = timeCreated));
