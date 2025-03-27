import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';

final liverShade = ColoredBox(color: Colors.black.withValues(alpha: 0.8));

class WwLiveryWaiting extends StatelessWidget {
  const WwLiveryWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        wwDialogueBox(
          context,
          text: 'Pending',
          textSub: 'Waiting for administrator review and approval.',
        );
      },
      icon: Icon(Icons.timelapse_sharp, size: 40, color: Colors.amber[400]),
    );
  }
}

class WwLiveryRejected extends StatelessWidget {
  const WwLiveryRejected({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        wwDialogueBox(
          context,
          text: 'Rejected',
          textSub:
              'We noticed that your recent post violates our community guidelines',
        );
      },
      icon: Icon(
        Icons.error_outline_outlined,
        size: 40,
        color: Colors.red[400],
      ),
    );
  }
}
