defmodule Jiramax.WorkflowStatusAndPort do
  @moduledoc """
  Provides struct and type for a WorkflowStatusAndPort
  """

  @type t :: %__MODULE__{port: integer | nil, statusReference: String.t() | nil}

  defstruct [:port, :statusReference]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [port: :integer, statusReference: {:string, :generic}]
  end
end
