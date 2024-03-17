import 'package:hkorn_new_dev_vijay/service/auth_service.dart';
import 'package:hkorn_new_dev_vijay/service/shared_pref_service.dart';
import 'package:hkorn_new_dev_vijay/service/user_service.dart';
import 'package:hkorn_new_dev_vijay/ui/about/about_view.dart';
import 'package:hkorn_new_dev_vijay/ui/account_setting/account_setting_view.dart';
import 'package:hkorn_new_dev_vijay/ui/check_out/checkout_view.dart';
import 'package:hkorn_new_dev_vijay/ui/contact/contact_form_view.dart';
import 'package:hkorn_new_dev_vijay/ui/council_memebers/council_memebers_vote_view.dart';
import 'package:hkorn_new_dev_vijay/ui/course/course_view.dart';
import 'package:hkorn_new_dev_vijay/ui/event/event_view.dart';
import 'package:hkorn_new_dev_vijay/ui/event_detail/event_detail_view.dart';
import 'package:hkorn_new_dev_vijay/ui/forgetpassword/forget_password_view.dart';
import 'package:hkorn_new_dev_vijay/ui/forums/forums_view.dart';
import 'package:hkorn_new_dev_vijay/ui/gallery/galler_view.dart';
import 'package:hkorn_new_dev_vijay/ui/home/home_view.dart';
import 'package:hkorn_new_dev_vijay/ui/main/main_view.dart';
import 'package:hkorn_new_dev_vijay/ui/memeber/memeber_view.dart';
import 'package:hkorn_new_dev_vijay/ui/news/news_view.dart';
import 'package:hkorn_new_dev_vijay/ui/news_detail/news_detail_view.dart';
import 'package:hkorn_new_dev_vijay/ui/notes/notes_view.dart';
import 'package:hkorn_new_dev_vijay/ui/notification_page/notification_page_view.dart';
import 'package:hkorn_new_dev_vijay/ui/order_confirmation/order_confirmation_view.dart';
import 'package:hkorn_new_dev_vijay/ui/photo/photo_page_view.dart';
import 'package:hkorn_new_dev_vijay/ui/renewal/renewal_view.dart';
import 'package:hkorn_new_dev_vijay/ui/renewal_deals/renewal_deals_view.dart';
import 'package:hkorn_new_dev_vijay/ui/signin/signin_view.dart';
import 'package:hkorn_new_dev_vijay/ui/signup/signup_view.dart';
import 'package:hkorn_new_dev_vijay/ui/startup/startup_view.dart';
import 'package:hkorn_new_dev_vijay/ui/useful_links/useful_links_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@StackedApp(routes: [
  CupertinoRoute(page: StartUpView, initial: true),
  CupertinoRoute(page: SignUpView),
  CupertinoRoute(page: SignInView),
  CupertinoRoute(page: HomeView),
  CupertinoRoute(page: ForgetPasswordView),
  CupertinoRoute(page: EventView),
  CupertinoRoute(page: EventDetailView),
  CupertinoRoute(page: AboutView),
  CupertinoRoute(page: CourseView),
  CupertinoRoute(page: NotificationView),
  CupertinoRoute(page: NewsView),
  CupertinoRoute(page: NewsDetailView),
  CupertinoRoute(page: UsefulLinks),
  CupertinoRoute(page: MainView),
  CupertinoRoute(page: CheckOutView),
  CupertinoRoute(page: GalleryView),
  CupertinoRoute(page: PhotoView),
  CupertinoRoute(page: OrderConfirmationView),
  CupertinoRoute(page: RenewalDetailView),
  CupertinoRoute(page: RenewalView),
  CupertinoRoute(page: MembersView),
  CupertinoRoute(page: NotesView),
  CupertinoRoute(page: ForumsView),
  CupertinoRoute(page: AccountSettingView),
  CupertinoRoute(page: ContactFormView),
  CupertinoRoute(page: CouncilMembersVoteView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: SharedPrefService),
  LazySingleton(classType: AuthService),
  LazySingleton(classType: UserService),
])
class AppSetup {}
