defmodule Jiramax.AddSecuritySchemeLevelsRequestBean do
  @moduledoc """
  Provides struct and type for a AddSecuritySchemeLevelsRequestBean
  """

  @type t :: %__MODULE__{levels: [Jiramax.SecuritySchemeLevelBean.t()] | nil}

  defstruct [:levels]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [levels: [{Jiramax.SecuritySchemeLevelBean, :t}]]
  end
end
