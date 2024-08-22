class PhValue {
  String? id;
  String? ecValue;
  String? doValue;
  String? phValue;
  String? chemical1Level;
  String? chemical2Level;
  String? chemical3Level;
  String? chemical4Level;
  String? chemical1Count;
  String? chemical2Count;
  String? chemical3Count;
  String? chemical4Count;
  String? timestamp;

  PhValue(
      {this.id,
      this.ecValue,
      this.doValue,
      this.phValue,
      this.chemical1Level,
      this.chemical2Level,
      this.chemical3Level,
      this.chemical4Level,
      this.chemical1Count,
      this.chemical2Count,
      this.chemical3Count,
      this.chemical4Count,
      this.timestamp});

  PhValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ecValue = json['ecValue'];
    doValue = json['doValue'];
    phValue = json['phValue'];
    chemical1Level = json['chemical1Level'];
    chemical2Level = json['chemical2Level'];
    chemical3Level = json['chemical3Level'];
    chemical4Level = json['chemical4Level'];
    chemical1Count = json['chemical1_Count'];
    chemical2Count = json['chemical2_Count'];
    chemical3Count = json['chemical3_Count'];
    chemical4Count = json['chemical4_Count'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ecValue'] = this.ecValue;
    data['doValue'] = this.doValue;
    data['phValue'] = this.phValue;
    data['chemical1Level'] = this.chemical1Level;
    data['chemical2Level'] = this.chemical2Level;
    data['chemical3Level'] = this.chemical3Level;
    data['chemical4Level'] = this.chemical4Level;
    data['chemical1_Count'] = this.chemical1Count;
    data['chemical2_Count'] = this.chemical2Count;
    data['chemical3_Count'] = this.chemical3Count;
    data['chemical4_Count'] = this.chemical4Count;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
