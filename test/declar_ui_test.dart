import 'package:flutter/material.dart' as material;
import 'package:flutter_test/flutter_test.dart';
import 'package:declar_ui/declar_ui.dart';

void main() {
  group('Declar UI Widgets', () {
    // Helper to pump a widget and avoid boilerplate
    Future<void> pumpWidget(WidgetTester tester, Widget widget) async {
      await tester.pumpWidget(material.MaterialApp(home: widget));
    }

    group('Text', () {
      testWidgets('renders text with basic style', (tester) async {
        await pumpWidget(tester, const Text('Hello'));
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.data, 'Hello');
      });

      testWidgets('.color() sets text color', (tester) async {
        await pumpWidget(
          tester,
          const Text('Hello').color(material.Colors.red),
        );
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.style?.color, material.Colors.red);
      });

      testWidgets('.size() sets font size', (tester) async {
        await pumpWidget(tester, const Text('Hello').size(24));
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.style?.fontSize, 24);
      });

      testWidgets('.weight() sets font weight', (tester) async {
        await pumpWidget(
          tester,
          const Text('Hello').weight(material.FontWeight.bold),
        );
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.style?.fontWeight, material.FontWeight.bold);
      });

      testWidgets('.italic() sets font style to italic', (tester) async {
        await pumpWidget(tester, const Text('Hello').italic());
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.style?.fontStyle, material.FontStyle.italic);
      });

      testWidgets('.underline() adds underline decoration', (tester) async {
        await pumpWidget(tester, const Text('Hello').underline());
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.style?.decoration, material.TextDecoration.underline);
      });

      testWidgets('.lineThrough() adds line-through decoration', (
        tester,
      ) async {
        await pumpWidget(tester, const Text('Hello').lineThrough());
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.style?.decoration, material.TextDecoration.lineThrough);
      });

      testWidgets('.align() sets text alignment', (tester) async {
        await pumpWidget(
          tester,
          const Text('Hello').align(material.TextAlign.center),
        );
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.textAlign, material.TextAlign.center);
      });

      testWidgets('.maxLines() sets max lines', (tester) async {
        await pumpWidget(tester, const Text('Hello').maxLines(2));
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.maxLines, 2);
      });

      testWidgets('.overflow() sets text overflow', (tester) async {
        await pumpWidget(
          tester,
          const Text('Hello').overflow(material.TextOverflow.ellipsis),
        );
        final text = tester.widget<material.Text>(find.text('Hello'));
        expect(text.overflow, material.TextOverflow.ellipsis);
      });
    });

    group('Container', () {
      testWidgets('renders with child', (tester) async {
        await pumpWidget(tester, const Container(child: Text('Child')));
        expect(find.text('Child'), findsOneWidget);
      });

      testWidgets('.backgroundColor() sets color', (tester) async {
        await pumpWidget(
          tester,
          const Container(child: null).backgroundColor(material.Colors.blue),
        );
        final container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        final decoration = container.decoration as material.BoxDecoration;
        expect(decoration.color, material.Colors.blue);
      });

      testWidgets('.contentPadding() sets padding', (tester) async {
        await pumpWidget(
          tester,
          const Container(child: null).contentPadding(all: 10),
        );
        final container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        expect(container.padding, const material.EdgeInsets.all(10));
      });

      testWidgets('.contentMargin() sets margin', (tester) async {
        await pumpWidget(
          tester,
          const Container(child: null).contentMargin(all: 10),
        );
        final container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        expect(container.margin, const material.EdgeInsets.all(10));
      });

      testWidgets('.size() sets width and height', (tester) async {
        await pumpWidget(
          tester,
          const Container(child: null).size(width: 50, height: 100),
        );
        final container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        expect(container.constraints?.maxWidth, 50);
        expect(container.constraints?.maxHeight, 100);
      });

      testWidgets('.radius() sets border radius', (tester) async {
        await pumpWidget(tester, const Container(child: null).radius(all: 15));
        final container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        final decoration = container.decoration as material.BoxDecoration;
        expect(decoration.borderRadius, material.BorderRadius.circular(15));
      });

      testWidgets('.border() sets border', (tester) async {
        await pumpWidget(
          tester,
          const Container(
            child: null,
          ).border(color: material.Colors.green, width: 2),
        );
        final container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        final decoration = container.decoration as material.BoxDecoration;
        expect(
          decoration.border,
          material.Border.all(color: material.Colors.green, width: 2),
        );
      });

      testWidgets('.center() sets alignment to center', (tester) async {
        await pumpWidget(tester, const Container(child: null).center());
        final container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        expect(container.alignment, material.Alignment.center);
      });
    });

    group('Row', () {
      testWidgets('renders children in a row', (tester) async {
        await pumpWidget(tester, const Row.children([Text('A'), Text('B')]));
        expect(find.byType(material.Row), findsOneWidget);
        expect(find.text('A'), findsOneWidget);
        expect(find.text('B'), findsOneWidget);
      });

      testWidgets('.align() sets main and cross axis alignment', (
        tester,
      ) async {
        await pumpWidget(
          tester,
          const Row.children([]).align(
            main: MainAxisAlignment.center,
            cross: CrossAxisAlignment.start,
          ),
        );
        final row = tester.widget<material.Row>(find.byType(material.Row));
        expect(row.mainAxisAlignment, material.MainAxisAlignment.center);
        expect(row.crossAxisAlignment, material.CrossAxisAlignment.start);
      });

      testWidgets('.spacing() sets spacing between children', (tester) async {
        await pumpWidget(tester, const Row.children([]).spacing(10));
        final row = tester.widget<material.Row>(find.byType(material.Row));
        expect(row.spacing, 10);
      });

      testWidgets('.expandedAll() wraps children in Expanded', (tester) async {
        await pumpWidget(tester, const Row.children([Text('A')]).expandedAll());
        expect(find.byType(material.Expanded), findsOneWidget);
      });
    });

    group('Column', () {
      testWidgets('renders children in a column', (tester) async {
        await pumpWidget(tester, const Column.children([Text('A'), Text('B')]));
        expect(find.byType(material.Column), findsOneWidget);
        expect(find.text('A'), findsOneWidget);
        expect(find.text('B'), findsOneWidget);
      });

      testWidgets('.align() sets main and cross axis alignment', (
        tester,
      ) async {
        await pumpWidget(
          tester,
          const Column.children([]).align(
            main: MainAxisAlignment.center,
            cross: CrossAxisAlignment.start,
          ),
        );
        final column = tester.widget<material.Column>(
          find.byType(material.Column),
        );
        expect(column.mainAxisAlignment, material.MainAxisAlignment.center);
        expect(column.crossAxisAlignment, material.CrossAxisAlignment.start);
      });

      testWidgets('.spacing() sets spacing between children', (tester) async {
        await pumpWidget(tester, const Column.children([]).spacing(10));
        final column = tester.widget<material.Column>(
          find.byType(material.Column),
        );
        expect(column.spacing, 10);
      });

      testWidgets('.expandedAll() wraps children in Expanded', (tester) async {
        await pumpWidget(
          tester,
          const Column.children([Text('A')]).expandedAll(),
        );
        expect(find.byType(material.Expanded), findsOneWidget);
      });
    });

    group('SizedBox', () {
      testWidgets('renders with specified size', (tester) async {
        await pumpWidget(
          tester,
          const SizedBox(child: null, width: 50, height: 100),
        );
        final box = tester.widget<material.SizedBox>(
          find.byType(material.SizedBox),
        );
        expect(box.width, 50);
        expect(box.height, 100);
      });

      testWidgets('.size() extension sets width and height', (tester) async {
        await pumpWidget(
          tester,
          const SizedBox(child: null).size(width: 60, height: 120),
        );
        final box = tester.widget<material.SizedBox>(
          find.byType(material.SizedBox),
        );
        expect(box.width, 60);
        expect(box.height, 120);
      });

      testWidgets('.width() extension sets width', (tester) async {
        await pumpWidget(tester, const SizedBox(child: null).width(70));
        final box = tester.widget<material.SizedBox>(
          find.byType(material.SizedBox),
        );
        expect(box.width, 70);
      });

      testWidgets('.height() extension sets height', (tester) async {
        await pumpWidget(tester, const SizedBox(child: null).height(140));
        final box = tester.widget<material.SizedBox>(
          find.byType(material.SizedBox),
        );
        expect(box.height, 140);
      });

      testWidgets('.expanded() extension sets infinite dimensions', (
        tester,
      ) async {
        await pumpWidget(
          tester,
          const SizedBox(
            child: null,
          ).expanded(expandWidth: true, expandHeight: true),
        );
        final box = tester.widget<material.SizedBox>(
          find.byType(material.SizedBox),
        );
        expect(box.width, double.infinity);
        expect(box.height, double.infinity);
      });

      testWidgets('.maxWidth() sets infinite width', (tester) async {
        await pumpWidget(tester, const SizedBox(child: null).maxWidth());
        final box = tester.widget<material.SizedBox>(
          find.byType(material.SizedBox),
        );
        expect(box.width, double.infinity);
      });

      testWidgets('.maxHeight() sets infinite height', (tester) async {
        await pumpWidget(tester, const SizedBox(child: null).maxHeight());
        final box = tester.widget<material.SizedBox>(
          find.byType(material.SizedBox),
        );
        expect(box.height, double.infinity);
      });
    });

    group('Icon', () {
      testWidgets('renders with specified icon', (tester) async {
        await pumpWidget(tester, const Icon(material.Icons.home));
        final icon = tester.widget<material.Icon>(find.byType(material.Icon));
        expect(icon.icon, material.Icons.home);
      });

      testWidgets('.color() sets icon color', (tester) async {
        await pumpWidget(
          tester,
          const Icon(material.Icons.home).color(material.Colors.purple),
        );
        final icon = tester.widget<material.Icon>(find.byType(material.Icon));
        expect(icon.color, material.Colors.purple);
      });

      testWidgets('.size() sets icon size', (tester) async {
        await pumpWidget(tester, const Icon(material.Icons.home).size(32));
        final icon = tester.widget<material.Icon>(find.byType(material.Icon));
        expect(icon.size, 32);
      });

      testWidgets('.semantic() sets semantic label', (tester) async {
        await pumpWidget(
          tester,
          const Icon(material.Icons.home).semantic('Home Icon'),
        );
        final icon = tester.widget<material.Icon>(find.byType(material.Icon));
        expect(icon.semanticLabel, 'Home Icon');
      });

      testWidgets('.shadow() sets shadows', (tester) async {
        final shadows = [
          const material.Shadow(blurRadius: 4, color: material.Colors.black),
        ];
        await pumpWidget(tester, Icon(material.Icons.home).shadow(shadows));
        final icon = tester.widget<material.Icon>(find.byType(material.Icon));
        expect(icon.shadows, shadows);
      });
    });

    group('Stack', () {
      testWidgets('renders with children', (tester) async {
        await pumpWidget(tester, const Stack.children([Text('On top')]));
        expect(find.byType(material.Stack), findsOneWidget);
        expect(find.text('On top'), findsOneWidget);
      });

      testWidgets('.alignment() sets stack alignment', (tester) async {
        await pumpWidget(
          tester,
          const Stack.children([]).alignment(material.Alignment.center),
        );
        final stack = tester.widget<material.Stack>(
          find.byType(material.Stack),
        );
        expect(stack.alignment, material.Alignment.center);
      });

      testWidgets('.fit() sets stack fit', (tester) async {
        await pumpWidget(
          tester,
          const Stack.children([]).fit(material.StackFit.expand),
        );
        final stack = tester.widget<material.Stack>(
          find.byType(material.Stack),
        );
        expect(stack.fit, material.StackFit.expand);
      });

      testWidgets('.clip() sets clip behavior', (tester) async {
        await pumpWidget(
          tester,
          const Stack.children([]).clip(material.Clip.none),
        );
        final stack = tester.widget<material.Stack>(
          find.byType(material.Stack),
        );
        expect(stack.clipBehavior, material.Clip.none);
      });
    });

    group('Widget Extensions', () {
      testWidgets('.padding() adds padding', (tester) async {
        await pumpWidget(tester, const Text('Padded').padding(all: 16));
        final padding = tester.widget<material.Padding>(
          find.byType(material.Padding),
        );
        expect(padding.padding, const material.EdgeInsets.all(16));
        expect(find.text('Padded'), findsOneWidget);
      });

      testWidgets('.background() adds a background color', (tester) async {
        await pumpWidget(
          tester,
          const Text('BG').background(material.Colors.amber),
        );
        final container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        expect(container.color, material.Colors.amber);
      });

      testWidgets('.cornerRadius() clips the widget', (tester) async {
        await pumpWidget(tester, const Text('Rounded').cornerRadius(10));
        final clipRRect = tester.widget<material.ClipRRect>(
          find.byType(material.ClipRRect),
        );
        expect(clipRRect.borderRadius, material.BorderRadius.circular(10));
      });

      testWidgets('.center() centers the widget', (tester) async {
        await pumpWidget(tester, const Text('Centered').center());
        expect(find.byType(material.Center), findsOneWidget);
      });

      testWidgets('.expanded() wraps in Expanded', (tester) async {
        await pumpWidget(
          tester,
          material.Row(children: [const Text('Expanded').expanded()]),
        );
        expect(find.byType(material.Expanded), findsOneWidget);
      });

      testWidgets('.onTap() makes widget tappable', (tester) async {
        bool tapped = false;
        await pumpWidget(tester, Text('Tap me').onTap(() => tapped = true));

        await tester.tap(find.text('Tap me'));
        await tester.pump();

        expect(tapped, isTrue);
      });

      testWidgets('.visible() controls visibility', (tester) async {
        await pumpWidget(tester, const Text('Hidden').visible(false));
        expect(find.text('Hidden'), findsNothing);

        await pumpWidget(tester, const Text('Visible').visible(true));
        expect(find.text('Visible'), findsOneWidget);
      });

      testWidgets('.opacity() sets opacity', (tester) async {
        await pumpWidget(tester, const Text('Faded').opacity(0.5));
        final opacity = tester.widget<material.Opacity>(
          find.byType(material.Opacity),
        );
        expect(opacity.opacity, 0.5);
      });

      testWidgets('.rotate() transforms the widget', (tester) async {
        await pumpWidget(tester, const Text('Rotated').rotate(0.5));
        final transform = tester.widget<material.Transform>(
          find.byType(material.Transform),
        );
        expect(transform.transform, isNotNull);
      });

      testWidgets('.when() conditionally applies a modifier', (tester) async {
        // Condition is true
        await pumpWidget(
          tester,
          const Text(
            'Conditional',
          ).when(true, (widget) => widget.background(material.Colors.red)),
        );
        var container = tester.widget<material.Container>(
          find.byType(material.Container),
        );
        expect(container.color, material.Colors.red);

        // Condition is false
        await pumpWidget(
          tester,
          const Text(
            'Conditional',
          ).when(false, (widget) => widget.background(material.Colors.red)),
        );
        expect(find.byType(material.Container), findsNothing);
      });
    });
  });
}
