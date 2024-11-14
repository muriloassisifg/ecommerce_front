import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/role_controller.dart';
import '../models/role.dart';

class AddRolePopup extends StatefulWidget {
  @override
  _AddRolePopupState createState() => _AddRolePopupState();
}

class _AddRolePopupState extends State<AddRolePopup> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar perfil'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          decoration: InputDecoration(labelText: 'Nome do perfil'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Informe o nome da perfil';
            }
            return null;
          },
          onSaved: (value) {
            _name = value!;
          },
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Adicionar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final newRole = Role(id: 0, name: _name);
              Provider.of<RoleController>(context, listen: false)
                  .addRole(newRole);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
