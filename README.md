# Manyfaced

Our models may be many faced. And our goal is to provide easy and convenient way to render all of them!

Some of the features are:

1. Implicitly tracking current view context for rendering
2. Collection rendering
3. Partial rendering
4. Several self-rendering views

Can used with all of ruby objects - ActiveRecord models or PORO.

## Installation

Add this line to your application's Gemfile:

    gem 'manyfaced'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install manyfaced

## Usage

### Placing

Renderers must be contained in `app/renderers` folder. Also you need to
add this path for autoloading in `config/application.rb`

```ruby
config.autoload_paths += %W(#{config.root}/app/renderers)
```

### Defining renderers

Renderer class name must be a part of target class name and `Renderer`
suffix. For example, for `User` class renderer will be called as
`UserRenderer`.

But if target class is in hierarchy renderer class must
be placed in the same one. For example, for `MyApp::User` class renderer
will be called as `MyApp::UserRenderer`. This is done to avoid conflicts when there are multiple classes with the same name but in different modules.

### Attach renderer

For attaching renderer to model simple add next line to the top of class
definition:

```ruby
class User
  include Manyfaced::Concerns::Renderable
end
```

### Self rendering

Self-rendering means that will be several representations of model in different places. For this `#rendering` method is available. By conventions views for self rendering are contained in `views/<plural_model_name>/render/`.

See examples below:

```ruby
# Imagine that user is instance of User class that is defined above

# By default '_default' partial will be rendered
user.rendering

# '_on_main' partial will be rendered
user.rendering as: :on_main

# Passing additional params also available
user.rendering as: :on_main, { param1: :value1 }
```

In partial model instance will be available by singular name of the one.

### Partial rendering

Partial rendering means that will be some partial represantations of the
model. For example, for _user_ it may be blocks of reputation, avatar
with nickname and others.

By conventions views for partial rendering are contained in
`views/<plural_model_name>/shared/`.

See some examples below:

```ruby
class UserRenderer < Manyfaced::Renderer
  # Defining method for rendering reputation block.
  # May used with calling as `user.render_reputation`
  render :reputation do
    render :reputation, { value: user.reputation_value }
  end

  # If your definition is like below you may do not do this.
  # By default if you calling something like `#render_bla_bla` on model
  # '_bla_bla' partial will be rendered. This ability adds some magic
  # and sometimes not so obvious but let will be available whiles)
  render :avatar_block do
    render :avatar_block
  end
end
```

### Collection rendering

Along with self-rendering and partial rendering is avaible another feature - collection rendering. It is available through already known `#rendering` method!

See examples below:

```ruby
users = User.all

# `#rendering` method also available on models collection with attached
# renderer
users.rendering as: :on_main
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/manyfaced/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
