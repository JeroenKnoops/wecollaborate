# Customizing the Index Page

Filtering and listing resources is one of the most important tasks for
administering a web application. Active Admin provides many different tools for
you to build a compelling interface into your data for the admin staff.

Built in, Active Admin has the following index renderers:

* *Table*: A table drawn with each row being a resource ([View Table Docs](3-index-pages/index-as-table.md))
* *Grid*: A set of rows and columns each cell being a resource ([View Grid Docs](3-index-pages/index-as-grid.md))
* *Blocks*: A set of rows (not tabular) each row being a resource ([View Blocks Docs](3-index-pages/index-as-block.md))
* *Blog*: A title and body content, similar to a blog index ([View Blog Docs](3-index-pages/index-as-blog.md))

All index pages also support scopes, filters, pagination, action items, and
sidebar sections.

## Multiple Index Pages

Sometime you may want more than one index page for a resource to represent
different views to the user. If multiple index pages exist, Active Admin will
automatically build links at the top of the default index page. Including
multiple views is simple and requires creating multiple index components in
your resource.

```ruby
index do
  id_column
  column :image_title
  default_actions
end

index as: :grid do |product|
  link_to image_tag(product.image_path), admin_product_path(product)
end
```

The first index component will be the default index page unless you indicate
otherwise by setting :default to true.

```ruby
index do
  column :image_title
  default_actions
end

index as: :grid, default: true do |product|
  link_to image_tag(product.image_path), admin_product_path(product)
end
```

Active Admin does not limit the index page to be a table, block, blog or grid.
If you've [created your own index page](3-index-pages/create-an-index.md) it
can be included by setting :as to the class of the index component you created.

```ruby
index as: ActiveAdmin::Views::IndexAsTable do
  column :image_title
  default_actions
end
```

## Index Filters

By default the index screen includes a "Filters" sidebar on the right hand side
with a filter for each attribute of the registered model. You can customize the
filters that are displayed as well as the type of widgets they use.

To display a filter for an attribute, use the filter method

```ruby
ActiveAdmin.register Post do
  filter :title
end
```

Out of the box, Active Admin supports the following filter types:

* *:string* - A search field
* *:date_range* - A start and end date field with calendar inputs
* *:numeric* - A drop down for selecting "Equal To", "Greater Than" or "Less
  Than" and an input for a value.
* *:select* - A drop down which filters based on a selected item in a collection
  or all.
* *:check_boxes* - A list of check boxes users can turn on and off to filter

By default, Active Admin will pick the most relevant filter based on the
attribute type. You can force the type by passing the :as option.

```ruby
filter :author, as: :check_boxes
```

The :check_boxes and :select types accept options for the collection. By default
it attempts to create a collection based on an association. But you can pass in
the collection as a proc to be called at render time.

```ruby
filter :author, as: :check_boxes, collection: proc { Author.all }
```

You can change the filter label by passing a label option:

```ruby
filter :author, label: 'Something else'
```

By default, Active Admin will try to use ActiveModel I18n to determine the label.

Filters can also be disabled for a resource, a namespace or the entire
application.

To disable for a specific resource:

```ruby
ActiveAdmin.register Post do
  config.filters = false
end
```

To disable for a namespace, in the initializer:

```ruby
ActiveAdmin.setup do |config|
  config.namespace :my_namespace do |my_namespace|
    my_namespace.filters = false
  end
end
```

Or to disable for the entire application:

```ruby
ActiveAdmin.setup do |config|
  config.filters = false
end
```

You can also add a filter and still preserve the default filters:

```ruby
preserve_default_filters!
filter :author
```

## Index default sort order

You can define the default sort order for index pages:

```ruby
ActiveAdmin.register Post do
  config.sort_order = 'name_asc'
end
```

## Index pagination

You can set the number of records per page per resources:

```ruby
ActiveAdmin.register Post do
  config.per_page = 10
end
```

You can also disable pagination:

```ruby
ActiveAdmin.register Post do
  config.paginate = false
end
```

If you have a very large database, you might want to disable SELECT COUNT(*)
queries caused by the pagination info at the bottom of the page:

```ruby
ActiveAdmin.register Post do
  index pagination_total: false do
    # ...
  end
end
```

## Customizing Download Links

You can easily remove or customize the download links you want displayed:

```ruby
# Per resource:
ActiveAdmin.register Post do

  index download_links: false
  index download_links: [:pdf]
  index download_links: proc{ current_user.can_view_download_links? }

end

# For the entire application:
ActiveAdmin.setup do |config|

  config.download_links = false
  config.download_links = [:csv, :xml, :json, :pdf]
  config.download_links = proc { current_user.can_view_download_links? }

end
```
