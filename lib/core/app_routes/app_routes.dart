import 'package:final_project/features/addingProperty_feature/presentation/bindings/addProperty_binding.dart';
import 'package:final_project/features/addingProperty_feature/presentation/pages/addingProperty_view.dart';
import 'package:final_project/features/agents_feature/presentation/binding/agents_binding.dart';
import 'package:final_project/features/agents_feature/presentation/pages/agent_detailes_view.dart';
import 'package:final_project/features/agents_feature/presentation/pages/agents_view.dart';
import 'package:final_project/features/auth_feature/presentation/bindings/auth_binding.dart';
import 'package:final_project/features/auth_feature/presentation/pages/login_view.dart';
import 'package:final_project/features/booking_feature/presentation/bindings/booking_binding.dart';
import 'package:final_project/features/booking_feature/presentation/pages/booking_view.dart';
import 'package:final_project/features/chat_feature/presentation/pages/chat_view.dart';
import 'package:final_project/features/favorities_feature/presentation/pages/favorites_view.dart';
import 'package:final_project/features/filter_feature/presentation/bindings/filter_binding.dart';
import 'package:final_project/features/filter_feature/presentation/pages/filter_view.dart';
import 'package:final_project/features/home_feature/presentation/bindings/home_binding.dart';
import 'package:final_project/features/home_feature/presentation/pages/home_view.dart';
import 'package:final_project/features/home_feature/presentation/pages/property_details_view.dart';
import 'package:final_project/features/home_feature/presentation/widgets/home_layout.dart';
import 'package:final_project/features/notification_feature/presentation/pages/notification_view.dart';
import 'package:final_project/features/profile_feature/presentation/bindings/profile_binding.dart';
import 'package:final_project/features/profile_feature/presentation/pages/edit_profile_view.dart';
import 'package:final_project/features/profile_feature/presentation/pages/profile_view.dart';
import 'package:final_project/features/filter_feature/presentation/pages/results_view.dart';
import 'package:final_project/features/settings_feature/presentation/pages/helping_view.dart';
import 'package:final_project/features/settings_feature/presentation/pages/languages_view.dart';
import 'package:get/get.dart';
import '../../features/auth_feature/presentation/pages/create_new_pass_view.dart';
import '../../features/auth_feature/presentation/pages/forget_pass_view.dart';
import '../../features/auth_feature/presentation/pages/signup_view.dart';
import '../../features/auth_feature/presentation/pages/verification_view.dart';
import '../../features/chat_feature/presentation/pages/chat_contact_view.dart';
import '../../features/on_boarding_feature/view/on_boarding_view.dart';
import '../../features/splash_feature/presenttion/pages/splash_screen.dart';
class AppRoutes{
  static String splash='/splash';
  static String onBoarding='/onBoarding';
  static String signIN='/signIN';
  static String signUp='/signUp';
  static String home='/home';
  static String layout='/';
  static String resetPass='/resetPass';
  static String checkCode='/checkCode';
  static String createPass='/createPass';
  static String chat='/chat';
  static String chatContacts='/chatContacts';
  static String profile='/profile';
  static String favorites='/favorites';
  static String details='/details';
  static String notification='/notification';
  static String filter='/filter';
  static String helping='/helping';
  static String results='/results';
  static String booking='/booking';
  static String addProperty='/addProperty';
  static String agents='/agents';
  static String agentDetails='/agentDetails';
  static String lang='/lang';
  static String editProfile='/editProfile';

  static String getOnBoardingRout() => onBoarding;
  static String getSignInRout() => signIN;
  static String getSignUpRout() => signUp;
  static String getHomeRout() => home;
  static String getLayoutRout() => layout;
  static String getForgetPassRout() => resetPass;
  static String getCheckCodeRout() => checkCode;
  static String getoCreatePassRout() => createPass;
  static String getchatRout() => chat;
  static String getchatContactsRout() => chatContacts;
  static String getprofileRout() => profile;
  static String getfavoritesRout() => favorites;
  static String getdetailsRout() => details;
  static String getnotificationRout() => notification;
  static String getfilterRout() => filter;
  static String gethelpingRout() => helping;
  static String getResultsRout() => results;
  static String getsplashRout() => splash;
  static String getBookingRout() => booking;
  static String getaddPropertyRout() => addProperty;
  static String getagentsRout() => agents;
  static String getagentDetailsRout() => agentDetails;
  static String getlangRout() => lang;
  static String getEditProfileRout() => editProfile;
  List<GetPage> routes = [
    GetPage(name: onBoarding, page: () => OnBoardingScreen()),
    GetPage(name: signIN, page: () => SignInScreen(),binding: AuthBinding()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: layout, page: () => HomeLayout(),binding: HomeBinding()),
    GetPage(name: resetPass, page: () => ResetPasswordScreen()),
    GetPage(name: checkCode, page: () => VerificationScreen()),
    GetPage(name: createPass, page: () => CreateNewPassScreen()),
    GetPage(name: chat, page: () => ChatScreen(id: '')),
    GetPage(name: chatContacts, page: () => ChatContactScreen()),
    GetPage(name: profile, page: () => ProfileScreen(),binding: ProfileBinding()),
    GetPage(name: favorites, page: () => FavoritesScreen()),
    GetPage(name: details, page: () => PropertyDetailsScreen()),
    GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(name: filter, page: () => FilterScreen(),binding: FilterBinding()),
    GetPage(name: helping, page: () => HelpingScreen()),
    GetPage(name: editProfile, page: () => EditProfileScreen(),binding: ProfileBinding()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: booking, page: () => BookingScreen(),binding: BookingBinding()),
    GetPage(name: agents, page: () => AgentsScreen(),binding: AgentBinding()),
    GetPage(name: agentDetails, page: () => AgentDetailsScreen()),
    GetPage(name: lang, page: () => LangScreen()),
    GetPage(name: results, page: () => ResultsScreen(),binding: FilterBinding()),
    GetPage(name: addProperty, page: () => AddingPropertyScreen(),binding: AddPropertyBinding()),

  ];

}