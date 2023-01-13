import 'package:equatable/equatable.dart';

class ResultsEntity extends Equatable {
  List<ResultsData> resultsData;

  ResultsEntity({required this.resultsData});

  @override
  // TODO: implement props
  List<Object?> get props => resultsData;
}

class ResultsData extends Equatable {
  int id;
  String image;
  int bathroom;
  int bedroom;
  int livingRoom;
  int area;
  Agent? agent;


  ResultsData({
    required this.id,
    required this.bedroom,
    required this.image,
     this.agent,
    required this.livingRoom,
    required this.area,

    required this.bathroom,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[id,bathroom,bedroom,image,area,agent,livingRoom];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['bathroom'] = this.bathroom;
    data['bedroom'] = this.bedroom;
    data['living_room'] = this.livingRoom;
    data['area'] = this.area;
    if (this.agent != null) {
      data['agent'] = agent?.toJson();
    }

    return data;
  }
}

class Agent extends Equatable {
  int id;
  String name;
  String image;

  Agent({required this.id, required this.name, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id, image, name];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
