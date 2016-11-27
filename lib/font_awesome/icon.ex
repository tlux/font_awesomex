defmodule FontAwesome.Icon do
  @moduledoc """
  A struct that holds icon settings.
  """

  use Phoenix.HTML

  @modifiers %{
    outline: false,
    fixed_width: true,
    size: nil,
    rotate: 0,
    flip: nil,
    list: false,
    border: false,
    animation: nil
  }

  @enforce_keys [:name]
  defstruct [:name, stacked: false] ++ Map.to_list(@modifiers)

  @doc """
  Creates new icon with the specified `name` and `options`.
  """
  def new(name, options \\ []) do
    icon = %__MODULE__{name: sanitize_name(name)}
    Enum.reduce(options, icon, fn {key, value}, icon ->
      put(icon, key, value)
    end)
  end

  @doc """
  Gets the full name of the icon with the outline modifier appended to it.
  """
  def icon_name(%__MODULE__{name: name, outline: true}), do: "fa-#{name}-o"
  def icon_name(%__MODULE__{name: name, outline: false}), do: "fa-#{name}"

  Enum.each(@modifiers, fn {key, _default} ->
    @doc """
    Sets the `:#{key}` modifier with the specified value for the given icon.
    """
    def unquote(key)(icon, key, value) do
      put(icon, unquote(key), value)
    end
  end)

  @doc """
  Sets the given modifier for the icon. Possible `keys` are `:outline`,
  `:fixed_width`, `:size`, `:rotate`, `:flip`, `:list`, `:border`, `:animation`.
  When the specified value is `nil`, resets the modifier to its default.
  """
  def put(%__MODULE__{} = icon, key, nil), do: delete(icon, key)
  def put(%__MODULE__{} = icon, key, value), do: Map.put(icon, key, value)

  @doc """
  Removes the given modifier from the icon, restoring the particular default
  value.
  """
  def delete(%__MODULE__{} = icon, key) do
    Map.put(icon, key, @modifiers[key])
  end

  @doc """
  Renders the safe HTML code for the icon.
  """
  def render(%__MODULE__{} = icon) do
    content_tag(:i, nil, class: FontAwesome.css_prefix, aria_hidden: "true")
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
end
