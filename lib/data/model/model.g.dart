// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightLossProgress _$WeightLossProgressFromJson(Map<String, dynamic> json) =>
    WeightLossProgress(
      wlInitial: json['wlInitial'] as String? ?? '',
      wlCurrent: json['wlCurrent'] as String? ?? '',
      wlTarget: json['wlTarget'] as String? ?? '',
      wlDays: json['wlDays'] as String? ?? '',
      wlDailyTask: json['wlDailyTask'] as bool? ?? false,
      wlLevel: json['wlLevel'] as String? ?? '',
      wlProgress: json['wlProgress'] as int? ?? 0,
      wlCompleted: json['wlCompleted'] as bool? ?? false,
      wlBarProgress: (json['wlBarProgress'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$WeightLossProgressToJson(WeightLossProgress instance) =>
    <String, dynamic>{
      'wlInitial': instance.wlInitial,
      'wlCurrent': instance.wlCurrent,
      'wlTarget': instance.wlTarget,
      'wlDays': instance.wlDays,
      'wlLevel': instance.wlLevel,
      'wlDailyTask': instance.wlDailyTask,
      'wlProgress': instance.wlProgress,
      'wlCompleted': instance.wlCompleted,
      'wlBarProgress': instance.wlBarProgress,
    };

BasketBallProgress _$BasketBallProgressFromJson(Map<String, dynamic> json) =>
    BasketBallProgress(
      bbPurpose: json['bbPurpose'] as String? ?? '',
      bbDailyTask: json['bbDailyTask'] as bool? ?? false,
      bbLevel: json['bbLevel'] as String? ?? '',
      bbProgress: json['bbProgress'] as int? ?? 0,
    );

Map<String, dynamic> _$BasketBallProgressToJson(BasketBallProgress instance) =>
    <String, dynamic>{
      'bbPurpose': instance.bbPurpose,
      'bbLevel': instance.bbLevel,
      'bbDailyTask': instance.bbDailyTask,
      'bbProgress': instance.bbProgress,
    };

BadmintonProgress _$BadmintonProgressFromJson(Map<String, dynamic> json) =>
    BadmintonProgress(
      btPurpose: json['btPurpose'] as String? ?? '',
      btDailyTask: json['btDailyTask'] as bool? ?? false,
      btLevel: json['btLevel'] as String? ?? '',
      btProgress: json['btProgress'] as int? ?? 0,
    );

Map<String, dynamic> _$BadmintonProgressToJson(BadmintonProgress instance) =>
    <String, dynamic>{
      'btPurpose': instance.btPurpose,
      'btLevel': instance.btLevel,
      'btDailyTask': instance.btDailyTask,
      'btProgress': instance.btProgress,
    };

FootBallProgress _$FootBallProgressFromJson(Map<String, dynamic> json) =>
    FootBallProgress(
      fbPurpose: json['fbPurpose'] as String? ?? '',
      fbDailyTask: json['fbDailyTask'] as bool? ?? false,
      fbLevel: json['fbLevel'] as String? ?? '',
      fbProgress: json['fbProgress'] as int? ?? 0,
    );

Map<String, dynamic> _$FootBallProgressToJson(FootBallProgress instance) =>
    <String, dynamic>{
      'fbPurpose': instance.fbPurpose,
      'fbLevel': instance.fbLevel,
      'fbDailyTask': instance.fbDailyTask,
      'fbProgress': instance.fbProgress,
    };

FootBallDailyProgram _$FootBallDailyProgramFromJson(
        Map<String, dynamic> json) =>
    FootBallDailyProgram(
      sport1: json['sport1'] as String? ?? '',
      value1: (json['value1'] as num?)?.toDouble() ?? 0.0,
      sport2: json['sport2'] as String? ?? '',
      value2: (json['value2'] as num?)?.toDouble() ?? 0,
      progress1: (json['progress1'] as num?)?.toDouble() ?? 0,
      progress2: (json['progress2'] as num?)?.toDouble() ?? 0,
      complete1: json['complete1'] as bool? ?? false,
      complete2: json['complete2'] as bool? ?? false,
    );

Map<String, dynamic> _$FootBallDailyProgramToJson(
        FootBallDailyProgram instance) =>
    <String, dynamic>{
      'sport1': instance.sport1,
      'value1': instance.value1,
      'sport2': instance.sport2,
      'value2': instance.value2,
      'progress1': instance.progress1,
      'progress2': instance.progress2,
      'complete1': instance.complete1,
      'complete2': instance.complete2,
    };

BadmintonDailyProgram _$BadmintonDailyProgramFromJson(
        Map<String, dynamic> json) =>
    BadmintonDailyProgram(
      sport1: json['sport1'] as String? ?? '',
      value1: (json['value1'] as num?)?.toDouble() ?? 0.0,
      sport2: json['sport2'] as String? ?? '',
      value2: (json['value2'] as num?)?.toDouble() ?? 0,
      progress1: (json['progress1'] as num?)?.toDouble() ?? 0,
      progress2: (json['progress2'] as num?)?.toDouble() ?? 0,
      complete1: json['complete1'] as bool? ?? false,
      complete2: json['complete2'] as bool? ?? false,
    );

Map<String, dynamic> _$BadmintonDailyProgramToJson(
        BadmintonDailyProgram instance) =>
    <String, dynamic>{
      'sport1': instance.sport1,
      'value1': instance.value1,
      'sport2': instance.sport2,
      'value2': instance.value2,
      'progress1': instance.progress1,
      'progress2': instance.progress2,
      'complete1': instance.complete1,
      'complete2': instance.complete2,
    };

BasketDailyProgram _$BasketDailyProgramFromJson(Map<String, dynamic> json) =>
    BasketDailyProgram(
      sport1: json['sport1'] as String? ?? '',
      value1: (json['value1'] as num?)?.toDouble() ?? 0.0,
      sport2: json['sport2'] as String? ?? '',
      value2: (json['value2'] as num?)?.toDouble() ?? 0,
      progress1: (json['progress1'] as num?)?.toDouble() ?? 0,
      progress2: (json['progress2'] as num?)?.toDouble() ?? 0,
      complete1: json['complete1'] as bool? ?? false,
      complete2: json['complete2'] as bool? ?? false,
    );

Map<String, dynamic> _$BasketDailyProgramToJson(BasketDailyProgram instance) =>
    <String, dynamic>{
      'sport1': instance.sport1,
      'value1': instance.value1,
      'sport2': instance.sport2,
      'value2': instance.value2,
      'progress1': instance.progress1,
      'progress2': instance.progress2,
      'complete1': instance.complete1,
      'complete2': instance.complete2,
    };

WeightLossDailyProgram _$WeightLossDailyProgramFromJson(
        Map<String, dynamic> json) =>
    WeightLossDailyProgram(
      sport1: json['sport1'] as String? ?? '',
      value1: (json['value1'] as num?)?.toDouble() ?? 0.0,
      sport2: json['sport2'] as String? ?? '',
      value2: (json['value2'] as num?)?.toDouble() ?? 0,
      progress1: (json['progress1'] as num?)?.toDouble() ?? 0,
      progress2: (json['progress2'] as num?)?.toDouble() ?? 0,
      complete1: json['complete1'] as bool? ?? false,
      complete2: json['complete2'] as bool? ?? false,
    );

Map<String, dynamic> _$WeightLossDailyProgramToJson(
        WeightLossDailyProgram instance) =>
    <String, dynamic>{
      'sport1': instance.sport1,
      'value1': instance.value1,
      'sport2': instance.sport2,
      'value2': instance.value2,
      'progress1': instance.progress1,
      'progress2': instance.progress2,
      'complete1': instance.complete1,
      'complete2': instance.complete2,
    };
