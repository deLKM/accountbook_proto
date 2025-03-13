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
import '../features/txn_dtl_page/views/assets_pages/cash_page.dart';
import '../features/txn_dtl_page/views/assets_pages/creditors_rights_page.dart';
import '../features/txn_dtl_page/views/assets_pages/financial_accounts_page.dart';
import '../features/txn_dtl_page/views/assets_pages/other_assets_page.dart';
import '../features/txn_dtl_page/views/assets_pages/saving_cards_page.dart';
import '../features/txn_dtl_page/views/assets_pages/virtual_accounts_page.dart';
import '../features/txn_dtl_page/views/liabilities_pages/credit_cards_page.dart';
import '../features/txn_dtl_page/views/liabilities_pages/debts_page.dart';
import '../features/txn_dtl_page/views/liabilities_pages/other_liabilities_page.dart';
import '../features/txn_dtl_page/views/liabilities_pages/online_loans_page.dart';


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
  '/cash': (context) => CashPage(),
  '/other_assets': (context) => OtherAssetsPage(),
  '/creditors_rights': (context) => CreditorsRightsPages(),
  '/financial_accounts': (context) => FinancialAccountsPage(),
  '/saving_cards': (context) => SavingCardsPage(),
  '/virtual_accounts': (context) => VirtualAccountsPage(),
  '/credit_cards': (context) => CreditCardsPage(),
  '/debts': (context) => DebtsPage(),
  '/online_loans': (context) => OnlineLoansPage(),
  '/other_liabilities': (context) => OtherLiabilitiesPage(),
};