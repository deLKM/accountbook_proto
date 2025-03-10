// Author: Ching-Yu

import '../features/login_page/views/login_page.dart';
import '../features/txn_dtl_page/views/txn_dtl_page.dart';
import '../features/txn_dtl_page/views/assets_page.dart';
import '../features/txn_dtl_page/views/liabilities_page.dart';
import '../features/txn_dtl_page/views/manage_assets.dart';
import '../features/txn_dtl_page/views/manage_liabilities.dart';
import '../features/statistic_page/views/statistic_page.dart';
import '../features/plan_page/views/plan_page.dart';
import '../features/profile_page/views/profile_page.dart';
import '../features/record_a_bill/views/record_a_bill_page.dart';
import '../features/login_page/views/forget_pwd.dart';
import '../features/login_page/views/sign_up.dart';

final appRoutes = {
  '/login': (context) => LoginPage(),
  '/txndtl': (context) => TxnDtlPage(),
  '/statistic': (context) => StatisticPage(),
  '/plan': (context) => PlanPage(),
  '/profile': (context) => ProfilePage(),
  '/record': (context) => RecordPage(),
  '/signup': (context) => SignUpPage(),
  '/forgotpwd': (context) => ForgotPwdPage(),
  '/assets': (context) => AssetsPage(),
  '/liabilities': (context) => LiabilitiesPage(),
  '/manage_assets': (context) => ManageAssetsPage(),
  '/manage_liabilities': (context) => ManageLiabilitiesPage(),
};