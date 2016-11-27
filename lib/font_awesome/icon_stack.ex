defmodule FontAwesome.IconStack do
  @moduledoc """
  A module to build stacked icons.
  """

  use Phoenix.HTML

  alias FontAwesome.{Icon, Size}

  defstruct [:size, icons: []]

  def new(options \\ []) do
    stack = %__MODULE__{}
    put_size(stack, options[:size])
  end

  def put_icon(%__MODULE__{icons: icons} = stack, %Icon{} = icon, position) do
    %{stack | icons: List.insert(icons, position, icon)}
  end

  def put_icon(%__MODULE__{icons: icons} = stack, %Icon{} = icon) do
    %{stack | icons: icons ++ [icon]}
  end

  def put_size(%__MODULE__{} = stack, size) do
    %{stack | size: size}
  end

  def render(icons) do
    icons = List.wrap(icons)
    content_tag :span, class: FontAwesome.css_prefix("stack") do
      for icon <- icons do
        icon
        |> Map.put(:stacked, true)
        |> Icon.render(icon)
      end
    end
  end
end
