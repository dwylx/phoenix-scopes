defmodule MyApp.Scope do
  defstruct id: nil

  def for_id(id) do
    %MyApp.Scope{id: id}
  end
end
