defmodule EvaluatorTest do
  use ExUnit.Case, async: true

  describe "eval/1" do
    test "returns number with correct args" do
      assert Evaluator.eval({:number, 10}) == 10
    end

    test "raises an error when invalid there is invalid arg on number" do
      assert_raise ArgumentError, fn -> Evaluator.eval({:number, :number}) end
    end

    test "returns ok when add numbers" do
      assert Evaluator.eval({:add, {:number, 1}, {:number, 2}}) == 3
    end

    test "returns ok when add negative numbers" do
      assert Evaluator.eval({:add, {:number, -1}, {:number, -2}}) == -3
    end

    test "raises an error when add has invalid args" do
      assert_raise ArgumentError, fn -> Evaluator.eval({:add, {:add, 1}, {:number, -2}}) end
    end

    test "raises an error when invalid args" do
      assert_raise ArgumentError, fn -> Evaluator.eval({:add, 1, 2}) end
    end

    test "returns ok when multiply" do
      assert Evaluator.eval({:mul, {:number, 3}, {:number, 4}}) == 12
    end

    test "returns ok when divide numbers" do
      assert Evaluator.eval({:div, {:number, 30}, {:number, 6}}) == 5
    end

    test "raise error ArithmeticError when divide number by 0" do
      assert_raise ArithmeticError, fn -> Evaluator.eval({:div, {:number, 1}, {:number, 0}}) end
    end

    test "test when subtract numbers" do
      assert Evaluator.eval({:sub, {:number, 7}, {:number, 8}}) == -1
    end

    test "test when subtract negative numbers" do
      assert Evaluator.eval({:sub, {:number, -7}, {:number, -7}}) == 0
    end

    test "rise error when subtract with invalid args" do
      assert_raise ArgumentError, fn -> Evaluator.eval({:sub, {:number, -7}, {:div, -7}}) end
    end

    test "returns ok when power numbers" do
      assert Evaluator.eval({:pow, {:number, 9}, {:number, 2}}) == 81
    end

    test "test when power numbers negative" do
      assert Evaluator.eval({:pow, {:number, -9}, {:number, -2}}) == 1/81
    end

    test "rise error when power numbers with invalid args" do
      assert_raise ArithmeticError, fn ->  Evaluator.eval({:pow, {:number, -9}, {:number, 1.0e45}}) end
    end
  end
end
