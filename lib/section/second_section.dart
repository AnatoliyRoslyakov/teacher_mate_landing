import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/feature_card.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
    required this.isSmallScreen,
    required this.scrollPosition,
  });

  final bool isSmallScreen;
  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isSmallScreen ? 20 : 100,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Основные возможности',
            style: AppTextStyle.b7f46.copyWith(fontSize: 36),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              FeatureCard(
                icon: Icons.calendar_month,
                title: 'Удобное расписание',
                description:
                    'Планируйте уроки в интуитивном календаре с цветовой маркировкой и гибкими настройками.',
                scrollPosition: scrollPosition,
                index: 0,
              ),
              FeatureCard(
                icon: Icons.group,
                title: 'Управление учениками',
                description:
                    'Ведите базу учеников с контактами, заметками и историей занятий в одном месте.',
                scrollPosition: scrollPosition,
                index: 1,
              ),
              FeatureCard(
                icon: Icons.search,
                title: 'Поиск новых учеников',
                description:
                    'Подключайтесь к сообществу репетиторов и находите новых учеников без комиссий.',
                scrollPosition: scrollPosition,
                index: 2,
              ),
              FeatureCard(
                icon: Icons.money_off,
                title: 'Бесплатно и без подписок',
                description:
                    'Полный функционал без скрытых платежей — работайте комфортно и без лишних затрат.',
                scrollPosition: scrollPosition,
                index: 3,
              ),
              FeatureCard(
                icon: Icons.notifications_active,
                title: 'Автоматические напоминания',
                description:
                    'Уведомления для вас и учеников о предстоящих уроках — никаких пропущенных занятий!',
                scrollPosition: scrollPosition,
                index: 4,
              ),
              FeatureCard(
                icon: Icons.note_alt,
                title: 'Заметки к урокам',
                description:
                    'Записывайте прогресс учеников и планы следующих занятий прямо в приложении.',
                scrollPosition: scrollPosition,
                index: 5,
              ),
              FeatureCard(
                icon: Icons.design_services,
                title: 'Простота и удобство',
                description:
                    'Минималистичный дизайн без лишних кнопок — только то, что нужно для работы.',
                scrollPosition: scrollPosition,
                index: 6,
              ),
              FeatureCard(
                icon: Icons.phone_android,
                title: 'Доступ с любого устройства',
                description:
                    'Работайте с телефона или компьютера — ваши данные всегда синхронизированы.',
                scrollPosition: scrollPosition,
                index: 7,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
