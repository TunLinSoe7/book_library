// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_hive_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShelfHiveVOAdapter extends TypeAdapter<ShelfHiveVO> {
  @override
  final int typeId = 7;

  @override
  ShelfHiveVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShelfHiveVO(
      shelfName: fields[0] as String?,
      shelfVO: (fields[1] as List?)?.cast<ShelfVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShelfHiveVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.shelfName)
      ..writeByte(1)
      ..write(obj.shelfVO);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfHiveVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
