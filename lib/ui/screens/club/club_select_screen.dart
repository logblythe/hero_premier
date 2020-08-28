import 'package:flutter/material.dart';
import 'package:hero_premier/core/models/club/club.dart';
import 'package:hero_premier/core/view_models/club_view_model.dart';
import 'package:hero_premier/ui/base_widget.dart';
import 'package:hero_premier/ui/screens/club/widgets/club_card.dart';
import 'package:hero_premier/ui/shared/text_styles.dart';
import 'package:hero_premier/ui/widgets/error_card.dart';
import 'package:hero_premier/ui/widgets/secondary_button.dart';
import 'package:hero_premier/ui/widgets/text_button.dart';
import 'package:hero_premier/utils/api_response.dart';
import 'package:provider/provider.dart';

class ClubSelectScreen extends StatefulWidget {
  @override
  _ClubSelectScreenState createState() => _ClubSelectScreenState();
}

class _ClubSelectScreenState extends State<ClubSelectScreen> {
  int _selectedIndex;
  BuildContext _context;
  ClubViewModel _vm;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: SafeArea(
        child: BaseWidget<ClubViewModel>(
          model: ClubViewModel(
            userService: Provider.of(context),
            navigationService: Provider.of(context),
          ),
          onModelReady: (vm) {
            vm.fetchClubs();
          },
          builder: (ctx, ClubViewModel vm, child) {
            _vm = vm;
            return IgnorePointer(
              ignoring: vm.loading,
              child: Stack(
                children: <Widget>[
                  bodyWidget(),
                  vm.loading
                      ? Center(child: CircularProgressIndicator())
                      : Container(),
                  vm.error != null
                      ? ErrorCard(
                          error: vm.error,
                          onPress: () => {vm.setError(null)},
                        )
                      : Container(),
                  vm.dialogContent != null
                      ? ErrorCard(
                          error: vm.dialogContent,
                          onPress: () {
                            vm.setDialogContent(null);
                          },
                        )
                      : Container(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container bodyWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 42),
                    child: Text(
                      "Let\'s Go",
                      style: TextStyles.Subtitle1.copyWith(
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 12, left: 8),
                    child: Text(
                      'Choose your favourite team',
                      style: TextStyles.Heading5.copyWith(
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                      child: _vm.status == Status.COMPLETED
                          ? GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 4.0,
                              ),
                              itemCount: _vm.clubs.length,
                              itemBuilder: (context, index) {
                                Club _club = _vm.clubs.elementAt(index);
                                return ClubCard(
                                  club: _club,
                                  selected: index == _selectedIndex,
                                  onSelect: () => _handleClubSelect(index),
                                );
                              },
                            )
                          : Container()),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 4,
                  offset: Offset(0, 8),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  label: 'Skip',
                  onPress: _handleSkip,
                ),
                SecondaryButton(
                  label: 'Continue',
                  enabled: _selectedIndex != null,
                  onPress: _handleContinue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleClubSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _handleSkip() {
    _vm.navigateLogin();
  }

  _handleContinue() {
    _vm.selectClub();
  }
}
