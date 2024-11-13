import 'package:flutter/material.dart';

// Image constants
const String onboardingOneImage = 'assets/images/onboarding_1.png';
const String onboardingTwoImage = 'assets/images/onboarding_2.png';
const String onboardingThreeImage = 'assets/images/onboarding_3.png';
const String onboardingFourImage = 'assets/images/onboarding_4.png';
const String unlockPremium = 'assets/images/unlock_premium.svg';

// SVG constants
const String add = 'assets/svgs/add.svg';
const String parcel = 'assets/svgs/parcel.svg';
const String gps = 'assets/svgs/gps.svg';
const String barcode = 'assets/svgs/barcode.svg';
const String share = 'assets/svgs/share.svg';
const String feedback = 'assets/svgs/feedback.svg';
const String bell = 'assets/svgs/bell.svg';
const String close = 'assets/svgs/close.svg';
const String premiumBaner = 'assets/svgs/premium_baner.svg';
const String courier = 'assets/svgs/courier.svg';
const String unlimitedParcel = 'assets/svgs/unlimited_parcel.svg';
const String courierDitection = 'assets/svgs/courier_detection.svg';

// String constants
const String onboardingOneTitle = 'See the full tracking history';
const String onboardingOneSubTitle =
    'See detailed information about each step your parcel (S) delivery';

const String onboardingTwoTitle = 'Track 1000+ delivery service providers';
const String onboardingTwoSubTitle =
    'The function of automatic carrier recognition will allow you to find any of your parcels';

const String onboardingThreeTitle =
    'Never miss return and warranty dates for items';
const String onboardingThreeSubTitle =
    'Add items to delivered parcel, set reminders for return and warranty expiration dates';

const String onboardingFourTitle =
    'Get personal notifications about delivery progress';
const String onboardingFourSubTitle =
    'Monitor the progress of your parcels delivery and receive them on time';

// Color constants
const Color primaryColor = Color(0xFFFFB939);
const Color textColor = Color(0xFF000000);
const Color secondaryColor = Color(0xFF404040);
const Color greyColor = Color(0xFF828282);

// Storage contants
const String isOnboardingDone = 'isOnboardingDone';
const String isPremium = 'isPremium';
const String parcelList = 'parcelList';

// API keys
const String tAPIKey = '7cxirso0-xa5b-9uez-sh82-5uzpbknax2be';
const String pAPIKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJjNTdkZjg1MC05YzE4LTExZWYtOGViMS1iNTJjNmY1ZGZkYWUiLCJzdWJJZCI6IjY3MmIyODFmOTVjMTYwNGE5YTA2ZjAwOCIsImlhdCI6MTczMDg4MTU2N30.NbQHXxJgTfiy9rm4tC5Bee1cWEPStfvReDc_KmVVti8';

//TO DO: add the entitlement ID from the RevenueCat dashboard that is activated upon successful in-app purchase for the duration of the purchase.
const entitlementID = 'premium_access';

const String annualPlan = 'pt_49.99_1y';
const String weeklyPlan = 'pt_5.99_1w_3d0';
const List<String> planIds = [weeklyPlan, annualPlan];

//TO DO: add your subscription terms and conditions
const footerText = "Don't forget to add your purchases terms and conditions.";

//TO DO: add the Apple API key for your app from the RevenueCat dashboard: https://app.revenuecat.com
const appleApiKey = 'appl_gwOpPuGhOFJrExgbHfZLYaxFfQM';
