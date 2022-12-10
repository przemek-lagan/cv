part of '../projects.dart';

class _Gallery extends StatelessWidget {
  final String path;
  final int count;
  const _Gallery({
    required this.path,
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 1; index <= count; index++)
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _GalleryDialog(
                        path: path, count: count, initialIndex: index);
                  }),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).disabledColor, width: 2),
                  ),
                  child: Image.asset(
                    'assets/$path/${index.toString()}.jpg',
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _GalleryDialog extends StatefulWidget {
  final String path;
  final int count;
  final int initialIndex;
  const _GalleryDialog({
    required this.path,
    required this.count,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<_GalleryDialog> createState() => __GalleryDialogState();
}

class __GalleryDialogState extends State<_GalleryDialog> {
  int? index;

  @override
  void initState() {
    index = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 32.0),
      contentPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Row(
        // alignment: Alignment.center,
        // clipBehavior: Clip.none,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          IconButton(
            padding: const EdgeInsets.only(left: 8),
            onPressed: () => setState(() => index =
                index == 1 ? widget.count : (index ?? widget.initialIndex) - 1),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Image.asset('assets/screenshots/project2/$index.jpg'),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.cancel_outlined,
                  size: 32,
                ),
              ),
            ],
          )),
          const SizedBox(width: 16),
          IconButton(
            padding: const EdgeInsets.only(left: 8),
            onPressed: () => setState(() => index =
                index == widget.count ? 1 : (index ?? widget.initialIndex) + 1),
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}