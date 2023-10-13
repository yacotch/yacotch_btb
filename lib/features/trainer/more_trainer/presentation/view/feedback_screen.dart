<<<<<<< HEAD
import 'package:flutter/material.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/feedback_screen_content.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).feedback,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FeedbackScreenContent(),
    );
  }
}
=======
import 'package:flutter/material.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/feedback_screen_content.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).feedback,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FeedbackScreenContent(),
    );
  }
}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
