defmodule FontAwesome.Icon do
  use Phoenix.HTML

  @ns "fa"
  @prefix "#{@ns}-"
  @constraints %{
    flip: [:horizontal, :vertical],
    rotate: [0, 90, 180, 270],
    animation: [:spin, :pulse]
  }

  @enforce_keys [:name]

  defstruct [:name, size: nil, fixed_width: true, list: false, border: false,
             outline: false, animation: nil, rotate: 0, flip: nil,
             classes: %{}]

  def new(name, options \\ []) do
    icon = %__MODULE__{name: sanitize_name(name)}
    Enum.reduce(options, icon, fn {key, value}, icon ->
      put(icon, key, value)
    end)
  end

  def render(%__MODULE__{} = icon) do
    content_tag(:i, nil, class: "fa", area_hidden: "true")
  end

  def put(%__MODULE__{} = icon, :size, value) when is_integer(value) do
    put(icon, :size, "#{value}x")
  end

  def put(%__MODULE__{} = icon, :size, value) when is_binary(value) do
    %{icon | size: value}
  end

  def put(%__MODULE__{} = icon, key, value) when is_atom(key) do
    constraints = @constraints[key]
    if constraints && !(value in constraints) do
      allowed_values = constraints
                       |> Enum.map(&inspect/1)
                       |> Enum.join(", ")
      raise ArgumentError, message: "Invalid value for #{key}: " <>
                                    "#{inspect(value)} (restricted " <>
                                    "to #{allowed_values})"
    end
    Map.put(icon, key, value)
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
