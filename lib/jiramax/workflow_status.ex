defmodule Jiramax.WorkflowStatus do
  @moduledoc """
  Provides struct and type for a WorkflowStatus
  """

  @type t :: %__MODULE__{id: String.t(), name: String.t(), properties: map | nil}

  defstruct [:id, :name, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, name: {:string, :generic}, properties: :map]
  end
end
