import 'package:bot_toast/bot_toast.dart';
import 'package:dummy_api/presentation/home/home_page.dart';
import 'package:dummy_api/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      redirect: router._redirectLogic,
      routes: router._routes,
      initialLocation: SplashScreen.route,
      errorPageBuilder: router._errorPageBuilder,
      observers: [
        BotToastNavigatorObserver(),
      ]);
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    // _ref.listen<bool>(
    //   loggedInProvider.select((value) => value.loggedIn),
    //   (_, __) => Future.microtask(() => notifyListeners()),
    // );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    // final token = _ref.watch(loggedInProvider).token;
    // final user = _ref.watch(loggedInProvider).user;

    // final areWeLoggingIn = state.location == '/login';
    // final areWeRegistering = state.location == '/signup';

    // if (user.token.isEmpty && areWeLoggingIn) {
    //   return areWeLoggingIn ? null : '/login';
    // }
    // if (user.token.isEmpty && areWeRegistering) {
    //   return areWeRegistering ? null : '/signup';
    // }

    // if (areWeLoggingIn) return '/main_nav';

    // _ref.read(loggedInProvider.notifier).isLoggedIn();
    // final loggedin = _ref.watch(loggedInProvider.notifier).loggedIn;

    // Logger.i('RouterNotifier: $user = $token');

    // bool isUserIn() => token.isNotEmpty && user != UserModel.init();

    // final areWeLoggingIn = state.location == LoginScreen.routeName;
    // final areWeRegistering = state.location == SignupScreen.routeName;

    // if (!isUserIn() && areWeLoggingIn) {
    //   return areWeLoggingIn ? null : LoginScreen.routeName;
    // }
    // if (!isUserIn() && areWeRegistering) {
    //   return areWeRegistering ? null : SignupScreen.routeName;
    // }

    // if (areWeLoggingIn || areWeRegistering) return MainNav.routeName;

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: HomeScreen.route,
          builder: (context, state) => HomeScreen(),
        ),

        // GoRoute(
        //   path: LoginScreen.routeName,
        //   builder: (context, state) => LoginScreen(),
        // ),
        // GoRoute(
        //   path: SignupScreen.routeName,
        //   builder: (context, state) => SignupScreen(),
        // ),
        // GoRoute(
        //   path: OTPScreen.routeName,
        //   builder: (context, state) =>
        //       OTPScreen(phone: state.queryParams['phone']!),
        // ),
        // GoRoute(
        //   path: BlogDetailScreen.routeName,
        //   builder: (context, state) =>
        //       BlogDetailScreen(imgUrl: state.queryParams['imgUrl']!),
        // ),
        // GoRoute(
        //   path: CourseDetailScreen.routeName,
        //   builder: (context, state) =>
        //       CourseDetailScreen(courseId: state.queryParams['courseId']!),
        // ),
        // GoRoute(
        //   path: ChatScreen.routeName,
        //   builder: (context, state) => const ChatScreen(),
        // ),
        // GoRoute(
        //   path: InstructorProfileScreen.routeName,
        //   builder: (context, state) =>
        //       InstructorProfileScreen(id: state.queryParams['id']!),
        // ),
        // GoRoute(
        //   path: ProfileScreen.routeName,
        //   builder: (context, state) => const ProfileScreen(),
        // ),
        // GoRoute(
        //   path: NotificationScreen.routeName,
        //   builder: (context, state) => NotificationScreen(),
        // ),
        // GoRoute(
        //   path: PaymentScreen.routeName,
        //   builder: (context, state) => PaymentScreen(),
        // ),
        // GoRoute(
        //   path: NotificationSettingsPage.routeName,
        //   builder: (context, state) => const NotificationSettingsPage(),
        // ),
        // GoRoute(
        //   path: LanguageScreen.routeName,
        //   builder: (context, state) => const LanguageScreen(),
        // ),
        // GoRoute(
        //   path: SecurityScreen.routeName,
        //   builder: (context, state) => const SecurityScreen(),
        // ),
        // GoRoute(
        //   path: WishlistScreen.routeName,
        //   builder: (context, state) => const WishlistScreen(),
        // ),
        // GoRoute(
        //   path: CountrySelectionScreen.routeName,
        //   builder: (context, state) => const CountrySelectionScreen(),
        // ),
        // GoRoute(
        //   path: VideoPlayerScreen.routeName,
        //   builder: (context, state) => VideoPlayerScreen(
        //     fileUrl: state.queryParams['fileUrl']!,
        //     title: state.queryParams['title']!,
        //   ),
        // ),
        // GoRoute(
        //   path: PDFViewerScreen.routeName,
        //   builder: (context, state) => PDFViewerScreen(
        //     fileUrl: state.queryParams['fileUrl']!,
        //     title: state.queryParams['title']!,
        //   ),
        // ),
        // GoRoute(
        //   path: CategorizedCourseScreen.routeName,
        //   builder: (context, state) => CategorizedCourseScreen(
        //     title: state.queryParams['title']!,
        //     subCategoryId: state.queryParams['subId']!,
        //   ),
        // ),
        // GoRoute(
        //   path: InstructorCoursesScreen.routeName,
        //   builder: (context, state) => InstructorCoursesScreen(
        //     title: state.queryParams['title']!,
        //     instructorId: state.queryParams['instructorId']!,
        //   ),
        // ),
        // GoRoute(
        //   path: ViewCourseScreen.routeName,
        //   builder: (context, state) => ViewCourseScreen(
        //     courseId: state.queryParams['courseId']!,
        //   ),
        // ),
        // GoRoute(
        //   path: QuizScreen.routeName,
        //   builder: (context, state) => QuizScreen(
        //     quizId: state.queryParams['quizId']!,
        //   ),
        // ),
        // GoRoute(
        //   path: QuizResultScreen.routeName,
        //   builder: (context, state) => const QuizResultScreen(),
        // ),
        // GoRoute(
        //   path: QuizReviewAnsScreen.routeName,
        //   builder: (context, state) => const QuizReviewAnsScreen(),
        // ),
        // GoRoute(
        //   path: QuizSubmitScreen.routeName,
        //   pageBuilder: (context, state) => CustomTransitionPage<void>(
        //     key: state.pageKey,
        //     child: const QuizSubmitScreen(),
        //     transitionsBuilder: (BuildContext context,
        //             Animation<double> animation,
        //             Animation<double> secondaryAnimation,
        //             Widget child) =>
        //         SlideTransition(
        //       position: animation.drive(
        //         Tween(
        //           begin: const Offset(1, 0),
        //           end: Offset.zero,
        //         ).chain(
        //           CurveTween(curve: Curves.easeIn),
        //         ),
        //       ),
        //       child: child,
        //     ),
        //   ),
        // ),
        // GoRoute(
        //   path: ReviewScreen.routeName,
        //   builder: (context, state) => const ReviewScreen(),
        // ),
        // GoRoute(
        //   path: CartScreen.routeName,
        //   builder: (context, state) => CartScreen(),
        // ),
      ];
  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );
}
