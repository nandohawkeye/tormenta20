import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('Weapon')) {
      return 'Arma';
    } else if (value.contains('Ammunition')) {
      return 'Munição';
    } else if (value.contains('Armor')) {
      return 'Armadura';
    } else if (value.contains('Shield')) {
      return 'Escudo';
    } else if (value.contains('GeneralItem')) {
      return 'Item geral';
    } else if (value.contains('Saddlebag')) {
      return 'Alforja';
    } else if (value.contains('AdventureBackpack')) {
      return 'Mochila de aventureiro';
    } else if (value.contains('Backpack')) {
      return 'Mochila';
    } else {
      return value.capitalize().trim();
    }
  }

  static String handleImagePath(Equipment equipment) {
    if (equipment is Shield) {
      return Assets.images.shield.path;
    } else if (equipment is Armor) {
      return Assets.images.armor.path;
    } else if (equipment is Ammunition) {
      if (equipment.name.toLowerCase().contains('bala')) {
        return Assets.images.bullet.path;
      }

      return Assets.images.armor.path;
    } else if (equipment is Weapon) {
      if (equipment.name.toLowerCase().contains('katana')) {
        return Assets.images.katana.path;
      } else if (equipment.name.toLowerCase().contains('alabarda')) {
        return Assets.images.halberd.path;
      } else if (equipment.name.toLowerCase().contains('besta')) {
        return Assets.images.crossbow.path;
      } else if (equipment.name.toLowerCase().contains('arco')) {
        return Assets.images.archery.path;
      } else if (equipment.name.toLowerCase().contains('espada')) {
        return Assets.images.sword.path;
      } else if (equipment.name.toLowerCase().contains('machado')) {
        return Assets.images.axe.path;
      } else if (equipment.name.toLowerCase().contains('pistola') ||
          equipment.name.toLowerCase().contains('mosquete')) {
        return Assets.images.gun.path;
      } else if (equipment.name.toLowerCase().contains('lança')) {
        return Assets.images.spear.path;
      } else if (equipment.name.toLowerCase().contains('adaga') ||
          equipment.name.toLowerCase().contains('punhal')) {
        return Assets.images.dagger.path;
      } else if (equipment.name.toLowerCase().contains('foice')) {
        return Assets.images.scythe.path;
      } else if (equipment.name.toLowerCase().contains('clava') ||
          equipment.name.toLowerCase().contains('massa')) {
        return Assets.images.mace.path;
      } else if (equipment.name.toLowerCase().contains('chicote')) {
        return Assets.images.whip.path;
      } else {
        return Assets.images.sword.path;
      }
    } else {
      if (equipment.name.toLowerCase().contains('poção')) {
        return Assets.images.potion.path;
      } else if (equipment.name.toLowerCase().contains('veneno')) {
        return Assets.images.poison.path;
      } else if (equipment.name.toLowerCase().contains('anel')) {
        return Assets.images.ring.path;
      }

      return Assets.images.item.path;
    }
  }
}
