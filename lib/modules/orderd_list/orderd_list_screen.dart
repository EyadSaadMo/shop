import 'package:flutter/material.dart';
class ReorderList extends StatefulWidget {
  const ReorderList({Key? key}) : super(key: key);

  @override
  _ReorderListState createState() => _ReorderListState();
}

class _ReorderListState extends State<ReorderList> {
  List<String>? _list = [
    'List Item 1',
    'List Item 2',
    'List Item 3',
    'List Item 4',
    'List Item 5',
    'List Item 6',
    'List Item 7',
    'List Item 8',
    'List Item 9',
    'List Item 11',
    'List Item 12',
    'List Item 13',
    'List Item 14',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Reorderable list'),
        centerTitle: true,
      ),
      body: ReorderableListView(
        children: _list!.map((item) => ListTile(key: Key('${item}'), title: Text('${item}',style: TextStyle(fontSize: 22.0),), trailing: Icon(Icons.menu,size: 30.0,color: Colors.black,),)).toList(),
        onReorder: (int start, int current) {
          // dragging from top to bottom
          if (start < current) {
            int end = current - 1;
            String startItem = _list![start];
            int i = 0;
            int local = start;
            do {
              _list![local] = _list![++local];
              i++;
            } while (i < end - start);
            _list![end] = startItem;
          }
          // dragging from bottom to top
          else if (start > current) {
            String startItem = _list![start];
            for (int i = start; i > current; i--) {
              _list![i] = _list![i - 1];
            }
            _list![current] = startItem;
          }
          setState(() {});
        },
      ),
    );
  }
}
// Widget buildOrderedItem(OrderedListModel model,context){
//   return  Container(
//     width: double.infinity,
//     height: 50,
//     child: Row(
//       children: [
//         Text('${model.text1}',style: TextStyle(fontSize: 22.0),),
//         Spacer(),
//         Icon(Icons.menu,size: 30.0,),
//       ],
//     ),
//   );
// }
// body: Padding(
//   padding: const EdgeInsets.all(15.0),
//   child: SingleChildScrollView(
//     physics: BouncingScrollPhysics(),
//     child: Column(
//       children: [
//        ListView.separated(
//          shrinkWrap: true,
//            physics: NeverScrollableScrollPhysics(),
//            itemBuilder: (context,index)=> buildOrderedItem(orderedList![index],context),
//            separatorBuilder: (context,index)=>myDivider(),
//            itemCount: orderedList!.length,
//        ),
//         // DragAndDropList(
//         //     orderedList!.length,
//         //     itemBuilder: (context,index)=> buildOrderedItem(orderedList![index],context),
//         //     onDragFinish: (before , after){
//         //       OrderedListModel data = orderedList![before];
//         //       orderedList!.removeAt(before);
//         //       orderedList!.insert(after,data);
//         //     },
//         //   canDrag: (index){
//         //       return index != 4;
//         //   },
//         //   canBeDraggedTo: (one, two) => true,
//         //   dragElevation: 8.0,
//         // ),
//       ],
//     ),
//   ),
// ),