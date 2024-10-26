// aa.dart

import 'package:flutter/material.dart';

class Playlist {
  String name;
  String category;
  List<String> songs;

  Playlist({
    required this.name,
    this.category = "General",
    required this.songs,
  });
}

class PlaylistManagementPage extends StatefulWidget {
  @override
  _PlaylistManagementPageState createState() => _PlaylistManagementPageState();
}

class _PlaylistManagementPageState extends State<PlaylistManagementPage> {
  // Initialize with some sample playlists
  List<Playlist> playlists = [
    Playlist(name: 'Favorites', category: 'Pop', songs: ['Song A', 'Song B']),
    Playlist(name: 'Workout', category: 'Rock', songs: ['Song X', 'Song Y']),
    Playlist(
        name: 'Chill Vibes', category: 'Lo-fi', songs: ['Song D', 'Song E']),
  ];

  // Function to add a new playlist
  void _addNewPlaylist(String playlistName, String category) {
    setState(() {
      playlists
          .add(Playlist(name: playlistName, category: category, songs: []));
    });
  }

  // Function to delete a playlist
  void _deletePlaylist(int index) {
    setState(() {
      playlists.removeAt(index);
    });
  }

  // Function to add a song to a playlist
  void _addSongToPlaylist(int playlistIndex, String songTitle) {
    setState(() {
      playlists[playlistIndex].songs.add(songTitle);
    });
  }

  // Function to remove a song from a playlist
  void _removeSongFromPlaylist(int playlistIndex, int songIndex) {
    setState(() {
      playlists[playlistIndex].songs.removeAt(songIndex);
    });
  }

  // Function to reorder songs within a playlist
  void _reorderSongs(int playlistIndex, int oldIndex, int newIndex) {
    setState(() {
      final song = playlists[playlistIndex].songs.removeAt(oldIndex);
      playlists[playlistIndex].songs.insert(newIndex, song);
    });
  }

  // Show dialog to add a new playlist
  void _showAddPlaylistDialog() {
    String newPlaylistName = "";
    String selectedCategory = "General";
    final availableCategories = ['Pop', 'Rock', 'Lo-fi', 'General'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Playlist'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newPlaylistName = value;
                },
                decoration: InputDecoration(hintText: "Playlist Name"),
              ),
              DropdownButton<String>(
                value: selectedCategory,
                items: availableCategories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (newPlaylistName.isNotEmpty) {
                  _addNewPlaylist(newPlaylistName, selectedCategory);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Show dialog to add a new song to a specific playlist
  void _showAddSongDialog(BuildContext context, int playlistIndex) {
    String selectedSong = "";
    final availableSongs = [
      'Song A',
      'Song B',
      'Song C',
      'Song D',
      'Song E'
    ]; // Replace with your actual song list

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Song'),
          content: DropdownButton<String>(
            value: selectedSong.isEmpty ? availableSongs[0] : selectedSong,
            items: availableSongs.map((song) {
              return DropdownMenuItem(
                value: song,
                child: Text(song),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSong = value!;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (selectedSong.isNotEmpty) {
                  _addSongToPlaylist(playlistIndex, selectedSong);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Build the list of playlists categorized
  Widget _buildPlaylistList() {
    final categories = playlists.map((p) => p.category).toSet().toList();
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final categoryPlaylists =
            playlists.where((p) => p.category == category).toList();
        return ExpansionTile(
          title: Text(category),
          children: categoryPlaylists.asMap().entries.map((entry) {
            int playlistIndex = playlists.indexOf(entry.value);
            return ListTile(
              title: Text(entry.value.name),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _deletePlaylist(playlistIndex);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaylistSongsPage(
                      playlist: entry.value,
                      playlistIndex: playlistIndex,
                      addSongCallback: _addSongToPlaylist,
                      removeSongCallback: _removeSongFromPlaylist,
                      reorderSongsCallback: _reorderSongs,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playlist Management"),
        actions: [
          IconButton(
            icon: Icon(Icons.playlist_add),
            onPressed:
                _showAddPlaylistDialog, // Opens dialog to add a new playlist
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: _buildPlaylistList(),
    );
  }
}

// Separate page to manage songs within a playlist
class PlaylistSongsPage extends StatelessWidget {
  final Playlist playlist;
  final int playlistIndex;
  final Function(int, String) addSongCallback;
  final Function(int, int) removeSongCallback;
  final Function(int, int, int) reorderSongsCallback;

  PlaylistSongsPage({
    required this.playlist,
    required this.playlistIndex,
    required this.addSongCallback,
    required this.removeSongCallback,
    required this.reorderSongsCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playlist.name),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          reorderSongsCallback(playlistIndex, oldIndex, newIndex);
        },
        children: List.generate(playlist.songs.length, (index) {
          return ListTile(
            key: ValueKey(index),
            title: Text(playlist.songs[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                removeSongCallback(playlistIndex, index);
              },
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddSongDialog(context),
      ),
    );
  }

  // Internal method to show add song dialog
  void _showAddSongDialog(BuildContext context) {
    String selectedSong = "";
    final availableSongs = [
      'Song A',
      'Song B',
      'Song C',
      'Song D',
      'Song E'
    ]; // Replace with your actual song list

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Song'),
          content: DropdownButton<String>(
            value: selectedSong.isEmpty ? availableSongs[0] : selectedSong,
            items: availableSongs.map((song) {
              return DropdownMenuItem(
                value: song,
                child: Text(song),
              );
            }).toList(),
            onChanged: (value) {
              selectedSong = value!;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (selectedSong.isNotEmpty) {
                  addSongCallback(playlistIndex, selectedSong);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
