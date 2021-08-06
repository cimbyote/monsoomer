import 'package:flutter/material.dart';
import '../side_menu.dart';
import 'package:monsoomer/services/api_service.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  APIService _apiService = APIService();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late FloatingSearchBarController _searchBarController;

  static const maxHistoryLength = 5;
  List<String> _searchHistory = [
  ];

  late List<String> filteredSearchHistory;

  String? selectedTerm;

  List<String> filterSearchTerms({
    required String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      // Reversed because we want the last added items to appear first in the UI
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter)).toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      // This method will be implemented soon
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > maxHistoryLength) {
      _searchHistory.removeRange(0, _searchHistory.length - maxHistoryLength);
    }
    // Changes in _searchHistory mean that we have to update the filteredSearchHistory
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  @override
  void initState() {
    super.initState();
    _searchBarController = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Search'),
        elevation: 0.0,
      ),
      body: FloatingSearchBar(
        controller: _searchBarController,
          body: FloatingSearchBarScrollNotifier(
            child: SearchBarResultsListView(
              searchTerm: selectedTerm,
            ),
          ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Text(
          selectedTerm ?? 'Find a Movie or TV show',
          style: Theme.of(context).textTheme.headline6,
        ),
        hint: 'Search for a title',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          _searchBarController.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.black,
              elevation: 4,
              child: Builder(
                builder: (context) {
                  if (filteredSearchHistory.isEmpty &&
                      _searchBarController.query.isEmpty) {
                    return Container(
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Start searching',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  }
                  else if (filteredSearchHistory.isEmpty) {
                    return ListTile(
                      title: Text(_searchBarController.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        setState(() {
                          addSearchTerm(_searchBarController.query);
                          selectedTerm = _searchBarController.query;
                        });
                        _searchBarController.close();
                      },
                    );
                  }
                  else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchHistory
                          .map(
                            (term) => ListTile(
                          title: Text(
                            term,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: const Icon(Icons.history),
                          trailing: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                deleteSearchTerm(term);
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              putSearchTermFirst(term);
                              selectedTerm = term;
                            });
                            _searchBarController.close();
                          },
                        ),
                      )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
class SearchBarResultsListView extends StatelessWidget {
  final String? searchTerm;

  SearchBarResultsListView({required this.searchTerm});


  @override
  Widget build(BuildContext context) {

    final fsb = FloatingSearchBar.of(context);
    if(searchTerm == null)
      {
        return Container();
      }
    else{
    return ListView(
      padding: EdgeInsets.only(top: 48.0 + 8),
      children: List.generate(
        50,
            (index) => ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        ),
      ),
    );}
  }
}