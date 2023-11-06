defmodule Jiramax.PageOfStatuses do
  @moduledoc """
  Provides struct and type for a PageOfStatuses
  """

  @type t :: %__MODULE__{
          isLast: boolean | nil,
          maxResults: integer | nil,
          nextPage: String.t() | nil,
          self: String.t() | nil,
          startAt: integer | nil,
          total: integer | nil,
          values: [Jiramax.JiraStatus.t()] | nil
        }

  defstruct [:isLast, :maxResults, :nextPage, :self, :startAt, :total, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      isLast: :boolean,
      maxResults: :integer,
      nextPage: {:string, :generic},
      self: {:string, :generic},
      startAt: :integer,
      total: :integer,
      values: [{Jiramax.JiraStatus, :t}]
    ]
  end
end
