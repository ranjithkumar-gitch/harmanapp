import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarMyAvatar extends StatefulWidget {
  const StarMyAvatar({super.key});

  @override
  State<StarMyAvatar> createState() => _StarMyAvatarState();
}

class _StarMyAvatarState extends State<StarMyAvatar> {
  Set<int> selectedAvatarIndices = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          "My Avatar",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildAvatarCard(
                context,
                "assets/kohli_ai.png",
                "Avatar 1",
                isDark,
                0,
              ),
              const SizedBox(height: 16),
              _buildAvatarCard(
                context,
                "assets/kohli_ai2.png",
                "Avatar 2",
                isDark,
                1,
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: const Border.fromBorderSide(
                    BorderSide(color: kgoldColor, width: 2),
                  ),
                ),
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: kgoldColor),
                    label: Text(
                      'Add New Avatar',
                      style: const TextStyle(
                        color: kgoldColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarCard(
    BuildContext context,
    String imagePath,
    String name,
    bool isDark,
    int index,
  ) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: const Border.fromBorderSide(
              BorderSide(color: kgoldColor, width: 2),
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isDark ? kblackColor : Colors.grey[100],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: kgoldColor,
                            size: 48,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: isDark ? kwhiteColor : kblackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          selectedAvatarIndices.contains(index)
                              ? 'Active'
                              : 'Inactive',
                          style: TextStyle(
                            color: selectedAvatarIndices.contains(index)
                                ? kgoldColor
                                : (isDark
                                      ? Colors.grey[400]
                                      : Colors.grey[600]),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 12),
                        CupertinoSwitch(
                          value: selectedAvatarIndices.contains(index),
                          onChanged: (value) {
                            _showAvatarDialog(context, isDark, value, index);
                          },
                          activeColor: kgoldColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: TextButton.icon(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (_) => CupertinoTheme(
                  data: CupertinoThemeData(
                    brightness: isDark ? Brightness.dark : Brightness.light,
                    primaryColor: kgoldColor,
                  ),
                  child: CupertinoAlertDialog(
                    title: Text(
                      "Delete Avatar",
                      style: TextStyle(
                        color: kgoldColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      "Are you sure you want to delete this avatar?",
                      style: TextStyle(
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: kgoldColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            style: TextButton.styleFrom(
              side: BorderSide(color: kgoldColor, width: 1.5),
              foregroundColor: kgoldColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(Icons.delete, color: kgoldColor),
            label: Text("Delete", style: TextStyle(color: kgoldColor)),
          ),
        ),
      ],
    );
  }

  void _showAvatarDialog(
    BuildContext context,
    bool isDark,
    bool value,
    int index,
  ) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primaryColor: kgoldColor,
        ),
        child: CupertinoAlertDialog(
          title: Text(
            value ? "Activate Avatar" : "Inactivate Avatar",
            style: const TextStyle(
              color: kgoldColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            value
                ? "Do you want this avatar to Activate?"
                : "Do you want this avatar to Inactivate?",
            style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
            ),
            CupertinoDialogAction(
              isDestructiveAction: !value,
              onPressed: () {
                setState(() {
                  if (value) {
                    selectedAvatarIndices.add(index);
                  } else {
                    selectedAvatarIndices.remove(index);
                  }
                });
                Navigator.pop(context);
              },
              child: Text("Confirm", style: TextStyle(color: kgoldColor)),
            ),
          ],
        ),
      ),
    );
  }
}
