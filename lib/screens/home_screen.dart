import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/data/models/models.dart';
import 'package:todo_app/utils/utils.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              color: colors.primary,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DisplayWhiteText(
                    text: 'Aug 7, 2023',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  Gap(10),
                  DisplayWhiteText(
                    text: 'My Todo List',
                    fontSize: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          bottom: 10,
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DisplayListOfTasks(
                    tasks: [
                      Task(
                        title: 'title 1',
                        note: 'note',
                        time: '10:12',
                        date: 'Aug, 07',
                        isCompleted: false,
                        category: TaskCategories.shopping,
                      ),
                      Task(
                        title: 'title 2 title 2 ',
                        note: 'note',
                        time: '10:12',
                        date: 'Aug, 07',
                        isCompleted: false,
                        category: TaskCategories.education,
                      ),
                    ],
                  ),
                  const Gap(20),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  const DisplayListOfTasks(
                    tasks: [
                      Task(
                        title: 'title 1',
                        note: '',
                        time: '10:12',
                        date: 'Aug, 07',
                        isCompleted: true,
                        category: TaskCategories.personal,
                      ),
                      Task(
                        title: 'title 2 title 2 ',
                        note: 'note',
                        time: '10:12',
                        date: 'Aug, 07',
                        isCompleted: true,
                        category: TaskCategories.work,
                      ),
                    ],
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  const DisplayListOfTasks(
                    tasks: [
                      Task(
                        title: 'title 3',
                        note: 'note',
                        time: '10:12',
                        date: 'Aug, 07',
                        isCompleted: true,
                        category: TaskCategories.personal,
                      ),
                      Task(
                        title: 'title 2 title 6 ',
                        note: 'note',
                        time: '10:12',
                        date: 'Aug, 07',
                        isCompleted: true,
                        category: TaskCategories.work,
                      ),
                    ],
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () => context.push(
                            RouteLocation.createTask,
                          ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: 'Add New Task'),
                      )),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
