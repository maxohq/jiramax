defmodule Jiramax.NotificationSchemeEvent do
  @moduledoc """
  Provides struct and type for a NotificationSchemeEvent
  """

  @type t :: %__MODULE__{
          event: Jiramax.NotificationEvent.t() | nil,
          notifications: [Jiramax.EventNotification.t()] | nil
        }

  defstruct [:event, :notifications]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: {Jiramax.NotificationEvent, :t}, notifications: [{Jiramax.EventNotification, :t}]]
  end
end
