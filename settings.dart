import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('General'),
          _buildSettingItem(
            title: 'Select your language',
            subtitle: 'English',
            onTap: () {
              // Handle language selection
            },
          ),
          _buildSettingItem(
            title: 'App country',
            subtitle: 'India',
            onTap: () {
              // Handle country selection
            },
          ),
          SizedBox(height: 20),
          _buildSectionTitle('Notifications'),
          _buildSwitchItem(
            title: 'Information about my crops',
            value: true,
            onChanged: (bool value) {
              // Handle switch change
            },
          ),
          _buildSwitchItem(
            title: 'Popular Posts',
            value: true,
            onChanged: (bool value) {
              // Handle switch change
            },
          ),
          _buildSwitchItem(
            title: 'Answer to your post',
            value: true,
            onChanged: (bool value) {
              // Handle switch change
            },
          ),
          _buildSwitchItem(
            title: 'Upvote to your post',
            value: true,
            onChanged: (bool value) {
              // Handle switch change
            },
          ),
          _buildSwitchItem(
            title: 'New Follower!',
            value: true,
            onChanged: (bool value) {
              // Handle switch change
            },
          ),
          _buildSwitchItem(
            title: 'Post from someone you follow',
            value: true,
            onChanged: (bool value) {
              // Handle switch change
            },
          ),
          _buildSwitchItem(
            title: 'Comment from someone you follow',
            value: false,
            onChanged: (bool value) {
              // Handle switch change
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green[800],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green,
    );
  }
}
