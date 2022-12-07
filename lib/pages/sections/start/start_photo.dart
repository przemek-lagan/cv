part of 'start.dart';

class _StartPhoto extends StatelessWidget {
  final bool dark;
  const _StartPhoto({
    this.dark = false,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: dark
              ? Image.asset(
                  'assets/photos/profile_dark.jpg',
                  key: UniqueKey(),
                )
              : Image.asset('assets/photos/profile_light.jpg',
                  key: UniqueKey())),
    );
  }
}
