defmodule Jiramax.ContainerForWebhookIds do
  @moduledoc """
  Provides struct and type for a ContainerForWebhookIds
  """

  @type t :: %__MODULE__{webhookIds: [integer]}

  defstruct [:webhookIds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [webhookIds: [:integer]]
  end
end
