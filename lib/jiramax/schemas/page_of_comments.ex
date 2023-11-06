defmodule Jiramax.PageOfComments do
  @moduledoc """
  Provides struct and type for a PageOfComments
  """

  @type t :: %__MODULE__{
          comments: [Jiramax.Comment.t()] | nil,
          maxResults: integer | nil,
          startAt: integer | nil,
          total: integer | nil
        }

  defstruct [:comments, :maxResults, :startAt, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [comments: [{Jiramax.Comment, :t}], maxResults: :integer, startAt: :integer, total: :integer]
  end
end
