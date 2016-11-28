defmodule FontAwesomeTest do
  @moduledoc false

  use ExUnit.Case
  doctest FontAwesome

  setup do
    Application.delete_env(:font_awesome, :helper_name)
  end

  test "import of the default icon function when used" do
    defmodule TestView1 do
      @moduledoc false
      use FontAwesome
    end

    assert function_exported?(TestView1, :icon, 1)
    assert function_exported?(TestView1, :icon, 2)
    assert to_string(TestView1.icon(:custom, animate: :spin)) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-spin"></i>)
  end

  test "import of the globally custom named :fa_icon function when used" do
    Application.put_env(:font_awesome, :helper_name, :fa_icon)
    defmodule TestView2 do
      @moduledoc false
      use FontAwesome
    end

    assert function_exported?(TestView2, :fa_icon, 1)
    assert function_exported?(TestView2, :fa_icon, 2)
    assert to_string(TestView2.fa_icon(:custom, animate: :spin)) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-spin"></i>)
  end

  test "import of the custom named :fa_icon function when used" do
    Application.put_env(:font_awesome, :helper_name, :fa_icon)
    defmodule TestView3 do
      @moduledoc false
      use FontAwesome, as: :test_icon
    end

    assert function_exported?(TestView3, :test_icon, 1)
    assert function_exported?(TestView3, :test_icon, 2)
    assert to_string(TestView3.test_icon(:custom, outline: true, rotate: 90)) ==
           ~s(<i aria-hidden="true" class="fa fa-custom-o fa-rotate-90"></i>)
  end
end
