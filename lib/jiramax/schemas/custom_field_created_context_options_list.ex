defmodule Jiramax.CustomFieldCreatedContextOptionsList do
  @moduledoc """
  Provides struct and type for a CustomFieldCreatedContextOptionsList
  """

  @type t :: %__MODULE__{options: [Jiramax.CustomFieldContextOption.t()] | nil}

  defstruct [:options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [options: [{Jiramax.CustomFieldContextOption, :t}]]
  end
end
