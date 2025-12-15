import 'package:flutter/material.dart';

class PurchaseDialog extends StatefulWidget {
  final String? tierName;
  final String? price;

  const PurchaseDialog({
    Key? key,
    this.tierName = 'Premium Tier',
    this.price = '\$9.99',
  }) : super(key: key);

  @override
  State<PurchaseDialog> createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends State<PurchaseDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: const Color(0xFF1a1a1a),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tier Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.tierName == "Gold Tier"
                          ? 'assets/screenshots/gold.png'
                          : widget.tierName == "Silver Tier"
                          ? 'assets/screenshots/silver.png'
                          : widget.tierName == "Bronze Tier"
                          ? 'assets/screenshots/bronze.png'
                          : 'assets/screenshots/gold.png',
                      width: 32,
                      height: 32,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.tierName ?? 'Premium Tier',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Price
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: widget.tierName == "Gold Tier"
                        ? Color(0xFFFFD700).withOpacity(0.1)
                        : widget.tierName == "Silver Tier"
                        ? Color(0xFFC0C0C0).withOpacity(0.1)
                        : widget.tierName == "Bronze Tier"
                        ? Color(0xFFCD7F32).withOpacity(0.1)
                        : Color(0xFFFFD700).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: widget.tierName == "Gold Tier"
                          ? Color(0xFFFFD700).withOpacity(0.1)
                          : widget.tierName == "Silver Tier"
                          ? Color(0xFFC0C0C0).withOpacity(0.1)
                          : widget.tierName == "Bronze Tier"
                          ? Color(0xFFCD7F32).withOpacity(0.1)
                          : Color(0xFFFFD700).withOpacity(0.1),
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    widget.price ?? '\$9.99',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Purchase Now Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      // Close with animation
                      await _animationController.reverse();
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      'Purchase Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Cancel Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white30, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      // Close with animation
                      await _animationController.reverse();
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
