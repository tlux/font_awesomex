defmodule FontAwesome.Config do
  @moduledoc """
  A module that is used to access application-wide defaults.
  """

  @doc """
  Determines whether all icons are fixed width by default.

  **Examples**

      iex> Application.delete_env(:font_awesome, :fixed_width)
      iex> FontAwesome.Config.fixed_width?
      false

      iex> Application.put_env(:font_awesome, :fixed_width, false)
      iex> FontAwesome.Config.fixed_width?
      false

      iex> Application.put_env(:font_awesome, :fixed_width, true)
      iex> FontAwesome.Config.fixed_width?
      true
  """
  def fixed_width?, do: get_value(:fixed_width, false)

  @doc """
  Gets the default name of the helper function that is created in modules
  using the `FontAwesome` module.

  **Examples**

      iex> Application.delete_env(:font_awesome, :helper_name)
      iex> FontAwesome.Config.helper_name
      :icon

      iex> Application.put_env(:font_awesome, :helper_name, :fa_icon)
      iex> FontAwesome.Config.helper_name
      :fa_icon
  """
  def helper_name, do: get_value(:helper_name, :icon)

  defp get_value(key, default) do
    Application.get_env(:font_awesome, key, default)
  end
end
