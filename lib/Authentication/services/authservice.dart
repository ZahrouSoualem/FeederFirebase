import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class AuthToApp extends GetxController {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  get auth => _auth;
  late Rx<User?> _user;
  // to get the data from the private attribute
  User? get user => _user.value;
  // to verify if the user is signed or not
  RxBool isSigned = false.obs;
  // to get the uid of the user
  RxString uid = ''.obs;
  // to login / to signup
  RxBool goto= true.obs;

  bool goTo(){
    goto.value = !goto.value;
    return goto.value;
  }


  @override
  void onReady() {
    // TODO: implement onInit
    super.onReady();
    _user = Rx<User?>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());
    ever(_user, userChangeState);
  }

  void userChangeState(User? user) {
    if (user != null) {
      isSigned(true);
      // final facControoler = Get.put(FavouriteController());
      // facControoler.uid.value= user.uid;
      uid.value = user.uid;
      print('user is not null');
      //return Get.offNamed(DashboardPage.pageName);
      //return isSigned.value;
    } else {
      isSigned(false);
      print('user is null');

      //return Get.offNamed(SignUp.pageName);
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  LogOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Loged out failed');
      return null;
    }
  }
}
