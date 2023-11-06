defmodule Jiramax.Changelog do
  @moduledoc """
  Provides struct and type for a Changelog
  """

  @type t :: %__MODULE__{
          author: map | nil,
          created: DateTime.t() | nil,
          historyMetadata: map | nil,
          id: String.t() | nil,
          items: [Jiramax.ChangeDetails.t()] | nil
        }

  defstruct [:author, :created, :historyMetadata, :id, :items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: :map,
      created: {:string, :date_time},
      historyMetadata: :map,
      id: {:string, :generic},
      items: [{Jiramax.ChangeDetails, :t}]
    ]
  end
end
