defmodule Jiramax.JiraExpressionEvalRequestBean do
  @moduledoc """
  Provides struct and type for a JiraExpressionEvalRequestBean
  """

  @type t :: %__MODULE__{context: map | nil, expression: String.t()}

  defstruct [:context, :expression]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [context: :map, expression: {:string, :generic}]
  end
end
