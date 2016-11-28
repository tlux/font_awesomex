defmodule FontAwesome.Utils do
  @moduledoc """
  A module that provides utility functions.
  """

  @css_prefix "fa"

  @doc """
  Gets the CSS prefix.

  **Examples**

      iex> FontAwesome.Utils.css_prefix
      "fa"
  """
  def css_prefix, do: @css_prefix

  @doc """
  Prefixes the given binary or list.

  **Examples**

      iex> FontAwesome.Utils.css_prefix(nil)
      "fa"

      iex> FontAwesome.Utils.css_prefix("custom")
      "fa-custom"

      iex> FontAwesome.Utils.css_prefix(["custom", "key"])
      "fa-custom-key"
  """
  def css_prefix(nil), do: @css_prefix

  def css_prefix(values) when is_list(values) do
    values
    |> Enum.join("-")
    |> css_prefix
  end

  def css_prefix(value), do: "#{@css_prefix}-#{value}"
end
