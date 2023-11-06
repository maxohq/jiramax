defmodule Jiramax.MultipleCustomFieldValuesUpdateDetails do
  @moduledoc """
  Provides struct and type for a MultipleCustomFieldValuesUpdateDetails
  """

  @type t :: %__MODULE__{updates: [Jiramax.MultipleCustomFieldValuesUpdate.t()] | nil}

  defstruct [:updates]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [updates: [{Jiramax.MultipleCustomFieldValuesUpdate, :t}]]
  end
end
