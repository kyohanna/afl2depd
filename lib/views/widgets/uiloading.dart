part of 'widgets.dart';

class Uiloading {
  static Container loading() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Colors.red,
      ),
    );
  }

  static Container loadingDD() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      color: Colors.transparent,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Colors.red,
      ),
    );
  }
}
