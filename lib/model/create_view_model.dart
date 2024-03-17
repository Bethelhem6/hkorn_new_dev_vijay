// ignore_for_file: non_constant_identifier_names, prefer_adjacent_string_concatenation

class CreateUserModel {
  final String email;
  final String password;
  final String first_name;
  final String last_name;
  final String nickname;
  final String chinese_name;
  final String gender;
  final String hospital;
  final String rank;
  final String post;
  final String dept;
  final String membership;
  final String remark;
  final String contact_number;

//<editor-fold desc="Data Methods">

  const CreateUserModel({
    required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
    required this.nickname,
    required this.chinese_name,
    required this.gender,
    required this.hospital,
    required this.rank,
    required this.post,
    required this.dept,
    required this.membership,
    required this.remark,
    required this.contact_number,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreateUserModel &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password &&
          first_name == other.first_name &&
          last_name == other.last_name &&
          nickname == other.nickname &&
          chinese_name == other.chinese_name &&
          gender == other.gender &&
          hospital == other.hospital &&
          rank == other.rank &&
          post == other.post &&
          dept == other.dept &&
          membership == other.membership &&
          remark == other.remark &&
          contact_number == other.contact_number);

  @override
  int get hashCode =>
      email.hashCode ^
      password.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      nickname.hashCode ^
      chinese_name.hashCode ^
      gender.hashCode ^
      hospital.hashCode ^
      rank.hashCode ^
      post.hashCode ^
      dept.hashCode ^
      membership.hashCode ^
      remark.hashCode ^
      contact_number.hashCode;

  @override
  String toString() {
    return 'CreateUserModel{' +
        ' email: $email,' +
        ' password: $password,' +
        ' first_name: $first_name,' +
        ' last_name: $last_name,' +
        ' nickname: $nickname,' +
        ' chinese_name: $chinese_name,' +
        ' gender: $gender,' +
        ' hospital: $hospital,' +
        ' rank: $rank,' +
        ' post: $post,' +
        ' dept: $dept,' +
        ' membership: $membership,' +
        ' remark: $remark,' +
        ' contact_number: $contact_number,' +
        '}';
  }

  CreateUserModel copyWith({
    String? email,
    String? password,
    String? first_name,
    String? last_name,
    String? nickname,
    String? chinese_name,
    String? gender,
    String? hospital,
    String? rank,
    String? post,
    String? dept,
    String? membership,
    String? remark,
    String? contact_number,
  }) {
    return CreateUserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      nickname: nickname ?? this.nickname,
      chinese_name: chinese_name ?? this.chinese_name,
      gender: gender ?? this.gender,
      hospital: hospital ?? this.hospital,
      rank: rank ?? this.rank,
      post: post ?? this.post,
      dept: dept ?? this.dept,
      membership: membership ?? this.membership,
      remark: remark ?? this.remark,
      contact_number: contact_number ?? this.contact_number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'first_name': first_name,
      'last_name': last_name,
      'nickname': nickname,
      'confirm_password': password,
      'confirm_email': email,
      'chinese_name': chinese_name,
      'gender': gender,
      'hospital': hospital,
      'rank': rank,
      'post': post,
      'dept': dept,
      'membership': membership,
      'remark': remark,
      'contact_number': contact_number,
    };
  }

  factory CreateUserModel.fromMap(Map<String, dynamic> map) {
    return CreateUserModel(
      email: map['email'] as String,
      password: map['password'] as String,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      nickname: map['nickname'] as String,
      chinese_name: map['chinese_name'] as String,
      gender: map['gender'] as String,
      hospital: map['hospital'] as String,
      rank: map['rank'] as String,
      post: map['post'] as String,
      dept: map['dept'] as String,
      membership: map['membership'] as String,
      remark: map['remark'] as String,
      contact_number: map['contact_number'] as String,
    );
  }

//</editor-fold>
}
