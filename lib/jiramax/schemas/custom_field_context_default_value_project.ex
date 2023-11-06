defmodule Jiramax.CustomFieldContextDefaultValueProject do
  @moduledoc """
  Provides struct and type for a CustomFieldContextDefaultValueProject
  """

  @type t :: %__MODULE__{contextId: String.t(), projectId: String.t(), type: String.t()}

  defstruct [:contextId, :projectId, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [contextId: {:string, :generic}, projectId: {:string, :generic}, type: {:string, :generic}]
  end
end
