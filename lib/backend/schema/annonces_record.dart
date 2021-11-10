import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'annonces_record.g.dart';

abstract class AnnoncesRecord
    implements Built<AnnoncesRecord, AnnoncesRecordBuilder> {
  static Serializer<AnnoncesRecord> get serializer =>
      _$annoncesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Titre')
  String get titre;

  @nullable
  String get description;

  @nullable
  String get typeSport;

  @nullable
  @BuiltValueField(wireName: 'Lieu')
  LatLng get lieu;

  @nullable
  @BuiltValueField(wireName: 'Date')
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'Heure')
  DateTime get heure;

  @nullable
  @BuiltValueField(wireName: 'Duree')
  String get duree;

  @nullable
  String get nbrParticipants;

  @nullable
  DocumentReference get user;

  @nullable
  DocumentReference get profile;

  @nullable
  DateTime get timeCreated;

  @nullable
  String get photo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AnnoncesRecordBuilder builder) => builder
    ..titre = ''
    ..description = ''
    ..typeSport = ''
    ..duree = ''
    ..nbrParticipants = ''
    ..photo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('annonces');

  static Stream<AnnoncesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AnnoncesRecord._();
  factory AnnoncesRecord([void Function(AnnoncesRecordBuilder) updates]) =
      _$AnnoncesRecord;

  static AnnoncesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAnnoncesRecordData({
  String titre,
  String description,
  String typeSport,
  LatLng lieu,
  DateTime date,
  DateTime heure,
  String duree,
  String nbrParticipants,
  DocumentReference user,
  DocumentReference profile,
  DateTime timeCreated,
  String photo,
}) =>
    serializers.toFirestore(
        AnnoncesRecord.serializer,
        AnnoncesRecord((a) => a
          ..titre = titre
          ..description = description
          ..typeSport = typeSport
          ..lieu = lieu
          ..date = date
          ..heure = heure
          ..duree = duree
          ..nbrParticipants = nbrParticipants
          ..user = user
          ..profile = profile
          ..timeCreated = timeCreated
          ..photo = photo));
