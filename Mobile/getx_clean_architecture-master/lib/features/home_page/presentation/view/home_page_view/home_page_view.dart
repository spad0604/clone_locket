import 'package:jbbase_app/base/base.dart';
import 'package:jbbase_app/features/home_page/presentation/controller/home_page_controller/home_page_controller.dart';

class HomePageView extends BaseGetView<HomePageController> {
  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorName.blackBgr,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circleAvatar(
                          url:
                              'https://avatars.githubusercontent.com/u/179314473?v=4',
                          isOnline: true),
                      CustomDropdown(),
                      circleAvatar(
                          url: Assets.images.chatIc.path, isOnline: false)
                    ],
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Obx(() => ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Container(
                              height: Get.width,
                              width: double.infinity,
                              child: controller.imageModel.value != null
                                  ? Image.network(
                                      controller.imageModel.value!.imageUrl ??
                                          'https://avatars.githubusercontent.com/u/179314473?v=4',
                                      fit: BoxFit
                                          .cover,
                                    )
                                  : SizedBox(),
                            ),
                          )),
                    ),
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
                            child: ClipOval(
                              child: Image.network(
                                'https://avatars.githubusercontent.com/u/179314473?v=4',
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'User',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: ColorName.gray343),
                        child: TextField(
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Gửi tin nhắn...',
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Assets.images.menuIc.image(
                              height: 30, width: 30, color: Colors.white),
                          const CircleCapture(),
                          Assets.images.infoIc
                              .image(height: 30, width: 30, color: Colors.white)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
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
  String selectedValue = 'Tất cả bạn bè';

  @override
  Widget build(BuildContext context) {
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
            items: const [
              DropdownMenuItem(
                value: 'Tất cả bạn bè',
                child: Text(
                  'Tất cả bạn bè',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Bạn thân',
                child: Text(
                  'Bạn thân',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Gia đình',
                child: Text(
                  'Gia đình',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
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
  const CircleCapture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
