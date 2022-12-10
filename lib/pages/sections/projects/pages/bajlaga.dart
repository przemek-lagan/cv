// part of '../projects.dart';

// class Bajlaga extends StatelessWidget {
//   const Bajlaga({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const _Bajlaga();
//   }
// }

// class _Bajlaga extends StatelessWidget {
//   const _Bajlaga({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CoreCubit, CoreState>(
//       builder: (context, coreState) {
//         return Scaffold(
//           appBar: AppBar(
//             actions: [
//               IconButton(
//                   onPressed: () =>
//                       context.read<CoreCubit>().setActiveSubpage(null),
//                   icon: const Icon(Icons.arrow_back)),
//               const Spacer(),
//             ],
//           ),
//           body: const _BajlagaContent(),
//         );
//       },
//     );
//   }
// }

// class _BajlagaContent extends StatelessWidget {
//   const _BajlagaContent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

// YoutubePlayerController controller = YoutubePlayerController(
//     initialVideoId: 'K18cpp_-gP8',
//     params: const YoutubePlayerParams(
//         playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
//         startAt: Duration(seconds: 30),
//         showControls: true,
//         showFullscreenButton: true,
//     ),
// );

//     var t = AppLocalizations.of(context);

//     PageLayout pageLayout = context.read<CoreCubit>().state.pageLayout;
//     return Center(
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 16,
//             ),
//             YoutubePlayerIFrame(
//     controller: controller,
//     aspectRatio: 16 / 9,
// ),
//             Text(
//               '${t!.projects_2_demo1}:',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Text(
//               '${t.projects_2_demo1}:',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             Wrap(
//               crossAxisAlignment: WrapCrossAlignment.center,
//               alignment: WrapAlignment.center,
//               runAlignment: WrapAlignment.center,
//               children: ['01', '02', '03', '04', '05']
//                   .map((name) => Container(
//                         margin: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               color: Theme.of(context).disabledColor, width: 2),
//                         ),
//                         child: Image.asset(
//                           'assets/screenshots/project2/$name.jpg',
//                           width: 400,
//                         ),
//                       ))
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
