defmodule Evaluator do
  @type expr ::
          {:number, number()}
          | {:add, expr(), expr()}
          | {:mul, expr(), expr()}
          | {:div, expr(), expr()}
          | {:sub, expr(), expr()}
          | {:pow, expr(), expr()}

  @spec eval(expr) :: number()
  def eval({:number, n}) when is_number(n), do: n

  def eval({atom, x, y}) when is_tuple(x) and is_tuple(y) do
    case atom do
      :add -> eval(x) + eval(y)
      :mul -> eval(x) * eval(y)
      :div -> eval(x) / eval(y)
      :sub -> eval(x) - eval(y)
      :pow -> :math.pow(eval(x), eval(y))
    end
  end

  def eval(_n), do: raise ArgumentError
end
