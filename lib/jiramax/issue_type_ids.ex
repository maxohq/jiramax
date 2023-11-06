defmodule Jiramax.IssueTypeIds do
  @moduledoc """
  Provides struct and type for a IssueTypeIds
  """

  @type t :: %__MODULE__{issueTypeIds: [String.t()]}

  defstruct [:issueTypeIds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issueTypeIds: [string: :generic]]
  end
end
