defmodule FontAwesome.Icon do
  @moduledoc """
  A struct to define the configuration for a specific icon.
  """

  use Phoenix.HTML

  import FontAwesome.Utils, only: [css_prefix: 0, css_prefix: 1]

  alias FontAwesome.Config

  @enforce_keys [:name]
  defstruct [:name, outline: false, direction: nil,
             fixed_width: Config.fixed_width?, size: nil, rotate: 0, flip: nil,
             list: false, border: false, pull: nil, animate: nil,
             stacked: false]

  @doc """
  Creates new icon with the specified `name` and `options`.
  """
  def new(name, options \\ []) do
    icon = %__MODULE__{name: sanitize_name(name)}
    struct(icon, options)
  end

  @doc """
  Renders the HTML code for the icon.
  """
  def to_string(%__MODULE__{} = icon) do
    icon
    |> to_safe_string
    |> safe_to_string
  end

  @doc """
  Renders the safe HTML code for the icon.
  """
  def to_safe_string(%__MODULE__{} = icon) do
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

  defp get_classes(icon) do
    modifiers = for {key, value} <- Map.from_struct(icon),
                    class = get_class(key, value),
                    !is_nil(class),
                    do: class
    [css_prefix, get_name(icon)] ++ modifiers
  end

  defp get_name(%{name: name, outline: true, direction: dir}) do
    css_prefix([name, "o", dir])
  end

  defp get_name(%{name: name, outline: false, direction: dir}) do
    css_prefix([name, dir])
  end

  defp get_class(_key, nil), do: nil

  defp get_class(:size, value) when is_integer(value) do
    css_prefix("#{value}x")
  end

  defp get_class(:size, value), do: css_prefix(value)

  defp get_class(:fixed_width, true), do: css_prefix("fw")

  defp get_class(:stacked, true), do: css_prefix("stack")

  defp get_class(:rotate, 0), do: nil
  defp get_class(:rotate, value) when is_integer(value) do
    css_prefix(["rotate", value])
  end

  defp get_class(:flip, direction), do: css_prefix(["flip", direction])

  defp get_class(:list, true), do: css_prefix("li")

  defp get_class(:border, true), do: css_prefix("border")

  defp get_class(:pull, side), do: css_prefix(["pull", side])

  defp get_class(:animate, style), do: css_prefix(style)

  defp get_class(_key, _value), do: nil
end

defimpl String.Chars, for: FontAwesome.Icon do
  def to_string(icon) do
    FontAwesome.Icon.to_string(icon)
  end
end

defimpl Phoenix.HTML.Safe, for: FontAwesome.Icon do
  def to_iodata(icon) do
    {:safe, data} = FontAwesome.Icon.to_safe_string(icon)
    data
  end
end
