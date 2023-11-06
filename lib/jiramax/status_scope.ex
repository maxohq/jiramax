defmodule Jiramax.StatusScope do
  @moduledoc """
  Provides struct and type for a StatusScope
  """

  @type t :: %__MODULE__{project: Jiramax.ProjectId.t() | nil, type: String.t()}

  defstruct [:project, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [project: {Jiramax.ProjectId, :t}, type: {:enum, ["PROJECT", "GLOBAL"]}]
  end
end
