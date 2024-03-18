defmodule Mix.Tasks.Hello do
  @moduledoc "The hello mix task: `mix help hello`"
  use Mix.Task

  @shortdoc "Simply calls the Hello.say/0 function"
  def run(_) do
    # This start the application
    Mix.Task.run("app.start")

    # calling the say function from the Hello module
    Hello.say()
  end
end
