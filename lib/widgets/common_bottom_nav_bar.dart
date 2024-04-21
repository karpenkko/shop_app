import 'package:flutter/material.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final List<GlobalKey<NavigatorState>> navigatorKeys;
  final List<Widget> children;

  CommonBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.navigatorKeys,
    required this.children,
  }) {
    assert(navigatorKeys.length == children.length);
  }

  @override
  State<CommonBottomNavigationBar> createState() =>
      _CommonBottomNavigationBarState();
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(widget.children.length, (index) {
        return _buildOffstageNavigator(index);
      }),
    );
  }

  Widget _buildOffstageNavigator(int index) {
    return NavigatorPopHandler(
      onPop: () => widget.navigatorKeys[index].currentState!.maybePop(),
      child: Offstage(
        offstage: widget.selectedIndex != index,
        child: _BottomBarNavigator(
          navigatorKey: widget.navigatorKeys[index],
          child: widget.children[index],
        ),
      ),
    );
  }
}

class _BottomBarNavigator extends StatelessWidget {
  const _BottomBarNavigator({
    required this.child,
    required this.navigatorKey,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      '/': (context) {
        return child;
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) {
            final builderFunction = routeBuilders[routeSettings.name];
            if (builderFunction != null) {
              return builderFunction(context);
            } else {
              return const Placeholder();
            }
          },
        );
      },
    );
  }
}
