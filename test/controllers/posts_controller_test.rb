require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { content: "This is a valid post content for testing.", published: @post.published, published_at: @post.published_at, title: "Test Post Title", status: "draft", body: "This is a valid body for testing." } }
    end
    assert_response :redirect
    created_id = @response.redirect_url.split('/').last
    created_post = Post.find(created_id)
    assert_redirected_to post_url(created_post)
    assert_equal "Test Post Title", created_post.title
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { content: "This is a valid post content for testing.", published: @post.published, published_at: @post.published_at, title: @post.title, status: "draft", body: "This is a valid body for testing." } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
