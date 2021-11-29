import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final List<Map> images = [
    {
      'id': 0,
      'image':
          'http://www.winwallpapers.net/w1/2012/11/Download-Mobile-Wallpaper-With-640x480-230.jpg',
    },
    {
      'id': 1,
      'image':
          'http://www.winwallpapers.net/w1/2012/12/Download-Samsung-Galaxy-Mini-wallpaper-640x480-545.jpg',
    },
    {
      'id': 2,
      'image': 'http://wfiles.brothersoft.com/e6/android_189017-640x480.jpg',
    },
    {
      'id': 3,
      'image':
          'http://www.winwallpapers.net/w1/2012/11/Download-Mobile-Wallpaper-With-640x480-4.jpg',
    },
    {
      'id': 4,
      'image': 'http://www.gdargaud.net/Photo/640/20051224_0255_MtCookRoad.jpg',
    },
    {
      'id': 5,
      'image':
          'https://c.tribune.com.pk/2019/09/2068979-sreutersmedia-1569856767-343-640x480.jpg',
    },
    {
      'id': 6,
      'image':
          'https://www.newmusicusa.org/wp-content/uploads/2018/01/15-image_aurora-640x480.jpg',
    },
  ];

  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CarouselScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black54),
            ),
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (selectedPage) {
                  setState(() {
                    currentPage = selectedPage;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, positon) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      FadeInImage(
                        placeholder:
                            const AssetImage('assets/images/placeholder.jpeg'),
                        image: NetworkImage(images[positon]['image']),
                        imageErrorBuilder: (context, obj, error) {
                          return Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: const Text('이미지를 불러 올수 없습니다.'),
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: images.map((image) {
                              return GestureDetector(
                                onTap: () {
                                  currentPage = image[
                                      'id']; // tap을 하면 tap한 id의 위치로 currentPage 셋팅
                                  _pageController.jumpToPage(currentPage);
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width: currentPage == image['id'] ? 16 : 10,
                                  height: currentPage == image['id'] ? 16 : 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(
                                        currentPage == image['id'] ? 8 : 5),
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
          const Divider(
            color: Colors.black54,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black54),
              color: Colors.grey[300],
            ),
            child: Text(
              'Current Page $currentPage',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
