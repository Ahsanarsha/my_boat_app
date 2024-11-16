import 'package:flutter/material.dart';
import 'package:my_boat/themes/colors.dart';
import 'package:my_boat/themes/styles.dart';
import 'package:my_boat/utils/asset_icons.dart';
import 'package:my_boat/utils/exports.dart';
import 'package:my_boat/widgets/button.dart';
import 'package:my_boat/widgets/clickable.dart';
import 'package:my_boat/widgets/cupertino_date_picker.dart';
import 'package:my_boat/widgets/hide_keyboard.dart';
import 'package:my_boat/widgets/horizontal_space.dart';
import 'package:my_boat/widgets/input_field.dart';
import 'package:my_boat/widgets/vertical_space.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedToggleIndex = 0;
  bool withSkipper = true;

  late final FocusNode locationFocus;
  late final FocusNode startDateFocus;
  late final FocusNode endDateFocus;
  late final FocusNode boatTypeFocus;
  late TextEditingController locationController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController boatTypeController;
  late final GlobalKey<FormState> locationFormKey;
  late final GlobalKey<FormState> startDateFormKey;
  late final GlobalKey<FormState> endDateFormKey;
  late final GlobalKey<FormState> boatTypeFormKey;

  @override
  void initState() {
    super.initState();
    locationFocus = FocusNode();
    startDateFocus = FocusNode();
    endDateFocus = FocusNode();
    boatTypeFocus = FocusNode();
    locationController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    boatTypeController = TextEditingController();
    locationFormKey = GlobalKey<FormState>();
    startDateFormKey = GlobalKey<FormState>();
    endDateFormKey = GlobalKey<FormState>();
    boatTypeFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    locationController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    boatTypeController.dispose();
    super.dispose();
  }

  void _pickDate(TextEditingController controller, String title) async {
    DateTime initialDate = DateTime.now();

    DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return CustomCupertinoDatePicker(
          initialDate: initialDate,
          title: title,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        controller.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboardOnOutsideTap(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 32),
                  Row(
                    children: [
                      _buildToggleButton("Locations", 0),
                      const HorizontalSpace(width: 10),
                      _buildToggleButton("Experiences", 1),
                    ],
                  ),
                  const VerticalSpace(height: 20),
                  Text(
                    AppLocalizations.of(context)!.whereTo,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // const VerticalSpace(height: 20),
                  // _buildInputField(
                  //   icon: Icons.location_on_outlined,
                  //   hintText: "United State",
                  //   controller: locationController,
                  // ),

                  ...[
                    const VerticalSpace(height: 20),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.placeOfDeparture,
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: locationFormKey,
                      child: AppInputField(
                        prefixIcon: const Icon(Icons.search_outlined, size: 25),
                        controller: locationController,
                        focusNode: locationFocus,
                        name: AppLocalizations.of(context)!.placeOfDeparture,
                        hint: AppLocalizations.of(context)!.unitedState,
                        onChanged: (value) {
                          locationFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          locationFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],
                  const VerticalSpace(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.startingDate,
                                  style: regularTextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const VerticalSpace(height: 4),
                            Clickable(
                              onTap: () => _pickDate(
                                  startDateController, 'Select Start Date'),
                              child: Form(
                                key: startDateFormKey,
                                child: AppInputField(
                                  enabled: false,
                                  prefixIcon: const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 25),
                                  controller: startDateController,
                                  focusNode: startDateFocus,
                                  name: AppLocalizations.of(context)!
                                      .startingDate,
                                  hint: AppLocalizations.of(context)!.dDMMYYYY,
                                  onChanged: (value) {
                                    startDateFormKey.currentState!.validate();
                                  },
                                  onFieldSubmitted: (value) {
                                    startDateFormKey.currentState!.validate();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HorizontalSpace(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.endingDate,
                                  style: regularTextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const VerticalSpace(height: 4),
                            Clickable(
                              onTap: () => _pickDate(
                                  endDateController, 'Select End Date'),
                              child: Form(
                                key: endDateFormKey,
                                child: AppInputField(
                                  enabled: false,
                                  prefixIcon: const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 25),
                                  controller: endDateController,
                                  focusNode: endDateFocus,
                                  name:
                                      AppLocalizations.of(context)!.endingDate,
                                  hint: AppLocalizations.of(context)!.dDMMYYYY,
                                  onChanged: (value) {
                                    endDateFormKey.currentState!.validate();
                                  },
                                  onFieldSubmitted: (value) {
                                    endDateFormKey.currentState!.validate();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const VerticalSpace(height: 20),
                  ...[
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.boatType,
                          style: regularTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 4),
                    Form(
                      key: boatTypeFormKey,
                      child: AppInputField(
                        controller: boatTypeController,
                        focusNode: boatTypeFocus,
                        name: AppLocalizations.of(context)!.boatType,
                        hint: AppLocalizations.of(context)!.motorboat,
                        onChanged: (value) {
                          boatTypeFormKey.currentState!.validate();
                        },
                        onFieldSubmitted: (value) {
                          boatTypeFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],

                  const VerticalSpace(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          isUpperCase: false,
                          radius: 10,
                          borderColor: withSkipper
                              ? AppColors.primary
                              : AppColors.cE4E4E4,
                          showBorder: true,
                          backgroundColor:
                              withSkipper ? AppColors.primary : AppColors.white,
                          title: AppLocalizations.of(context)!.withSkipper,
                          textStyle: TextStyle(
                            color:
                                withSkipper ? Colors.white : AppColors.cA3A3A3,
                          ),
                          onTap: () {
                            setState(() {
                              withSkipper = true;
                            });
                          },
                        ),
                      ),
                      const HorizontalSpace(width: 10),
                      Expanded(
                        child: AppButton(
                          isUpperCase: false,
                          radius: 10,
                          borderColor: withSkipper
                              ? AppColors.cE4E4E4
                              : AppColors.primary,
                          showBorder: true,
                          backgroundColor: !withSkipper
                              ? AppColors.primary
                              : AppColors.white,
                          title: AppLocalizations.of(context)!.withoutSkipper,
                          textStyle: TextStyle(
                            color:
                                !withSkipper ? Colors.white : AppColors.cA3A3A3,
                          ),
                          onTap: () {
                            setState(() {
                              withSkipper = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const VerticalSpace(height: 20),
                  AppButton(
                    isUpperCase: false,
                    radius: 10,
                    showLeadingIcon: true,
                    backgroundColor: AppColors.primary,
                    titleWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search,
                          color: AppColors.white,
                          size: 25,
                        ),
                        const HorizontalSpace(width: 12),
                        Text(
                          AppLocalizations.of(context)!.search,
                          style: regularTextStyle(color: AppColors.white),
                        )
                      ],
                    ),
                    textStyle: regularTextStyle(color: AppColors.white),
                    onTap: () async {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedToggleIndex = index;
          });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: selectedToggleIndex == index
                ? AppColors.primary
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color:
                    selectedToggleIndex == index ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
