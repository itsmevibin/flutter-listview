import 'package:flutter/material.dart';
import 'package:test_list_view/contact_data.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Contacts"),
        ),
        body: new ContactList(kContacts));
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> _contacts;

  ContactList(this._contacts);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemExtent: 80.0,
        itemCount: _contacts.length,
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (BuildContext context, int index) =>
            _buildContactList(index));
  }

  _ContactListItem _buildContactList(int index) {
    return new _ContactListItem(_contacts[index]);
  }
}

class _ContactListItem extends StatelessWidget {
  final Contact _contactItem;

  _ContactListItem(this._contactItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: new CircleAvatar(child: new Text(_contactItem.fullName[0])),
        onTap: () => Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text(_contactItem.fullName))),
        title: new Text(_contactItem.fullName),
        subtitle: new Text(_contactItem.email));
  }
}
