defmodule Jiramax.BulkOperationErrorResult do
  @moduledoc """
  Provides struct and type for a BulkOperationErrorResult
  """

  @type t :: %__MODULE__{
          elementErrors: Jiramax.ErrorCollection.t() | nil,
          failedElementNumber: integer | nil,
          status: integer | nil
        }

  defstruct [:elementErrors, :failedElementNumber, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      elementErrors: {Jiramax.ErrorCollection, :t},
      failedElementNumber: :integer,
      status: :integer
    ]
  end
end
