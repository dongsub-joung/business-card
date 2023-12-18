import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


dynamic json_data= "";

class ScreenComment extends StatefulWidget {
  @override
  _ScreenCommentState createState() => _ScreenCommentState();
}

class _ScreenCommentState extends State<ScreenComment> {
  Future<dynamic> fetchComments() async {
    var uri = Uri.https('myapp-api.ngrok.dev', '/comment/all');

    var headers = {
      "Access-Control-Allow-Origin": "*", // Sample header, modify as needed
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var pdfText = json.decode(response.body); // Parsing JSON response
      return pdfText;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                        title: Text('${index}: ${json_data.toString()}')),
                  ),
                ),
              ],
            ),
          ),
          _buildBottomInputBar(),
        ],
      ),
    );
  }

  Widget _buildBottomInputBar() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Enter your comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              String enteredText = _commentController.text;
              var url = Uri.https('myapp-api.ngrok.dev', 'comment/add');
              var data = {'body': '${enteredText}'};
              var body = json.encode(data); // Encode the data to JSON

              var response = await http.post(
                url,
                headers: {
                  'Content-Type': 'application/json'
                }, // Set the headers
                body: body, // Set the encoded JSON data as the request body
              );

              json_data= await fetchComments();
              // Clear the TextField after retrieving the text
              _commentController.clear();
            },
          ),
        ],
      ),
    );
  }
}
