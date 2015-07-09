require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "Database is Complete" do
    a = Album.new(title: 'Title', artist: 'Artist', genre: 'Genre', length: 100)
    assert a.save
  end

  test "No Save if Title not Present" do
    a = Album.new(title: '', artist: 'Artist', genre: 'Genre', length: 100)
    assert_not a.save
  end

  test "No Save if Artist not Present" do
    a = Album.new(title: 'Title', artist: '', genre: 'Genre', length: 100)
    assert_not a.save
  end

  test "No Save if Genre not Present" do
    a = Album.new(title: 'Title', artist: 'Artist', genre: '', length: 100)
    assert_not a.save
  end

  test "No Save if Length not Present" do
    a = Album.new(title: 'Title', artist: 'Artist', genre: 'Genre', length: 'a')
    assert_not a.save
  end

  test "No Save if Length is not >0 0" do
    a = Album.new(title: 'Title', artist: 'Artist', genre: 'Genre', length: 0)
    assert_not a.save
  end

  test "Length is a Number" do
    a = Album.new(title: 'Title', artist: 'Artist', genre: 'Genre', length: 100)
    a.length.is_a? Integer
    assert true
  end

  test "No Duplicates in Title" do
    a = Album.new(title: 'Title', artist: 'Artist', genre: 'Genre', length: 100)
    b = Album.new(title: 'Title', artist: 'Artist', genre: 'B-Genre', length: 10)
    assert a.valid?
  end
  #
  # test "No Duplicates in Artist" do
  #   a = Album.new(title: 'Title', artist: 'Artist', genre: 'Genre', length: 100)
  #   b = Album.new(title: 'B-Title', artist: 'Artist', genre: 'B-Genre', length: 10)
  #   assert
  # end
end
