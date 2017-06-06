# Rails experiments:

## Separation of API from portal

See [portals_controller.rb](app/controllers/portals_controller.rb).

## Back-end Front-end impedence mismatch:

For example, the front wants to provide a user editor form that contains a multiselect for choosing which roles the user has. But the back end doesn't easily provide a list like
```
[{"id":"1","role":"admin"},{"id":"2","role":"user","selected":true}]
```

## Migration issues:

Can migrations really produce an Enterprise-quality database?

