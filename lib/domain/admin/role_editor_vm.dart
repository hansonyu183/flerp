import 'package:flutter/material.dart';
import 'package:flerp/core/view_models/view_model.dart';
import 'role_editor_m.dart';
import 'package:flerp/app/models/index.dart';

class RoleEditorVM extends ViewModel<RoleEditorM> {
  RoleEditorVM(BuildContext viewCtx) : super(viewCtx, RoleEditorM());

  void newRoleItem() {
    var newRoles = model.roles;
    newRoles.add(Role(id: 0));
    print(newRoles[0].toJson);
    setState((s) => s.roles = [...newRoles]);
  }

  void saveRoles() {}

  void onDeleteRole(int roleIndex) {
    if (true == showConfirmDialog("", "确定删除吗？")) {

    setState((s) => s.roles.removeAt(roleIndex));
    }
  }
}
