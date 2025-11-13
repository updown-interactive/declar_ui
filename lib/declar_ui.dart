library;

// Export Flutter material, but hide Flutter’s Row & Column
export 'package:flutter/material.dart'
    hide Row, Column, Container, SizedBox, Text, Icon, Stack, MaterialApp, Scaffold;

export 'package:declar_ui/src/widgets/row.dart';
export 'package:declar_ui/src/widgets/column.dart';
export 'package:declar_ui/src/widgets/container.dart';
export 'package:declar_ui/src/widgets/sizedbox.dart';
export 'package:declar_ui/src/widgets/text.dart';
export 'package:declar_ui/src/widgets/icon.dart';
export 'package:declar_ui/src/widgets/stack.dart';
export 'package:declar_ui/src/widgets/material_app.dart';
export 'package:declar_ui/src/widgets/when.dart';
export 'package:declar_ui/src/widgets/scaffold.dart';
export 'package:declar_ui/src/utils/screen.dart';
export 'package:declar_ui/src/utils/constants.dart';



export 'package:declar_ui/src/extensions/widget+extension.dart';
