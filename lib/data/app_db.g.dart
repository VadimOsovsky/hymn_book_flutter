// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Hymn extends DataClass implements Insertable<Hymn> {
  final int localId;
  final String id;
  final String title;
  final String lyrics;
  final String musicBy;
  final String lyricsBy;
  final String hymnCoverImage;
  final String language;
  final String submittedBy;
  Hymn(
      {@required this.localId,
      this.id,
      @required this.title,
      @required this.lyrics,
      @required this.musicBy,
      @required this.lyricsBy,
      this.hymnCoverImage,
      @required this.language,
      this.submittedBy});
  factory Hymn.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Hymn(
      localId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}local_id']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      lyrics:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}lyrics']),
      musicBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}music_by']),
      lyricsBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}lyrics_by']),
      hymnCoverImage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}hymn_cover_image']),
      language: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}language']),
      submittedBy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}submitted_by']),
    );
  }
  factory Hymn.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Hymn(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      lyrics: serializer.fromJson<String>(json['lyrics']),
      musicBy: serializer.fromJson<String>(json['musicBy']),
      lyricsBy: serializer.fromJson<String>(json['lyricsBy']),
      hymnCoverImage: serializer.fromJson<String>(json['hymnCoverImage']),
      language: serializer.fromJson<String>(json['language']),
      submittedBy: serializer.fromJson<String>(json['submittedBy']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'lyrics': serializer.toJson<String>(lyrics),
      'musicBy': serializer.toJson<String>(musicBy),
      'lyricsBy': serializer.toJson<String>(lyricsBy),
      'hymnCoverImage': serializer.toJson<String>(hymnCoverImage),
      'language': serializer.toJson<String>(language),
      'submittedBy': serializer.toJson<String>(submittedBy),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Hymn>>(bool nullToAbsent) {
    return HymnsCompanion(
      localId: localId == null && nullToAbsent
          ? const Value.absent()
          : Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      lyrics:
          lyrics == null && nullToAbsent ? const Value.absent() : Value(lyrics),
      musicBy: musicBy == null && nullToAbsent
          ? const Value.absent()
          : Value(musicBy),
      lyricsBy: lyricsBy == null && nullToAbsent
          ? const Value.absent()
          : Value(lyricsBy),
      hymnCoverImage: hymnCoverImage == null && nullToAbsent
          ? const Value.absent()
          : Value(hymnCoverImage),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      submittedBy: submittedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(submittedBy),
    ) as T;
  }

  Hymn copyWith(
          {int localId,
          String id,
          String title,
          String lyrics,
          String musicBy,
          String lyricsBy,
          String hymnCoverImage,
          String language,
          String submittedBy}) =>
      Hymn(
        localId: localId ?? this.localId,
        id: id ?? this.id,
        title: title ?? this.title,
        lyrics: lyrics ?? this.lyrics,
        musicBy: musicBy ?? this.musicBy,
        lyricsBy: lyricsBy ?? this.lyricsBy,
        hymnCoverImage: hymnCoverImage ?? this.hymnCoverImage,
        language: language ?? this.language,
        submittedBy: submittedBy ?? this.submittedBy,
      );
  @override
  String toString() {
    return (StringBuffer('Hymn(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('lyrics: $lyrics, ')
          ..write('musicBy: $musicBy, ')
          ..write('lyricsBy: $lyricsBy, ')
          ..write('hymnCoverImage: $hymnCoverImage, ')
          ..write('language: $language, ')
          ..write('submittedBy: $submittedBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      $mrjc(
          $mrjc(
              $mrjc(
                  $mrjc(
                      $mrjc(
                          $mrjc($mrjc($mrjc(0, localId.hashCode), id.hashCode),
                              title.hashCode),
                          lyrics.hashCode),
                      musicBy.hashCode),
                  lyricsBy.hashCode),
              hymnCoverImage.hashCode),
          language.hashCode),
      submittedBy.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Hymn &&
          other.localId == localId &&
          other.id == id &&
          other.title == title &&
          other.lyrics == lyrics &&
          other.musicBy == musicBy &&
          other.lyricsBy == lyricsBy &&
          other.hymnCoverImage == hymnCoverImage &&
          other.language == language &&
          other.submittedBy == submittedBy);
}

class HymnsCompanion extends UpdateCompanion<Hymn> {
  final Value<int> localId;
  final Value<String> id;
  final Value<String> title;
  final Value<String> lyrics;
  final Value<String> musicBy;
  final Value<String> lyricsBy;
  final Value<String> hymnCoverImage;
  final Value<String> language;
  final Value<String> submittedBy;
  const HymnsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.lyrics = const Value.absent(),
    this.musicBy = const Value.absent(),
    this.lyricsBy = const Value.absent(),
    this.hymnCoverImage = const Value.absent(),
    this.language = const Value.absent(),
    this.submittedBy = const Value.absent(),
  });
}

class $HymnsTable extends Hymns with TableInfo<$HymnsTable, Hymn> {
  final GeneratedDatabase _db;
  final String _alias;
  $HymnsTable(this._db, [this._alias]);
  final VerificationMeta _localIdMeta = const VerificationMeta('localId');
  GeneratedIntColumn _localId;
  @override
  GeneratedIntColumn get localId => _localId ??= _constructLocalId();
  GeneratedIntColumn _constructLocalId() {
    return GeneratedIntColumn('local_id', $tableName, false,
        hasAutoIncrement: true);
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, true,
        minTextLength: 24, maxTextLength: 24);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _lyricsMeta = const VerificationMeta('lyrics');
  GeneratedTextColumn _lyrics;
  @override
  GeneratedTextColumn get lyrics => _lyrics ??= _constructLyrics();
  GeneratedTextColumn _constructLyrics() {
    return GeneratedTextColumn('lyrics', $tableName, false,
        minTextLength: 1, maxTextLength: 4000);
  }

  final VerificationMeta _musicByMeta = const VerificationMeta('musicBy');
  GeneratedTextColumn _musicBy;
  @override
  GeneratedTextColumn get musicBy => _musicBy ??= _constructMusicBy();
  GeneratedTextColumn _constructMusicBy() {
    return GeneratedTextColumn(
      'music_by',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lyricsByMeta = const VerificationMeta('lyricsBy');
  GeneratedTextColumn _lyricsBy;
  @override
  GeneratedTextColumn get lyricsBy => _lyricsBy ??= _constructLyricsBy();
  GeneratedTextColumn _constructLyricsBy() {
    return GeneratedTextColumn(
      'lyrics_by',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hymnCoverImageMeta =
      const VerificationMeta('hymnCoverImage');
  GeneratedTextColumn _hymnCoverImage;
  @override
  GeneratedTextColumn get hymnCoverImage =>
      _hymnCoverImage ??= _constructHymnCoverImage();
  GeneratedTextColumn _constructHymnCoverImage() {
    return GeneratedTextColumn(
      'hymn_cover_image',
      $tableName,
      true,
    );
  }

  final VerificationMeta _languageMeta = const VerificationMeta('language');
  GeneratedTextColumn _language;
  @override
  GeneratedTextColumn get language => _language ??= _constructLanguage();
  GeneratedTextColumn _constructLanguage() {
    return GeneratedTextColumn('language', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _submittedByMeta =
      const VerificationMeta('submittedBy');
  GeneratedTextColumn _submittedBy;
  @override
  GeneratedTextColumn get submittedBy =>
      _submittedBy ??= _constructSubmittedBy();
  GeneratedTextColumn _constructSubmittedBy() {
    return GeneratedTextColumn('submitted_by', $tableName, true,
        minTextLength: 24, maxTextLength: 24);
  }

  @override
  List<GeneratedColumn> get $columns => [
        localId,
        id,
        title,
        lyrics,
        musicBy,
        lyricsBy,
        hymnCoverImage,
        language,
        submittedBy
      ];
  @override
  $HymnsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'hymns';
  @override
  final String actualTableName = 'hymns';
  @override
  VerificationContext validateIntegrity(HymnsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.localId.present) {
      context.handle(_localIdMeta,
          localId.isAcceptableValue(d.localId.value, _localIdMeta));
    } else if (localId.isRequired && isInserting) {
      context.missing(_localIdMeta);
    }
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.lyrics.present) {
      context.handle(
          _lyricsMeta, lyrics.isAcceptableValue(d.lyrics.value, _lyricsMeta));
    } else if (lyrics.isRequired && isInserting) {
      context.missing(_lyricsMeta);
    }
    if (d.musicBy.present) {
      context.handle(_musicByMeta,
          musicBy.isAcceptableValue(d.musicBy.value, _musicByMeta));
    } else if (musicBy.isRequired && isInserting) {
      context.missing(_musicByMeta);
    }
    if (d.lyricsBy.present) {
      context.handle(_lyricsByMeta,
          lyricsBy.isAcceptableValue(d.lyricsBy.value, _lyricsByMeta));
    } else if (lyricsBy.isRequired && isInserting) {
      context.missing(_lyricsByMeta);
    }
    if (d.hymnCoverImage.present) {
      context.handle(
          _hymnCoverImageMeta,
          hymnCoverImage.isAcceptableValue(
              d.hymnCoverImage.value, _hymnCoverImageMeta));
    } else if (hymnCoverImage.isRequired && isInserting) {
      context.missing(_hymnCoverImageMeta);
    }
    if (d.language.present) {
      context.handle(_languageMeta,
          language.isAcceptableValue(d.language.value, _languageMeta));
    } else if (language.isRequired && isInserting) {
      context.missing(_languageMeta);
    }
    if (d.submittedBy.present) {
      context.handle(_submittedByMeta,
          submittedBy.isAcceptableValue(d.submittedBy.value, _submittedByMeta));
    } else if (submittedBy.isRequired && isInserting) {
      context.missing(_submittedByMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Hymn map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Hymn.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(HymnsCompanion d) {
    final map = <String, Variable>{};
    if (d.localId.present) {
      map['local_id'] = Variable<int, IntType>(d.localId.value);
    }
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.lyrics.present) {
      map['lyrics'] = Variable<String, StringType>(d.lyrics.value);
    }
    if (d.musicBy.present) {
      map['music_by'] = Variable<String, StringType>(d.musicBy.value);
    }
    if (d.lyricsBy.present) {
      map['lyrics_by'] = Variable<String, StringType>(d.lyricsBy.value);
    }
    if (d.hymnCoverImage.present) {
      map['hymn_cover_image'] =
          Variable<String, StringType>(d.hymnCoverImage.value);
    }
    if (d.language.present) {
      map['language'] = Variable<String, StringType>(d.language.value);
    }
    if (d.submittedBy.present) {
      map['submitted_by'] = Variable<String, StringType>(d.submittedBy.value);
    }
    return map;
  }

  @override
  $HymnsTable createAlias(String alias) {
    return $HymnsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $HymnsTable _hymns;
  $HymnsTable get hymns => _hymns ??= $HymnsTable(this);
  HymnsDao _hymnsDao;
  HymnsDao get hymnsDao => _hymnsDao ??= HymnsDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [hymns];
}
