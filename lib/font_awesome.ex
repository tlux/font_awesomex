defmodule FontAwesome do
  alias FontAwesome.Icon

  @css_prefix "fa"

  @doc """
  Gets the CSS prefix.
  """
  def css_prefix, do: @css_prefix

  @doc """
  Prefixes the given binary or list.
  """
  def css_prefix(nil), do: @css_prefix

  def css_prefix(values) when is_list(values) do
    values
    |> Enum.join("-")
    |> css_prefix
  end

  def css_prefix(value), do: "#{@css_prefix}-#{value}"

  def icon(name, options \\ []) do
    name
    |> Icon.new(options)
    |> Icon.render
  end
end
