defmodule MyApp.ScopeFixtures do
  alias MyApp.Scope

  def session_scope_fixture(id \\ System.unique_integer()) do
    %Scope{id: id}
  end
end
