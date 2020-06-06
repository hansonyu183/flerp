import 'package:flerp/app/models/index.dart';
import 'package:flerp/core/view_models/view_model.dart';
import 'package:flutter/material.dart';

import 'role_editor_m.dart';

class RoleEditorVM extends ViewModel<RoleEditorM> {
  RoleEditorVM(BuildContext viewCtx) : super(viewCtx, RoleEditorM());

  void newRoleItem() {
    final List<Role> newRoles = model.roles;
    newRoles.add(Role(id: 0));
    print(newRoles[0].toJson);
    setState((RoleEditorM s) => s.roles = <Role>[...newRoles]);
  }

  void saveRoles() {}

  Future<void> onDeleteRole(int roleIndex) async {
    final bool confirmed = await showConfirmDialog('', '确定删除吗？');
    if (confirmed) {
      setState((RoleEditorM s) => s.roles.removeAt(roleIndex));
    }
  }
}
