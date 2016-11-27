defmodule FontAwesome do
  alias FontAwesome.Icon

  @css_prefix "fa"

  @doc """
  Gets the CSS prefix.
  """
  def css_prefix, do: @css_prefix

  @doc """
  Prefixes the given binary.
  """
  def css_prefix(nil), do: @css_prefix
  def css_prefix(str), do: "#{@css_prefix}-#{str}"

  def icon(name, options \\ []) do
    name
    |> Icon.new(options)
    |> Icon.render
  end
end
