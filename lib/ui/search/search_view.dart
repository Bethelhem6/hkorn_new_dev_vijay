import 'package:flutter/material.dart';
import 'package:hkorn_new_dev_vijay/app/app.router.dart';
import 'package:hkorn_new_dev_vijay/const/consts.dart';
import 'package:hkorn_new_dev_vijay/ui/all_web_views/all_web_view.dart';
import 'package:hkorn_new_dev_vijay/ui/search/search_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          automaticallyImplyLeading: false,
          title: "Search",
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: sidePadding, right: sidePadding, top: 20),
              child: TextField(
                controller: model.searchController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: model.search,
                    child: const Icon(Icons.search),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFE5E7EB).withOpacity(0.2),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'Search ',
                ),
                // onEditingComplete: model.search,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: sidePadding, right: sidePadding, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Search",
                        textAlign: TextAlign.center,
                        style: BaseFonts.headline(fontSize: 14)),
                    GestureDetector(
                      onTap: () {
                        model.clearRecentSearch();
                      },
                      child: Text("Clear All",
                          textAlign: TextAlign.center,
                          style: BaseFonts.headline(
                              color: BaseColors.primaryColor, fontSize: 12)),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: sidePadding, right: sidePadding, top: 10),
              child: recentSearch(model, context),
            ),
            verticalSpaceMedium,
            model.isBusy
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 8),
                    child: loadingSpinnerWidget,
                  )
                : model.result == null
                    ? Container()
                    // : model.result!.isEmpty
                    //     ? Padding(
                    //         padding: EdgeInsets.only(
                    //             top:
                    //                 MediaQuery.of(context).size.height /
                    //                     4),
                    //         child: Text("No record found.",
                    //             style:
                    //                 BaseFonts.headline(fontSize: 14)),
                    //       )
                    : Expanded(
                        child: ListView.builder(
                          // shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: sidePadding, vertical: 10),
                          itemCount: model.result!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print('===>${model.result![index].post_title}');
                                // Get the route for the current item
                                String? route = _getRouteForItem(
                                    model.result![index].post_title);
                                // Navigate to the determined route
                                if (route != null) {
                                  Navigator.pushNamed(context, route);
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PostRedirectScreen(
                                                result: model.result![index],
                                              )));
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.result![index].post_title,
                                    style: BaseFonts.subHead(),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  Widget recentSearch(SearchViewModel model, BuildContext context) {
    return model.recentSearchItems.isEmpty
        ? Container()
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ListView.separated(
              itemCount: model.recentSearchItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FilterChip(
                  label: Text(model.recentSearchItems[index]),
                  backgroundColor: const Color(0xFF898A8D).withOpacity(0.1),
                  shape: const StadiumBorder(
                      side: BorderSide(color: Color(0xFF898A8D))),
                  onSelected: (bool value) {},
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          );
  }
}

// Function to determine the route for each list item
String? _getRouteForItem(String postTitle) {
  switch (postTitle) {
    case 'StartUp':
      return Routes.startUpView;
    case 'Sign Up':
      return Routes.signUpView;
    case 'Sign In':
      return Routes.signInView;
    case 'Login':
      return Routes.signInView;
    case 'Home Page':
      return Routes.homeView;
    case 'ForgetPassword':
      return Routes.forgetPasswordView;
    case 'UserPassword':
      return Routes.forgetPasswordView;
    // case 'Password Reset':
    //   return Routes.forgetPasswordView;
    case 'Events':
      return Routes.eventView;
    case 'Event Detail View':
      return Routes.eventDetailView;
    case 'About View':
      return Routes.aboutView;
    case 'Constitution 會章':
      return Routes.constitutionView;
    case 'Message from Chairperson':
      return Routes.chairpersonView;
    case 'Message from Chairperson 2012 - 2016':
      return Routes.chairpersonView;
    case 'Message from Chairperson 2016 - 2020':
      return Routes.chairpersonView;
    case 'Message from Chairperson 2010 - 2012':
      return Routes.chairpersonView;
    case 'Message from Chairperson 2006 - 2008':
      return Routes.chairpersonView;
    case 'Council Member 2020- 2022':
      return Routes.memberCouncilView;
    case 'Course View':
      return Routes.courseView;
    case 'Course Detail View':
      return Routes.courseDetailView;
    case 'Notification View':
      return Routes.notificationView;
    case 'News':
      return Routes.newsView;
    case 'News Feed':
      return Routes.newsDetailView;
    case 'Useful Link':
      return Routes.usefulLinks;
    case 'Main View':
      return Routes.mainView;
    case 'Group View':
      return Routes.groupView;
    case 'Group Details View':
      return Routes.groupDetailsView;
    case 'New Member Ship View':
      return Routes.newMemberShipView;
    case 'CheckIn':
      return Routes.checkOutView;
    case 'Photo Gallery':
      return Routes.galleryView;
    case 'Photos':
      return Routes.photoView;
    case 'Collection Listing View':
      return Routes.collectionListingView;
    case 'Photo Detail View':
      return Routes.photoDetailView;
    case 'Order Confirmation View':
      return Routes.orderConfirmationView;
    case 'Renewal Detail View':
      return Routes.renewalDetailView;
    case 'Renewal View':
      return Routes.renewalView;
    case 'Membership':
      return Routes.membersView;
    case 'Mission of the Association':
      return Routes.aboutView;
    case 'Forums View':
      return Routes.forumsView;
    case 'Account Setting View':
      return Routes.accountSettingView;
    case 'Contact':
      return Routes.contactFormView;
    case 'Council Members Vote View':
      return Routes.councilMembersVoteView;
    case 'Message Detail View':
      return Routes.messageDetailView;
    case 'Group Feed View':
      return Routes.groupFeedView;
    case 'Group Photos View':
      return Routes.groupPhotosView;
    case 'Group Albums View':
      return Routes.groupAlbumsView;
    case 'Group Albums Detail View':
      return Routes.groupAlbumsDetailView;
    case 'Group Send Invite View':
      return Routes.groupSendInviteView;
    case 'Group Manage View':
      return Routes.groupManageView;
    default:
      return null; // Return null for items with no specific route
  }
}
