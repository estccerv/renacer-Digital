import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LandingRecord extends FirestoreRecord {
  LandingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "info" field.
  String? _info;
  String get info => _info ?? '';
  bool hasInfo() => _info != null;

  // "contacto" field.
  String? _contacto;
  String get contacto => _contacto ?? '';
  bool hasContacto() => _contacto != null;

  // "resonar" field.
  String? _resonar;
  String get resonar => _resonar ?? '';
  bool hasResonar() => _resonar != null;

  void _initializeFields() {
    _info = snapshotData['info'] as String?;
    _contacto = snapshotData['contacto'] as String?;
    _resonar = snapshotData['resonar'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('landing');

  static Stream<LandingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LandingRecord.fromSnapshot(s));

  static Future<LandingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LandingRecord.fromSnapshot(s));

  static LandingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LandingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LandingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LandingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LandingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LandingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLandingRecordData({
  String? info,
  String? contacto,
  String? resonar,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': info,
      'contacto': contacto,
      'resonar': resonar,
    }.withoutNulls,
  );

  return firestoreData;
}

class LandingRecordDocumentEquality implements Equality<LandingRecord> {
  const LandingRecordDocumentEquality();

  @override
  bool equals(LandingRecord? e1, LandingRecord? e2) {
    return e1?.info == e2?.info &&
        e1?.contacto == e2?.contacto &&
        e1?.resonar == e2?.resonar;
  }

  @override
  int hash(LandingRecord? e) =>
      const ListEquality().hash([e?.info, e?.contacto, e?.resonar]);

  @override
  bool isValidKey(Object? o) => o is LandingRecord;
}
