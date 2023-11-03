import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ArtistasRecord extends FirestoreRecord {
  ArtistasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "artista" field.
  String? _artista;
  String get artista => _artista ?? '';
  bool hasArtista() => _artista != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "perfil" field.
  String? _perfil;
  String get perfil => _perfil ?? '';
  bool hasPerfil() => _perfil != null;

  // "preview" field.
  String? _preview;
  String get preview => _preview ?? '';
  bool hasPreview() => _preview != null;

  // "orden" field.
  int? _orden;
  int get orden => _orden ?? 0;
  bool hasOrden() => _orden != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "collectionOpenSea" field.
  String? _collectionOpenSea;
  String get collectionOpenSea => _collectionOpenSea ?? '';
  bool hasCollectionOpenSea() => _collectionOpenSea != null;

  void _initializeFields() {
    _artista = snapshotData['artista'] as String?;
    _photo = snapshotData['photo'] as String?;
    _bio = snapshotData['bio'] as String?;
    _perfil = snapshotData['perfil'] as String?;
    _preview = snapshotData['preview'] as String?;
    _orden = castToType<int>(snapshotData['orden']);
    _titulo = snapshotData['titulo'] as String?;
    _collectionOpenSea = snapshotData['collectionOpenSea'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('artistas');

  static Stream<ArtistasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtistasRecord.fromSnapshot(s));

  static Future<ArtistasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtistasRecord.fromSnapshot(s));

  static ArtistasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtistasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtistasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtistasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtistasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtistasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtistasRecordData({
  String? artista,
  String? photo,
  String? bio,
  String? perfil,
  String? preview,
  int? orden,
  String? titulo,
  String? collectionOpenSea,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'artista': artista,
      'photo': photo,
      'bio': bio,
      'perfil': perfil,
      'preview': preview,
      'orden': orden,
      'titulo': titulo,
      'collectionOpenSea': collectionOpenSea,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtistasRecordDocumentEquality implements Equality<ArtistasRecord> {
  const ArtistasRecordDocumentEquality();

  @override
  bool equals(ArtistasRecord? e1, ArtistasRecord? e2) {
    return e1?.artista == e2?.artista &&
        e1?.photo == e2?.photo &&
        e1?.bio == e2?.bio &&
        e1?.perfil == e2?.perfil &&
        e1?.preview == e2?.preview &&
        e1?.orden == e2?.orden &&
        e1?.titulo == e2?.titulo &&
        e1?.collectionOpenSea == e2?.collectionOpenSea;
  }

  @override
  int hash(ArtistasRecord? e) => const ListEquality().hash([
        e?.artista,
        e?.photo,
        e?.bio,
        e?.perfil,
        e?.preview,
        e?.orden,
        e?.titulo,
        e?.collectionOpenSea
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtistasRecord;
}
