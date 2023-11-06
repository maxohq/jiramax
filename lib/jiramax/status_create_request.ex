defmodule Jiramax.StatusCreateRequest do
  @moduledoc """
  Provides struct and type for a StatusCreateRequest
  """

  @type t :: %__MODULE__{scope: Jiramax.StatusScope.t(), statuses: [Jiramax.StatusCreate.t()]}

  defstruct [:scope, :statuses]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [scope: {Jiramax.StatusScope, :t}, statuses: [{Jiramax.StatusCreate, :t}]]
  end
end
