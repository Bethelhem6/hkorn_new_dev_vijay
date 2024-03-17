class GroupMemberModel {
  int? membersCount;
  String? groupId;
  List<GroupsData>? groupsData;

  GroupMemberModel({this.membersCount, this.groupId, this.groupsData});

  GroupMemberModel.fromJson(Map<dynamic, dynamic> json) {
    membersCount = json['members_count'];
    groupId = json['group_id'];
    if (json['groups_data'] != null) {
      groupsData = <GroupsData>[];
      json['groups_data'].forEach((v) {
        groupsData!.add(GroupsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['members_count'] = membersCount;
    data['group_id'] = groupId;
    if (groupsData != null) {
      data['groups_data'] = groupsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupsData {
  String? userId;
  String? userName;
  String? profileImage;

  GroupsData({this.userId, this.userName});

  GroupsData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['profile_image'] = profileImage;
    return data;
  }
}
