defmodule FontAwesome do
  @moduledoc """
  The base FontAwesome module.
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
      Renders a FontAwesome icon.
      """
      def unquote(options[:as] || Config.helper_name)(name, options \\ []) do
        FontAwesome.icon(name, options)
      end
    end
  end

  @doc """
  Renders the icon with the given `name` and `options`.
  """
  def icon(name, options \\ []) do
    Icon.new(name, options)
  end
end
