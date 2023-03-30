import 'package:flutter/material.dart';
import 'package:stopwatch/theme/color.dart';

class FloatingButtonProject extends StatelessWidget {
  const FloatingButtonProject({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: ColorProject.primary,
      label: const Text("Add"),
      icon: const Icon(Icons.add),
    );
  }
}

class ButtonDelete extends _ButtonImageBase {
  const ButtonDelete({Key? key, required VoidCallback onDelete}): super(
    key: key,
    callback: onDelete,
    iconData: Icons.close_rounded,
  );
}

class ButtonLeft extends _ButtonImageBase {
  ButtonLeft({Key? key, required Function(bool isNext) callback}): super(
    key: key,
    callback: () {
      callback(false);
    },
    iconData: Icons.arrow_left_rounded,
  );
}

class ButtonRight extends _ButtonImageBase {
  ButtonRight({Key? key, required Function(bool isNext) callback}): super(
    key: key,
    callback: () {
      callback(true);
    },
    iconData: Icons.arrow_right_rounded,
  );
}

class ButtonStart extends _ButtonImageBase {
  const ButtonStart({Key? key, required VoidCallback onStart}): super(
    key: key,
    callback: onStart,
    iconData: Icons.play_arrow_rounded,
  );
}

class ButtonStop extends _ButtonImageBase {
  const ButtonStop({Key? key, required VoidCallback onStop}): super(
    key: key,
    callback: onStop,
    iconData: Icons.stop_rounded,
  );
}

class ButtonReset extends _ButtonImageBase {
  const ButtonReset({Key? key, required VoidCallback onReset}): super(
    key: key,
    callback: onReset,
    iconData: Icons.autorenew_rounded,
  );
}

class _ButtonImageBase extends StatelessWidget {
  const _ButtonImageBase({
    Key? key,
    required this.callback,
    required this.iconData,
  }) : super(key: key);

  final VoidCallback callback;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: Icon(iconData),
    );
  }
}
