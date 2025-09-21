import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({Key? key}) : super(key: key);

  @override
  _PortfolioHomeState createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ProjectsPage(),
    const SkillsPage(),
    const ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Desktop layout
            final bool isExtended = constraints.maxWidth > 800;
            return Row(
              children: [
                NavigationRail(
                  extended: isExtended,
                  selectedIndex: _currentIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  // Remove labelType when extended is true
                  labelType: isExtended
                      ? NavigationRailLabelType.none
                      : NavigationRailLabelType.selected,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.work_outline),
                      selectedIcon: Icon(Icons.work),
                      label: Text('Projects'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.psychology_outlined),
                      selectedIcon: Icon(Icons.psychology),
                      label: Text('Skills'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.contact_mail_outlined),
                      selectedIcon: Icon(Icons.contact_mail),
                      label: Text('Contact'),
                    ),
                  ],
                ),
                Expanded(
                  child: _pages[_currentIndex],
                ),
              ],
            );
          } else {
            // Mobile layout
            return Scaffold(
              body: _pages[_currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.work_outline),
                    activeIcon: Icon(Icons.work),
                    label: 'Projects',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.psychology_outlined),
                    activeIcon: Icon(Icons.psychology),
                    label: 'Skills',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.contact_mail_outlined),
                    activeIcon: Icon(Icons.contact_mail),
                    label: 'Contact',
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'ARULNITHI PANNEERSELVAM',
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 4,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/arulnithi.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Flutter Developer',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Building beautiful cross-platform applications',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Text(
              'About Me',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            const Text(
              'I am a passionate Flutter developer with over 3 years of experience creating stunning and performant cross-platform applications. '
              'Specializing in clean architecture, responsive design, and seamless user experiences, I\'ve delivered solutions for clients ranging from startups to established enterprises. '
              'My approach combines technical excellence with an eye for design and a focus on business outcomes.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 32),
            Card(
              elevation: 8,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Services',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 16),
                    const ServiceItem(
                      icon: Icons.phone_android,
                      title: 'Mobile App Development',
                      description:
                          'Complete mobile application development from concept to deployment with Flutter.',
                    ),
                    const Divider(height: 32),
                    const ServiceItem(
                      icon: Icons.desktop_windows,
                      title: 'Web & Desktop Apps',
                      description:
                          'Expand your reach with cross-platform applications that work on web and desktop.',
                    ),
                    const Divider(height: 32),
                    const ServiceItem(
                      icon: Icons.refresh,
                      title: 'App Redesign & Migration',
                      description:
                          'Transform your existing app with modern Flutter UI and improved performance.',
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

class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'My Projects',
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 800
              ? 3
              : (MediaQuery.of(context).size.width > 600 ? 2 : 1),
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(project: projects[index]);
        },
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  int _currentIndex = 0;
  bool _isHovered = false;

  late AnimationController _cardController;
  late AnimationController _hoverController;
  late Animation<double> _cardAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _cardController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // Card entry animation
    _cardAnimation = CurvedAnimation(
      parent: _cardController,
      curve: Curves.easeOutCubic,
    );

    // Hover scale animation
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    // Elevation animation
    _elevationAnimation = Tween<double>(
      begin: 2.0,
      end: 8.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    _startAutoScroll();

    // Start card animation after a small delay
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _cardController.forward();
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    _cardController.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (widget.project.technologies.isEmpty || _isHovered) return;

      _currentIndex = (_currentIndex + 1) % widget.project.technologies.length;

      double scrollPosition = _currentIndex * 88.0;

      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          scrollPosition,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _onHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  void _showSkillsDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AnimatedDialog(
          project: widget.project,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _cardAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, (1 - _cardAnimation.value) * 30),
          child: Opacity(
            opacity: _cardAnimation.value,
            child: MouseRegion(
              onEnter: (_) => _onHover(true),
              onExit: (_) => _onHover(false),
              child: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: _elevationAnimation.value,
                            offset: Offset(0, _elevationAnimation.value / 2),
                            spreadRadius: _isHovered ? 1 : 0,
                          ),
                        ],
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        color: Theme.of(context).colorScheme.surface,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _isHovered
                                  ? Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3)
                                  : Theme.of(context)
                                      .colorScheme
                                      .outline
                                      .withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Animated Image Container
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(_isHovered ? 0.15 : 0.1),
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(
                                              _isHovered ? 0.08 : 0.05),
                                    ],
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    // Placeholder/Error State
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        color: Colors.grey[100],
                                      ),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: Icon(
                                          Icons.code,
                                          size: _isHovered ? 52 : 48,
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    // Try to load image, fallback to placeholder
                                    if (widget.project.imageUrl.isNotEmpty)
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: Image.asset(
                                            widget.project.imageUrl,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                color: Colors.grey[100],
                                                child: Icon(
                                                  Icons
                                                      .image_not_supported_outlined,
                                                  size: 48,
                                                  color: Colors.grey[400],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    // Animated gradient overlay
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(
                                                _isHovered ? 0.15 : 0.1),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Content Container
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Animated Title
                                      AnimatedDefaultTextStyle(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: _isHovered
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                ) ??
                                            const TextStyle(),
                                        child: Text(
                                          widget.project.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      // Description
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          widget.project.description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withOpacity(0.8),
                                                height: 1.5,
                                              ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      // Animated Technologies
                                      Container(
                                        height: 40,
                                        child: ListView.separated(
                                          controller: _scrollController,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: widget
                                              .project.technologies.length,
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(width: 8),
                                          itemBuilder: (context, index) {
                                            final tech = widget
                                                .project.technologies[index];
                                            return AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 6,
                                              ),
                                              decoration: BoxDecoration(
                                                color: _isHovered
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.15)
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .secondaryContainer
                                                        .withOpacity(0.7),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(_isHovered
                                                            ? 0.2
                                                            : 0.1),
                                                    blurRadius:
                                                        _isHovered ? 4 : 3,
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                tech,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall
                                                    ?.copyWith(
                                                      color: _isHovered
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                          : Theme.of(context)
                                                              .colorScheme
                                                              .onSecondaryContainer,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11,
                                                    ),
                                                textAlign: TextAlign.center,
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      // Animated Action Button
                                      Row(
                                        children: [
                                          Expanded(
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              child: OutlinedButton.icon(
                                                onPressed: _showSkillsDialog,
                                                icon: AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 200),
                                                  child: Icon(
                                                    Icons.visibility_outlined,
                                                    size: _isHovered ? 18 : 16,
                                                    color: _isHovered
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : null,
                                                  ),
                                                ),
                                                label: Text(
                                                  'View Skills',
                                                  style: TextStyle(
                                                    color: _isHovered
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : null,
                                                  ),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  side: BorderSide(
                                                    color: _isHovered
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .outline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// Animated Dialog for Skills
class AnimatedDialog extends StatefulWidget {
  final Project project;

  const AnimatedDialog({Key? key, required this.project}) : super(key: key);

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                  maxHeight: 500,
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dialog Header
                    Row(
                      children: [
                        Icon(
                          Icons.code_rounded,
                          color: Theme.of(context).primaryColor,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Technologies & Skills',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                          splashRadius: 20,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Project Title
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),

                    const SizedBox(height: 20),

                    // Animated Skills Grid
                    Flexible(
                      child: widget.project.technologies.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.code_off,
                                    size: 48,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'No technologies listed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.grey[600],
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: widget.project.technologies
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  String tech = entry.value;

                                  return TweenAnimationBuilder<double>(
                                    duration: Duration(
                                        milliseconds: 200 + (index * 50)),
                                    tween: Tween(begin: 0.0, end: 1.0),
                                    builder: (context, value, child) {
                                      return Transform.scale(
                                        scale: value,
                                        child: Opacity(
                                          opacity: value,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.1),
                                                  Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.05),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.2),
                                                width: 1,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 8,
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  tech,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                    ),

                    const SizedBox(height: 24),

                    // Close Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Close'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Alternative: Auto-scroll with pause on hover (for web)
class ProjectCardWithHoverPause extends StatefulWidget {
  final Project project;

  const ProjectCardWithHoverPause({Key? key, required this.project})
      : super(key: key);

  @override
  _ProjectCardWithHoverPauseState createState() =>
      _ProjectCardWithHoverPauseState();
}

class _ProjectCardWithHoverPauseState extends State<ProjectCardWithHoverPause> {
  ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  int _currentIndex = 0;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_isHovered || widget.project.technologies.isEmpty) return;

      _currentIndex = (_currentIndex + 1) % widget.project.technologies.length;

      double scrollPosition = _currentIndex * 112.0; // width + separator

      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          scrollPosition,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _pauseAutoScroll() {
    setState(() {
      _isHovered = true;
    });
  }

  void _resumeAutoScroll() {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _pauseAutoScroll(),
      onExit: (_) => _resumeAutoScroll(),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: Theme.of(context).colorScheme.surface,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Same image container as above...
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      Theme.of(context).primaryColor.withOpacity(0.05),
                    ],
                  ),
                ),
                child: Icon(
                  Icons.code,
                  size: 48,
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                ),
              ),

              // Content with auto-scroll technologies
              Container(
                height: 240,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 60,
                      child: Text(
                        widget.project.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.8),
                              height: 1.5,
                            ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Auto-scrolling technologies with hover pause
                    Container(
                      height: 80,
                      child: ListView.separated(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.project.technologies.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final tech = widget.project.technologies[index];
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 100,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: _isHovered
                                  ? Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.15)
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer
                                      .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  blurRadius: _isHovered ? 6 : 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              tech,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Grid Layout Implementation
class ProjectsGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectsGrid({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive grid columns
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 2;
        }

        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.85, // Adjust based on your content
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: projects[index]);
          },
        );
      },
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String githubUrl;
  final String? demoUrl;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.githubUrl,
    this.demoUrl,
  });
}

final List<Project> projects = [
  const Project(
    title: 'E-Commerce App',
    description:
        'A full-stack e-commerce platform built with Flutter for frontend and Python (FastAPI/Django) for backend. Integrated AWS services including Lambda, S3, CloudFront, API Gateway, DynamoDB, MySQL, and CloudWatch. Authentication and user management handled with AWS Cognito. State managed using Provider.',
    imageUrl: 'assets/images/E-commrace.jpg',
    technologies: [
      'Flutter',
      'Python',
      'AWS Lambda',
      'AWS S3',
      'AWS CloudFront',
      'AWS API Gateway',
      'AWS Cognito',
      'MySQL',
      'CloudWatch',
      'Provider'
    ],
    githubUrl: 'https://github.com/yourusername/ecommerce',
    demoUrl: 'https://yourusername.github.io/ecommerce',
  ),
  const Project(
    title: 'Travel Companion',
    description:
        'Plan trips with itineraries, maps, and AI recommendations. Full-stack Python backend with MySQL/PostgreSQL database. AWS integration includes Lambda, S3, CloudFront, API Gateway, Cognito for auth, and VPC for secure networking. Flutter frontend state managed with Bloc.',
    imageUrl: 'assets/images/taravel.jpg',
    technologies: [
      'Flutter',
      'Python',
      'AWS Lambda',
      'AWS S3',
      'AWS CloudFront',
      'AWS API Gateway',
      'AWS Cognito',
      'AWS VPC',
      'MySQL',
      'Bloc',
      'Google Maps'
    ],
    githubUrl: 'https://github.com/yourusername/travel',
    demoUrl: 'https://yourusername.github.io/travel',
  ),
  const Project(
    title: 'Fitness Tracker',
    description:
        'Track workouts, nutrition, and progress. Full-stack Python backend with PostgreSQL/MySQL database. AWS services include AppSync for real-time sync, S3 for media, Lambda for API logic, CloudWatch for monitoring, and EventBridge for scheduled tasks. Flutter frontend state managed with Provider.',
    imageUrl: 'assets/images/fitness.jpg',
    technologies: [
      'Flutter',
      'Python',
      'AWS AppSync',
      'AWS Lambda',
      'AWS S3',
      'AWS CloudWatch',
      'AWS EventBridge',
      'PostgreSQL',
      'MySQL',
      'Provider',
      'Charts',
      'Hive'
    ],
    githubUrl: 'https://github.com/yourusername/fitness',
  ),
  const Project(
    title: 'Social Media App',
    description:
        'A real-time social media platform with photo sharing, messaging, and push notifications. Integrated AWS Amplify + Cognito for user authentication, S3 for media uploads, and DynamoDB for posts. Face verification with AWS Rekognition for profile security. State managed with Riverpod.',
    imageUrl: 'assets/images/social.jpg',
    technologies: [
      'Flutter',
      'Python',
      'AWS Amplify',
      'AWS Cognito',
      'AWS S3',
      'AWS DynamoDB',
      'AWS Rekognition',
      'Firebase',
      'Cloud Functions',
      'Riverpod'
    ],
    githubUrl: 'https://github.com/yourusername/socialmedia',
    demoUrl: 'https://yourusername.github.io/socialmedia',
  ),
  const Project(
    title: 'Weather Dashboard',
    description:
        'A weather app with real-time conditions, forecasts, and alerts. Integrated AWS Lambda + API Gateway for weather APIs, CloudWatch for monitoring, and animations for beautiful UI. State managed using Bloc.',
    imageUrl: 'assets/images/weather.jpg',
    technologies: [
      'Flutter',
      'Python',
      'AWS Lambda',
      'AWS API Gateway',
      'AWS CloudWatch',
      'Weather API',
      'Animations',
      'Bloc'
    ],
    githubUrl: 'https://github.com/yourusername/weather',
    demoUrl: 'https://yourusername.github.io/weather',
  ),
  const Project(
    title: 'Stock Market Forecast App',
    description:
        'A full-stack stock market forecasting platform. Flutter frontend integrated with Python backend (FastAPI) and PostgreSQL/MySQL. AWS services include Lambda for serverless backend, S3 for storing historical data, CloudFront for content delivery, API Gateway for secure endpoints, IAM for permissions, EC2 & VPC for hosting, EventBridge for scheduled updates, and CloudWatch for monitoring. Provides real-time stock predictions, portfolio tracking, and analytics. State managed with Riverpod and Bloc.',
    imageUrl: 'assets/images/stockmarket.jpg',
    technologies: [
      'Flutter',
      'Python',
      'AWS Lambda',
      'AWS S3',
      'AWS CloudFront',
      'AWS API Gateway',
      'AWS IAM',
      'AWS EC2',
      'AWS VPC',
      'AWS EventBridge',
      'AWS CloudWatch',
      'PostgreSQL',
      'MySQL',
      'Riverpod',
      'Bloc',
      'Stock Forecasting',
      'Portfolio Tracking'
    ],
    githubUrl: 'https://github.com/yourusername/stock_market_app',
    demoUrl: 'https://yourusername.github.io/stock_market_app',
  ),
  const Project(
    title: 'Life Insurance App',
    description:
        'A full-stack life insurance management platform. Flutter frontend with Python (FastAPI/Django) backend. AWS services include Lambda for serverless logic, S3 for storing policy documents, CloudFront for content delivery, API Gateway for secure endpoints, IAM for access control, RDS (MySQL/PostgreSQL) for database, EC2 & VPC for hosting, EventBridge for scheduled notifications, and CloudWatch for monitoring. Features include policy enrollment, premium calculation, claim tracking, and secure document uploads. State managed with Riverpod and Bloc.',
    imageUrl: 'assets/images/lifeinsurance.jpg',
    technologies: [
      'Flutter',
      'Python',
      'AWS Lambda',
      'AWS S3',
      'AWS CloudFront',
      'AWS API Gateway',
      'AWS IAM',
      'AWS EC2',
      'AWS VPC',
      'AWS EventBridge',
      'AWS CloudWatch',
      'MySQL',
      'PostgreSQL',
      'Riverpod',
      'Bloc',
      'Insurance Management'
    ],
    githubUrl: 'https://github.com/yourusername/life_insurance_app',
    demoUrl: 'https://yourusername.github.io/life_insurance_app',
  )
];

class SkillsPage extends StatelessWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'My Skills',
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Technical Skills',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            const SkillCategoryCard(
              category: 'Mobile Development',
              skills: [
                Skill(name: 'Flutter', level: 0.95),
                Skill(name: 'Dart', level: 0.95),
                Skill(name: 'Firebase', level: 0.9),
              ],
            ),
            const SizedBox(height: 24),
            const SkillCategoryCard(
              category: 'State Management',
              skills: [
                Skill(name: 'Provider', level: 0.95),
                Skill(name: 'Bloc', level: 0.9),
                Skill(name: 'Riverpod', level: 0.9),
              ],
            ),
            const SizedBox(height: 24),
            const SkillCategoryCard(
              category: 'Backend & Database',
              skills: [
                Skill(name: 'Firebase', level: 0.9),
                Skill(name: 'REST APIs', level: 0.9),
                Skill(name: 'SQL', level: 0.75),
                Skill(name: 'PostgreSQL', level: 0.7),
              ],
            ),
            const SizedBox(height: 24),
            const SkillCategoryCard(
              category: 'AWS Services',
              skills: [
                Skill(name: 'AWS Lambda', level: 0.8),
                Skill(name: 'Amazon S3', level: 0.85),
                Skill(name: 'Amazon RDS', level: 0.75),
                Skill(name: 'AWS API Gateway', level: 0.8),
                Skill(name: 'AWS Amplify', level: 0.8),
                Skill(name: 'AWS Cognito', level: 0.8),
                Skill(name: 'Amazon DynamoDB', level: 0.8),
                Skill(name: 'AWS CloudFormation', level: 0.8),
                Skill(name: 'AWS Cloudfront', level: 0.8),
                Skill(name: 'AWS VPC', level: 0.75),
              ],
            ),
            const SizedBox(height: 24),
            const SkillCategoryCard(
              category: 'Tools & Others',
              skills: [
                Skill(name: 'Git', level: 0.9),
                Skill(name: 'CI/CD', level: 0.8),
                Skill(name: 'Testing', level: 0.8),
              ],
            ),
            const SizedBox(height: 48),
            Text('Certifications',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 24),
            const CertificationCard(
              title: 'Flutter Developer Certification',
              issuedBy: 'Google',
              date: 'January 2023',
              description: 'Professional certification for Flutter development',
              url: 'https://www.credential.net/yourlink',
            ),
            const SizedBox(height: 16),
            const CertificationCard(
              title: 'Firebase Associate Certification',
              issuedBy: 'Google',
              date: 'November 2022',
              description:
                  'Advanced Firebase implementation and best practices',
              url: 'https://www.credential.net/yourlink',
            ),
            const SizedBox(height: 16),
            const CertificationCard(
              title: 'AWS Solutions Architect Associate',
              issuedBy: 'Amazon Web Services',
              date: 'September 2022',
              description: 'Designing distributed applications on AWS platform',
              url: 'https://www.credly.com/yourlink',
            ),
            const SizedBox(height: 16),
            const CertificationCard(
              title: 'App Architecture Masterclass',
              issuedBy: 'Flutter Academy',
              date: 'August 2022',
              description: 'Clean architecture and patterns for mobile apps',
              url: 'https://www.credential.net/yourlink',
            ),
          ],
        ),
      ),
    );
  }
}

class Skill {
  final String name;
  final double level;

  const Skill({
    required this.name,
    required this.level,
  });
}

class SkillCategoryCard extends StatefulWidget {
  final String category;
  final List<Skill> skills;

  const SkillCategoryCard({
    Key? key,
    required this.category,
    required this.skills,
  }) : super(key: key);

  @override
  State<SkillCategoryCard> createState() => _SkillCategoryCardState();
}

class _SkillCategoryCardState extends State<SkillCategoryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'mobile development':
        return Icons.phone_android;
      case 'state management':
        return Icons.settings;
      case 'backend & database':
        return Icons.storage;
      case 'aws services':
        return Icons.cloud;
      case 'tools & others':
        return Icons.build;
      default:
        return Icons.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? Theme.of(context).primaryColor.withOpacity(0.3)
                : Colors.grey.shade200,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: _isHovered ? 12 : 6,
              offset: const Offset(0, 2),
              spreadRadius: _isHovered ? 2 : 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getCategoryIcon(widget.category),
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.category,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade800,
                                  ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${widget.skills.length} skills',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey.shade600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Skills List
              ...widget.skills
                  .map((skill) => ProfessionalSkillBar(skill: skill))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfessionalSkillBar extends StatefulWidget {
  final Skill skill;

  const ProfessionalSkillBar({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  State<ProfessionalSkillBar> createState() => _ProfessionalSkillBarState();
}

class _ProfessionalSkillBarState extends State<ProfessionalSkillBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.skill.level,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Delay animation start
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted && !_hasAnimated) {
        _animationController.forward();
        _hasAnimated = true;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getSkillLevelColor(double level) {
    if (level >= 0.9) return Colors.green.shade600;
    if (level >= 0.8) return Colors.blue.shade600;
    if (level >= 0.7) return Colors.orange.shade600;
    return Colors.grey.shade600;
  }

  String _getSkillLevelText(double level) {
    if (level >= 0.9) return 'Expert';
    if (level >= 0.8) return 'Advanced';
    if (level >= 0.7) return 'Intermediate';
    return 'Beginner';
  }

  @override
  Widget build(BuildContext context) {
    final skillColor = _getSkillLevelColor(widget.skill.level);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skill name and percentage
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.skill.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                      ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: skillColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getSkillLevelText(widget.skill.level),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: skillColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Text(
                        '${(_progressAnimation.value * 100).toInt()}%',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: skillColor,
                            ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Progress bar
          Container(
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.grey.shade200,
            ),
            child: AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return FractionallySizedBox(
                  widthFactor: _progressAnimation.value,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: LinearGradient(
                        colors: [
                          skillColor,
                          skillColor.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CertificationCard extends StatefulWidget {
  final String title;
  final String issuedBy;
  final String date;
  final String description;
  final String url;

  const CertificationCard({
    Key? key,
    required this.title,
    required this.issuedBy,
    required this.date,
    required this.description,
    required this.url,
  }) : super(key: key);

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _hoverController;
  late AnimationController _badgeController;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _badgeRotation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    // Slide-in animation controller
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Hover animation controller
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // Badge animation controller
    _badgeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Initialize animations
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    _badgeRotation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _badgeController,
      curve: Curves.elasticOut,
    ));

    // Start animations
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _slideController.forward();
        _badgeController.forward();
      }
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _hoverController.dispose();
    _badgeController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  void _onTap() {
    // Add ripple effect and handle URL opening
    if (widget.url.isNotEmpty) {
      // You can add URL launcher here
      print('Opening: ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: GestureDetector(
            onTap: _onTap,
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _isHovered
                            ? Theme.of(context).primaryColor.withOpacity(0.3)
                            : Colors.grey.shade200,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _isHovered
                              ? Theme.of(context).primaryColor.withOpacity(0.15)
                              : Colors.grey.withOpacity(0.08),
                          blurRadius: _isHovered ? 16 : 8,
                          offset: const Offset(0, 4),
                          spreadRadius: _isHovered ? 1 : 0,
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: _onTap,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Animated Badge Icon
                              AnimatedBuilder(
                                animation: _badgeRotation,
                                builder: (context, child) {
                                  return Transform.rotate(
                                    angle: _badgeRotation.value * 2 * 3.14159,
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Theme.of(context).primaryColor,
                                            Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.8),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.verified,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(width: 20),

                              // Content with staggered animation
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title with slide animation
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                      transform: Matrix4.translationValues(
                                        _isHovered ? 0 : 0,
                                        0,
                                        0,
                                      ),
                                      child: Text(
                                        widget.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: _isHovered
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.grey.shade800,
                                            ),
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    // Issuer and date with fade-in
                                    AnimatedOpacity(
                                      opacity: _fadeAnimation.value,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.business,
                                            size: 16,
                                            color: Colors.grey.shade600,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            widget.issuedBy,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700,
                                                ),
                                          ),
                                          const SizedBox(width: 12),
                                          Icon(
                                            Icons.calendar_today,
                                            size: 14,
                                            color: Colors.grey.shade500,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            widget.date,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: Colors.grey.shade600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 12),

                                    // Description
                                    AnimatedOpacity(
                                      opacity: _fadeAnimation.value,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      child: Text(
                                        widget.description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.grey.shade700,
                                              height: 1.4,
                                            ),
                                      ),
                                    ),

                                    const SizedBox(height: 12),

                                    // View credential link
                                  ],
                                ),
                              ),

                              // Arrow indicator
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                transform: Matrix4.translationValues(
                                  _isHovered ? 5 : 0,
                                  0,
                                  0,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: _isHovered
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isSubmitting = false;

  late AnimationController _pageController;
  late AnimationController _formController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _formScaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _pageController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _formController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Page entry animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pageController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _pageController,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
    ));

    _formScaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _formController,
      curve: Curves.easeOutBack,
    ));

    // Start animations
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _pageController.forward();
        _formController.forward();
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    _pageController.dispose();
    _formController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Animate form submission
      _formController.reverse().then((_) {
        _formController.forward();
      });

      // Simulate form submission
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });

          // Show animated success dialog
          _showSuccessDialog();
        }
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AnimatedSuccessDialog(
        onDismiss: () {
          Navigator.pop(context);
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Contact Me',
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Animated Header
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 600),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(-20 * (1 - value), 0),
                          child: Opacity(
                            opacity: value,
                            child: Text(
                              'Get In Touch',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // Animated Subtitle
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 800),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(-15 * (1 - value), 0),
                          child: Opacity(
                            opacity: value,
                            child: const Text(
                              'I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your vision.',
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    // Responsive Layout with Staggered Animation
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 800) {
                          // Desktop layout
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TweenAnimationBuilder<double>(
                                  duration: const Duration(milliseconds: 1000),
                                  tween: Tween(begin: 0.0, end: 1.0),
                                  builder: (context, value, child) {
                                    return Transform.translate(
                                      offset: Offset(-30 * (1 - value), 0),
                                      child: Opacity(
                                        opacity: value,
                                        child:
                                            _buildContactInfoSection(context),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: AnimatedBuilder(
                                  animation: _formController,
                                  builder: (context, child) {
                                    return Transform.scale(
                                      scale: _formScaleAnimation.value,
                                      child: _buildContactForm(context),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Mobile layout
                          return Column(
                            children: [
                              TweenAnimationBuilder<double>(
                                duration: const Duration(milliseconds: 1000),
                                tween: Tween(begin: 0.0, end: 1.0),
                                builder: (context, value, child) {
                                  return Transform.translate(
                                    offset: Offset(0, -20 * (1 - value)),
                                    child: Opacity(
                                      opacity: value,
                                      child: _buildContactInfoSection(context),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 32),
                              AnimatedBuilder(
                                animation: _formController,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _formScaleAnimation.value,
                                    child: _buildContactForm(context),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Form Title with Animation
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 600),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, -10 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: Text(
                      'Send a Message',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Animated Form Fields
            AnimatedFormField(
              controller: _nameController,
              label: 'Full Name',
              icon: Icons.person,
              delay: 200,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            AnimatedFormField(
              controller: _emailController,
              label: 'Email Address',
              icon: Icons.email,
              delay: 300,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            AnimatedFormField(
              controller: _messageController,
              label: 'Message',
              icon: Icons.message,
              delay: 400,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Animated Submit Button
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 800),
              tween: Tween(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: ElevatedButton(
                        onPressed: _isSubmitting ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: _isSubmitting ? 0 : 4,
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: _isSubmitting
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('SEND MESSAGE'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 24),
        AnimatedContactInfoItem(
          icon: Icons.email_outlined,
          title: 'Email',
          value: 'arulnithi.panneerselvam@gmail.com',
          delay: 100,
          onTap: () =>
              launchUrl(Uri.parse('mailto:arulnithi.panneerselvam@gmail.com')),
        ),
        const AnimatedDivider(delay: 200),
        AnimatedContactInfoItem(
          icon: Icons.phone_outlined,
          title: 'Phone',
          value: '+919578357276',
          delay: 300,
          onTap: () => launchUrl(Uri.parse('tel:+919578357276')),
        ),
        const AnimatedDivider(delay: 400),
        const AnimatedContactInfoItem(
          icon: Icons.location_on_outlined,
          title: 'Chennai',
          value: 'Tamil nadu',
          delay: 500,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

// Animated Form Field Component
class AnimatedFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int delay;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;

  const AnimatedFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.delay,
    this.validator,
    this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  @override
  State<AnimatedFormField> createState() => _AnimatedFormFieldState();
}

class _AnimatedFormFieldState extends State<AnimatedFormField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Focus(
              onFocusChange: (focused) {
                setState(() => _isFocused = focused);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  maxLines: widget.maxLines ?? 1,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    labelText: widget.label,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    prefixIcon: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        widget.icon,
                        color: _isFocused
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                    ),
                    alignLabelWithHint: widget.maxLines != null,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Animated Contact Info Item
class AnimatedContactInfoItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final int delay;
  final VoidCallback? onTap;

  const AnimatedContactInfoItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.delay,
    this.onTap,
  }) : super(key: key);

  @override
  State<AnimatedContactInfoItem> createState() =>
      _AnimatedContactInfoItemState();
}

class _AnimatedContactInfoItemState extends State<AnimatedContactInfoItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + widget.delay),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(-20 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: MouseRegion(
              onEnter: (_) {
                setState(() => _isHovered = true);
                _controller.forward();
              },
              onExit: (_) {
                setState(() => _isHovered = false);
                _controller.reverse();
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(
                      _controller.value * 5,
                      0,
                      0,
                    ),
                    child: InkWell(
                      onTap: widget.onTap,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _isHovered
                              ? Theme.of(context).primaryColor.withOpacity(0.05)
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).primaryColor.withOpacity(
                                          _isHovered ? 0.15 : 0.1,
                                        ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                widget.icon,
                                color: Theme.of(context).primaryColor,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: _isHovered
                                          ? Theme.of(context).primaryColor
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.value,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color
                                          ?.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (widget.onTap != null)
                              AnimatedRotation(
                                turns: _controller.value * 0.1,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(
                                        _isHovered ? 1.0 : 0.5,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// Animated Divider
class AnimatedDivider extends StatelessWidget {
  final int delay;

  const AnimatedDivider({Key? key, required this.delay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 400 + delay),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scaleX: value,
          child: const Divider(height: 1),
        );
      },
    );
  }
}

// Animated Success Dialog
class AnimatedSuccessDialog extends StatefulWidget {
  final VoidCallback onDismiss;

  const AnimatedSuccessDialog({Key? key, required this.onDismiss})
      : super(key: key);

  @override
  State<AnimatedSuccessDialog> createState() => _AnimatedSuccessDialogState();
}

class _AnimatedSuccessDialogState extends State<AnimatedSuccessDialog>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _checkController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _checkController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    _checkAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _checkController,
      curve: Curves.easeOutBack,
    ));

    _scaleController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _checkController.forward();
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                AnimatedBuilder(
                  animation: _checkAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _checkAnimation.value,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 12),
                const Text('Message Sent'),
              ],
            ),
            content: const Text(
              'Thank you for your message! I will get back to you as soon as possible.',
            ),
            actions: [
              TextButton(
                onPressed: widget.onDismiss,
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
