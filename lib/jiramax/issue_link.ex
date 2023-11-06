defmodule Jiramax.IssueLink do
  @moduledoc """
  Provides struct and type for a IssueLink
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          inwardIssue: map,
          outwardIssue: map,
          self: String.t() | nil,
          type: map
        }

  defstruct [:id, :inwardIssue, :outwardIssue, :self, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      inwardIssue: :map,
      outwardIssue: :map,
      self: {:string, :uri},
      type: :map
    ]
  end
end
