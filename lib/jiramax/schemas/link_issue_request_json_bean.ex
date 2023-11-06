defmodule Jiramax.LinkIssueRequestJsonBean do
  @moduledoc """
  Provides struct and type for a LinkIssueRequestJsonBean
  """

  @type t :: %__MODULE__{
          comment: Jiramax.Comment.t() | nil,
          inwardIssue: Jiramax.LinkedIssue.t(),
          outwardIssue: Jiramax.LinkedIssue.t(),
          type: Jiramax.IssueLinkType.t()
        }

  defstruct [:comment, :inwardIssue, :outwardIssue, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comment: {Jiramax.Comment, :t},
      inwardIssue: {Jiramax.LinkedIssue, :t},
      outwardIssue: {Jiramax.LinkedIssue, :t},
      type: {Jiramax.IssueLinkType, :t}
    ]
  end
end
