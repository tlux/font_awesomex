defmodule FontAwesome.IconTest do
  @moduledoc false

  use ExUnit.Case
  doctest FontAwesome.Icon

  alias FontAwesome.Icon

  test "name adds its own class selector" do
    assert to_string(%Icon{name: "custom"}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "stacked option adds 'fa-stack' class" do
    assert to_string(%Icon{name: "custom", stacked: true}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-stack"></i>)
    assert to_string(%Icon{name: "custom", stacked: false}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "outline option appends '-o' suffix to the name selector" do
    assert to_string(%Icon{name: "custom", outline: true}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom-o"></i>)
    assert to_string(%Icon{name: "custom", outline: false}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "fixed_width option adds 'fa-fw' class" do
    assert to_string(%Icon{name: "custom", fixed_width: true}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-fw"></i>)
    assert to_string(%Icon{name: "custom", fixed_width: false}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "size option adds its own class" do
    assert to_string(%Icon{name: "custom", size: :lg}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-lg"></i>)
    assert to_string(%Icon{name: "custom", size: "lg"}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-lg"></i>)
    assert to_string(%Icon{name: "custom", size: 2}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-2x"></i>)
    assert to_string(%Icon{name: "custom", size: 3}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-3x"></i>)
    assert to_string(%Icon{name: "custom", size: nil}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "rotate option adds its own class" do
    assert to_string(%Icon{name: "custom", rotate: 0}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
    assert to_string(%Icon{name: "custom", rotate: 90}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-rotate-90"></i>)
    assert to_string(%Icon{name: "custom", rotate: 180}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-rotate-180"></i>)
    assert to_string(%Icon{name: "custom", rotate: 270}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-rotate-270"></i>)
    assert to_string(%Icon{name: "custom", rotate: nil}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "flip option adds 'fa-flip-horizontal' or 'fa-flip-vertical' classes" do
    assert to_string(%Icon{name: "custom", flip: :horizontal}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-flip-horizontal"></i>)
    assert to_string(%Icon{name: "custom", flip: "horizontal"}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-flip-horizontal"></i>)
    assert to_string(%Icon{name: "custom", flip: :vertical}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-flip-vertical"></i>)
    assert to_string(%Icon{name: "custom", flip: "vertical"}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-flip-vertical"></i>)
  end

  test "list option adds 'fa-li' class" do
    assert to_string(%Icon{name: "custom", list: true}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-li"></i>)
    assert to_string(%Icon{name: "custom", list: false}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "list option adds 'fa-border' class" do
    assert to_string(%Icon{name: "custom", border: true}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-border"></i>)
    assert to_string(%Icon{name: "custom", border: false}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "pull option adds 'fa-pull-left' or 'fa-pull-right' classes" do
    assert to_string(%Icon{name: "custom", pull: :left}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-pull-left"></i>)
    assert to_string(%Icon{name: "custom", pull: "left"}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-pull-left"></i>)
    assert to_string(%Icon{name: "custom", pull: :right}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-pull-right"></i>)
    assert to_string(%Icon{name: "custom", pull: "right"}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-pull-right"></i>)
    assert to_string(%Icon{name: "custom", pull: nil}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end

  test "animate option adds 'fa-spin' or 'fa-pulse' classes" do
    assert to_string(%Icon{name: "custom", animate: :spin}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-spin"></i>)
    assert to_string(%Icon{name: "custom", animate: "spin"}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-spin"></i>)
    assert to_string(%Icon{name: "custom", animate: :pulse}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-pulse"></i>)
    assert to_string(%Icon{name: "custom", animate: "pulse"}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom fa-pulse"></i>)
    assert to_string(%Icon{name: "custom", animate: nil}) ==
           ~s(<i aria-hidden="true" class="fa fa-custom"></i>)
  end
end
