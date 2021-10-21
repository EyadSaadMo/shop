import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges/models/test_model/news_model.dart';
import 'package:flutter_challenges/shared/component/components.dart';
import 'package:flutter_challenges/shared/cubit/cubit.dart';
import 'package:flutter_challenges/shared/cubit/states.dart';
import 'package:flutter_challenges/shared/style/colors.dart';
import 'package:flutter_challenges/shared/style/icon_broken.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              'Latest News',
              style: GoogleFonts.aclonica(),
            ),
            centerTitle: true,
            leading: Icon(
              IconBroken.Arrow___Left_2,
              color: Colors.black,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  IconBroken.Search,
                  color: Colors.black,
                ),
              ),
              // IconButton(icon: Icon(Icons.brightness_4_outlined), onPressed: () {
              //   AppCubit.get(context).changeAppMode();
              // }),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Swap,
                            color: defaultColor,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('Sort',
                            style: TextStyle(color: Colors.grey),),
                          SizedBox(
                            width: 15.0,
                          ),
                          Icon(IconBroken.More_Circle, color: defaultColor),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Refine',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Spacer(),
                          Icon(IconBroken.More_Square, color: defaultColor),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(IconBroken.Document, color: defaultColor),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.separated(
                  itemBuilder: (context,index)=>buildItem(userModel![index],context),
                  separatorBuilder: (context,index)=> myDivider(),
                  itemCount: userModel!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}

Widget buildItem(NewsLatestModel model,context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: NetworkImage(
                        '${model.image}'
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {

                        },
                        child: Text(
                          'Running',
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Training'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${model.text1}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${model.text2}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'May 20_2021',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        IconBroken.Swap,
                        color: defaultColor,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Logan'),
                      SizedBox(
                        width: 15.0,
                      ),
                      Icon(IconBroken.More_Circle, color: defaultColor),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${model.text3}',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
