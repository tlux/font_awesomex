defmodule FontAwesomeTest do
  @moduledoc false

  use ExUnit.Case, async: true
  doctest FontAwesome

  setup do
    Application.delete_env(:font_awesomex, :helper_name)
  end

  test "import of the default icon function when used" do
    defmodule TestView1 do
      @moduledoc false
      use FontAwesome
    end

    Code.ensure_loaded(TestView1)

    assert function_exported?(TestView1, :icon, 1)
    assert function_exported?(TestView1, :icon, 2)
    assert TestView1.icon(:custom, animate: :spin) ==
           {:safe, [?<, "i", " aria-hidden=\"true\" class=\"fa fa-custom fa-spin\"",
                    ?>, "", ?<, ?/, "i", ?>]}
  end

  test "import of the globally custom named :fa_icon function when used" do
    Application.put_env(:font_awesomex, :helper_name, :fa_icon)
    defmodule TestView2 do
      @moduledoc false
      use FontAwesome
    end

    Code.ensure_loaded(TestView2)

    assert function_exported?(TestView2, :fa_icon, 1)
    assert function_exported?(TestView2, :fa_icon, 2)
    assert TestView2.fa_icon(:custom, animate: :spin) ==
           {:safe, [?<, "i", " aria-hidden=\"true\" class=\"fa fa-custom fa-spin\"",
                    ?>, "", ?<, ?/, "i", ?>]}
  end

  test "import of the custom named :fa_icon function when used" do
    Application.put_env(:font_awesomex, :helper_name, :fa_icon)
    defmodule TestView3 do
      @moduledoc false
      use FontAwesome, as: :test_icon
    end

    Code.ensure_loaded(TestView3)

    assert function_exported?(TestView3, :test_icon, 1)
    assert function_exported?(TestView3, :test_icon, 2)
    assert TestView3.test_icon(:custom, outline: true, rotate: 90) ==
           {:safe, [?<, "i", " aria-hidden=\"true\" class=\"fa fa-custom-o fa-rotate-90\"",
                    ?>, "", ?<, ?/, "i", ?>]}
  end

  test "render HTML safe string" do
    defmodule TestView4 do
      use Phoenix.HTML
      use FontAwesome

      def hello_world_1, do: icon(:diamond)

      def hello_world_2 do
        content_tag :div, class: "wrapper" do
          [
            icon(:heart),
            "Hello World"
          ]
        end
      end
    end

    Code.ensure_loaded(TestView4)

    assert TestView4.hello_world_1 == {:safe,
             [?<, "i", " aria-hidden=\"true\" class=\"fa fa-diamond\"", ?>, "",
              ?<, ?/, "i", ?>]}
    assert TestView4.hello_world_2 == {:safe,
             [?<, "div", " class=\"wrapper\"", ?>,
               [[?<, "i", " aria-hidden=\"true\" class=\"fa fa-heart\"", ?>, "",
                 ?<, ?/, "i", ?>], "Hello World"], ?<, ?/, "div", ?>]}
  end
end
