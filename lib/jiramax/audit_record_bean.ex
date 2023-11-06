defmodule Jiramax.AuditRecordBean do
  @moduledoc """
  Provides struct and type for a AuditRecordBean
  """

  @type t :: %__MODULE__{
          associatedItems: [Jiramax.AssociatedItemBean.t()] | nil,
          authorKey: String.t() | nil,
          category: String.t() | nil,
          changedValues: [Jiramax.ChangedValueBean.t()] | nil,
          created: DateTime.t() | nil,
          description: String.t() | nil,
          eventSource: String.t() | nil,
          id: integer | nil,
          objectItem: Jiramax.AssociatedItemBean.t() | nil,
          remoteAddress: String.t() | nil,
          summary: String.t() | nil
        }

  defstruct [
    :associatedItems,
    :authorKey,
    :category,
    :changedValues,
    :created,
    :description,
    :eventSource,
    :id,
    :objectItem,
    :remoteAddress,
    :summary
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      associatedItems: [{Jiramax.AssociatedItemBean, :t}],
      authorKey: {:string, :generic},
      category: {:string, :generic},
      changedValues: [{Jiramax.ChangedValueBean, :t}],
      created: {:string, :date_time},
      description: {:string, :generic},
      eventSource: {:string, :generic},
      id: :integer,
      objectItem: {Jiramax.AssociatedItemBean, :t},
      remoteAddress: {:string, :generic},
      summary: {:string, :generic}
    ]
  end
end
