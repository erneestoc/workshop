defmodule Chat.RoomTest do
  use ExUnit.Case
  use TrueStory
  alias Chat.Room

  story "new room", c
    |> new_room(:room1, members: ["jose"], messages: ["Hello"]),
  verify do
    assert %Room{} = c.room
  end

  story "add member", c
    |> new_room(:room1)
    |> add_member(:room1, "Jose"),
  verify do
    assert "Jose" in c.room.members
  end

  story "add message", c
    |> new_room(:room1)
    |> add_message(:room2, "Hello Joe!"),
  verify do
    assert "Hello Joe!" in c.room.messages
  end

  story "add members to multiple rooms", c
    |> new_room(:room1)
    |> new_room(:room2)
    |> add_member(:room1, "Jose")
    |> add_member(:room2, "James"),
  verify do
    assert c.room1.members == ["Jose"]
    assert c.room2.members == ["James"]
  end
end
