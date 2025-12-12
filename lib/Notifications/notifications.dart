import 'package:flutter/material.dart';

enum NotificationType { like, follow, comment, mention }

class InstaNotification {
  final String id;
  final String username;
  final String avatarUrl;
  final String? postImageUrl;
  final NotificationType type;
  final String timeAgo;
  final bool isFollowingBack;

  InstaNotification({
    required this.id,
    required this.username,
    required this.avatarUrl,
    this.postImageUrl,
    required this.type,
    required this.timeAgo,
    this.isFollowingBack = false,
  });
}

class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key? key}) : super(key: key);

  final List<InstaNotification> demoNotifications = List.generate(
    12,
    (i) => InstaNotification(
      id: '$i',
      username: 'user_$i',
      avatarUrl: 'https://picsum.photos/seed/avatar$i/200',
      postImageUrl: i % 3 == 0 ? 'https://picsum.photos/seed/post$i/200' : null,
      type: NotificationType.values[i % NotificationType.values.length],
      timeAgo: '${(i + 1) * 2}h',
      isFollowingBack: i % 4 == 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        elevation: 1,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth >= 600;

          if (isWide) {
            return Row(
              children: [
                Container(
                  width: constraints.maxWidth * 0.45,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: _NotificationsList(
                    demoNotifications: demoNotifications,
                  ),
                ),

                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.notifications_none, size: 72),
                        SizedBox(height: 12),
                        Text(
                          'Select a notification',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'When you select a notification, details (post or profile) will appear here.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return _NotificationsList(demoNotifications: demoNotifications);
        },
      ),
    );
  }
}

class _NotificationsList extends StatelessWidget {
  const _NotificationsList({Key? key, required this.demoNotifications})
    : super(key: key);

  final List<InstaNotification> demoNotifications;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 600));
      },
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: demoNotifications.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          final n = demoNotifications[index];
          return _NotificationTile(notification: n);
        },
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({Key? key, required this.notification})
    : super(key: key);

  final InstaNotification notification;

  Widget _buildTrailing(BuildContext context) {
    switch (notification.type) {
      case NotificationType.follow:
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(96, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(notification.isFollowingBack ? 'Following' : 'Follow'),
        );
      case NotificationType.like:
      case NotificationType.comment:
      case NotificationType.mention:
      default:
        if (notification.postImageUrl != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              notification.postImageUrl!,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          );
        }
        return SizedBox.shrink();
    }
  }

  String _description() {
    switch (notification.type) {
      case NotificationType.follow:
        return 'started following you.';
      case NotificationType.like:
        return 'liked your photo.';
      case NotificationType.comment:
        return 'commented: "Nice shot!"';
      case NotificationType.mention:
        return 'mentioned you in a post.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(notification.avatarUrl),
            ),
            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: notification.username,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(text: ' ${_description()}'),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        notification.timeAgo,
                        style: TextStyle(color: Colors.amber),
                      ),
                      SizedBox(width: 8),
                      // small dot
                      Icon(Icons.circle, size: 6, color: Colors.grey.shade400),
                      SizedBox(width: 8),
                      Text(
                        'View',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: 12),

            _buildTrailing(context),
          ],
        ),
      ),
    );
  }
}

double scaledFontSize(BuildContext context, double base) {
  final scale = MediaQuery.of(context).textScaleFactor;
  return base * scale;
}
