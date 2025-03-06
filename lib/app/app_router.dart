// core/routes/app_routes.dart
import '../features/login_page/views/login_page.dart';
import '../features/txn_dtl_page/views/txn_dtl_page.dart';
import '../features/account_page/views/account_page.dart';
import '../features/plan_page/views/plan_page.dart';
import '../features/profile_page/views/profile_page.dart';
import '../features/record_a_bill/views/record_a_bill_page.dart';

final appRoutes = {
  '/login': (context) => const LoginPage(),
  '/txndtl': (context) => TxnDtlPage(),
  '/account': (context) => const AccountPage(),
  '/plan': (context) => const PlanPage(),
  '/profile': (context) => const ProfilePage(),
  '/record': (context) => const RecordPage(),
};