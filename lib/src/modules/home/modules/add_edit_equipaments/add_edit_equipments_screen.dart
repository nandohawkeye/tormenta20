import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/add_edit_equipments_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_screen_item.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_type.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/groups/adventure_backpack_widgets_group.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/groups/ammunition_wigets_group.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/groups/armor_widgets_group.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/groups/backpack_widgets_group.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/groups/general_item_widgets_group.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/groups/saddback_widgets_group.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/groups/shield_widgets_group.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/groups/weapon_widgets_group.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurer_backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class AddEditEquipmentsScreen extends StatefulWidget {
  const AddEditEquipmentsScreen({
    super.key,
    this.equipament,
    required this.parentUuid,
  });

  final Equipment? equipament;
  final String parentUuid;

  @override
  State<AddEditEquipmentsScreen> createState() => _AddEditActionScreenState();
}

class _AddEditActionScreenState extends State<AddEditEquipmentsScreen> {
  final _formKey = GlobalKey<FormState>();
  late final AddEditEquipmentsController _controller;
  late final ScrollController _scrollController;
  bool _hasInited = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = AddEditEquipmentsController(
      widget.equipament,
      widget.parentUuid,
    );
    Future.delayed(const Duration(seconds: 1)).then((_) => _hasInited = true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      scrollController: _scrollController,
      label: '${widget.equipament != null ? 'Editando ' : ''}Equipamento',
      body: Form(
        key: _formKey,
        child: AnimatedBuilder(
          animation: _controller.typeStore,
          builder: (_, __) {
            final type = _controller.typeStore.data;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                T20UI.spaceHeight,
                AddEditEquipmentScreenItem(
                  hasInited: false,
                  child: AddEditEquipamentType(
                    _controller.typeStore,
                    isEnableToChange: widget.equipament == null,
                    onChange: _controller.onChangeType,
                  ),
                ),
                if (type == Weapon) WeaponWidgetsGroup(_controller, _hasInited),
                if (type == Armor) ArmorWidgetsGroup(_controller, _hasInited),
                if (type == Shield) ShieldWidgetsGroup(_controller, _hasInited),
                if (type == Ammunition)
                  AmmunitionWidgetsGroup(_controller, _hasInited),
                if (type == GeneralItem)
                  GeneralItemWidgetsGroup(_controller, _hasInited),
                if (type == Saddlebag)
                  SaddbackWidgetsGroup(_controller, _hasInited),
                if (type == Backpack)
                  BackpackWidgetsGroup(_controller, _hasInited),
                if (type == AdventureBackpack)
                  AdventureBackpackWidgetsGroup(_controller, _hasInited),
              ],
            );
          },
        ),
      ),
      onSave: () {
        _scrollController.animateTo(
          0,
          duration: T20UI.defaultDurationAnimation,
          curve: Curves.easeInOut,
        );
        if (_formKey.currentState?.validate() ?? false) {
          final equipment = _controller.onSave();
          if (equipment != null) {
            Navigator.pop(context, equipment);
          }
        }
      },
    );
  }
}
