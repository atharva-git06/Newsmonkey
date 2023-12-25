import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:peta/Widgets/background_image.dart';
import 'package:peta/Widgets/profile_widget.dart';

import '../../Widgets/profilePictureWidget.dart';

class OtherParent_ProfilePage extends StatefulWidget {
  const OtherParent_ProfilePage({Key? key}) : super(key: key);

  @override
  State<OtherParent_ProfilePage> createState() =>
      _OtherParent_ProfilePageState();
}

class _OtherParent_ProfilePageState extends State<OtherParent_ProfilePage> {
  List<String> images = [
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/1/18/Dog_Breeds.jpg',
    'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'susanthegoldenqueen',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          toolbarHeight: 40,
          shadowColor: const Color.fromARGB(0, 0, 0, 0),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),

          // leadingWidth: 50,
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.arrow_back_ios,
          //     color: Colors.white,
          //     size: 20,
          //   ),
          // ),
        ),
        backgroundColor: const Color(0x00000000),
        // appBar: Container(
        //   child: Row(
        //     children: [
        //       const SizedBox(
        //         width: 15,
        //       ),
        //       DropDownList(),
        //       const SizedBox(
        //         width: 15,
        //       ),
        //     ],
        //   ),
        // ),
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildButton(context, '1.3M', 'Followers'),
                          const SizedBox(
                            width: 10,
                          ),
                          const ProfilePictureWidget(
                            imagePath:
                                'https://media.giphy.com/media/2mL0ZiwM4gV9K/giphy.gif',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          buildButton(context, '297K', 'Following'),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                        buildName,
                    ],
                  ),
                ),
              )
            ];
          },
          body: Center(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey.shade500,
                    indicatorColor: Colors.grey.shade500,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.grid_on_rounded),
                      ),
                      Tab(
                        icon: Icon(Icons.pets_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.tag_sharp),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        allUserPosts,
                        allUsersPets,
                        const Center(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get allUsersPets => AlignedGridView.count(
        padding: const EdgeInsets.fromLTRB(0, 7.5, 0, 0),
        crossAxisCount: 3,
        itemCount: images.length,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 0,
        itemBuilder: (_, index) => SizedBox(
          width: (MediaQuery.of(context).size.width / 3) - 15,
          height: (MediaQuery.of(context).size.width / 3) - 15,
          child: CachedNetworkImage(
            imageUrl: images[index],
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) =>
                Container(color: const Color.fromARGB(255, 50, 50, 50)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );

  Widget get allUserPosts => AlignedGridView.count(
        padding: const EdgeInsets.all(0),
        crossAxisCount: 3,
        itemCount: images.length,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        itemBuilder: (_, index) => SizedBox(
          width: (MediaQuery.of(context).size.width / 3),
          height: (MediaQuery.of(context).size.width / 3),
          child: CachedNetworkImage(
            imageUrl: images[index],
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) =>
                Container(color: const Color.fromARGB(255, 50, 50, 50)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );

  // Widget get allUserPosts => AlignedGridView.count(
  //       padding: const EdgeInsets.all(0),
  //       crossAxisCount: 3,
  //       itemCount: images.length,
  //       mainAxisSpacing: 1.0,
  //       crossAxisSpacing: 1.0,
  //       itemBuilder: (_, index) => Container(
  //         color: const Color.fromARGB(255, 54, 54, 54),
  //         child: Image.network(images[index], fit: BoxFit.cover),
  //       ),
  //     );

  Widget get buildName => Center(
        child: Column(
          children: [
            const Text(
              'Bella The Golden Retriever',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60.00,
              child: const Center(
                child: Text(
                  'Don\'t stop retrievin\'. 💛',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 12),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  Widget buildNumberRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButton(context, '5', 'Posts'),
          const SizedBox(height: 24, child: VerticalDivider()),
          buildButton(context, '31', 'Followers'),
          const SizedBox(height: 24, child: VerticalDivider()),
          buildButton(context, '33', 'Following'),
        ],
      );

  Widget buildButton(BuildContext ctx, String number, String numberDesc) =>
      MaterialButton(
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              number,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              numberDesc,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
          ],
        ),
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "About",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'myUser.aboutMe.toString()',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      );
}
