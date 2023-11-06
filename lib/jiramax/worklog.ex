defmodule Jiramax.Worklog do
  @moduledoc """
  Provides struct and type for a Worklog
  """

  @type t :: %__MODULE__{
          author: map | nil,
          comment: map | nil,
          created: DateTime.t() | nil,
          id: String.t() | nil,
          issueId: String.t() | nil,
          properties: [Jiramax.EntityProperty.t()] | nil,
          self: String.t() | nil,
          started: DateTime.t() | nil,
          timeSpent: String.t() | nil,
          timeSpentSeconds: integer | nil,
          updateAuthor: map | nil,
          updated: DateTime.t() | nil,
          visibility: map | nil
        }

  defstruct [
    :author,
    :comment,
    :created,
    :id,
    :issueId,
    :properties,
    :self,
    :started,
    :timeSpent,
    :timeSpentSeconds,
    :updateAuthor,
    :updated,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: :map,
      comment: :map,
      created: {:string, :date_time},
      id: {:string, :generic},
      issueId: {:string, :generic},
      properties: [{Jiramax.EntityProperty, :t}],
      self: {:string, :uri},
      started: {:string, :date_time},
      timeSpent: {:string, :generic},
      timeSpentSeconds: :integer,
      updateAuthor: :map,
      updated: {:string, :date_time},
      visibility: :map
    ]
  end
end
