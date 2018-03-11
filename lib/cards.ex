defmodule Cards do

  @moduledoc """
    Provides methods for creating and handling deck of cards
  """

  @doc """
    Returns a list of 52 strings representing a deck of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  @doc """
    Returns a tuple of hand and remaining deck
  """
  def deal(deck, size) do
    Enum.split(deck, size)
  end

  @doc """
    Prints deck to console
  """
  def print(deck) do
    Enum.each(deck, &IO.puts/1)
  end

  @doc """
    Returns a shuffled deck
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Returns if a card exists in the deck
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Saves deck to local file system
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end


  @doc """
    Load deck from local file system
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary } -> :erlang.binary_to_term(binary)
      {:error, _reason } -> "File does not exist"
    end
  end


  @doc """
    Returns a hand and remaining deck that has been shuffled
  """
  def new(size) do
    create_deck()
    |> shuffle()
    |> deal(size)
  end

end
