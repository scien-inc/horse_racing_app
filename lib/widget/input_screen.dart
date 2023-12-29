import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
final List<String> races = ['レース1', 'レース2', 'レース3'];

// 開催場所とレースの入力フィールドを構築
Widget buildLocationAndRaceFields(BuildContext context) {
  const double desiredHeight = 70;  // 希望の高さを定数として定義
  return Row(
    children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(
          height: desiredHeight,  // ここで希望の高さを設定
          child: buildInputField(
            '開催場所',
            borderRadius: 10,
          ),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 1,
        child: Container(
          height: desiredHeight,  // ここでも同じ高さを設定
          child: buildDropdownField(
            races,
            borderRadius: 10,
          ),
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
