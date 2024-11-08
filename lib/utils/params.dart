import 'package:flutter/material.dart';

class PinVerificationPageParams {
  final String email;
  final VoidCallback? onSuccess;

  const PinVerificationPageParams({
    this.email = '',
    this.onSuccess,
  });
}

// class FinisherDetailPageParams {
//   final CategoryModel category;
//   final bool isTypeOfServiceSelected;
//   final bool isInstantService;

//   FinisherDetailPageParams({
//     required this.category,
//     required this.isTypeOfServiceSelected,
//     required this.isInstantService,
//   });
// }

// class CompanyDetailsParams {
//   final CompanyModel company;

//   CompanyDetailsParams({
//     required this.company,
//   });
// }
