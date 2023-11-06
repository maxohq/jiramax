defmodule Jiramax.BulkCustomFieldOptionUpdateRequest do
  @moduledoc """
  Provides struct and type for a BulkCustomFieldOptionUpdateRequest
  """

  @type t :: %__MODULE__{options: [Jiramax.CustomFieldOptionUpdate.t()] | nil}

  defstruct [:options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [options: [{Jiramax.CustomFieldOptionUpdate, :t}]]
  end
end
