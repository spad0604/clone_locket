import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/home_page_controller/home_page_controller.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/root_home_page_controller/root_home_page_controller.dart';

import '../../../../authentication/presentation/controllers/login/login_controller.dart';

class HomePageView extends BaseGetView<HomePageController> {
  final rootHomePageController = Get.find<RootHomePageController>();

  final loginController = Get.find<LoginController>();

  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorName.blackBgr,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Obx(
        () => PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.imageModel.length,
                  itemBuilder: (context, index) {
                    return controller.imageModel.isNotEmpty
                        ? BuildImage(
                            imageUrl: controller.imageModel[index].imageUrl ??
                                'https://cdn-icons-png.flaticon.com/512/10278/10278187.png',
                            userName: controller.imageModel[index].account ==
                                    loginController
                                        .emailTextEditingController.text
                                ? 'Bạn'
                                : (controller.imageModel[index].account ??
                                    'User'),
                            userAvatar: controller.imageModel[index].account ==
                                    loginController
                                        .emailTextEditingController.text
                                ? null
                                : controller.avatarUrl(
                                    controller.imageModel[index].account ?? ''),
                          )
                        : SizedBox(
                            height: Get.width,
                            width: Get.width,
                          );
                  },
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: ColorName.gray343,
                          ),
                          child: TextField(
                            controller: TextEditingController(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Gửi tin nhắn...',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.toGridImagePage();
                              },
                              child: Assets.images.menuIc.image(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                            ),
                            CircleCapture(
                              onTapCapture:
                                  rootHomePageController.jumpToFirstPage,
                            ),
                            Assets.images.infoIc.image(
                              height: 30,
                              width: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildImage extends StatelessWidget {
  final String imageUrl;
  final String? userAvatar;
  final String userName;

  const BuildImage(
      {required this.imageUrl,
      required this.userAvatar,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height -
          MediaQuery.of(context).padding.top -
          MediaQuery.of(context).padding.bottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: SizedBox(
                height: Get.width,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                )),
          )),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: userAvatar != null
                      ? ClipOval(
                          child: Image.network(
                            userAvatar ?? '',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  userName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget circleAvatar({required String url, required bool isOnline}) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), color: ColorName.gray343),
    child: Center(
      child: isOnline == false
          ? Image.asset(
              color: Colors.white,
              url,
              width: 30,
              height: 30,
            )
          : ClipOval(
              child: Image.network(
                url,
                width: 30,
                height: 30,
              ),
            ),
    ),
  );
}

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final HomePageController controller = Get.find();

  String selectedValue = 'Tất cả bạn bè';

  @override
  Widget build(BuildContext context) {
    if (!controller.listFriend.contains('Tất cả bạn bè')) {
      controller.listFriend.insert(0, 'Tất cả bạn bè');
    }

    return Center(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: ColorName.gray343,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue,
            items: controller.listFriend
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: selectedValue == item
                          ? Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    controller.avatarUrl(item),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Center(
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        controller.avatarUrl(item),
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      item,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
                controller.selectedValue.value = value;
                controller.getHistory();
              });
            },
            icon: const Icon(Icons.keyboard_arrow_down_outlined,
                color: Colors.white),
            dropdownColor: ColorName.gray343,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            alignment: Alignment.centerLeft,
            isDense: true,
            menuMaxHeight: 200,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class CircleCapture extends StatelessWidget {
  Function()? onTapCapture;

  CircleCapture({super.key, required this.onTapCapture});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCapture!.call();
      },
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ColorName.yellow5b9),
          child: Center(
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: ColorName.blackBgr),
              child: Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                ),
              ),
            ),
          )),
    );
  }
}
