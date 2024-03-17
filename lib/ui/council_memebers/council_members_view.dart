import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/council_memebers/council_members_viewmodel.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_appbar.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_colors.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/base_fonts.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/memebership_widget.dart';
import 'package:hkorn_new_dev_vijay/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';

class CouncilMemberView extends StatelessWidget {
  const CouncilMemberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CouncilMembersViewModel>.reactive(
      viewModelBuilder: () => CouncilMembersViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppbar(
          context: context,
          title: "Council Member",
        ),
        body: model.isBusy
            ? loadingSpinnerWidget
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      child: Text(
                        'Council Member 2020- 2022',
                        style: BaseFonts.subHead(
                          fontSize: 14,
                          color: BaseColors.black,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: model.councilMembers.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              color: BaseColors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  color: const Color(0xffDADADA), width: 1.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.councilMembers[index].title,
                                style: BaseFonts.headline(
                                    fontSize: 14,
                                    color: BaseColors.primaryColor),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                model.councilMembers[index].content,
                                style: GoogleFonts.poppins(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff5E6064)),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: MembershipWidget()),
                    const SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
