import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/core/theme/app_color.dart';
import 'package:flutter_task/core/widgets/top_app_bar.dart';

import 'providers/tense_providers.dart';
import 'widgets/exam_card.dart';
import 'widgets/tense_search_bar.dart';

/// Tense exam-list screen: search + filter header followed by a scrollable
/// list of exam cards. Matches assets/Tense.png.
class TenseScreen extends ConsumerWidget {
  const TenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exams = ref.watch(filteredTenseExamsProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = constraints.maxWidth > 600 ? 32.0 : 20.0;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  AppTopBar(
                    title: 'Tense',
                    onBack: () => Navigator.of(context).maybePop(),
                  ),
                  const SizedBox(height: 16),
                  const TenseSearchBar(),
                  const SizedBox(height: 18),
                  Expanded(
                    child: exams.isEmpty
                        ? const Center(child: Text('No exams found'))
                        : ListView.separated(
                            padding: const EdgeInsets.only(bottom: 20),
                            itemCount: exams.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 16),
                            itemBuilder: (context, index) =>
                                ExamCard(exam: exams[index]),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
