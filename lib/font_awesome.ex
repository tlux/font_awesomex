defmodule FontAwesome do
  alias FontAwesome.Icon

  def icon(name, options \\ []) do
    name
    |> Icon.new(options)
    |> Icon.render
  end
end
