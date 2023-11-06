defmodule Jiramax.StatusUpdateRequest do
  @moduledoc """
  Provides struct and type for a StatusUpdateRequest
  """

  @type t :: %__MODULE__{statuses: [Jiramax.StatusUpdate.t()] | nil}

  defstruct [:statuses]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [statuses: [{Jiramax.StatusUpdate, :t}]]
  end
end
