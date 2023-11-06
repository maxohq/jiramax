defmodule Jiramax.SanitizedJqlQuery do
  @moduledoc """
  Provides struct and type for a SanitizedJqlQuery
  """

  @type t :: %__MODULE__{
          accountId: String.t() | nil,
          errors: map | nil,
          initialQuery: String.t() | nil,
          sanitizedQuery: String.t() | nil
        }

  defstruct [:accountId, :errors, :initialQuery, :sanitizedQuery]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accountId: {:string, :generic},
      errors: :map,
      initialQuery: {:string, :generic},
      sanitizedQuery: {:string, :generic}
    ]
  end
end
