List fields that you want to index accross collection.
Check what field are being indexed for specific collection:

```
use %db_name$
db.%collection_name%.getIndexes()
```

Following indexing must be set on mongo instance after all imports passed (please check for set indexes before):

- artionshared

```javascript
db.collections.createIndex({
  collectionName: 'text',
  description: 'text',
  erc721Address: 'text',
});
db.accounts.createIndex({ alias: 'text', address: 'text' });
```

- artion

```javascript
db.tokens.createIndex({ name: 'text', desc: 'text' });
```
