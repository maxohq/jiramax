defmodule Jiramax.JiraExpressionForAnalysis do
  @moduledoc """
  Provides struct and type for a JiraExpressionForAnalysis
  """

  @type t :: %__MODULE__{contextVariables: map | nil, expressions: [String.t()]}

  defstruct [:contextVariables, :expressions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [contextVariables: :map, expressions: [string: :generic]]
  end
end
