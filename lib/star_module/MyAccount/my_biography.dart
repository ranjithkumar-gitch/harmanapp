import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarMyBiography extends StatefulWidget {
  const StarMyBiography({super.key});

  @override
  State<StarMyBiography> createState() => _StarMyBiographyState();
}

class _StarMyBiographyState extends State<StarMyBiography> {
  late TextEditingController _messageController;
  final List<String> _messages = [
    "Hey! Welcome to my biography page.",
    "Here you can share your story and connect with your audience.",
    "I'm a passionate creator dedicated to producing quality content.",
    "My journey has been inspiring and I love sharing experiences with my fans.",
    "Feel free to ask me anything about my work and creative process!",
  ];

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _showUploadDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        title: Text(
          "Upload Files",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? Colors.grey.shade900
                      : Colors.grey.shade100,
                  foregroundColor: isDark ? kgoldColor : kblackColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: kgoldColor, width: 2),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.attach_file),
                label: const Text("Add Documents"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? Colors.grey.shade900
                      : Colors.grey.shade100,
                  foregroundColor: isDark ? kgoldColor : kblackColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: kgoldColor, width: 2),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.image),
                label: const Text("Add Images"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? Colors.grey.shade900
                      : Colors.grey.shade100,
                  foregroundColor: isDark ? kgoldColor : kblackColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: kgoldColor, width: 2),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.video_library),
                label: const Text("Add Videos"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: kgoldColor, size: 18),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "My Biography",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.push_pin, color: kgoldColor),
            onPressed: () => _showUploadDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.grey.shade900
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: const Border.fromBorderSide(
                        BorderSide(color: kgoldColor, width: 2),
                      ),
                    ),
                    child: Text(
                      _messages[index],
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Message Input Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    autofocus: false,
                    style: TextStyle(color: isDark ? kgoldColor : kblackColor),
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: TextStyle(
                        color: isDark ? kgoldColor : kblackColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kgoldColor,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kgoldColor,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kgoldColor,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      filled: true,
                      fillColor: isDark
                          ? Colors.grey.shade900
                          : Colors.grey.shade100,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: const Border.fromBorderSide(
                      BorderSide(color: kgoldColor, width: 2),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: kgoldColor, size: 20),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {
                        setState(() {
                          _messages.add(_messageController.text);
                          _messageController.clear();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
