defmodule Jiramax.Transitions do
  @moduledoc """
  Provides struct and type for a Transitions
  """

  @type t :: %__MODULE__{
          expand: String.t() | nil,
          transitions: [Jiramax.IssueTransition.t()] | nil
        }

  defstruct [:expand, :transitions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expand: {:string, :generic}, transitions: [{Jiramax.IssueTransition, :t}]]
  end
end
