import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:lottie/lottie.dart';

class StarMyTransitions extends StatefulWidget {
  const StarMyTransitions({super.key});

  @override
  State<StarMyTransitions> createState() => _StarMyTransitionsState();
}

class _StarMyTransitionsState extends State<StarMyTransitions>
    with TickerProviderStateMixin {
  String? _selectedDefault = 'fade';
  List<String> _selectedCustomAnimations = [];
  bool _isAnimationPlaying = false;
  bool _handAnimationPlaying = false;
  bool _loopAnimationPlaying = false;
  late AnimationController _animationController;
  late AnimationController _handAnimationController;
  late AnimationController _loopAnimationController;
  late DateTime _animationStartTime;

  final List<Map<String, dynamic>> defaultAnimations = [
    {'id': 'fade', 'name': 'Fade', 'icon': Icons.opacity},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && _isAnimationPlaying) {
        final elapsed = DateTime.now().difference(_animationStartTime);
        if (elapsed.inSeconds < 10) {
          _animationController.reset();
          _animationController.forward();
        } else {
          setState(() {
            _isAnimationPlaying = false;
          });
        }
      }
    });

    _handAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _handAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && _handAnimationPlaying) {
        final elapsed = DateTime.now().difference(_animationStartTime);
        if (elapsed.inSeconds < 8) {
          _handAnimationController.reset();
          _handAnimationController.forward();
        } else {
          setState(() {
            _handAnimationPlaying = false;
          });
        }
      }
    });
    _loopAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _loopAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && _loopAnimationPlaying) {
        final elapsed = DateTime.now().difference(_animationStartTime);
        if (elapsed.inSeconds < 10) {
          _loopAnimationController.reset();
          _loopAnimationController.forward();
        } else {
          setState(() {
            _loopAnimationPlaying = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _handAnimationController.dispose();
    _loopAnimationController.dispose();
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
          "My Transitions",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selected Animations Display at Top
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: const Border.fromBorderSide(
                  BorderSide(color: kgoldColor, width: 2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Animations',
                    style: TextStyle(
                      color: kgoldColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // if (_selectedDefault != null)
                  Text(
                    'Default: ${_selectedDefault != null ? "Dots" : 'None'}',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: 12,
                    ),
                  ),

                  Text(
                    'Custom: ${_selectedCustomAnimations.isNotEmpty ? _selectedCustomAnimations.join(', ') : 'None'}',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Default Transition Animation Header
            Text(
              'Default Transition Animation',
              style: TextStyle(
                color: kgoldColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // Default Animation - Lottie with Play Button
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: const Border.fromBorderSide(
                      BorderSide(color: kgoldColor, width: 2),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Lottie.asset(
                          'assets/dots.json',
                          fit: BoxFit.contain,
                          controller: _animationController,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _selectedDefault == 'fade',
                            onChanged: (_) {
                              setState(() {
                                _selectedDefault = _selectedDefault == 'fade'
                                    ? null
                                    : 'fade';
                              });
                            },
                            activeColor: kgoldColor,
                          ),
                          Text(
                            'Dots Animation',
                            style: TextStyle(
                              color: isDark ? Colors.white : Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: TextButton.icon(
                    onPressed: _isAnimationPlaying
                        ? null
                        : () {
                            setState(() {
                              _isAnimationPlaying = true;
                              _animationStartTime = DateTime.now();
                              _animationController.reset();
                              _animationController.forward();
                            });
                          },
                    style: TextButton.styleFrom(
                      side: BorderSide(
                        color: _isAnimationPlaying ? kgreyColor : kgoldColor,
                        width: 1.5,
                      ),
                      foregroundColor: kgoldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Icon(
                      Icons.play_arrow,
                      color: _isAnimationPlaying ? kgreyColor : kgoldColor,
                    ),
                    label: Text(
                      "Preview",
                      style: TextStyle(
                        color: _isAnimationPlaying ? kgreyColor : kgoldColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Custom Transition Animation Header
            Text(
              'Add Custom Transition Animations',
              style: TextStyle(
                color: kgoldColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // Custom Animations - Lottie Cards
            SizedBox(
              height: 220,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Card 1: Loading Hand
                    Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 210,
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: isDark
                                ? Colors.grey.shade900
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: const Border.fromBorderSide(
                              BorderSide(color: kgoldColor, width: 2),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Lottie.asset(
                                    'assets/loading_hand.json',
                                    fit: BoxFit.contain,
                                    controller: _handAnimationController,
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: _selectedCustomAnimations.contains(
                                  'hand',
                                ),
                                onChanged: (bool? value) {
                                  if (!mounted) return;
                                  setState(() {
                                    try {
                                      if (value == true) {
                                        if (!_selectedCustomAnimations.contains(
                                          'hand',
                                        )) {
                                          _selectedCustomAnimations.add('hand');
                                        }
                                      } else {
                                        _selectedCustomAnimations.removeWhere(
                                          (item) => item == 'hand',
                                        );
                                      }
                                    } catch (e) {
                                      print('Error updating checkbox: $e');
                                    }
                                  });
                                },
                                activeColor: kgoldColor,
                              ),
                              Text(
                                'Hand',
                                style: TextStyle(
                                  color: isDark ? Colors.white : Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          right: 17,
                          top: 10,
                          child: GestureDetector(
                            onTap: _handAnimationPlaying
                                ? null
                                : () {
                                    setState(() {
                                      _handAnimationPlaying = true;
                                      _animationStartTime = DateTime.now();
                                      _handAnimationController.reset();
                                      _handAnimationController.forward();
                                    });
                                  },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey.shade900
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.fromBorderSide(
                                  BorderSide(
                                    color: _handAnimationPlaying
                                        ? kgreyColor
                                        : kgoldColor,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: _handAnimationPlaying
                                      ? kgreyColor
                                      : kgoldColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          top: 10,
                          child: GestureDetector(
                            onTap: () {
                              showCupertinoDialog(
                                context: context,
                                builder: (_) => CupertinoTheme(
                                  data: CupertinoThemeData(
                                    brightness: isDark
                                        ? Brightness.dark
                                        : Brightness.light,
                                    primaryColor: kgoldColor,
                                  ),
                                  child: CupertinoAlertDialog(
                                    title: Text(
                                      "Delete Transition",
                                      style: TextStyle(
                                        color: kgoldColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Text(
                                      "Are you sure you want to delete this transition?",
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.white70
                                            : Colors.black54,
                                      ),
                                    ),
                                    actions: [
                                      CupertinoDialogAction(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black,
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
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey.shade900
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: const Border.fromBorderSide(
                                  BorderSide(color: kgoldColor, width: 1.5),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.delete_outline_outlined,
                                  color: kgoldColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Card 2: Loading Loop
                    Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 210,
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: isDark
                                ? Colors.grey.shade900
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: const Border.fromBorderSide(
                              BorderSide(color: kgoldColor, width: 2),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Lottie.asset(
                                    'assets/Loading_loop.json',
                                    fit: BoxFit.contain,
                                    controller: _loopAnimationController,
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: _selectedCustomAnimations.contains(
                                  'loop',
                                ),
                                onChanged: (bool? value) {
                                  if (!mounted) return;
                                  setState(() {
                                    try {
                                      if (value == true) {
                                        if (!_selectedCustomAnimations.contains(
                                          'loop',
                                        )) {
                                          _selectedCustomAnimations.add('loop');
                                        }
                                      } else {
                                        _selectedCustomAnimations.removeWhere(
                                          (item) => item == 'loop',
                                        );
                                      }
                                    } catch (e) {
                                      print('Error updating checkbox: $e');
                                    }
                                  });
                                },
                                activeColor: kgoldColor,
                              ),
                              Text(
                                'Loop',
                                style: TextStyle(
                                  color: isDark ? Colors.white : Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          right: 17,
                          top: 10,
                          child: GestureDetector(
                            onTap: _loopAnimationPlaying
                                ? null
                                : () {
                                    setState(() {
                                      _loopAnimationPlaying = true;
                                      _animationStartTime = DateTime.now();
                                      _loopAnimationController.reset();
                                      _loopAnimationController.forward();
                                    });
                                  },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey.shade900
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.fromBorderSide(
                                  BorderSide(
                                    color: _loopAnimationPlaying
                                        ? kgreyColor
                                        : kgoldColor,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: _loopAnimationPlaying
                                      ? kgreyColor
                                      : kgoldColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          top: 10,
                          child: GestureDetector(
                            onTap: () {
                              showCupertinoDialog(
                                context: context,
                                builder: (_) => CupertinoTheme(
                                  data: CupertinoThemeData(
                                    brightness: isDark
                                        ? Brightness.dark
                                        : Brightness.light,
                                    primaryColor: kgoldColor,
                                  ),
                                  child: CupertinoAlertDialog(
                                    title: Text(
                                      "Delete Transition",
                                      style: TextStyle(
                                        color: kgoldColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Text(
                                      "Are you sure you want to delete this transition?",
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.white70
                                            : Colors.black54,
                                      ),
                                    ),
                                    actions: [
                                      CupertinoDialogAction(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black,
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
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey.shade900
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: const Border.fromBorderSide(
                                  BorderSide(color: kgoldColor, width: 1.5),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.delete_outline_outlined,
                                  color: kgoldColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Card 3: Add New Button
                    Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.grey.shade900
                            : Colors.grey.shade100,
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
                            'Add New',
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
          ],
        ),
      ),
    );
  }
}
