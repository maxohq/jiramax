defmodule Jiramax.PageOfWorklogs do
  @moduledoc """
  Provides struct and type for a PageOfWorklogs
  """

  @type t :: %__MODULE__{
          maxResults: integer | nil,
          startAt: integer | nil,
          total: integer | nil,
          worklogs: [Jiramax.Worklog.t()] | nil
        }

  defstruct [:maxResults, :startAt, :total, :worklogs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [maxResults: :integer, startAt: :integer, total: :integer, worklogs: [{Jiramax.Worklog, :t}]]
  end
end
