import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/network/local/cache_helper.dart';
import 'package:flutter_challenges/core/style/colors.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';
import 'package:flutter_challenges/features/onboarding/presentation/view/splash.dart';
import '../../../../../core/utilis/media_query.dart';
import '../../model/model.dart';
import '../widget/dot_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  void submit() {
    CacheHelper.saveData(
        key: "onBoarding", value: true);
    Navigator.pushReplacementNamed(
        context, SplashView.routeName);
  }
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (value) => setState(() => currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(contents[i].image,height: kHeight(context)/3,),
                        SizedBox(
                          height: (kHeight(context) >= 840) ? 60 : 30,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contents[i].desc,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                          (int index) => BuildDots(
                        index: index,
                        currentPage: currentPage,
                      ),
                    ),
                  ),
                  currentPage + 1 == contents.length
                      ? Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      onPressed: () {
                       CacheHelper.saveData(key: 'onBoarding', value: true);
                        Navigator.pushReplacementNamed(
                            context, SplashView.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: defaultColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: (kWidth(context) <= 550)
                            ? const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20)
                            : EdgeInsets.symmetric(
                            horizontal: kWidth(context) * 0.2,
                            vertical: 25),
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                      child: Text(AppStrings.start),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                           submit();
                          },
                          style: TextButton.styleFrom(
                            elevation: 0,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                              (kWidth(context) <= 550) ? 13 : 17,
                            ),
                          ),
                          child: Text(
                            AppStrings.skip,
                            style: const TextStyle(color: defaultColor,fontSize: 18),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: defaultColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            elevation: 0,
                            padding: (kWidth(context) <= 550)
                                ? const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)
                                : const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 25),
                            textStyle: TextStyle(
                                fontSize:
                                (kWidth(context) <= 550) ? 13 : 17),
                          ),
                          child: const Text(AppStrings.next,style: TextStyle(fontSize: 14),),
                        ),
                      ],
                    ),
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