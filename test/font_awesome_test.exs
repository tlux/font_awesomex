defmodule FontAwesomeTest do
  @moduledoc false

  use ExUnit.Case
  doctest FontAwesome

  test "import of the fa_icon function by using the FontAwesome module" do
    defmodule TestView do
      @moduledoc false
      use FontAwesome
    end

    assert function_exported?(TestView, :fa_icon, 1)
    assert function_exported?(TestView, :fa_icon, 2)
    assert to_string(TestView.fa_icon(:custom)) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end
end
