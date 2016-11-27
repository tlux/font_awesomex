defmodule FontAwesome.Transformation do
  @moduledoc """
  A module that defines CSS rule transformations for icons.
  """

  def to_string(transformations) when is_map(transformations) do
    values = for {key, value} <- transformations,
                 css = to_css(key, value), !is_nil(css),
                 do: FontAwesome.css_prefix(css)
    Enum.join(values, " ")
  end

  def to_css(_key, nil), do: nil
  def to_css(_key, false), do: nil

  # Fixed Width

  def to_css(:fixed_width, true), do: "fw"

  # Flip

  def to_css(:flip, direction), do: "flip-#{direction}"

  # Rotate

  def to_css(:rotate, 0), do: nil
  def to_css(:rotate, deg), do: "rotate-#{deg}"

  # Size

  def to_css(:size, 1), do: nil
  def to_css(:size, size) when is_integer(size), do: "#{size}x"
  def to_css(:size, size), do: Kernel.to_string(size)
end
