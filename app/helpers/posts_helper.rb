module PostsHelper
  def display_author(post)
    "Posted by #{post.user.name}" if user_signed_in?
  end

  def display_edit_button(post)
    link_to 'Edit', edit_post_path(post), class: 'btn btn-primary' if user_signed_in? && post.user.id == current_user.id
  end

  def display_delete_button(post)
    return unless user_signed_in? && post.user.id == current_user.id

    link_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'
  end
end
