defmodule Jiramax.CreatedIssues do
  @moduledoc """
  Provides struct and type for a CreatedIssues
  """

  @type t :: %__MODULE__{
          errors: [Jiramax.BulkOperationErrorResult.t()] | nil,
          issues: [Jiramax.CreatedIssue.t()] | nil
        }

  defstruct [:errors, :issues]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errors: [{Jiramax.BulkOperationErrorResult, :t}], issues: [{Jiramax.CreatedIssue, :t}]]
  end
end
