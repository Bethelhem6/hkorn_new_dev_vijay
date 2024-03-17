import 'package:dio/dio.dart';
import 'package:hkorn_new_dev_vijay/app/app.locator.dart';
import 'package:hkorn_new_dev_vijay/const/variables.dart';
import 'package:hkorn_new_dev_vijay/model/about_model.dart';
import 'package:hkorn_new_dev_vijay/model/cart_list_model.dart';
import 'package:hkorn_new_dev_vijay/model/chairperson_model.dart';
import 'package:hkorn_new_dev_vijay/model/constituion_model.dart';
import 'package:hkorn_new_dev_vijay/model/council_memebers_model.dart';
import 'package:hkorn_new_dev_vijay/model/course_detail_model.dart';
import 'package:hkorn_new_dev_vijay/model/course_model.dart';
import 'package:hkorn_new_dev_vijay/model/event_detail_model.dart';
import 'package:hkorn_new_dev_vijay/model/event_list_mode.dart';
import 'package:hkorn_new_dev_vijay/model/event_model.dart';
import 'package:hkorn_new_dev_vijay/model/gallery.dart';
import 'package:hkorn_new_dev_vijay/model/group_album.dart';
import 'package:hkorn_new_dev_vijay/model/group_album_photo_model.dart';
import 'package:hkorn_new_dev_vijay/model/group_member_model.dart';
import 'package:hkorn_new_dev_vijay/model/group_model.dart';
import 'package:hkorn_new_dev_vijay/model/group_photo_model.dart';
import 'package:hkorn_new_dev_vijay/model/links_model.dart';
import 'package:hkorn_new_dev_vijay/model/messages_list.dart';
import 'package:hkorn_new_dev_vijay/model/mission_model.dart';
import 'package:hkorn_new_dev_vijay/model/news_detail.dart';
import 'package:hkorn_new_dev_vijay/model/news_list.dart';
import 'package:hkorn_new_dev_vijay/model/note_detail_model.dart';
import 'package:hkorn_new_dev_vijay/model/notes_model.dart';
import 'package:hkorn_new_dev_vijay/model/notification_model.dart';
import 'package:hkorn_new_dev_vijay/model/oder_detail.dart';
import 'package:hkorn_new_dev_vijay/model/photo_detail_model.dart';
import 'package:hkorn_new_dev_vijay/model/photo_model.dart';
import 'package:hkorn_new_dev_vijay/model/popup_data_model.dart';
import 'package:hkorn_new_dev_vijay/model/search_model.dart';
import 'package:hkorn_new_dev_vijay/repo/auth_rep.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/util/logger.dart';

import '../model/add_to_cart_model.dart';

class UserService {
  final AuthRepo _repo = AuthRepo();
  final _sharedService = locator<SharedPrefService>();

  Future<List<NotificationModel>?> getUserNotification() async {
    final AuthRepo<Map> _repo = AuthRepo();
    Map storedData = await _sharedService.getStoredData();

    // Map<String, dynamic> dataPassed = {'user_id': storedData['id']};
    Map<String, dynamic> dataPassed = {'user_id': storedData['id']};
    List<NotificationModel>? notifications;
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'notification', data: dataPassed);
    notifications = [];
    List notificationData = data['notification_data'];
    for (var element in notificationData) {
      notifications.add(NotificationModel.fromMap(element));
    }
    logger.d(data);
    return notifications;
  }

  Future<List<MessageListModel>?> getUserMessageList() async {
    // https://hkornrenew.mockup-design.com/wp-json/api/v1/get_messages
    final AuthRepo<Map> _repo = AuthRepo();
    Map storedData = await _sharedService.getStoredData();

    Map<String, dynamic> dataPassed = {'user_id': storedData['id']};
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'get_messages', data: dataPassed);
    List<MessageListModel>? messages;
    if (data['message_data'] != null) {
      messages = [];
      List messageItems = data['message_data'];
      for (var element in messageItems) {
        messages.add(MessageListModel.fromMap(element));
      }
    }
    logger.d(messages?.first.sender_id);
    return messages;
  }

  Future<List<CartListModel>?> getUserCart() async {
    // https://hkornrenew.mockup-design.com/wp-json/api/v1/cart_by_user_id
    Map storedData = await _sharedService.getStoredData();
    Map<String, dynamic> dataPassed = {'user_id': storedData['id']};
    Map? data = await _repo.postRequest(
        requiresAuth: false,
        url: 'cart_by_user_id',
        data: dataPassed,
        keyWord: '');

    if (data != null) {
      List<CartListModel>? items = [];
      List cartData = data['cart_data'];
      logger.d(cartData);
      for (var element in cartData) {
        items.add(CartListModel.fromMap(element));
      }
      return items;
    }
    return [];
  }

  Future<List<AddToCartDataModel>?> addToCartData(int quantity) async {
    Map storedData = await _sharedService.getStoredData();
    Map<String, dynamic> dataPassed = {
      'user_id': storedData['id'],
      'product_id': 2570,
      'quantity': quantity
    };
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'add_to_cart', data: dataPassed, keyWord: '');

    if (data != null) {
      List<AddToCartDataModel>? items = [];
      List addCartData = data['cart_data'];
      logger.d(addCartData);
      for (var element in addCartData) {
        items.add(AddToCartDataModel.fromJson(element));
      }
      return items;
    }
    return [];
  }

  Future<List<NewsModel>?> getNews() async {
    final _repo = AuthRepo<NewsModel>();

    List<NewsModel>? data = await _repo.getRequestForList(
        keyword: 'news_data',
        requiresAuth: true,
        url: 'news',
        serializer: NewsModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<List<GroupModel>?> getGroup() async {
    final _repo = AuthRepo<GroupModel>();

    List<GroupModel>? data = await _repo.getRequestForList(
        keyword: 'groups_data',
        requiresAuth: true,
        url: 'groups',
        serializer: GroupModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<CourseDetailModel?> getCourseDetail(Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'course_detail', keyWord: '', data: model);

    if (data != null) {
      return CourseDetailModel.fromMap(data);
    } else {
      return null;
    }
  }

  Future<GroupMemberModel?> getGroupDetailData(
      Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'group_detail', keyWord: '', data: model);

    if (data != null) {
      return GroupMemberModel.fromJson(data);
    } else {
      return null;
    }
  }

  Future setImagetoServer(Map<String, dynamic> model) async {
    await _repo
        .postRequest(
            requiresAuth: false,
            url: 'group_add_photo',
            keyWord: '',
            data: model)
        .then((value) => logger.w(value));
  }

  Future setAlbumtoServer(Map<String, dynamic> model) async {
    await _repo
        .postRequest(
            requiresAuth: false,
            url: 'group_create_album',
            keyWord: '',
            data: model)
        .then((value) => logger.w(value));
  }

  Future<List<EventDataModel>?> getEvents() async {
    final _repo = AuthRepo<Map?>();

    // FormData formData = FormData.fromMap(dataToBePassed);
    // logger.d(formData);
    // Response _response =
    //     await _dio.post(baseUrl + 'events_by_date', data: formData);
    // logger.d(_response.data);
    // logger.d(dataToBePassed);
    Map? data = await _repo
        .postRequest(requiresAuth: false, url: 'events_by_date', data: {});

    logger.d(data);
    if (data != null) {
      if (data['events_data'] == 'No event found.') {
        return [];
      } else {
        List<EventDataModel>? items = [];
        List eventData = data['events_data'];
        logger.d(eventData);
        for (var element in eventData) {
          items.add(EventDataModel.fromMap(element));
        }
        return items;
      }
    }
    return [];
  }

  Future<List<MissionModel>?> getMission() async {
    final _repo = AuthRepo<MissionModel>();

    List<MissionModel>? data = await _repo.getRequestForList(
        keyword: '',
        requiresAuth: true,
        url: 'mission',
        serializer: MissionModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<EventDetailModel> getEventDetail(Map<String, dynamic> data) async {
    final _dio = Dio();

    final Response response =
        await _dio.post(baseUrl + 'event_detail', data: data);

    EventDetailModel model =
        EventDetailModel.fromJson(response.data['event_data']);
    logger.d(response.data);
    return model;
  }

  Future<List<LinksModel>?> getLinks() async {
    final _repo = AuthRepo<LinksModel>();

    List<LinksModel>? data = await _repo.getRequestForList(
        keyword: 'links_data',
        requiresAuth: true,
        url: 'links',
        serializer: LinksModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<List<GalleryModel>?> getGallery() async {
    final _repo = AuthRepo<GalleryModel>();

    List<GalleryModel>? data = await _repo.getRequestForList(
        keyword: 'gallery_data',
        requiresAuth: true,
        url: 'gallery',
        serializer: GalleryModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<GalleryModel> getCollectionListning(GalleryModel datas) async {
    GalleryModel data = datas;
    logger.d(data.featureImage);
    return data;
  }

  Future<List<PopupData>?> getPopUpData() async {
    final _repo = AuthRepo<PopupData>();

    List<PopupData>? data = await _repo.getRequestForList(
        keyword: 'popup_data',
        requiresAuth: true,
        url: 'popup',
        serializer: PopupData.fromMap);

    return data;
  }

  Future<List<CourseModel>?> getCourses() async {
    final _repo = AuthRepo<CourseModel>();

    List<CourseModel>? data = await _repo.getRequestForList(
        keyword: 'courses_data',
        requiresAuth: true,
        url: 'courses',
        serializer: CourseModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<List<AboutModel>?> getAboutDetails() async {
    final _repo = AuthRepo<AboutModel>();

    List<AboutModel>? data = await _repo.getRequestForList(
        keyword: 'mission_data',
        requiresAuth: true,
        url: 'mission',
        serializer: AboutModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<List<ConstitutionModel>?> getConstitutionDetails() async {
    final _repo = AuthRepo<ConstitutionModel>();

    List<ConstitutionModel>? data = await _repo.getRequestForList(
        keyword: 'constitution_data',
        requiresAuth: true,
        url: 'constitution',
        serializer: ConstitutionModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<NewsDetailModel?> getNewsDetailDetail(
      Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
      requiresAuth: false,
      url: 'news_detail',
      keyWord: 'news_data',
      data: model,
    );

    if (data != null) {
      return NewsDetailModel.fromMap(data);
    } else {
      return null;
    }
  }

  Future<PhotoDetailModel?> getPhotoDetailDetails(
      Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
      requiresAuth: false,
      url: 'photo_detail',
      keyWord: '',
      data: model,
    );

    if (data != null) {
      return PhotoDetailModel.fromJson(data);
    } else {
      return null;
    }
  }

  Future<List<String>> getCollectionDetailPage(List<String> imaga) async {
    List<String> image = imaga;
    logger.d(image);
    return image;
  }

  Future<List<PhotoModel>?> getPhotoDetail() async {
    final AuthRepo<PhotoModel> _repo = AuthRepo();

    List<PhotoModel>? data = await _repo.getRequestForList(
        requiresAuth: false,
        keyword: 'photo_data',
        url: 'photo',
        serializer: PhotoModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<List<SearchResultModel>?> getSearchResult(String keyWord) async {
    final AuthRepo<List?> _repo = AuthRepo();

    List? data = await _repo.postRequest(
      requiresAuth: false,
      url: 'search',
      keyWord: 'search_data',
      data: {
        'keyword': keyWord,
      },
    );

    if (data != null) {
      List<SearchResultModel> result = [];
      for (var element in data) {
        result.add(SearchResultModel.fromMap(element));
      }

      return result;
    } else {
      return null;
    }
  }

  Future<List<CouncilMembersModel>?> getCouncilMembers() async {
    final AuthRepo<CouncilMembersModel> _repo = AuthRepo();
    // https://hkornrenew.mockup-design.com/wp-json/api/v1/council_member
    List<CouncilMembersModel>? data = await _repo.getRequestForList(
        requiresAuth: false,
        keyword: 'council_member_data',
        url: 'council_member',
        serializer: CouncilMembersModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<Map?> submitContactForm(Map<String, dynamic> dataPassed) async {
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'contact_form', data: dataPassed);

    return data;
  }

  Future<List<NotesModel>?> getNotes() async {
    final AuthRepo<NotesModel> _repo = AuthRepo();

    List<NotesModel>? data = await _repo.getRequestForList(
        requiresAuth: false,
        keyword: 'notes_data',
        url: 'notes',
        serializer: NotesModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<List<GroupPhotoModel>?> getGroupPhoto() async {
    Map storedData = await _sharedService.getStoredData();
    Map<String, dynamic> dataPassed = {'user_id': storedData['id']};
    Map? data = await _repo.postRequest(
      requiresAuth: false,
      url: 'group_photos',
      keyWord: '',
      data: dataPassed,
    );
    logger.d(data);
    List<GroupPhotoModel>? groupPhotoList;
    groupPhotoList = [];
    List groupPhotoData = data?['photos_data'];
    for (var element in groupPhotoData) {
      groupPhotoList.add(GroupPhotoModel.fromMap(element));
    }
    return groupPhotoList;
  }

  Future<List<GroupPhotoAlbumModel>?> getGroupAlbumPhoto(String albumId) async {
    Map<String, dynamic> dataPassed = {
      'album_id': int.parse(albumId),
    };
    Map? data = await _repo.postRequest(
      requiresAuth: false,
      url: 'group_album_images',
      keyWord: '',
      data: dataPassed,
    );
    logger.d(data);
    List<GroupPhotoAlbumModel>? groupAlbumPhotoList;
    groupAlbumPhotoList = [];
    List groupPhotoData = data?['album_images'];
    for (var element in groupPhotoData) {
      groupAlbumPhotoList.add(GroupPhotoAlbumModel.fromMap(element));
    }
    return groupAlbumPhotoList;
  }

  Future<List<GroupAlbumModel>?> getGroupAlbum(int groupId) async {
    Map storedData = await _sharedService.getStoredData();
    Map<String, dynamic> dataPassed = {
      'user_id': storedData['id'],
      'group_id': groupId
    };
    Map? data = await _repo.postRequest(
      requiresAuth: false,
      url: 'group_albums',
      keyWord: '',
      data: dataPassed,
    );
    logger.d(data);
    List<GroupAlbumModel>? groupAlbumList;
    groupAlbumList = [];
    List groupPhotoData = data?['albums_data'];
    for (var element in groupPhotoData) {
      groupAlbumList.add(GroupAlbumModel.fromMap(element));
    }

    return groupAlbumList;
  }

  Future<List<CouncilMemberAboutModel>?> getCouncilMemberDetails() async {
    final AuthRepo<CouncilMemberAboutModel> _repo = AuthRepo();

    List<CouncilMemberAboutModel>? data = await _repo.getRequestForList(
        requiresAuth: false,
        keyword: 'council_members_list',
        url: 'council_members_list',
        serializer: CouncilMemberAboutModel.fromMap);
    logger.d(data);
    return data;
  }

  Future<List<CouncilAllMemberModel>?> getCouncilAllMemberDetails() async {
    final AuthRepo<CouncilAllMemberModel> _repo = AuthRepo();

    List<CouncilAllMemberModel>? data = await _repo.getRequestForList(
        requiresAuth: false,
        keyword: 'all_members_list',
        url: 'all_members_list',
        serializer: CouncilAllMemberModel.fromMap);
    logger.d(data);

    return data;
  }

  Future<NoteDetailModel?> getNoteDetail(Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
      requiresAuth: false,
      url: 'note_detail',
      keyWord: 'note_data',
      data: model,
    );

    if (data != null) {
      return NoteDetailModel.fromMap(data);
    } else {
      return null;
    }
  }

  Future<Map?> addOrder(Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
      requiresAuth: false,
      url: 'add_order',
      data: model,
    );

    return data;
  }

  Future<ChairPersonModel?> getChairPersonMessageDetail(
      Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
        requiresAuth: false,
        url: 'chairperson_message',
        data: model,
        keyWord: '');

    return data == null ? null : ChairPersonModel.fromMap(data);
  }

  Future<OrderDetailModel?> getOrderDetail(Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'get_order', data: model, keyWord: 'order');

    return data == null ? null : OrderDetailModel.fromMap(data);
  }

  Future<Map?> addToCart(Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'add_to_cart', data: model, keyWord: '');

    return data;
  }

  Future<List<EventModelForPurchase>?> getEventsForPurchase() async {
    final AuthRepo<EventModelForPurchase> _repo = AuthRepo();

    List<EventModelForPurchase>? data = await _repo.getRequestForList(
        requiresAuth: true,
        keyword: 'events_data',
        url: 'events',
        serializer: EventModelForPurchase.fromMap);
    logger.d(data);
    return data;
  }

  Future<Map?> addToRecentSearch(String keyWord) async {
    Map storedData = await _sharedService.getStoredData();

    Map<String, dynamic> dataPassed = {
      'user_id': storedData['id'],
      'keyword': keyWord
    };

    Map? data = await _repo.postRequest(
        requiresAuth: false,
        url: 'add_recent_search',
        data: dataPassed,
        keyWord: '');
    return data;
  }

  Future<Map?> getRecentSearch() async {
    final AuthRepo<Map> _repo = AuthRepo();
    Map storedData = await _sharedService.getStoredData();
    Map<String, dynamic> dataPassed = {'user_id': storedData['id']};
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'get_recent_search', data: dataPassed);

    return data;
  }

  Future<Map?> voteForCouncil(Map<String, dynamic> model) async {
    Map? data = await _repo.postRequest(
        requiresAuth: false, url: 'add_vote', data: model, keyWord: '');
    return data;
  }

  Future<List<MissionModel>?> getCouncileMembers() async {
    final _repo = AuthRepo<MissionModel>();

    List<MissionModel>? data = await _repo.getRequestForList(
        keyword: '',
        requiresAuth: true,
        url: 'mission',
        serializer: MissionModel.fromMap);
    logger.d(data);
    return data;
  }
}
