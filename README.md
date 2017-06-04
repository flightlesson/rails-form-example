# Experimenting with Dojo widgets in a Rails application

Building a simple application around a database with many-one and
many-many relationships; the goal is to experiment with Dojo widgets
to find patterns in the GUI Javascript.

## The Back End Rails application

The back end provides the REST API:

```
$ rake routes
                Prefix Verb   URI Pattern                               Controller#Action
                  root GET    /                                         portals#index
                 index GET    /index(.:format)                          portals#index {:format=>/html/}
authentication_methods GET    /api/authentication_methods(.:format)     authentication_methods#index {:format=>/json/}
                       POST   /api/authentication_methods(.:format)     authentication_methods#create {:format=>/json/}
 authentication_method PATCH  /api/authentication_methods/:id(.:format) authentication_methods#update {:format=>/json/}
                       PUT    /api/authentication_methods/:id(.:format) authentication_methods#update {:format=>/json/}
                       DELETE /api/authentication_methods/:id(.:format) authentication_methods#destroy {:format=>/json/}
           permissions GET    /api/permissions(.:format)                permissions#index {:format=>/json/}
                       POST   /api/permissions(.:format)                permissions#create {:format=>/json/}
            permission PATCH  /api/permissions/:id(.:format)            permissions#update {:format=>/json/}
                       PUT    /api/permissions/:id(.:format)            permissions#update {:format=>/json/}
                       DELETE /api/permissions/:id(.:format)            permissions#destroy {:format=>/json/}
                 roles GET    /api/roles(.:format)                      roles#index {:format=>/json/}
                       POST   /api/roles(.:format)                      roles#create {:format=>/json/}
                  role PATCH  /api/roles/:id(.:format)                  roles#update {:format=>/json/}
                       PUT    /api/roles/:id(.:format)                  roles#update {:format=>/json/}
                       DELETE /api/roles/:id(.:format)                  roles#destroy {:format=>/json/}
                 users GET    /api/users(.:format)                      users#index {:format=>/json/}
                       POST   /api/users(.:format)                      users#create {:format=>/json/}
                  user PATCH  /api/users/:id(.:format)                  users#update {:format=>/json/}
                       PUT    /api/users/:id(.:format)                  users#update {:format=>/json/}
                       DELETE /api/users/:id(.:format)                  users#destroy {:format=>/json/}
$
```

### GET	/

Gets the entry page to the web application.

### GET	/api/:table

Lists rows from :table, which can be authentication_methods, permissions, roles, or users.

Returns a JSON string describing an array of rows, or a JSON string describing a hash with key 'error' whose value describes the error.


### POST	/api/:table

Add a new row to :table, which can be authentication_methods, permissions, roles, or users.

Returns a JSON string describing the row that was added, or a JSON string describing a hash with key 'error' whose value describes the error, for example:
```
{'error':'RecordNotUnique'}
```

### PUT /api/:table/:id

Updates a row in :table, which can be authentication_methods, permissions, roles, or users.

Returns a JSON string describing the row that was updated, or a JSON string describing a hash with key 'error' whose value describes the error, for example:
```
{'error':'RecordNotFound'}
```

### DELETE /api/:table/:id

Deletes a row from :table, which can be authentication_methods, permissions, roles, or users.

Returns a JSON string describing the row that was deleted, or a JSON string describing a hash with key 'error' whose value describes the error, for example:
```
{'error':'RecordNotFound'}
```


