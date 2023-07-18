// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailVOAdapter extends TypeAdapter<DetailVO> {
  @override
  final int typeId = 5;

  @override
  DetailVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailVO(
      title: fields[0] as String?,
      bookImage: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DetailVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.bookImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
