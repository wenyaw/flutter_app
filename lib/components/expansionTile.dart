import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//两级或多级列表。
class expansionTile extends StatelessWidget {
  var data;
  @override
  Widget build(BuildContext context) {
    _addDatas();
    return new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            expansionTileState(data[index]),
        itemCount:data == null ? 0 : data.length);
  }

  _addDatas() {
    final List<Entry> list = <Entry>[
      new Entry('title1', <Entry>[
        new Entry('子级title1', <Entry>[
          new Entry('子级的子级title1'),
          new Entry('子级的子级title2'),
          new Entry('子级的子级title3', <Entry>[Entry('子级的子级的子级')]),
          new Entry('子级的子级title4')
        ])
      ]),
      new Entry('title2', <Entry>[
        new Entry('子级title1',
            <Entry>[new Entry('子级的子级title1'), new Entry('子级的子级title2')]),
        new Entry('子级title2')
      ]),
      new Entry('title3')
    ];
    data = list;
  }
}

class expansionTileState extends StatelessWidget {
  const expansionTileState(this.entry);

  final Entry entry;

  Widget _buildTils(Entry item) {
    if (item.children.isEmpty)
      return new GestureDetector(
        child: new ListTile(title: new Text(item.title)),
        onTap: () {
          print("点击了${item.title}");
        },
      );
    return new ExpansionTile(
      title: new GestureDetector(
        child: new Text(item.title),
        onTap: () {
          print("点击了${item.title}");
        },
      ),
      children: item.children.map(_buildTils).toList(),
      initiallyExpanded: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTils(entry);
  }
}

//实体类
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}
