import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class WeightLossProgress {
  String wlInitial;
  String wlCurrent;
  String wlTarget;
  String wlDays;
  String wlLevel;
  bool wlDailyTask;
  int wlProgress;
  bool wlCompleted;
  double wlBarProgress;
  WeightLossProgress({
    this.wlInitial = '',
    this.wlCurrent = '',
    this.wlTarget = '',
    this.wlDays = '',
    this.wlDailyTask = false,
    this.wlLevel = '',
    this.wlProgress = 0,
    this.wlCompleted = false,
    this.wlBarProgress = 0
  });
  factory WeightLossProgress.fromJson(Map<String, dynamic> json) => _$WeightLossProgressFromJson(json);
  Map<String, dynamic> toJson() => _$WeightLossProgressToJson(this);
}

@JsonSerializable()
class BasketBallProgress {
  String bbPurpose;
  String bbLevel;
  bool bbDailyTask;
  int bbProgress;
  BasketBallProgress({
    this.bbPurpose = '',
    this.bbDailyTask = false,
    this.bbLevel = '',
    this.bbProgress = 0
  });
  factory BasketBallProgress.fromJson(Map<String, dynamic> json) => _$BasketBallProgressFromJson(json);
  Map<String, dynamic> toJson() => _$BasketBallProgressToJson(this);
}

@JsonSerializable()
class BadmintonProgress {
  String btPurpose;
  String btLevel;
  bool btDailyTask;
  int btProgress;
  BadmintonProgress({
    this.btPurpose = '',
    this.btDailyTask = false,
    this.btLevel = '',
    this.btProgress = 0
  });
  factory BadmintonProgress.fromJson(Map<String, dynamic> json) => _$BadmintonProgressFromJson(json);
  Map<String, dynamic> toJson() => _$BadmintonProgressToJson(this);
}

@JsonSerializable()
class FootBallProgress {
  String fbPurpose;
  String fbLevel;
  bool fbDailyTask;
  int fbProgress;
  FootBallProgress({
    this.fbPurpose = '',
    this.fbDailyTask = false,
    this.fbLevel = '',
    this.fbProgress = 0
  });
  factory FootBallProgress.fromJson(Map<String, dynamic> json) => _$FootBallProgressFromJson(json);
  Map<String, dynamic> toJson() => _$FootBallProgressToJson(this);
}

@JsonSerializable()
class FootBallDailyProgram {
  String sport1;
  double value1;
  String sport2;
  double value2;
  double progress1;
  double progress2;
  bool complete1;
  bool complete2;
  FootBallDailyProgram({
    this.sport1 = '',
    this.value1 = 0.0,
    this.sport2 = '',
    this.value2 = 0,
    this.progress1 = 0,
    this.progress2 = 0,
    this.complete1 = false,
    this.complete2 = false
  });
  factory FootBallDailyProgram.fromJson(Map<String, dynamic> json) => _$FootBallDailyProgramFromJson(json);
  Map<String, dynamic> toJson() => _$FootBallDailyProgramToJson(this);
}

@JsonSerializable()
class BadmintonDailyProgram {
  String sport1;
  double value1;
  String sport2;
  double value2;
  double progress1;
  double progress2;
  bool complete1;
  bool complete2;
  BadmintonDailyProgram({
    this.sport1 = '',
    this.value1 = 0.0,
    this.sport2 = '',
    this.value2 = 0,
    this.progress1 = 0,
    this.progress2 = 0,
    this.complete1 = false,
    this.complete2 = false
  });
  factory BadmintonDailyProgram.fromJson(Map<String, dynamic> json) => _$BadmintonDailyProgramFromJson(json);
  Map<String, dynamic> toJson() => _$BadmintonDailyProgramToJson(this);
}

@JsonSerializable()
class BasketDailyProgram {
  String sport1;
  double value1;
  String sport2;
  double value2;
  double progress1;
  double progress2;
  bool complete1;
  bool complete2;
  BasketDailyProgram({
    this.sport1 = '',
    this.value1 = 0.0,
    this.sport2 = '',
    this.value2 = 0,
    this.progress1 = 0,
    this.progress2 = 0,
    this.complete1 = false,
    this.complete2 = false
  });
  factory BasketDailyProgram.fromJson(Map<String, dynamic> json) => _$BasketDailyProgramFromJson(json);
  Map<String, dynamic> toJson() => _$BasketDailyProgramToJson(this);
}

@JsonSerializable()
class WeightLossDailyProgram {
  String sport1;
  double value1;
  String sport2;
  double value2;
  double progress1;
  double progress2;
  bool complete1;
  bool complete2;
  WeightLossDailyProgram({
    this.sport1 = '',
    this.value1 = 0.0,
    this.sport2 = '',
    this.value2 = 0,
    this.progress1 = 0,
    this.progress2 = 0,
    this.complete1 = false,
    this.complete2 = false
  });
  factory WeightLossDailyProgram.fromJson(Map<String, dynamic> json) => _$WeightLossDailyProgramFromJson(json);
  Map<String, dynamic> toJson() => _$WeightLossDailyProgramToJson(this);
}

