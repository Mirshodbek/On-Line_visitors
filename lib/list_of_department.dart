import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:online_visitors/provider.dart';
import 'package:online_visitors/stand_on_line_screen.dart';
import 'package:provider/provider.dart';

class DepartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BrainProvider>(
      builder: (context, brain, child) {
        brain.listData();
        _buildItem(String item) {
          return DragAndDropItem(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StandOnLineScreen(),
                  ),
                );
              },
              title: Text(item),
            ),
          );
        }

        //
        buildList(int outerIndex) {
          var innerList = brain.lists[outerIndex];
          return DragAndDropListExpansion(
            title: Text('${innerList.name}'),
            leading: Image(
              image: AssetImage('images/fb.png'),
            ),
            children: List.generate(innerList.children.length,
                (index) => _buildItem(innerList.children[index])),
            listKey: ObjectKey(innerList),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('On Line\nDepartment'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: DragAndDropLists(
              children: List.generate(
                  brain.lists.length, (index) => buildList(index)),
              onItemReorder: brain.onItemReorder,
              onListReorder: brain.onListReorder,
              listGhost: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(),
              ),
            ),
          ),
        );
      },
    );
  }
}
