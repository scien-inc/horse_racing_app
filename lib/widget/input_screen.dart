import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class InputOverlay extends StatefulWidget {
  @override
  _InputOverlayState createState() => _InputOverlayState();
}

class _InputOverlayState extends State<InputOverlay> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // ... [以前のウィジェットを維持]
            // 開催日時の入力フィールド
            buildDateField(context),
            // ... [他のプルダウンメニューと入力フィールド]
            
            buildLocationAndRaceFields(context),
            buildRaceAndClasses(context),
            buildCourseAndDistance(context),
            buildNumberInputField(''),
            buildGrayInputField('メモ', maxLines: 6),
            buildFavoriteButton(),
            buildSaveButton(),
            
          ],
        ),
      ),
    );
  }

  Widget buildDateField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: TextFormField(
            controller: dateController,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.calendar_today),// move to right
              labelText: '開催日時',
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
  // レースの選択肢
final List<String> races = ['1R', '2R', '3R', '4R', '5R', '6R', '7R', '8R', '9R', '10R', '11R', '12R'];
final List<String> classes = ['G1', 'G2', 'G3', 'OP', '1600万下', '1000万下', '500万下', '未勝利', '新馬', '未出走'];
final List<String> courses = ['芝', 'ダート', '障害'];
final List<String> distances = ['1000m', '2000m', '3000m', '4000m', '5000m', '6000m', '7000m', '8000m', '9000m', '10000m', '11000m', '12000m', '13000m', '14000m', '15000m', '16000m', '17000m', '18000m', '19000m', '20000m', '21000m', '22000m', '23000m', '24000m', '25000m', '26000m', '27000m', '28000m', '29000m', '30000m', '31000m', '32000m', '33000m', '34000m', '35000m', '36000m', '37000m', '38000m', '39000m', '40000m', '41000m', '42000m', '43000m', '44000m', '45000m', '46000m', '47000m', '48000m', '49000m', '50000m', '51000m', '52000m', '53000m', '54000m', '55000m', '56000m', '57000m', '58000m', '59000m', '60000m', '61000m', '62000m', '63000m', '64000m', '65000m', '66000m', '67000m', '68000m', '69000m', '70000m', '71000m', '72000m', '73000m', '74000m', '75000m', '76000m', '77000m', '78000m', '79000m', '80000m', '81000m', '82000m', '83000m', '84000m', '85000m', '86000m', '87000m', '88000m', '89000m', '90000m', '91000m', '92000m', '93000m', '94000m', '95000m', '96000m', '97000m', '98000m', '99000m', '100000m', '101000m', '102000m',];


Widget buildLocationAndRaceFields(BuildContext context) {
  const double desiredHeight = 70;

  return Row(
    children: <Widget>[
      // 開催場所のフィールド
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '    '+'開催場所',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: 5),
            Container(
              height: desiredHeight,
              child: buildInputField(
                '',  // 入力フィールドのラベルを削除
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 10),
      // レースのドロップダウンフィールド
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '    '+'レース',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: 5),
            Container(
              height: desiredHeight,
              child: buildDropdownField(
                races,
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildRaceAndClasses(BuildContext context) {
  const double desiredHeight = 70;

  return Row(
    children: <Widget>[
      // 開催場所のフィールド
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '    '+'レース名',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: 5),
            Container(
              height: desiredHeight,
              child: buildInputField(
                '',  // 入力フィールドのラベルを削除
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 10),
      // レースのドロップダウンフィールド
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '    '+'クラス',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: 5),
            Container(
              height: desiredHeight,
              child: buildDropdownField(
                classes,
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildCourseAndDistance(BuildContext context) {
  const double desiredHeight = 70;

  return Row(
    children: <Widget>[
      // 開催場所のフィールド
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '    '+'コース',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: 5),
            Container(
              height: desiredHeight,
              child: buildDropdownField(
                courses,
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 10),
      // レースのドロップダウンフィールド
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '    '+'距離',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: 5),
            Container(
              height: desiredHeight,
              child: buildDropdownField(
                distances,
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
Widget buildNumberInputField(String hint, {double borderRadius = 10.0}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 10, bottom: 0),
        child: Text('購入金額', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)), // ラベル追加
      ),
      Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hint,
            prefixText: '¥ ', // ¥マークをプレフィックスとして追加
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // 数値のみの入力を許可
          ],
        ),
      ),
    ],
  );
}







// 共通の文字入力フィールド構築メソッド
Widget buildInputField(String hint, {double borderRadius = 0}) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: TextField(
      decoration: InputDecoration.collapsed(hintText: hint),
    ),
  );
}

// プルダウンメニュー構築メソッド
Widget buildDropdownField(List<String> items, {double borderRadius = 0}) {
  String selectedValue = items.first; // デフォルト値を最初の項目に設定
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      isExpanded: true,
    ),
  );
}


  Widget buildGrayInputField(String hint, {int maxLines = 1}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration.collapsed(hintText: hint),
      ),
    );
  }

  Widget buildFavoriteButton() {
  return Container(
    width: 380.0,  // コンテナの幅を設定
    height: 40.0,  // コンテナの高さを設定
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black54, width: 2),  // 枠線の色とスタイル
      borderRadius: BorderRadius.circular(10),  // 枠の角を丸くする
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,  // 要素を中央揃えにする
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {
            // お気に入りに追加する処理
          },
        ),
        Text('お気に入りに追加する'),  // テキストを追加
      ],
    ),
  );
}




  //botton widget
  Widget buildSaveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black54,
        onPrimary: Colors.white,
        minimumSize: Size(380, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        // 入力内容を保存する処理
      },
      child: Text('保存する'),
    );
  }
}
