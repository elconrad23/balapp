
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Calendarwidget extends StatefulWidget {
  const Calendarwidget({super.key});

  @override
  State<Calendarwidget> createState() => _CalendarwidgetState();
}

class _CalendarwidgetState extends State<Calendarwidget> {
CalendarValue? _value;
CalendarView _view = CalendarView.now();
@override
Widget build(BuildContext context) {
  ShadcnLocalizations localizations = ShadcnLocalizations.of(context);
  return Card(
    child: IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              OutlineButton(
                density: ButtonDensity.icon,
                onPressed: () {
                  setState(() {
                    _view = _view.previous;
                  });
                },
                child: const Icon(Icons.arrow_back).iconXSmall(),
              ),
              Text('${localizations.getMonth(_view.month)} ${_view.year}')
                  .small()
                  .medium()
                  .center()
                  .expanded(),
              OutlineButton(
                density: ButtonDensity.icon,
                onPressed: () {
                  setState(() {
                    _view = _view.next;
                  });
                },
                child: const Icon(Icons.arrow_forward).iconXSmall(),
              ),
            ],
          ),
          const Gap(16),
          Calendar(
            value: _value,
            view: _view,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            selectionMode: CalendarSelectionMode.single,
            now: DateTime.now(),
          ),
        ],
      ),
    ),
  );
}
}