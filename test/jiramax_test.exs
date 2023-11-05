defmodule JiramaxTest do
  use ExUnit.Case
  doctest Jiramax

  test "greets the world" do
    assert Jiramax.hello() == :world
  end
end
