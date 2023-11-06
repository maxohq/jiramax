defmodule Jiramax.JqlpersonalDataMigrationRequest do
  @moduledoc """
  Provides struct and type for a JqlpersonalDataMigrationRequest
  """

  @type t :: %__MODULE__{queryStrings: [String.t()] | nil}

  defstruct [:queryStrings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [queryStrings: [string: :generic]]
  end
end
