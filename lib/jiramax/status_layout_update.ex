defmodule Jiramax.StatusLayoutUpdate do
  @moduledoc """
  Provides struct and type for a StatusLayoutUpdate
  """

  @type t :: %__MODULE__{
          layout: Jiramax.WorkflowLayout.t() | nil,
          properties: map,
          statusReference: String.t()
        }

  defstruct [:layout, :properties, :statusReference]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [layout: {Jiramax.WorkflowLayout, :t}, properties: :map, statusReference: {:string, :generic}]
  end
end
