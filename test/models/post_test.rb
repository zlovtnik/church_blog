require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(
      title: "Test Post",
      body: "This is a test post body that should be long enough to pass validation.",
      status: "draft"
    )
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = ""
    assert_not @post.valid?
    assert_includes @post.errors[:title], "can't be blank"
  end

  test "title should not be too short" do
    @post.title = "ab"
    assert_not @post.valid?
    assert_includes @post.errors[:title], "is too short (minimum is 3 characters)"
  end

  test "title should not be too long" do
    @post.title = "a" * 101
    assert_not @post.valid?
    assert_includes @post.errors[:title], "is too long (maximum is 100 characters)"
  end

  test "body should be present" do
    @post.body = ""
    assert_not @post.valid?
    assert_includes @post.errors[:body], "can't be blank"
  end

  test "body should not be too short" do
    @post.body = "ab"
    assert_not @post.valid?
    assert_includes @post.errors[:body], "is too short (minimum is 10 characters)"
  end

  test "status should be present" do
    @post.status = nil
    assert_not @post.valid?
    assert_includes @post.errors[:status], "can't be blank"
  end

  test "status should be either draft or published" do
    @post.status = "invalid"
    assert_not @post.valid?
    assert_includes @post.errors[:status], "is not included in the list"
  end

  test "word count should work correctly" do
    assert_equal 9, @post.word_count
    @post.body = "One two three"
    assert_equal 3, @post.word_count
  end

  test "default scope should order by created_at descending" do
    older_post = Post.create!(
      title: "Older Post",
      body: "This is an older post.",
      status: "published"
    )
    newer_post = Post.create!(
      title: "Newer Post",
      body: "This is a newer post.",
      status: "published"
    )
    assert_equal newer_post, Post.first
  end

  test "draft? method should work correctly" do
    draft_post = Post.new(status: "draft")
    published_post = Post.new(status: "published")
    assert draft_post.draft?
    assert_not published_post.draft?
  end

  test "published? method should work correctly" do
    draft_post = Post.new(status: "draft")
    published_post = Post.new(status: "published")
    assert published_post.published?
    assert_not draft_post.published?
  end
end
