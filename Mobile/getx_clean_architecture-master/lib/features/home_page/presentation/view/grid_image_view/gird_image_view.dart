import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/grid_image_controller/grid_image_controller.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/home_page_controller/home_page_controller.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/root_home_page_controller/root_home_page_controller.dart';

import '../home_page_view/home_page_view.dart';

class GridImageView extends BaseGetView<GridImageController> {
  final rootHomePageController = Get.find<RootHomePageController>();

  final homePageController = Get.find<HomePageController>();

  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.blackBgr,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circleAvatar(
                        url:
                        'https://avatars.githubusercontent.com/u/179314473?v=4',
                        isOnline: true,
                      ),
                      CustomDropdown(),
                      circleAvatar(
                        url: Assets.images.chatIc.path,
                        isOnline: false,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Obx(
                      () => GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Số cột trong lưới
                          crossAxisSpacing: 4, // Khoảng cách ngang giữa các mục
                          mainAxisSpacing: 4, // Khoảng cách dọc giữa các mục
                          childAspectRatio: 1, // Tỷ lệ khung hình (hình vuông)
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async{
                              //homePageController.currentPage.value = index;
                              homePageController.pageController.jumpToPage(index);
                              Get.back();
                            },
                            child: Hero(
                              flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                                return FadeTransition(
                                  opacity: animation.drive(
                                    Tween<double>(begin: 0.5, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
                                  ),
                                  child: toHeroContext.widget,
                                );
                              },
                              tag: homePageController.imageModel[index].imageUrl!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  homePageController.imageModel[index].imageUrl ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: homePageController.imageModel.length,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: CircleCapture(
                  onTapCapture: () {
                    rootHomePageController.jumpToFirstPage();
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
