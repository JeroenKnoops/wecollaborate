# Active Admin

Active Admin is a Ruby on Rails framework for creating elegant backends for website administration.

[![](https://api.travis-ci.org/gregbell/active_admin.png)](http://travis-ci.org/gregbell/active_admin)
[![](https://codeclimate.com/github/gregbell/active_admin.png)](https://codeclimate.com/github/gregbell/active_admin)
[![](https://gemnasium.com/gregbell/active_admin.png)](https://gemnasium.com/gregbell/active_admin)
[![](https://coveralls.io/repos/gregbell/active_admin/badge.png)](https://coveralls.io/r/gregbell/active_admin)
[![](http://origin.shields.io/gittip/activeadmin.png)](https://www.gittip.com/activeadmin)

## Links

* Website: <http://www.activeadmin.info>
* Live demo: <http://demo.activeadmin.info/admin>
* Documentation
  * Guides: <http://activeadmin.info/documentation.html>
  * YARD: <http://rubydoc.info/gems/activeadmin/frames>
  * Wiki: <https://github.com/gregbell/active_admin/wiki>

## Goals

1. Allow developers to quickly create gorgeous administration interfaces __(Not Just CRUD)__
2. Build a DSL for developers and an interface for businesses.
3. Ensure that developers can easily customize every nook and cranny of the interface.
4. Build common interfaces as shareable gems so that the entire community benefits.

## Rails 4

There isn't yet an official release that supports Rails 4. For now, you'll have to use master:
```ruby
gem 'activeadmin', github: 'gregbell/active_admin'
```

## Getting started

Check out [the docs](https://github.com/gregbell/active_admin/blob/master/docs/0-installation.md)!

## Need help?

Ask the [mailing list](http://groups.google.com/group/activeadmin) or
[Stack Overflow](http://stackoverflow.com/questions/tagged/activeadmin).

## Want to contribute?

The [contributing guide](https://github.com/gregbell/active_admin/blob/master/CONTRIBUTING.md)
is a good place to start. If you have questions, feel free to ask
[@seanlinsley](https://twitter.com/seanlinsley).

## Dependencies

We try not to reinvent the wheel, so Active Admin is built with other open source projects:

Tool                  | Description
--------------------- | -----------
[Arbre]               | Ruby -> HTML, just like that.
[Devise]              | Powerful, extensible user authentication
[Formtastic]          | A Rails form builder plugin with semantically rich and accessible markup
[Iconic Icons]        | An excellent SVG icon set designed by P.J. Onori
[Inherited Resources] | Simplifies controllers with pre-built RESTful controller actions
[Kaminari]            | Elegant pagination for any sort of collection

[Arbre]: https://github.com/gregbell/arbre
[Devise]: https://github.com/plataformatec/devise
[Formtastic]: https://github.com/justinfrench/formtastic
[Iconic Icons]: http://somerandomdude.com/projects/iconic
[Inherited Resources]: https://github.com/josevalim/inherited_resources
[Kaminari]: https://github.com/amatsuda/kaminari
