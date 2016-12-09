# font_awesomex

[![Build Status](https://travis-ci.org/tlux/font_awesomex.svg?branch=master)](https://travis-ci.org/tlux/font_awesomex)

A library to render [Font Awesome](http://fontawesome.io/) markup.
Integrates seamlessly with your [Phoenix](http://phoenixframework.org)
application.

:warning: **This repository does not contain any Font Awesome assets.** :warning:

## Prerequisites

* Elixir (>= 1.3)
* Font Awesome 4 (use your favorite package manager like [NPM](https://www.npmjs.com/package/font-awesome))

## Installation

Add `font_awesomex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:font_awesomex, "~> 4.0.0"}]
end
```

## Usage

### Plain Ol' Elixir

```elixir
iex> icon = FontAwesome.icon(:stop_circle, outline: true, size: 3)
%FontAwesome.Icon{name: "stop-circle", outline: true, size: 3, ...}

iex> to_string(icon)
"<i class=\"fa fa-stop-circle-o fa-size-3x\"></i>"
```

Following options are available:

| Name           | Description                                       | Values                     | CSS Classes           |
| -------------- | --------------------------------------------------|----------------------------|-----------------------|
| `:outline`     | Renders the outline variant (only some icons)                       | `true`, `false`            | name suffixed with `-o`      |
| `:direction`   | Defines the direction (only some icons)           | `:left`, `:right`, `:up`, `:down` | name suffixed with `-left`, `-right`, ...
| `:fixed_width` | Fixes the icon width (may be configured globally) | `true`, `false`            | `fa-fw`               |
| `:size`        | Scales the icon                                   | `:lg`, `2`, `3`, `4`       | `fa-lg`, `fa-2x`      |
| `:rotate`      | Rotates the icon                                  | `0`, `90`, `180`, `270`    | `fa-rotate-90`        |
| `:flip`        | Flips the icon horizontally or vertically         | `:horizontal`, `:vertical` | `fa-flip-vertical`    |
| `:animate`     | Adds an animation to the icon                     | `:spin`, `:pulse`          | `fa-spin`, `fa-pulse` |
| `:list`        | Treats the icon as list bullet                    | `true`, `false`            | `fa-li`               |
| `:border`      | Adds a border to the icon                         | `true`, `false`            | `fa-border`           |
| `:pull`        | Aligns the icon left or right                     | `:left`, `:right`          | `fa-pull-left`        |
| `:stacked`     | Indicates whether the icon is used in a stack     | `true`, `false`            | `fa-stack`            |

### Phoenix Framework

To integrate the icon helpers with Phoenix views and templates you simply need
to use it on top of your file:


```elixir
defmodule MyApp.PageView do
  use MyApp.Web, :view
  use FontAwesome

  def hello_world do
    content_tag :div do
      [
        icon(:smile, outline: true, animate: :spin, size: 3),
        "Hello World"
      ]
    end
  end
end
```

If you want to add the helper to all views and templates, you can use or import
it in the view/0 function of your web/web.ex file:


```elixir
defmodule MyProject.Web do
  def view do
    quote do
      # Provides the icon/1 and icon/2 functions to all views and templates
      use FontAwesome
    end
  end
end
```

There may be cases when the default name (icon) conflicts with your existing
implementation. In these cases you can define a name when using the module:

```elixir
defmodule MyApp.PageView do
  use MyApp.Web, :view
  use FontAwesome, as: :fa_icon

  def scroll_down do
    [
      fa_icon(:arrow, direction: :down),
      "Scroll Down"
    ]
  end
end
```

### Global Configuration

Alternatively, the helper name may be defined globally right from the start.
So everytime you use FontAwesome, it generates a helper with the name you
defined. Add this line to your config/config.exs:

```elixir
config :font_awesomex, helper_name: :fa_icon
```

To make all icons have a fixed width by default, add the following line.

```elixir
config :font_awesomex, fixed_width: true
```

The value can still be overridden per-icon.

## What's missing

* Support for icon stacking

## Contribution

* Check out the latest master to make sure the feature hasn't been implemented
  or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it
  and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution. Make sure to add
  tests for it. This is important so I don't break it in a future version
  unintentionally.
