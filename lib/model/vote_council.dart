// ignore_for_file: non_constant_identifier_names

class VoteCouncil {
  final int option_id;
  final int vote;
  final String note;

  Map<String, dynamic> toMap() {
    return {
      'option_id': option_id,
      'vote': vote,
      'note': note,
    };
  }

  factory VoteCouncil.fromMap(Map<String, dynamic> map) {
    return VoteCouncil(
      option_id: map['option_id'] as int,
      vote: map['vote'] as int,
      note: map['note'] as String,
    );
  }

  const VoteCouncil({
    required this.option_id,
    required this.vote,
    required this.note,
  });
}
// note:- vote should be 0 or 1. 0 means you already vote. 1 means you are voting. on website is is manage by session. its not user based."