// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:hkorn_new_dev_vijay/model/gallery.dart';
import 'package:hkorn_new_dev_vijay/ui/album_group/album_group_view.dart';
import 'package:hkorn_new_dev_vijay/ui/album_group_detail/album_group_detail_view.dart';
import 'package:hkorn_new_dev_vijay/ui/chairperson/chairperson_view.dart';
import 'package:hkorn_new_dev_vijay/ui/collection_listing/collection_listing_view.dart';
import 'package:hkorn_new_dev_vijay/ui/constitution/constitution_view.dart';
import 'package:hkorn_new_dev_vijay/ui/council_memebers/council_members_view.dart';
import 'package:hkorn_new_dev_vijay/ui/course_detail/course_detail_view.dart';
import 'package:hkorn_new_dev_vijay/ui/feed/feed_view.dart';
import 'package:hkorn_new_dev_vijay/ui/group_details/groupdetails_view.dart';
import 'package:hkorn_new_dev_vijay/ui/groups/groups_view.dart';
import 'package:hkorn_new_dev_vijay/ui/manage/manage_view.dart';
import 'package:hkorn_new_dev_vijay/ui/message_detail/message_detail_view.dart';
import 'package:hkorn_new_dev_vijay/ui/new_membership/new_membership_view.dart';
import 'package:hkorn_new_dev_vijay/ui/photo/photo_page_view.dart';
import 'package:hkorn_new_dev_vijay/ui/photo_detail/photo_detail_view.dart';
import 'package:hkorn_new_dev_vijay/ui/photo_group/photo_group_view.dart';
import 'package:hkorn_new_dev_vijay/ui/send_invite/send_invite_view.dart';
import 'package:stacked/stacked.dart';

import '../ui/about/about_view.dart';
import '../ui/account_setting/account_setting_view.dart';
import '../ui/check_out/checkout_view.dart';
import '../ui/contact/contact_form_view.dart';
import '../ui/council_memebers/council_memebers_vote_view.dart';
import '../ui/course/course_view.dart';
import '../ui/event/event_view.dart';
import '../ui/event_detail/event_detail_view.dart';
import '../ui/forgetpassword/forget_password_view.dart';
import '../ui/forums/forums_view.dart';
import '../ui/gallery/galler_view.dart';
import '../ui/home/home_view.dart';
import '../ui/main/main_view.dart';
import '../ui/memeber/memeber_view.dart';
import '../ui/news/news_view.dart';
import '../ui/news_detail/news_detail_view.dart';
import '../ui/notification_page/notification_page_view.dart';
import '../ui/order_confirmation/order_confirmation_view.dart';
import '../ui/renewal/renewal_view.dart';
import '../ui/renewal_deals/renewal_deals_view.dart';
import '../ui/signin/signin_view.dart';
import '../ui/signup/signup_view.dart';
import '../ui/startup/startup_view.dart';
import '../ui/useful_links/useful_links_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String signUpView = '/sign-up-view';
  static const String signInView = '/sign-in-view';
  static const String homeView = '/home-view';
  static const String forgetPasswordView = '/forget-password-view';
  static const String eventView = '/event-view';
  static const String eventDetailView = '/event-detail-view';
  static const String aboutView = '/about-view';
  static const String constitutionView = '/constitution-view';
  static const String chairpersonView = '/chairperson-view';
  static const String memberCouncilView = '/memberCouncil-view';
  static const String courseView = '/course-view';
  static const String courseDetailView = '/courseDetailView';
  static const String notificationView = '/notification-view';
  static const String newsView = '/news-view';
  static const String newsDetailView = '/news-detail-view';
  static const String usefulLinks = '/useful-links';
  static const String mainView = '/main-view';
  static const String groupView = '/group-view';
  static const String groupDetailsView = '/groupDetails-view';
  static const String newMemberShipView = '/newMemberShip-view';
  static const String checkOutView = '/check-out-view';
  static const String galleryView = '/gallery-view';
  static const String photoView = '/photo-view';
  static const String collectionListingView = '/collection-listing-view';
  static const String photoDetailView = '/photo-detail-view';
  static const String orderConfirmationView = '/order-confirmation-view';
  static const String renewalDetailView = '/renewal-detail-view';
  static const String renewalView = '/renewal-view';
  static const String membersView = '/members-view';
  static const String forumsView = '/forums-view';
  static const String accountSettingView = '/account-setting-view';
  static const String contactFormView = '/contact-form-view';
  static const String councilMembersVoteView = '/council-members-vote-view';
  static const String messageDetailView = '/message-detail-view';
  static const String groupFeedView = '/group-feed-view';
  static const String groupPhotosView = '/group-photo-view';
  static const String groupAlbumsView = '/group-albums-view';
  static const String groupAlbumsDetailView = '/group-albums-detail-view';
  static const String groupSendInviteView = '/group-invite-view';
  static const String groupManageView = '/group-manage-view';
  static const all = <String>{
    startUpView,
    signUpView,
    signInView,
    homeView,
    forgetPasswordView,
    groupDetailsView,
    groupView,
    eventView,
    eventDetailView,
    aboutView,
    newMemberShipView,
    constitutionView,
    chairpersonView,
    collectionListingView,
    courseView,
    memberCouncilView,
    courseDetailView,
    notificationView,
    newsView,
    newsDetailView,
    usefulLinks,
    mainView,
    checkOutView,
    galleryView,
    photoView,
    photoDetailView,
    orderConfirmationView,
    renewalDetailView,
    renewalView,
    membersView,
    forumsView,
    accountSettingView,
    contactFormView,
    councilMembersVoteView,
    messageDetailView,
    groupFeedView,
    groupPhotosView,
    groupAlbumsView,
    groupAlbumsDetailView,
    groupSendInviteView,
    groupManageView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.forgetPasswordView, page: ForgetPasswordView),
    RouteDef(Routes.eventView, page: EventView),
    RouteDef(Routes.groupView, page: GroupView),
    RouteDef(Routes.groupDetailsView, page: GroupDetailsView),
    RouteDef(Routes.eventDetailView, page: EventDetailView),
    RouteDef(Routes.aboutView, page: AboutView),
    RouteDef(Routes.memberCouncilView, page: CouncilMemberView),
    RouteDef(Routes.constitutionView, page: ConstituionView),
    RouteDef(Routes.chairpersonView, page: ChairPersonView),
    RouteDef(Routes.courseView, page: CourseView),
    RouteDef(Routes.collectionListingView, page: CollectionListingView),
    RouteDef(Routes.newMemberShipView, page: NewMemberShipView),
    RouteDef(Routes.courseDetailView, page: CourseDetailView),
    RouteDef(Routes.notificationView, page: NotificationView),
    RouteDef(Routes.newsView, page: NewsView),
    RouteDef(Routes.newsDetailView, page: NewsDetailView),
    RouteDef(Routes.usefulLinks, page: UsefulLinks),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.checkOutView, page: CheckOutView),
    RouteDef(Routes.galleryView, page: GalleryView),
    RouteDef(Routes.photoView, page: PhotoView),
    RouteDef(Routes.photoDetailView, page: PhotoDetailView),
    RouteDef(Routes.orderConfirmationView, page: OrderConfirmationView),
    RouteDef(Routes.renewalDetailView, page: RenewalDetailView),
    RouteDef(Routes.renewalView, page: RenewalView),
    RouteDef(Routes.membersView, page: MembersView),
    RouteDef(Routes.forumsView, page: ForumsView),
    RouteDef(Routes.accountSettingView, page: AccountSettingView),
    RouteDef(Routes.contactFormView, page: ContactFormView),
    RouteDef(Routes.councilMembersVoteView, page: CouncilMembersVoteView),
    RouteDef(Routes.messageDetailView, page: MessageDetailView),
    RouteDef(Routes.groupFeedView, page: GroupFeedView),
    RouteDef(Routes.groupAlbumsView, page: GroupAlbumView),
    RouteDef(Routes.groupAlbumsDetailView, page: GroupAlbumDetailView),
    RouteDef(Routes.groupPhotosView, page: GroupPhotoView),
    RouteDef(Routes.groupSendInviteView, page: GroupSendInviteView),
    RouteDef(Routes.groupManageView, page: GroupManageView),
  ];

  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
    CouncilMemberView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CouncilMemberView(),
        settings: data,
      );
    },
    GroupManageView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const GroupManageView(),
        settings: data,
      );
    },
    GroupPhotoView: (data) {
      var args = data.getArgs<GroupDetailViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => GroupPhotoView(
          key: args.key,
          groupId: args.groupId,
        ),
        settings: data,
      );
    },
    GroupSendInviteView: (data) {
      var args = data.getArgs<GroupDetailViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => GroupSendInviteView(
          key: args.key,
          groupId: args.groupId,
        ),
        settings: data,
      );
    },
    CollectionListingView: (data) {
      var args = data.getArgs<CollectionListingViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CollectionListingView(
          title: args.title,
          key: args.key,
          galleryImage: args.galleryImage,
        ),
        settings: data,
      );
    },
    GroupAlbumDetailView: (data) {
      var args = data.getArgs<GroupDetailsViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => GroupAlbumDetailView(
          key: args.key,
          albumId: args.albumId,
          groupId: args.groupId,
        ),
        settings: data,
      );
    },
    GroupView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const GroupView(),
        settings: data,
      );
    },
    GroupDetailsView: (data) {
      var args = data.getArgs<GroupDetailViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => GroupDetailsView(
          groupId: args.groupId,
          key: args.key,
        ),
        settings: data,
      );
    },
    NewMemberShipView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NewMemberShipView(),
        settings: data,
      );
    },
    GroupAlbumView: (data) {
      var args = data.getArgs<GroupDetailViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => GroupAlbumView(
          key: args.key,
          groupId: args.groupId,
        ),
        settings: data,
      );
    },
    SignInView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SignInView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    ForgetPasswordView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ForgetPasswordView(),
        settings: data,
      );
    },
    EventView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const EventView(),
        settings: data,
      );
    },
    EventDetailView: (data) {
      var args = data.getArgs<EventDetailViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => EventDetailView(
          key: args.key,
          eventID: args.eventID,
        ),
        settings: data,
      );
    },
    AboutView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AboutView(),
        settings: data,
      );
    },
    ConstituionView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ConstituionView(),
        settings: data,
      );
    },
    CourseView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CourseView(),
        settings: data,
      );
    },
    CourseDetailView: (data) {
      var args = data.getArgs<CourseDetailViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CourseDetailView(
          courseId: args.courseId,
          key: args.key,
        ),
        settings: data,
      );
    },
    ChairPersonView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ChairPersonView(),
        settings: data,
      );
    },
    NotificationView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NotificationView(),
        settings: data,
      );
    },
    NewsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NewsView(),
        settings: data,
      );
    },
    MessageDetailView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MessageDetailView(),
        settings: data,
      );
    },
    NewsDetailView: (data) {
      var args = data.getArgs<NewsDetailViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => NewsDetailView(
          key: args.key,
          newsId: args.newsId,
        ),
        settings: data,
      );
    },
    UsefulLinks: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const UsefulLinks(),
        settings: data,
      );
    },
    MainView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    CheckOutView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CheckOutView(),
        settings: data,
      );
    },
    GalleryView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const GalleryView(),
        settings: data,
      );
    },
    PhotoView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const PhotoView(),
        settings: data,
      );
    },
    GroupFeedView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const GroupFeedView(),
        settings: data,
      );
    },
    PhotoDetailView: (data) {
      var args = data.getArgs<PhotoDetailViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => PhotoDetailView(
          galleryTitle: args.galleryTitle,
          key: args.key,
          photo: args.photo,
        ),
        settings: data,
      );
    },
    OrderConfirmationView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const OrderConfirmationView(),
        settings: data,
      );
    },
    RenewalDetailView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const RenewalDetailView(),
        settings: data,
      );
    },
    RenewalView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const RenewalView(),
        settings: data,
      );
    },
    MembersView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MembersView(),
        settings: data,
      );
    },
    ForumsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ForumsView(),
        settings: data,
      );
    },
    AccountSettingView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AccountSettingView(),
        settings: data,
      );
    },
    ContactFormView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ContactFormView(),
        settings: data,
      );
    },
    CouncilMembersVoteView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CouncilMembersVoteView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NewsDetailView arguments holder class
class NewsDetailViewArguments {
  final Key? key;
  final int newsId;

  NewsDetailViewArguments({this.key, required this.newsId});
}

class EventDetailViewArguments {
  final Key? key;
  final int eventID;

  EventDetailViewArguments({this.key, required this.eventID});
}

/// NewsDetailView arguments holder class
class CourseDetailViewArguments {
  final Key? key;
  final String courseId;

  CourseDetailViewArguments({this.key, required this.courseId});
}

class GroupDetailViewArguments {
  final int groupId;
  final Key? key;
  GroupDetailViewArguments({this.key, required this.groupId});
}

class CollectionListingViewArguments {
  final GalleryModel galleryImage;
  final Key? key;
  final String title;
  CollectionListingViewArguments(this.title,
      {this.key, required this.galleryImage});
}

class GroupDetailsViewArguments {
  final String albumId;
  final int groupId;
  final Key? key;
  GroupDetailsViewArguments(
      {this.key, required this.albumId, required this.groupId});
}

class PhotoDetailViewArguments {
  final Key? key;
  final List<String> photo;
  final String galleryTitle;

  PhotoDetailViewArguments(this.galleryTitle, {this.key, required this.photo});
}
