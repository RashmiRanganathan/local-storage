# Local storage in Flutter
1. Shared Preference
2. Local database
3. Local files

```Flutter version: 1.22.5```
## Shared Preference
key-value pair stored in XML files.
DataTypes - float, int, long, boolean and string
Flutter package: shared_preferences
```
sharedPreferences = await SharedPreferences.getInstance();
sharedPreferences.setString(key, value);
sharedPreferences.get(key);
sharedPreferences.remove(key);
```

## Local Files
Save strings, images, and objects to files - after serialized to strings.
DataTypes - string
Flutter package: path_provider
```
final directory = await getApplicationDocumentsDirectory();
await file.readAsString();
await file.writeAsString(data);
```

## Local SQL database
Save Complex objects in Table
DataTypes - Table
Flutter package: sqflite
```
database = await openDatabase( join(await getDatabasesPath(), '$tableName.db') );
await database.insert( tableName, json );
await database.query(tableName);
```
