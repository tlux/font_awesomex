defmodule FontAwesome.Icon do
  @moduledoc """
  A struct to define the configuration for a specific icon.
  """

  use Phoenix.HTML

  import FontAwesome, only: [css_prefix: 0, css_prefix: 1]

  @default_fixed_width Application.get_env(:font_awesome, :fixed_width, false)

  @enforce_keys [:name]
  defstruct [:name, stacked: false, outline: false,
             fixed_width: @default_fixed_width, size: nil, rotate: 0, flip: nil,
             list: false, border: false, pull: nil, animate: nil]

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
  def to_safe_string(%__MODULE__{} = icon) do
    css = icon |> get_classes |> Enum.join(" ")
    content_tag(:i, nil, class: css, aria_hidden: "true")
  end

  @doc """
  Renders the HTML code for the icon.
  """
  def to_string(%__MODULE__{} = icon) do
    icon
    |> to_safe_string
    |> safe_to_string
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

  defp get_name(%{name: name, outline: true}), do: css_prefix("#{name}-o")
  defp get_name(%{name: name, outline: false}), do: css_prefix(name)

  def get_class(_key, nil), do: nil

  def get_class(:size, value) when is_integer(value) do
    css_prefix("#{value}x")
  end

  def get_class(:size, value), do: css_prefix(value)

  def get_class(:fixed_width, true), do: css_prefix("fw")

  def get_class(:stacked, true), do: css_prefix("stack")

  def get_class(:rotate, 0), do: nil
  def get_class(:rotate, value) when is_integer(value) do
    css_prefix(["rotate", value])
  end

  def get_class(:flip, direction), do: css_prefix(["flip", direction])

  def get_class(:list, true), do: css_prefix("li")

  def get_class(:border, true), do: css_prefix("border")

  def get_class(:pull, side), do: css_prefix(["pull", side])

  def get_class(:animate, style), do: css_prefix(style)

  def get_class(_key, _value), do: nil
end

defimpl String.Chars, for: FontAwesome.Icon do
  def to_string(icon) do
    FontAwesome.Icon.to_string(icon)
  end
end

defimpl Phoenix.HTML.Safe, for: FontAwesome.Icon do
  def to_iodata(icon) do
    case FontAwesome.Icon.to_safe_string(icon) do
      {:safe, data} ->
        data
      value ->
        raise Protocol.UndefinedError, protocol: @protocol, value: value
    end
  end
end
