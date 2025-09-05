import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_colors.dart';
import 'package:flutter_app/core/constants/app_spacing.dart';
import 'package:flutter_app/features/widgets/custom_button.dart';
import 'package:flutter_app/features/widgets/custom_text.dart';
import 'package:flutter_app/features/widgets/full_screen_loader.dart';
import 'package:flutter_app/provider/language_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LanguagePopupWidget extends StatefulWidget {
  final List<Map<String, String>> languages;
  final String selectedLanguage;
  final ValueChanged<String> onSelected;

  const LanguagePopupWidget({
    super.key,
    required this.languages,
    required this.selectedLanguage,
    required this.onSelected,
  });

  @override
  State<LanguagePopupWidget> createState() => _LanguagePopupWidgetState();
}

class _LanguagePopupWidgetState extends State<LanguagePopupWidget> {
  late String currentSelected;

  @override
  void initState() {
    super.initState();
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );
    currentSelected =
        widget.selectedLanguage.isNotEmpty
            ? widget.selectedLanguage
            : languageProvider.locale;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final selectedColor =
        isDark ? AppColors.darkPrimary : AppColors.lightPrimary;
    final notSelectedColor =
        isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final languageProvider = Provider.of<LanguageProvider>(context);
    final helper = languageProvider.helper;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: CustomText(
            text: helper?.tr('language_popup.title') ?? '',
            size: CustomTextSize.md,
            fontWeight: FontWeight.w600,
            color: CustomTextColor.primary,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.languages.length,
            itemBuilder: (context, index) {
              final lang = widget.languages[index];
              final isSelected = lang['name'] == currentSelected;

              return GestureDetector(
                onTap: () {
                  setState(() => currentSelected = lang['name']!);
                },
                child: Container(
                  color: isSelected ? selectedColor : notSelectedColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      CustomText(text: lang['flag']!, size: CustomTextSize.sm),
                      const SizedBox(width: 12),
                      CustomText(
                        text: lang['display']!,
                        size: CustomTextSize.sm,
                        color:
                            isSelected
                                ? CustomTextColor.alwaysWhite
                                : CustomTextColor.text,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                      if (isSelected) const Spacer(),
                      if (isSelected)
                        const Icon(Icons.check, color: Colors.white),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Buttons
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.sm.w,
            horizontal: AppSpacing.sm.h,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: helper?.tr('language_popup.buttons.cancel') ?? '',
                  variant: ButtonVariant.outline,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              AppSpacing.hmd,
              Expanded(
                child: CustomButton(
                  text: helper?.tr('language_popup.buttons.select') ?? '',
                  isDisabled: currentSelected == widget.selectedLanguage,
                  onPressed: () async {
                    final navigator = Navigator.of(context);

                    FullScreenLoader.show(context);

                    widget.onSelected(currentSelected);
                    final languageProvider = Provider.of<LanguageProvider>(
                      context,
                      listen: false,
                    );
                    String localeCode = currentSelected.toLowerCase();
                    languageProvider.setLocale(localeCode);

                    await Future.delayed(const Duration(milliseconds: 600));

                    if (!mounted) return;

                    FullScreenLoader.hide(context);
                    navigator.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
