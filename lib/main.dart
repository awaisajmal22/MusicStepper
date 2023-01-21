//@dart=2.9
import 'package:app_xyz/model/getMusicData.dart';
import 'package:app_xyz/screens/album_screen.dart';
import 'package:app_xyz/screens/create_profile_screen.dart';
import 'package:app_xyz/screens/profile_listener_screen.dart';
import 'package:app_xyz/screens/signUp_screen.dart';
import 'package:app_xyz/screens/single_player_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/player_screen.dart';
import 'screens/edit_profile_info_screen.dart';
import 'screens/history_listenerandadmin_screen.dart';
import 'screens/adminandlistner_home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/more_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/upload_screen.dart';
import 'services/firebase_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GetMusicData()),
        ChangeNotifierProvider.value(value: FireBaseFunction())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          ProfileListenerScreen.routeName: (context) => ProfileListenerScreen(),
          UploadMusicScreen.routeName: (context) => UploadMusicScreen(),
          SingleMusicPlayerScreen.routeName: (context) => PlayerScreen(),
          HistoryListenerAndAdminScreen.routeName: (context) =>HistoryListenerAndAdminScreen(),
          MoreScreen.routeName: (context) => MoreScreen(),
          AlbumScreen.routeName: (context) => AlbumScreen(),
          EditProfileInfoScreen.routeName: (context) => EditProfileInfoScreen(),
          CreateProfileScreen.routeName: (context) => CreateProfileScreen()
        },
      ),
    );
  }
}
