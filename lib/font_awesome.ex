defmodule FontAwesome do
  @moduledoc """
  The base base module that can be `import`ed or `use`d by view or template
  modules.
  """

  alias FontAwesome.{Config, Icon}

  @doc """
  Mixes the icon helper with the specified name into the module that is
  using `FontAwesome`. The name of the helper can be either configured globally
  or by specifying the `:as` option to the macro.
  """
  defmacro __using__(options) do
    quote location: :keep do
      @doc """
      Renders a Font Awesome icon.
      """
      def unquote(options[:as] || Config.helper_name)(name, options \\ []) do
        FontAwesome.render_icon(name, options)
      end
    end
  end

  @doc """
  Builds an icon with the given `name` and `options`.

  **Examples**

      iex> FontAwesome.icon("window-restore")
      %FontAwesome.Icon{name: "window-restore"}

      iex> FontAwesome.icon(:user_circle, outline: true)
      %FontAwesome.Icon{name: "user-circle", outline: true}
  """
  def icon(name, options \\ []) do
    Icon.new(name, options)
  end

  @doc """
  Renders the icon with the given `name` and `options`.

  **Examples**

      iex> FontAwesome.render_icon("window-restore")
      {:safe, [?<, "i", ~s( aria-hidden="true" class="fa fa-window-restore"),
               ?>, "", ?<, ?/, "i", ?>]}

      iex> FontAwesome.render_icon(:user_circle, outline: true)
      {:safe, [?<, "i", ~s( aria-hidden="true" class="fa fa-user-circle-o"),
               ?>, "", ?<, ?/, "i", ?>]}
  """
  def render_icon(name, options \\ []) do
    name
    |> Icon.new(options)
    |> Icon.to_safe_string
  end
end
