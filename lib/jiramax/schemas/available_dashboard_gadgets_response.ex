defmodule Jiramax.AvailableDashboardGadgetsResponse do
  @moduledoc """
  Provides struct and type for a AvailableDashboardGadgetsResponse
  """

  @type t :: %__MODULE__{gadgets: [Jiramax.AvailableDashboardGadget.t()]}

  defstruct [:gadgets]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gadgets: [{Jiramax.AvailableDashboardGadget, :t}]]
  end
end
