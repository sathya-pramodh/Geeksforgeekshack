import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';

class DailyChallenge extends HookWidget {
  final User? user;
  const DailyChallenge({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final challengeCompleted = useState(false);
    useEffect(() {
      // TODO: Get from database if the user has completed their daily challenge or not.
      challengeCompleted.value = false;
      return null;
    }, []);
    return customContainer(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: customAppBar(Colors.lightBlue[50], Colors.black, user),
            ),
            (!challengeCompleted.value)
                ? const Text("\n\nStay tuned for the daily challenges🕰🕰.",
                    style: TextStyle(
                      fontFamily: "LuckiestGuy",
                      fontSize: 20,
                    ))
                : const Text(
                    "\n\nDaily Challenge completed! Come back tomorrow!",
                    style: TextStyle(
                      fontFamily: "LuckiestGuy",
                      fontSize: 20,
                    ))
          ]),
        ),
      ),
    );
  }
}
