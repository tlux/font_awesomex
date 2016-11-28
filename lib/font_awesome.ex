defmodule FontAwesome do
  @moduledoc """
  The base FontAwesome module.
  """

  alias FontAwesome.Icon

  @css_prefix "fa"

  @doc """
  Gets the CSS prefix.

  **Examples**

      iex> FontAwesome.css_prefix
      "fa"
  """
  def css_prefix, do: @css_prefix

  @doc """
  Prefixes the given binary or list.

  **Examples**

      iex> FontAwesome.css_prefix("custom")
      "fa-custom"

      iex> FontAwesome.css_prefix(["custom", "key"])
      "fa-custom-key"

      iex> FontAwesome.css_prefix(nil)
      "fa"
  """
  def css_prefix(nil), do: @css_prefix

  def css_prefix(values) when is_list(values) do
    values
    |> Enum.join("-")
    |> css_prefix
  end

  def css_prefix(value), do: "#{@css_prefix}-#{value}"

  @doc """
  Renders the icon with the given `name` and `options`.
  """
  def icon(name, options \\ []) do
    Icon.new(name, options)
  end

  defmacro __using__(_) do
    quote location: :keep do
      @doc """
      Generates a font awesome icon.
      """
      def fa_icon(name, options \\ []) do
        FontAwesome.icon(name, options)
      end
    end
  end
end
