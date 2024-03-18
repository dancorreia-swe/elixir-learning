defmodule Erlang do
  @moduledoc """
  Module to use erlang libraries inside elixir
  """

  def timed(fun, args) do
    {time, result} = :timer.tc(fun, args)
    IO.puts("Time: #{time} microseconds")
    IO.puts("result: #{result}")
  end

  def add(a, b) do
    IO.puts(a + b)
  end

  def listen do
    receive do
      {:ok, "hello"} ->
        IO.puts(~c"world")
        # code
    end

    listen()
  end

  def explode, do: exit(:kaboom)

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Erlang, :explode, [])

    receive do
      {:EXIT, _from_pid, reason} ->
        IO.puts("Exit reason: #{reason}")
    end
  end

  def run_monitoring do
    spawn_monitor(Erlang, :explode, [])

    receive do
      {:DOWN, _ref, :process, _from_pid, reason} ->
        IO.puts("Exit reason: #{reason}")
    end
  end

  def double(x) do
    :timer.sleep(2000)
    x * 2
  end
end
