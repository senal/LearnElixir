defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
     deck = Cards.create_deck
     refute deck == Cards.shuffle(deck)
  end

  test "save deck details on file system" do
    deck = Cards.create_deck
    assert Cards.save(deck, "my_deck") == :ok
  end

  test "read a saved deck from file system" do
    deck = Cards.create_deck
    Cards.save(deck, "my_deck")
    assert Cards.load("my_deck") == deck
  end
  
  test "create a hand for the given size" do
        assert Cards.create_hand(5) == length(5)
  end
end
