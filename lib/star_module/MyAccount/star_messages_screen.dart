import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/chat_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class StarMessagesScreen extends StatefulWidget {
  const StarMessagesScreen({super.key});

  @override
  State<StarMessagesScreen> createState() => _StarMessagesScreenState();
}

class _StarMessagesScreenState extends State<StarMessagesScreen> {
  int _selectedTab = 0;

  final List<_MessageUser> _stars = const [
    _MessageUser(name: 'Virat Kohli', subtitle: 'Let us plan the next live'),
    _MessageUser(name: 'Shah Rukh Khan', subtitle: 'Thanks for your support'),
    _MessageUser(name: 'Deepika Padukone', subtitle: 'Great collaboration'),
    _MessageUser(name: 'Oprah Winfrey', subtitle: 'See you this weekend'),
  ];

  final List<_MessageUser> _stargazers = const [
    _MessageUser(name: 'Ranjith', subtitle: 'Loved your latest reel'),
    _MessageUser(name: 'Arjun', subtitle: 'Can I get a shoutout?'),
    _MessageUser(name: 'Meera', subtitle: 'Your post was inspiring'),
    _MessageUser(name: 'Ananya', subtitle: 'When is your next session?'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final users = _selectedTab == 0 ? _stars : _stargazers;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          'Messages',
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: kgoldColor),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
            child: Row(
              children: [
                Expanded(
                  child: _tabButton(
                    label: 'Stars',
                    isSelected: _selectedTab == 0,
                    onTap: () => setState(() => _selectedTab = 0),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _tabButton(
                    label: 'Stargazers',
                    isSelected: _selectedTab == 1,
                    onTap: () => setState(() => _selectedTab = 1),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: users.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: isDark ? Colors.white12 : Colors.black12,
              ),
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 4,
                  ),
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: kgoldColor,
                    child: Text(
                      user.name.substring(0, 1),
                      style: const TextStyle(
                        color: kblackColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  title: Text(
                    user.name,
                    style: TextStyle(
                      color: isDark ? kwhiteColor : kblackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    user.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDark ? Colors.white60 : Colors.black54,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: kgoldColor),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(receiverName: user.name),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? kgoldColor
              : (isDark ? Colors.grey.shade900 : Colors.grey.shade100),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kgoldColor, width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? kblackColor
                  : (isDark ? kwhiteColor : kblackColor),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageUser {
  final String name;
  final String subtitle;

  const _MessageUser({required this.name, required this.subtitle});
}
