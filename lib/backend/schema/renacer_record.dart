import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RenacerRecord extends FirestoreRecord {
  RenacerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "arte" field.
  String? _arte;
  String get arte => _arte ?? '';
  bool hasArte() => _arte != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "artista" field.
  String? _artista;
  String get artista => _artista ?? '';
  bool hasArtista() => _artista != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  void _initializeFields() {
    _arte = snapshotData['arte'] as String?;
    _text = snapshotData['text'] as String?;
    _artista = snapshotData['artista'] as String?;
    _titulo = snapshotData['titulo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('renacer');

  static Stream<RenacerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RenacerRecord.fromSnapshot(s));

  static Future<RenacerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RenacerRecord.fromSnapshot(s));

  static RenacerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RenacerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RenacerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RenacerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RenacerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RenacerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRenacerRecordData({
  String? arte,
  String? text,
  String? artista,
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'arte': arte,
      'text': text,
      'artista': artista,
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class RenacerRecordDocumentEquality implements Equality<RenacerRecord> {
  const RenacerRecordDocumentEquality();

  @override
  bool equals(RenacerRecord? e1, RenacerRecord? e2) {
    return e1?.arte == e2?.arte &&
        e1?.text == e2?.text &&
        e1?.artista == e2?.artista &&
        e1?.titulo == e2?.titulo;
  }

  @override
  int hash(RenacerRecord? e) =>
      const ListEquality().hash([e?.arte, e?.text, e?.artista, e?.titulo]);

  @override
  bool isValidKey(Object? o) => o is RenacerRecord;
}
