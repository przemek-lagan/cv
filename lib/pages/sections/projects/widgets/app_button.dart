part of '../projects.dart';

class _AppButton extends StatelessWidget {
  final String appUrl;

  const _AppButton(this.appUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
      ),
      onPressed: () async => await launchUrlString(appUrl),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(t!.projects_app_button),
      ),
    );
  }
}
