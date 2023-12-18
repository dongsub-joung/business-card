import 'package:flutter/material.dart';

class ScreenComment extends StatefulWidget {
  @override
  _ScreenCommentState createState() => _ScreenCommentState();
}

class _ScreenCommentState extends State<ScreenComment> {
  final List<String> listing = [
    'Build My website(nginx + Front)',
    'Write the todo code(diesel + postgresql)',
    'cargo publish todo app'
  ];

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
                    (context, index) =>
                        ListTile(title: Text('${listing[index]}')),
                    childCount: listing.length,
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
            onPressed: () {
              String enteredText = _commentController.text;
              // Use enteredText where needed, e.g., send to a database, display, etc.
              print('Entered text: $enteredText');

              // Clear the TextField after retrieving the text
              _commentController.clear();
            },
          ),
        ],
      ),
    );
  }
}
