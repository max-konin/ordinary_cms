Ordinary CMS
============

This is simple CMS integrated into [ActiveAdmin](http://www.activeadmin.info/). It use [mercury](http://jejacks0n.github.io/mercury/)
as wysiwyg html editor. This only works on MongoDB

# Installation

Add the following to your `Gemfile`:

```ruby
gem 'ordinary_cms'
```

Run install generator

```ruby
rails g ordinary_cms:install
```

If you have installed ActiveAdmin, run: 

```ruby
rails g ordinary_cms:install --skip-activeadmin
```

# Getting started

## Create a new page

Go to ActivaAdmin control panel and select menu "Ordinary Cms Pages". Click to create bottom. You can create a page with
an arbitrary number of content's section. 

## Override views

To override page's show view create file 'show.html.<haml/erb/slim>' in to 'views/ordinary_cms/pages'

To override show view of specific page create file '<page.name>.html.<haml/erb/slim>' in to 'views/ordinary_cms/pages'

## Render content

To render editable page's content using following method:

```ruby
@page.section('section_name').render
```

To render editable page's alias using following method:

```ruby
@page.section('section_name').render :alias
```

## Edit page's content

To edit page's content go to pages index page in active admin and click on link 'Edit content'. You will be redirected to
mercury editor for the specific page. 

## Factories

OrdinaryCMS has factories for build pages by a scheme.

To create factory create following code to your seed.rb

```ruby
OrdinaryCms::Factories::Page.create name: 'factory_name' sections: [{name: 'first, alias: 'First'}, {name: 'second, alias: 'second'} ...]
```

Run `db:seed`

Now you can select factory in select box on form for create page in ActiveAdmin. And when the page is to created it will be
have sections with names 'first' and 'second'

# Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

