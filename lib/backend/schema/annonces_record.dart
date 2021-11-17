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
  DateTime get timeCreated;

  @nullable
  @BuiltValueField(wireName: 'Distance')
  double get distance;

  @nullable
  @BuiltValueField(wireName: 'Lieu')
  String get lieu;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AnnoncesRecordBuilder builder) => builder
    ..titre = ''
    ..description = ''
    ..typeSport = ''
    ..duree = ''
    ..nbrParticipants = ''
    ..distance = 0.0
    ..lieu = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('annonces');

  static Stream<AnnoncesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static AnnoncesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AnnoncesRecord(
        (c) => c
          ..titre = snapshot.data['Titre']
          ..description = snapshot.data['description']
          ..typeSport = snapshot.data['typeSport']
          ..date = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['Date']))
          ..heure = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['Heure']))
          ..duree = snapshot.data['Duree']
          ..nbrParticipants = snapshot.data['nbrParticipants']
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..timeCreated = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['timeCreated']))
          ..distance = snapshot.data['Distance']
          ..lieu = snapshot.data['Lieu']
          ..reference = AnnoncesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AnnoncesRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'annonces',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  DateTime date,
  DateTime heure,
  String duree,
  String nbrParticipants,
  DocumentReference user,
  DateTime timeCreated,
  double distance,
  String lieu,
}) =>
    serializers.toFirestore(
        AnnoncesRecord.serializer,
        AnnoncesRecord((a) => a
          ..titre = titre
          ..description = description
          ..typeSport = typeSport
          ..date = date
          ..heure = heure
          ..duree = duree
          ..nbrParticipants = nbrParticipants
          ..user = user
          ..timeCreated = timeCreated
          ..distance = distance
          ..lieu = lieu));
