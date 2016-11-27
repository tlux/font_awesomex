defmodule FontAwesome.Icon do
  @moduledoc """
  A struct that holds icon settings.
  """

  use Phoenix.HTML

  @default_fixed_width Application.get_env(:font_awesome, :fixed_width, false)

  @enforce_keys [:name]
  defstruct [:name, stacked: false, outline: false,
             fixed_width: @default_fixed_width, size: nil, rotate: 0, flip: nil,
             list: false, border: false, animation: nil]

  @doc """
  Creates new icon with the specified `name` and `options`.
  """
  def new(name, options \\ []) do
    icon = %__MODULE__{name: sanitize_name(name)}
    struct(icon, options)
  end

  @doc """
  Renders the safe HTML code for the icon.
  """
  def render(%__MODULE__{} = icon) do
    css = icon |> get_classes |> Enum.join(" ")
    content_tag(:i, nil, class: css, aria_hidden: "true")
  end

  defp sanitize_name(nil) do
    raise ArgumentError, message: "No icon name given"
  end

  defp sanitize_name(name) when is_atom(name) do
    name
    |> Atom.to_string
    |> sanitize_name
  end

  defp sanitize_name(name) when is_binary(name) do
    String.replace(name, "_", "-")
  end

  def get_classes(%__MODULE__{} = icon) do
    [get_icon_name(icon)] ++ get_transformations(icon)
  end

  defp get_icon_name(%{name: name, outline: true}) do
    FontAwesome.css_prefix("#{name}-o")
  end

  defp get_icon_name(%{name: name, outline: false}) do
    FontAwesome.css_prefix(name)
  end

  defp get_transformations(icon) do
    [] # TODO
  end
end
